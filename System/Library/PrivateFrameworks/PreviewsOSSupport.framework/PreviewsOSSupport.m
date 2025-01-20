id UVShellConnectionInterface(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v1 = [MEMORY[0x263F2B9B0] interfaceWithIdentifier:a1];
  v2 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26E6997E8];
  [v1 setServer:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26E6997E8];
  [v1 setClient:v3];

  return v1;
}

uint64_t ClientRole.handleActivation(_:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  v6 = (void *)((char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v7 = objc_msgSend(a1, sel_remoteToken);
  uint64_t v8 = *(int *)(v4 + 56);
  v9 = (char *)v6 + v8;
  v10 = (char *)v1 + v8;
  void *v6 = *v1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
  if (v7)
  {
    v14[1] = v7;
    sub_232E03E14(&qword_26874F528, &qword_26874F518);
    sub_232E32F08();
  }
  else
  {
    sub_232E00CBC();
    id v7 = (id)swift_allocError();
    sub_232E03E14(&qword_26874F528, &qword_26874F518);
    sub_232E32EF8();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v9, v11);
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

unint64_t sub_232E00CBC()
{
  unint64_t result = qword_26874F520;
  if (!qword_26874F520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874F520);
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

Swift::Void __swiftcall ClientRole.handleInvalidation()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  uint64_t v1 = MEMORY[0x270FA5388]();
  uint64_t v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = *(int *)(v1 + 56);
  uint64_t v5 = (char *)v3 + v4;
  v6 = (char *)v0 + v4;
  *uint64_t v3 = *v0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  sub_232E03E14(&qword_26874F528, &qword_26874F518);
  sub_232E32EE8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
}

uint64_t sub_232E00ED4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  uint64_t v1 = MEMORY[0x270FA5388]();
  uint64_t v3 = (uint64_t *)((char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = *(int *)(v1 + 56);
  uint64_t v5 = (char *)v3 + v4;
  v6 = (char *)v0 + v4;
  *uint64_t v3 = *v0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  sub_232E03E14(&qword_26874F528, &qword_26874F518);
  sub_232E32EE8();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v5, v7);
}

uint64_t ServerRole.clientContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_232E32E88();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

id ServerRole.clientAuditToken.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for ServerRole(0) + 20));

  return v1;
}

uint64_t ShellConnection<>.serverAuditToken.getter()
{
  v1[3] = v0;
  v1[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  v1[5] = swift_task_alloc();
  type metadata accessor for ClientRole(0);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_232E011B0, 0, 0);
}

uint64_t sub_232E011B0()
{
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v1 = *(uint64_t **)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  sub_232E03D2C(*(void *)(v0 + 24) + *(void *)(**(void **)(v0 + 24) + 136), (uint64_t)v1, type metadata accessor for ClientRole);
  uint64_t v4 = *(int *)(v3 + 48);
  *(_DWORD *)(v0 + 96) = v4;
  uint64_t v5 = (char *)v1 + v4;
  v6 = (char *)v2 + v4;
  uint64_t v7 = *v1;
  *(void *)(v0 + 56) = v7;
  *uint64_t v2 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  *(void *)(v0 + 64) = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)(v0 + 72) = v9;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v5, v8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v10;
  uint64_t v11 = sub_232E02DFC(0, &qword_26874F538);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F540);
  void *v10 = v0;
  v10[1] = sub_232E0134C;
  uint64_t v13 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v0 + 16, v7, v11, v12, v13);
}

uint64_t sub_232E0134C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    uint64_t v2 = sub_232E01518;
  }
  else {
    uint64_t v2 = sub_232E0147C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_232E0147C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 40) + *(int *)(v0 + 96), *(void *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_232E01518()
{
  (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 40) + *(int *)(v0 + 96), *(void *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t static ShellConnection<>.createByMachLookup(for:variant:clientContext:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_232E029D0(a1, a2, a3);
}

uint64_t static ShellConnection<>.createByEndpoint(_:for:clientContext:)(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_232E026D8(a1, a2, a3);
}

void sub_232E015D4(void *a1)
{
  uint64_t v2 = (void *)sub_232E32DD8();
  id v3 = (id)sub_232E33358();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);
}

uint64_t sub_232E0165C(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

unint64_t sub_232E016B0()
{
  return 0xD000000000000022;
}

uint64_t sub_232E017BC()
{
  sub_232E03EB8(0, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);
  ShellService.Domain.machName(for:)(v0 + *(int *)(v1 + 20));
  sub_232E333A8();
  swift_bridgeObjectRelease();
  return 0x6D616E206863614DLL;
}

uint64_t sub_232E01880()
{
  return 0;
}

uint64_t sub_232E018B0(uint64_t a1)
{
  uint64_t v2 = sub_232E03F18(&qword_26874F888, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_232E01930(uint64_t a1)
{
  uint64_t v2 = sub_232E03F18(&qword_26874F888, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);

  return MEMORY[0x270F55A08](a1, v2);
}

unint64_t sub_232E019A4()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_232E01A28()
{
  id v1 = *(id *)(v0 + 8);
  id v2 = objc_msgSend(v1, sel_description);
  sub_232E33368();

  sub_232E333A8();
  swift_bridgeObjectRelease();
  return 0x746E696F70646E45;
}

uint64_t sub_232E01AD0(uint64_t a1)
{
  uint64_t v2 = sub_232E03F18((unint64_t *)&unk_26874F890, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_232E01B44(uint64_t a1)
{
  uint64_t v2 = sub_232E03F18((unint64_t *)&unk_26874F890, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);

  return MEMORY[0x270F55A08](a1, v2);
}

void *ShellConnection<>.init(connection:context:service:)(void *a1, void *a2, unsigned __int8 *a3)
{
  v29 = a1;
  uint64_t v30 = type metadata accessor for ServerRole(0);
  MEMORY[0x270FA5388]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_232E32C28();
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874F548);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_232E32E88();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v31 = *a3;
  sub_232E02DFC(0, &qword_26874F550);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = (void *)sub_232E33358();
  v32 = a2;
  id v18 = objc_msgSend(a2, sel_decodeObjectOfClass_forKey_, ObjCClassFromMetadata, v17);

  if (v18)
  {
    sub_232E33588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v34, 0, sizeof(v34));
  }
  uint64_t v19 = v30;
  sub_232E02E38((uint64_t)v34, (uint64_t)v35);
  if (!v36)
  {
    sub_232E02EA0((uint64_t)v35, (uint64_t *)&unk_268750230);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    v25 = v29;
    id v20 = 0;
    goto LABEL_11;
  }
  id v20 = v33;
  if (!v33)
  {
    v25 = v29;
LABEL_11:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
    sub_232E02EA0((uint64_t)v11, &qword_26874F548);
    goto LABEL_12;
  }
  id v21 = v33;
  sub_232E33538();

  sub_232E32C08();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  v25 = v29;
LABEL_12:
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v6, v15, v12);
  id v22 = v25;
  *(void *)&v6[*(int *)(v19 + 20)] = objc_msgSend(v22, sel_remoteToken);
  swift_allocObject();
  v23 = sub_232E02EFC(v22, v31, (uint64_t)v6);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return v23;
}

id ShellConnection<>.clientAuditToken.getter()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 136);
  uint64_t v2 = *(void **)(v1 + *(int *)(type metadata accessor for ServerRole(0) + 20));

  return v2;
}

uint64_t ShellConnection<>.clientContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 136);
  uint64_t v4 = sub_232E32E88();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_232E020E8(uint64_t a1, id *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510) - 8;
  MEMORY[0x270FA5388]();
  uint64_t v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(a2[4], sel_invalidate);
  v6 = (id *)((char *)a2 + *((void *)*a2 + 17));
  uint64_t v7 = *(int *)(v3 + 56);
  uint64_t v8 = (char *)v5 + v7;
  uint64_t v9 = (char *)v6 + v7;
  *uint64_t v5 = *v6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  sub_232E03E14(&qword_26874F528, &qword_26874F518);
  sub_232E32EE8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874F6B0);
  sub_232E03E14(qword_26874FF80, &qword_26874F6B0);
  return sub_232E32EE8();
}

uint64_t sub_232E022E8(uint64_t a1, uint64_t a2)
{
  return sub_232E32EE8();
}

uint64_t _s17PreviewsOSSupport10ClientRoleV11descriptionSSvgZ_0()
{
  return 0x746E65696C63;
}

uint64_t type metadata accessor for ServerRole(uint64_t a1)
{
  return sub_232E02408(a1, qword_26874F570);
}

uint64_t _s17PreviewsOSSupport10ServerRoleV11descriptionSSvgZ_0()
{
  return 0x726576726573;
}

uint64_t type metadata accessor for ClientRole(uint64_t a1)
{
  return sub_232E02408(a1, (uint64_t *)&unk_26874F558);
}

uint64_t sub_232E02408(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_232E02440(void *a1, int a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int v16 = a2;
  uint64_t v17 = *v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F6B0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E33158();
  swift_allocObject();
  v3[2] = sub_232E33148();
  uint64_t v11 = (char *)v3 + qword_26874FE50;
  uint64_t v12 = sub_232E334B8();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  v4[4] = a1;
  v4[5] = v12;
  *((unsigned char *)v4 + 24) = v16;
  sub_232E03D2C(a3, (uint64_t)v4 + *(void *)(*v4 + 136), type metadata accessor for ClientRole);
  id v18 = v4;
  sub_232E03E14(&qword_268750270, (uint64_t *)&unk_26874F740);
  id v13 = a1;
  swift_retain();
  sub_232E330D8();
  swift_release();
  sub_232E03E58(a3, type metadata accessor for ClientRole);
  return v4;
}

uint64_t sub_232E026D8(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  type metadata accessor for ClientRole(0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (uint64_t *)&v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (void *)*a2;
  uint64_t v18 = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_232E03D9C;
  *(void *)(v9 + 24) = v17;
  aBlock[4] = sub_232E03DB4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232E0165C;
  aBlock[3] = &block_descriptor;
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = self;
  swift_retain();
  id v12 = objc_msgSend(v11, sel_connectionWithEndpoint_clientContextBuilder_, a1, v10);
  _Block_release(v10);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v10)
  {
    __break(1u);
  }
  else
  {
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
      sub_232E02DFC(0, &qword_26874F538);
      id v14 = v12;
      *uint64_t v7 = sub_232E334B8();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874F740);
      swift_allocObject();
      uint64_t v8 = sub_232E02440(v14, (int)v8, (uint64_t)v7);
    }
    else
    {
      sub_232E03EB8(0, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);
      sub_232E03F18(&qword_26874F738, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);
      swift_allocError();
      *(unsigned char *)uint64_t v15 = (_BYTE)v8;
      *(void *)(v15 + 8) = a1;
      id v16 = a1;
      swift_willThrow();
    }
    return (uint64_t)v8;
  }
  return result;
}

uint64_t sub_232E029D0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a3;
  uint64_t v25 = *(void *)(sub_232E32AB8() - 8);
  uint64_t v5 = MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v8 = *a1;
  uint64_t v26 = v5;
  uint64_t v24 = a2;
  if (v8 <= 9)
  {
    char v9 = 1;
    if (((1 << v8) & 0x3CC) != 0)
    {
      char v10 = 0;
      goto LABEL_4;
    }
    if (v8 == 4)
    {
LABEL_8:
      char v29 = v9;
      ShellService.Domain.machName(for:)(a2);
LABEL_9:
      char v11 = 1;
      goto LABEL_12;
    }
    if (v8 == 5)
    {
      char v9 = 2;
      goto LABEL_8;
    }
  }
  char v10 = 3;
LABEL_4:
  char v29 = v10;
  ShellService.Domain.machName(for:)(a2);
  char v11 = 1;
  switch(v8)
  {
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      break;
    case 4u:
    case 5u:
      goto LABEL_9;
    default:
      char v11 = 0;
      break;
  }
LABEL_12:
  id v12 = (void *)sub_232E33358();
  swift_bridgeObjectRelease();
  id v13 = (void *)sub_232E33358();
  swift_bridgeObjectRelease();
  if (v11)
  {
    id v14 = 0;
  }
  else
  {
    id v14 = (void *)sub_232E33358();
    swift_bridgeObjectRelease();
  }
  id v15 = objc_msgSend(self, sel_endpointForMachName_service_instance_, v12, v13, v14);

  if (v15)
  {
    unsigned __int8 v28 = v8;
    id v16 = v15;
    uint64_t v17 = sub_232E026D8(v16, &v28, v27);
  }
  else
  {
    uint64_t v18 = v25;
    uint64_t v17 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v7, v24, v26);
    sub_232E03EB8(0, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);
    uint64_t v20 = v19;
    sub_232E03F18(qword_26874F758, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);
    swift_allocError();
    *id v21 = v8;
    (*(void (**)(unsigned char *, char *, uint64_t))(v18 + 32))(&v21[*(int *)(v20 + 20)], v7, v17);
    swift_willThrow();
  }
  return v17;
}

uint64_t sub_232E02DFC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_232E02E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268750230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_232E02EA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_232E02EFC(void *a1, int a2, uint64_t a3)
{
  uint64_t v4 = v3;
  int v16 = a2;
  uint64_t v17 = *v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F6B0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  char v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E33158();
  swift_allocObject();
  v3[2] = sub_232E33148();
  char v11 = (char *)v3 + qword_26874FE50;
  uint64_t v12 = sub_232E334B8();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  v4[4] = a1;
  v4[5] = v12;
  *((unsigned char *)v4 + 24) = v16;
  sub_232E03D2C(a3, (uint64_t)v4 + *(void *)(*v4 + 136), type metadata accessor for ServerRole);
  uint64_t v18 = v4;
  sub_232E03E14(&qword_26874F6B8, (uint64_t *)&unk_26874F6C0);
  id v13 = a1;
  swift_retain();
  sub_232E330D8();
  swift_release();
  sub_232E03E58(a3, type metadata accessor for ServerRole);
  return v4;
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientRole(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  uint64_t v6 = *a2;
  *a1 = *a2;
  if ((v5 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(int *)(v4 + 48);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    swift_retain();
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t destroy for ClientRole(uint64_t a1)
{
  swift_release();
  uint64_t v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26874F510) + 48);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

void *initializeWithCopy for ClientRole(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26874F510) + 48);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *assignWithCopy for ClientRole(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26874F510) + 48);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *initializeWithTake for ClientRole(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26874F510) + 48);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for ClientRole(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26874F510) + 48);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F518);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_232E03568);
}

uint64_t sub_232E03568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ClientRole(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_232E035EC);
}

uint64_t sub_232E035EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F510);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_232E03660()
{
  sub_232E03710();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v2 = &v1;
    swift_initStructMetadata();
  }
}

void sub_232E03710()
{
  if (!qword_26874F568)
  {
    sub_232E02DFC(255, &qword_26874F538);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26874F540);
    unint64_t v0 = sub_232E334C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26874F568);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ServerRole(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_232E32E88();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for ServerRole(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_232E32E88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_232E03AF4);
}

uint64_t sub_232E03AF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32E88();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_232E03BC8);
}

uint64_t sub_232E03BC8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_232E32E88();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_232E03C84()
{
  uint64_t result = sub_232E32E88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientRole.NoRemoteTokenAfterActivation()
{
  return &type metadata for ClientRole.NoRemoteTokenAfterActivation;
}

uint64_t sub_232E03D2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_232E03D94(uint64_t a1)
{
  return sub_232E022E8(a1, v1);
}

void sub_232E03D9C(void *a1)
{
}

uint64_t sub_232E03DA4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E03DB4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t _s25EndpointConnectionFailureVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_232E03E0C(uint64_t a1)
{
  return sub_232E020E8(a1, v1);
}

uint64_t sub_232E03E14(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_232E03E58(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_232E03EB8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void))
{
  if (!*a2)
  {
    unint64_t v4 = a3(0);
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t _s17MachLookupFailureVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_232E03F18(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_232E03EB8(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_232E03F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 8);
}

uint64_t sub_232E03F64()
{
  uint64_t result = sub_232E32AB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_232E03FFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_232E32AB8();
    (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_232E040C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_232E32AB8();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

unsigned char *sub_232E04130(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_232E32AB8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

unsigned char *sub_232E041AC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_232E32AB8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

unsigned char *sub_232E04228(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_232E32AB8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

unsigned char *sub_232E042A4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_232E32AB8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_232E04320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_232E04334);
}

uint64_t sub_232E04334(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 246)
  {
    if (*a1 <= 9u) {
      int v4 = 9;
    }
    else {
      int v4 = *a1;
    }
    unsigned int v5 = v4 - 9;
    if (*a1 >= 2u) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v9 = sub_232E32AB8();
    unint64_t v10 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = &a1[*(int *)(a3 + 20)];
    return v10(v12, a2, v11);
  }
}

uint64_t sub_232E043E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_232E043FC);
}

unsigned char *sub_232E043FC(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v5 = result;
  if (a3 == 246)
  {
    *uint64_t result = a2 + 9;
  }
  else
  {
    uint64_t v7 = sub_232E32AB8();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    unint64_t v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_232E044A0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

void sub_232E044D8(uint64_t a1)
{
}

uint64_t sub_232E044E0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  id v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_232E0452C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t sub_232E04568(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_232E045B0(uint64_t result, int a2, int a3)
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

uint64_t sub_232E045EC()
{
  return sub_232E03F18(&qword_26874F738, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);
}

uint64_t sub_232E0463C()
{
  return sub_232E03F18(&qword_26874F860, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);
}

uint64_t sub_232E0468C()
{
  return sub_232E03F18(&qword_26874F868, &qword_26874F730, (uint64_t (*)(void))_s25EndpointConnectionFailureVMa);
}

uint64_t sub_232E046DC()
{
  return sub_232E03F18(qword_26874F758, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);
}

uint64_t sub_232E0472C()
{
  return sub_232E03F18(&qword_26874F870, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);
}

uint64_t sub_232E0477C()
{
  return sub_232E03F18(&qword_26874F878, &qword_26874F750, (uint64_t (*)(void))_s17MachLookupFailureVMa);
}

unint64_t sub_232E047CC()
{
  unint64_t result = qword_26874F880;
  if (!qword_26874F880)
  {
    sub_232E32AB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874F880);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

BOOL sub_232E04858(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_232E04870()
{
  return sub_232E33768();
}

uint64_t sub_232E048B8()
{
  return sub_232E33748();
}

uint64_t sub_232E048E4()
{
  return sub_232E33768();
}

uint64_t sub_232E04928()
{
  return sub_232E33768();
}

uint64_t sub_232E04988()
{
  return sub_232E33748();
}

uint64_t sub_232E049C8()
{
  return sub_232E33768();
}

uint64_t sub_232E04A24(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == *(_DWORD *)a2) {
    return (*(unsigned __int8 *)(a2 + 4) ^ *(unsigned __int8 *)(a1 + 4) ^ 1) & 1;
  }
  else {
    return 0;
  }
}

unint64_t sub_232E04A54(char a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1 & 1;
  uint64_t v6 = *v2;
  if (!*(void *)(v6 + 16)
    || (uint64_t v7 = a2 | (unint64_t)(v5 << 32), result = sub_232E323D4(v7), (v9 & 1) == 0))
  {
    int v16 = (void *)sub_232E33358();
    uint64_t v17 = (void *)sub_232E33358();
    id v18 = objc_msgSend(self, sel_attributeWithDomain_name_, v16, v17);

    id v19 = objc_msgSend(self, sel_targetWithPid_, a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26874F920);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_232E34510;
    *(void *)(v20 + 32) = v18;
    sub_232E333D8();
    id v21 = objc_allocWithZone(MEMORY[0x263F64408]);
    id v22 = v18;
    uint64_t v23 = (void *)sub_232E33358();
    swift_bridgeObjectRelease();
    sub_232E05B10();
    uint64_t v24 = (void *)sub_232E333C8();
    swift_bridgeObjectRelease();
    id v25 = objc_msgSend(v21, sel_initWithExplanation_target_attributes_, v23, v19, v24);

    id v15 = v25;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_232E2F0A4((uint64_t)v15, 1, a2 | (unint64_t)(v5 << 32), isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v28;

    swift_bridgeObjectRelease();
    return (unint64_t)v15;
  }
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v11 = *(void *)(v10 + 16 * result + 8);
  uint64_t v12 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    id v13 = *(id *)(v10 + 16 * result);
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v27 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_232E2F0A4((uint64_t)v13, v12, v7, v14);
    *uint64_t v3 = v27;

    swift_bridgeObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

id sub_232E04D74(char a1, unsigned int a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  if (!*(void *)(v4 + 16)) {
    return 0;
  }
  unint64_t v5 = a2 | ((unint64_t)(a1 & 1) << 32);
  unint64_t v6 = sub_232E323D4(v5);
  if ((v7 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(v4 + 56) + 16 * v6;
  uint64_t v10 = *(void **)v8;
  uint64_t v9 = *(void *)(v8 + 8);
  if (v9 >= 2)
  {
    uint64_t v11 = v9 - 1;
    id v12 = v10;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_232E2F0A4((uint64_t)v12, v11, v5, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v22;

    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v16 = sub_232E323D4(v5);
  char v18 = v17;
  id v14 = v10;
  if (v18)
  {
    char v19 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v3;
    uint64_t v23 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((v19 & 1) == 0)
    {
      sub_232E2F900();
      uint64_t v20 = v23;
    }
    id v21 = *(void **)(*(void *)(v20 + 56) + 16 * v16);
    sub_232E2E6EC(v16, v20);
    *uint64_t v3 = v20;

    swift_bridgeObjectRelease();
  }
  return v14;
}

unint64_t sub_232E04EC0(unint64_t result, char a2, unsigned int a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *v3;
  if (*(void *)(v5 + 16))
  {
    unint64_t v6 = result;
    unint64_t v7 = a3 | ((unint64_t)(a2 & 1) << 32);
    unint64_t result = sub_232E323D4(v7);
    if ((v8 & 1) != 0 && *(void *)(*(void *)(v5 + 56) + 16 * result) == v6)
    {
      unint64_t result = sub_232E323D4(v7);
      if (v9)
      {
        unint64_t v10 = result;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v12 = *v4;
        uint64_t v14 = *v4;
        *uint64_t v4 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_232E2F900();
          uint64_t v12 = v14;
        }
        id v13 = *(void **)(*(void *)(v12 + 56) + 16 * v10);
        sub_232E2E6EC(v10, v12);
        *uint64_t v4 = v12;

        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_232E04F98()
{
  type metadata accessor for PreviewAssertionManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_232E332A8();
  *(void *)(v0 + 16) = result;
  qword_26874F900 = v0;
  return result;
}

uint64_t static PreviewAssertionManager.shared.getter()
{
  if (qword_26874F4E0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t PreviewAssertionManager.takeActivePreviewAssertion(for:)(int a1)
{
  sub_232E0510C(0, a1);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  *(_DWORD *)(v3 + 24) = a1;
  swift_retain();
  return sub_232E32F48();
}

void sub_232E0510C(char a1, int a2)
{
  uint64_t v3 = v2;
  aBlock[7] = *(void *)(v2 + 16);
  char v5 = a1 & 1;
  v15[16] = a1 & 1;
  int v16 = a2;
  swift_retain();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F908);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F910);
  unint64_t v14 = sub_232E059D0();
  uint64_t v12 = v6;
  LOBYTE(v11) = 2;
  sub_232E33138();
  swift_release();
  unint64_t v7 = (void *)aBlock[0];
  if (aBlock[0])
  {
    uint64_t v8 = swift_allocObject();
    *(_DWORD *)(v8 + 16) = a2;
    *(void *)(v8 + 24) = v3;
    *(unsigned char *)(v8 + 32) = v5;
    aBlock[4] = sub_232E05AAC;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_232E05858;
    aBlock[3] = &block_descriptor_0;
    char v9 = _Block_copy(aBlock);
    id v10 = v7;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_acquireWithInvalidationHandler_, v9, v11, sub_232E05A2C, v15, v12, v13, v14);

    _Block_release(v9);
  }
}

void sub_232E052C8(uint64_t a1, int a2)
{
  uint64_t v10 = *(void *)(a1 + 16);
  int v9 = a2;
  swift_retain();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F908);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F910);
  unint64_t v7 = sub_232E059D0();
  uint64_t v6 = v2;
  LOBYTE(v5) = 2;
  sub_232E33138();
  swift_release();
  id v4 = v11;
  objc_msgSend(v11, sel_invalidate, v5, sub_232E05988, v8, v6, v3, v7);
}

uint64_t sub_232E053AC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 28, 7);
}

void sub_232E053E4()
{
  sub_232E052C8(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

Swift::Void __swiftcall PreviewAssertionManager.takeSubordinateProcessAssertion(for:)(Swift::Int32 a1)
{
}

uint64_t sub_232E053FC(uint64_t a1, void *a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = sub_232E332F8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v35 - v14;
  if (a2)
  {
    int v38 = a5;
    id v16 = a2;
    sub_232E332B8();
    id v17 = a2;
    id v18 = a2;
    char v19 = sub_232E332D8();
    os_log_type_t v20 = sub_232E33518();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = swift_slowAlloc();
      int v37 = a3;
      uint64_t v22 = v21;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v35 = v9;
      uint64_t v24 = v23;
      uint64_t v40 = v23;
      *(_DWORD *)uint64_t v22 = 67240450;
      LODWORD(v39) = v37;
      sub_232E33568();
      *(_WORD *)(v22 + 8) = 2080;
      uint64_t v36 = a4;
      swift_getErrorValue();
      uint64_t v25 = sub_232E336C8();
      uint64_t v39 = sub_232E093C4(v25, v26, &v40);
      a4 = v36;
      sub_232E33568();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_232DFE000, v19, v20, "Assertion error for pid %{public}d: %s", (uint8_t *)v22, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x237DB3E80](v24, -1, -1);
      MEMORY[0x237DB3E80](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v35);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
  }
  else
  {
    uint64_t v27 = v9;
    sub_232E332B8();
    uint64_t v28 = sub_232E332D8();
    os_log_type_t v29 = sub_232E33508();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 67240192;
      LODWORD(v40) = a3;
      sub_232E33568();
      _os_log_impl(&dword_232DFE000, v28, v29, "Assertion invalidated for pid %{public}d", v30, 8u);
      MEMORY[0x237DB3E80](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v27);
  }
  uint64_t v40 = *(void *)(a4 + 16);
  MEMORY[0x270FA5388](v40);
  swift_retain();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F908);
  unint64_t v32 = sub_232E059D0();
  _OWORD v34[2] = MEMORY[0x263F8EE60] + 8;
  v34[3] = v32;
  v34[0] = v34;
  v34[1] = v31;
  sub_232E33138();
  return swift_release();
}

void sub_232E05858(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t PreviewAssertionManager.deinit()
{
  swift_release();
  return v0;
}

uint64_t PreviewAssertionManager.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PreviewAssertionManager()
{
  return self;
}

uint64_t method lookup function for PreviewAssertionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PreviewAssertionManager);
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.Storage()
{
  return &type metadata for PreviewAssertionManager.Storage;
}

id sub_232E05988@<X0>(void *a1@<X8>)
{
  id result = sub_232E04D74(0, *(_DWORD *)(v1 + 16));
  *a1 = result;
  return result;
}

unint64_t sub_232E059D0()
{
  unint64_t result = qword_26874F918;
  if (!qword_26874F918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26874F908);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874F918);
  }
  return result;
}

unint64_t sub_232E05A2C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_232E04A54(*(unsigned char *)(v1 + 16), *(unsigned int *)(v1 + 20));
  *a1 = result;
  return result;
}

uint64_t sub_232E05A74()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_232E05AAC(uint64_t a1, void *a2)
{
  return sub_232E053FC(a1, a2, *(_DWORD *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_232E05AD4()
{
  return sub_232E04EC0(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24), *(_DWORD *)(v0 + 28));
}

unint64_t sub_232E05B10()
{
  unint64_t result = qword_26874F928;
  if (!qword_26874F928)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26874F928);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for PreviewAssertionManager.Storage.CountedAssertion(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for PreviewAssertionManager.Storage.CountedAssertion(id *a1)
{
}

uint64_t assignWithCopy for PreviewAssertionManager.Storage.CountedAssertion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for PreviewAssertionManager.Storage.CountedAssertion(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewAssertionManager.Storage.CountedAssertion(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewAssertionManager.Storage.CountedAssertion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.Storage.CountedAssertion()
{
  return &type metadata for PreviewAssertionManager.Storage.CountedAssertion;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewAssertionManager.Storage.Key(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewAssertionManager.Storage.Key(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.Storage.Key()
{
  return &type metadata for PreviewAssertionManager.Storage.Key;
}

unint64_t sub_232E05D5C()
{
  unint64_t result = qword_26874F930;
  if (!qword_26874F930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874F930);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShellService.Instance(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PreviewAssertionManager.AssertionType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E05F18);
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

uint64_t sub_232E05F40(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_232E05F48(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.AssertionType()
{
  return &type metadata for PreviewAssertionManager.AssertionType;
}

unint64_t sub_232E05F68()
{
  unint64_t result = qword_26874F938;
  if (!qword_26874F938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874F938);
  }
  return result;
}

uint64_t ShellConnectionMessage<>.reply.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  unsigned int v4 = (id *)((char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *))(v5 + 16))(v4);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      uint64_t v7 = sub_232E32BA8();
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a2, (char *)v4 + *(int *)(TupleTypeMetadata2 + 48), v7);
      return (*(uint64_t (**)(id *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v4, AssociatedTypeWitness);
    case 2u:

      sub_232E02DFC(255, &qword_26874F948);
      goto LABEL_5;
    case 3u:

      sub_232E02DFC(255, &qword_26874F940);
LABEL_5:
      uint64_t v10 = swift_getAssociatedTypeWitness();
      uint64_t v11 = sub_232E32BA8();
      TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
      uint64_t v13 = (char *)v4 + *(int *)(TupleTypeMetadata3 + 48);
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a2, (char *)v4 + *(int *)(TupleTypeMetadata3 + 64), v11);
      return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v13, v10);
    default:
      sub_232E33688();
      __break(1u);
      JUMPOUT(0x232E0627CLL);
  }
}

uint64_t ShellConnectionMessage<>.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  unsigned int v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v7 = sub_232E32BA8();
    int v8 = &v4[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a2, v4, AssociatedTypeWitness);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v8, v7);
  }
  else
  {
    uint64_t result = sub_232E33688();
    __break(1u);
  }
  return result;
}

uint64_t ShellConnectionSender.transportDescription.getter()
{
  uint64_t v0 = sub_232E09A1C();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t ShellConnectionSender.messageRelay.getter()
{
  uint64_t v0 = sub_232E09A24();
  swift_retain();
  return v0;
}

uint64_t sub_232E06498@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  type metadata accessor for ShellConnection();
  swift_getWitnessTable();
  sub_232E33678();
  int v8 = (void *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a1;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a1;
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = a1;
  *a4 = 0;
  a4[1] = 0xE000000000000000;
  a4[2] = sub_232E0D3D4;
  a4[3] = v8;
  a4[4] = sub_232E0D3B0;
  a4[5] = v9;
  a4[6] = sub_232E0D38C;
  a4[7] = v10;
  return swift_retain_n();
}

uint64_t sub_232E06604()
{
  uint64_t v0 = sub_232E09A1C();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_232E0663C()
{
  uint64_t v0 = sub_232E09A24();
  swift_retain();
  return v0;
}

uint64_t sub_232E06674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F56760](a1, a4, a2, a5, a3);
}

uint64_t ShellConnectionSender<>.send(endpoint:context:reply:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6 = v5;
  uint64_t v50 = a5;
  uint64_t v53 = a1;
  uint64_t v54 = a3;
  uint64_t v55 = sub_232E32C28();
  uint64_t v52 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  v51 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_232E32E88();
  uint64_t v47 = *(void *)(v9 - 8);
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v9);
  v46 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v40 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v35 - v15;
  uint64_t v17 = sub_232E332F8();
  uint64_t v42 = *(void *)(v17 - 8);
  uint64_t v43 = v17;
  MEMORY[0x270FA5388](v17);
  char v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v20 = v6[1];
  uint64_t v38 = *v6;
  v45 = (void (*)(uint64_t, char *, uint64_t))v6[4];
  uint64_t v21 = v6[5];
  sub_232E332C8();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v49 = a2;
  uint64_t v39 = v22;
  v22(v16, a2, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v44 = v21;
  swift_retain();
  swift_retain();
  v41 = v19;
  uint64_t v23 = sub_232E332D8();
  os_log_type_t v24 = sub_232E334F8();
  int v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v26 = swift_slowAlloc();
    os_log_t v36 = v23;
    uint64_t v27 = v26;
    uint64_t v37 = swift_slowAlloc();
    v57[0] = v37;
    *(_DWORD *)uint64_t v27 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_232E093C4(v38, v20, v57);
    LODWORD(v38) = v25;
    sub_232E33568();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2082;
    v39(v40, v16, AssociatedTypeWitness);
    uint64_t v28 = sub_232E33378();
    uint64_t v56 = sub_232E093C4(v28, v29, v57);
    sub_232E33568();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, AssociatedTypeWitness);
    os_log_t v30 = v36;
    _os_log_impl(&dword_232DFE000, v36, (os_log_type_t)v38, "%{public}s sending xpc endpoint: %{public}s", (uint8_t *)v27, 0x16u);
    uint64_t v31 = v37;
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v31, -1, -1);
    MEMORY[0x237DB3E80](v27, -1, -1);
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, AssociatedTypeWitness);
  }
  (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  unint64_t v32 = v46;
  sub_232E330E8();
  id v33 = v51;
  sub_232E32DC8();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v32, v48);
  v45(v53, v33, v54);
  return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v33, v55);
}

{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, char *, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57[2];

  unsigned int v6 = v5;
  v49 = a5;
  uint64_t v52 = a1;
  uint64_t v53 = a3;
  uint64_t v54 = sub_232E32C28();
  v51 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v50 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_232E32E88();
  v46 = *(void *)(v9 - 8);
  uint64_t v47 = v9;
  MEMORY[0x270FA5388](v9);
  v45 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v40 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v35 - v15;
  uint64_t v17 = sub_232E332F8();
  uint64_t v42 = *(void *)(v17 - 8);
  uint64_t v43 = v17;
  MEMORY[0x270FA5388](v17);
  char v19 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v20 = v6[1];
  uint64_t v38 = *v6;
  uint64_t v44 = (void (*)(uint64_t, char *, uint64_t))v6[6];
  uint64_t v21 = v6[7];
  sub_232E332C8();
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v48 = a2;
  uint64_t v39 = v22;
  v22(v16, a2, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v55 = v21;
  swift_retain();
  v41 = v19;
  uint64_t v23 = sub_232E332D8();
  os_log_type_t v24 = sub_232E334F8();
  int v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v26 = swift_slowAlloc();
    os_log_t v36 = v23;
    uint64_t v27 = v26;
    uint64_t v37 = swift_slowAlloc();
    v57[0] = v37;
    *(_DWORD *)uint64_t v27 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_232E093C4(v38, v20, v57);
    LODWORD(v38) = v25;
    sub_232E33568();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2082;
    v39(v40, v16, AssociatedTypeWitness);
    uint64_t v28 = sub_232E33378();
    uint64_t v56 = sub_232E093C4(v28, v29, v57);
    sub_232E33568();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, AssociatedTypeWitness);
    os_log_t v30 = v36;
    _os_log_impl(&dword_232DFE000, v36, (os_log_type_t)v38, "%{public}s sending bs endpoint: %{public}s", (uint8_t *)v27, 0x16u);
    uint64_t v31 = v37;
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v31, -1, -1);
    MEMORY[0x237DB3E80](v27, -1, -1);
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, AssociatedTypeWitness);
  }
  (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  unint64_t v32 = v45;
  sub_232E330E8();
  id v33 = v50;
  sub_232E32DC8();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v32, v47);
  v44(v52, v33, v53);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v33, v54);
}

uint64_t ShellConnectionSender<>.send(endpoint:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_232E07198(a1, a2, a3, a4, 76, 80, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

{
  return sub_232E07198(a1, a2, a3, a4, 110, 114, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

uint64_t ShellConnectionSender<>.send<A>(endpoint:context:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_232E074AC(a1, a2, a3, a4, a5, a6, a7, 90, 94, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

{
  return sub_232E074AC(a1, a2, a3, a4, a5, a6, a7, 124, 128, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

uint64_t sub_232E07198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  uint64_t v32 = a4;
  id v33 = a7;
  v27[1] = a6;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v29 = a1;
  uint64_t v28 = sub_232E32BA8();
  uint64_t v8 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F950);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (void *)((char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (void *)((char *)v27 - v16);
  uint64_t v18 = *v7;
  uint64_t v19 = v7[7];
  unint64_t v20 = (char *)v27 + *(int *)(v12 + 56) - v16;
  uint64_t *v17 = sub_232E334B8();
  uint64_t v34 = v18;
  long long v35 = *(_OWORD *)(v7 + 1);
  long long v36 = *(_OWORD *)(v7 + 3);
  long long v37 = *(_OWORD *)(v7 + 5);
  uint64_t v38 = v19;
  uint64_t v21 = (char *)v15 + *(int *)(v12 + 56);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F6B0);
  uint64_t v23 = *(void *)(v22 - 8);
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v21, v20, v22);
  sub_232E32B88();
  v33(v29, v30, v10, v31, v32);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v28);
  os_log_type_t v24 = (char *)v15 + *(int *)(v12 + 56);
  uint64_t v25 = *v17;
  *uint64_t v15 = v25;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v24, v20, v22);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v22);
  return v25;
}

uint64_t sub_232E074AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  v29[0] = a8;
  v29[1] = a6;
  uint64_t v35 = a4;
  uint64_t v36 = a7;
  uint64_t v32 = a1;
  id v33 = a10;
  uint64_t v34 = a2;
  v29[2] = a9;
  uint64_t v11 = sub_232E32BA8();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26874F540);
  sub_232E334E8();
  uint64_t v14 = sub_232E334C8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v16 = TupleTypeMetadata2 - 8;
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v19 = (char *)v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (void *)((char *)v29 - v20);
  uint64_t v22 = *v10;
  uint64_t v23 = v10[7];
  os_log_type_t v24 = (char *)v29 + *(int *)(v16 + 56) - v20;
  *uint64_t v21 = sub_232E334B8();
  uint64_t v37 = v22;
  long long v38 = *(_OWORD *)(v10 + 1);
  long long v39 = *(_OWORD *)(v10 + 3);
  long long v40 = *(_OWORD *)(v10 + 5);
  uint64_t v41 = v23;
  uint64_t v25 = *(void *)(v14 - 8);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(&v19[*(int *)(v16 + 56)], v24, v14);
  sub_232E32B78();
  v33(v32, v34, v13, v35, v36);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
  uint64_t v26 = &v19[*(int *)(v16 + 56)];
  uint64_t v27 = *v21;
  *(void *)uint64_t v19 = *v21;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v26, v24, v14);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v14);
  return v27;
}

uint64_t ShellConnection.makeSender<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a1;
  v5[4] = a3;
  uint64_t v6 = *v4;
  v5[2] = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  v5[7] = v7;
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v7 = v5;
  v7[1] = sub_232E078D0;
  return MEMORY[0x270F569D8](v6, WitnessTable);
}

uint64_t sub_232E078D0()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    int v2 = sub_232E07A64;
  }
  else {
    int v2 = sub_232E079E4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_232E079E4()
{
  uint64_t v1 = v0[5];
  uint64_t v3 = (void *)v0[3];
  uint64_t v2 = v0[4];
  uint64_t v4 = swift_retain();
  sub_232E06498(v4, v2, v1, v3);
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_232E07A64()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ShellConnection.activate<A>(forReceiving:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ShellConnectionMessage();
  uint64_t v6 = sub_232E33448();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v12[-v7];
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = v3;
  swift_checkMetadataState();
  uint64_t v9 = *MEMORY[0x263F8F580];
  uint64_t v10 = sub_232E33448();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  return sub_232E334A8();
}

uint64_t sub_232E07B9C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v42 = *a2;
  uint64_t v8 = v42;
  type metadata accessor for ShellConnectionMessage();
  uint64_t v41 = sub_232E33478();
  uint64_t v38 = *(void *)(v41 - 8);
  uint64_t v40 = *(void *)(v38 + 64);
  MEMORY[0x270FA5388](v41);
  long long v39 = (char *)&v30 - v9;
  *(void *)&long long v47 = 0;
  *((void *)&v47 + 1) = 0xE000000000000000;
  v46 = a2;
  swift_getWitnessTable();
  sub_232E33678();
  uint64_t v45 = *((void *)&v47 + 1);
  uint64_t v37 = v47;
  uint64_t v49 = v8;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v50 = WitnessTable;
  *(void *)&long long v47 = a2;
  swift_retain();
  uint64_t v11 = sub_232E07FE8((uint64_t)&v47, a1, a3, a4, (uint64_t)&unk_26E694450, (uint64_t)sub_232E0D204, MEMORY[0x263F60B08]);
  uint64_t v43 = v12;
  uint64_t v44 = v11;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v47);
  uint64_t v49 = v8;
  uint64_t v50 = WitnessTable;
  *(void *)&long long v47 = a2;
  swift_retain();
  uint64_t v13 = sub_232E07FE8((uint64_t)&v47, a1, a3, a4, (uint64_t)&unk_26E694428, (uint64_t)sub_232E0D204, MEMORY[0x263F60B10]);
  uint64_t v33 = v13;
  uint64_t v15 = v14;
  uint64_t v32 = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v47);
  uint64_t v49 = v8;
  uint64_t v50 = WitnessTable;
  *(void *)&long long v47 = a2;
  uint64_t v16 = sub_232E08164((uint64_t)&v47, a1, a3, a4);
  uint64_t v35 = v16;
  uint64_t v31 = v17;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v47);
  uint64_t v49 = v8;
  uint64_t v50 = WitnessTable;
  *(void *)&long long v47 = a2;
  uint64_t v18 = sub_232E0832C((uint64_t)&v47, a1, a3, a4);
  uint64_t v34 = v18;
  uint64_t v20 = v19;
  uint64_t v36 = v19;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v47);
  *(void *)&long long v47 = v37;
  *((void *)&v47 + 1) = v45;
  uint64_t v48 = v44;
  uint64_t v49 = v43;
  uint64_t v50 = v13;
  uint64_t v51 = v15;
  uint64_t v52 = v16;
  uint64_t v53 = v31;
  uint64_t v54 = v18;
  uint64_t v55 = v20;
  sub_232E16010(&v47);
  v46 = a2;
  uint64_t v21 = v38;
  uint64_t v22 = v39;
  uint64_t v23 = a1;
  uint64_t v24 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v39, v23, v41);
  uint64_t v25 = v21;
  unint64_t v26 = (*(unsigned __int8 *)(v21 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v27 = (char *)swift_allocObject();
  uint64_t v28 = v42;
  *((void *)v27 + 2) = *(void *)(v42 + 80);
  *((void *)v27 + 3) = a3;
  *((void *)v27 + 4) = *(void *)(v28 + 88);
  *((void *)v27 + 5) = a4;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v27[v26], v22, v24);
  swift_getWitnessTable();
  sub_232E330D8();
  swift_bridgeObjectRelease();
  sub_232E0CF84(v44);
  sub_232E0CF84(v33);
  sub_232E0CF84((uint64_t)v35);
  sub_232E0CF84((uint64_t)v34);
  return swift_release();
}

uint64_t sub_232E07FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  uint64_t v19 = a6;
  uint64_t v20 = a7;
  type metadata accessor for ShellConnectionMessage();
  uint64_t v11 = sub_232E33478();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - v13, a2, v11);
  unint64_t v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16 + v15, v14, v11);
  uint64_t v17 = v20(a1, v19, v16, a3, *(void *)(a4 + 8));
  swift_release();
  return v17;
}

uint64_t (*sub_232E08164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ShellConnectionMessage();
  uint64_t v9 = sub_232E33478();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  if (swift_getAssociatedTypeWitness() == MEMORY[0x263F8E628]) {
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  sub_232E0CF94(a1, (uint64_t)v19);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v15 = (v11 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v14, v13, v9);
  *(void *)(v16 + v15) = v4;
  sub_232E0CFFC(v19, v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_232E0D0EC;
}

uint64_t (*sub_232E0832C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for ShellConnectionMessage();
  uint64_t v9 = sub_232E33478();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - v12;
  if (swift_getAssociatedTypeWitness() == MEMORY[0x263F8E628]) {
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  sub_232E0CF94(a1, (uint64_t)v19);
  unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v15 = (v11 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v14, v13, v9);
  *(void *)(v16 + v15) = v4;
  sub_232E0CFFC(v19, v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_232E0D014;
}

Swift::Void __swiftcall ShellConnection.activate()()
{
  *(void *)&v0[0] = 0;
  *((void *)&v0[0] + 1) = 0xE000000000000000;
  swift_getWitnessTable();
  sub_232E33678();
  memset(&v0[1], 0, 64);
  sub_232E16010(v0);
  swift_bridgeObjectRelease();
}

uint64_t sub_232E085B0()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_232E085E0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_232E0D9EC(v1);
  return v1;
}

uint64_t sub_232E08614()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_232E0D9EC(v1);
  return v1;
}

uint64_t sub_232E08648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v5, v7, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v9 = sub_232E32BA8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    uint64_t v11 = &v5[*(int *)(TupleTypeMetadata2 + 48)];
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a2, v5, AssociatedTypeWitness);
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a2 + *(int *)(TupleTypeMetadata2 + 48), v11, v9);
  }
  else
  {
    uint64_t v12 = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a2, v5, v12);
  }
  type metadata accessor for ShellConnectionMessage();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_232E08868()
{
  uint64_t v0 = type metadata accessor for ShellConnectionMessage();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v9 - v1;
  uint64_t v3 = sub_232E33438();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v9 - v5;
  uint64_t v7 = sub_232E32C48();
  sub_232E08648(v7, (uint64_t)v2);
  sub_232E33478();
  sub_232E33458();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_232E089E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a6;
  uint64_t v29 = a5;
  uint64_t v23 = a4;
  uint64_t v30 = a3;
  uint64_t v27 = a2;
  uint64_t v7 = sub_232E332F8();
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v26 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v24 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ShellConnectionMessage();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = sub_232E33438();
  uint64_t v21 = *(void *)(v12 - 8);
  uint64_t v22 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v20 = (char *)&v19 - v13;
  sub_232E02DFC(255, &qword_26874F948);
  swift_getAssociatedTypeWitness();
  uint64_t v14 = sub_232E32BA8();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  *(void *)uint64_t v11 = a1;
  id v16 = a1;
  sub_232E32C98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(&v11[*(int *)(TupleTypeMetadata3 + 64)], v30, v14);
  swift_storeEnumTagMultiPayload();
  sub_232E33478();
  uint64_t v17 = v20;
  sub_232E33458();
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v17, v22);
}

uint64_t sub_232E08E54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a6;
  uint64_t v29 = a5;
  uint64_t v23 = a4;
  uint64_t v30 = a3;
  uint64_t v27 = a2;
  uint64_t v7 = sub_232E332F8();
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v26 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v24 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for ShellConnectionMessage();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t v12 = sub_232E33438();
  uint64_t v21 = *(void *)(v12 - 8);
  uint64_t v22 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v20 = (char *)&v19 - v13;
  sub_232E02DFC(255, &qword_26874F940);
  swift_getAssociatedTypeWitness();
  uint64_t v14 = sub_232E32BA8();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  *(void *)uint64_t v11 = a1;
  id v16 = a1;
  sub_232E32C98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(&v11[*(int *)(TupleTypeMetadata3 + 64)], v30, v14);
  swift_storeEnumTagMultiPayload();
  sub_232E33478();
  uint64_t v17 = v20;
  sub_232E33458();
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v17, v22);
}

uint64_t sub_232E092C8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_232E092D8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_232E09314(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_232E09324(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_232E0934C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_232E093C4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_232E33568();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_232E093C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_232E09498(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_232E0D448((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_232E0D448((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_232E09498(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_232E33578();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_232E09654(a5, a6);
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
  uint64_t v8 = sub_232E335E8();
  if (!v8)
  {
    sub_232E33608();
    __break(1u);
LABEL_17:
    uint64_t result = sub_232E33638();
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

uint64_t sub_232E09654(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_232E096EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_232E098CC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_232E098CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_232E096EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_232E09864(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_232E335D8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_232E33608();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_232E333B8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_232E33638();
    __break(1u);
LABEL_14:
    uint64_t result = sub_232E33608();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_232E09864(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FA60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_232E098CC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26874FA60);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_232E33638();
  __break(1u);
  return result;
}

uint64_t sub_232E09A1C()
{
  return *(void *)v0;
}

uint64_t sub_232E09A24()
{
  return *(void *)(v0 + 16);
}

uint64_t type metadata accessor for ShellConnectionMessage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_232E09A44(uint64_t a1)
{
  return sub_232E07B9C(a1, *(void **)(v1 + 32), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_232E09A50(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a2 + 24) + 8);
}

uint64_t sub_232E09A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_232E09A64()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t v9 = *(void *)(result - 8) + 64;
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_232E32BA8();
      if (v3 <= 0x3F)
      {
        swift_getTupleTypeLayout2();
        uint64_t v10 = &v8;
        uint64_t result = swift_getAssociatedTypeWitness();
        if (v4 <= 0x3F)
        {
          swift_getTupleTypeLayout3();
          size_t v11 = &v7;
          uint64_t result = swift_getAssociatedTypeWitness();
          if (v5 <= 0x3F)
          {
            swift_getTupleTypeLayout3();
            uint64_t v12 = &v6;
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void *sub_232E09C98(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v53 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v2 = *(void *)(v53 + 64);
  uint64_t v48 = swift_getAssociatedTypeWitness();
  uint64_t v52 = *(void *)(v48 - 8);
  uint64_t v3 = *(void *)(v52 + 64);
  uint64_t v4 = sub_232E32BA8();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v51 = v4;
  int v5 = *(_DWORD *)(v50 + 80);
  uint64_t v47 = v3 + v5;
  uint64_t v6 = *(void *)(v50 + 64);
  if ((v47 & ~(unint64_t)v5) + v6 <= v2) {
    unint64_t v7 = v2;
  }
  else {
    unint64_t v7 = (v47 & ~(unint64_t)v5) + v6;
  }
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  int v9 = *(_DWORD *)(v45 + 80);
  uint64_t v10 = *(void *)(v45 + 64) + v5;
  uint64_t v44 = v10;
  if (((v10 + ((v9 + 8) & ~(unint64_t)v9)) & ~(unint64_t)v5)
     + v6 <= v7)
    unint64_t v11 = v7;
  else {
    unint64_t v11 = ((v10 + ((v9 + 8) & ~(unint64_t)v9)) & ~(unint64_t)v5)
  }
        + v6;
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(_DWORD *)(v13 + 80);
  uint64_t v15 = (v14 + 8) & ~v14;
  uint64_t v16 = *(void *)(v13 + 64) + v5;
  if (((v16 + v15) & ~(unint64_t)v5) + v6 <= v11) {
    unint64_t v17 = v11;
  }
  else {
    unint64_t v17 = ((v16 + v15) & ~(unint64_t)v5) + v6;
  }
  int v18 = *(_DWORD *)(v53 + 80) | *(_DWORD *)(v52 + 80) | v5;
  unsigned int v19 = v9 | v5 | v14 | v18 & 0xF8;
  if (v19 > 7 || ((*(_DWORD *)(v13 + 80) | v9 | v18) & 0x100000) != 0 || v17 + 1 > 0x18)
  {
    uint64_t v22 = *(void *)a2;
    *a1 = *(void *)a2;
    uint64_t v23 = (void *)(v22 + (((v19 | 7) + 16) & ~(unint64_t)(v19 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v25 = v12;
    unsigned int v26 = a2[v17];
    unsigned int v27 = v26 - 4;
    if (v26 >= 4)
    {
      if (v17 <= 3) {
        uint64_t v28 = v17;
      }
      else {
        uint64_t v28 = 4;
      }
      switch(v28)
      {
        case 1:
          int v29 = *a2;
          if (v17 < 4) {
            goto LABEL_30;
          }
          goto LABEL_32;
        case 2:
          int v29 = *(unsigned __int16 *)a2;
          if (v17 >= 4) {
            goto LABEL_32;
          }
          goto LABEL_30;
        case 3:
          int v29 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          if (v17 < 4) {
            goto LABEL_30;
          }
          goto LABEL_32;
        case 4:
          int v29 = *(_DWORD *)a2;
          if (v17 < 4) {
LABEL_30:
          }
            unsigned int v26 = (v29 | (v27 << (8 * v17))) + 4;
          else {
LABEL_32:
          }
            unsigned int v26 = v29 + 4;
          break;
        default:
          break;
      }
    }
    unint64_t v30 = ~(unint64_t)v5;
    unint64_t v31 = ~(unint64_t)v9;
    uint64_t v32 = ~v14;
    switch(v26)
    {
      case 1u:
        uint64_t v23 = a1;
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v52 + 16))(a1, a2, v48);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))(((unint64_t)a1 + v47) & v30, (unint64_t)&a2[v47] & v30, v51);
        *((unsigned char *)a1 + v17) = 1;
        break;
      case 2u:
        uint64_t v33 = *(void **)a2;
        uint64_t v23 = a1;
        *a1 = *(void *)a2;
        uint64_t v34 = ((unint64_t)a1 + v9 + 8) & v31;
        uint64_t v35 = (unint64_t)&a2[v9 + 8] & v31;
        uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
        id v37 = v33;
        v36(v34, v35, v46);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))((v44 + v34) & v30, (v44 + v35) & v30, v51);
        *((unsigned char *)a1 + v17) = 2;
        break;
      case 3u:
        uint64_t v38 = *(void **)a2;
        *a1 = *(void *)a2;
        uint64_t v39 = ((unint64_t)a1 + v14 + 8) & v32;
        uint64_t v40 = (unint64_t)&a2[v14 + 8] & v32;
        uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
        id v42 = v38;
        uint64_t v43 = v25;
        uint64_t v23 = a1;
        v41(v39, v40, v43);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))((v16 + v39) & v30, (v16 + v40) & v30, v51);
        *((unsigned char *)a1 + v17) = 3;
        break;
      default:
        uint64_t v23 = a1;
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v53 + 16))(a1, a2, AssociatedTypeWitness);
        *((unsigned char *)a1 + v17) = 0;
        break;
    }
  }
  return v23;
}

uint64_t sub_232E0A210(unsigned __int8 *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v35 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v36 = AssociatedTypeWitness;
  unint64_t v3 = *(void *)(v35 + 64);
  uint64_t v4 = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  uint64_t v5 = *(void *)(v33 + 64);
  uint64_t v38 = sub_232E32BA8();
  uint64_t v37 = *(void *)(v38 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v37 + 80);
  uint64_t v32 = v5 + v6;
  uint64_t v7 = *(void *)(v37 + 64);
  if (((v5 + v6) & (unint64_t)~v6) + v7 <= v3) {
    unint64_t v8 = v3;
  }
  else {
    unint64_t v8 = ((v5 + v6) & ~v6) + v7;
  }
  uint64_t v31 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v31 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 64) + v6;
  uint64_t v30 = v11;
  if (((v11 + ((v10 + 8) & ~v10)) & (unint64_t)~v6) + v7 > v8) {
    unint64_t v8 = ((v11 + ((v10 + 8) & ~v10)) & ~v6) + v7;
  }
  uint64_t v12 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = *(void *)(v13 + 64);
  uint64_t v16 = v15 + v6;
  unint64_t v17 = ((v15 + v6 + ((v14 + 8) & ~v14)) & ~v6) + v7;
  if (v17 <= v8) {
    unint64_t v17 = v8;
  }
  unsigned int v18 = a1[v17];
  unsigned int v19 = v18 - 4;
  if (v18 >= 4)
  {
    if (v17 <= 3) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = 4;
    }
    switch(v20)
    {
      case 1:
        int v21 = *a1;
        if (v17 < 4) {
          goto LABEL_18;
        }
        goto LABEL_20;
      case 2:
        int v21 = *(unsigned __int16 *)a1;
        if (v17 >= 4) {
          goto LABEL_20;
        }
        goto LABEL_18;
      case 3:
        int v21 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        if (v17 < 4) {
          goto LABEL_18;
        }
        goto LABEL_20;
      case 4:
        int v21 = *(_DWORD *)a1;
        if (v17 < 4) {
LABEL_18:
        }
          unsigned int v18 = (v21 | (v19 << (8 * v17))) + 4;
        else {
LABEL_20:
        }
          unsigned int v18 = v21 + 4;
        break;
      default:
        break;
    }
  }
  uint64_t v22 = ~v6;
  switch(v18)
  {
    case 1u:
      (*(void (**)(unsigned __int8 *, uint64_t))(v33 + 8))(a1, v34);
      uint64_t v26 = v32;
      goto LABEL_25;
    case 2u:

      a1 = (unsigned __int8 *)((unint64_t)&a1[v10 + 8] & ~v10);
      (*(void (**)(unsigned __int8 *, uint64_t))(v9 + 8))(a1, v31);
      uint64_t v26 = v30;
LABEL_25:
      unint64_t v27 = (unint64_t)&a1[v26];
      goto LABEL_27;
    case 3u:

      uint64_t v28 = (unint64_t)&a1[v14 + 8] & ~v14;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v28, v12);
      unint64_t v27 = v16 + v28;
LABEL_27:
      uint64_t v25 = (unsigned __int8 *)(v27 & v22);
      uint64_t v23 = v38;
      uint64_t v24 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v37 + 8);
      break;
    default:
      uint64_t v23 = v36;
      uint64_t v24 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v35 + 8);
      uint64_t v25 = a1;
      break;
  }

  return v24(v25, v23);
}

void *sub_232E0A654(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v49 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v50 = AssociatedTypeWitness;
  unint64_t v4 = *(void *)(v49 + 64);
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  uint64_t v6 = *(void *)(v47 + 64);
  uint64_t v51 = sub_232E32BA8();
  uint64_t v7 = *(void *)(v51 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v46 = v6 + v8;
  uint64_t v9 = *(void *)(v7 + 64);
  if (((v6 + v8) & (unint64_t)~v8) + v9 > v4) {
    unint64_t v4 = ((v6 + v8) & ~v8) + v9;
  }
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(v10 - 8);
  uint64_t v45 = v10;
  uint64_t v11 = *(unsigned __int8 *)(v44 + 80);
  uint64_t v12 = *(void *)(v44 + 64) + v8;
  uint64_t v43 = v12;
  if (((v12 + ((v11 + 8) & ~v11)) & (unint64_t)~v8) + v9 <= v4) {
    unint64_t v13 = v4;
  }
  else {
    unint64_t v13 = ((v12 + ((v11 + 8) & ~v11)) & ~v8) + v9;
  }
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = (v16 + 8) & ~v16;
  uint64_t v18 = *(void *)(v15 + 64) + v8;
  if (((v18 + v17) & (unint64_t)~v8) + v9 <= v13) {
    unint64_t v19 = v13;
  }
  else {
    unint64_t v19 = ((v18 + v17) & ~v8) + v9;
  }
  unsigned int v20 = a2[v19];
  unsigned int v21 = v20 - 4;
  if (v20 < 4)
  {
    uint64_t v23 = a1;
  }
  else
  {
    if (v19 <= 3) {
      uint64_t v22 = v19;
    }
    else {
      uint64_t v22 = 4;
    }
    uint64_t v23 = a1;
    switch(v22)
    {
      case 1:
        int v24 = *a2;
        if (v19 < 4) {
          goto LABEL_20;
        }
        goto LABEL_22;
      case 2:
        int v24 = *(unsigned __int16 *)a2;
        if (v19 >= 4) {
          goto LABEL_22;
        }
        goto LABEL_20;
      case 3:
        int v24 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v19 < 4) {
          goto LABEL_20;
        }
        goto LABEL_22;
      case 4:
        int v24 = *(_DWORD *)a2;
        if (v19 < 4) {
LABEL_20:
        }
          unsigned int v20 = (v24 | (v21 << (8 * v19))) + 4;
        else {
LABEL_22:
        }
          unsigned int v20 = v24 + 4;
        break;
      default:
        break;
    }
  }
  uint64_t v25 = ~v8;
  uint64_t v26 = ~v11;
  uint64_t v27 = ~v16;
  switch(v20)
  {
    case 1u:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v47 + 16))(v23, a2, v48);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v23 + v46) & v25, (unint64_t)&a2[v46] & v25, v51);
      char v28 = 1;
      break;
    case 2u:
      int v29 = *(void **)a2;
      void *v23 = *(void *)a2;
      uint64_t v30 = &a2[v11];
      uint64_t v31 = ((unint64_t)v23 + v11 + 8) & v26;
      uint64_t v32 = (unint64_t)(v30 + 8) & v26;
      uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
      id v34 = v29;
      v33(v31, v32, v45);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))((v43 + v31) & v25, (v43 + v32) & v25, v51);
      char v28 = 2;
      break;
    case 3u:
      uint64_t v35 = *(void **)a2;
      void *v23 = *(void *)a2;
      uint64_t v36 = (char *)v23 + v16;
      uint64_t v37 = &a2[v16];
      uint64_t v38 = (unint64_t)(v36 + 8) & v27;
      uint64_t v39 = (unint64_t)(v37 + 8) & v27;
      uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
      id v41 = v35;
      v40(v38, v39, v14);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))((v18 + v38) & v25, (v18 + v39) & v25, v51);
      char v28 = 3;
      break;
    default:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v49 + 16))(v23, a2, v50);
      char v28 = 0;
      break;
  }
  *((unsigned char *)v23 + v19) = v28;
  return v23;
}

unsigned __int8 *sub_232E0AB3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v57 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v58 = AssociatedTypeWitness;
    unint64_t v4 = *(void *)(v57 + 64);
    uint64_t v5 = swift_getAssociatedTypeWitness();
    uint64_t v55 = *(void *)(v5 - 8);
    uint64_t v56 = v5;
    uint64_t v6 = *(void *)(v55 + 64);
    uint64_t v61 = sub_232E32BA8();
    uint64_t v7 = *(void *)(v61 - 8);
    uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
    uint64_t v54 = v6 + v8;
    uint64_t v9 = (v6 + v8) & ~v8;
    uint64_t v10 = *(void *)(v7 + 64);
    unint64_t v11 = v9 + v10;
    if (v11 <= v4) {
      unint64_t v12 = v4;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v13 = swift_getAssociatedTypeWitness();
    uint64_t v52 = *(void *)(v13 - 8);
    uint64_t v53 = v13;
    uint64_t v14 = *(unsigned __int8 *)(v52 + 80);
    uint64_t v15 = *(void *)(v52 + 64) + v8;
    uint64_t v51 = v15;
    if (((v15 + ((v14 + 8) & ~v14)) & (unint64_t)~v8) + v10 <= v12) {
      unint64_t v16 = v12;
    }
    else {
      unint64_t v16 = ((v15 + ((v14 + 8) & ~v14)) & ~v8) + v10;
    }
    uint64_t v50 = swift_getAssociatedTypeWitness();
    uint64_t v17 = *(void *)(v50 - 8);
    uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
    uint64_t v19 = *(void *)(v17 + 64) + v8;
    uint64_t v49 = v19;
    if (((v19 + ((v18 + 8) & ~v18)) & (unint64_t)~v8) + v10 <= v16) {
      unint64_t v20 = v16;
    }
    else {
      unint64_t v20 = ((v19 + ((v18 + 8) & ~v18)) & ~v8) + v10;
    }
    unsigned int v21 = a1[v20];
    unsigned int v22 = v21 - 4;
    if (v21 < 4)
    {
      uint64_t v24 = v7;
      uint64_t v25 = a2;
    }
    else
    {
      if (v20 <= 3) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = 4;
      }
      uint64_t v24 = v7;
      uint64_t v25 = a2;
      switch(v23)
      {
        case 1:
          int v26 = *a1;
          if (v20 < 4) {
            goto LABEL_22;
          }
          goto LABEL_24;
        case 2:
          int v26 = *(unsigned __int16 *)a1;
          if (v20 >= 4) {
            goto LABEL_24;
          }
          goto LABEL_22;
        case 3:
          int v26 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v20 < 4) {
            goto LABEL_22;
          }
          goto LABEL_24;
        case 4:
          int v26 = *(_DWORD *)a1;
          if (v20 < 4) {
LABEL_22:
          }
            unsigned int v21 = (v26 | (v22 << (8 * v20))) + 4;
          else {
LABEL_24:
          }
            unsigned int v21 = v26 + 4;
          break;
        default:
          break;
      }
    }
    uint64_t v27 = ~v8;
    uint64_t v28 = ~v14;
    uint64_t v60 = ~v18;
    switch(v21)
    {
      case 1u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v55 + 8))(a1, v56);
        unint64_t v30 = (unint64_t)&a1[v54];
        goto LABEL_31;
      case 2u:

        uint64_t v31 = (unint64_t)&a1[v14 + 8] & v28;
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v31, v53);
        uint64_t v32 = v51;
        goto LABEL_30;
      case 3u:

        uint64_t v31 = (unint64_t)&a1[v18 + 8] & ~v18;
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v31, v50);
        uint64_t v32 = v49;
LABEL_30:
        unint64_t v30 = v32 + v31;
LABEL_31:
        uint64_t v29 = v61;
        (*(void (**)(unint64_t, uint64_t))(v24 + 8))(v30 & v27, v61);
        break;
      default:
        (*(void (**)(unsigned __int8 *, uint64_t))(v57 + 8))(a1, v58);
        uint64_t v29 = v61;
        break;
    }
    unsigned int v33 = v25[v20];
    unsigned int v34 = v33 - 4;
    if (v33 >= 4)
    {
      if (v20 <= 3) {
        uint64_t v35 = v20;
      }
      else {
        uint64_t v35 = 4;
      }
      switch(v35)
      {
        case 1:
          int v36 = *v25;
          if (v20 < 4) {
            goto LABEL_42;
          }
          goto LABEL_44;
        case 2:
          int v36 = *(unsigned __int16 *)v25;
          if (v20 >= 4) {
            goto LABEL_44;
          }
          goto LABEL_42;
        case 3:
          int v36 = *(unsigned __int16 *)v25 | (v25[2] << 16);
          if (v20 < 4) {
            goto LABEL_42;
          }
          goto LABEL_44;
        case 4:
          int v36 = *(_DWORD *)v25;
          if (v20 < 4) {
LABEL_42:
          }
            unsigned int v33 = (v36 | (v34 << (8 * v20))) + 4;
          else {
LABEL_44:
          }
            unsigned int v33 = v36 + 4;
          break;
        default:
          break;
      }
    }
    switch(v33)
    {
      case 1u:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v55 + 16))(a1, v25, v56);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 16))((unint64_t)&a1[v54] & v27, (unint64_t)&v25[v54] & v27, v29);
        char v37 = 1;
        break;
      case 2u:
        uint64_t v38 = *(void **)v25;
        *(void *)a1 = *(void *)v25;
        uint64_t v39 = (unint64_t)&a1[v14 + 8] & v28;
        uint64_t v40 = (unint64_t)&v25[v14 + 8] & ~v14;
        id v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16);
        id v42 = v38;
        v41(v39, v40, v53);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))((v51 + v39) & v27, (v51 + v40) & v27, v29);
        char v37 = 2;
        break;
      case 3u:
        uint64_t v43 = *(void **)v25;
        *(void *)a1 = *(void *)v25;
        uint64_t v44 = (unint64_t)&a1[v18 + 8] & v60;
        uint64_t v45 = (unint64_t)&v25[v18 + 8] & v60;
        uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
        id v47 = v43;
        v46(v44, v45, v50);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))((v49 + v44) & v27, (v49 + v45) & v27, v29);
        char v37 = 3;
        break;
      default:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v57 + 16))(a1, v25, v58);
        char v37 = 0;
        break;
    }
    a1[v20] = v37;
  }
  return a1;
}

void *sub_232E0B1F4(void *a1, unsigned __int8 *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v45 = AssociatedTypeWitness;
  unint64_t v4 = *(void *)(v44 + 64);
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  uint64_t v6 = *(void *)(v42 + 64);
  uint64_t v46 = sub_232E32BA8();
  uint64_t v7 = *(void *)(v46 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v41 = v6 + v8;
  uint64_t v9 = (v6 + v8) & ~v8;
  uint64_t v10 = *(void *)(v7 + 64);
  unint64_t v11 = v9 + v10;
  if (v11 <= v4) {
    unint64_t v12 = v4;
  }
  else {
    unint64_t v12 = v11;
  }
  uint64_t v40 = swift_getAssociatedTypeWitness();
  uint64_t v13 = *(void *)(v40 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = *(void *)(v13 + 64) + v8;
  uint64_t v39 = v15;
  if (((v15 + ((v14 + 8) & ~v14)) & (unint64_t)~v8) + v10 > v12) {
    unint64_t v12 = ((v15 + ((v14 + 8) & ~v14)) & ~v8) + v10;
  }
  uint64_t v16 = swift_getAssociatedTypeWitness();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = (v18 + 8) & ~v18;
  uint64_t v20 = *(void *)(v17 + 64) + v8;
  if (((v20 + v19) & (unint64_t)~v8) + v10 <= v12) {
    unint64_t v21 = v12;
  }
  else {
    unint64_t v21 = ((v20 + v19) & ~v8) + v10;
  }
  unsigned int v22 = a2[v21];
  unsigned int v23 = v22 - 4;
  if (v22 < 4)
  {
    uint64_t v25 = a1;
  }
  else
  {
    if (v21 <= 3) {
      uint64_t v24 = v21;
    }
    else {
      uint64_t v24 = 4;
    }
    uint64_t v25 = a1;
    switch(v24)
    {
      case 1:
        int v26 = *a2;
        if (v21 < 4) {
          goto LABEL_20;
        }
        goto LABEL_22;
      case 2:
        int v26 = *(unsigned __int16 *)a2;
        if (v21 >= 4) {
          goto LABEL_22;
        }
        goto LABEL_20;
      case 3:
        int v26 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        if (v21 < 4) {
          goto LABEL_20;
        }
        goto LABEL_22;
      case 4:
        int v26 = *(_DWORD *)a2;
        if (v21 < 4) {
LABEL_20:
        }
          unsigned int v22 = (v26 | (v23 << (8 * v21))) + 4;
        else {
LABEL_22:
        }
          unsigned int v22 = v26 + 4;
        break;
      default:
        break;
    }
  }
  uint64_t v27 = ~v8;
  uint64_t v28 = ~v14;
  uint64_t v29 = ~v18;
  switch(v22)
  {
    case 1u:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v42 + 32))(v25, a2, v43);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 32))(((unint64_t)v25 + v41) & v27, (unint64_t)&a2[v41] & v27, v46);
      char v30 = 1;
      break;
    case 2u:
      void *v25 = *(void *)a2;
      uint64_t v31 = &a2[v14];
      uint64_t v32 = ((unint64_t)v25 + v14 + 8) & v28;
      uint64_t v33 = (unint64_t)(v31 + 8) & v28;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v32, v33, v40);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))((v39 + v32) & v27, (v39 + v33) & v27, v46);
      char v30 = 2;
      break;
    case 3u:
      void *v25 = *(void *)a2;
      unsigned int v34 = (char *)v25 + v18;
      uint64_t v35 = &a2[v18];
      uint64_t v36 = (unint64_t)(v34 + 8) & v29;
      uint64_t v37 = (unint64_t)(v35 + 8) & v29;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v36, v37, v16);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))((v20 + v36) & v27, (v20 + v37) & v27, v46);
      char v30 = 3;
      break;
    default:
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v44 + 32))(v25, a2, v45);
      char v30 = 0;
      break;
  }
  *((unsigned char *)v25 + v21) = v30;
  return v25;
}

unsigned __int8 *sub_232E0B6CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v50 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v51 = AssociatedTypeWitness;
    unint64_t v4 = *(void *)(v50 + 64);
    uint64_t v5 = swift_getAssociatedTypeWitness();
    uint64_t v48 = *(void *)(v5 - 8);
    uint64_t v49 = v5;
    uint64_t v6 = *(void *)(v48 + 64);
    uint64_t v7 = sub_232E32BA8();
    uint64_t v52 = *(void *)(v7 - 8);
    uint64_t v8 = *(unsigned __int8 *)(v52 + 80);
    uint64_t v47 = v6 + v8;
    uint64_t v9 = (v6 + v8) & ~v8;
    uint64_t v10 = *(void *)(v52 + 64);
    unint64_t v11 = v9 + v10;
    if (v11 <= v4) {
      unint64_t v12 = v4;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v13 = swift_getAssociatedTypeWitness();
    uint64_t v45 = *(void *)(v13 - 8);
    uint64_t v46 = v13;
    uint64_t v14 = *(unsigned __int8 *)(v45 + 80);
    uint64_t v15 = *(void *)(v45 + 64) + v8;
    uint64_t v44 = v15;
    if (((v15 + ((v14 + 8) & ~v14)) & (unint64_t)~v8) + v10 <= v12) {
      unint64_t v16 = v12;
    }
    else {
      unint64_t v16 = ((v15 + ((v14 + 8) & ~v14)) & ~v8) + v10;
    }
    uint64_t v43 = swift_getAssociatedTypeWitness();
    uint64_t v17 = *(void *)(v43 - 8);
    uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
    uint64_t v19 = *(void *)(v17 + 64) + v8;
    uint64_t v42 = v19;
    if (((v19 + ((v18 + 8) & ~v18)) & (unint64_t)~v8) + v10 <= v16) {
      unint64_t v20 = v16;
    }
    else {
      unint64_t v20 = ((v19 + ((v18 + 8) & ~v18)) & ~v8) + v10;
    }
    unsigned int v21 = a1[v20];
    unsigned int v22 = v21 - 4;
    if (v21 < 4)
    {
      uint64_t v24 = v7;
      uint64_t v25 = a2;
    }
    else
    {
      if (v20 <= 3) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = 4;
      }
      uint64_t v24 = v7;
      uint64_t v25 = a2;
      switch(v23)
      {
        case 1:
          int v26 = *a1;
          if (v20 < 4) {
            goto LABEL_22;
          }
          goto LABEL_24;
        case 2:
          int v26 = *(unsigned __int16 *)a1;
          if (v20 >= 4) {
            goto LABEL_24;
          }
          goto LABEL_22;
        case 3:
          int v26 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          if (v20 < 4) {
            goto LABEL_22;
          }
          goto LABEL_24;
        case 4:
          int v26 = *(_DWORD *)a1;
          if (v20 < 4) {
LABEL_22:
          }
            unsigned int v21 = (v26 | (v22 << (8 * v20))) + 4;
          else {
LABEL_24:
          }
            unsigned int v21 = v26 + 4;
          break;
        default:
          break;
      }
    }
    uint64_t v27 = ~v8;
    uint64_t v28 = ~v14;
    uint64_t v54 = ~v18;
    switch(v21)
    {
      case 1u:
        (*(void (**)(unsigned __int8 *, uint64_t))(v48 + 8))(a1, v49);
        unint64_t v30 = (unint64_t)&a1[v47];
        goto LABEL_31;
      case 2u:

        uint64_t v31 = (unint64_t)&a1[v14 + 8] & v28;
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v31, v46);
        uint64_t v32 = v44;
        goto LABEL_30;
      case 3u:

        uint64_t v31 = (unint64_t)&a1[v18 + 8] & ~v18;
        (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v31, v43);
        uint64_t v32 = v42;
LABEL_30:
        unint64_t v30 = v32 + v31;
LABEL_31:
        uint64_t v29 = v52;
        (*(void (**)(unint64_t, uint64_t))(v52 + 8))(v30 & v27, v24);
        break;
      default:
        (*(void (**)(unsigned __int8 *, uint64_t))(v50 + 8))(a1, v51);
        uint64_t v29 = v52;
        break;
    }
    unsigned int v33 = v25[v20];
    unsigned int v34 = v33 - 4;
    if (v33 >= 4)
    {
      if (v20 <= 3) {
        uint64_t v35 = v20;
      }
      else {
        uint64_t v35 = 4;
      }
      switch(v35)
      {
        case 1:
          int v36 = *v25;
          if (v20 < 4) {
            goto LABEL_42;
          }
          goto LABEL_44;
        case 2:
          int v36 = *(unsigned __int16 *)v25;
          if (v20 >= 4) {
            goto LABEL_44;
          }
          goto LABEL_42;
        case 3:
          int v36 = *(unsigned __int16 *)v25 | (v25[2] << 16);
          if (v20 < 4) {
            goto LABEL_42;
          }
          goto LABEL_44;
        case 4:
          int v36 = *(_DWORD *)v25;
          if (v20 < 4) {
LABEL_42:
          }
            unsigned int v33 = (v36 | (v34 << (8 * v20))) + 4;
          else {
LABEL_44:
          }
            unsigned int v33 = v36 + 4;
          break;
        default:
          break;
      }
    }
    switch(v33)
    {
      case 1u:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v48 + 32))(a1, v25, v49);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v29 + 32))((unint64_t)&a1[v47] & v27, (unint64_t)&v25[v47] & v27, v24);
        char v37 = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)v25;
        uint64_t v38 = &v25[v14];
        uint64_t v39 = (unint64_t)&a1[v14 + 8] & v28;
        uint64_t v40 = (unint64_t)(v38 + 8) & v28;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v39, v40, v46);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))((v44 + v39) & v27, (v44 + v40) & v27, v24);
        char v37 = 2;
        break;
      case 3u:
        *(void *)a1 = *(void *)v25;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 32))((unint64_t)&a1[v18 + 8] & v54, (unint64_t)&v25[v18 + 8] & v54, v43);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v29 + 32))((v42 + ((unint64_t)&a1[v18 + 8] & v54)) & v27, (v42 + ((unint64_t)&v25[v18 + 8] & v54)) & v27, v24);
        char v37 = 3;
        break;
      default:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v50 + 32))(a1, v25, v51);
        char v37 = 0;
        break;
    }
    a1[v20] = v37;
  }
  return a1;
}

uint64_t sub_232E0BD74(unsigned __int16 *a1, unsigned int a2)
{
  unint64_t v4 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t v5 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t v6 = *(void *)(sub_232E32BA8() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  if (((v5 + v7) & (unint64_t)~v7) + v8 > v4) {
    unint64_t v4 = ((v5 + v7) & ~v7) + v8;
  }
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v10 = ((*(void *)(v9 + 64)
        + v7
        + ((*(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~v7)
      + v8;
  if (v10 > v4) {
    unint64_t v4 = v10;
  }
  uint64_t v11 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v12 = ((*(void *)(v11 + 64)
        + v7
        + ((*(unsigned __int8 *)(v11 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))) & ~v7)
      + v8;
  if (v12 <= v4) {
    unint64_t v13 = v4;
  }
  else {
    unint64_t v13 = v12;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_27;
  }
  unint64_t v14 = v13 + 1;
  char v15 = 8 * (v13 + 1);
  if ((v13 + 1) <= 3)
  {
    unsigned int v18 = ((a2 + ~(-1 << v15) - 252) >> v15) + 1;
    if (HIWORD(v18))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_27;
      }
      goto LABEL_19;
    }
    if (v18 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_27;
      }
      goto LABEL_19;
    }
    if (v18 < 2)
    {
LABEL_27:
      unsigned int v20 = *((unsigned __int8 *)a1 + v13);
      if (v20 >= 4) {
        return (v20 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_27;
  }
LABEL_19:
  int v19 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v19 = 0;
  }
  if (v14)
  {
    if (v14 > 3) {
      LODWORD(v14) = 4;
    }
    switch((int)v14)
    {
      case 2:
        LODWORD(v14) = *a1;
        break;
      case 3:
        LODWORD(v14) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v14) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v14) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v14 | v19) + 253;
}

void sub_232E0C094(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t v7 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t v8 = *(void *)(sub_232E32BA8() - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  if (((v7 + v9) & (unint64_t)~v9) + v10 > v6) {
    unint64_t v6 = ((v7 + v9) & ~v9) + v10;
  }
  uint64_t v11 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v12 = ((*(void *)(v11 + 64)
        + v9
        + ((*(unsigned __int8 *)(v11 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))) & ~v9)
      + v10;
  if (v12 > v6) {
    unint64_t v6 = v12;
  }
  uint64_t v13 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v14 = ((*(void *)(v13 + 64)
        + v9
        + ((*(unsigned __int8 *)(v13 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))) & ~v9)
      + v10;
  if (v14 <= v6) {
    unint64_t v14 = v6;
  }
  size_t v15 = v14 + 1;
  if (a3 < 0xFD)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 + ~(-1 << (8 * v15)) - 252) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (a2 > 0xFC)
  {
    unsigned int v17 = a2 - 253;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v14 != -1)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v14 + 1);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        break;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        break;
      case 3:
LABEL_38:
        __break(1u);
        JUMPOUT(0x232E0C428);
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v16)
    {
      case 1:
        a1[v15] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_27;
      case 2:
        *(_WORD *)&a1[v15] = 0;
        goto LABEL_26;
      case 3:
        goto LABEL_38;
      case 4:
        *(_DWORD *)&a1[v15] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_27;
      default:
LABEL_26:
        if (a2) {
LABEL_27:
        }
          a1[v14] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_232E0C450(unsigned __int8 *a1)
{
  unint64_t v2 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t v3 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
  uint64_t v4 = *(void *)(sub_232E32BA8() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64);
  if (((v3 + v5) & (unint64_t)~v5) + v6 > v2) {
    unint64_t v2 = ((v3 + v5) & ~v5) + v6;
  }
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v8 = ((*(void *)(v7 + 64)
       + v5
       + ((*(unsigned __int8 *)(v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & ~v5)
     + v6;
  if (v8 > v2) {
    unint64_t v2 = v8;
  }
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v10 = ((*(void *)(v9 + 64)
        + v5
        + ((*(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))) & ~v5)
      + v6;
  if (v10 <= v2) {
    unint64_t v10 = v2;
  }
  uint64_t result = a1[v10];
  if (result >= 4)
  {
    if (v10 <= 3) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = 4;
    }
    switch(v12)
    {
      case 1:
        int v13 = *a1;
        if (v10 < 4) {
          goto LABEL_17;
        }
        goto LABEL_19;
      case 2:
        int v13 = *(unsigned __int16 *)a1;
        if (v10 >= 4) {
          goto LABEL_19;
        }
        goto LABEL_17;
      case 3:
        int v13 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        if (v10 < 4) {
          goto LABEL_17;
        }
        goto LABEL_19;
      case 4:
        int v13 = *(_DWORD *)a1;
        if (v10 < 4) {
LABEL_17:
        }
          uint64_t result = (v13 | ((result - 4) << (8 * v10))) + 4;
        else {
LABEL_19:
        }
          uint64_t result = (v13 + 4);
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_232E0C704(unsigned char *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v5 = v4;
  if (a2 > 3)
  {
    size_t v13 = *(void *)(v4 + 64);
    uint64_t v14 = *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
    uint64_t v15 = *(void *)(sub_232E32BA8() - 8);
    uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
    uint64_t v17 = (v14 + v16) & ~v16;
    uint64_t v18 = *(void *)(v15 + 64);
    size_t v19 = v17 + v18;
    if (v19 <= v13) {
      size_t v20 = v13;
    }
    else {
      size_t v20 = v19;
    }
    uint64_t v21 = *(void *)(swift_getAssociatedTypeWitness() - 8);
    size_t v22 = ((*(void *)(v21 + 64)
          + v16
          + ((*(unsigned __int8 *)(v21 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))) & ~v16)
        + v18;
    if (v22 > v20) {
      size_t v20 = v22;
    }
    uint64_t v23 = *(void *)(swift_getAssociatedTypeWitness() - 8);
    size_t v24 = ((*(void *)(v23 + 64)
          + v16
          + ((*(unsigned __int8 *)(v23 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))) & ~v16)
        + v18;
    if (v24 <= v20) {
      size_t v25 = v20;
    }
    else {
      size_t v25 = v24;
    }
    unsigned int v26 = a2 - 4;
    if (v25 < 4)
    {
      unsigned int v27 = v26 >> (8 * v25);
      int v28 = v26 & ~(-1 << (8 * v25));
      a1[v25] = v27 + 4;
      bzero(a1, v25);
      if (v25 == 3)
      {
        *(_WORD *)a1 = v28;
        a1[2] = BYTE2(v28);
      }
      else if (v25 == 2)
      {
        *(_WORD *)a1 = v28;
      }
      else
      {
        *a1 = v28;
      }
    }
    else
    {
      a1[v25] = 4;
      bzero(a1, v25);
      *(_DWORD *)a1 = v26;
    }
  }
  else
  {
    uint64_t v30 = *(void *)(swift_getAssociatedTypeWitness() - 8);
    uint64_t v29 = *(void *)(sub_232E32BA8() - 8);
    uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
    uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
    uint64_t v8 = *(unsigned __int8 *)(v29 + 80);
    uint64_t v9 = *(void *)(v29 + 64);
    unint64_t v10 = ((((*(unsigned __int8 *)(v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
          + *(void *)(v7 + 64)
          + v8) & ~v8)
        + v9;
    unint64_t v11 = ((*(void *)(v6 + 64)
          + v8
          + ((*(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~v8)
        + v9;
    unint64_t v12 = ((*(void *)(v30 + 64) + v8) & ~v8) + v9;
    if (v12 <= *(void *)(v5 + 64)) {
      unint64_t v12 = *(void *)(v5 + 64);
    }
    if (v11 > v12) {
      unint64_t v12 = v11;
    }
    if (v10 <= v12) {
      unint64_t v10 = v12;
    }
    a1[v10] = a2;
  }
}

uint64_t sub_232E0CB94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t _s12PayloadErrorVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_232E0CBD0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_232E0CC1C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_232E0CCA0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_retain();
  swift_release();
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

uint64_t sub_232E0CD4C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v4;
  swift_release();
  return a1;
}

uint64_t sub_232E0CDBC(uint64_t a1, int a2)
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

uint64_t sub_232E0CE04(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for ShellConnectionSender()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_232E0CE6C()
{
  type metadata accessor for ShellConnectionMessage();
  uint64_t v1 = sub_232E33478();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_232E0CF10()
{
  return sub_232E33468();
}

uint64_t sub_232E0CF84(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_232E0CF94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_232E0CFFC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_232E0D014(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E0D104(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))sub_232E08E54);
}

uint64_t objectdestroy_4Tm()
{
  type metadata accessor for ShellConnectionMessage();
  uint64_t v1 = sub_232E33478();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + v6);

  return MEMORY[0x270FA0238](v0, v6 + 40, v5);
}

uint64_t sub_232E0D0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E0D104(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))sub_232E089E0);
}

uint64_t sub_232E0D104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = *(void *)(v4 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  type metadata accessor for ShellConnectionMessage();
  uint64_t v10 = *(void *)(sub_232E33478() - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v12 = (*(void *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = *(void *)(v4 + v12);

  return a4(a1, a2, a3, v4 + v11, v13, v4 + ((v12 + 15) & 0xFFFFFFFFFFFFFFF8), v8, v9);
}

uint64_t sub_232E0D204()
{
  return sub_232E0D2C0();
}

uint64_t objectdestroy_10Tm()
{
  type metadata accessor for ShellConnectionMessage();
  uint64_t v1 = sub_232E33478();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_232E0D2C0()
{
  return sub_232E08868();
}

uint64_t sub_232E0D354()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E0D38C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E15D38(a1, a2, a3);
}

uint64_t sub_232E0D3B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E15A60(a1, a2, a3);
}

uint64_t sub_232E0D3D4(uint64_t a1, uint64_t a2)
{
  return sub_232E156B0(a1, a2);
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_232E0D448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for ShellConnectionReceiver(void *a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[2]) {
    uint64_t result = swift_release();
  }
  if (a1[4]) {
    uint64_t result = swift_release();
  }
  if (a1[6]) {
    uint64_t result = swift_release();
  }
  if (a1[8])
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for ShellConnectionReceiver(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2 + 2;
  uint64_t v5 = a2[2];
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  uint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v10 = a2[6];
  if (v10)
  {
    uint64_t v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  uint64_t v12 = a2[8];
  if (v12)
  {
    uint64_t v13 = a2[9];
    a1[8] = v12;
    a1[9] = v13;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  return a1;
}

void *assignWithCopy for ShellConnectionReceiver(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      uint64_t v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      uint64_t v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v10 = a2[6];
  if (a1[6])
  {
    if (v10)
    {
      uint64_t v11 = a2[7];
      a1[6] = v10;
      a1[7] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[7];
    a1[6] = v10;
    a1[7] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v13 = a2[8];
  if (!a1[8])
  {
    if (v13)
    {
      uint64_t v15 = a2[9];
      a1[8] = v13;
      a1[9] = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v14 = a2[9];
  a1[8] = v13;
  a1[9] = v14;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *assignWithTake for ShellConnectionReceiver(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      uint64_t v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    uint64_t v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  uint64_t v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      uint64_t v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  uint64_t v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      uint64_t v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v14 = a2[8];
  if (!a1[8])
  {
    if (v14)
    {
      uint64_t v16 = a2[9];
      a1[8] = v14;
      a1[9] = v16;
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_28;
  }
  uint64_t v15 = a2[9];
  a1[8] = v14;
  a1[9] = v15;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellConnectionReceiver(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShellConnectionReceiver(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellConnectionReceiver()
{
  return &type metadata for ShellConnectionReceiver;
}

uint64_t sub_232E0D9EC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_232E0DA08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F564B0](a2, a3);
}

uint64_t sub_232E0DA14()
{
  return sub_232E32BE8();
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.streamID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_232E32AA8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.agentPid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity() + 20));
}

uint64_t type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity()
{
  uint64_t result = qword_26874FAB8;
  if (!qword_26874FAB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.init(streamID:agentPid:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_232E32AA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
  *(_DWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_232E0DB80(char a1)
{
  if (a1) {
    return 0x646950746E656761;
  }
  else {
    return 0x44496D6165727473;
  }
}

uint64_t sub_232E0DBB0(char *a1, char *a2)
{
  return sub_232E24CB0(*a1, *a2);
}

uint64_t sub_232E0DBBC()
{
  return sub_232E25128();
}

uint64_t sub_232E0DBC4()
{
  return sub_232E25C98();
}

uint64_t sub_232E0DBCC()
{
  return sub_232E26194();
}

uint64_t sub_232E0DBD4@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_232E33648();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_232E0DC34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E0DB80(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E0DC60()
{
  return sub_232E0DB80(*v0);
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.propertyListValue.getter()
{
  return sub_232E32E58();
}

uint64_t sub_232E0DCA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FAD0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FAD8);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = &v19[-v10];
  uint64_t v12 = &v19[*(int *)(v6 + 56) - v10];
  v19[-v10] = 0;
  uint64_t v13 = sub_232E32AA8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v14 + 16);
  v15(v12, a1, v13);
  int v20 = *(_DWORD *)(a1 + *(int *)(type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity() + 20));
  uint64_t v16 = &v9[*(int *)(v6 + 56)];
  unsigned char *v9 = 0;
  v15(v16, (uint64_t)v12, v13);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 32))(v4, v16, v13);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
  char v24 = 0;
  char v23 = 1;
  int v21 = v20;
  char v22 = 0;
  sub_232E0E158();
  uint64_t v17 = sub_232E33078();
  sub_232E02EA0((uint64_t)v4, &qword_26874FAD0);
  sub_232E02EA0((uint64_t)v11, &qword_26874FAD8);
  return v17;
}

uint64_t sub_232E0DF0C()
{
  return sub_232E0DCA4(*(void *)(v0 + 16));
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_232E32AA8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key;
  unint64_t v9 = sub_232E0E158();
  unint64_t v17 = v9;
  v15[0] = 0;
  sub_232E32DF8();
  if (v2)
  {
    uint64_t v10 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    uint64_t v16 = &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key;
    unint64_t v17 = v9;
    v15[0] = 1;
    sub_232E32DF8();
    uint64_t v12 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    int v13 = v14[1];
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
    uint64_t result = type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
    *(_DWORD *)(a2 + *(int *)(result + 20)) = v13;
  }
  return result;
}

unint64_t sub_232E0E158()
{
  unint64_t result = qword_26874FA78;
  if (!qword_26874FA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FA78);
  }
  return result;
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.hash(into:)()
{
  return sub_232E33758();
}

BOOL static ShellAgentSystem.AgentEndpoint.Identity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_232E32A98() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
  return *(_DWORD *)(a1 + *(int *)(v4 + 20)) == *(_DWORD *)(a2 + *(int *)(v4 + 20));
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.hashValue.getter()
{
  return sub_232E33768();
}

uint64_t sub_232E0E32C()
{
  return sub_232E33768();
}

uint64_t sub_232E0E3D0()
{
  return sub_232E33758();
}

uint64_t sub_232E0E45C()
{
  return sub_232E33768();
}

uint64_t sub_232E0E4FC()
{
  return sub_232E32E58();
}

uint64_t sub_232E0E538@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ShellAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)(a1, a2);
}

BOOL sub_232E0E550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_232E32A98() & 1) != 0 && *(_DWORD *)(a1 + *(int *)(a3 + 20)) == *(_DWORD *)(a2 + *(int *)(a3 + 20));
}

void sub_232E0E5A4()
{
  qword_26874FA68 = 0x747865746E6F63;
  unk_26874FA70 = 0xE700000000000000;
}

uint64_t static ShellAgentSystem.AgentEndpoint.encode(context:)()
{
  return sub_232E32E68();
}

uint64_t sub_232E0E66C(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_26874F4E8 != -1) {
    swift_once();
  }
  uint64_t v6 = unk_26874FA70;
  *a1 = qword_26874FA68;
  a1[1] = v6;
  uint64_t v7 = sub_232E32C58();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a3, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);

  return swift_bridgeObjectRetain();
}

uint64_t sub_232E0E770(void *a1, uint64_t a2)
{
  return sub_232E0E66C(a1, a2, *(void *)(v2 + 16));
}

uint64_t static ShellAgentSystem.AgentEndpoint.decode(context:)()
{
  if (qword_26874F4E8 != -1) {
    swift_once();
  }
  v1[3] = MEMORY[0x263F8D310];
  v1[4] = MEMORY[0x263F60640];
  v1[0] = qword_26874FA68;
  v1[1] = unk_26874FA70;
  sub_232E32C58();
  sub_232E0EA10(&qword_26874FA88, MEMORY[0x263F60A78]);
  swift_bridgeObjectRetain();
  sub_232E32DF8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v1);
}

uint64_t sub_232E0E880()
{
  return MEMORY[0x263F60440];
}

uint64_t sub_232E0E88C()
{
  return sub_232E0EA10(&qword_26874FA80, MEMORY[0x263F07508]);
}

unint64_t sub_232E0E8D8()
{
  unint64_t result = qword_26874FA90;
  if (!qword_26874FA90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FA90);
  }
  return result;
}

uint64_t sub_232E0E92C()
{
  return sub_232E0EA10(&qword_26874FA98, (void (*)(uint64_t))type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_232E0E974()
{
  return MEMORY[0x263F604F8];
}

uint64_t sub_232E0E980()
{
  return sub_232E0EA10(&qword_26874FAA0, (void (*)(uint64_t))type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_232E0E9C8()
{
  return sub_232E0EA10(&qword_26874FAA8, (void (*)(uint64_t))type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_232E0EA10(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_232E0EA5C()
{
  unint64_t result = qword_26874FAB0;
  if (!qword_26874FAB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FAB0);
  }
  return result;
}

uint64_t sub_232E0EAB0()
{
  return sub_232E32E68();
}

uint64_t sub_232E0EB54()
{
  if (qword_26874F4E8 != -1) {
    swift_once();
  }
  v1[3] = MEMORY[0x263F8D310];
  v1[4] = MEMORY[0x263F60640];
  v1[0] = qword_26874FA68;
  v1[1] = unk_26874FA70;
  sub_232E32C58();
  sub_232E0EA10(&qword_26874FA88, MEMORY[0x263F60A78]);
  swift_bridgeObjectRetain();
  sub_232E32DF8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v1);
}

ValueMetadata *type metadata accessor for ShellAgentSystem()
{
  return &type metadata for ShellAgentSystem;
}

ValueMetadata *type metadata accessor for ShellAgentSystem.ShellEndpoint()
{
  return &type metadata for ShellAgentSystem.ShellEndpoint;
}

ValueMetadata *type metadata accessor for ShellAgentSystem.AgentEndpoint()
{
  return &type metadata for ShellAgentSystem.AgentEndpoint;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellAgentSystem.AgentEndpoint.Identity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_232E32AA8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1)
{
  uint64_t v2 = sub_232E32AA8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32AA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32AA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32AA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32AA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_232E0EFC0);
}

uint64_t sub_232E0EFC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_232E32AA8();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_232E0F040);
}

uint64_t sub_232E0F040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_232E32AA8();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_232E0F0B0()
{
  uint64_t result = sub_232E32AA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ShellAgentSystem.AgentEndpoint.Identity.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x232E0F214);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity.Key()
{
  return &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key;
}

unint64_t sub_232E0F250()
{
  unint64_t result = qword_26874FAC8;
  if (!qword_26874FAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FAC8);
  }
  return result;
}

unint64_t sub_232E0F2AC(uint64_t a1)
{
  unint64_t result = sub_232E0F2D4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_232E0F2D4()
{
  unint64_t result = qword_26874FAE0;
  if (!qword_26874FAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FAE0);
  }
  return result;
}

unint64_t sub_232E0F328(uint64_t a1)
{
  unint64_t result = sub_232E0F350();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_232E0F350()
{
  unint64_t result = qword_26874FAE8;
  if (!qword_26874FAE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FAE8);
  }
  return result;
}

uint64_t sub_232E0F3A4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_232E0F3BC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_232E0F408(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FC90);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_232E33418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  unint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  id v10 = v2;
  swift_retain();
  sub_232E10170((uint64_t)v7, (uint64_t)&unk_26874FD80, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_232E0F51C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  v6[11] = *MEMORY[0x263F8EED0] & *a4;
  uint64_t v7 = sub_232E332F8();
  v6[12] = v7;
  v6[13] = *(void *)(v7 - 8);
  v6[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_232E0F618, 0, 0);
}

uint64_t sub_232E0F618()
{
  uint64_t v1 = *(void *)(v0[8] + qword_26874FAF8);
  v0[15] = v1;
  _OWORD v0[5] = type metadata accessor for ServiceHubPipeService.ServiceHubTransport();
  v0[6] = swift_getWitnessTable();
  v0[2] = v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[16] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_232E0F71C;
  return MEMORY[0x270F56058](v0 + 2);
}

uint64_t sub_232E0F71C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    int v3 = sub_232E0F8D8;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 16);
    int v3 = sub_232E0F838;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_232E0F838()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = (void (*)(uint64_t (*)(void *), uint64_t))v0[9];
  swift_retain();
  v2(sub_232E12E7C, v1);
  swift_release();
  swift_task_dealloc();
  int v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_232E0F8D8()
{
  uint64_t v1 = (void *)v0[17];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  sub_232E332B8();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_232E332D8();
  os_log_type_t v5 = sub_232E33518();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[17];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[7] = v10;
    sub_232E33568();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_232DFE000, v4, v5, "Failed to attach host transport to message pipe: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874FEF0);
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v8, -1, -1);
    MEMORY[0x237DB3E80](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[17];
  }
  uint64_t v12 = (void *)v0[17];
  uint64_t v14 = v0[13];
  uint64_t v13 = v0[14];
  uint64_t v15 = v0[12];

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  sub_232E0FF00();

  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_232E0FAD0(void *a1)
{
  id v29 = a1;
  v27[1] = *v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCC0);
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  os_log_type_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD90);
  uint64_t v6 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[0] = v1;
  id v9 = (char *)v1 + qword_26874FBE8;
  uint64_t v10 = *(int *)(v3 + 56);
  uint64_t v11 = &v5[v10];
  uint64_t v12 = (char *)v1 + qword_26874FBE8 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCD0);
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v5, v9, v13);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCD8);
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v12, v15);
  v31[0] = v29;
  v29;
  sub_232E33458();
  uint64_t v17 = v28;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v13);
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v8, v17) != *MEMORY[0x263F8F550]) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  uint64_t v30 = v27[0];
  swift_getWitnessTable();
  sub_232E32D38();
  uint64_t v18 = v32;
  size_t v19 = __swift_project_boxed_opaque_existential_1(v31, v32);
  uint64_t v20 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v19);
  char v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v22);
  uint64_t v23 = sub_232E33668();
  if (v23)
  {
    char v24 = (void *)v23;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v18);
  }
  else
  {
    char v24 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v26, v22, v18);
  }
  sub_232E21798(v24);

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
}

uint64_t sub_232E0FF00()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FC90);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_232E32F68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = *(void *)&v0[qword_26874FAF8];
  type metadata accessor for ServiceHubPipeService.ServiceHubTransport();
  swift_retain();
  swift_getWitnessTable();
  sub_232E32F58();
  sub_232E32F38();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_release();
  uint64_t v9 = sub_232E33418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v1;
  id v11 = v1;
  sub_232E10170((uint64_t)v4, (uint64_t)&unk_26874FD70, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_232E10170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E33418();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_232E33408();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_232E02EA0(a1, &qword_26874FC90);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_232E333F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_232E1031C(void *a1, int a2, void *a3)
{
  return sub_232E106C4(a1, a2, a3, (uint64_t)&unk_26E694978, (uint64_t)sub_232E12D64, (void (*)(uint64_t, uint64_t))sub_232E0F408);
}

uint64_t sub_232E10354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_232E10374, 0, 0);
}

uint64_t sub_232E10374()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_232E10440;
  return MEMORY[0x270F56070]("/Library/Caches/com.apple.xbs/Sources/UITestingAgent/OS/PreviewsOSSupport/Sources/PreviewsOSSupport/ServiceHubPipeService.swift", 127, 2, 43, 39, "cancel()", 8, 2);
}

uint64_t sub_232E10440()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_232E10534(void *a1)
{
  id v1 = a1;
  sub_232E0FF00();
}

uint64_t sub_232E1057C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  type metadata accessor for ServiceHubPipeService.ServiceHubTransport();
  swift_retain();
  swift_retain();
  swift_getWitnessTable();
  sub_232E330D8();
  swift_release();
  return swift_release();
}

uint64_t sub_232E10690(void *a1, int a2, void *a3)
{
  return sub_232E106C4(a1, a2, a3, (uint64_t)&unk_26E694900, (uint64_t)sub_232E12C4C, (void (*)(uint64_t, uint64_t))sub_232E1057C);
}

uint64_t sub_232E106C4(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);

  return swift_release();
}

void sub_232E10758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v14[0] = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v14 - v7;
  uint64_t v9 = sub_232E32C28();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E11B4C();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_232E12E80(a2, (uint64_t)v8, &qword_26874FCB8);
  uint64_t v13 = sub_232E109E8((uint64_t)v12, (uint64_t)v8);
  ((void (*)(void))v14[0])();
}

void *sub_232E109E8(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a2;
  uint64_t v4 = sub_232E32BA8();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  uint64_t v5 = *(void *)(v33 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)sub_232E32E88();
  uint64_t v10 = *(v9 - 1);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v35 = a1;
  sub_232E32C08();
  if (v2)
  {

    sub_232E02EA0(v37, &qword_26874FCB8);
    uint64_t v14 = sub_232E32C28();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v35, v14);
  }
  else
  {
    id v32 = v13;
    sub_232E32E28();
    (*(void (**)(char *, void *))(v10 + 8))(v12, v9);
    uint64_t v15 = (void *)sub_232E33308();
    swift_bridgeObjectRelease();
    uint64_t v16 = v37;
    sub_232E12E80(v37, (uint64_t)v8, &qword_26874FCB8);
    uint64_t v17 = v33;
    int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v8, 1, v34);
    uint64_t v19 = v35;
    if (v18 == 1)
    {
      sub_232E02EA0((uint64_t)v8, &qword_26874FCB8);
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
      uint64_t v31 = v15;
      uint64_t v22 = v34;
      v21((char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8, v34);
      uint64_t v23 = v19;
      unint64_t v24 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      uint64_t v25 = swift_allocObject();
      unint64_t v26 = v25 + v24;
      uint64_t v19 = v23;
      uint64_t v16 = v37;
      (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(v26, (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
      uint64_t v27 = v22;
      uint64_t v15 = v31;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v27);
      aBlock[4] = sub_232E12F74;
      aBlock[5] = v25;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_232E11C58;
      aBlock[3] = &block_descriptor_1;
      uint64_t v20 = _Block_copy(aBlock);
      swift_release();
    }
    uint64_t v9 = objc_msgSend(v32, sel_initWithMessageType_payload_replyHandler_, 0, v15, v20);
    _Block_release(v20);

    sub_232E02EA0(v16, &qword_26874FCB8);
    uint64_t v28 = sub_232E32C28();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(v19, v28);
  }
  return v9;
}

uint64_t sub_232E10E18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  uint64_t v7 = sub_232E32E88();
  v6[12] = v7;
  v6[13] = *(void *)(v7 - 8);
  v6[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  v6[15] = swift_task_alloc();
  uint64_t v8 = sub_232E32C28();
  v6[16] = v8;
  v6[17] = *(void *)(v8 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCC0);
  v6[20] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCC8);
  v6[21] = v9;
  v6[22] = *(void *)(v9 - 8);
  v6[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_232E10FFC, 0, 0);
}

uint64_t sub_232E10FFC()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[9] + qword_26874FBE8;
  uint64_t v3 = *(int *)(v0[19] + 48);
  uint64_t v4 = v1 + v3;
  uint64_t v5 = v2 + v3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCD0);
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v1, v2, v6);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCD8);
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, v5, v8);
  sub_232E33488();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  uint64_t v10 = (void *)swift_task_alloc();
  v0[24] = v10;
  void *v10 = v0;
  v10[1] = sub_232E111E4;
  uint64_t v11 = v0[21];
  return MEMORY[0x270FA1F68](v0 + 6, 0, 0, v11);
}

uint64_t sub_232E111E4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_232E112E0, 0, 0);
}

uint64_t sub_232E112E0()
{
  uint64_t v1 = *(void **)(v0 + 48);
  if (v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 48), sel_payload);
    if (v2
      && (*(void *)(v0 + 56) = v2,
          __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD50),
          __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD58),
          swift_dynamicCast()))
    {
      uint64_t v4 = *(void *)(v0 + 104);
      uint64_t v3 = *(void *)(v0 + 112);
      uint64_t v5 = *(void *)(v0 + 96);
      sub_232E32E18();
      sub_232E32DC8();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
      id v6 = objc_msgSend(v1, sel_replyHandler);
      uint64_t v7 = *(void *)(v0 + 120);
      if (v6)
      {
        id v8 = v6;
        uint64_t v9 = swift_allocObject();
        *(void *)(v9 + 16) = v8;
        uint64_t v10 = swift_allocObject();
        *(void *)(v10 + 16) = sub_232E12B24;
        *(void *)(v10 + 24) = v9;
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = sub_232E12B64;
        *(void *)(v11 + 24) = v10;
        uint64_t v12 = swift_allocObject();
        *(void *)(v12 + 16) = sub_232E12B94;
        *(void *)(v12 + 24) = v11;
        swift_retain();
        sub_232E32B48();
        uint64_t v13 = sub_232E32BA8();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
        swift_release();
      }
      else
      {
        uint64_t v21 = sub_232E32BA8();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v7, 1, 1, v21);
      }
      uint64_t v23 = *(void *)(v0 + 136);
      uint64_t v22 = *(void *)(v0 + 144);
      uint64_t v25 = *(void *)(v0 + 120);
      uint64_t v24 = *(void *)(v0 + 128);
      (*(void (**)(uint64_t, uint64_t))(v0 + 80))(v22, v25);

      sub_232E02EA0(v25, &qword_26874FCB8);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    else
    {
      id v14 = objc_msgSend(v1, sel_payload);
      if (v14)
      {
        id v15 = v14;
        *(void *)(v0 + 40) = swift_getObjectType();
        *(void *)(v0 + 16) = v15;
      }
      else
      {
        *(_OWORD *)(v0 + 16) = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      sub_232E12A98();
      int v18 = (void *)swift_allocError();
      uint64_t v20 = v19;
      sub_232E1300C(v0 + 16, v19, (uint64_t *)&unk_268750230);
      *(unsigned char *)(v20 + 32) = 0;
      swift_willThrow();
      sub_232E21798(v18);
    }
    unint64_t v26 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v26;
    *unint64_t v26 = v0;
    v26[1] = sub_232E111E4;
    uint64_t v27 = *(void *)(v0 + 168);
    return MEMORY[0x270FA1F68](v0 + 48, 0, 0, v27);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 168));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

uint64_t sub_232E11720()
{
  swift_release();
  swift_release();
  sub_232E02EA0(v0 + qword_26874FBE8, &qword_26874FCC0);
  return v0;
}

uint64_t sub_232E11760()
{
  uint64_t v0 = sub_232E11720();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_232E117B4(uint64_t a1, uint64_t a2)
{
  return sub_232E126C4(a1, a2);
}

uint64_t sub_232E117D8()
{
  uint64_t v2 = *v0;
  uint64_t v4 = *(void *)(*v0 + 24);
  uint64_t v3 = *(void *)(v2 + 32);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  swift_retain();
  return sub_232E11C40(v5, v1, v4, v3);
}

uint64_t sub_232E1187C()
{
  return swift_retain();
}

unint64_t sub_232E11888()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_232E118A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F55BD0](a1, a2, a3, WitnessTable);
}

void sub_232E11910()
{
}

id _s17PreviewsOSSupport19CrashReportListenerCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_232E1198C()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t type metadata accessor for ServiceHubPipeService()
{
  return __swift_instantiateGenericMetadata();
}

void sub_232E11A00()
{
  uint64_t v3 = MEMORY[0x263F8CF88] + 64;
  uint64_t v4 = MEMORY[0x263F8EE70] + 64;
  sub_232E11B8C(319, &qword_26874FC70, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_232E11B8C(319, (unint64_t *)&unk_26874FC80, MEMORY[0x263F8F590]);
    if (v1 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      uint64_t v5 = &v2;
      swift_initClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for ServiceHubPipeService.ServiceHubTransport()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_232E11B4C()
{
  unint64_t result = qword_26874FC78;
  if (!qword_26874FC78)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26874FC78);
  }
  return result;
}

void sub_232E11B8C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_232E11B4C();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_232E11BEC()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E11C08()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E11C24()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E11C40(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_232E11C58(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_232E11CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_232E329E8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_232E11D48(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD98);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874FDA0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  id v14 = (char *)&v18 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v18 - v15;
  sub_232E11F88(a1, a2, &v19);
  swift_storeEnumTagMultiPayload();
  sub_232E1300C((uint64_t)v11, (uint64_t)v14, (uint64_t *)&unk_26874FDA0);
  sub_232E1300C((uint64_t)v14, (uint64_t)v16, (uint64_t *)&unk_26874FDA0);
  sub_232E32B68();
  sub_232E32DB8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_232E02EA0((uint64_t)v16, (uint64_t *)&unk_26874FDA0);
}

uint64_t sub_232E11F88(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = sub_232E32E88();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    *(void *)&long long v23 = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD58);
    if (swift_dynamicCast())
    {
      sub_232E32E18();
      sub_232E32DC8();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    if (a2) {
      goto LABEL_7;
    }
    *((void *)&v24 + 1) = swift_getObjectType();
    *(void *)&long long v23 = a1;
  }
  else
  {
    if (a2)
    {
LABEL_7:
      swift_getErrorValue();
      id v11 = a2;
      sub_232E336D8();
      uint64_t v12 = *((void *)&v24 + 1);
      uint64_t v13 = __swift_project_boxed_opaque_existential_1(&v23, *((uint64_t *)&v24 + 1));
      uint64_t v14 = *(void *)(v12 - 8);
      MEMORY[0x270FA5388](v13);
      uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v14 + 16))(v16);
      uint64_t v17 = sub_232E33668();
      if (v17)
      {
        uint64_t v18 = v17;
        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
      }
      else
      {
        uint64_t v18 = swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v19, v16, v12);
      }
      swift_willThrow();

      uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v23);
      goto LABEL_13;
    }
    long long v23 = 0u;
    long long v24 = 0u;
  }
  sub_232E12A98();
  uint64_t v18 = swift_allocError();
  uint64_t v21 = v20;
  sub_232E1300C((uint64_t)&v23, v20, (uint64_t *)&unk_268750230);
  *(unsigned char *)(v21 + 32) = 1;
  swift_unknownObjectRetain();
  uint64_t result = swift_willThrow();
LABEL_13:
  *a3 = v18;
  return result;
}

uint64_t sub_232E122B0(uint64_t a1, void (*a2)(void *, void *))
{
  uint64_t v4 = sub_232E32E88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD60);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (void **)((char *)&v16[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_232E12E80(a1, (uint64_t)v10, &qword_26874FD60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v11 = *v10;
    swift_getErrorValue();
    sub_232E336D8();
    __swift_project_boxed_opaque_existential_1(v16, v16[3]);
    uint64_t v12 = (void *)sub_232E33008();
    a2(0, v12);

    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_232E32E28();
    uint64_t v14 = (void *)sub_232E33308();
    swift_bridgeObjectRelease();
    a2(v14, 0);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_232E124F0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_232E125CC;
  return v6(a1);
}

uint64_t sub_232E125CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_232E126C4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FC90);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_232E33418();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  swift_retain();
  sub_232E10170((uint64_t)v7, (uint64_t)&unk_26874FCA0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_232E127DC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_232E12824(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_232E128EC;
  return sub_232E10E18(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_232E128EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_232E129E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_232E128EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26874FCA8 + dword_26874FCA8);
  return v6(a1, v4);
}

unint64_t sub_232E12A98()
{
  unint64_t result = qword_26874FCE0;
  if (!qword_26874FCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FCE0);
  }
  return result;
}

uint64_t sub_232E12AEC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_232E12B24(uint64_t a1, uint64_t a2)
{
  sub_232E11CD8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_232E12B2C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E12B64(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

uint64_t sub_232E12B94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_232E12BD0(uint64_t a1)
{
  return sub_232E122B0(a1, *(void (**)(void *, void *))(v1 + 16));
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_232E12C1C()
{
}

uint64_t sub_232E12C4C()
{
  return sub_232E2178C(*(void *)(v0 + 16));
}

uint64_t sub_232E12C54()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_232E12C7C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E12CBC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_232E13088;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_232E10374, 0, 0);
}

uint64_t sub_232E12D64(uint64_t a1, uint64_t a2)
{
  return sub_232E216CC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_232E12D6C()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_232E12DB4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (void *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_232E13088;
  return sub_232E0F51C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_232E12E80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_232E12EE4()
{
  uint64_t v1 = sub_232E32BA8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_232E12F74(uint64_t a1, void *a2)
{
  sub_232E32BA8();

  return sub_232E11D48(a1, a2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_232E1300C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t ShellService.Domain.machName(for:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FDB0);
  uint64_t v3 = MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v1;
  uint64_t v7 = &v5[*(int *)(v3 + 56)];
  *uint64_t v5 = v6;
  uint64_t v8 = sub_232E32AB8();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  switch(v6)
  {
    case 1:
      unint64_t v11 = 0xD000000000000034;
      int v14 = (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 88))(v7, v8);
      if (v14 == *MEMORY[0x263F60F68])
      {
        unint64_t v11 = 0xD000000000000030;
      }
      else if (v14 != *MEMORY[0x263F60F60])
      {
        goto LABEL_17;
      }
      break;
    case 2:
      unint64_t v11 = 0xD000000000000034;
      int v12 = (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 88))(v7, v8);
      if (v12 != *MEMORY[0x263F60F68])
      {
        if (v12 != *MEMORY[0x263F60F60]) {
          goto LABEL_17;
        }
        unint64_t v11 = 0xD000000000000035;
      }
      break;
    case 3:
      unint64_t v11 = 0xD000000000000034;
      int v13 = (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 88))(v7, v8);
      if (v13 == *MEMORY[0x263F60F68])
      {
        unint64_t v11 = 0xD000000000000030;
      }
      else if (v13 != *MEMORY[0x263F60F60])
      {
        goto LABEL_17;
      }
      break;
    default:
      int v10 = (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 88))(v7, v8);
      if (v10 == *MEMORY[0x263F60F68])
      {
        unint64_t v11 = 0xD000000000000027;
      }
      else if (v10 == *MEMORY[0x263F60F60])
      {
        unint64_t v11 = 0xD00000000000002BLL;
      }
      else
      {
LABEL_17:
        sub_232E13354((uint64_t)v5);
        unint64_t v11 = 0x6E776F6E6B6E75;
      }
      break;
  }
  return v11;
}

uint64_t sub_232E13354(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FDB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t ShellService.serviceIdentifier.getter()
{
  unint64_t result = 0xD000000000000022;
  switch(*v0)
  {
    case 2:
    case 7:
      return result;
    case 3:
      unint64_t result = 0xD000000000000023;
      break;
    case 6:
    case 8:
    case 9:
      unint64_t result = 0xD000000000000028;
      break;
    default:
      unint64_t result = 0xD000000000000019;
      break;
  }
  return result;
}

uint64_t ShellService.instanceIdentifier.getter()
{
  int v1 = *v0;
  unsigned int v2 = v1 - 2;
  BOOL v3 = (v1 & 1) == 0;
  uint64_t v4 = 0x65732D746E656761;
  if (v3) {
    uint64_t v4 = 0x7265732D74736F68;
  }
  if (v2 >= 8) {
    return v4;
  }
  else {
    return 0;
  }
}

BOOL static ShellService.Instance.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ShellService.Instance.hash(into:)()
{
  return sub_232E33748();
}

uint64_t ShellService.Instance.hashValue.getter()
{
  return sub_232E33768();
}

unint64_t ShellService.description.getter()
{
  unint64_t result = 0xD000000000000015;
  switch(*v0)
  {
    case 2:
    case 7:
      return result;
    case 3:
      unint64_t result = 0xD000000000000016;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
    case 6:
    case 8:
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      sub_232E335C8();
      swift_bridgeObjectRelease();
      sub_232E333A8();
      swift_bridgeObjectRelease();
      unint64_t result = 0xD00000000000001CLL;
      break;
  }
  return result;
}

BOOL static ShellService.Domain.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ShellService.Domain.hash(into:)()
{
  return sub_232E33748();
}

uint64_t ShellService.Domain.hashValue.getter()
{
  return sub_232E33768();
}

BOOL sub_232E13794(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t ShellService.domainIdentifier.getter()
{
  unsigned int v1 = *v0;
  if (v1 == 5) {
    unint64_t v2 = 0xD000000000000028;
  }
  else {
    unint64_t v2 = 0xD000000000000027;
  }
  if (v1 == 4) {
    unint64_t v2 = 0xD000000000000027;
  }
  if (((1 << v1) & 0x3CC) != 0) {
    unint64_t v3 = 0xD00000000000001ELL;
  }
  else {
    unint64_t v3 = v2;
  }
  if (v1 <= 9) {
    return v3;
  }
  else {
    return 0xD000000000000027;
  }
}

uint64_t ShellService.Instance.description.getter()
{
  if (*v0) {
    return 0x697320746E656761;
  }
  else {
    return 0x6469732074736F68;
  }
}

unint64_t sub_232E13884()
{
  unint64_t result = qword_26874FDB8;
  if (!qword_26874FDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FDB8);
  }
  return result;
}

unint64_t sub_232E138DC()
{
  unint64_t result = qword_26874FDC0;
  if (!qword_26874FDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FDC0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ShellService(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF7)
  {
    unsigned int v2 = a2 + 9;
    if (a2 + 9 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 9;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 9;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x232E139E0);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 9;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 2) {
    unsigned int v8 = v7 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 9) {
    return v8 - 8;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for ShellService(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 9;
  if (a3 + 9 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xF7) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v7 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x232E13AC8);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

uint64_t sub_232E13AF0(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_232E13B04(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellService()
{
  return &type metadata for ShellService;
}

unsigned char *storeEnumTagSinglePayload for ShellService.Instance(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E13BF0);
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

ValueMetadata *type metadata accessor for ShellService.Instance()
{
  return &type metadata for ShellService.Instance;
}

uint64_t getEnumTagSinglePayload for ShellService.Domain(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ShellService.Domain(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E13D84);
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

unsigned char *sub_232E13DAC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShellService.Domain()
{
  return &type metadata for ShellService.Domain;
}

uint64_t static JITSetupPayload.== infix(_:_:)()
{
  return 1;
}

uint64_t JITSetupPayload.hashValue.getter()
{
  return sub_232E33768();
}

uint64_t sub_232E13E18(uint64_t a1)
{
  return sub_232E13EE8(a1);
}

uint64_t JITSetupPayload.init(propertyListValue:)(uint64_t a1)
{
  return sub_232E13EE8(a1);
}

uint64_t sub_232E13E48()
{
  return sub_232E33768();
}

uint64_t sub_232E13E80()
{
  return sub_232E33768();
}

uint64_t sub_232E13EB4()
{
  return 1;
}

uint64_t sub_232E13EBC()
{
  return MEMORY[0x270F55E88](MEMORY[0x263F8EE78]);
}

uint64_t JITSetupReply.init(propertyListValue:)(uint64_t a1)
{
  return sub_232E13EE8(a1);
}

uint64_t sub_232E13EE8(uint64_t a1)
{
  uint64_t v2 = sub_232E32E88();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
}

unint64_t sub_232E13F48(uint64_t a1)
{
  unint64_t result = sub_232E13F70();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_232E13F70()
{
  unint64_t result = qword_26874FDC8;
  if (!qword_26874FDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FDC8);
  }
  return result;
}

unint64_t sub_232E13FC8()
{
  unint64_t result = qword_26874FDD0;
  if (!qword_26874FDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FDD0);
  }
  return result;
}

unint64_t sub_232E14020()
{
  unint64_t result = qword_26874FDD8;
  if (!qword_26874FDD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FDD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToJITBootstrapAgentInterface()
{
  return &type metadata for ShellToJITBootstrapAgentInterface;
}

ValueMetadata *type metadata accessor for JITSetupPayload()
{
  return &type metadata for JITSetupPayload;
}

ValueMetadata *type metadata accessor for JITSetupReply()
{
  return &type metadata for JITSetupReply;
}

uint64_t sub_232E140A4(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_232E32E88();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  void v1[5] = swift_task_alloc();
  uint64_t v3 = sub_232E32AB8();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_232E141C0, 0, 0);
}

uint64_t sub_232E141C0()
{
  int v12 = v0;
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  v11[0] = 0;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F60F68], v3);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  uint64_t v7 = sub_232E029D0(v11, v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  int v8 = (uint64_t *)v0[2];
  v8[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874F740);
  v8[4] = sub_232E03E14(&qword_268750200, (uint64_t *)&unk_26874F740);
  *int v8 = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_232E14348(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_232E32E88();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  void v1[5] = swift_task_alloc();
  uint64_t v3 = sub_232E32AB8();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_232E14464, 0, 0);
}

uint64_t sub_232E14464()
{
  int v12 = v0;
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];
  v11[0] = 4;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F60F68], v3);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  uint64_t v7 = sub_232E029D0(v11, v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  int v8 = (uint64_t *)v0[2];
  v8[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874F740);
  v8[4] = sub_232E03E14(&qword_268750200, (uint64_t *)&unk_26874F740);
  *int v8 = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

void *sub_232E145F0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FE20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E33158();
  swift_allocObject();
  v2[2] = sub_232E33148();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCC0);
  sub_232E11B4C();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F580], v5);
  sub_232E33428();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v2[3] = sub_232E156AC;
  v2[4] = v9;
  int v12 = v2;
  sub_232E03E14((unint64_t *)&unk_26874FE30, &qword_26874FDE8);
  swift_retain();
  swift_retain();
  sub_232E330D8();
  swift_release();
  swift_release();
  return v2;
}

void *sub_232E14870(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FE20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E33158();
  swift_allocObject();
  v2[2] = sub_232E33148();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCC0);
  sub_232E11B4C();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F580], v5);
  sub_232E33428();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  v2[3] = sub_232E15644;
  v2[4] = v9;
  int v12 = v2;
  sub_232E03E14(&qword_26874FE28, &qword_26874FE08);
  swift_retain();
  swift_retain();
  sub_232E330D8();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_232E14AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCC0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + qword_26874FBE8;
  uint64_t v8 = *(int *)(v4 + 56);
  uint64_t v9 = &v6[v8];
  uint64_t v10 = v7 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCD0);
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v6, v7, v11);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCD8);
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v9, v10, v13);
  sub_232E33468();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v6, v11);
}

id static _UVServiceHubServiceFactory.makeAgentPipeService(messageHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_26874FDE0);
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = qword_26874FAF0;
  sub_232E33068();
  swift_allocObject();
  swift_retain();
  uint64_t v7 = v5;
  char v10 = 2;
  *(void *)&v5[v6] = sub_232E33058();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FDE8);
  swift_allocObject();
  swift_retain();
  *(void *)&v7[qword_26874FAF8] = sub_232E145F0(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FDF0);
  *(void *)&v7[qword_26874FB00] = sub_232E32AD8();

  v11.receiver = v7;
  v11.super_class = v4;
  id v8 = objc_msgSendSuper2(&v11, sel_init, v10, 0, 0);
  swift_release();
  return v8;
}

id static _UVServiceHubServiceFactory.makeShellPipeService(messageHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_26874FE00);
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  uint64_t v6 = qword_26874FAF0;
  sub_232E33068();
  swift_allocObject();
  swift_retain();
  uint64_t v7 = v5;
  char v10 = 2;
  *(void *)&v5[v6] = sub_232E33058();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FE08);
  swift_allocObject();
  swift_retain();
  *(void *)&v7[qword_26874FAF8] = sub_232E14870(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874FE10);
  *(void *)&v7[qword_26874FB00] = sub_232E32AD8();

  v11.receiver = v7;
  v11.super_class = v4;
  id v8 = objc_msgSendSuper2(&v11, sel_init, v10, 0, 0);
  swift_release();
  return v8;
}

id static _UVServiceHubServiceFactory.makePreviewService()()
{
  uint64_t v1 = sub_232E32E88();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_232E32AB8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned __int8 v14 = 2;
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F60F68], v5);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  uint64_t v9 = sub_232E029D0(&v14, (uint64_t)v8, (uint64_t)v4);
  if (v0)
  {
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    uint64_t v11 = v9;
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    id v12 = objc_allocWithZone((Class)type metadata accessor for ServiceHubPreviewService());
    return sub_232E222F8(v11);
  }
}

id _UVServiceHubServiceFactory.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id _UVServiceHubServiceFactory.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _UVServiceHubServiceFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_232E15480(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t *a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = qword_26874FAF0;
  sub_232E33068();
  swift_allocObject();
  id v12 = v5;
  char v14 = 2;
  *(void *)&v5[v11] = sub_232E33058();
  __swift_instantiateConcreteTypeFromMangledName(a3);
  swift_allocObject();
  swift_retain();
  *(void *)&v12[qword_26874FAF8] = a4(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(a5);
  *(void *)&v12[qword_26874FB00] = sub_232E32AD8();

  v16.receiver = v12;
  v16.super_class = ObjectType;
  return objc_msgSendSuper2(&v16, sel_init, v14, 0, 0);
}

uint64_t type metadata accessor for _UVServiceHubServiceFactory()
{
  return self;
}

uint64_t sub_232E155F8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_232E15630()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_232E15644(uint64_t a1, uint64_t a2)
{
  sub_232E10758(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_232E1564C(uint64_t a1)
{
  return sub_232E14AF0(a1, v1);
}

uint64_t sub_232E15668()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E156B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_232E332F8();
  MEMORY[0x270FA5388](v4);
  sub_232E17474();
  swift_getObjectType();
  sub_232E175C0(a1, a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_232E15A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E332F8();
  MEMORY[0x270FA5388](v6);
  sub_232E17474();
  uint64_t ObjectType = swift_getObjectType();
  sub_232E17858(a1, a2, a3, ObjectType, 158, 104, (uint64_t)&block_descriptor_5, (SEL *)&selRef_sendXPCEndpoint_context_replyHandler_);

  return swift_unknownObjectRelease();
}

uint64_t sub_232E15D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E332F8();
  MEMORY[0x270FA5388](v6);
  sub_232E17474();
  uint64_t ObjectType = swift_getObjectType();
  sub_232E17858(a1, a2, a3, ObjectType, 162, 103, (uint64_t)&block_descriptor_2, (SEL *)&selRef_sendBSEndpoint_context_replyHandler_);

  return swift_unknownObjectRelease();
}

void sub_232E16010(_OWORD *a1)
{
  sub_232E18A60();
  uint64_t v2 = (_OWORD *)swift_allocObject();
  long long v3 = a1[3];
  v2[3] = a1[2];
  v2[4] = v3;
  v2[5] = a1[4];
  long long v5 = *a1;
  long long v4 = a1[1];
  v2[1] = *a1;
  v2[2] = v4;
  long long v25 = v5;
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 4);
  uint64_t v8 = *((void *)a1 + 6);
  uint64_t v21 = *((void *)a1 + 8);
  uint64_t v22 = (uint64_t)v2;
  uint64_t v9 = (_OWORD *)swift_allocObject();
  long long v10 = a1[3];
  v9[3] = a1[2];
  v9[4] = v10;
  v9[5] = a1[4];
  long long v11 = a1[1];
  v9[1] = *a1;
  v9[2] = v11;
  id v12 = (_OWORD *)swift_allocObject();
  long long v13 = a1[3];
  uint64_t v12[3] = a1[2];
  v12[4] = v13;
  v12[5] = a1[4];
  long long v14 = a1[1];
  v12[1] = *a1;
  v12[2] = v14;
  sub_232E18BA0((uint64_t)&v25);
  sub_232E0D9EC(v6);
  sub_232E0D9EC(v7);
  sub_232E0D9EC(v8);
  sub_232E0D9EC(v21);
  sub_232E18BA0((uint64_t)&v25);
  sub_232E0D9EC(v6);
  sub_232E0D9EC(v7);
  sub_232E0D9EC(v8);
  sub_232E0D9EC(v21);
  sub_232E18BA0((uint64_t)&v25);
  sub_232E0D9EC(v6);
  sub_232E0D9EC(v7);
  sub_232E0D9EC(v8);
  sub_232E0D9EC(v21);
  id v15 = sub_232E1697C((uint64_t)sub_232E18AA4, v22, (uint64_t)sub_232E18B14, (uint64_t)v9, (uint64_t)sub_232E18B98, (uint64_t)v12);
  objc_super v16 = *(void **)(v23 + 32);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v23;
  *(void *)(v17 + 24) = v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_232E18C0C;
  *(void *)(v18 + 24) = v17;
  aBlock[4] = sub_232E18C24;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232E0165C;
  aBlock[3] = &block_descriptor_66;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  id v20 = v15;
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_configureConnection_, v19);
  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v19)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v16, sel_activate);
    swift_release();
  }
}

uint64_t ShellConnection.invalidationHandle.getter()
{
  sub_232E18550();

  return swift_retain();
}

void ShellConnection.service.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 24);
}

uint64_t sub_232E16384(uint64_t a1, void (*a2)(uint64_t, char *))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_232E32BA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  a2(a1, v6);
  return sub_232E02EA0((uint64_t)v6, &qword_26874FCB8);
}

uint64_t sub_232E16468(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, char *))
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_232E32BA8();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a2, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  a3(a1, v8);
  return sub_232E02EA0((uint64_t)v8, &qword_26874FCB8);
}

uint64_t sub_232E16590()
{
  return sub_232E32CD8();
}

uint64_t sub_232E165FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 48);
  if (v11)
  {
    swift_retain();
    v11(a1, a2, a3);
    return sub_232E0CF84((uint64_t)v11);
  }
  else
  {
    long long v13 = *(_OWORD *)(a4 + 48);
    v17[2] = *(_OWORD *)(a4 + 32);
    v17[3] = v13;
    v17[4] = *(_OWORD *)(a4 + 64);
    long long v14 = *(_OWORD *)(a4 + 16);
    v17[0] = *(_OWORD *)a4;
    v17[1] = v14;
    uint64_t v15 = sub_232E32BA8();
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v10, a3, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    sub_232E189F8();
    sub_232E32CE8();
    return sub_232E02EA0((uint64_t)v10, &qword_26874FCB8);
  }
}

uint64_t sub_232E167C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 64);
  if (v11)
  {
    swift_retain();
    v11(a1, a2, a3);
    return sub_232E0CF84((uint64_t)v11);
  }
  else
  {
    long long v13 = *(_OWORD *)(a4 + 48);
    v17[2] = *(_OWORD *)(a4 + 32);
    v17[3] = v13;
    v17[4] = *(_OWORD *)(a4 + 64);
    long long v14 = *(_OWORD *)(a4 + 16);
    v17[0] = *(_OWORD *)a4;
    v17[1] = v14;
    uint64_t v15 = sub_232E32BA8();
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v10, a3, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    sub_232E189F8();
    sub_232E32CE8();
    return sub_232E02EA0((uint64_t)v10, &qword_26874FCB8);
  }
}

id sub_232E1697C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(void *)(v13 + 24) = a2;
  long long v25 = sub_232E1899C;
  uint64_t v26 = v13;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_232E181C8;
  long long v24 = &block_descriptor_11;
  long long v14 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  long long v25 = sub_232E189A4;
  uint64_t v26 = v15;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_232E18288;
  long long v24 = &block_descriptor_17;
  uint64_t v16 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = a6;
  long long v25 = sub_232E18CF0;
  uint64_t v26 = v17;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_232E18460;
  long long v24 = &block_descriptor_23;
  uint64_t v18 = _Block_copy(&v21);
  swift_retain();
  swift_release();
  id v19 = objc_msgSend(v12, sel_initWithMessageHandler_xpcEndpointHandler_bsEndpointHandler_, v14, v16, v18);
  swift_release();
  swift_release();
  swift_release();
  _Block_release(v18);
  _Block_release(v16);
  _Block_release(v14);
  return v19;
}

void sub_232E16BD8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)sub_232E33358();
  swift_bridgeObjectRelease();
  id v7 = UVShellConnectionInterface((uint64_t)v6);

  objc_msgSend(a1, sel_setInterface_, v7);
  id v8 = objc_msgSend(self, sel_userInteractive);
  objc_msgSend(a1, sel_setServiceQuality_, v8);

  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  uint64_t v15 = sub_232E18C2C;
  uint64_t v16 = a2;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_232E21788;
  long long v14 = &block_descriptor_69;
  uint64_t v9 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
  uint64_t v15 = sub_232E18C34;
  uint64_t v16 = a2;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_232E21788;
  long long v14 = &block_descriptor_72;
  uint64_t v10 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v10);
  _Block_release(v10);
}

uint64_t sub_232E16E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_232E32F68();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = a2;
  swift_getWitnessTable();
  sub_232E10350();
  sub_232E32F38();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_232E17000(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26874F6B0);
  sub_232E18C3C();
  sub_232E32F18();
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 88) + 8))(a1, *(void *)(v3 + 80));
}

uint64_t ShellConnection.sender.getter()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_232E1710C, 0, 0);
}

uint64_t sub_232E1710C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) + 40);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F540);
  *uint64_t v2 = v0;
  v2[1] = sub_232E171D0;
  uint64_t v4 = MEMORY[0x263F8EE60] + 8;
  uint64_t v5 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v3, v1, v4, v3, v5);
}

uint64_t sub_232E171D0()
{
  *(void *)(*(void *)v1 + 32) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_232E1736C;
  }
  else {
    uint64_t v2 = sub_232E172E4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_232E172E4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v3 = *(uint64_t (**)(void, uint64_t))(v0 + 8);
  swift_retain();
  return v3(sub_232E18A4C, v1);
}

uint64_t sub_232E1736C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ShellConnection.description.getter()
{
  uint64_t v1 = *v0;
  sub_232E335C8();
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(v1 + 88) + 24))();
  swift_bridgeObjectRelease();
  sub_232E333A8();
  ShellService.description.getter();
  sub_232E333A8();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_232E17474()
{
  if (objc_msgSend(*(id *)(v0 + 32), sel_remoteTarget))
  {
    sub_232E33588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_232E02E38((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874FF00);
    if (swift_dynamicCast()) {
      return v6;
    }
  }
  else
  {
    sub_232E02EA0((uint64_t)v4, (uint64_t *)&unk_268750230);
  }
  type metadata accessor for ShellConnection.RemoteTargetError();
  swift_getWitnessTable();
  swift_allocError();
  *uint64_t v2 = v0;
  swift_retain();
  return swift_willThrow();
}

void sub_232E175C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_232E32BA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E188FC(a2, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_232E02EA0((uint64_t)v7, &qword_26874FCB8);
    uint64_t v12 = (void *)sub_232E32C18();
    objc_msgSend(v3, sel_sendMessage_, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v13 = (void *)sub_232E32C18();
    aBlock[4] = sub_232E32B38();
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_232E17EBC;
    aBlock[3] = &block_descriptor_8;
    uint64_t v15 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v3, sel_sendMessage_replyHandler_, v13, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_232E17820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_232E1783C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_232E17858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, SEL *a8)
{
  uint64_t v11 = v8;
  uint64_t v13 = (void *)sub_232E32C18();
  void v16[4] = sub_232E32B38();
  v16[5] = v14;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = sub_232E17EBC;
  v16[3] = a7;
  uint64_t v15 = _Block_copy(v16);
  swift_release();
  objc_msgSend(v11, *a8, a1, v13, v15);
  _Block_release(v15);
}

uint64_t sub_232E1796C()
{
  return 0;
}

uint64_t sub_232E17A2C()
{
  return sub_232E1796C();
}

uint64_t sub_232E17A3C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F55A28](a1, WitnessTable);
}

uint64_t sub_232E17A90(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F55A08](a1, WitnessTable);
}

id *ShellConnection.deinit()
{
  uint64_t v1 = *v0;
  swift_release();

  swift_release();
  uint64_t v2 = (char *)v0 + qword_26874FE50;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874F6B0);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  (*(void (**)(char *))(*(void *)(v1[10] - 8) + 8))((char *)v0 + *((void *)*v0 + 17));
  return v0;
}

uint64_t ShellConnection.__deallocating_deinit()
{
  ShellConnection.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_232E17C1C(uint64_t a1, uint64_t a2)
{
  return _s17PreviewsOSSupport15ShellConnectionC8activate8receiver19interruptionHandleryy0A11MessagingOS16LazyPropertyListO_AG14TransportReplyVSgtYbc_yyYbctF_0(a1, a2);
}

uint64_t sub_232E17C40()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_232E17CE8;
  _OWORD v3[2] = v2;
  return MEMORY[0x270FA2498](sub_232E1710C, 0, 0);
}

uint64_t sub_232E17CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *v3;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  if (!v2)
  {
    uint64_t v6 = a1;
    uint64_t v7 = a2;
  }
  return v8(v6, v7);
}

uint64_t sub_232E17DF8()
{
  sub_232E18550();

  return swift_retain();
}

uint64_t sub_232E17E2C()
{
  return ShellConnection.description.getter();
}

uint64_t sub_232E17E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F55BD0](a1, a2, a3, WitnessTable);
}

void sub_232E17EBC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_232E17F48(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void, void), uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_232E32C28();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E33538();
  if (a2)
  {
    uint64_t v17 = swift_allocObject();
    v25[1] = a5;
    uint64_t v18 = a4;
    uint64_t v19 = v17;
    *(void *)(v17 + 16) = a2;
    *(void *)(v17 + 24) = a3;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = sub_232E12B64;
    *(void *)(v20 + 24) = v19;
    sub_232E0D9EC(a2);
    swift_retain();
    id v21 = a1;
    sub_232E32B58();
    uint64_t v22 = sub_232E32BA8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 0, 1, v22);
    a4 = v18;
    swift_release();
  }
  else
  {
    uint64_t v23 = sub_232E32BA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v12, 1, 1, v23);
  }
  a4(v16, v12);
  sub_232E02EA0((uint64_t)v12, &qword_26874FCB8);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_232E181C8(uint64_t a1, void *a2, void *aBlock)
{
  uint64_t v4 = *(void (**)(void))(a1 + 32);
  uint64_t v5 = (uint64_t (*)())_Block_copy(aBlock);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v5 = sub_232E18CEC;
  }
  swift_retain();
  id v6 = a2;
  v4();

  sub_232E0CF84((uint64_t)v5);

  return swift_release();
}

void sub_232E18288(uint64_t a1, void *a2, void *a3, void *a4)
{
}

uint64_t sub_232E182A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, char *, char *), uint64_t a6)
{
  uint64_t v18 = a6;
  uint64_t v19 = a5;
  uint64_t v8 = sub_232E32BA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_232E32C28();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E33538();
  swift_retain();
  id v16 = a2;
  sub_232E32B58();
  v19(a1, v15, v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_232E18460(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void sub_232E18480(uint64_t a1, void *a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void (**)(id, id, uint64_t, uint64_t))(a1 + 32);
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  swift_retain();
  id v13 = a2;
  id v12 = a3;
  v9(v13, v12, a6, v11);
  swift_release();
  swift_release();
}

uint64_t sub_232E18550()
{
  return *(void *)(v0 + 16);
}

uint64_t _s17PreviewsOSSupport15ShellConnectionC8activate8receiver19interruptionHandleryy0A11MessagingOS16LazyPropertyListO_AG14TransportReplyVSgtYbc_yyYbctF_0(uint64_t a1, uint64_t a2)
{
  swift_getWitnessTable();
  sub_232E33678();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(void *)&long long v7 = 0;
  *((void *)&v7 + 1) = 0xE000000000000000;
  uint64_t v8 = sub_232E18A50;
  uint64_t v9 = v4;
  uint64_t v10 = sub_232E18A58;
  uint64_t v11 = v5;
  long long v12 = 0u;
  long long v13 = 0u;
  swift_retain_n();
  sub_232E16010(&v7);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E186A4()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E186C0()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E186DC()
{
  return swift_getWitnessTable();
}

uint64_t dispatch thunk of ShellConnectionRole.handleActivation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ShellConnectionRole.handleInvalidation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static ShellConnectionRole.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_232E18734()
{
  sub_232E1885C();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for ShellConnection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for ShellConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ShellConnection);
}

void sub_232E1885C()
{
  if (!qword_26874FEE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26874F540);
    unint64_t v0 = sub_232E334C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26874FEE8);
    }
  }
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t type metadata accessor for ShellConnection.RemoteTargetError()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_232E188FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_232E18964()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E1899C(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_232E17F48(a1, a2, a3, *(void (**)(void, void))(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_232E189A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_232E182A8(a1, a2, a3, a4, *(void (**)(uint64_t, char *, char *))(v4 + 16), *(void *)(v4 + 24));
}

uint64_t sub_232E189C0()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

unint64_t sub_232E189F8()
{
  unint64_t result = qword_26874FF10;
  if (!qword_26874FF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26874FF10);
  }
  return result;
}

uint64_t sub_232E18A50(uint64_t a1)
{
  return sub_232E16384(a1, *(void (**)(uint64_t, char *))(v1 + 16));
}

uint64_t sub_232E18A58(uint64_t a1, uint64_t a2)
{
  return sub_232E16468(a1, a2, *(void (**)(uint64_t, char *))(v2 + 16));
}

unint64_t sub_232E18A60()
{
  unint64_t result = qword_268750260;
  if (!qword_268750260)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268750260);
  }
  return result;
}

uint64_t sub_232E18AA4()
{
  return sub_232E32CD8();
}

uint64_t sub_232E18B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E165FC(a1, a2, a3, v3 + 16);
}

uint64_t objectdestroy_50Tm()
{
  swift_bridgeObjectRelease();
  if (v0[4]) {
    swift_release();
  }
  if (v0[6]) {
    swift_release();
  }
  if (v0[8]) {
    swift_release();
  }
  if (v0[10]) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 96, 7);
}

uint64_t sub_232E18B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E167C0(a1, a2, a3, v3 + 16);
}

uint64_t sub_232E18BA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_232E18BCC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_232E18C0C(void *a1)
{
  sub_232E16BD8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_232E18C14()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E18C24(uint64_t a1)
{
  return sub_232E22120(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_232E18C2C(uint64_t a1)
{
  return sub_232E16E9C(a1, v1);
}

uint64_t sub_232E18C34(uint64_t a1)
{
  return sub_232E17000(a1, v1);
}

unint64_t sub_232E18C3C()
{
  unint64_t result = qword_26874FF80[0];
  if (!qword_26874FF80[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26874F6B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26874FF80);
  }
  return result;
}

uint64_t sub_232E18C98()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E18CB4()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E18CD0()
{
  return swift_getWitnessTable();
}

uint64_t sub_232E18D54(char a1)
{
  if (a1) {
    return 0xD000000000000016;
  }
  else {
    return 0x4C525579706F63;
  }
}

uint64_t sub_232E18D90(char *a1, char *a2)
{
  return sub_232E24C08(*a1, *a2);
}

uint64_t sub_232E18D9C()
{
  return sub_232E251A0();
}

uint64_t sub_232E18DA4()
{
  return sub_232E25C28();
}

uint64_t sub_232E18DAC()
{
  return sub_232E26208();
}

uint64_t sub_232E18DB4@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E18DC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E18D54(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E18DEC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_232E1AB30();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_232E18E48()
{
  return sub_232E33118();
}

uint64_t sub_232E18EB0(char a1)
{
  if (a1) {
    return 7107189;
  }
  else {
    return 0x696D697263736964;
  }
}

uint64_t sub_232E18EE8(char *a1, char *a2)
{
  return sub_232E24B64(*a1, *a2);
}

uint64_t sub_232E18EF4()
{
  return sub_232E25228();
}

uint64_t sub_232E18EFC()
{
  return sub_232E25BBC();
}

uint64_t sub_232E18F04()
{
  return sub_232E2628C();
}

uint64_t sub_232E18F0C@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E18F18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E18EB0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E18F44()
{
  return sub_232E18EB0(*v0);
}

uint64_t ShellToControlAgent.TwoWayMessage.propertyListValue.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750010);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_232E32CC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = v0;
  unint64_t v11 = sub_232E192FC();
  sub_232E19350();
  sub_232E32E68();
  sub_232E193A4(v0, (uint64_t)v10);
  swift_getEnumCaseMultiPayload();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v10, v4);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v3, v7, v4);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  id v16 = &type metadata for ShellToControlAgent.TwoWayMessage.Key;
  unint64_t v17 = v11;
  v15[0] = 1;
  sub_232E19408();
  sub_232E32DE8();
  sub_232E19460((uint64_t)v3);
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t type metadata accessor for ShellToControlAgent.TwoWayMessage()
{
  uint64_t result = qword_268750048;
  if (!qword_268750048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_232E1920C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_232E193A4(a3, (uint64_t)v8);
  LOBYTE(a3) = swift_getEnumCaseMultiPayload() == 1;
  uint64_t v9 = sub_232E32CC8();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  *a2 = a3;
  return result;
}

uint64_t sub_232E192F4(unsigned char *a1, unsigned char *a2)
{
  return sub_232E1920C(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_232E192FC()
{
  unint64_t result = qword_268750018;
  if (!qword_268750018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750018);
  }
  return result;
}

unint64_t sub_232E19350()
{
  unint64_t result = qword_268750020;
  if (!qword_268750020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750020);
  }
  return result;
}

uint64_t sub_232E193A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_232E19408()
{
  unint64_t result = qword_268750028;
  if (!qword_268750028)
  {
    sub_232E32CC8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750028);
  }
  return result;
}

uint64_t sub_232E19460(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750010);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ShellToControlAgent.TwoWayMessage.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v16[-v9];
  unint64_t v17 = &type metadata for ShellToControlAgent.TwoWayMessage.Key;
  unint64_t v11 = sub_232E192FC();
  unint64_t v18 = v11;
  v16[0] = 0;
  sub_232E19350();
  sub_232E32DF8();
  if (v2)
  {
    uint64_t v12 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
    unint64_t v17 = &type metadata for ShellToControlAgent.TwoWayMessage.Key;
    unint64_t v18 = v11;
    v16[0] = 1;
    if (v19)
    {
      sub_232E32CC8();
      sub_232E19408();
      sub_232E32DF8();
      uint64_t v14 = sub_232E32E88();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
      swift_storeEnumTagMultiPayload();
      uint64_t v10 = v8;
    }
    else
    {
      sub_232E32CC8();
      sub_232E19408();
      sub_232E32DF8();
      uint64_t v15 = sub_232E32E88();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
      swift_storeEnumTagMultiPayload();
    }
    return sub_232E1973C((uint64_t)v10, a2);
  }
}

uint64_t sub_232E1973C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_232E197A0(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_232E19824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ShellToControlAgent.TwoWayMessage.init(propertyListValue:)(a1, a2);
}

uint64_t sub_232E1983C(unsigned __int8 *a1, char *a2)
{
  return sub_232E24A18(*a1, *a2);
}

uint64_t sub_232E19848()
{
  return sub_232E252AC();
}

uint64_t sub_232E19850()
{
  return sub_232E25B08();
}

uint64_t sub_232E19858()
{
  return sub_232E2630C();
}

uint64_t sub_232E19860@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E19D0C();
  *a1 = result;
  return result;
}

unint64_t sub_232E19890@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_232E197A0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E198BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_232E1AB84();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_232E19918()
{
  return sub_232E33118();
}

uint64_t sub_232E19980(char a1)
{
  if (a1) {
    return 0x656449656E656373;
  }
  else {
    return 0x696D697263736964;
  }
}

uint64_t sub_232E199CC(char *a1, char *a2)
{
  return sub_232E24960(*a1, *a2);
}

uint64_t sub_232E199D8()
{
  return sub_232E25380();
}

uint64_t sub_232E199E0()
{
  return sub_232E25A88();
}

uint64_t sub_232E199E8()
{
  return sub_232E263DC();
}

uint64_t sub_232E199F0@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E199FC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_232E33648();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_232E19A58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E19980(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E19A84()
{
  return sub_232E19980(*v0);
}

uint64_t ShellToControlAgent.BSEndpointContext.propertyListValue.getter(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = sub_232E19B58();
  sub_232E19BAC();
  uint64_t result = sub_232E32E68();
  if (a2 >= 3)
  {
    uint64_t v9 = a1;
    unint64_t v10 = a2;
    uint64_t v7 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
    unint64_t v8 = v4;
    v6[0] = 1;
    sub_232E32DE8();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  }
  return result;
}

unint64_t sub_232E19B58()
{
  unint64_t result = qword_268750030;
  if (!qword_268750030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750030);
  }
  return result;
}

unint64_t sub_232E19BAC()
{
  unint64_t result = qword_268750038;
  if (!qword_268750038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750038);
  }
  return result;
}

uint64_t ShellToControlAgent.BSEndpointContext.init(propertyListValue:)(uint64_t a1)
{
  return sub_232E19D58(a1);
}

uint64_t sub_232E19C18()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  unint64_t v3 = sub_232E19B58();
  sub_232E19BAC();
  uint64_t result = sub_232E32E68();
  if (v1 >= 3)
  {
    uint64_t v8 = v2;
    unint64_t v9 = v1;
    uint64_t v6 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
    unint64_t v7 = v3;
    v5[0] = 1;
    sub_232E32DE8();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  }
  return result;
}

uint64_t sub_232E19CE0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_232E19D58(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_232E19D0C()
{
  unint64_t v0 = sub_232E33648();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_232E19D58(uint64_t a1)
{
  unint64_t v10 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
  unint64_t v3 = sub_232E19B58();
  unint64_t v11 = v3;
  v9[0] = 0;
  sub_232E19BAC();
  sub_232E32DF8();
  if (v1)
  {
    uint64_t v4 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    switch((char)v8)
    {
      case 1:
        unint64_t v10 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
        unint64_t v11 = v3;
        v9[0] = 1;
        sub_232E32DF8();
        uint64_t v7 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
        uint64_t result = v8;
        break;
      default:
        uint64_t v6 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
        uint64_t result = 0;
        break;
    }
  }
  return result;
}

unint64_t sub_232E19F98(uint64_t a1)
{
  unint64_t result = sub_232E19FC0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_232E19FC0()
{
  unint64_t result = qword_268750040;
  if (!qword_268750040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750040);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToControlAgent()
{
  return &type metadata for ShellToControlAgent;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellToControlAgent.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v6 = sub_232E32CC8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ShellToControlAgent.TwoWayMessage(uint64_t a1)
{
  uint64_t v2 = sub_232E32CC8();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_232E32CC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_232E1A2B0(a1);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_232E32CC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_232E1A2B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = sub_232E32CC8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_232E1A2B0(a1);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = sub_232E32CC8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_232E1A498()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_232E1A4A8()
{
  uint64_t result = sub_232E32CC8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t destroy for ShellToControlAgent.BSEndpointContext(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17PreviewsOSSupport19ShellToControlAgentO17BSEndpointContextOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for ShellToControlAgent.BSEndpointContext(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ShellToControlAgent.BSEndpointContext(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToControlAgent.BSEndpointContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ShellToControlAgent.BSEndpointContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_232E1A74C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_232E1A764(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.BSEndpointContext()
{
  return &type metadata for ShellToControlAgent.BSEndpointContext;
}

unsigned char *storeEnumTagSinglePayload for ShellToControlAgent.BSEndpointContext.Discriminant(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E1A860);
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

ValueMetadata *type metadata accessor for ShellToControlAgent.BSEndpointContext.Discriminant()
{
  return &type metadata for ShellToControlAgent.BSEndpointContext.Discriminant;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.BSEndpointContext.Key()
{
  return &type metadata for ShellToControlAgent.BSEndpointContext.Key;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.TwoWayMessage.Discriminant()
{
  return &type metadata for ShellToControlAgent.TwoWayMessage.Discriminant;
}

unsigned char *_s17PreviewsOSSupport19ShellToControlAgentO17BSEndpointContextO3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E1A98CLL);
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

ValueMetadata *type metadata accessor for ShellToControlAgent.TwoWayMessage.Key()
{
  return &type metadata for ShellToControlAgent.TwoWayMessage.Key;
}

unint64_t sub_232E1A9C8()
{
  unint64_t result = qword_268750058;
  if (!qword_268750058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750058);
  }
  return result;
}

unint64_t sub_232E1AA20()
{
  unint64_t result = qword_268750060;
  if (!qword_268750060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750060);
  }
  return result;
}

unint64_t sub_232E1AA78()
{
  unint64_t result = qword_268750068;
  if (!qword_268750068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750068);
  }
  return result;
}

unint64_t sub_232E1AAD0()
{
  unint64_t result = qword_268750070;
  if (!qword_268750070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750070);
  }
  return result;
}

uint64_t sub_232E1AB24()
{
  return MEMORY[0x263F60648];
}

unint64_t sub_232E1AB30()
{
  unint64_t result = qword_268750078;
  if (!qword_268750078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750078);
  }
  return result;
}

unint64_t sub_232E1AB84()
{
  unint64_t result = qword_268750080;
  if (!qword_268750080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750080);
  }
  return result;
}

unsigned char *sub_232E1ABD8(unsigned char *result, unsigned char *a2)
{
  unint64_t v3 = *(void *)(v2 + 24);
  *unint64_t result = 0;
  BOOL v4 = v3 >= 3;
  unsigned int v5 = 0x30200u >> (8 * v3);
  if (v4) {
    LOBYTE(v5) = 1;
  }
  *a2 = v5;
  return result;
}

unint64_t static LSBundleRecord.playgroundsBundleID.getter()
{
  return 0xD000000000000015;
}

unint64_t static LSBundleRecord.playgroundsManagementDomain.getter()
{
  return 0xD000000000000011;
}

uint64_t static LSBundleRecord.canLaunch(agentBundle:)(uint64_t a1)
{
  uint64_t v2 = sub_232E32BD8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v51 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v49 = (char *)&v44 - v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = sub_232E332F8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v48 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v44 - v14;
  sub_232E332B8();
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v50 = a1;
  uint64_t v52 = v16;
  v16(v9, a1, v2);
  unint64_t v17 = sub_232E332D8();
  os_log_type_t v18 = sub_232E33508();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v45 = v3;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v46 = v11;
    uint64_t v22 = v2;
    uint64_t v23 = v21;
    uint64_t v55 = v21;
    uint64_t v47 = v10;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v53 = (void (*)(char *, uint64_t))(v20 + 4);
    sub_232E1BA3C();
    uint64_t v24 = sub_232E33658();
    uint64_t v54 = sub_232E093C4(v24, v25, &v55);
    uint64_t v10 = v47;
    sub_232E33568();
    swift_bridgeObjectRelease();
    uint64_t v53 = *(void (**)(char *, uint64_t))(v45 + 8);
    v53(v9, v22);
    _os_log_impl(&dword_232DFE000, v17, v18, "Checking if %s is a valid development process", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = v23;
    uint64_t v2 = v22;
    uint64_t v11 = v46;
    MEMORY[0x237DB3E80](v26, -1, -1);
    MEMORY[0x237DB3E80](v20, -1, -1);
  }
  else
  {
    uint64_t v53 = *(void (**)(char *, uint64_t))(v3 + 8);
    v53(v9, v2);
  }

  uint64_t v27 = *(void (**)(char *, uint64_t))(v11 + 8);
  v27(v15, v10);
  uint64_t v28 = v50;
  char v29 = sub_232E1B750();
  uint64_t v30 = v49;
  v52(v49, v28, v2);
  uint64_t v31 = v51;
  if (v29)
  {
    v53(v30, v2);
    return 1;
  }
  else
  {
    char v33 = sub_232E1B928();
    v53(v30, v2);
    if (v33)
    {
      return 1;
    }
    else
    {
      uint64_t v34 = v48;
      sub_232E332B8();
      v52(v31, v28, v2);
      uint64_t v35 = sub_232E332D8();
      os_log_type_t v36 = sub_232E33518();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v47 = v10;
        uint64_t v38 = (uint8_t *)v37;
        uint64_t v39 = swift_slowAlloc();
        uint64_t v55 = v39;
        uint64_t v46 = v11;
        *(_DWORD *)uint64_t v38 = 136315138;
        uint64_t v52 = (void (*)(char *, uint64_t, uint64_t))(v38 + 4);
        sub_232E1BA3C();
        uint64_t v40 = sub_232E33658();
        uint64_t v54 = sub_232E093C4(v40, v41, &v55);
        sub_232E33568();
        swift_bridgeObjectRelease();
        v53(v31, v2);
        _os_log_impl(&dword_232DFE000, v35, v36, "can't do anything with non-development agent %s", v38, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x237DB3E80](v39, -1, -1);
        MEMORY[0x237DB3E80](v38, -1, -1);

        uint64_t v42 = v47;
        uint64_t v43 = v48;
      }
      else
      {
        v53(v31, v2);

        uint64_t v43 = v34;
        uint64_t v42 = v10;
      }
      v27(v43, v42);
      return 0;
    }
  }
}

id sub_232E1B1D0()
{
  id v1 = objc_msgSend(v0, sel_entitlements);
  uint64_t v2 = (void *)sub_232E33358();
  sub_232E1BA94();
  id v3 = objc_msgSend(v1, sel_objectForKey_ofClass_, v2, swift_getObjCClassFromMetadata());

  if (v3)
  {
    sub_232E33588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_232E02E38((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_232E1BAD4((uint64_t)v8);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v4 = objc_msgSend(v6, sel_BOOLValue);

  return v4;
}

id sub_232E1B308(uint64_t a1, char a2)
{
  id v3 = v2;
  v15[1] = *(id *)MEMORY[0x263EF8340];
  id v6 = (void *)sub_232E32A28();
  v15[0] = 0;
  id v7 = objc_msgSend(v3, sel_initWithURL_allowPlaceholder_error_, v6, a2 & 1, v15);

  id v8 = v15[0];
  if (v7)
  {
    uint64_t v9 = sub_232E32A48();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    id v11 = v8;
    v10(a1, v9);
  }
  else
  {
    id v12 = v15[0];
    sub_232E329F8();

    swift_willThrow();
    uint64_t v13 = sub_232E32A48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
  }
  return v7;
}

id sub_232E1B45C(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_232E33358();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_232E329F8();

    swift_willThrow();
  }
  return v6;
}

id sub_232E1B538(uint64_t a1)
{
  uint64_t v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = (void *)sub_232E32A28();
  v13[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithURL_error_, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_232E32A48();
    id v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_232E329F8();

    swift_willThrow();
    uint64_t v11 = sub_232E32A48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

id sub_232E1B684()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = (void *)sub_232E33358();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_232E329F8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_232E1B750()
{
  uint64_t v0 = sub_232E32A48();
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E32BB8();
  if (v3)
  {
    sub_232E32A18();
    swift_bridgeObjectRelease();
    id v4 = objc_allocWithZone(MEMORY[0x263F01878]);
    id v5 = sub_232E1B308((uint64_t)v2, 0);
  }
  else
  {
    uint64_t v8 = sub_232E32BC8();
    uint64_t v10 = v9;
    id v11 = objc_allocWithZone(MEMORY[0x263F01878]);
    id v5 = sub_232E1B45C(v8, v10, 0);
  }
  if (v5)
  {
    id v12 = v5;
    id v13 = objc_msgSend(v12, sel_managementDomain);
    uint64_t v14 = sub_232E33368();
    uint64_t v16 = v15;

    if (v14 == 0xD000000000000011 && v16 == 0x8000000232E37CE0)
    {

      swift_bridgeObjectRelease();
      unsigned __int8 v6 = 1;
    }
    else
    {
      char v17 = sub_232E33698();
      swift_bridgeObjectRelease();
      if (v17)
      {

        unsigned __int8 v6 = 1;
      }
      else
      {
        id v18 = v12;
        unsigned __int8 v6 = sub_232E1B1D0();
      }
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_232E1B928()
{
  uint64_t v0 = sub_232E32A48();
  MEMORY[0x270FA5388](v0 - 8);
  id v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E32BB8();
  if (v3)
  {
    sub_232E32A18();
    swift_bridgeObjectRelease();
    id v4 = objc_allocWithZone(MEMORY[0x263F01858]);
    id v5 = sub_232E1B538((uint64_t)v2);
  }
  else
  {
    sub_232E32BC8();
    id v7 = objc_allocWithZone(MEMORY[0x263F01858]);
    id v5 = sub_232E1B684();
  }
  if (v5)
  {
    id v8 = v5;
    unsigned __int8 v6 = sub_232E1B1D0();
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  return v6 & 1;
}

unint64_t sub_232E1BA3C()
{
  unint64_t result = qword_268750088;
  if (!qword_268750088)
  {
    sub_232E32BD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750088);
  }
  return result;
}

unint64_t sub_232E1BA94()
{
  unint64_t result = qword_268750090;
  if (!qword_268750090)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268750090);
  }
  return result;
}

uint64_t sub_232E1BAD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268750230);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RefinedPreviewPayload.previewPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_232E32B08();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t RefinedPreviewPayload.previewPayload.setter(uint64_t a1)
{
  uint64_t v3 = sub_232E32B08();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*RefinedPreviewPayload.previewPayload.modify())()
{
  return nullsub_1;
}

uint64_t RefinedPreviewPayload.requestedGroupIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);

  return sub_232E1BC88(v3, a1);
}

uint64_t type metadata accessor for RefinedPreviewPayload(uint64_t a1)
{
  return sub_232E02408(a1, (uint64_t *)&unk_268750110);
}

uint64_t sub_232E1BC88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t RefinedPreviewPayload.requestedGroupIndex.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);

  return sub_232E1BD34(a1, v3);
}

uint64_t sub_232E1BD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*RefinedPreviewPayload.requestedGroupIndex.modify())()
{
  return nullsub_1;
}

uint64_t RefinedPreviewPayload.init(previewPayload:requestedGroupIndex:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a3 + *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);
  uint64_t v7 = sub_232E32D18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = sub_232E32B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a3, a1, v8);

  return sub_232E1BD34(a2, v6);
}

uint64_t sub_232E1BEB8(char a1)
{
  if (a1) {
    return 0xD000000000000013;
  }
  else {
    return 0x5077656976657270;
  }
}

uint64_t sub_232E1BF00(char *a1, char *a2)
{
  return sub_232E248AC(*a1, *a2);
}

uint64_t sub_232E1BF0C()
{
  return sub_232E25418();
}

uint64_t sub_232E1BF14()
{
  return sub_232E25A0C();
}

uint64_t sub_232E1BF1C()
{
  return sub_232E26470();
}

uint64_t sub_232E1BF24@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E1BF30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E1BEB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E1BF5C()
{
  return sub_232E1BEB8(*v0);
}

void sub_232E1BF64(void *a1@<X8>)
{
  *a1 = &unk_26E693C78;
}

uint64_t RefinedPreviewPayload.propertyListValue.getter()
{
  return sub_232E32E58();
}

uint64_t sub_232E1BFB0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750198);
  MEMORY[0x270FA5388](v2 - 8);
  char v33 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687501A0);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v32 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687501A8);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v35 = (uint64_t)&v31 - v15;
  uint64_t v16 = (char *)&v31 + *(int *)(v11 + 56) - v15;
  *((unsigned char *)&v31 - v15) = 0;
  uint64_t v17 = sub_232E32B08();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v19(v16, a1, v17);
  uint64_t v20 = *(int *)(v5 + 56);
  uint64_t v21 = v9;
  uint64_t v34 = v9;
  uint64_t v22 = (uint64_t)&v9[v20];
  *uint64_t v21 = 1;
  uint64_t v23 = type metadata accessor for RefinedPreviewPayload(0);
  sub_232E1BC88(a1 + *(int *)(v23 + 20), v22);
  uint64_t v24 = &v14[*(int *)(v11 + 56)];
  *uint64_t v14 = 0;
  v19(v24, (uint64_t)v16, v17);
  uint64_t v25 = (uint64_t)v33;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v33, v24, v17);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v25, 0, 1, v17);
  char v37 = 0;
  uint64_t v26 = *(int *)(v5 + 56);
  uint64_t v27 = v32;
  uint64_t v28 = (uint64_t)&v32[v26];
  unsigned char *v32 = 1;
  sub_232E1BC88(v22, (uint64_t)&v27[v26]);
  char v36 = 1;
  sub_232E32D18();
  sub_232E1C808();
  sub_232E1ED1C(&qword_2687500A8, MEMORY[0x263F608B8]);
  sub_232E1ED1C(&qword_2687500B0, MEMORY[0x263F60CE8]);
  uint64_t v29 = sub_232E33078();
  sub_232E02EA0(v25, &qword_268750198);
  sub_232E02EA0((uint64_t)v34, &qword_2687501A0);
  sub_232E02EA0(v35, &qword_2687501A8);
  sub_232E02EA0(v28, &qword_268750098);
  return v29;
}

uint64_t sub_232E1C348()
{
  return sub_232E1BFB0(*(void *)(v0 + 16));
}

uint64_t RefinedPreviewPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = sub_232E32E88();
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v27 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v26 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_232E32B08();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  char v36 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - v11;
  uint64_t v13 = *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);
  uint64_t v29 = a2;
  uint64_t v14 = a2 + v13;
  uint64_t v15 = sub_232E32D18();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(v16 + 56);
  uint64_t v24 = v16 + 56;
  uint64_t v25 = v17;
  v17(v14, 1, 1, (char *)v15);
  uint64_t v34 = &type metadata for RefinedPreviewPayload.Key;
  unint64_t v18 = sub_232E1C808();
  unint64_t v35 = v18;
  v33[0] = 0;
  sub_232E1ED1C(&qword_2687500A8, MEMORY[0x263F608B8]);
  sub_232E32DF8();
  uint64_t v31 = v14;
  if (v2)
  {
    uint64_t v26 = (char *)v15;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    uint64_t v20 = v30;
    uint64_t v21 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v27, a1, v32);
    sub_232E330F8();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a1, v21);

    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v29, v36, v8);
    uint64_t v22 = v31;
    sub_232E02EA0(v31, &qword_268750098);
    return v25(v22, 1, 1, v26);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v29, v12, v8);
    uint64_t v34 = &type metadata for RefinedPreviewPayload.Key;
    unint64_t v35 = v18;
    v33[0] = 1;
    sub_232E1ED1C(&qword_2687500B0, MEMORY[0x263F60CE8]);
    uint64_t v19 = (uint64_t)v26;
    sub_232E32E38();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(a1, v32);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    return sub_232E1BD34(v19, v31);
  }
}

unint64_t sub_232E1C808()
{
  unint64_t result = qword_2687500A0;
  if (!qword_2687500A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500A0);
  }
  return result;
}

uint64_t sub_232E1C85C()
{
  return sub_232E32E58();
}

uint64_t sub_232E1C898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RefinedPreviewPayload.init(propertyListValue:)(a1, a2);
}

BOOL PreviewStructure.previewCount.getter()
{
  uint64_t v1 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E1CAAC(v0, (uint64_t)v3);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  int v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(v3, 2, v4);
  if (v5) {
    return v5 == 1;
  }
  uint64_t v7 = &v3[*(int *)(v4 + 48)];
  uint64_t v8 = sub_232E33298();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v3, v8);
  uint64_t v6 = PreviewGroupMetadata.previewCount.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v12 = sub_232E32D18();
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v7, v12);
  return v6;
}

uint64_t type metadata accessor for PreviewStructure(uint64_t a1)
{
  return sub_232E02408(a1, (uint64_t *)&unk_268750128);
}

uint64_t sub_232E1CAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewStructure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t PreviewGroupMetadata.previewCount.getter()
{
  uint64_t v0 = sub_232E33238();
  uint64_t v1 = sub_232E33288();
  uint64_t v2 = *(void **)(v1 - 8);
  uint64_t v3 = v2[8];
  MEMORY[0x270FA5388](v1);
  sub_232E33228();
  uint64_t v4 = sub_232E33258();
  uint64_t v15 = (void (*)(char *, uint64_t))v2[1];
  uint64_t v16 = v2 + 1;
  v15((char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  uint64_t v5 = *(void *)(v0 + 16);
  if (v5)
  {
    uint64_t v8 = (void (*)(char *, unint64_t, uint64_t))v2[2];
    uint64_t v7 = v2 + 2;
    uint64_t v6 = v8;
    unint64_t v9 = v0 + ((*((unsigned __int8 *)v7 + 64) + 32) & ~(unint64_t)*((unsigned __int8 *)v7 + 64));
    uint64_t v10 = v7[7];
    v14[1] = v0;
    uint64_t v11 = swift_bridgeObjectRetain();
    while (1)
    {
      MEMORY[0x270FA5388](v11);
      v6((char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9, v1);
      uint64_t result = sub_232E33258();
      BOOL v13 = __OFADD__(v4, result);
      v4 += result;
      if (v13) {
        break;
      }
      uint64_t v11 = ((uint64_t (*)(char *, uint64_t))v15)((char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
      v9 += v10;
      if (!--v5)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return v4;
  }
  return result;
}

uint64_t sub_232E1CCD8(char a1)
{
  if (a1) {
    return 0x77656976657270;
  }
  else {
    return 0x6E6F6974636573;
  }
}

uint64_t sub_232E1CD08(char *a1, char *a2)
{
  return sub_232E2482C(*a1, *a2);
}

uint64_t sub_232E1CD14()
{
  return sub_232E254AC();
}

uint64_t sub_232E1CD1C()
{
  return sub_232E259B4();
}

uint64_t sub_232E1CD24()
{
  return sub_232E26500();
}

uint64_t sub_232E1CD2C@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E1CD38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E1CCD8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E1CD64()
{
  return sub_232E1CCD8(*v0);
}

uint64_t PreviewGroupIndex.propertyListValue.getter()
{
  return sub_232E32E58();
}

uint64_t sub_232E1CDA8()
{
  return sub_232E33078();
}

uint64_t PreviewGroupIndex.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v8 = &_s3KeyON_1;
  unint64_t v3 = sub_232E1EAC8();
  unint64_t v9 = v3;
  v7[0] = 0;
  sub_232E32DF8();
  if (v1)
  {
    uint64_t v4 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    uint64_t v8 = &_s3KeyON_1;
    unint64_t v9 = v3;
    v7[0] = 1;
    sub_232E32DF8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    sub_232E331F8();
    uint64_t v5 = sub_232E32E88();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
}

uint64_t sub_232E1CF94(char a1)
{
  if (a1) {
    return 0x7463655365726F6DLL;
  }
  else {
    return 0x6365537473726966;
  }
}

uint64_t sub_232E1CFDC()
{
  return sub_232E32E58();
}

uint64_t sub_232E1D018(uint64_t a1)
{
  return PreviewGroupIndex.init(propertyListValue:)(a1);
}

uint64_t sub_232E1D030(char *a1, char *a2)
{
  return sub_232E24778(*a1, *a2);
}

uint64_t sub_232E1D03C()
{
  return sub_232E25524();
}

uint64_t sub_232E1D044()
{
  return sub_232E25938();
}

uint64_t sub_232E1D04C()
{
  return sub_232E26574();
}

uint64_t sub_232E1D054@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E1D060@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E1CF94(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E1D08C()
{
  return sub_232E1CF94(*v0);
}

uint64_t PreviewGroupMetadata.propertyListValue.getter()
{
  return sub_232E32E58();
}

uint64_t sub_232E1D0D0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750180);
  uint64_t v1 = v0 - 8;
  uint64_t v2 = *(void *)(*(void *)(v0 - 8) + 64);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = &v3[*(int *)(v1 + 56)];
  *unint64_t v3 = 0;
  sub_232E33228();
  uint64_t v5 = sub_232E33238();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = &v3[*(int *)(v1 + 56)];
  *unint64_t v3 = 0;
  uint64_t v7 = sub_232E33288();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v6, v4, v7);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750188);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, unsigned char *, uint64_t))(v8 + 32))(v11, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
  char v16 = 0;
  char v15 = 1;
  uint64_t v14 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687500D8);
  sub_232E1EB24();
  sub_232E1ED1C(&qword_2687500D0, MEMORY[0x270FA76C8]);
  sub_232E1EB78();
  uint64_t v12 = sub_232E33078();
  swift_bridgeObjectRelease();
  sub_232E02EA0((uint64_t)v11, &qword_268750188);
  sub_232E02EA0((uint64_t)v3, &qword_268750180);
  return v12;
}

uint64_t PreviewGroupMetadata.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v3 = sub_232E33288();
  MEMORY[0x270FA5388](v3);
  uint64_t v9 = &_s3KeyON_0;
  unint64_t v4 = sub_232E1EB24();
  unint64_t v10 = v4;
  v8[0] = 0;
  sub_232E1ED1C(&qword_2687500D0, MEMORY[0x270FA76C8]);
  sub_232E32DF8();
  if (v1)
  {
    uint64_t v5 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
    uint64_t v9 = &_s3KeyON_0;
    unint64_t v10 = v4;
    v8[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687500D8);
    sub_232E1EB78();
    sub_232E32DF8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
    sub_232E33218();
    uint64_t v7 = sub_232E32E88();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  }
}

uint64_t sub_232E1D5A4(char a1)
{
  if (a1) {
    return 0x4377656976657270;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_232E1D5E0()
{
  return sub_232E32E58();
}

uint64_t sub_232E1D61C(uint64_t a1)
{
  return PreviewGroupMetadata.init(propertyListValue:)(a1);
}

uint64_t sub_232E1D634(char *a1, char *a2)
{
  return sub_232E246D0(*a1, *a2);
}

uint64_t sub_232E1D640()
{
  return sub_232E255B8();
}

uint64_t sub_232E1D648()
{
  return sub_232E258C8();
}

uint64_t sub_232E1D650()
{
  return sub_232E26604();
}

uint64_t sub_232E1D658@<X0>(char *a1@<X8>)
{
  return sub_232E199FC(a1);
}

uint64_t sub_232E1D664@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E1D5A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E1D690()
{
  return sub_232E1D5A4(*v0);
}

uint64_t PreviewGroupMetadata.Section.propertyListValue.getter()
{
  return sub_232E32E58();
}

uint64_t sub_232E1D6D4()
{
  sub_232E33278();
  sub_232E33258();
  sub_232E1EC18();
  uint64_t v0 = sub_232E33078();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PreviewGroupMetadata.Section.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v8 = &_s3KeyON;
  unint64_t v3 = sub_232E1EC18();
  unint64_t v9 = v3;
  v7[0] = 0;
  sub_232E32E38();
  if (v1)
  {
    uint64_t v4 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    uint64_t v8 = &_s3KeyON;
    unint64_t v9 = v3;
    v7[0] = 1;
    sub_232E32DF8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    sub_232E33268();
    uint64_t v6 = sub_232E32E88();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
}

uint64_t sub_232E1D934(char a1)
{
  if (!a1) {
    return 0x7250656C676E6973;
  }
  if (a1 == 1) {
    return 0x4777656976657270;
  }
  return 0xD000000000000011;
}

uint64_t sub_232E1D9A4()
{
  return sub_232E32E58();
}

uint64_t sub_232E1D9E0(uint64_t a1)
{
  return PreviewGroupMetadata.Section.init(propertyListValue:)(a1);
}

uint64_t sub_232E1D9F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_232E24DB8(*a1, *a2);
}

uint64_t sub_232E1DA04()
{
  return sub_232E25640();
}

uint64_t sub_232E1DA0C()
{
  return sub_232E25D44();
}

uint64_t sub_232E1DA14()
{
  return sub_232E26074();
}

uint64_t sub_232E1DA1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E20C40();
  *a1 = result;
  return result;
}

uint64_t sub_232E1DA54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E1D934(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E1DA80(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_232E20BEC();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_232E1DADC()
{
  return sub_232E33118();
}

uint64_t sub_232E1DB44(char a1)
{
  return *(void *)&aDiscrimimetada[8 * a1];
}

uint64_t sub_232E1DB64(char *a1, char *a2)
{
  return sub_232E24D30(*a1, *a2);
}

uint64_t sub_232E1DB70()
{
  return sub_232E256FC();
}

uint64_t sub_232E1DB78()
{
  return sub_232E25CF0();
}

uint64_t sub_232E1DB80()
{
  return sub_232E2612C();
}

uint64_t sub_232E1DB88@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E20C40();
  *a1 = result;
  return result;
}

uint64_t sub_232E1DBC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E1DB44(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E1DBEC()
{
  return sub_232E1DB44(*v0);
}

uint64_t PreviewStructure.propertyListValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_232E32D18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x270FA5388](v11 - 8);
  BOOL v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = v2;
  unint64_t v14 = sub_232E1EC74();
  sub_232E1ECC8();
  sub_232E32E68();
  sub_232E1CAAC(v2, (uint64_t)v13);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v13, 2, v15);
  if (!result)
  {
    uint64_t v17 = &v13[*(int *)(v15 + 48)];
    uint64_t v18 = sub_232E33298();
    uint64_t v28 = v26;
    uint64_t v19 = *(void *)(v18 - 8);
    MEMORY[0x270FA5388](v18);
    uint64_t v21 = *(void (**)(void))(v19 + 32);
    v26[1] = a1;
    uint64_t v27 = (char *)v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v22 = v27;
    v21();
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v17, v7);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750100);
    v26[0] = v26;
    MEMORY[0x270FA5388](v23 - 8);
    uint64_t v25 = (char *)v26 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v25, v22, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v25, 0, 1, v18);
    uint64_t v31 = &type metadata for PreviewStructure.Key;
    unint64_t v32 = v14;
    v30[0] = 1;
    sub_232E1ED1C(&qword_268750108, MEMORY[0x270FA76D8]);
    sub_232E32DE8();
    sub_232E02EA0((uint64_t)v25, &qword_268750100);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    uint64_t v31 = &type metadata for PreviewStructure.Key;
    unint64_t v32 = v14;
    v30[0] = 2;
    sub_232E1ED1C(&qword_2687500B0, MEMORY[0x263F60CE8]);
    sub_232E32DE8();
    sub_232E02EA0((uint64_t)v6, &qword_268750098);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v18);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  }
  return result;
}

uint64_t sub_232E1E0A4(unsigned char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_232E1CAAC(a3, (uint64_t)v8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 2, v9);
  if (result)
  {
    char v11 = 0;
    if (result != 1) {
      char v11 = 2;
    }
  }
  else
  {
    uint64_t v12 = &v8[*(int *)(v9 + 48)];
    uint64_t v13 = sub_232E32D18();
    (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
    uint64_t v14 = sub_232E33298();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v8, v14);
    char v11 = 1;
  }
  *a2 = v11;
  return result;
}

uint64_t PreviewStructure.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v19 = &type metadata for PreviewStructure.Key;
  unint64_t v8 = sub_232E1EC74();
  unint64_t v20 = v8;
  v18[0] = 0;
  sub_232E1ECC8();
  sub_232E32DF8();
  if (v2)
  {
    uint64_t v9 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
    if (v21)
    {
      if (v21 == 1)
      {
        uint64_t v19 = &type metadata for PreviewStructure.Key;
        unint64_t v20 = v8;
        v18[0] = 1;
        sub_232E33298();
        sub_232E1ED1C(&qword_268750108, MEMORY[0x270FA76D8]);
        sub_232E32DF8();
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
        uint64_t v19 = &type metadata for PreviewStructure.Key;
        unint64_t v20 = v8;
        v18[0] = 2;
        sub_232E32D18();
        sub_232E1ED1C(&qword_2687500B0, MEMORY[0x263F60CE8]);
        sub_232E32DF8();
        uint64_t v16 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 0, 2, v11);
        return sub_232E1ED64((uint64_t)v7, a2);
      }
      else
      {
        uint64_t v14 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a2, 2, 2, v15);
      }
    }
    else
    {
      uint64_t v12 = sub_232E32E88();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a2, 1, 2, v13);
    }
  }
}

uint64_t sub_232E1E610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewStructure.init(propertyListValue:)(a1, a2);
}

uint64_t _s17PreviewsOSSupport16PreviewStructureO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_232E32D18();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v36 - v9;
  uint64_t v11 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750190);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (uint64_t)&v17[*(int *)(v15 + 56)];
  sub_232E1CAAC(a1, (uint64_t)v17);
  sub_232E1CAAC(a2, v18);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  unint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48);
  int v21 = v20(v17, 2, v19);
  if (!v21)
  {
    uint64_t v41 = v5;
    sub_232E1CAAC((uint64_t)v17, (uint64_t)v13);
    uint64_t v22 = *(int *)(v19 + 48);
    uint64_t v40 = &v13[v22];
    if (!v20((char *)v18, 2, v19))
    {
      char v37 = (char *)(v18 + v22);
      uint64_t v26 = sub_232E33298();
      uint64_t v38 = &v36;
      uint64_t v39 = v26;
      uint64_t v27 = *(void *)(v26 - 8);
      MEMORY[0x270FA5388](v26);
      uint64_t v29 = (char *)&v36 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t))(v27 + 32))(v29, v18);
      uint64_t v30 = v41;
      uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
      v31(v10, v40, v4);
      v31(v8, v37, v4);
      char v32 = MEMORY[0x237DB3310](v13, v29);
      char v33 = *(void (**)(char *, uint64_t))(v27 + 8);
      v33(v13, v39);
      if (v32)
      {
        char v24 = sub_232E32D08();
        uint64_t v34 = *(void (**)(char *, uint64_t))(v30 + 8);
        v34(v8, v4);
        v34(v10, v4);
        v33(v29, v39);
        sub_232E20C88((uint64_t)v17);
        return v24 & 1;
      }
      unint64_t v35 = *(void (**)(char *, uint64_t))(v30 + 8);
      v35(v8, v4);
      v35(v10, v4);
      v33(v29, v39);
      sub_232E20C88((uint64_t)v17);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v4);
    uint64_t v23 = sub_232E33298();
    (*(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8))(v13, v23);
    goto LABEL_9;
  }
  if (v21 != 1)
  {
    if (v20((char *)v18, 2, v19) == 2) {
      goto LABEL_8;
    }
LABEL_9:
    sub_232E02EA0((uint64_t)v17, &qword_268750190);
LABEL_10:
    char v24 = 0;
    return v24 & 1;
  }
  if (v20((char *)v18, 2, v19) != 1) {
    goto LABEL_9;
  }
LABEL_8:
  sub_232E20C88((uint64_t)v17);
  char v24 = 1;
  return v24 & 1;
}

uint64_t sub_232E1EAC0()
{
  return sub_232E1CDA8();
}

unint64_t sub_232E1EAC8()
{
  unint64_t result = qword_2687500C0;
  if (!qword_2687500C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500C0);
  }
  return result;
}

uint64_t sub_232E1EB1C()
{
  return sub_232E1D0D0();
}

unint64_t sub_232E1EB24()
{
  unint64_t result = qword_2687500C8;
  if (!qword_2687500C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500C8);
  }
  return result;
}

unint64_t sub_232E1EB78()
{
  unint64_t result = qword_2687500E0;
  if (!qword_2687500E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687500D8);
    sub_232E1ED1C(&qword_2687500D0, MEMORY[0x270FA76C8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500E0);
  }
  return result;
}

uint64_t sub_232E1EC10()
{
  return sub_232E1D6D4();
}

unint64_t sub_232E1EC18()
{
  unint64_t result = qword_2687500E8;
  if (!qword_2687500E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500E8);
  }
  return result;
}

uint64_t sub_232E1EC6C(unsigned char *a1, char *a2)
{
  return sub_232E1E0A4(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_232E1EC74()
{
  unint64_t result = qword_2687500F0;
  if (!qword_2687500F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500F0);
  }
  return result;
}

unint64_t sub_232E1ECC8()
{
  unint64_t result = qword_2687500F8;
  if (!qword_2687500F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687500F8);
  }
  return result;
}

uint64_t sub_232E1ED1C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_232E1ED64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PreviewStructure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for RefinedPreviewPayload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_232E32B08();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_232E32D18();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for RefinedPreviewPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_232E32B08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_232E32D18();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t initializeWithCopy for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_232E32D18();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_232E32D18();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_232E32D18();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32B08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_232E32D18();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_232E1F684);
}

uint64_t sub_232E1F684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E32B08();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_232E1F794);
}

uint64_t sub_232E1F794(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_232E32B08();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750098);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void sub_232E1F89C()
{
  sub_232E32B08();
  if (v0 <= 0x3F)
  {
    sub_232E1F964();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_232E1F964()
{
  if (!qword_268750120)
  {
    sub_232E32D18();
    unint64_t v0 = sub_232E33558();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268750120);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewStructure(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_232E33298();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      uint64_t v11 = *(int *)(v7 + 48);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_232E32D18();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for PreviewStructure(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = sub_232E33298();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    uint64_t v5 = a1 + *(int *)(v2 + 48);
    uint64_t v6 = sub_232E32D18();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
    return v7(v5, v6);
  }
  return result;
}

char *initializeWithCopy for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_232E33298();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = *(int *)(v6 + 48);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_232E32D18();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *assignWithCopy for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v17 = sub_232E33298();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(a1, a2, v17);
      uint64_t v18 = *(int *)(v6 + 48);
      uint64_t v19 = &a1[v18];
      unint64_t v20 = &a2[v18];
      uint64_t v21 = sub_232E32D18();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24))(v19, v20, v21);
      return a1;
    }
    sub_232E02EA0((uint64_t)a1, &qword_2687500B8);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_232E33298();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  uint64_t v12 = *(int *)(v6 + 48);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_232E32D18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

char *initializeWithTake for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_232E33298();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    uint64_t v9 = *(int *)(v6 + 48);
    int v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_232E32D18();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *assignWithTake for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v17 = sub_232E33298();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(a1, a2, v17);
      uint64_t v18 = *(int *)(v6 + 48);
      uint64_t v19 = &a1[v18];
      unint64_t v20 = &a2[v18];
      uint64_t v21 = sub_232E32D18();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
      return a1;
    }
    sub_232E02EA0((uint64_t)a1, &qword_2687500B8);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_232E33298();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  uint64_t v12 = *(int *)(v6 + 48);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = sub_232E32D18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewStructure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_232E203E4);
}

uint64_t sub_232E203E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PreviewStructure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_232E20468);
}

uint64_t sub_232E20468(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_232E204F0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 2, v2);
}

uint64_t sub_232E2055C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687500B8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 2, v4);
}

uint64_t sub_232E205D0()
{
  uint64_t result = sub_232E33298();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_232E32D18();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      swift_initEnumMetadataSinglePayload();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewStructure.Discriminant()
{
  return &type metadata for PreviewStructure.Discriminant;
}

uint64_t getEnumTagSinglePayload for DaemonToShell.TwoWayMessage.Key(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s17PreviewsOSSupport16PreviewStructureO12DiscriminantOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x232E2080CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewStructure.Key()
{
  return &type metadata for PreviewStructure.Key;
}

ValueMetadata *_s3KeyOMa()
{
  return &_s3KeyON;
}

ValueMetadata *_s3KeyOMa_0()
{
  return &_s3KeyON_0;
}

ValueMetadata *_s3KeyOMa_1()
{
  return &_s3KeyON_1;
}

unsigned char *_s3KeyOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x232E20944);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RefinedPreviewPayload.Key()
{
  return &type metadata for RefinedPreviewPayload.Key;
}

unint64_t sub_232E20980()
{
  unint64_t result = qword_268750138;
  if (!qword_268750138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268750140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750138);
  }
  return result;
}

unint64_t sub_232E209E0()
{
  unint64_t result = qword_268750148;
  if (!qword_268750148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750148);
  }
  return result;
}

unint64_t sub_232E20A38()
{
  unint64_t result = qword_268750150;
  if (!qword_268750150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750150);
  }
  return result;
}

unint64_t sub_232E20A90()
{
  unint64_t result = qword_268750158;
  if (!qword_268750158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750158);
  }
  return result;
}

unint64_t sub_232E20AE8()
{
  unint64_t result = qword_268750160;
  if (!qword_268750160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750160);
  }
  return result;
}

unint64_t sub_232E20B40()
{
  unint64_t result = qword_268750168;
  if (!qword_268750168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750168);
  }
  return result;
}

unint64_t sub_232E20B98()
{
  unint64_t result = qword_268750170;
  if (!qword_268750170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750170);
  }
  return result;
}

unint64_t sub_232E20BEC()
{
  unint64_t result = qword_268750178;
  if (!qword_268750178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750178);
  }
  return result;
}

uint64_t sub_232E20C40()
{
  unint64_t v0 = sub_232E33648();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_232E20C88(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PreviewStructure(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_232E20CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FCB8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_232E332F8();
  MEMORY[0x270FA5388](v4);
  sub_232E221D0();
  swift_getObjectType();
  sub_232E175C0(a1, a2);

  return swift_unknownObjectRelease();
}

uint64_t sub_232E210B0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = sub_232E332F8();
  MEMORY[0x270FA5388](v8);
  sub_232E221D0();
  uint64_t ObjectType = swift_getObjectType();
  a4(a1, a2, a3, ObjectType);

  return swift_unknownObjectRelease();
}

void sub_232E21390(_OWORD *a1)
{
  sub_232E18A60();
  uint64_t v2 = (_OWORD *)swift_allocObject();
  long long v3 = a1[3];
  v2[3] = a1[2];
  v2[4] = v3;
  v2[5] = a1[4];
  long long v5 = *a1;
  long long v4 = a1[1];
  v2[1] = *a1;
  v2[2] = v4;
  long long v25 = v5;
  uint64_t v6 = *((void *)a1 + 2);
  uint64_t v7 = *((void *)a1 + 4);
  uint64_t v8 = *((void *)a1 + 6);
  uint64_t v21 = *((void *)a1 + 8);
  uint64_t v22 = (uint64_t)v2;
  int v9 = (_OWORD *)swift_allocObject();
  long long v10 = a1[3];
  v9[3] = a1[2];
  v9[4] = v10;
  v9[5] = a1[4];
  long long v11 = a1[1];
  v9[1] = *a1;
  v9[2] = v11;
  uint64_t v12 = (_OWORD *)swift_allocObject();
  long long v13 = a1[3];
  uint64_t v12[3] = a1[2];
  v12[4] = v13;
  v12[5] = a1[4];
  long long v14 = a1[1];
  v12[1] = *a1;
  v12[2] = v14;
  sub_232E18BA0((uint64_t)&v25);
  sub_232E0D9EC(v6);
  sub_232E0D9EC(v7);
  sub_232E0D9EC(v8);
  sub_232E0D9EC(v21);
  sub_232E18BA0((uint64_t)&v25);
  sub_232E0D9EC(v6);
  sub_232E0D9EC(v7);
  sub_232E0D9EC(v8);
  sub_232E0D9EC(v21);
  sub_232E18BA0((uint64_t)&v25);
  sub_232E0D9EC(v6);
  sub_232E0D9EC(v7);
  sub_232E0D9EC(v8);
  sub_232E0D9EC(v21);
  id v15 = sub_232E1697C((uint64_t)sub_232E23B10, v22, (uint64_t)sub_232E18B14, (uint64_t)v9, (uint64_t)sub_232E18B98, (uint64_t)v12);
  uint64_t v16 = *(void **)(v23 + 32);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v23;
  *(void *)(v17 + 24) = v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_232E23B60;
  *(void *)(v18 + 24) = v17;
  aBlock[4] = sub_232E03DB4;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_232E0165C;
  aBlock[3] = &block_descriptor_3;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  id v20 = v15;
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_configureConnection_, v19);
  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v19)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v16, sel_activate);
    swift_release();
  }
}

uint64_t sub_232E216CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  _OWORD v7[2] = sub_232E21788;
  v7[3] = &block_descriptor_44;
  long long v4 = _Block_copy(v7);
  long long v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_232E2178C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_232E21798(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_232E332F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E2373C();
  sub_232E32FB8();
  sub_232E332B8();
  sub_232E0CF94((uint64_t)v36, (uint64_t)v34);
  id v8 = a1;
  id v9 = a1;
  long long v10 = sub_232E332D8();
  os_log_type_t v11 = sub_232E33518();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v30 = v5;
    uint64_t v31 = v4;
    char v32 = v2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v29 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138543618;
    uint64_t v13 = v35;
    long long v14 = __swift_project_boxed_opaque_existential_1(v34, v35);
    uint64_t v28 = (uint64_t)&v28;
    uint64_t v15 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v14);
    uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    if (sub_232E33668())
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    }
    else
    {
      swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v17, v13);
    }
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v33 = v19;
    sub_232E33568();
    id v20 = v29;
    void *v29 = v19;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    *(_WORD *)(v12 + 12) = 2114;
    id v21 = a1;
    uint64_t v22 = _swift_stdlib_bridgeErrorToNSError();
    v34[0] = v22;
    sub_232E33568();
    v20[1] = v22;

    _os_log_impl(&dword_232DFE000, v10, v11, "%{public}@: %{public}@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874FEF0);
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v20, -1, -1);
    MEMORY[0x237DB3E80](v12, -1, -1);

    uint64_t v4 = v31;
    uint64_t v2 = v32;
    uint64_t v5 = v30;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v23 = objc_msgSend(v2, sel_replyHandler);
  if (v23)
  {
    char v24 = (void (**)(void, void, void))v23;
    __swift_project_boxed_opaque_existential_1(v36, v36[3]);
    long long v25 = (void *)sub_232E33008();
    uint64_t v26 = (void *)sub_232E329E8();
    ((void (**)(void, void, void *))v24)[2](v24, 0, v26);

    _Block_release(v24);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
}

void sub_232E21BBC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)sub_232E33358();
  swift_bridgeObjectRelease();
  id v7 = UVShellConnectionInterface((uint64_t)v6);

  objc_msgSend(a1, sel_setInterface_, v7);
  id v8 = objc_msgSend(self, sel_userInteractive);
  objc_msgSend(a1, sel_setServiceQuality_, v8);

  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  uint64_t v15 = sub_232E23B90;
  uint64_t v16 = a2;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_232E21788;
  long long v14 = &block_descriptor_38;
  id v9 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
  uint64_t v15 = sub_232E23B98;
  uint64_t v16 = a2;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 1107296256;
  uint64_t v13 = sub_232E21788;
  long long v14 = &block_descriptor_41;
  long long v10 = _Block_copy(&v11);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v10);
  _Block_release(v10);
}

uint64_t sub_232E21E80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_232E32F68();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = a2;
  sub_232E32F58();
  sub_232E03E14(&qword_268750268, (uint64_t *)&unk_26874F740);
  sub_232E32F38();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_232E21FE4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_232E2204C(void *a1)
{
  return ClientRole.handleActivation(_:)(a1);
}

uint64_t sub_232E22120(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

unint64_t sub_232E22148()
{
  return 0xD000000000000015;
}

uint64_t sub_232E221D0()
{
  if (objc_msgSend(*(id *)(v0 + 32), sel_remoteTarget))
  {
    sub_232E33588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_232E02E38((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874FF00);
    if (swift_dynamicCast()) {
      return v3;
    }
  }
  else
  {
    sub_232E02EA0((uint64_t)v5, (uint64_t *)&unk_268750230);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750250);
  sub_232E03E14(&qword_268750258, &qword_268750250);
  swift_allocError();
  *uint64_t v2 = v0;
  swift_retain();
  return swift_willThrow();
}

id sub_232E222F8(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC17PreviewsOSSupport24ServiceHubPreviewService_invalidationHandle;
  sub_232E33068();
  swift_allocObject();
  uint64_t v5 = v1;
  char v9 = 2;
  *(void *)&v1[v4] = sub_232E33058();
  *(void *)&v5[OBJC_IVAR____TtC17PreviewsOSSupport24ServiceHubPreviewService_connection] = a1;
  swift_retain();

  v11.receiver = v5;
  v11.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v11, sel_init, v9, 0, 0);
  v10[5] = v6;
  v10[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874F740);
  v10[4] = sub_232E03E14(&qword_268750270, (uint64_t *)&unk_26874F740);
  v10[0] = a1;
  sub_232E23990((unint64_t *)&unk_2687501D8, v7, (void (*)(uint64_t))type metadata accessor for ServiceHubPreviewService);
  sub_232E32ED8();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  return v6;
}

uint64_t sub_232E22470(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26874FC90);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_232E33418();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  long long v10 = (void *)swift_allocObject();
  id v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a1;
  void v10[6] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  id v11 = v2;
  swift_retain();
  if (a1 == 1)
  {
    sub_232E02EA0((uint64_t)v7, &qword_26874FC90);
  }
  else
  {
    sub_232E33408();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_232E333F8();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      if (v14 | v12)
      {
        v16[0] = 0;
        v16[1] = 0;
        v16[2] = v12;
        v16[3] = v14;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_232E226A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  return MEMORY[0x270FA2498](sub_232E226CC, 0, 0);
}

uint64_t sub_232E226CC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 104) + OBJC_IVAR____TtC17PreviewsOSSupport24ServiceHubPreviewService_connection);
  *(void *)(v0 + 128) = v1;
  *(void *)(v0 + 16) = sub_232E22148();
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  sub_232E21390((_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  *(void *)(v0 + 96) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26874F740);
  uint64_t v5 = sub_232E03E14(&qword_268750200, (uint64_t *)&unk_26874F740);
  *uint64_t v3 = v0;
  v3[1] = sub_232E227F8;
  return MEMORY[0x270F569D8](v4, v5);
}

uint64_t sub_232E227F8()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_232E22A44;
  }
  else {
    uint64_t v2 = sub_232E2290C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_232E2290C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = (void (*)(uint64_t (*)(uint64_t), void *))v0[14];
  swift_retain();
  unint64_t v3 = sub_232E22148();
  uint64_t v5 = v4;
  uint64_t v6 = (void *)swift_allocObject();
  id v6[2] = v3;
  v6[3] = v5;
  v6[4] = sub_232E238D4;
  v6[5] = v1;
  v6[6] = sub_232E238D8;
  v6[7] = v1;
  v6[8] = sub_232E23908;
  v6[9] = v1;
  swift_bridgeObjectRetain();
  swift_retain_n();
  v2(sub_232E23988, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release_n();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_232E22A44()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_232E22A5C(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = sub_232E32BA8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_232E32B28();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  long long v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E22C90();
  long long v11 = a2[1];
  v14[0] = *a2;
  v14[1] = v11;
  long long v12 = a2[3];
  void v14[2] = a2[2];
  v14[3] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750208);
  sub_232E03E14(&qword_268750210, &qword_268750208);
  sub_232E23990(&qword_268750218, 255, MEMORY[0x263F608F0]);
  sub_232E32CA8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_232E22C90()
{
  uint64_t v2 = sub_232E32E88();
  MEMORY[0x270FA5388](v2 - 8);
  id v3 = objc_msgSend(v0, sel_messageType);
  if (!v3)
  {
    sub_232E239D8();
    swift_allocError();
    *uint64_t v14 = 0;
    return swift_willThrow();
  }
  uint64_t v4 = v3;
  uint64_t v5 = sub_232E33368();
  uint64_t v7 = v6;

  id v8 = objc_msgSend(v0, sel_payload);
  if (!v8
    || (*(void *)&long long v20 = v8,
        __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD50),
        __swift_instantiateConcreteTypeFromMangledName(&qword_26874FD58),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v0, sel_payload);
    if (v12)
    {
      id v13 = v12;
      *((void *)&v21 + 1) = swift_getObjectType();
      *(void *)&long long v20 = v13;
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
    }
    sub_232E12A98();
    swift_allocError();
    uint64_t v16 = v15;
    sub_232E02E38((uint64_t)&v20, v15);
    *(unsigned char *)(v16 + 32) = 0;
    return swift_willThrow();
  }
  id v9 = objc_msgSend(v0, sel_replyHandler, (void)v20);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_232E239D8();
    swift_allocError();
    unsigned char *v17 = 1;
    return swift_willThrow();
  }
  id v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)&long long v20 = v5;
  *((void *)&v20 + 1) = v7;
  sub_232E23A2C();
  sub_232E23A80();
  sub_232E33118();
  if (v1)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    sub_232E32E18();
    sub_232E32B18();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = sub_232E12B24;
    *(void *)(v19 + 24) = v11;
    return sub_232E32B48();
  }
}

uint64_t type metadata accessor for ServiceHubPreviewService()
{
  return self;
}

uint64_t sub_232E23258()
{
  return swift_retain();
}

unint64_t sub_232E2326C()
{
  if (*v0) {
    return 0xD000000000000015;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_232E232AC()
{
  return 0;
}

uint64_t sub_232E232B4(uint64_t a1)
{
  unint64_t v2 = sub_232E245F8();

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_232E232F0(uint64_t a1)
{
  unint64_t v2 = sub_232E245F8();

  return MEMORY[0x270F55A08](a1, v2);
}

unint64_t sub_232E2332C()
{
  return 0xD000000000000025;
}

uint64_t sub_232E23348(uint64_t a1)
{
  unint64_t v2 = sub_232E2373C();

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_232E23384(uint64_t a1)
{
  unint64_t v2 = sub_232E2373C();

  return MEMORY[0x270F55A08](a1, v2);
}

uint64_t sub_232E233C0()
{
  uint64_t v3 = 0;
  unint64_t v4 = 0xE000000000000000;
  sub_232E12E80(v0, (uint64_t)v2, (uint64_t *)&unk_268750230);
  sub_232E02EA0((uint64_t)v2, (uint64_t *)&unk_268750230);
  sub_232E333A8();
  swift_bridgeObjectRelease();
  sub_232E333A8();
  sub_232E333A8();
  swift_bridgeObjectRelease();
  sub_232E333A8();
  return v3;
}

uint64_t sub_232E234D4()
{
  sub_232E12E80(v0, (uint64_t)&v3, (uint64_t *)&unk_268750230);
  if (v4)
  {
    sub_232E2464C(&v3, v2);
    sub_232E335C8();
    sub_232E333A8();
    sub_232E335F8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  }
  return 0;
}

uint64_t sub_232E235AC(uint64_t a1)
{
  unint64_t v2 = sub_232E2465C();

  return MEMORY[0x270F55A28](a1, v2);
}

uint64_t sub_232E235E8(uint64_t a1)
{
  unint64_t v2 = sub_232E2465C();

  return MEMORY[0x270F55A08](a1, v2);
}

uint64_t sub_232E23624(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_232E2365C(uint64_t (*a1)(void))
{
  return a1();
}

void sub_232E23684(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_232E33568();
  *a1 = v7;
  id v8 = *a2;
  if (*a2)
  {
    *id v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_232E2373C()
{
  unint64_t result = qword_2687501C8;
  if (!qword_2687501C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687501C8);
  }
  return result;
}

uint64_t sub_232E23790()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_232E237C8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_232E237D8()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_232E23820()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_232E128EC;
  *(void *)(v3 + 120) = v2;
  *(_OWORD *)(v3 + 104) = v4;
  return MEMORY[0x270FA2498](sub_232E226CC, 0, 0);
}

uint64_t sub_232E238D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E210B0(a1, a2, a3, sub_232E17820);
}

uint64_t sub_232E23908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_232E210B0(a1, a2, a3, sub_232E1783C);
}

uint64_t sub_232E23938()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_232E23988(uint64_t a1)
{
  return sub_232E22A5C(a1, (_OWORD *)(v1 + 16));
}

uint64_t sub_232E23990(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_232E239D8()
{
  unint64_t result = qword_268750220;
  if (!qword_268750220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750220);
  }
  return result;
}

unint64_t sub_232E23A2C()
{
  unint64_t result = qword_268750240;
  if (!qword_268750240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750240);
  }
  return result;
}

unint64_t sub_232E23A80()
{
  unint64_t result = qword_268750248;
  if (!qword_268750248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750248);
  }
  return result;
}

uint64_t sub_232E23AD4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_232E23B10()
{
  return sub_232E16590();
}

uint64_t sub_232E23B20()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_232E23B60(void *a1)
{
  sub_232E21BBC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_232E23B68()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_232E23B90(uint64_t a1)
{
  return sub_232E21E80(a1, v1);
}

uint64_t sub_232E23B98(void *a1)
{
  return sub_232E2204C(a1);
}

id sub_232E23BA0()
{
  uint64_t v1 = sub_232E32E88();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  long long v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_232E32AB8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned __int8 v14 = 2;
  (*(void (**)(unsigned char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F60F68], v5);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  uint64_t v9 = sub_232E029D0(&v14, (uint64_t)v8, (uint64_t)v4);
  if (v0)
  {
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    uint64_t v11 = v9;
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    id v12 = objc_allocWithZone((Class)type metadata accessor for ServiceHubPreviewService());
    return sub_232E222F8(v11);
  }
}

unsigned char *_s19ServiceMessageErrorOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x232E23E70);
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

ValueMetadata *_s19ServiceMessageErrorOMa()
{
  return &_s19ServiceMessageErrorON;
}

ValueMetadata *_s13WrappingErrorVMa()
{
  return &_s13WrappingErrorVN;
}

uint64_t _s12PayloadErrorVwxx(uint64_t result)
{
  if (*(void *)(result + 24)) {
    return __swift_destroy_boxed_opaque_existential_1Tm(result);
  }
  return result;
}

uint64_t _s12PayloadErrorVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    *(void *)(a1 + 24) = v4;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t _s12PayloadErrorVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    int v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *int v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *int v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s12PayloadErrorVwta(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t _s12PayloadErrorVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 33)) {
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

uint64_t _s12PayloadErrorVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *_s12PayloadErrorVMa()
{
  return &_s12PayloadErrorVN;
}

unint64_t sub_232E24338()
{
  unint64_t result = qword_268750278;
  if (!qword_268750278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750278);
  }
  return result;
}

unint64_t sub_232E24390()
{
  unint64_t result = qword_268750280;
  if (!qword_268750280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750280);
  }
  return result;
}

unint64_t sub_232E243E8()
{
  unint64_t result = qword_268750288;
  if (!qword_268750288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750288);
  }
  return result;
}

unint64_t sub_232E24444()
{
  unint64_t result = qword_268750290;
  if (!qword_268750290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750290);
  }
  return result;
}

unint64_t sub_232E2449C()
{
  unint64_t result = qword_268750298;
  if (!qword_268750298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750298);
  }
  return result;
}

unint64_t sub_232E244F4()
{
  unint64_t result = qword_2687502A0;
  if (!qword_2687502A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502A0);
  }
  return result;
}

unint64_t sub_232E2454C()
{
  unint64_t result = qword_2687502A8;
  if (!qword_2687502A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502A8);
  }
  return result;
}

unint64_t sub_232E245A4()
{
  unint64_t result = qword_2687502B0;
  if (!qword_2687502B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502B0);
  }
  return result;
}

unint64_t sub_232E245F8()
{
  unint64_t result = qword_2687502B8;
  if (!qword_2687502B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502B8);
  }
  return result;
}

_OWORD *sub_232E2464C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_232E2465C()
{
  unint64_t result = qword_2687502C0;
  if (!qword_2687502C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502C0);
  }
  return result;
}

uint64_t sub_232E246D0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x4377656976657270;
  }
  else {
    uint64_t v3 = 0x656C746974;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xEC000000746E756FLL;
  }
  if (a2) {
    uint64_t v5 = 0x4377656976657270;
  }
  else {
    uint64_t v5 = 0x656C746974;
  }
  if (a2) {
    unint64_t v6 = 0xEC000000746E756FLL;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E24778(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x7463655365726F6DLL;
  }
  else {
    uint64_t v3 = 0x6365537473726966;
  }
  if (v2) {
    unint64_t v4 = 0xEC0000006E6F6974;
  }
  else {
    unint64_t v4 = 0xEC000000736E6F69;
  }
  if (a2) {
    uint64_t v5 = 0x7463655365726F6DLL;
  }
  else {
    uint64_t v5 = 0x6365537473726966;
  }
  if (a2) {
    unint64_t v6 = 0xEC000000736E6F69;
  }
  else {
    unint64_t v6 = 0xEC0000006E6F6974;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E2482C(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x77656976657270;
  }
  else {
    uint64_t v2 = 0x6E6F6974636573;
  }
  if (a2) {
    uint64_t v3 = 0x77656976657270;
  }
  else {
    uint64_t v3 = 0x6E6F6974636573;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_232E33698();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_232E248AC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000013;
  }
  else {
    unint64_t v3 = 0x5077656976657270;
  }
  if (v2) {
    unint64_t v4 = 0xEE0064616F6C7961;
  }
  else {
    unint64_t v4 = 0x8000000232E36A70;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000013;
  }
  else {
    unint64_t v5 = 0x5077656976657270;
  }
  if (a2) {
    unint64_t v6 = 0x8000000232E36A70;
  }
  else {
    unint64_t v6 = 0xEE0064616F6C7961;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E24960(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x656449656E656373;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xEF7265696669746ELL;
  }
  if (a2) {
    uint64_t v5 = 0x656449656E656373;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xEF7265696669746ELL;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E24A18(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000017;
  unint64_t v3 = 0x8000000232E369D0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000017;
  switch(v4)
  {
    case 1:
      unint64_t v6 = "createPreviewSceneAgent";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000016;
      unint64_t v6 = "connectHostToAgentPipe";
      goto LABEL_5;
    case 3:
      unint64_t v6 = "connectShellToAgentPipe";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x8000000232E369D0;
  switch(a2)
  {
    case 1:
      uint64_t v8 = "createPreviewSceneAgent";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000016;
      uint64_t v8 = "connectHostToAgentPipe";
      goto LABEL_10;
    case 3:
      uint64_t v8 = "connectShellToAgentPipe";
LABEL_10:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_232E24B64(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 7107189;
  }
  else {
    uint64_t v3 = 0x696D697263736964;
  }
  if (v2) {
    unint64_t v4 = 0xEC000000746E616ELL;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  if (a2) {
    uint64_t v5 = 7107189;
  }
  else {
    uint64_t v5 = 0x696D697263736964;
  }
  if (a2) {
    unint64_t v6 = 0xE300000000000000;
  }
  else {
    unint64_t v6 = 0xEC000000746E616ELL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E24C08(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000016;
  }
  else {
    unint64_t v3 = 0x4C525579706F63;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000;
  }
  else {
    unint64_t v4 = 0x8000000232E369A0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000016;
  }
  else {
    unint64_t v5 = 0x4C525579706F63;
  }
  if (a2) {
    unint64_t v6 = 0x8000000232E369A0;
  }
  else {
    unint64_t v6 = 0xE700000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_232E24CB0(char a1, char a2)
{
  if (a1) {
    uint64_t v2 = 0x646950746E656761;
  }
  else {
    uint64_t v2 = 0x44496D6165727473;
  }
  if (a2) {
    uint64_t v3 = 0x646950746E656761;
  }
  else {
    uint64_t v3 = 0x44496D6165727473;
  }
  if (v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_232E33698();
  }
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_232E24D30(char a1, char a2)
{
  if (*(void *)&aDiscrimimetada_0[8 * a1] == *(void *)&aDiscrimimetada_0[8 * a2]
    && *(void *)&aDiscrimimetada_0[8 * a1 + 24] == *(void *)&aDiscrimimetada_0[8 * a2 + 24])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_232E24DB8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x4777656976657270;
    }
    else {
      unint64_t v3 = 0xD000000000000011;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEC00000070756F72;
    }
    else {
      unint64_t v4 = 0x8000000232E36AE0;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0x4777656976657270;
      }
      else {
        unint64_t v6 = 0xD000000000000011;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEC00000070756F72;
      }
      else {
        unint64_t v7 = 0x8000000232E36AE0;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x7250656C676E6973;
    unint64_t v4 = 0xED00007765697665;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xED00007765697665;
  if (v3 != 0x7250656C676E6973)
  {
LABEL_21:
    char v8 = sub_232E33698();
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

uint64_t sub_232E24EF0(char a1, char a2)
{
  if (*(void *)&aDiscrimimessag[8 * a1] == *(void *)&aDiscrimimessag[8 * a2]
    && *(void *)&aNant[8 * a1] == *(void *)&aNant[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_232E33698();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_232E24F78(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x8000000232E369A0;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xE700000000000000;
      unint64_t v3 = 0x4C525579706F63;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0x8000000232E36B20;
      unint64_t v3 = 0xD000000000000010;
      break;
    default:
      unint64_t v3 = 0x5377656976657270;
      unint64_t v4 = 0xEE00656369767265;
      break;
  }
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x8000000232E369A0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE700000000000000;
      unint64_t v5 = 0x4C525579706F63;
      goto LABEL_9;
    case 2:
LABEL_9:
      if (v3 != v5) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 3:
      unint64_t v6 = 0x8000000232E36B20;
      if (v3 == 0xD000000000000010) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
      unint64_t v6 = 0xEE00656369767265;
      if (v3 != 0x5377656976657270) {
        goto LABEL_14;
      }
LABEL_12:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_232E33698();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_232E25128()
{
  return sub_232E33768();
}

uint64_t sub_232E251A0()
{
  return sub_232E33768();
}

uint64_t sub_232E25228()
{
  return sub_232E33768();
}

uint64_t sub_232E252AC()
{
  return sub_232E33768();
}

uint64_t sub_232E25380()
{
  return sub_232E33768();
}

uint64_t sub_232E25418()
{
  return sub_232E33768();
}

uint64_t sub_232E254AC()
{
  return sub_232E33768();
}

uint64_t sub_232E25524()
{
  return sub_232E33768();
}

uint64_t sub_232E255B8()
{
  return sub_232E33768();
}

uint64_t sub_232E25640()
{
  return sub_232E33768();
}

uint64_t sub_232E256FC()
{
  return sub_232E33768();
}

uint64_t sub_232E25768()
{
  return sub_232E33768();
}

uint64_t sub_232E2585C()
{
  return sub_232E33768();
}

uint64_t sub_232E258C8()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25938()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E259B4()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25A0C()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25A88()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25B08()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25BBC()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25C28()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25C98()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25CF0()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25D44()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25DE8()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25E3C()
{
  sub_232E33398();

  return swift_bridgeObjectRelease();
}

uint64_t sub_232E25F1C()
{
  return sub_232E33768();
}

uint64_t sub_232E2600C()
{
  return sub_232E33768();
}

uint64_t sub_232E26074()
{
  return sub_232E33768();
}

uint64_t sub_232E2612C()
{
  return sub_232E33768();
}

uint64_t sub_232E26194()
{
  return sub_232E33768();
}

uint64_t sub_232E26208()
{
  return sub_232E33768();
}

uint64_t sub_232E2628C()
{
  return sub_232E33768();
}

uint64_t sub_232E2630C()
{
  return sub_232E33768();
}

uint64_t sub_232E263DC()
{
  return sub_232E33768();
}

uint64_t sub_232E26470()
{
  return sub_232E33768();
}

uint64_t sub_232E26500()
{
  return sub_232E33768();
}

uint64_t sub_232E26574()
{
  return sub_232E33768();
}

uint64_t sub_232E26604()
{
  return sub_232E33768();
}

unint64_t sub_232E26688(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4C525579706F63;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      unint64_t result = 0x5377656976657270;
      break;
  }
  return result;
}

uint64_t sub_232E26734(char *a1, char *a2)
{
  return sub_232E24F78(*a1, *a2);
}

uint64_t sub_232E26740()
{
  return sub_232E25768();
}

uint64_t sub_232E26748()
{
  return sub_232E25E3C();
}

uint64_t sub_232E26750()
{
  return sub_232E25F1C();
}

uint64_t sub_232E26758@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E285BC();
  *a1 = result;
  return result;
}

unint64_t sub_232E26788@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_232E26688(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E267B4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_232E28568();
  uint64_t v5 = MEMORY[0x263F60648];

  return MEMORY[0x270F55C68](a1, a2, v4, v5);
}

uint64_t sub_232E26810()
{
  return sub_232E33118();
}

uint64_t sub_232E26878(char a1)
{
  return *(void *)&aDiscrimimessag[8 * a1];
}

uint64_t sub_232E26898(char *a1, char *a2)
{
  return sub_232E24EF0(*a1, *a2);
}

uint64_t sub_232E268A4()
{
  return sub_232E2585C();
}

uint64_t sub_232E268AC()
{
  return sub_232E25DE8();
}

uint64_t sub_232E268B4()
{
  return sub_232E2600C();
}

uint64_t sub_232E268BC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_232E28608();
  *a1 = result;
  return result;
}

uint64_t sub_232E268EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_232E26878(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_232E26918()
{
  return sub_232E26878(*v0);
}

uint64_t DaemonToShell.TwoWayMessage.propertyListValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687502D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v44 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_232E32C38();
  uint64_t v42 = *(void *)(v4 - 8);
  uint64_t v43 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v41 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687502D8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v40 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_232E32CF8();
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  MEMORY[0x270FA5388](v8);
  char v37 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687502E0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v36 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_232E32AF8();
  uint64_t v35 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unsigned __int8 v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687502E8);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_232E32B28();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  long long v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for DaemonToShell.TwoWayMessage();
  MEMORY[0x270FA5388](v22);
  char v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = v1;
  unint64_t v25 = sub_232E272C0();
  sub_232E27314();
  sub_232E32E68();
  sub_232E27368(v1, (uint64_t)v24);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v31 = v35;
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v14, v24, v12);
      uint64_t v32 = (uint64_t)v36;
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v36, v14, v12);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v32, 0, 1, v12);
      uint64_t v48 = &type metadata for DaemonToShell.TwoWayMessage.Key;
      unint64_t v49 = v25;
      v47[0] = 2;
      sub_232E273CC(&qword_268750310, MEMORY[0x263F60878]);
      sub_232E32DE8();
      sub_232E02EA0(v32, &qword_2687502E0);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v12);
      break;
    case 2u:
      uint64_t v27 = v37;
      uint64_t v26 = v38;
      uint64_t v28 = v39;
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v37, v24, v39);
      uint64_t v29 = (uint64_t)v40;
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v40, v27, v28);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v29, 0, 1, v28);
      uint64_t v48 = &type metadata for DaemonToShell.TwoWayMessage.Key;
      unint64_t v49 = v25;
      v47[0] = 2;
      sub_232E273CC(&qword_268750308, MEMORY[0x263F60C60]);
      sub_232E32DE8();
      uint64_t v30 = &qword_2687502D8;
      goto LABEL_5;
    case 3u:
      uint64_t v27 = v41;
      uint64_t v26 = v42;
      uint64_t v28 = v43;
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v24, v43);
      uint64_t v29 = (uint64_t)v44;
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v44, v27, v28);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(v29, 0, 1, v28);
      uint64_t v48 = &type metadata for DaemonToShell.TwoWayMessage.Key;
      unint64_t v49 = v25;
      v47[0] = 2;
      sub_232E273CC(&qword_268750300, MEMORY[0x263F60A38]);
      sub_232E32DE8();
      uint64_t v30 = &qword_2687502D0;
LABEL_5:
      sub_232E02EA0(v29, v30);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v28);
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v24, v18);
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v17, v21, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v17, 0, 1, v18);
      uint64_t v48 = &type metadata for DaemonToShell.TwoWayMessage.Key;
      unint64_t v49 = v25;
      v47[0] = 1;
      sub_232E273CC(&qword_268750218, MEMORY[0x263F608F0]);
      sub_232E32DE8();
      sub_232E02EA0((uint64_t)v17, &qword_2687502E8);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
}

uint64_t type metadata accessor for DaemonToShell.TwoWayMessage()
{
  uint64_t result = qword_268750328;
  if (!qword_268750328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_232E27164(unsigned char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DaemonToShell.TwoWayMessage();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_232E27368(a3, (uint64_t)v8);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v9 = sub_232E32AF8();
      char v10 = 1;
      break;
    case 2u:
      uint64_t v9 = sub_232E32CF8();
      char v10 = 2;
      break;
    case 3u:
      uint64_t v9 = sub_232E32C38();
      char v10 = 3;
      break;
    default:
      uint64_t v9 = sub_232E32B28();
      char v10 = 0;
      break;
  }
  uint64_t result = (*(uint64_t (**)(char *))(*(void *)(v9 - 8) + 8))(v8);
  *a2 = v10;
  return result;
}

uint64_t sub_232E272B8(unsigned char *a1, char *a2)
{
  return sub_232E27164(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_232E272C0()
{
  unint64_t result = qword_2687502F0;
  if (!qword_2687502F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502F0);
  }
  return result;
}

unint64_t sub_232E27314()
{
  unint64_t result = qword_2687502F8;
  if (!qword_2687502F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687502F8);
  }
  return result;
}

uint64_t sub_232E27368(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DaemonToShell.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_232E273CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t DaemonToShell.TwoWayMessage.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = type metadata accessor for DaemonToShell.TwoWayMessage();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  char v10 = &v24[-v9 - 8];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = &v24[-v12 - 8];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v24[-v14 - 8];
  unint64_t v25 = &type metadata for DaemonToShell.TwoWayMessage.Key;
  unint64_t v16 = sub_232E272C0();
  unint64_t v26 = v16;
  v24[0] = 0;
  sub_232E27314();
  sub_232E32DF8();
  if (v2)
  {
    uint64_t v17 = sub_232E32E88();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1, v17);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
    switch(v27)
    {
      case 1:
        unint64_t v25 = &type metadata for DaemonToShell.TwoWayMessage.Key;
        unint64_t v26 = v16;
        v24[0] = 2;
        sub_232E32AF8();
        sub_232E273CC(&qword_268750310, MEMORY[0x263F60878]);
        sub_232E32DF8();
        uint64_t v20 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(a1, v20);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
        swift_storeEnumTagMultiPayload();
        uint64_t v15 = v13;
        break;
      case 2:
        unint64_t v25 = &type metadata for DaemonToShell.TwoWayMessage.Key;
        unint64_t v26 = v16;
        v24[0] = 2;
        sub_232E32CF8();
        sub_232E273CC(&qword_268750308, MEMORY[0x263F60C60]);
        sub_232E32DF8();
        uint64_t v21 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(a1, v21);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
        swift_storeEnumTagMultiPayload();
        uint64_t v15 = v10;
        break;
      case 3:
        unint64_t v25 = &type metadata for DaemonToShell.TwoWayMessage.Key;
        unint64_t v26 = v16;
        v24[0] = 2;
        sub_232E32C38();
        sub_232E273CC(&qword_268750300, MEMORY[0x263F60A38]);
        sub_232E32DF8();
        uint64_t v22 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(a1, v22);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
        swift_storeEnumTagMultiPayload();
        uint64_t v15 = v7;
        break;
      default:
        unint64_t v25 = &type metadata for DaemonToShell.TwoWayMessage.Key;
        unint64_t v26 = v16;
        v24[0] = 1;
        sub_232E32B28();
        sub_232E273CC(&qword_268750218, MEMORY[0x263F608F0]);
        sub_232E32DF8();
        uint64_t v19 = sub_232E32E88();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(a1, v19);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
        swift_storeEnumTagMultiPayload();
        break;
    }
    return sub_232E278F8((uint64_t)v15, v23);
  }
}

uint64_t sub_232E278F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DaemonToShell.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_232E2795C(uint64_t a1)
{
  unint64_t result = sub_232E27984();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_232E27984()
{
  unint64_t result = qword_268750318;
  if (!qword_268750318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750318);
  }
  return result;
}

unint64_t sub_232E279D8(uint64_t a1)
{
  unint64_t result = sub_232E27A00();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_232E27A00()
{
  unint64_t result = qword_268750320;
  if (!qword_268750320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750320);
  }
  return result;
}

uint64_t sub_232E27A58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return DaemonToShell.TwoWayMessage.init(propertyListValue:)(a1, a2);
}

ValueMetadata *type metadata accessor for DaemonToShell()
{
  return &type metadata for DaemonToShell;
}

uint64_t *initializeBufferWithCopyOfBuffer for DaemonToShell.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v10 = sub_232E32AF8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        break;
      case 2u:
        uint64_t v8 = sub_232E32CF8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        break;
      case 3u:
        uint64_t v9 = sub_232E32C38();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
      default:
        uint64_t v6 = sub_232E32B28();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for DaemonToShell.TwoWayMessage(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = sub_232E32B28();
      goto LABEL_6;
    case 1:
      uint64_t v3 = sub_232E32AF8();
      goto LABEL_6;
    case 2:
      uint64_t v3 = sub_232E32CF8();
      goto LABEL_6;
    case 3:
      uint64_t v3 = sub_232E32C38();
LABEL_6:
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for DaemonToShell.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = sub_232E32AF8();
      break;
    case 2u:
      uint64_t v4 = sub_232E32CF8();
      break;
    case 3u:
      uint64_t v4 = sub_232E32C38();
      break;
    default:
      uint64_t v4 = sub_232E32B28();
      break;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for DaemonToShell.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_232E27F28(a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v4 = sub_232E32AF8();
        break;
      case 2u:
        uint64_t v4 = sub_232E32CF8();
        break;
      case 3u:
        uint64_t v4 = sub_232E32C38();
        break;
      default:
        uint64_t v4 = sub_232E32B28();
        break;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_232E27F28(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DaemonToShell.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for DaemonToShell.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = sub_232E32AF8();
      break;
    case 2u:
      uint64_t v4 = sub_232E32CF8();
      break;
    case 3u:
      uint64_t v4 = sub_232E32C38();
      break;
    default:
      uint64_t v4 = sub_232E32B28();
      break;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for DaemonToShell.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_232E27F28(a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v4 = sub_232E32AF8();
        break;
      case 2u:
        uint64_t v4 = sub_232E32CF8();
        break;
      case 3u:
        uint64_t v4 = sub_232E32C38();
        break;
      default:
        uint64_t v4 = sub_232E32B28();
        break;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_232E28164()
{
  uint64_t result = sub_232E32B28();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_232E32AF8();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_232E32CF8();
      if (v3 <= 0x3F)
      {
        uint64_t result = sub_232E32C38();
        if (v4 <= 0x3F)
        {
          swift_initEnumMetadataMultiPayload();
          return 0;
        }
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServiceHubToShell()
{
  return &type metadata for ServiceHubToShell;
}

unsigned char *storeEnumTagSinglePayload for DaemonToShell.TwoWayMessage.Discriminant(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x232E2837CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DaemonToShell.TwoWayMessage.Discriminant()
{
  return &type metadata for DaemonToShell.TwoWayMessage.Discriminant;
}

unsigned char *storeEnumTagSinglePayload for DaemonToShell.TwoWayMessage.Key(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x232E28480);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DaemonToShell.TwoWayMessage.Key()
{
  return &type metadata for DaemonToShell.TwoWayMessage.Key;
}

unint64_t sub_232E284BC()
{
  unint64_t result = qword_268750338;
  if (!qword_268750338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750338);
  }
  return result;
}

unint64_t sub_232E28514()
{
  unint64_t result = qword_268750340;
  if (!qword_268750340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750340);
  }
  return result;
}

unint64_t sub_232E28568()
{
  unint64_t result = qword_268750348;
  if (!qword_268750348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750348);
  }
  return result;
}

uint64_t sub_232E285BC()
{
  unint64_t v0 = sub_232E33648();
  swift_bridgeObjectRelease();
  if (v0 >= 4) {
    return 4;
  }
  else {
    return v0;
  }
}

uint64_t sub_232E28608()
{
  unint64_t v0 = sub_232E33648();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_232E28654()
{
  type metadata accessor for TransactionManager();
  uint64_t v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750368);
  uint64_t result = sub_232E332A8();
  *(void *)(v0 + 16) = result;
  qword_268750350 = v0;
  return result;
}

uint64_t static TransactionManager.shared.getter()
{
  if (qword_26874F4F0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_232E28718()
{
  uint64_t result = *v0;
  sub_232E2A268();
  return result;
}

uint64_t TransactionManager.currentState.getter()
{
  return swift_release();
}

uint64_t sub_232E287E0(uint64_t *a1)
{
  uint64_t v1 = *a1;
  sub_232E32E78();
  return sub_232E28880(v1);
}

unint64_t sub_232E28824()
{
  unint64_t result = qword_268750360;
  if (!qword_268750360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268750358);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750360);
  }
  return result;
}

uint64_t sub_232E28880(uint64_t a1)
{
  uint64_t v27 = sub_232E32E88();
  MEMORY[0x270FA5388](v27);
  unsigned int v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v25 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & v5;
  int64_t v26 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v28 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26) {
      return swift_release();
    }
    unint64_t v22 = *(void *)(v25 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v26) {
        return swift_release();
      }
      unint64_t v22 = *(void *)(v25 + 8 * v11);
      if (!v22)
      {
        int64_t v11 = v21 + 2;
        if (v21 + 2 >= v26) {
          return swift_release();
        }
        unint64_t v22 = *(void *)(v25 + 8 * v11);
        if (!v22)
        {
          int64_t v11 = v21 + 3;
          if (v21 + 3 >= v26) {
            return swift_release();
          }
          unint64_t v22 = *(void *)(v25 + 8 * v11);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v22 - 1) & v22;
    unint64_t v13 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_5:
    uint64_t v14 = *(void *)(*(void *)(v28 + 48) + 16 * v13 + 8);
    uint64_t v15 = *(void *)(v28 + 56) + 32 * v13;
    uint64_t v16 = *(void *)(v15 + 8);
    uint64_t v17 = *(void *)(v15 + 16);
    MEMORY[0x270FA5388](result);
    *(&v24 - 6) = v18;
    *(&v24 - 5) = v14;
    *(&v24 - 4) = v19;
    *(&v24 - 3) = v16;
    *(&v24 - 2) = v17;
    *(&v24 - 1) = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_232E32E68();
    sub_232E32E08();
    (*v9)(v4, v27);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v23 = v21 + 4;
  if (v23 >= v26) {
    return swift_release();
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v26) {
      return swift_release();
    }
    unint64_t v22 = *(void *)(v25 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_232E28B78(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  uint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v12 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  for (v5 &= v5 - 1; ; uint64_t v5 = (v9 - 1) & v9)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_232E28E98();
    if (v1)
    {
      swift_release();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v7 >= v12) {
      return swift_release();
    }
    uint64_t v9 = *(void *)(v2 + 8 * v7);
    if (!v9)
    {
      int64_t v10 = v7 + 1;
      if (v7 + 1 >= v12) {
        return swift_release();
      }
      uint64_t v9 = *(void *)(v2 + 8 * v10);
      if (v9) {
        goto LABEL_14;
      }
      int64_t v10 = v7 + 2;
      if (v7 + 2 >= v12) {
        return swift_release();
      }
      uint64_t v9 = *(void *)(v2 + 8 * v10);
      if (v9) {
        goto LABEL_14;
      }
      int64_t v10 = v7 + 3;
      if (v7 + 3 >= v12) {
        return swift_release();
      }
      uint64_t v9 = *(void *)(v2 + 8 * v10);
      if (v9)
      {
LABEL_14:
        int64_t v7 = v10;
        continue;
      }
      int64_t v11 = v7 + 4;
      if (v7 + 4 >= v12) {
        return swift_release();
      }
      uint64_t v9 = *(void *)(v2 + 8 * v11);
      v7 += 4;
      if (!v9) {
        break;
      }
    }
LABEL_15:
    ;
  }
  while (1)
  {
    int64_t v7 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v7 >= v12) {
      return swift_release();
    }
    uint64_t v9 = *(void *)(v2 + 8 * v7);
    ++v11;
    if (v9) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t TransactionManager.debugDescription.getter()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750358);
  sub_232E28824();
  sub_232E33128();
  swift_release();
  return v1;
}

uint64_t sub_232E28E40@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = sub_232E28B78(*a1);
  *a2 = 0xD000000000000014;
  a2[1] = 0x8000000232E38010;
  return result;
}

uint64_t sub_232E28E98()
{
  return swift_bridgeObjectRelease();
}

uint64_t TransactionManager.takeTransaction(for:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v5 = sub_232E332F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E332B8();
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_232E332D8();
  os_log_type_t v10 = sub_232E33508();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = a1;
    int64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = v13;
    *(_DWORD *)int64_t v12 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_232E093C4(v25, a2, &v29);
    sub_232E33568();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_232DFE000, v9, v10, "Taking transaction for %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v13, -1, -1);
    uint64_t v14 = v12;
    a1 = v25;
    MEMORY[0x237DB3E80](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v15 = v26;
  uint64_t v29 = *(void *)(v26 + 16);
  MEMORY[0x270FA5388](v29);
  swift_retain();
  uint64_t v16 = a1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750358);
  unint64_t v18 = sub_232E28824();
  uint64_t v23 = MEMORY[0x263F8EE60] + 8;
  unint64_t v24 = v18;
  uint64_t v21 = (uint64_t)&v21;
  unint64_t v22 = (uint64_t (*)())v17;
  sub_232E33138();
  swift_release();
  uint64_t v19 = (void *)swift_allocObject();
  long long v19[2] = v16;
  v19[3] = a2;
  unsigned char v19[4] = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v22 = sub_232E29BA4;
  uint64_t v23 = (uint64_t)v19;
  LOBYTE(v21) = 2;
  return sub_232E32F48();
}

uint64_t sub_232E292A8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E332F8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int64_t v12 = (char *)&v46 - v11;
  uint64_t v13 = *a1;
  if (*(void *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_232E3244C(a2, a3);
    if (v15)
    {
      uint64_t v51 = v7;
      uint64_t v52 = v6;
      uint64_t v16 = (uint64_t *)(*(void *)(v13 + 56) + 32 * v14);
      uint64_t v17 = *v16;
      uint64_t v18 = v16[1];
      uint64_t v20 = v16[2];
      uint64_t v19 = v16[3];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      uint64_t result = swift_bridgeObjectRelease();
      v57[0] = v17;
      v57[1] = v18;
      uint64_t v57[2] = v20;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
      }
      else
      {
        v57[3] = v19 + 1;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v56 = *a1;
        *a1 = 0x8000000000000000;
        sub_232E2F1D4(v17, v18, v20, v19 + 1, a2, a3, isUniquelyReferenced_nonNull_native);
        *a1 = v56;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_232E332B8();
        uint64_t v23 = sub_232E332D8();
        os_log_type_t v24 = sub_232E33508();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          uint64_t v54 = swift_slowAlloc();
          uint64_t v58 = v54;
          *(_DWORD *)uint64_t v25 = 136315138;
          uint64_t v53 = v25 + 4;
          swift_beginAccess();
          uint64_t v26 = v57[0];
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          sub_232E2A268();
          unint64_t v28 = v27;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v55 = sub_232E093C4(v26, v28, &v58);
          sub_232E33568();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_232DFE000, v23, v24, "Transaction now %s", v25, 0xCu);
          uint64_t v29 = v54;
          swift_arrayDestroy();
          MEMORY[0x237DB3E80](v29, -1, -1);
          MEMORY[0x237DB3E80](v25, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v51 + 8))(v10, v52);
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      return result;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v53 = (uint8_t *)a2;
  uint64_t v30 = sub_232E2A350(a2);
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v54 = v35;
  sub_232E332B8();
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain_n();
  uint64_t v36 = sub_232E332D8();
  os_log_type_t v37 = sub_232E33508();
  int v50 = v37;
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v52 = v6;
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    v57[0] = v48;
    uint64_t v49 = v30;
    *(_DWORD *)uint64_t v38 = 136315138;
    uint64_t v46 = v38 + 4;
    uint64_t v47 = v38;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v39 = v49;
    sub_232E2A268();
    uint64_t v51 = v7;
    uint64_t v40 = v39;
    unint64_t v42 = v41;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = sub_232E093C4(v40, v42, v57);
    uint64_t v30 = v49;
    sub_232E33568();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v43 = v47;
    _os_log_impl(&dword_232DFE000, v36, (os_log_type_t)v50, "Transaction now %s", v47, 0xCu);
    uint64_t v44 = v48;
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v44, -1, -1);
    MEMORY[0x237DB3E80](v43, -1, -1);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v52);
  }
  else
  {

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  char v45 = swift_isUniquelyReferenced_nonNull_native();
  v57[0] = *a1;
  *a1 = 0x8000000000000000;
  sub_232E2F1D4(v30, v32, v34, v54, (uint64_t)v53, a3, v45);
  *a1 = v57[0];
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_232E29870(uint64_t *a1)
{
  return sub_232E292A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_232E2988C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_232E332F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E332B8();
  swift_bridgeObjectRetain_n();
  os_log_type_t v10 = sub_232E332D8();
  os_log_type_t v11 = sub_232E33508();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = a3;
    uint64_t v15 = v14;
    uint64_t v25 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_232E093C4(v23, a2, &v25);
    sub_232E33568();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_232DFE000, v10, v11, "Cancelling transaction for %s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v15;
    a3 = v22;
    MEMORY[0x237DB3E80](v16, -1, -1);
    MEMORY[0x237DB3E80](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v25 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](v25);
  swift_retain();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750358);
  unint64_t v18 = sub_232E28824();
  v20[2] = MEMORY[0x263F8EE60] + 8;
  v20[3] = v18;
  v20[0] = v20;
  v20[1] = v17;
  sub_232E33138();
  return swift_release();
}

uint64_t sub_232E29B64()
{
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_232E29BA4()
{
  return sub_232E2988C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_232E29BB0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_232E332F8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = MEMORY[0x270FA5388](v7);
  os_log_type_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a1;
  if (*(void *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = sub_232E3244C(a2, a3);
    if (v14)
    {
      uint64_t v42 = a2;
      uint64_t v43 = v3;
      uint64_t v15 = (uint64_t *)(*(void *)(v12 + 56) + 32 * v13);
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      uint64_t v18 = v15[2];
      uint64_t v19 = v15[3];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v45 = v17;
      uint64_t v46 = v16;
      uint64_t v47 = v18;
      if (__OFSUB__(v19, 1))
      {
        __break(1u);
      }
      else
      {
        uint64_t v48 = v19 - 1;
        sub_232E332B8();
        uint64_t v20 = sub_232E332D8();
        os_log_type_t v21 = sub_232E33508();
        int v22 = v21;
        if (os_log_type_enabled(v20, v21))
        {
          os_log_t v41 = v20;
          uint64_t v23 = swift_slowAlloc();
          int v39 = v22;
          uint64_t v24 = (uint8_t *)v23;
          uint64_t v40 = swift_slowAlloc();
          v44[0] = v40;
          *(_DWORD *)uint64_t v24 = 136315138;
          v37[1] = v24 + 12;
          uint64_t v38 = v24;
          v37[0] = v24 + 4;
          swift_beginAccess();
          uint64_t v25 = v45;
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          sub_232E2A268();
          unint64_t v27 = v26;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v49 = sub_232E093C4(v25, v27, v44);
          sub_232E33568();
          swift_bridgeObjectRelease();
          uint64_t v20 = v41;
          unint64_t v28 = v38;
          _os_log_impl(&dword_232DFE000, v41, (os_log_type_t)v39, "Transaction now %s", v38, 0xCu);
          uint64_t v29 = v40;
          swift_arrayDestroy();
          MEMORY[0x237DB3E80](v29, -1, -1);
          MEMORY[0x237DB3E80](v28, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        swift_beginAccess();
        uint64_t v30 = v48;
        if (v48 < 1)
        {
          uint64_t v35 = sub_232E2D388(v42, a3);
          sub_232E2A30C(v35, v36);
        }
        else
        {
          uint64_t v31 = v45;
          uint64_t v32 = v46;
          uint64_t v33 = v47;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v49 = *a1;
          *a1 = 0x8000000000000000;
          sub_232E2F1D4(v31, v32, v33, v30, v42, a3, isUniquelyReferenced_nonNull_native);
          *a1 = v49;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t TransactionManager.deinit()
{
  swift_release();
  return v0;
}

uint64_t TransactionManager.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_232E29F90()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750358);
  sub_232E28824();
  sub_232E33128();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for TransactionManager()
{
  return self;
}

uint64_t method lookup function for TransactionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TransactionManager);
}

uint64_t destroy for TransactionManager.Transaction()
{
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

void *initializeWithCopy for TransactionManager.Transaction(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

void *assignWithCopy for TransactionManager.Transaction(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = a2[3];
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

uint64_t assignWithTake for TransactionManager.Transaction(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransactionManager.Transaction(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TransactionManager.Transaction(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TransactionManager.Transaction()
{
  return &type metadata for TransactionManager.Transaction;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_232E2A268()
{
}

uint64_t sub_232E2A2F0(uint64_t *a1)
{
  return sub_232E29BB0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_232E2A30C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_232E2A350(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_232E335C8();
  swift_bridgeObjectRelease();
  sub_232E333A8();
  swift_bridgeObjectRelease();
  sub_232E33388();
  swift_bridgeObjectRelease();
  uint64_t v2 = os_transaction_create();
  uint64_t result = swift_release();
  if (v2) {
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_232E2A420(void *a1, void *a2)
{
  uint64_t v4 = v2[3];
  uint64_t v5 = v2[4];
  *a1 = v2[2];
  a1[1] = v4;
  swift_bridgeObjectRetain();
  uint64_t result = v5;
  sub_232E2A268();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_232E2A474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750470);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_232E32D98();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_232E02EA0(a1, &qword_268750470);
    sub_232E2D534(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_232E02EA0((uint64_t)v10, &qword_268750470);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_232E2F4C4((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_232E2A650(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  unint64_t v28 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = *(void *)(a3 + 56);
  uint64_t v24 = a3 + 56;
  uint64_t v13 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & v12;
  uint64_t v27 = v6 + 16;
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v26 = v6 + 32;
  uint64_t v29 = a3;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v17 = 0;
  while (v15)
  {
    unint64_t v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    unint64_t v19 = v18 | (v17 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(void *)(v29 + 48) + *(void *)(v6 + 72) * v19, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    v28(v9);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    if (v3) {
      return swift_release();
    }
  }
  if (__OFADD__(v17++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v17 >= v25) {
    return swift_release();
  }
  unint64_t v21 = *(void *)(v24 + 8 * v17);
  if (v21)
  {
LABEL_19:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
    goto LABEL_5;
  }
  int64_t v22 = v17 + 1;
  if (v17 + 1 >= v25) {
    return swift_release();
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21) {
    goto LABEL_18;
  }
  int64_t v22 = v17 + 2;
  if (v17 + 2 >= v25) {
    return swift_release();
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21) {
    goto LABEL_18;
  }
  int64_t v22 = v17 + 3;
  if (v17 + 3 >= v25) {
    return swift_release();
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21) {
    goto LABEL_18;
  }
  int64_t v22 = v17 + 4;
  if (v17 + 4 >= v25) {
    return swift_release();
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
LABEL_18:
    int64_t v17 = v22;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v17 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v17 >= v25) {
      return swift_release();
    }
    unint64_t v21 = *(void *)(v24 + 8 * v17);
    ++v22;
    if (v21) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

char *sub_232E2A91C()
{
  if (qword_26874F500 != -1) {
    swift_once();
  }
  id v0 = objc_allocWithZone((Class)type metadata accessor for CrashReportListener());
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t result = sub_232E2AA3C(v1);
  qword_268750370 = (uint64_t)result;
  return result;
}

id static CrashReportListener.default.getter()
{
  if (qword_26874F4F8 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_268750370;

  return v0;
}

double sub_232E2A9EC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504C8);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_232E368C0;
  *(void *)(v0 + 32) = 3747891;
  *(void *)(v0 + 40) = 0xE300000000000000;
  qword_268750378 = v0;
  return result;
}

char *sub_232E2AA3C(uint64_t a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_state;
  char v16 = 0;
  uint64_t v17 = MEMORY[0x263F8EE80];
  uint64_t v18 = MEMORY[0x263F8EE80];
  uint64_t v19 = MEMORY[0x263F8EE80];
  uint64_t v5 = v1;
  *(void *)&v1[v4] = sub_232E332A8();
  *(void *)&v5[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_types] = a1;
  uint64_t v6 = (objc_class *)type metadata accessor for CrashReportListener.ObserverProxy();
  uint64_t v7 = (char *)objc_allocWithZone(v6);
  uint64_t v8 = &v7[OBJC_IVAR____TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy_diagnosticsLogHandler];
  *(void *)uint64_t v8 = nullsub_1;
  *((void *)v8 + 1) = 0;
  v15.receiver = v7;
  v15.super_class = v6;
  *(void *)&v5[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_observerProxy] = objc_msgSendSuper2(&v15, sel_init);

  v14.receiver = v5;
  v14.super_class = ObjectType;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v14, sel_init);
  uint64_t v10 = *(void *)&v9[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_observerProxy];
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = (void (**)(uint64_t, uint64_t, uint64_t))(v10
                                                        + OBJC_IVAR____TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy_diagnosticsLogHandler);
  *uint64_t v12 = sub_232E31994;
  v12[1] = (void (*)(uint64_t, uint64_t, uint64_t))v11;
  swift_release();
  return v9;
}

void sub_232E2AB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x237DB3F50](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    sub_232E3199C();
  }
}

Swift::Void __swiftcall CrashReportListener.startListeningIfNeeded()()
{
  uint64_t v1 = v0;
  swift_retain();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687503A0);
  uint64_t v3 = sub_232E03E14(&qword_2687503A8, &qword_2687503A0);
  uint64_t v13 = MEMORY[0x263F8D4F8];
  uint64_t v14 = v3;
  uint64_t v12 = v2;
  LOBYTE(v11) = 2;
  sub_232E33138();
  swift_release();
  if (v15 == 1)
  {
    if (qword_26874F508 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_232E332F8();
    __swift_project_value_buffer(v4, (uint64_t)qword_268750380);
    uint64_t v5 = sub_232E332D8();
    os_log_type_t v6 = sub_232E33528();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_232DFE000, v5, v6, "Request to start monitoring", v7, 2u);
      MEMORY[0x237DB3E80](v7, -1, -1);
    }

    id v8 = objc_msgSend(self, sel_sharedClient, v11, sub_232E2AE04, 0, v12, v13, v14);
    id v9 = *(id *)(v1 + OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_observerProxy);
    uint64_t v10 = (void *)sub_232E333C8();
    objc_msgSend(v8, sel_addObserver_forTypes_, v9, v10);
  }
}

unsigned char *sub_232E2AE04@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  if (*result)
  {
    *a2 = 0;
  }
  else
  {
    *double result = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t sub_232E2AE24@<X0>(uint64_t a1@<X8>)
{
  swift_bridgeObjectRetain();
  sub_232E32D58();
  uint64_t v2 = sub_232E32D98();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 0, 1, v2);
}

uint64_t sub_232E2B0AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  if ((a3 & 1) == 0)
  {
    if (*(void *)(a5 + 16))
    {
      unint64_t v10 = sub_232E324C4(a1);
      if (v11)
      {
        if (*(void *)(a4 + 16))
        {
          uint64_t v12 = (uint64_t *)(*(void *)(a5 + 56) + 16 * v10);
          uint64_t v13 = *v12;
          uint64_t v14 = v12[1];
          swift_bridgeObjectRetain();
          unint64_t v15 = sub_232E3244C(v13, v14);
          if (v16)
          {
            unint64_t v17 = v15;
            uint64_t v18 = *(void *)(a4 + 56);
            uint64_t v19 = sub_232E32D98();
            uint64_t v20 = *(void *)(v19 - 8);
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16))(a6, v18 + *(void *)(v20 + 72) * v17, v19);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v20 + 56))(a6, 0, 1, v19);
          }
          else
          {
            uint64_t v32 = sub_232E32D98();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(a6, 1, 1, v32);
          }
          return swift_bridgeObjectRelease();
        }
      }
    }
    goto LABEL_10;
  }
  if (!*(void *)(a4 + 16))
  {
LABEL_10:
    uint64_t v28 = sub_232E32D98();
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56);
    return v29(a6, 1, 1, v28);
  }
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_232E3244C(a1, a2);
  if (v23)
  {
    unint64_t v24 = v22;
    uint64_t v25 = *(void *)(a4 + 56);
    uint64_t v26 = sub_232E32D98();
    uint64_t v27 = *(void *)(v26 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v27 + 16))(a6, v25 + *(void *)(v27 + 72) * v24, v26);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(a6, 0, 1, v26);
  }
  else
  {
    uint64_t v31 = sub_232E32D98();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(a6, 1, 1, v31);
  }

  return sub_232E2CD3C(a1, a2, 1);
}

uint64_t sub_232E2B3E4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  os_log_type_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  id v9 = (char *)&v25 - v8;
  uint64_t result = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v25 - v11;
  int64_t v13 = 0;
  uint64_t v28 = a1;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v15 = a1 + 56;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 24);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v25 = v15;
  int64_t v26 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v27 = v3 + 16;
  while (1)
  {
    if (v19)
    {
      unint64_t v20 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_5;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v26) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v25 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v26) {
        return swift_release();
      }
      unint64_t v23 = *(void *)(v25 + 8 * v13);
      if (!v23)
      {
        int64_t v13 = v22 + 2;
        if (v22 + 2 >= v26) {
          return swift_release();
        }
        unint64_t v23 = *(void *)(v25 + 8 * v13);
        if (!v23)
        {
          int64_t v13 = v22 + 3;
          if (v22 + 3 >= v26) {
            return swift_release();
          }
          unint64_t v23 = *(void *)(v25 + 8 * v13);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v19 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v12, *(void *)(v28 + 48) + *(void *)(v3 + 72) * v21, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v12, v2);
    sub_232E302E4((uint64_t)v9, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v26) {
    return swift_release();
  }
  unint64_t v23 = *(void *)(v25 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v26) {
      return swift_release();
    }
    unint64_t v23 = *(void *)(v25 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_232E2B6A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v49 = a3;
  uint64_t v5 = sub_232E32A88();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v44 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v43 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750470);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v48 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v43 - v13;
  uint64_t v15 = sub_232E32D98();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = a2;
  uint64_t v19 = sub_232E32D78();
  uint64_t v21 = *(void *)(a1 + 8);
  if (*(void *)(v21 + 16) && (unint64_t v22 = sub_232E3244C(v19, v20), (v23 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v14, *(void *)(v21 + 56) + *(void *)(v16 + 72) * v22, v15);
    int64_t v24 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
    uint64_t v25 = v14;
    uint64_t v26 = 0;
  }
  else
  {
    int64_t v24 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
    uint64_t v25 = v14;
    uint64_t v26 = 1;
  }
  uint64_t v47 = v24;
  v24((uint64_t)v25, v26, 1, v15);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_232E02EA0((uint64_t)v14, &qword_268750470);
  }
  else
  {
    v43[1] = a1 + 8;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    sub_232E32D88();
    uint64_t v27 = v44;
    sub_232E32D88();
    char v28 = sub_232E32A68();
    uint64_t v29 = *(void (**)(char *, uint64_t))(v45 + 8);
    uint64_t v30 = v27;
    uint64_t v31 = v46;
    v29(v30, v46);
    v29(v9, v31);
    if ((v28 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      uint64_t result = MEMORY[0x263F8EE88];
      goto LABEL_11;
    }
    unsigned int v32 = sub_232E32D68();
    sub_232E2D488(v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  uint64_t v33 = v50;
  uint64_t v34 = sub_232E32D78();
  uint64_t v36 = v35;
  uint64_t v37 = (uint64_t)v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v48, v33, v15);
  v47(v37, 0, 1, v15);
  sub_232E2A474(v37, v34, v36);
  LODWORD(v34) = sub_232E32D68();
  uint64_t v38 = sub_232E32D78();
  uint64_t v40 = v39;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v51 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0x8000000000000000;
  sub_232E2F384(v38, v40, v34, isUniquelyReferenced_nonNull_native);
  *(void *)(a1 + 16) = v51;
  swift_bridgeObjectRelease();
  uint64_t result = sub_232E31F84(v33, a1);
LABEL_11:
  uint64_t *v49 = result;
  return result;
}

uint64_t sub_232E2BAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687504A8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  sub_232E33168();
  uint64_t v6 = sub_232E32D98();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v5, a2, v6);
  swift_storeEnumTagMultiPayload();
  sub_232E331D8();
  swift_release();
  return sub_232E02EA0((uint64_t)v5, &qword_2687504A8);
}

id CrashReportListener.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CrashReportListener.init()()
{
}

uint64_t CrashReportListener.nextCrashReport(for:timeout:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t ObjectType = swift_getObjectType();
  int v8 = a3 & 1;
  uint64_t v9 = sub_232E32A88();
  uint64_t v38 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v39 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v3;
  CrashReportListener.startListeningIfNeeded()();
  if (qword_26874F508 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_232E332F8();
  __swift_project_value_buffer(v11, (uint64_t)qword_268750380);
  sub_232E2CD2C(a1, a2, a3 & 1);
  sub_232E2CD2C(a1, a2, a3 & 1);
  uint64_t v12 = sub_232E332D8();
  os_log_type_t v13 = sub_232E33508();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v35[1] = ObjectType;
    uint64_t v16 = v15;
    uint64_t v41 = v15;
    uint64_t v36 = v9;
    *(_DWORD *)uint64_t v14 = 136315138;
    v35[0] = v14 + 4;
    sub_232E2CD2C(a1, a2, v8);
    uint64_t v17 = sub_232E32C68();
    unint64_t v19 = v18;
    sub_232E2CD3C(a1, a2, v8);
    uint64_t v40 = sub_232E093C4(v17, v19, &v41);
    uint64_t v9 = v36;
    sub_232E33568();
    swift_bridgeObjectRelease();
    sub_232E2CD3C(a1, a2, v8);
    sub_232E2CD3C(a1, a2, v8);
    _os_log_impl(&dword_232DFE000, v12, v13, "Requested next crash for: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DB3E80](v16, -1, -1);
    MEMORY[0x237DB3E80](v14, -1, -1);
  }
  else
  {
    sub_232E2CD3C(a1, a2, a3 & 1);
    sub_232E2CD3C(a1, a2, a3 & 1);
  }

  sub_232E32A78();
  uint64_t v20 = v37;
  uint64_t v40 = *(void *)&v37[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_state];
  MEMORY[0x270FA5388](v40);
  v35[-8] = v20;
  v35[-7] = a1;
  uint64_t v29 = a2;
  swift_retain();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687503A0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687503C0);
  uint64_t v23 = sub_232E03E14(&qword_2687503A8, &qword_2687503A0);
  uint64_t v33 = v22;
  uint64_t v34 = v23;
  uint64_t v31 = &v35[-10];
  uint64_t v32 = v21;
  uint64_t v30 = sub_232E2CD4C;
  LOBYTE(v29) = 2;
  sub_232E33138();
  swift_release();
  uint64_t v24 = v41;
  uint64_t v25 = v42;
  if (v42)
  {
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v20;
    *(void *)(v26 + 24) = a1;
    *(void *)(v26 + 32) = a2;
    *(unsigned char *)(v26 + 40) = v8 != 0;
    *(void *)(v26 + 48) = v25;
    sub_232E2CD2C(a1, a2, v8);
    swift_retain();
    id v27 = v20;
    sub_232E33188();
    swift_release();
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v9);
  return v24;
}

uint64_t sub_232E2C198@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v56 = a7;
  uint64_t v48 = a6;
  uint64_t v55 = a2;
  int v10 = a5 & 1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v51 = *(void *)(v11 - 8);
  uint64_t v52 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v50 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v49 = (uint64_t)&v45 - v14;
  uint64_t v15 = sub_232E32A88();
  uint64_t v46 = *(void *)(v15 - 8);
  uint64_t v47 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750470);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_232E32D98();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = a1[1];
  uint64_t v26 = a1[2];
  id v27 = a1 + 3;
  uint64_t v53 = a3;
  uint64_t v54 = a4;
  sub_232E2B0AC(a3, a4, v10, v25, v26, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_232E02EA0((uint64_t)v20, &qword_268750470);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
    sub_232E32D88();
    sub_232E32A58();
    double v29 = v28;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v47);
    if (v29 < 1.0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268750478);
      uint64_t v30 = sub_232E331C8();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
      uint64_t v32 = v56;
      *uint64_t v56 = v30;
      v32[1] = 0;
      return result;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  char v33 = v10;
  BOOL v34 = v10 != 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750478);
  uint64_t v55 = sub_232E33198();
  uint64_t v36 = v35;
  uint64_t v38 = v53;
  uint64_t v37 = v54;
  uint64_t v57 = v53;
  uint64_t v58 = v54;
  BOOL v59 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750480);
  sub_232E03E14(&qword_268750488, &qword_268750480);
  sub_232E32DA8();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750490);
  uint64_t v39 = v50;
  sub_232E33178();
  uint64_t v40 = v49;
  sub_232E302E4(v49, v39);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v40, v52);
  uint64_t v41 = v60;
  sub_232E2CD2C(v38, v37, v33);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v57 = *v27;
  *id v27 = 0x8000000000000000;
  sub_232E2F644(v41, v38, v37, v33, isUniquelyReferenced_nonNull_native);
  *id v27 = v57;
  swift_bridgeObjectRelease();
  sub_232E2CD3C(v38, v37, v33);
  sub_232E331A8();
  uint64_t v43 = sub_232E331B8();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v44 = v56;
  *uint64_t v56 = v43;
  v44[1] = v36;
  return result;
}

void sub_232E2C754(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE88];
}

uint64_t sub_232E2C764()
{
  return swift_release();
}

uint64_t sub_232E2C860(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v23 = *a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750448);
  uint64_t result = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a1 + 24);
  if (*(void *)(v16 + 16))
  {
    char v17 = a4 & 1;
    sub_232E2CD2C(a2, a3, v17);
    unint64_t v18 = sub_232E3250C(a2, a3, v17);
    if (v19)
    {
      uint64_t v20 = *(void *)(*(void *)(v16 + 56) + 8 * v18);
      swift_bridgeObjectRetain();
      sub_232E2CD3C(a2, a3, v17);
      uint64_t v26 = v20;
      swift_retain();
      sub_232E33178();
      sub_232E312C4((uint64_t)v11, (uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
      sub_232E02EA0((uint64_t)v15, &qword_268750448);
      uint64_t v21 = v26;
      sub_232E2CD2C(a2, a3, v17);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v25 = *(void *)(a1 + 24);
      *(void *)(a1 + 24) = 0x8000000000000000;
      sub_232E2F644(v21, a2, a3, v17, isUniquelyReferenced_nonNull_native);
      *(void *)(a1 + 24) = v25;
      swift_bridgeObjectRelease();
    }
    return sub_232E2CD3C(a2, a3, v17);
  }
  return result;
}

uint64_t sub_232E2CBDC()
{
  uint64_t v0 = sub_232E332F8();
  __swift_allocate_value_buffer(v0, qword_268750380);
  __swift_project_value_buffer(v0, (uint64_t)qword_268750380);
  sub_232E33548();
  return sub_232E332E8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static Logger.osaListener.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26874F508 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_232E332F8();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_268750380);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_232E2CD2C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_232E2CD3C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_232E2CD4C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_232E2C198(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(unsigned char *)(v2 + 40), *(void *)(v2 + 48), a2);
}

uint64_t sub_232E2CD7C()
{
  sub_232E2CD3C(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_232E2CDC8()
{
  return sub_232E2C764();
}

uint64_t sub_232E2CDDC()
{
  uint64_t v0 = sub_232E32EA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232E32E98();
  sub_232E318A0();
  uint64_t v4 = swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  return v4;
}

uint64_t sub_232E2CED0@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_232E2CF00(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_232E33638();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t type metadata accessor for CrashReportListener()
{
  return self;
}

uint64_t method lookup function for CrashReportListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CrashReportListener);
}

uint64_t type metadata accessor for CrashReportListener.ObserverProxy()
{
  return self;
}

uint64_t destroy for CrashReportListener.ObserverProxy.DiagnosticsLog()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s17PreviewsOSSupport19CrashReportListenerC13ObserverProxyC14DiagnosticsLogVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CrashReportListener.ObserverProxy.DiagnosticsLog(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CrashReportListener.ObserverProxy.DiagnosticsLog(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CrashReportListener.ObserverProxy.DiagnosticsLog(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CrashReportListener.ObserverProxy.DiagnosticsLog(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CrashReportListener.ObserverProxy.DiagnosticsLog()
{
  return &type metadata for CrashReportListener.ObserverProxy.DiagnosticsLog;
}

uint64_t destroy for CrashReportListener.State()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CrashReportListener.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CrashReportListener.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CrashReportListener.State(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CrashReportListener.State()
{
  return &type metadata for CrashReportListener.State;
}

uint64_t sub_232E2D364(uint64_t a1)
{
  return sub_232E2C860(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(uint64_t **)(v1 + 40));
}

uint64_t sub_232E2D388(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_232E3244C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_232E2FAC0();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 32 * v6);
  sub_232E2E8CC(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_232E2D488(unsigned int a1)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_232E324C4(a1);
  if ((v4 & 1) == 0) {
    return 0;
  }
  unint64_t v5 = v3;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v1;
  uint64_t v10 = *v2;
  *unint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_232E2FE70();
    uint64_t v7 = v10;
  }
  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 16 * v5);
  sub_232E2ECF8(v5, v7);
  *unint64_t v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_232E2D534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_232E3244C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *char v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_232E30020();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_232E32D98();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_232E2EE94(v8, v11);
    *char v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_232E32D98();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_232E2D6DC(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504D8);
  char v38 = a2;
  uint64_t result = sub_232E33628();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v37 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v21 >= v36) {
          goto LABEL_33;
        }
        unint64_t v22 = v37[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v22 = v37[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                unint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
              if (v35 >= 64) {
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v37 = -1 << v35;
              }
              unint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v22 = v37[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 48) + 8 * v20;
      int v29 = *(_DWORD *)v28;
      char v30 = *(unsigned char *)(v28 + 4);
      uint64_t v31 = *(void *)(v5 + 56) + 16 * v20;
      char v33 = *(void **)v31;
      uint64_t v32 = *(void *)(v31 + 8);
      if ((v38 & 1) == 0) {
        id v34 = v33;
      }
      sub_232E33738();
      sub_232E33758();
      sub_232E33748();
      uint64_t result = sub_232E33768();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v15 == v25;
          if (v15 == v25) {
            unint64_t v15 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        unint64_t v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = *(void *)(v7 + 48) + 8 * v16;
      *(_DWORD *)uint64_t v17 = v29;
      *(unsigned char *)(v17 + 4) = v30;
      uint64_t v18 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *uint64_t v18 = v33;
      v18[1] = v32;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_232E2D9E0(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504D0);
  char v38 = a2;
  uint64_t v6 = sub_232E33628();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v37 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v36) {
          goto LABEL_33;
        }
        unint64_t v23 = v37[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v23 = v37[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v36)
            {
LABEL_33:
              swift_release();
              unint64_t v3 = v2;
              if (v38)
              {
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 >= 64) {
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v37[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v23 = v37[v13];
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
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      int v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 32 * v21;
      uint64_t v33 = *(void *)v32;
      long long v39 = *(_OWORD *)(v32 + 8);
      uint64_t v34 = *(void *)(v32 + 24);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      sub_232E33738();
      sub_232E33398();
      uint64_t result = sub_232E33768();
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
            goto LABEL_39;
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
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      *uint64_t v18 = v31;
      v18[1] = v30;
      uint64_t v19 = *(void *)(v7 + 56) + 32 * v17;
      *(void *)uint64_t v19 = v33;
      *(_OWORD *)(v19 + 8) = v39;
      *(void *)(v19 + 24) = v34;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_232E2DD14(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750450);
  char v38 = a2;
  uint64_t v6 = sub_232E33628();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v29 = *(void *)(v5 + 48) + 24 * v20;
    uint64_t v31 = *(void *)v29;
    uint64_t v30 = *(void *)(v29 + 8);
    char v32 = *(unsigned char *)(v29 + 16);
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      sub_232E2CD2C(*(void *)v29, *(void *)(v29 + 8), *(unsigned char *)(v29 + 16));
      swift_bridgeObjectRetain();
    }
    sub_232E33738();
    sub_232E32C88();
    uint64_t result = sub_232E33768();
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
    uint64_t v18 = *(void *)(v7 + 48) + 24 * v17;
    *(void *)uint64_t v18 = v31;
    *(void *)(v18 + 8) = v30;
    *(unsigned char *)(v18 + 16) = v32;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_232E2E048(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504B0);
  uint64_t result = sub_232E33628();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v34 = (uint64_t *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v9;
    uint64_t v32 = v9;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v34[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero(v34, 8 * v33);
                }
                else {
                  *uint64_t v34 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v34[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(unsigned int *)(*(void *)(v5 + 48) + 4 * v19);
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = MEMORY[0x237DB37F0](*(void *)(v7 + 40), v27, 4);
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_DWORD *)(*(void *)(v7 + 48) + 4 * v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      void *v17 = v29;
      v17[1] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v3 = v7;
  return result;
}

uint64_t sub_232E2E304(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v49 = sub_232E32D98();
  uint64_t v5 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687504B8);
  int v47 = a2;
  uint64_t v8 = sub_232E33628();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  unint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    char v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_232E33738();
    sub_232E33398();
    uint64_t result = sub_232E33768();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    *unint64_t v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  unint64_t v3 = v42;
  char v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *unint64_t v3 = v9;
  return result;
}

unint64_t sub_232E2E6EC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_232E33598();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = 8 * v6;
        sub_232E33738();
        sub_232E33758();
        sub_232E33748();
        uint64_t result = sub_232E33768();
        unint64_t v10 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (void *)(v11 + 8 * v3);
          unint64_t v13 = (void *)(v11 + v9);
          if (8 * v3 != v9 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_232E2E8CC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_232E33598();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_232E33738();
        swift_bridgeObjectRetain();
        sub_232E33398();
        uint64_t v10 = sub_232E33768();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *unint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          int64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_232E2EAA4(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_232E33598();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      uint64_t v33 = v4;
      do
      {
        uint64_t v9 = 24 * v6;
        uint64_t v10 = v2;
        uint64_t v11 = *(void *)(v2 + 48) + 24 * v6;
        uint64_t v12 = *(void *)v11;
        uint64_t v13 = *(void *)(v11 + 8);
        int64_t v14 = v3;
        char v15 = *(unsigned char *)(v11 + 16);
        unint64_t v16 = v8;
        sub_232E33738();
        sub_232E2CD2C(v12, v13, v15);
        sub_232E32C88();
        uint64_t v17 = sub_232E33768();
        char v18 = v15;
        int64_t v3 = v14;
        uint64_t result = sub_232E2CD3C(v12, v13, v18);
        unint64_t v8 = v16;
        unint64_t v19 = v17 & v7;
        if (v14 >= (uint64_t)v16)
        {
          if (v19 < v16)
          {
            uint64_t v4 = v33;
            uint64_t v2 = v10;
          }
          else
          {
            uint64_t v4 = v33;
            uint64_t v2 = v10;
            if (v3 >= (uint64_t)v19) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          uint64_t v4 = v33;
          uint64_t v2 = v10;
          if (v19 >= v8 || v3 >= (uint64_t)v19)
          {
LABEL_12:
            uint64_t v20 = *(void *)(v2 + 48);
            unint64_t v21 = v20 + 24 * v3;
            BOOL v22 = (long long *)(v20 + v9);
            if (24 * v3 < v9 || v21 >= (unint64_t)v22 + 24 || v3 != v6)
            {
              long long v23 = *v22;
              *(void *)(v21 + 16) = *((void *)v22 + 2);
              *(_OWORD *)unint64_t v21 = v23;
            }
            uint64_t v24 = *(void *)(v2 + 56);
            int64_t v25 = (void *)(v24 + 8 * v3);
            uint64_t v26 = (void *)(v24 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v25 >= v26 + 1))
            {
              void *v25 = *v26;
              int64_t v3 = v6;
            }
          }
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v27 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v28 = *v27;
    uint64_t v29 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v27 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v29 = *v27;
    uint64_t v28 = (-1 << result) - 1;
  }
  *uint64_t v27 = v29 & v28;
  uint64_t v30 = *(void *)(v2 + 16);
  BOOL v31 = __OFSUB__(v30, 1);
  uint64_t v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v2 + 16) = v32;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_232E2ECF8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_232E33598();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (_DWORD *)(v9 + 4 * v6);
        uint64_t result = MEMORY[0x237DB37F0](*(void *)(a2 + 40), *v10, 4);
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            int64_t v14 = (_DWORD *)(v9 + 4 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *int64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (_OWORD *)(v15 + 16 * v3);
            uint64_t v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    char v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    char v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *char v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_232E2EE94(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_232E33598();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_232E33738();
        swift_bridgeObjectRetain();
        sub_232E33398();
        uint64_t v9 = sub_232E33768();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          *uint64_t v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(sub_232E32D98() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_232E2F0A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v9 = (void *)*v4;
  uint64_t v10 = a3 & 0x1FFFFFFFFLL;
  unint64_t v12 = sub_232E323D4(a3 & 0x1FFFFFFFFLL);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v9[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 16 * v12;

      *(void *)uint64_t v19 = a1;
      *(void *)(v19 + 8) = a2;
      return;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_232E2F900();
    goto LABEL_7;
  }
  sub_232E2D6DC(v15, a4 & 1);
  unint64_t v20 = sub_232E323D4(v10);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_15:
    sub_232E336B8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:

  sub_232E2F7A8(v12, v10, a1, a2, v18);
}

uint64_t sub_232E2F1D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  unint64_t v8 = v7;
  uint64_t v15 = *v7;
  unint64_t v17 = sub_232E3244C(a5, a6);
  uint64_t v18 = *(void *)(v15 + 16);
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v21 = v16;
  uint64_t v22 = *(void *)(v15 + 24);
  if (v22 >= v20 && (a7 & 1) != 0) {
    goto LABEL_7;
  }
  if (v22 >= v20 && (a7 & 1) == 0)
  {
    sub_232E2FAC0();
LABEL_7:
    uint64_t v23 = (void *)*v8;
    if (v21)
    {
LABEL_8:
      BOOL v24 = (void *)(v23[7] + 32 * v17);
      swift_unknownObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v24 = a1;
      v24[1] = a2;
      v24[2] = a3;
      v24[3] = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_232E2D9E0(v20, a7 & 1);
  unint64_t v26 = sub_232E3244C(a5, a6);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_17:
    uint64_t result = sub_232E336B8();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  uint64_t v23 = (void *)*v8;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  v23[(v17 >> 6) + 8] |= 1 << v17;
  uint64_t v28 = (uint64_t *)(v23[6] + 16 * v17);
  *uint64_t v28 = a5;
  v28[1] = a6;
  uint64_t v29 = (void *)(v23[7] + 32 * v17);
  void *v29 = a1;
  v29[1] = a2;
  v29[2] = a3;
  void v29[3] = a4;
  uint64_t v30 = v23[2];
  BOOL v31 = __OFADD__(v30, 1);
  uint64_t v32 = v30 + 1;
  if (v31)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v23[2] = v32;

  return swift_bridgeObjectRetain();
}

uint64_t sub_232E2F384(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_232E324C4(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_232E2FE70();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      BOOL v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_DWORD *)(v18[6] + 4 * v12) = a3;
    char v21 = (void *)(v18[7] + 16 * v12);
    *char v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_232E2E048(result, a4 & 1);
  uint64_t result = sub_232E324C4(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    uint64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_232E336B8();
  __break(1u);
  return result;
}

uint64_t sub_232E2F4C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_232E3244C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_232E30020();
      goto LABEL_7;
    }
    sub_232E2E304(v15, a4 & 1);
    unint64_t v26 = sub_232E3244C(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      uint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_232E336B8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_232E32D98();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_232E2F7FC(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_232E2F644(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  unint64_t v6 = (void **)v5;
  char v11 = a4 & 1;
  unint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_232E3250C(a2, a3, a4 & 1);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    uint64_t v20 = *v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_232E2FCAC();
    goto LABEL_7;
  }
  sub_232E2DD14(v17, a5 & 1);
  unint64_t v23 = sub_232E3250C(a2, a3, v11);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_15:
    uint64_t result = sub_232E336B8();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  sub_232E2F8AC(v14, a2, a3, v11, a1, v20);

  return sub_232E2CD2C(a2, a3, v11);
}

unint64_t sub_232E2F7A8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 8 * result;
  *(_DWORD *)uint64_t v5 = a2;
  *(unsigned char *)(v5 + 4) = BYTE4(a2) & 1;
  unint64_t v6 = (void *)(a5[7] + 16 * result);
  void *v6 = a3;
  v6[1] = a4;
  uint64_t v7 = a5[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a5[2] = v9;
  }
  return result;
}

uint64_t sub_232E2F7FC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  BOOL v8 = (void *)(a5[6] + 16 * a1);
  *BOOL v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_232E32D98();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

unint64_t sub_232E2F8AC(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = a6[6] + 24 * result;
  *(void *)uint64_t v6 = a2;
  *(void *)(v6 + 8) = a3;
  *(unsigned char *)(v6 + 16) = a4 & 1;
  *(void *)(a6[7] + 8 * result) = a5;
  uint64_t v7 = a6[2];
  BOOL v8 = __OFADD__(v7, 1);
  uint64_t v9 = v7 + 1;
  if (v8) {
    __break(1u);
  }
  else {
    a6[2] = v9;
  }
  return result;
}

id sub_232E2F900()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_232E33618();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 8 * v15;
    int v18 = *(_DWORD *)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 4);
    uint64_t v19 = 16 * v15;
    uint64_t v20 = *(void *)(v2 + 56) + v19;
    uint64_t v22 = *(void **)v20;
    uint64_t v21 = *(void *)(v20 + 8);
    uint64_t v23 = *(void *)(v4 + 48) + v16;
    *(_DWORD *)uint64_t v23 = v18;
    *(unsigned char *)(v23 + 4) = v17;
    char v24 = (void *)(*(void *)(v4 + 56) + v19);
    *char v24 = v22;
    v24[1] = v21;
    id result = v22;
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_232E2FAC0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_232E33618();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      int64_t v9 = v27 + 1;
      if (v27 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v28 = *(void *)(v6 + 8 * v9);
      if (!v28) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v28 - 1) & v28;
    unint64_t v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 24);
    char v24 = (void *)(*(void *)(v4 + 48) + v16);
    long long v25 = *(_OWORD *)(v21 + 8);
    *char v24 = v19;
    v24[1] = v18;
    uint64_t v26 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v26 = v22;
    *(_OWORD *)(v26 + 8) = v25;
    *(void *)(v26 + 24) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id result = (void *)swift_unknownObjectRetain();
  }
  int64_t v29 = v27 + 2;
  if (v29 >= v13) {
    goto LABEL_26;
  }
  unint64_t v28 = *(void *)(v6 + 8 * v29);
  if (v28)
  {
    int64_t v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v6 + 8 * v9);
    ++v29;
    if (v28) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_232E2FCAC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750450);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_232E33618();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    char v20 = *(unsigned char *)(v17 + 16);
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void *)(*(void *)(v2 + 56) + v21);
    uint64_t v23 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v23 = *(void *)v17;
    *(void *)(v23 + 8) = v19;
    *(unsigned char *)(v23 + 16) = v20;
    *(void *)(*(void *)(v4 + 56) + v21) = v22;
    sub_232E2CD2C(v18, v19, v20);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_232E2FE70()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687504B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_232E33618();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 4 * v15;
    int v17 = *(_DWORD *)(*(void *)(v2 + 48) + 4 * v15);
    uint64_t v18 = 16 * v15;
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(_DWORD *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *uint64_t v22 = v21;
    v22[1] = v20;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_232E30020()
{
  uint64_t v35 = sub_232E32D98();
  uint64_t v1 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687504B8);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_232E33618();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    id result = (void *)swift_release();
    uint64_t v28 = v36;
    int64_t v27 = v30;
LABEL_25:
    *int64_t v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  id result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    id result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    int64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    id result = (void *)swift_release();
    int64_t v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_232E302E4(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_232E03E14(&qword_268750458, &qword_268750440);
  swift_bridgeObjectRetain();
  uint64_t v31 = a2;
  uint64_t v11 = sub_232E33328();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v30 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    int64_t v26 = v2;
    uint64_t v27 = a1;
    uint64_t v28 = ~v12;
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v29 = *(void *)(v7 + 72);
    unint64_t v15 = (void (**)(char *, uint64_t))(v7 + 8);
    v24[1] = (v7 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v25 = v7;
    while (1)
    {
      uint64_t v16 = v10;
      unint64_t v17 = v29 * v13;
      uint64_t v18 = v14;
      v14(v9, *(void *)(v10 + 48) + v29 * v13, v6);
      sub_232E03E14(&qword_268750460, &qword_268750440);
      char v19 = sub_232E33348();
      uint64_t v20 = *v15;
      (*v15)(v9, v6);
      if (v19) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v28;
      uint64_t v10 = v16;
      uint64_t v14 = v18;
      if (((*(void *)(v30 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v26;
        a1 = v27;
        uint64_t v7 = v25;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v20(v31, v6);
    v18(v27, *(void *)(*v26 + 48) + v17, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = v31;
    v14(v9, v31, v6);
    uint64_t v32 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_232E309E8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v22, v6);
    return 1;
  }
}

uint64_t sub_232E305F4()
{
  uint64_t v1 = v0;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750468);
  uint64_t v5 = sub_232E335B8();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      int64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_232E03E14(&qword_268750458, &qword_268750440);
      uint64_t result = sub_232E33328();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_232E309E8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_232E305F4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_232E30C74();
      goto LABEL_12;
    }
    sub_232E30F1C();
  }
  uint64_t v12 = *v3;
  sub_232E03E14(&qword_268750458, &qword_268750440);
  uint64_t v13 = sub_232E33328();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v17 = v7 + 16;
    unint64_t v18 = v19;
    uint64_t v20 = *(void *)(v17 + 56);
    do
    {
      v18(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_232E03E14(&qword_268750460, &qword_268750440);
      char v21 = sub_232E33348();
      (*(void (**)(char *, uint64_t))(v17 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_232E336A8();
  __break(1u);
  return result;
}

void *sub_232E30C74()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750468);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_232E335A8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_232E30F1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268750468);
  uint64_t v7 = sub_232E335B8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_232E03E14(&qword_268750458, &qword_268750440);
    uint64_t result = sub_232E33328();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_232E312C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_232E03E14(&qword_268750458, &qword_268750440);
  swift_bridgeObjectRetain();
  uint64_t v29 = a1;
  uint64_t v10 = sub_232E33328();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v28 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v24 = v2;
    uint64_t v25 = v6;
    uint64_t v26 = a2;
    uint64_t v27 = ~v11;
    unint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v14 = v6 + 16;
    uint64_t v13 = v15;
    uint64_t v16 = *(void *)(v14 + 56);
    while (1)
    {
      v13(v8, *(void *)(v9 + 48) + v16 * v12, v5);
      sub_232E03E14(&qword_268750460, &qword_268750440);
      char v17 = sub_232E33348();
      (*(void (**)(char *, uint64_t))(v14 - 8))(v8, v5);
      if (v17) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v27;
      if (((*(void *)(v28 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v18 = 1;
        uint64_t v6 = v25;
        a2 = v26;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v19 = v24;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v19;
    uint64_t v30 = *v19;
    *unint64_t v19 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_232E30C74();
      uint64_t v21 = v30;
    }
    uint64_t v6 = v25;
    a2 = v26;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 32))(v26, *(void *)(v21 + 48) + v16 * v12, v5);
    sub_232E3158C(v12);
    *unint64_t v19 = v30;
    swift_bridgeObjectRelease();
    uint64_t v18 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
}

uint64_t sub_232E3158C(int64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750440);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    BOOL v31 = v1;
    uint64_t v11 = ~v9;
    uint64_t v35 = result;
    swift_retain();
    uint64_t v12 = sub_232E33598();
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v33 = (v12 + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      uint64_t v13 = v4 + 16;
      uint64_t v32 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v34 = v13;
      uint64_t v16 = (void (**)(char *, uint64_t))(v13 - 8);
      uint64_t v17 = v35;
      do
      {
        uint64_t v18 = v8;
        uint64_t v19 = v15;
        int64_t v20 = v15 * v10;
        v32(v6, *(void *)(v17 + 48) + v15 * v10, v3);
        sub_232E03E14(&qword_268750458, &qword_268750440);
        uint64_t v21 = sub_232E33328();
        (*v16)(v6, v3);
        unint64_t v22 = v21 & v11;
        if (a1 >= (uint64_t)v33)
        {
          if (v22 < v33 || a1 < (uint64_t)v22)
          {
LABEL_4:
            uint64_t v8 = v18;
            uint64_t v15 = v19;
            uint64_t v17 = v35;
            goto LABEL_5;
          }
        }
        else if (v22 < v33 && a1 < (uint64_t)v22)
        {
          goto LABEL_4;
        }
        uint64_t v17 = v35;
        int64_t v25 = v19 * a1;
        uint64_t v8 = v18;
        if (v19 * a1 < v20
          || (uint64_t v15 = v19, *(void *)(v35 + 48) + v19 * a1 >= (unint64_t)(*(void *)(v35 + 48) + v20 + v19)))
        {
          swift_arrayInitWithTakeFrontToBack();
          goto LABEL_21;
        }
        a1 = v10;
        if (v25 != v20)
        {
          swift_arrayInitWithTakeBackToFront();
LABEL_21:
          uint64_t v17 = v35;
          uint64_t v15 = v19;
          a1 = v10;
        }
LABEL_5:
        unint64_t v10 = (v10 + 1) & v11;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v31;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v26 = *v1;
  uint64_t v27 = *(void *)(*v1 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v26 + 16) = v29;
    ++*(_DWORD *)(v26 + 36);
  }
  return result;
}

unint64_t sub_232E318A0()
{
  unint64_t result = qword_268750498;
  if (!qword_268750498)
  {
    sub_232E32EA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268750498);
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

uint64_t sub_232E3195C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_232E31994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_232E2AB7C(a1, a2, a3, v3);
}

uint64_t sub_232E3199C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268750470);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_232E32D98();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)v29 - v9;
  sub_232E2AE24((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1) {
    return sub_232E02EA0((uint64_t)v3, &qword_268750470);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
  if (qword_26874F508 != -1) {
    swift_once();
  }
  uint64_t v31 = v0;
  uint64_t v12 = sub_232E332F8();
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)qword_268750380);
  uint64_t v14 = sub_232E332D8();
  os_log_type_t v15 = sub_232E33528();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = (char *)v13;
    *(_DWORD *)uint64_t v16 = 67240192;
    swift_beginAccess();
    int v35 = sub_232E32D68();
    sub_232E33568();
    _os_log_impl(&dword_232DFE000, v14, v15, "Did receive log for pid: %{public}d", v16, 8u);
    MEMORY[0x237DB3E80](v16, -1, -1);
  }

  uint64_t v17 = sub_232E330B8();
  sub_232E330A8();
  swift_beginAccess();
  sub_232E32D68();
  uint64_t v18 = sub_232E33098();
  swift_release();
  if (v18)
  {
    uint64_t v19 = sub_232E332D8();
    os_log_type_t v20 = sub_232E33528();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      v29[1] = v17;
      uint64_t v30 = v8;
      *(_DWORD *)uint64_t v21 = 67240192;
      int v32 = sub_232E32D68();
      uint64_t v8 = v30;
      sub_232E33568();
      _os_log_impl(&dword_232DFE000, v19, v20, "Symbolicating missing JIT symbols for pid: %{public}d", v21, 8u);
      MEMORY[0x237DB3E80](v21, -1, -1);
    }

    sub_232E32F28();
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v10, v8, v4);
    sub_232E330A8();
    sub_232E32D68();
    sub_232E33088();
    swift_release();
    swift_release();
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  uint64_t v33 = *(void *)(v31 + OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_state);
  MEMORY[0x270FA5388](v33);
  swift_retain();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687503A0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687504A0);
  uint64_t v28 = sub_232E03E14(&qword_2687503A8, &qword_2687503A0);
  v26[0] = v26;
  v26[1] = v22;
  sub_232E33138();
  uint64_t v23 = swift_release();
  uint64_t v24 = v34;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (uint64_t)v8;
  sub_232E2A650((void (*)(char *))sub_232E31F68, (uint64_t)v26, v24);
  swift_bridgeObjectRelease();
  int64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v25)(v10, v4);
}

uint64_t sub_232E31F4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_232E2B6A0(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_232E31F68(uint64_t a1)
{
  return sub_232E2BAFC(a1, *(void *)(v1 + 16));
}

uint64_t sub_232E31F84(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = MEMORY[0x263F8EE88];
  uint64_t v3 = sub_232E32D68();
  uint64_t v4 = sub_232E32D78();
  uint64_t v6 = v5;
  sub_232E2CD2C(v3, 0, 0);
  swift_bridgeObjectRetain();
  unint64_t v7 = sub_232E3250C(v3, 0, 0);
  char v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *(void *)(a2 + 24);
    *(void *)(a2 + 24) = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native) {
      sub_232E2FCAC();
    }
    sub_232E2CD3C(*(void *)(*(void *)(v11 + 48) + 24 * v7), *(void *)(*(void *)(v11 + 48) + 24 * v7 + 8), *(unsigned char *)(*(void *)(v11 + 48) + 24 * v7 + 16));
    uint64_t v12 = *(void *)(*(void *)(v11 + 56) + 8 * v7);
    sub_232E2EAA4(v7, v11);
    *(void *)(a2 + 24) = v11;
    swift_bridgeObjectRelease();
    sub_232E2CD3C(v3, 0, 0);
    sub_232E2B3E4(v12);
  }
  else
  {
    sub_232E2CD3C(v3, 0, 0);
  }
  sub_232E2CD2C(v4, v6, 1);
  swift_bridgeObjectRetain();
  unint64_t v13 = sub_232E3250C(v4, v6, 1);
  char v15 = v14;
  swift_bridgeObjectRelease();
  if (v15)
  {
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *(void *)(a2 + 24);
    *(void *)(a2 + 24) = 0x8000000000000000;
    if ((v16 & 1) == 0) {
      sub_232E2FCAC();
    }
    sub_232E2CD3C(*(void *)(*(void *)(v17 + 48) + 24 * v13), *(void *)(*(void *)(v17 + 48) + 24 * v13 + 8), *(unsigned char *)(*(void *)(v17 + 48) + 24 * v13 + 16));
    uint64_t v18 = *(void *)(*(void *)(v17 + 56) + 8 * v13);
    sub_232E2EAA4(v13, v17);
    *(void *)(a2 + 24) = v17;
    swift_bridgeObjectRelease();
    sub_232E2CD3C(v4, v6, 1);
    sub_232E2B3E4(v18);
  }
  else
  {
    sub_232E2CD3C(v4, v6, 1);
  }
  swift_arrayDestroy();
  return v20;
}

uint64_t static URL.rootRelativeFileURL(relativePath:isDirectory:)()
{
  uint64_t v0 = sub_232E32A48();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB0]), sel_init);
  id v5 = objc_msgSend(v4, sel_environment);

  uint64_t v6 = sub_232E33318();
  if (*(void *)(v6 + 16) && (sub_232E3244C(0x4F4F525F444C5944, 0xEE00485441505F54), (v7 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_232E32A08();
    swift_bridgeObjectRelease();
    sub_232E32A38();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    swift_bridgeObjectRelease();
    return sub_232E32A08();
  }
}

unint64_t sub_232E323D4(uint64_t a1)
{
  sub_232E33738();
  sub_232E33758();
  sub_232E33748();
  uint64_t v2 = sub_232E33768();

  return sub_232E32598(a1 & 0x1FFFFFFFFLL, v2);
}

unint64_t sub_232E3244C(uint64_t a1, uint64_t a2)
{
  sub_232E33738();
  sub_232E33398();
  uint64_t v4 = sub_232E33768();

  return sub_232E32620(a1, a2, v4);
}

unint64_t sub_232E324C4(unsigned int a1)
{
  uint64_t v3 = MEMORY[0x237DB37F0](*(void *)(v1 + 40), a1, 4);

  return sub_232E32704(a1, v3);
}

unint64_t sub_232E3250C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = a3 & 1;
  sub_232E33738();
  sub_232E32C88();
  uint64_t v6 = sub_232E33768();

  return sub_232E327A0(a1, a2, v5, v6);
}

unint64_t sub_232E32598(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      if (!((*(_DWORD *)(*(void *)(v2 + 48) + 8 * result) != a1) | (BYTE4(a1) & 1 ^ *(unsigned __int8 *)(*(void *)(v2 + 48) + 8 * result + 4)) & 1)) {
        break;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_232E32620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_232E33698() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_232E33698() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_232E32704(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_232E327A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t i = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v8 = *(void *)(v4 + 48) + 24 * i;
    uint64_t v9 = *(void *)v8;
    uint64_t v10 = *(void *)(v8 + 8);
    char v11 = *(unsigned char *)(v8 + 16);
    sub_232E2CD2C(*(void *)v8, v10, v11);
    char v12 = sub_232E32C78();
    sub_232E2CD3C(v9, v10, v11);
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = ~v6;
      for (unint64_t i = (i + 1) & v13; ((*(void *)(v5 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v13)
      {
        uint64_t v14 = *(void *)(v4 + 48) + 24 * i;
        uint64_t v15 = *(void *)v14;
        uint64_t v16 = *(void *)(v14 + 8);
        char v17 = *(unsigned char *)(v14 + 16);
        sub_232E2CD2C(*(void *)v14, v16, v17);
        char v18 = sub_232E32C78();
        sub_232E2CD3C(v15, v16, v17);
        if (v18) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_232E329B8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_232E329C8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_232E329D8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_232E329E8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_232E329F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_232E32A08()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_232E32A18()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_232E32A28()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_232E32A38()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_232E32A48()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_232E32A58()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_232E32A68()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_232E32A78()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_232E32A88()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_232E32A98()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_232E32AA8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_232E32AB8()
{
  return MEMORY[0x270F56DB8]();
}

uint64_t sub_232E32AD8()
{
  return MEMORY[0x270F56068]();
}

uint64_t sub_232E32AF8()
{
  return MEMORY[0x270F562B8]();
}

uint64_t sub_232E32B08()
{
  return MEMORY[0x270F562E8]();
}

uint64_t sub_232E32B18()
{
  return MEMORY[0x270F56320]();
}

uint64_t sub_232E32B28()
{
  return MEMORY[0x270F56338]();
}

uint64_t sub_232E32B38()
{
  return MEMORY[0x270F56340]();
}

uint64_t sub_232E32B48()
{
  return MEMORY[0x270F56348]();
}

uint64_t sub_232E32B58()
{
  return MEMORY[0x270F56350]();
}

uint64_t sub_232E32B68()
{
  return MEMORY[0x270F56358]();
}

uint64_t sub_232E32B78()
{
  return MEMORY[0x270F56360]();
}

uint64_t sub_232E32B88()
{
  return MEMORY[0x270F56368]();
}

uint64_t sub_232E32B98()
{
  return MEMORY[0x270F56380]();
}

uint64_t sub_232E32BA8()
{
  return MEMORY[0x270F563A8]();
}

uint64_t sub_232E32BB8()
{
  return MEMORY[0x270F563B8]();
}

uint64_t sub_232E32BC8()
{
  return MEMORY[0x270F563C0]();
}

uint64_t sub_232E32BD8()
{
  return MEMORY[0x270F563C8]();
}

uint64_t sub_232E32BE8()
{
  return MEMORY[0x270F564A8]();
}

uint64_t sub_232E32C08()
{
  return MEMORY[0x270F564B8]();
}

uint64_t sub_232E32C18()
{
  return MEMORY[0x270F564C0]();
}

uint64_t sub_232E32C28()
{
  return MEMORY[0x270F564C8]();
}

uint64_t sub_232E32C38()
{
  return MEMORY[0x270F564E0]();
}

uint64_t sub_232E32C48()
{
  return MEMORY[0x270F56508]();
}

uint64_t sub_232E32C58()
{
  return MEMORY[0x270F56520]();
}

uint64_t sub_232E32C68()
{
  return MEMORY[0x270F56538]();
}

uint64_t sub_232E32C78()
{
  return MEMORY[0x270F56540]();
}

uint64_t sub_232E32C88()
{
  return MEMORY[0x270F56548]();
}

uint64_t sub_232E32C98()
{
  return MEMORY[0x270F56630]();
}

uint64_t sub_232E32CA8()
{
  return MEMORY[0x270F56750]();
}

uint64_t sub_232E32CC8()
{
  return MEMORY[0x270F567F8]();
}

uint64_t sub_232E32CD8()
{
  return MEMORY[0x270F56818]();
}

uint64_t sub_232E32CE8()
{
  return MEMORY[0x270F56820]();
}

uint64_t sub_232E32CF8()
{
  return MEMORY[0x270F568D8]();
}

uint64_t sub_232E32D08()
{
  return MEMORY[0x270F569A8]();
}

uint64_t sub_232E32D18()
{
  return MEMORY[0x270F569C8]();
}

uint64_t sub_232E32D38()
{
  return MEMORY[0x270F569E0]();
}

uint64_t sub_232E32D48()
{
  return MEMORY[0x270F569E8]();
}

uint64_t sub_232E32D58()
{
  return MEMORY[0x270F55630]();
}

uint64_t sub_232E32D68()
{
  return MEMORY[0x270F55678]();
}

uint64_t sub_232E32D78()
{
  return MEMORY[0x270F55680]();
}

uint64_t sub_232E32D88()
{
  return MEMORY[0x270F55688]();
}

uint64_t sub_232E32D98()
{
  return MEMORY[0x270F55710]();
}

uint64_t sub_232E32DA8()
{
  return MEMORY[0x270F55720]();
}

uint64_t sub_232E32DB8()
{
  return MEMORY[0x270F557B0]();
}

uint64_t sub_232E32DC8()
{
  return MEMORY[0x270F569F0]();
}

uint64_t sub_232E32DD8()
{
  return MEMORY[0x270F569F8]();
}

uint64_t sub_232E32DE8()
{
  return MEMORY[0x270F55820]();
}

uint64_t sub_232E32DF8()
{
  return MEMORY[0x270F55828]();
}

uint64_t sub_232E32E08()
{
  return MEMORY[0x270F55830]();
}

uint64_t sub_232E32E18()
{
  return MEMORY[0x270F55840]();
}

uint64_t sub_232E32E28()
{
  return MEMORY[0x270F55848]();
}

uint64_t sub_232E32E38()
{
  return MEMORY[0x270F55850]();
}

uint64_t _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0()
{
  return MEMORY[0x270F55858]();
}

uint64_t sub_232E32E58()
{
  return MEMORY[0x270F55860]();
}

uint64_t sub_232E32E68()
{
  return MEMORY[0x270F55870]();
}

uint64_t sub_232E32E78()
{
  return MEMORY[0x270F55878]();
}

uint64_t sub_232E32E88()
{
  return MEMORY[0x270F55880]();
}

uint64_t sub_232E32E98()
{
  return MEMORY[0x270F55888]();
}

uint64_t sub_232E32EA8()
{
  return MEMORY[0x270F55890]();
}

uint64_t sub_232E32EB8()
{
  return MEMORY[0x270F558C8]();
}

uint64_t sub_232E32EC8()
{
  return MEMORY[0x270F558D8]();
}

uint64_t sub_232E32ED8()
{
  return MEMORY[0x270F558E0]();
}

uint64_t sub_232E32EE8()
{
  return MEMORY[0x270F55910]();
}

uint64_t sub_232E32EF8()
{
  return MEMORY[0x270F55920]();
}

uint64_t sub_232E32F08()
{
  return MEMORY[0x270F55928]();
}

uint64_t sub_232E32F18()
{
  return MEMORY[0x270F55930]();
}

uint64_t sub_232E32F28()
{
  return MEMORY[0x270F55940]();
}

uint64_t sub_232E32F38()
{
  return MEMORY[0x270F55950]();
}

uint64_t sub_232E32F48()
{
  return MEMORY[0x270F559A8]();
}

uint64_t sub_232E32F58()
{
  return MEMORY[0x270F559C8]();
}

uint64_t sub_232E32F68()
{
  return MEMORY[0x270F559D0]();
}

uint64_t sub_232E32F78()
{
  return MEMORY[0x270F559F8]();
}

uint64_t sub_232E32F88()
{
  return MEMORY[0x270F55A00]();
}

uint64_t sub_232E32FA8()
{
  return MEMORY[0x270F55A18]();
}

uint64_t sub_232E32FB8()
{
  return MEMORY[0x270F55A20]();
}

uint64_t sub_232E32FD8()
{
  return MEMORY[0x270F55A30]();
}

uint64_t sub_232E32FE8()
{
  return MEMORY[0x270F55A38]();
}

uint64_t sub_232E32FF8()
{
  return MEMORY[0x270F55A40]();
}

uint64_t sub_232E33008()
{
  return MEMORY[0x270F55A48]();
}

uint64_t sub_232E33018()
{
  return MEMORY[0x270F55A50]();
}

uint64_t sub_232E33028()
{
  return MEMORY[0x270F55A58]();
}

uint64_t sub_232E33038()
{
  return MEMORY[0x270F55A60]();
}

uint64_t sub_232E33048()
{
  return MEMORY[0x270F55A68]();
}

uint64_t sub_232E33058()
{
  return MEMORY[0x270F55A98]();
}

uint64_t sub_232E33068()
{
  return MEMORY[0x270F55AA0]();
}

uint64_t sub_232E33078()
{
  return MEMORY[0x270F55B10]();
}

uint64_t sub_232E33088()
{
  return MEMORY[0x270F55BA8]();
}

uint64_t sub_232E33098()
{
  return MEMORY[0x270F55BB0]();
}

uint64_t sub_232E330A8()
{
  return MEMORY[0x270F55BC0]();
}

uint64_t sub_232E330B8()
{
  return MEMORY[0x270F55BC8]();
}

uint64_t sub_232E330D8()
{
  return MEMORY[0x270F55BE0]();
}

uint64_t sub_232E330E8()
{
  return MEMORY[0x270F55C48]();
}

uint64_t sub_232E330F8()
{
  return MEMORY[0x270F55C50]();
}

uint64_t sub_232E33118()
{
  return MEMORY[0x270F55C70]();
}

uint64_t sub_232E33128()
{
  return MEMORY[0x270F55CA8]();
}

uint64_t sub_232E33138()
{
  return MEMORY[0x270F55CB0]();
}

uint64_t sub_232E33148()
{
  return MEMORY[0x270F55CC8]();
}

uint64_t sub_232E33158()
{
  return MEMORY[0x270F55CD0]();
}

uint64_t sub_232E33168()
{
  return MEMORY[0x270F55CE0]();
}

uint64_t sub_232E33178()
{
  return MEMORY[0x270F55CE8]();
}

uint64_t sub_232E33188()
{
  return MEMORY[0x270F55D08]();
}

uint64_t sub_232E33198()
{
  return MEMORY[0x270F55D58]();
}

uint64_t sub_232E331A8()
{
  return MEMORY[0x270F55D68]();
}

uint64_t sub_232E331B8()
{
  return MEMORY[0x270F55D80]();
}

uint64_t sub_232E331C8()
{
  return MEMORY[0x270F55D88]();
}

uint64_t sub_232E331D8()
{
  return MEMORY[0x270F55DD0]();
}

uint64_t sub_232E331E8()
{
  return MEMORY[0x270EEB258]();
}

uint64_t sub_232E331F8()
{
  return MEMORY[0x270EEB260]();
}

uint64_t sub_232E33208()
{
  return MEMORY[0x270EEB268]();
}

uint64_t sub_232E33218()
{
  return MEMORY[0x270EEB2C0]();
}

uint64_t sub_232E33228()
{
  return MEMORY[0x270EEB2C8]();
}

uint64_t sub_232E33238()
{
  return MEMORY[0x270EEB2D0]();
}

uint64_t sub_232E33248()
{
  return MEMORY[0x270EEB2D8]();
}

uint64_t sub_232E33258()
{
  return MEMORY[0x270EEB2E0]();
}

uint64_t sub_232E33268()
{
  return MEMORY[0x270EEB2E8]();
}

uint64_t sub_232E33278()
{
  return MEMORY[0x270EEB2F0]();
}

uint64_t sub_232E33288()
{
  return MEMORY[0x270EEB2F8]();
}

uint64_t sub_232E33298()
{
  return MEMORY[0x270EEB300]();
}

uint64_t sub_232E332A8()
{
  return MEMORY[0x270F55E50]();
}

uint64_t sub_232E332B8()
{
  return MEMORY[0x270F55E58]();
}

uint64_t sub_232E332C8()
{
  return MEMORY[0x270F55E60]();
}

uint64_t sub_232E332D8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_232E332E8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_232E332F8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_232E33308()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_232E33318()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_232E33328()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_232E33338()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_232E33348()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_232E33358()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_232E33368()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_232E33378()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_232E33388()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_232E33398()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_232E333A8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_232E333B8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_232E333C8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_232E333D8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_232E333F8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_232E33408()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_232E33418()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_232E33428()
{
  return MEMORY[0x270FA1F18]();
}

uint64_t sub_232E33438()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_232E33448()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_232E33458()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_232E33468()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_232E33478()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_232E33488()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_232E334A8()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_232E334B8()
{
  return MEMORY[0x270F55EF8]();
}

uint64_t sub_232E334C8()
{
  return MEMORY[0x270F55F08]();
}

uint64_t sub_232E334E8()
{
  return MEMORY[0x270FA1FC0]();
}

uint64_t sub_232E334F8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_232E33508()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_232E33518()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_232E33528()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_232E33538()
{
  return MEMORY[0x270F56A00]();
}

uint64_t sub_232E33548()
{
  return MEMORY[0x270F55F38]();
}

uint64_t sub_232E33558()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_232E33568()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_232E33578()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_232E33588()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_232E33598()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_232E335A8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_232E335B8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_232E335C8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_232E335D8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_232E335E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_232E335F8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_232E33608()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_232E33618()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_232E33628()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_232E33638()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_232E33648()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_232E33658()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_232E33668()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_232E33678()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_232E33688()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_232E33698()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_232E336A8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_232E336B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_232E336C8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_232E336D8()
{
  return MEMORY[0x270F55F50]();
}

uint64_t sub_232E336E8()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_232E336F8()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_232E33708()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_232E33718()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_232E33728()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_232E33738()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_232E33748()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_232E33758()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_232E33768()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t UVLog()
{
  return MEMORY[0x270F56E18]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}