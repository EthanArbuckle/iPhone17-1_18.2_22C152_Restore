uint64_t DistributedActor.hash(into:)()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388]();
  v4 = (char *)&v6 - v3;
  v7 = v0;
  dispatch thunk of Identifiable.id.getter();
  swift_getAssociatedConformanceWitness();
  dispatch thunk of Hashable.hash(into:)();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, AssociatedTypeWitness);
}

uint64_t static DistributedActor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v10 = (char *)&v13 - v9;
  uint64_t v14 = a1;
  dispatch thunk of Identifiable.id.getter();
  uint64_t v14 = a2;
  dispatch thunk of Identifiable.id.getter();
  swift_getAssociatedConformanceWitness();
  LOBYTE(a1) = dispatch thunk of static Equatable.== infix(_:_:)();
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, AssociatedTypeWitness);
  v11(v10, AssociatedTypeWitness);
  return a1 & 1;
}

uint64_t one-time initialization function for actorSystemKey()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CodingUserInfoKey?);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for CodingUserInfoKey();
  __swift_allocate_value_buffer(v3, static CodingUserInfoKey.actorSystemKey);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.actorSystemKey);
  CodingUserInfoKey.init(rawValue:)();
  uint64_t v5 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.actorSystemKey.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for actorSystemKey != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CodingUserInfoKey();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static CodingUserInfoKey.actorSystemKey);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t DistributedActor<>.init(from:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v38 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v42 = (char *)&v37 - v7;
  uint64_t v39 = a3;
  uint64_t v44 = a2;
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v11);
  v16 = (char *)&v37 - v15;
  uint64_t v17 = a1[3];
  v46 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  uint64_t v18 = dispatch thunk of Decoder.userInfo.getter();
  if (one-time initialization token for actorSystemKey != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for CodingUserInfoKey();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)static CodingUserInfoKey.actorSystemKey);
  if (*(void *)(v18 + 16) && (unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(v20), (v22 & 1) != 0)) {
    outlined init with copy of Any(*(void *)(v18 + 56) + 32 * v21, (uint64_t)v45);
  }
  else {
    memset(v45, 0, 32);
  }
  swift_bridgeObjectRelease();
  swift_getCanonicalSpecializedMetadata();
  char v23 = swift_dynamicCast();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  if ((v23 & 1) == 0)
  {
    v24(v13, 1, 1, v8);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    *(void *)&v45[0] = 0;
    *((void *)&v45[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(39);
    swift_bridgeObjectRelease();
    *(void *)&v45[0] = 0xD000000000000024;
    *((void *)&v45[0] + 1) = 0x800000023B52BD10;
    v30._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 46;
    v31._object = (void *)0xE100000000000000;
    String.append(_:)(v31);
    v33 = (void *)*((void *)&v45[0] + 1);
    v32._countAndFlagsBits = *(void *)&v45[0];
    *(void *)&v45[0] = 0xD000000000000029;
    *((void *)&v45[0] + 1) = 0x800000023B52BD40;
    v32._object = v33;
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
    uint64_t v28 = *((void *)&v45[0] + 1);
    uint64_t v34 = *(void *)&v45[0];
    lazy protocol witness table accessor for type DistributedActorCodingError and conformance DistributedActorCodingError();
    swift_allocError();
    void *v35 = v34;
    v35[1] = v28;
    swift_willThrow();
    uint64_t v25 = (uint64_t)v46;
    goto LABEL_12;
  }
  v24(v13, 0, 1, v8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v13, v8);
  uint64_t v25 = (uint64_t)v46;
  outlined init with copy of Decoder((uint64_t)v46, (uint64_t)v45);
  v27 = v42;
  uint64_t v26 = AssociatedTypeWitness;
  uint64_t v28 = AssociatedTypeWitness;
  uint64_t v29 = v40;
  dispatch thunk of Decodable.init(from:)();
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v8);
LABEL_12:
    __swift_destroy_boxed_opaque_existential_1(v25);
    return v28;
  }
  uint64_t v28 = (*(uint64_t (**)(char *, char *))(v39 + 64))(v27, v16);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v27, v26);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v8);
  __swift_destroy_boxed_opaque_existential_1(v25);
  return v28;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t DistributedActor<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v12[1] = a4;
  uint64_t v5 = v4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)v12 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  uint64_t v15 = v5;
  dispatch thunk of Identifiable.id.getter();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v14);
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = v6;
  v7[8] = v10;
  v7[5] = a5;
  v7[6] = a6;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v7[9] = *(void *)(a6 - 8);
  v7[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](_s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY0_, 0, 0);
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY0_()
{
  if (swift_distributed_actor_is_remote())
  {
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[5] - 8) + 56))(v0[2], 1, 1);
    swift_task_dealloc();
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(v0[3] + *(int *)v0[3]);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[11] = v3;
    *uint64_t v3 = v0;
    v3[1] = _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ1_;
    uint64_t v4 = v0[10];
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[2];
    return v7(v6, v5, v4);
  }
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ1_()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY3_;
  }
  else {
    uint64_t v1 = _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY2_;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY2_()
{
  (*(void (**)(void, void, uint64_t))(*(void *)(v0[5] - 8) + 56))(v0[2], 0, 1);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY3_()
{
  (*(void (**)(void, void, void))(v0[9] + 32))(v0[8], v0[10], v0[6]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

BOOL __isLocalActor(_:)()
{
  return (swift_distributed_actor_is_remote() & 1) == 0;
}

uint64_t _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v9[2] = a6;
  v9[3] = a9;
  v9[4] = *(void *)(a6 - 8);
  uint64_t v18 = swift_task_alloc();
  v9[5] = v18;
  unint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&_s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu + _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu);
  uint64_t v19 = (void *)swift_task_alloc();
  v9[6] = v19;
  *uint64_t v19 = v9;
  v19[1] = _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ0_;
  return v21(a1, a2, a3, a4, a5, a6, a7, a8, v18);
}

uint64_t _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTQ0_()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 8);
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x270FA2498](_s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY1_, 0, 0);
}

uint64_t _s11Distributed0A5ActorPAAE9whenLocalyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTY1_()
{
  (*(void (**)(void, void, void))(v0[4] + 32))(v0[3], v0[5], v0[2]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t DistributedActor.whenLocal<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[8] = a6;
  v7[9] = v6;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = a2;
  v7[5] = a3;
  v7[3] = a1;
  return MEMORY[0x270FA2498](DistributedActor.whenLocal<A>(_:), 0, 0);
}

void DistributedActor.whenLocal<A>(_:)()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 80) = v2;
  long long v3 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 48);
  *(void *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  uint64_t v5 = (char *)&_s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu
     + _s11Distributed0A5ActorPAAE20whenLocalTypedThrowsyqd__Sgqd__xYiYaYbqd_0_YKXEYaqd_0_YKs8SendableRd__s5ErrorRd_0_r0_lFTu;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *uint64_t v4 = v0;
  v4[1] = DistributedActor.whenLocal<A>(_:);
  __asm { BR              X8 }
}

uint64_t DistributedActor.whenLocal<A>(_:)()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 8);
    __asm { BRAA            X1, X16 }
  }
  return MEMORY[0x270FA2498](DistributedActor.whenLocal<A>(_:), 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 16) = a8;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v8 + 24) = v11;
  *uint64_t v11 = v8;
  v11[1] = thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v13(a1, a2);
}

uint64_t thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0) {
    **(void **)(v2 + 16) = v0;
  }
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return v4();
}

uint64_t DistributedActor.__actorUnownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t DistributedActor.asLocalActor.getter()
{
  return swift_unknownObjectRetain();
}

void _distributedStubFatalError(function:)(uint64_t a1, void *a2)
{
  _StringGuts.grow(_:)(54);
  v4._object = (void *)0x800000023B52BD90;
  v4._countAndFlagsBits = 0xD00000000000002DLL;
  String.append(_:)(v4);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  String.append(_:)(v5);
  v6._countAndFlagsBits = 0x21627574732027;
  v6._object = (void *)0xE700000000000000;
  String.append(_:)(v6);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[12] = a7;
  v8[13] = v7;
  v8[10] = a4;
  v8[11] = a5;
  v8[8] = a1;
  v8[9] = a3;
  uint64_t v9 = a2[1];
  v8[14] = *a2;
  v8[15] = v9;
  return MEMORY[0x270FA2498](DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:), 0, 0);
}

uint64_t DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:)()
{
  uint64_t v1 = *(void *)(v0 + 112);
  unint64_t v2 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v1, v2);
  if (swift_distributed_getGenericEnvironment())
  {
    swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    Swift::String v4 = *(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16);
    uint64_t v5 = swift_checkMetadataState();
    uint64_t v6 = v4(v5, AssociatedConformanceWitness);
    uint64_t v22 = v6;
    unint64_t v23 = *(void *)(v6 + 16);
    if (v23)
    {
      if (v23 >> 60)
      {
        __break(1u);
      }
      else
      {
        uint64_t v24 = swift_slowAlloc();
        uint64_t v7 = v24;
        unint64_t v25 = 0;
        while (v25 < *(void *)(v22 + 16))
        {
          *(void *)(v24 + 8 * v25) = *(void *)(v22 + 8 * v25 + 32);
          if (v23 == ++v25)
          {
            uint64_t WitnessTables = swift_distributed_getWitnessTables();
            if ((v26 & 0x8000000000000000) == 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_4;
            }
            uint64_t v54 = v7;
            uint64_t v56 = *(void *)(v0 + 112);
            v55 = *(void **)(v0 + 120);
            swift_release();
            _StringGuts.grow(_:)(71);
            Swift::String v57 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Generic substitutions ", 0x16uLL, 1);
            String.append(_:)(v57);
            swift_bridgeObjectRelease();
            uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any.Type);
            uint64_t v59 = MEMORY[0x23ECC6330](v22, v58);
            v61 = v60;
            swift_bridgeObjectRelease();
            v62._uint64_t countAndFlagsBits = v59;
            v62._object = v61;
            String.append(_:)(v62);
            swift_bridgeObjectRelease();
            Swift::String v63 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" do not satisfy generic requirements of ", 0x28uLL, 1);
            String.append(_:)(v63);
            swift_bridgeObjectRelease();
            v64._uint64_t countAndFlagsBits = v56;
            v64._object = v55;
            Swift::String_optional v66 = _getFunctionFullNameFromMangledName(mangledName:)(v64);
            uint64_t countAndFlagsBits = v66.value._countAndFlagsBits;
            if (v66.value._object)
            {
              object = v66.value._object;
              uint64_t v69 = *(void *)(v0 + 112);
              v68 = *(void **)(v0 + 120);
            }
            else
            {
              v68 = *(void **)(v0 + 120);
              swift_bridgeObjectRetain();
              uint64_t v69 = *(void *)(v0 + 112);
              uint64_t countAndFlagsBits = v69;
              object = v68;
            }
            v73 = object;
            String.append(_:)(*(Swift::String *)&countAndFlagsBits);
            swift_bridgeObjectRelease();
            Swift::String v74 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" (", 2uLL, 1);
            String.append(_:)(v74);
            swift_bridgeObjectRelease();
            v75._uint64_t countAndFlagsBits = v69;
            v75._object = v68;
            String.append(_:)(v75);
            swift_bridgeObjectRelease();
            Swift::String v76 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(")", 1uLL, 1);
            String.append(_:)(v76);
            swift_bridgeObjectRelease();
            lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
            swift_allocError();
            *(unsigned char *)uint64_t v77 = 3;
            *(void *)(v77 + 8) = 0;
            *(void *)(v77 + 16) = 0xE000000000000000;
            swift_willThrow();
            MEMORY[0x23ECC6900](v54, -1, -1);
            goto LABEL_44;
          }
        }
      }
      return _assertionFailure(_:_:file:line:flags:)();
    }
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    Swift::String v50 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Cannot call generic method without generic argument substitutions", 0x41uLL, 1);
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(unsigned char *)uint64_t v51 = 2;
    *(Swift::String *)(v51 + 8) = v50;
    swift_willThrow();
    goto LABEL_45;
  }
  uint64_t v7 = 0;
  uint64_t WitnessTables = 0;
LABEL_4:
  *(void *)(v0 + 128) = v7;
  *(void *)(v0 + 136) = WitnessTables;
  unsigned int ParameterCount = swift_func_getParameterCount();
  unsigned int v10 = ParameterCount;
  if ((ParameterCount & 0x80000000) != 0)
  {
    uint64_t v27 = v7;
    uint64_t v29 = *(void *)(v0 + 112);
    uint64_t v28 = *(void **)(v0 + 120);
    swift_release();
    _StringGuts.grow(_:)(104);
    Swift::String v30 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to decode distributed invocation target expected parameter count,\nerror code: ", 0x55uLL, 1);
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 252) = v10;
    v31._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v31);
    swift_bridgeObjectRelease();
    Swift::String v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\nmangled name: ", 0xFuLL, 1);
    String.append(_:)(v32);
    swift_bridgeObjectRelease();
    v33._uint64_t countAndFlagsBits = v29;
    uint64_t v7 = v27;
    v33._object = v28;
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(unsigned char *)uint64_t v34 = 1;
    *(void *)(v34 + 8) = 0;
    *(void *)(v34 + 16) = 0xE000000000000000;
    swift_willThrow();
    if (!v27) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v11 = specialized static UnsafeMutableBufferPointer.allocate(capacity:)(ParameterCount);
  *(void *)(v0 + 144) = v11;
  if (!v11)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t v13 = v12;
  v82 = (uint64_t *)v11;
  int ParameterTypeInfo = swift_func_getParameterTypeInfo();
  if (ParameterTypeInfo != v10)
  {
    int v35 = ParameterTypeInfo;
    Swift::String v80 = *(Swift::String *)(v0 + 112);
    swift_release();
    _StringGuts.grow(_:)(145);
    Swift::String v36 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Failed to decode the expected number of params of distributed invocation target, error code: ", 0x5DuLL, 1);
    String.append(_:)(v36);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 240) = v35;
    v37._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v37);
    swift_bridgeObjectRelease();
    Swift::String v38 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\ndecoded: ", 0xAuLL, 1);
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 244) = v35;
    v39._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v39);
    swift_bridgeObjectRelease();
    Swift::String v40 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(", expected params: ", 0x13uLL, 1);
    String.append(_:)(v40);
    swift_bridgeObjectRelease();
    *(_DWORD *)(v0 + 248) = v10;
    v41._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v41);
    swift_bridgeObjectRelease();
    Swift::String v42 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\nmangled name: ", 0xFuLL, 1);
    String.append(_:)(v42);
    swift_bridgeObjectRelease();
    String.append(_:)(v80);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(unsigned char *)uint64_t v43 = 1;
    *(void *)(v43 + 8) = 0;
    *(void *)(v43 + 16) = 0xE000000000000000;
    swift_willThrow();
    MEMORY[0x23ECC6900](v82, -1, -1);
    if (!v7)
    {
LABEL_22:
      if (!WitnessTables) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
LABEL_21:
    MEMORY[0x23ECC6900](v7, -1, -1);
    goto LABEL_22;
  }
  uint64_t v81 = v7;
  uint64_t v79 = WitnessTables;
  uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10, 0, MEMORY[0x263F8EE78]);
  v16 = v15;
  if (v13)
  {
    unint64_t v17 = *((void *)v15 + 2);
    uint64_t v18 = 8 * v13;
    uint64_t v19 = v82;
    do
    {
      uint64_t v20 = *v19;
      unint64_t v21 = *((void *)v16 + 3);
      if (v17 >= v21 >> 1) {
        v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v17 + 1, 1, (uint64_t)v16);
      }
      ++v19;
      *((void *)v16 + 2) = v17 + 1;
      *(void *)&v16[8 * v17++ + 32] = v20;
      v18 -= 8;
    }
    while (v18);
  }
  uint64_t ReturnTypeInfo = swift_func_getReturnTypeInfo();
  *(void *)(v0 + 152) = ReturnTypeInfo;
  swift_release();
  if (!ReturnTypeInfo)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v52 = "Failed to decode distributed target return type";
    Builtin::Word v53 = 47;
    goto LABEL_34;
  }
  uint64_t v45 = static UnsafeMutablePointer.allocate(capacity:)();
  *(void *)(v0 + 160) = v45;
  if (!v45)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v52 = "Failed to allocate buffer for distributed target return type";
    Builtin::Word v53 = 60;
LABEL_34:
    Swift::String v70 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v52, v53, 1);
    lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
    swift_allocError();
    *(unsigned char *)uint64_t v71 = 4;
    *(Swift::String *)(v71 + 8) = v70;
    swift_willThrow();
    MEMORY[0x23ECC6900](v82, -1, -1);
    if (v81) {
      MEMORY[0x23ECC6900](v81, -1, -1);
    }
    if (!v79) {
      goto LABEL_45;
    }
LABEL_44:
    MEMORY[0x23ECC6900]();
LABEL_45:
    v78 = *(uint64_t (**)(void))(v0 + 8);
    return v78();
  }
  uint64_t v46 = swift_allocObject();
  *(void *)(v0 + 168) = v46;
  *(unsigned char *)(v46 + 16) = 1;
  swift_getAssociatedTypeWitness();
  uint64_t v47 = swift_getAssociatedConformanceWitness();
  v48 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 40);
  uint64_t v49 = swift_checkMetadataState();
  *(void *)(v0 + 176) = v48(v49, v47);
  if (String.count.getter() < 0) {
    return _assertionFailure(_:_:file:line:flags:)();
  }
  swift_bridgeObjectRelease();
  *(void *)(v0 + 184) = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  return swift_distributed_execute_target();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 192) = v0;
  if (v0)
  {
    unint64_t v2 = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  }
  else
  {
    swift_release();
    unint64_t v2 = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedConformanceWitness;
  int *v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;

  uint64_t v1 = v0[22];
  if (!v1) {
    uint64_t v1 = v0[19];
  }
  *(unsigned char *)(v0[21] + 16) = 0;
  if (v1 == MEMORY[0x263F8EE60] + 8)
  {
    swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v12 = *(int **)(AssociatedConformanceWitness + 24);
    uint64_t v13 = swift_checkMetadataState();
    v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)v12 + *v12);
    uint64_t v14 = (void *)swift_task_alloc();
    v0[25] = v14;
    *uint64_t v14 = v0;
    v14[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
    return v16(v13, AssociatedConformanceWitness);
  }
  else
  {
    unint64_t v2 = v0[22];
    uint64_t v3 = v0[19];
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0[12] + 136)
                                                                              + **(int **)(v0[12] + 136));
    Swift::String v4 = (void *)swift_task_alloc();
    v0[26] = v4;
    *Swift::String v4 = v0;
    v4[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
    if (v2) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = v3;
    }
    uint64_t v6 = v0[20];
    uint64_t v7 = v0[12];
    uint64_t v9 = v0[10];
    uint64_t v8 = v0[11];
    return v15(v9, v6, v5, v8, v7);
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  char *v8;
  uint64_t v9;

  unint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 56) = v0;
    Swift::String v4 = v2 + 56;
    *(void *)(v4 + 160) = v0;
    swift_getAssociatedTypeWitness();
    uint64_t v5 = *(int **)(swift_getAssociatedConformanceWitness() + 32);
    swift_checkMetadataState();
    uint64_t v8 = (char *)v5 + *v5;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v4 + 168) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    *uint64_t v6 = v3;
    v6[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
    __asm { BRAA            X6, X16 }
  }
  return MEMORY[0x270FA2498](DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  if ((*(unsigned char *)(v0[21] + 16) & 1) == 0) {
    UnsafeMutablePointer.deinitialize(count:)();
  }
  uint64_t v1 = v0[18];
  unint64_t v2 = v0[16];
  MEMORY[0x23ECC63A0](v0[20], v0[19]);
  swift_release();
  MEMORY[0x23ECC6900](v1, -1, -1);
  if (v2) {
    MEMORY[0x23ECC6900](v0[16], -1, -1);
  }
  uint64_t v3 = v0[17];
  if (v3) {
    MEMORY[0x23ECC6900](v3, -1, -1);
  }
  Swift::String v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  void *v6;
  char *v8;
  uint64_t v9;

  unint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(void *)(v2 + 56) = v0;
    Swift::String v4 = v2 + 56;
    *(void *)(v4 + 160) = v0;
    swift_getAssociatedTypeWitness();
    uint64_t v5 = *(int **)(swift_getAssociatedConformanceWitness() + 32);
    swift_checkMetadataState();
    uint64_t v8 = (char *)v5 + *v5;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v4 + 168) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    *uint64_t v6 = v3;
    v6[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
    __asm { BRAA            X6, X16 }
  }
  return MEMORY[0x270FA2498](DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:), 0, 0);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v5;

  unint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  }
  else
  {
    MEMORY[0x23ECC6770](*(void *)(v2 + 216));
    uint64_t v3 = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t AssociatedConformanceWitness;
  int *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int *v9;
  uint64_t v10;

  swift_release();
  uint64_t v1 = v0[24];
  v0[27] = v1;
  v0[7] = v1;
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v3 = *(int **)(AssociatedConformanceWitness + 32);
  Swift::String v4 = swift_checkMetadataState();
  uint64_t v9 = (int *)((char *)v3 + *v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[28] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *uint64_t v5 = v0;
  v5[1] = DistributedActorSystem.executeDistributedTarget<A>(on:target:invocationDecoder:handler:);
  uint64_t v7 = MEMORY[0x263F8E4E0];
  return ((uint64_t (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t))v9)(v0 + 7, v6, v7, v4, AssociatedConformanceWitness);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v1 = v0[21];
  MEMORY[0x23ECC6770](v0[27]);
  if ((*(unsigned char *)(v1 + 16) & 1) == 0) {
    UnsafeMutablePointer.deinitialize(count:)();
  }
  unint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  MEMORY[0x23ECC63A0](v0[20], v0[19]);
  swift_release();
  MEMORY[0x23ECC6900](v2, -1, -1);
  if (v3) {
    MEMORY[0x23ECC6900](v0[16], -1, -1);
  }
  Swift::String v4 = v0[17];
  if (v4) {
    MEMORY[0x23ECC6900](v4, -1, -1);
  }
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

Distributed::ExecuteDistributedTargetError __swiftcall ExecuteDistributedTargetError.init(message:errorCode:)(Distributed::ExecuteDistributedTargetError message, Distributed::ExecuteDistributedTargetError::ErrorCode errorCode)
{
  *(unsigned char *)uint64_t v2 = *(unsigned char *)errorCode;
  *(Swift::String *)(v2 + 8) = *(Swift::String *)&message.errorCode;
  LOBYTE(message.message._object) = errorCode;
  return message;
}

uint64_t specialized static UnsafeMutableBufferPointer.allocate(capacity:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 0x1000000000000000) >> 61 != 7)
  {
    __break(1u);
    goto LABEL_5;
  }
  uint64_t result = swift_slowAlloc();
  if (a1 < 0)
  {
LABEL_5:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t RemoteCallTarget.description.getter()
{
  uint64_t countAndFlagsBits = v0->_countAndFlagsBits;
  Swift::String_optional v3 = _getFunctionFullNameFromMangledName(mangledName:)(*v0);
  uint64_t result = v3.value._countAndFlagsBits;
  if (!v3.value._object)
  {
    swift_bridgeObjectRetain();
    return countAndFlagsBits;
  }
  return result;
}

uint64_t RemoteCallTarget.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance RemoteCallTarget()
{
  uint64_t countAndFlagsBits = v0->_countAndFlagsBits;
  Swift::String_optional v3 = _getFunctionFullNameFromMangledName(mangledName:)(*v0);
  uint64_t result = v3.value._countAndFlagsBits;
  if (!v3.value._object)
  {
    swift_bridgeObjectRetain();
    return countAndFlagsBits;
  }
  return result;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance RemoteCallTarget()
{
  return String.hash(into:)();
}

uint64_t RemoteCallArgument.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteCallArgument.effectiveLabel.getter()
{
  if (!v0[1]) {
    return 95;
  }
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteCallArgument.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteCallArgument.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t RemoteCallArgument.init(label:name:value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  uint64_t v9 = (char *)a7 + *(int *)(type metadata accessor for RemoteCallArgument() + 32);
  unsigned int v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32);

  return v10(v9, a5, a6);
}

void ExecuteDistributedTargetError.errorCode.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ExecuteDistributedTargetError.message.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL static ExecuteDistributedTargetError.ErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ExecuteDistributedTargetError.ErrorCode.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int ExecuteDistributedTargetError.ErrorCode.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ExecuteDistributedTargetError.ErrorCode(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ExecuteDistributedTargetError.ErrorCode()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ExecuteDistributedTargetError.ErrorCode()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ExecuteDistributedTargetError.ErrorCode()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Distributed::ExecuteDistributedTargetError __swiftcall ExecuteDistributedTargetError.init(message:)(Distributed::ExecuteDistributedTargetError message)
{
  *(unsigned char *)uint64_t v1 = 5;
  *(Swift::String *)(v1 + 8) = *(Swift::String *)&message.errorCode;
  return message;
}

uint64_t protocol witness for Error._domain.getter in conformance ExecuteDistributedTargetError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance ExecuteDistributedTargetError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance ExecuteDistributedTargetError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance ExecuteDistributedTargetError()
{
  return MEMORY[0x270F9FB30]();
}

void static DistributedActorCodingError.missingActorSystemUserInfo<A>(_:)(void *a1@<X8>)
{
  *a1 = 0xD000000000000036;
  a1[1] = 0x800000023B52C0F0;
}

void _diagnoseDistributedStubMethodCalled(className:funcName:file:line:column:)()
{
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease();
  v0._uint64_t countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v0);
  swift_bridgeObjectRelease();
  v1._uint64_t countAndFlagsBits = 46;
  v1._object = (void *)0xE100000000000000;
  String.append(_:)(v1);
  v2._uint64_t countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._uint64_t countAndFlagsBits = 39;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t DistributedActor.preconditionIsolated(_:file:line:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(a8 + 56);
  v11(a7, a8);
  UnownedSerialExecutor._executor.getter();
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
  {
    _StringGuts.grow(_:)(63);
    v13._object = (void *)0x800000023B52C150;
    v13._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
    String.append(_:)(v13);
    v11(a7, a8);
    _print_unlocked<A, B>(_:_:)();
    v14._uint64_t countAndFlagsBits = 0x7475636578652027;
    v14._object = (void *)0xEC000000202E726FLL;
    String.append(_:)(v14);
    v15._uint64_t countAndFlagsBits = a1();
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t DistributedActor.assertIsolated(_:file:line:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  (*(void (**)(uint64_t, uint64_t))(a8 + 56))(a7, a8);
  UnownedSerialExecutor._executor.getter();
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0)
  {
    _StringGuts.grow(_:)(63);
    v10._object = (void *)0x800000023B52C150;
    v10._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
    String.append(_:)(v10);
    _print_unlocked<A, B>(_:_:)();
    v11._uint64_t countAndFlagsBits = 0x7475636578652027;
    v11._object = (void *)0xEC000000202E726FLL;
    String.append(_:)(v11);
    v12._uint64_t countAndFlagsBits = a1();
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t DistributedActor.assumeIsolated<A>(_:file:line:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (swift_distributed_actor_is_remote()) {
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, uint64_t))(a9 + 56))(a7, a9);
  UnownedSerialExecutor._executor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
  {
LABEL_8:
    _StringGuts.grow(_:)(66);
    v22._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v22._object = (void *)0x800000023B52C650;
    String.append(_:)(v22);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v23._uint64_t countAndFlagsBits = 46;
    v23._object = (void *)0xE100000000000000;
    String.append(_:)(v23);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  Swift::String v15 = (void *)swift_allocObject();
  v15[2] = a7;
  v15[3] = a8;
  v15[4] = a9;
  v15[5] = a1;
  v15[6] = a2;
  closure #1 in DistributedActor.assumeIsolated<A>(_:file:line:)((uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error), (uint64_t)v15, v9, a7, a8, a9);
  if (v10) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_7:
    _StringGuts.grow(_:)(91);
    v18._object = (void *)0x800000023B52C6C0;
    v18._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v18);
    v19._uint64_t countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
    v20._object = (void *)0x800000023B52C6E0;
    String.append(_:)(v20);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v21._object = (void *)0x800000023B52C700;
    v21._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v21);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_8;
  }
  return result;
}

{
  return DistributedActor.assumeIsolated<A>(_:file:line:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t closure #1 in DistributedActor.assumeIsolated<A>(_:file:line:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  Swift::String v12 = (void *)swift_allocObject();
  void v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  v12[5] = a1;
  v12[6] = a2;
  swift_retain();
  uint64_t v14 = a3;
  partial apply for thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error)(&v14);
  return swift_release();
}

uint64_t DistributedRemoteActorReferenceExecutor.asUnownedSerialExecutor()()
{
  lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor);
  return v0;
}

uint64_t DistributedRemoteActorReferenceExecutor.deinit()
{
  return v0;
}

uint64_t DistributedRemoteActorReferenceExecutor.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t protocol witness for SerialExecutor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for SerialExecutor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor(a1, a2, a3, MEMORY[0x263F8F498]);
}

{
  return protocol witness for SerialExecutor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor(a1, a2, a3, MEMORY[0x263F8F4A0]);
}

uint64_t protocol witness for SerialExecutor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *v4;
  uint64_t v7 = lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor);

  return a4(a1, v6, v7);
}

uint64_t protocol witness for SerialExecutor.asUnownedSerialExecutor() in conformance DistributedRemoteActorReferenceExecutor()
{
  return v0;
}

uint64_t protocol witness for SerialExecutor.isSameExclusiveExecutionContext(other:) in conformance DistributedRemoteActorReferenceExecutor(uint64_t a1)
{
  return MEMORY[0x270FA2038](a1, *v1);
}

void protocol witness for SerialExecutor.checkIsolated() in conformance DistributedRemoteActorReferenceExecutor()
{
}

uint64_t protocol witness for Executor.enqueue(_:) in conformance DistributedRemoteActorReferenceExecutor(uint64_t a1)
{
  return MEMORY[0x270FA1E38](a1, *v1);
}

{
  void *v1;

  return MEMORY[0x270FA1E40](a1, *v1);
}

uint64_t buildDefaultDistributedRemoteActorExecutor<A>(_:)()
{
  type metadata accessor for DistributedRemoteActorReferenceExecutor();
  uint64_t inited = swift_initStaticObject();
  lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor);
  return inited;
}

Swift::Int32 __swiftcall _getParameterCount(mangledMethodName:)(Swift::String mangledMethodName)
{
  specialized _copyCollectionToContiguousArray<A>(_:)(mangledMethodName._countAndFlagsBits, (unint64_t)mangledMethodName._object);
  Swift::Int32 ParameterCount = swift_func_getParameterCount();
  swift_release();
  return ParameterCount;
}

uint64_t _getParameterTypeInfo(mangledMethodName:genericEnv:genericArguments:into:length:)(uint64_t a1, unint64_t a2)
{
  specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  uint64_t ParameterTypeInfo = swift_func_getParameterTypeInfo();
  swift_release();
  return ParameterTypeInfo;
}

uint64_t _getReturnTypeInfo(mangledMethodName:genericEnv:genericArguments:)(uint64_t a1, unint64_t a2)
{
  specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  uint64_t ReturnTypeInfo = swift_func_getReturnTypeInfo();
  swift_release();
  return ReturnTypeInfo;
}

uint64_t swift_distributed_makeDistributedTargetAccessorNotFoundError()
{
  lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
  uint64_t result = swift_allocError();
  *(unsigned char *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0xD00000000000002ELL;
  *(void *)(v1 + 16) = 0x800000023B52C1A0;
  return result;
}

uint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    Swift::String v2 = (void *)MEMORY[0x263F8EE80];
    swift_retain();
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LocalTestingActorID, DistributedActor>);
  Swift::String v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  swift_retain();
  if (!v3)
  {
LABEL_12:
    swift_release();
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  unint64_t v4 = 0;
  uint64_t v5 = (_OWORD *)(a1 + 48);
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = *((void *)v5 - 1);
    long long v15 = *v5;
    if (!v6)
    {
      swift_unknownObjectRetain();
      goto LABEL_12;
    }
    uint64_t v7 = *((void *)v5 - 2);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v6);
    if (v9) {
      goto LABEL_15;
    }
    *(void *)((char *)v2 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v8;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * v8);
    uint64_t *v10 = v7;
    v10[1] = v6;
    *(_OWORD *)(v2[7] + 16 * v8) = v15;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12)
    {
      __break(1u);
      break;
    }
    ++v4;
    v2[2] = v13;
    v5 += 2;
    if (v3 == v4) {
      goto LABEL_12;
    }
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
LABEL_15:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t LocalTestingDistributedActorSystem.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  LocalTestingDistributedActorSystem.init()();
  return v0;
}

void *LocalTestingDistributedActorSystem.init()()
{
  v0[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  type metadata accessor for _Lock();
  uint64_t v1 = swift_allocObject();
  Swift::String v2 = (_DWORD *)swift_slowAlloc();
  *(void *)(v1 + 16) = v2;
  _DWORD *v2 = 0;
  v0[3] = v1;
  uint64_t v3 = swift_allocObject();
  unint64_t v4 = (_DWORD *)swift_slowAlloc();
  *(void *)(v3 + 16) = v4;
  *unint64_t v4 = 0;
  v0[4] = 0;
  v0[5] = v3;
  v0[6] = MEMORY[0x263F8EE88];
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = (_DWORD *)swift_slowAlloc();
  *(void *)(v5 + 16) = v6;
  *uint64_t v6 = 0;
  v0[7] = v5;
  return v0;
}

uint64_t LocalTestingDistributedActorSystem.resolve<A>(id:as:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v1 + 24) + 16);
  os_unfair_lock_lock(v4);
  uint64_t v5 = *(void *)(v1 + 16);
  if (!*(void *)(v5 + 16) || (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(v3, v2), (v7 & 1) == 0))
  {
    os_unfair_lock_unlock(v4);
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 16 * v6);
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v4);
  if (!v8)
  {
LABEL_7:
    *(void *)&long long v17 = 0;
    *((void *)&v17 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(32);
    v10._object = (void *)0x800000023B52C1D0;
    v10._uint64_t countAndFlagsBits = 0xD000000000000015;
    String.append(_:)(v10);
    _print_unlocked<A, B>(_:_:)();
    v11._uint64_t countAndFlagsBits = 0x6C6C61636F6C2027;
    v11._object = (void *)0xE900000000000079;
    String.append(_:)(v11);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DistributedActor);
  if (swift_dynamicCast()) {
    return v16;
  }
  *(void *)&long long v17 = 0;
  *((void *)&v17 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(31);
  v13._uint64_t countAndFlagsBits = 0xD000000000000016;
  v13._object = (void *)0x800000023B52C1F0;
  String.append(_:)(v13);
  _print_unlocked<A, B>(_:_:)();
  v14._uint64_t countAndFlagsBits = 0x2073612027;
  v14._object = (void *)0xE500000000000000;
  String.append(_:)(v14);
  swift_getMetatypeMetadata();
  v15._uint64_t countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
LABEL_8:
  lazy protocol witness table accessor for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError();
  swift_allocError();
  *BOOL v12 = v17;
  return swift_willThrow();
}

Distributed::LocalTestingDistributedActorSystemError __swiftcall LocalTestingDistributedActorSystemError.init(message:)(Distributed::LocalTestingDistributedActorSystemError message)
{
  *uint64_t v1 = message;
  return message;
}

void LocalTestingDistributedActorSystem.assignID<A>(_:)(Swift::Int *a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1[5] + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  uint64_t v4 = v1[4];
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    v1[4] = v4 + 1;
    os_unfair_lock_unlock(v3);
    swift_release();
    Swift::Int v5 = dispatch thunk of CustomStringConvertible.description.getter();
    Swift::Int v7 = v6;
    uint64_t v8 = *(os_unfair_lock_s **)(v1[7] + 16);
    os_unfair_lock_lock(v8);
    swift_bridgeObjectRetain();
    specialized Set._Variant.insert(_:)(&v9, v5, v7);
    os_unfair_lock_unlock(v8);
    swift_bridgeObjectRelease();
    *a1 = v5;
    a1[1] = v7;
  }
}

void LocalTestingDistributedActorSystem.actorReady<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(os_unfair_lock_s **)(v3[7] + 16);
  os_unfair_lock_lock(v8);
  uint64_t v9 = v3[6];
  uint64_t v17 = a1;
  swift_bridgeObjectRetain();
  dispatch thunk of Identifiable.id.getter();
  char v10 = specialized Set.contains(_:)(v18, v19, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v8);
  if (v10)
  {
    Swift::String v11 = *(os_unfair_lock_s **)(v3[3] + 16);
    os_unfair_lock_lock(v11);
    uint64_t v17 = a1;
    dispatch thunk of Identifiable.id.getter();
    uint64_t v12 = v18;
    uint64_t v13 = v19;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = v4[2];
    v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, v12, v13, isUniquelyReferenced_nonNull_native, &v17, a2, a3);
    swift_bridgeObjectRelease();
    v4[2] = v17;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v11);
  }
  else
  {
    _StringGuts.grow(_:)(45);
    v15._object = (void *)0x800000023B52C210;
    v15._uint64_t countAndFlagsBits = 0xD000000000000024;
    String.append(_:)(v15);
    dispatch thunk of Identifiable.id.getter();
    _print_unlocked<A, B>(_:_:)();
    swift_bridgeObjectRelease();
    v16._uint64_t countAndFlagsBits = 0x79646165722027;
    v16._object = (void *)0xE700000000000000;
    String.append(_:)(v16);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
  unint64_t v8 = v6 & ~v7;
  uint64_t v9 = a3 + 56;
  if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
    return 0;
  }
  uint64_t v10 = ~v7;
  uint64_t v11 = *(void *)(a3 + 48);
  while (1)
  {
    uint64_t v12 = (void *)(v11 + 16 * v8);
    BOOL v13 = *v12 == a1 && v12[1] == a2;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      break;
    }
    unint64_t v8 = (v8 + 1) & v10;
    if (((*(void *)(v9 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
      return 0;
    }
  }
  return 1;
}

Swift::Void __swiftcall LocalTestingDistributedActorSystem.resignID(_:)(Distributed::LocalTestingActorID a1)
{
  uint64_t v2 = *(void *)a1.id._countAndFlagsBits;
  uint64_t v3 = *(void *)(a1.id._countAndFlagsBits + 8);
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(v1 + 24) + 16);
  os_unfair_lock_lock(v4);
  specialized Dictionary._Variant.removeValue(forKey:)(v2, v3);
  swift_unknownObjectRelease();

  os_unfair_lock_unlock(v4);
}

uint64_t LocalTestingDistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[3] = a2;
  v7[4] = a7;
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  uint64_t v9 = a3[1];
  v7[5] = *a3;
  v7[6] = v9;
  return MEMORY[0x270FA2498](LocalTestingDistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:), 0, 0);
}

uint64_t LocalTestingDistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:)()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(79);
  v3._uint64_t countAndFlagsBits = 0xD000000000000021;
  v3._object = (void *)0x800000023B52C280;
  String.append(_:)(v3);
  v4._uint64_t countAndFlagsBits = v2;
  v4._object = v1;
  Swift::String_optional v6 = _getFunctionFullNameFromMangledName(mangledName:)(v4);
  uint64_t countAndFlagsBits = v6.value._countAndFlagsBits;
  if (v6.value._object)
  {
    object = v6.value._object;
  }
  else
  {
    object = (void *)v0[6];
    swift_bridgeObjectRetain();
    uint64_t countAndFlagsBits = v0[5];
  }
  uint64_t v8 = v0[3];
  uint64_t v9 = object;
  String.append(_:)(*(Swift::String *)&countAndFlagsBits);
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = 0x6F746361206E6F20;
  v10._object = (void *)0xEA00000000002072;
  String.append(_:)(v10);
  v0[2] = v8;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v11._object = (void *)0x800000023B52C2B0;
  v11._uint64_t countAndFlagsBits = 0xD000000000000020;
  String.append(_:)(v11);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))((char *)&async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)
                                                                    + async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:));
  Swift::String v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  void *v10 = v5;
  v10[1] = LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:);
  return v12(a1, a2, a3, a5);
}

uint64_t LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t LocalTestingDistributedActorSystem.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t LocalTestingDistributedActorSystem.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  return MEMORY[0x270FA2498](LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:), 0, 0);
}

uint64_t LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)()
{
  uint64_t v1 = dynamic_cast_existential_2_unconditional(v0[3]);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  Swift::String_optional v6 = (void *)swift_task_alloc();
  v0[4] = v6;
  *Swift::String_optional v6 = v0;
  v6[1] = LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:);
  uint64_t v7 = v0[2];
  return doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(v1, v7, v1, v3, v5);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = *(void *)(a3 - 8);
  v5[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:), 0, 0);
}

uint64_t doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)()
{
  UnsafeRawPointer.load<A>(fromByteOffset:as:)();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:);
  return LocalTestingInvocationResultHandler.onReturn<A>(value:)();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  uint64_t v3 = *(void *)(*(void *)v1 + 56);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:);
  }
  else {
    uint64_t v5 = doInvokeOnReturn #1 <A>(returnType:) in LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t protocol witness for DistributedActorSystem.resolve<A>(id:as:) in conformance LocalTestingDistributedActorSystem(uint64_t *a1)
{
  return LocalTestingDistributedActorSystem.resolve<A>(id:as:)(a1);
}

void protocol witness for DistributedActorSystem.assignID<A>(_:) in conformance LocalTestingDistributedActorSystem(Swift::Int *a1@<X8>)
{
}

void protocol witness for DistributedActorSystem.actorReady<A>(_:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void protocol witness for DistributedActorSystem.resignID(_:) in conformance LocalTestingDistributedActorSystem(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(os_unfair_lock_s **)(*(void *)(*(void *)v1 + 24) + 16);
  os_unfair_lock_lock(v4);
  specialized Dictionary._Variant.removeValue(forKey:)(v2, v3);
  swift_unknownObjectRelease();

  os_unfair_lock_unlock(v4);
}

uint64_t protocol witness for DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  Swift::String v11 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v11;
  *Swift::String v11 = v7;
  v11[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  v11[3] = a2;
  v11[4] = a7;
  uint64_t v12 = a3[1];
  v11[5] = *a3;
  v11[6] = v12;
  return MEMORY[0x270FA2498](LocalTestingDistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:), 0, 0);
}

uint64_t protocol witness for DistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t))((char *)&async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)
                                                                    + async function pointer to specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:));
  Swift::String v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  void *v10 = v5;
  v10[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v12(a1, a2, a3, a5);
}

uint64_t protocol witness for DistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:) in conformance LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  return MEMORY[0x270FA2498](LocalTestingDistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:), 0, 0);
}

uint64_t LocalTestingActorID.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    uint64_t v5 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    uint64_t v7 = v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    *a2 = v5;
    a2[1] = v7;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t LocalTestingActorID.encode(to:)(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t static RemoteCallTarget.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

Swift::Int RemoteCallTarget.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RemoteCallTarget()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance LocalTestingActorID@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    uint64_t v5 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    uint64_t v7 = v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    *a2 = v5;
    a2[1] = v7;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance LocalTestingActorID(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

void LocalTestingInvocationEncoder.recordGenericSubstitution<A>(_:)()
{
}

void LocalTestingInvocationEncoder.recordArgument<A>(_:)()
{
}

void LocalTestingInvocationEncoder.recordErrorType<A>(_:)()
{
}

void LocalTestingInvocationEncoder.recordReturnType<A>(_:)()
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LocalTestingInvocationEncoder.doneRecording()()
{
}

void protocol witness for DistributedTargetInvocationEncoder.recordGenericSubstitution<A>(_:) in conformance LocalTestingInvocationEncoder()
{
}

void protocol witness for DistributedTargetInvocationEncoder.recordArgument<A>(_:) in conformance LocalTestingInvocationEncoder()
{
}

void protocol witness for DistributedTargetInvocationEncoder.recordErrorType<A>(_:) in conformance LocalTestingInvocationEncoder()
{
}

void protocol witness for DistributedTargetInvocationEncoder.recordReturnType<A>(_:) in conformance LocalTestingInvocationEncoder()
{
}

void protocol witness for DistributedTargetInvocationEncoder.doneRecording() in conformance LocalTestingInvocationEncoder()
{
}

void LocalTestingInvocationDecoder.decodeGenericSubstitutions()()
{
}

void LocalTestingInvocationDecoder.decodeNextArgument<A>()()
{
}

void LocalTestingInvocationDecoder.decodeErrorType()()
{
}

void LocalTestingInvocationDecoder.decodeReturnType()()
{
}

uint64_t LocalTestingInvocationDecoder.deinit()
{
  return v0;
}

void protocol witness for DistributedTargetInvocationDecoder.decodeGenericSubstitutions() in conformance LocalTestingInvocationDecoder()
{
}

void protocol witness for DistributedTargetInvocationDecoder.decodeNextArgument<A>() in conformance LocalTestingInvocationDecoder()
{
}

void protocol witness for DistributedTargetInvocationDecoder.decodeErrorType() in conformance LocalTestingInvocationDecoder()
{
}

void protocol witness for DistributedTargetInvocationDecoder.decodeReturnType() in conformance LocalTestingInvocationDecoder()
{
}

uint64_t LocalTestingInvocationResultHandler.onReturn<A>(value:)()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  return MEMORY[0x270FA2498](LocalTestingInvocationResultHandler.onReturn<A>(value:), 0, 0);
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t LocalTestingInvocationResultHandler.onReturnVoid()()
{
  return MEMORY[0x270FA2498](LocalTestingInvocationResultHandler.onReturnVoid(), 0, 0);
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t LocalTestingInvocationResultHandler.onThrow<A>(error:)()
{
  return MEMORY[0x270FA2498](LocalTestingInvocationResultHandler.onThrow<A>(error:), 0, 0);
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t protocol witness for DistributedTargetInvocationResultHandler.onReturn<A>(value:) in conformance LocalTestingInvocationResultHandler()
{
  swift_conformsToProtocol();
  swift_conformsToProtocol();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return LocalTestingInvocationResultHandler.onReturn<A>(value:)();
}

uint64_t protocol witness for DistributedTargetInvocationResultHandler.onReturnVoid() in conformance LocalTestingInvocationResultHandler()
{
  return MEMORY[0x270FA2498](LocalTestingInvocationResultHandler.onReturnVoid(), 0, 0);
}

uint64_t protocol witness for DistributedTargetInvocationResultHandler.onThrow<A>(error:) in conformance LocalTestingInvocationResultHandler()
{
  return MEMORY[0x270FA2498](LocalTestingInvocationResultHandler.onThrow<A>(error:), 0, 0);
}

uint64_t LocalTestingDistributedActorSystemError.message.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _Lock.__deallocating_deinit()
{
  MEMORY[0x23ECC6900](*(void *)(v0 + 16), -1, -1);

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance A(uint64_t a1, uint64_t a2)
{
  return DistributedActor.__actorUnownedExecutor.getter(a1, *(void *)(a2 - 8));
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  type metadata accessor for CodingUserInfoKey();
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t lazy protocol witness table accessor for type DistributedActorCodingError and conformance DistributedActorCodingError()
{
  unint64_t result = lazy protocol witness table cache variable for type DistributedActorCodingError and conformance DistributedActorCodingError;
  if (!lazy protocol witness table cache variable for type DistributedActorCodingError and conformance DistributedActorCodingError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistributedActorCodingError and conformance DistributedActorCodingError);
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

uint64_t outlined init with copy of Decoder(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v10 = v3[4];
  Swift::String v11 = (int *)v3[5];
  uint64_t v12 = v3[6];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v13;
  *uint64_t v13 = v4;
  v13[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error) + async function pointer to thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error));
  return v14(a1, a2, v11, v12, v8, v9, v10, a3);
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    Swift::String v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = ~v5;
    uint64_t v10 = *(void *)(v3 + 48);
    do
    {
      uint64_t v11 = (void *)(v10 + 16 * v6);
      if (*v11 == a1 && v11[1] == a2) {
        break;
      }
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        break;
      }
      unint64_t v6 = (v6 + 1) & v9;
    }
    while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *(void *)(a4 + 24);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *(void *)(a4 + 16);
    if (v7 <= v8) {
      uint64_t v9 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any.Type>);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v13);
        *(void *)(a4 + 16) = 0;
LABEL_18:
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v13, a4);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v7 + 48);
    while (1)
    {
      uint64_t v13 = (void *)(v12 + 16 * v10);
      BOOL v14 = *v13 == a2 && v13[1] == a3;
      if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v17 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
    Swift::Int v18 = v17[1];
    *a1 = *v17;
    a1[1] = v18;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_9:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<LocalTestingActorID>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
    char v5 = (void *)(v2 + 56);
    uint64_t v6 = -1;
    if (v4 < 64) {
      uint64_t v6 = ~(-1 << v4);
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v4 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v11 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v12 = v11 | (v10 << 6);
      }
      else
      {
        int64_t v13 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
          __break(1u);
LABEL_26:
          __break(1u);
          return result;
        }
        if (v13 >= v8) {
          goto LABEL_20;
        }
        unint64_t v14 = v5[v13];
        ++v10;
        if (!v14)
        {
          int64_t v10 = v13 + 1;
          if (v13 + 1 >= v8) {
            goto LABEL_20;
          }
          unint64_t v14 = v5[v10];
          if (!v14)
          {
            int64_t v15 = v13 + 2;
            if (v15 >= v8)
            {
LABEL_20:
              swift_release();
              uint64_t v16 = 1 << *(unsigned char *)(v2 + 32);
              if (v16 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v16 + 63) >> 6, (int64x2_t *)(v2 + 56));
              }
              else {
                *char v5 = -1 << v16;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v5[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v10 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_26;
                }
                if (v10 >= v8) {
                  goto LABEL_20;
                }
                unint64_t v14 = v5[v10];
                ++v15;
                if (v14) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v10 = v15;
          }
        }
LABEL_19:
        unint64_t v7 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
      }
      uint64_t result = specialized _NativeSet._unsafeInsertNew(_:)(*(void *)(*(void *)(v2 + 48) + 16 * v12), *(void *)(*(void *)(v2 + 48) + 16 * v12 + 8), v3);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v3;
  return result;
}

Swift::Int specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int result = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
  unint64_t v8 = result & ~v7;
  uint64_t v9 = a3 + 56;
  unint64_t v10 = v8 >> 6;
  uint64_t v11 = *(void *)(a3 + 56 + 8 * (v8 >> 6));
  uint64_t v12 = 1 << v8;
  if (((1 << v8) & v11) != 0)
  {
    uint64_t v13 = ~v7;
    uint64_t v14 = *(void *)(a3 + 48);
    while (1)
    {
      int64_t v15 = (void *)(v14 + 16 * v8);
      if (*v15 == a1 && v15[1] == a2) {
        break;
      }
      Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if (result) {
        break;
      }
      unint64_t v8 = (v8 + 1) & v13;
      unint64_t v10 = v8 >> 6;
      uint64_t v11 = *(void *)(v9 + 8 * (v8 >> 6));
      uint64_t v12 = 1 << v8;
      if ((v11 & (1 << v8)) == 0) {
        goto LABEL_9;
      }
    }
    Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
LABEL_9:
    *(void *)(v9 + 8 * v10) = v12 | v11;
    char v17 = (void *)(*(void *)(a3 + 48) + 16 * v8);
    *char v17 = a1;
    v17[1] = a2;
    ++*(void *)(a3 + 16);
  }
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  char v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_16;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      Swift::Int result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_16;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v11 + 48);
    do
    {
      uint64_t v16 = (void *)(v15 + 16 * a3);
      if (*v16 == v8 && v16[1] == a2) {
        goto LABEL_19;
      }
      Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if (result) {
        goto LABEL_19;
      }
      a3 = (a3 + 1) & v14;
    }
    while (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_16:
  uint64_t v18 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v19 = (Swift::Int *)(*(void *)(v18 + 48) + 16 * a3);
  *uint64_t v19 = v8;
  v19[1] = a2;
  uint64_t v20 = *(void *)(v18 + 16);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (!v21)
  {
    *(void *)(v18 + 16) = v22;
    return result;
  }
  __break(1u);
LABEL_19:
  Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(unint64_t result, unint64_t a2, int64x2_t *a3)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    Swift::Int result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (a2)
  {
    if (a2 < 4)
    {
      unint64_t v3 = 0;
LABEL_8:
      uint64_t v7 = (unint64_t *)a3 + v3;
      unint64_t v8 = a2 - v3;
      do
      {
        *v7++ = result;
        --v8;
      }
      while (v8);
      return result;
    }
    unint64_t v3 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    int64x2_t v4 = vdupq_n_s64(result);
    char v5 = a3 + 1;
    unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v5[-1] = v4;
      *char v5 = v4;
      v5 += 2;
      v6 -= 4;
    }
    while (v6);
    if (v3 != a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<LocalTestingActorID>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    Swift::Int result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  Swift::Int result = (void *)(v3 + 56);
  uint64_t v7 = v2 + 56;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v5) {
    Swift::Int result = memmove(result, (const void *)(v2 + 56), 8 * v5);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v7 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v7 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    Swift::Int result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v7 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v7 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<LocalTestingActorID>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  if (!*(void *)(v2 + 16))
  {
LABEL_21:
    uint64_t result = swift_release();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = v2 + 56;
  uint64_t v6 = -1;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_retain_n();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_6;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v16 >= v8) {
      goto LABEL_20;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    ++v10;
    if (!v17)
    {
      int64_t v10 = v16 + 1;
      if (v16 + 1 >= v8) {
        goto LABEL_20;
      }
      unint64_t v17 = *(void *)(v5 + 8 * v10);
      if (!v17) {
        break;
      }
    }
LABEL_19:
    unint64_t v7 = (v17 - 1) & v17;
    unint64_t v12 = __clz(__rbit64(v17)) + (v10 << 6);
LABEL_6:
    int64_t v13 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    swift_bridgeObjectRetain();
    uint64_t result = specialized _NativeSet._unsafeInsertNew(_:)(v14, v15, v3);
  }
  int64_t v18 = v16 + 2;
  if (v18 >= v8)
  {
LABEL_20:
    swift_release_n();
    goto LABEL_21;
  }
  unint64_t v17 = *(void *)(v5 + 8 * v18);
  if (v17)
  {
    int64_t v10 = v18;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v10 >= v8) {
      goto LABEL_20;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v10);
    ++v18;
    if (v17) {
      goto LABEL_19;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
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
    specialized _NativeDictionary.copy()();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  specialized _NativeDictionary._delete(at:)(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = (int64x2_t *)*v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LocalTestingActorID, DistributedActor>);
  unint64_t v6 = (void *)static _DictionaryStorage.resize(original:capacity:move:)();
  if (v5[1].i64[0])
  {
    uint64_t v7 = 1 << v5[2].i8[0];
    uint64_t v26 = v3;
    uint64_t v27 = v5 + 4;
    uint64_t v8 = -1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    unint64_t v9 = v8 & v5[4].i64[0];
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    unint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v12 << 6);
      }
      else
      {
        int64_t v15 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
LABEL_29:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_22;
        }
        unint64_t v16 = v27->u64[v15];
        ++v12;
        if (!v16)
        {
          int64_t v12 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_22;
          }
          unint64_t v16 = v27->u64[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 2;
            if (v17 >= v10)
            {
LABEL_22:
              swift_release();
              uint64_t v3 = v26;
              if (a2)
              {
                uint64_t v25 = 1 << v5[2].i8[0];
                if (v25 > 63) {
                  specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v25 + 63) >> 6, v27);
                }
                else {
                  v27->i64[0] = -1 << v25;
                }
                v5[1].i64[0] = 0;
              }
              break;
            }
            unint64_t v16 = v27->u64[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_29;
                }
                if (v12 >= v10) {
                  goto LABEL_22;
                }
                unint64_t v16 = v27->u64[v12];
                ++v17;
                if (v16) {
                  goto LABEL_19;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
LABEL_19:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
      }
      uint64_t v18 = 16 * v14;
      uint64_t v19 = (uint64_t *)(v5[3].i64[0] + v18);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      int64_t v22 = (uint64_t *)(v5[3].i64[1] + v18);
      uint64_t v23 = *v22;
      uint64_t v24 = v22[1];
      if ((a2 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      unint64_t result = specialized _NativeDictionary._unsafeInsertNew(key:value:)(v21, v20, v23, v24, v6);
    }
  }
  unint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        unint64_t result = Hasher._finalize()();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          unint64_t v11 = (_OWORD *)(v10 + 16 * v3);
          int64_t v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *unint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          int64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *unint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  uint64_t *v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t specialized _NativeDictionary._unsafeInsertNew(key:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v10 = Hasher._finalize()();
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v10);
  if (v12)
  {
    unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    a5[(result >> 6) + 8] |= 1 << result;
    uint64_t v13 = (uint64_t *)(a5[6] + 16 * result);
    *uint64_t v13 = a1;
    v13[1] = a2;
    unint64_t v14 = (void *)(a5[7] + 16 * result);
    *unint64_t v14 = a3;
    v14[1] = a4;
    ++a5[2];
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<LocalTestingActorID, DistributedActor>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = (void *)v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v5 = (unint64_t)((1 << *(unsigned char *)(v3 + 32)) + 63) >> 6;
  unint64_t result = (void *)(v3 + 64);
  uint64_t v7 = v2 + 64;
  if (v4 != (void *)v2 || (unint64_t)result >= v2 + 64 + 8 * v5) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v5);
  }
  int64_t v9 = 0;
  v4[2] = *(void *)(v2 + 16);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v7 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v7 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = (void *)(v4[6] + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(v4[7] + v16) = v20;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_unknownObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v7 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v7 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      uint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      uint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError()
{
  unint64_t result = lazy protocol witness table cache variable for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError;
  if (!lazy protocol witness table cache variable for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError);
  }
  return result;
}

uint64_t sub_23B528554()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t type metadata accessor for RemoteCallArgument()
{
  return __swift_instantiateGenericMetadata();
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    size_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void specialized DistributedRemoteActorReferenceExecutor.enqueue(_:)()
{
  uint64_t v0 = ExecutorJob.description.getter();
  uint64_t v2 = v1;
  _StringGuts.grow(_:)(88);
  v3._object = (void *)0x800000023B52C5E0;
  v3._uint64_t countAndFlagsBits = 0xD000000000000022;
  String.append(_:)(v3);
  v4._uint64_t countAndFlagsBits = v0;
  v4._object = v2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._uint64_t countAndFlagsBits = 0xD000000000000034;
  v5._object = (void *)0x800000023B52C610;
  String.append(_:)(v5);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t type metadata accessor for DistributedRemoteActorReferenceExecutor()
{
  return self;
}

uint64_t type metadata accessor for _Lock()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError()
{
  unint64_t result = lazy protocol witness table cache variable for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError;
  if (!lazy protocol witness table cache variable for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t a6, uint64_t a7)
{
  int64_t v13 = (void *)*a5;
  unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v21 = (void *)*a5;
    if (v19)
    {
LABEL_8:
      int64_t v22 = (void *)(v21[7] + 16 * v15);
      *int64_t v22 = a1;
      v22[1] = a7;
      return swift_unknownObjectRelease();
    }
    goto LABEL_13;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
  unint64_t v24 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_19:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v15 = v24;
  uint64_t v21 = (void *)*a5;
  if (v19) {
    goto LABEL_8;
  }
LABEL_13:
  v21[(v15 >> 6) + 8] |= 1 << v15;
  uint64_t v26 = (uint64_t *)(v21[6] + 16 * v15);
  *uint64_t v26 = a2;
  v26[1] = a3;
  uint64_t v27 = (void *)(v21[7] + 16 * v15);
  void *v27 = a1;
  v27[1] = a7;
  uint64_t v28 = v21[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v21[2] = v30;

  return swift_bridgeObjectRetain();
}

uint64_t specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a1;
  v4[4] = a4;
  uint64_t v5 = a2[1];
  v4[5] = *a2;
  v4[6] = v5;
  return MEMORY[0x270FA2498](specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:), 0, 0);
}

uint64_t specialized LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = (void *)v0[6];
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(80);
  v3._object = (void *)0x800000023B52C280;
  v3._uint64_t countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v3);
  v4._uint64_t countAndFlagsBits = v2;
  v4._object = v1;
  Swift::String_optional v6 = _getFunctionFullNameFromMangledName(mangledName:)(v4);
  uint64_t countAndFlagsBits = v6.value._countAndFlagsBits;
  if (v6.value._object)
  {
    object = v6.value._object;
  }
  else
  {
    object = (void *)v0[6];
    swift_bridgeObjectRetain();
    uint64_t countAndFlagsBits = v0[5];
  }
  uint64_t v8 = v0[3];
  int64_t v9 = object;
  String.append(_:)(*(Swift::String *)&countAndFlagsBits);
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = 0x6F746361206E6F20;
  v10._object = (void *)0xEA00000000002072;
  String.append(_:)(v10);
  v0[2] = v8;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  v11._object = (void *)0x800000023B52C4C0;
  v11._uint64_t countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v11);
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t dynamic_cast_existential_2_unconditional(uint64_t a1)
{
  uint64_t result = swift_conformsToProtocol2();
  if (result)
  {
    uint64_t result = swift_conformsToProtocol2();
    if (result) {
      return a1;
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type RemoteCallTarget and conformance RemoteCallTarget()
{
  unint64_t result = lazy protocol witness table cache variable for type RemoteCallTarget and conformance RemoteCallTarget;
  if (!lazy protocol witness table cache variable for type RemoteCallTarget and conformance RemoteCallTarget)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RemoteCallTarget and conformance RemoteCallTarget);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode()
{
  unint64_t result = lazy protocol witness table cache variable for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode;
  if (!lazy protocol witness table cache variable for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExecuteDistributedTargetError.ErrorCode and conformance ExecuteDistributedTargetError.ErrorCode);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for ExecuteDistributedTargetError(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type ExecuteDistributedTargetError and conformance ExecuteDistributedTargetError();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t instantiation function for generic protocol witness table for DistributedActorCodingError(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type DistributedActorCodingError and conformance DistributedActorCodingError();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t base witness table accessor for Executor in DistributedRemoteActorReferenceExecutor()
{
  return lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(&lazy protocol witness table cache variable for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor);
}

uint64_t lazy protocol witness table accessor for type DistributedRemoteActorReferenceExecutor and conformance DistributedRemoteActorReferenceExecutor(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for DistributedRemoteActorReferenceExecutor();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LocalTestingActorID and conformance LocalTestingActorID()
{
  unint64_t result = lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID;
  if (!lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID;
  if (!lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LocalTestingActorID and conformance LocalTestingActorID);
  }
  return result;
}

_UNKNOWN **associated type witness table accessor for DistributedActorSystem.InvocationDecoder : DistributedTargetInvocationDecoder in LocalTestingDistributedActorSystem()
{
  return &protocol witness table for LocalTestingInvocationDecoder;
}

_UNKNOWN **associated type witness table accessor for DistributedActorSystem.InvocationEncoder : DistributedTargetInvocationEncoder in LocalTestingDistributedActorSystem()
{
  return &protocol witness table for LocalTestingInvocationEncoder;
}

_UNKNOWN **associated type witness table accessor for DistributedActorSystem.ResultHandler : DistributedTargetInvocationResultHandler in LocalTestingDistributedActorSystem()
{
  return &protocol witness table for LocalTestingInvocationResultHandler;
}

unint64_t instantiation function for generic protocol witness table for LocalTestingDistributedActorSystemError(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type LocalTestingDistributedActorSystemError and conformance LocalTestingDistributedActorSystemError();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of DistributedActor.actorSystem.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of DistributedActor.unownedExecutor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static DistributedActor.resolve(id:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of DistributedActorSystem.resolve<A>(id:as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 80))();
}

uint64_t dispatch thunk of DistributedActorSystem.assignID<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of DistributedActorSystem.actorReady<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 96))();
}

uint64_t dispatch thunk of DistributedActorSystem.resignID(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of DistributedActorSystem.makeInvocationEncoder()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of DistributedActorSystem.remoteCall<A, B, C>(on:target:invocation:throwing:returning:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a13 + 120) + **(int **)(a13 + 120));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v13 + 16) = v18;
  *uint64_t v18 = v13;
  v18[1] = LocalTestingDistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:);
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t dispatch thunk of DistributedActorSystem.remoteCallVoid<A, B>(on:target:invocation:throwing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a10 + 128) + **(int **)(a10 + 128));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v10 + 16) = v18;
  *uint64_t v18 = v10;
  v18[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t dispatch thunk of DistributedActorSystem.invokeHandlerOnReturn(handler:resultBuffer:metatype:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 136)
                                                                            + **(int **)(a5 + 136));
  Swift::String v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *Swift::String v11 = v5;
  v11[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v13(a1, a2, a3, a4, a5);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for RemoteCallTarget()
{
  return &type metadata for RemoteCallTarget;
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordGenericSubstitution<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordArgument<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordErrorType<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.recordReturnType<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of DistributedTargetInvocationEncoder.doneRecording()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t type metadata instantiation function for RemoteCallArgument(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata completion function for RemoteCallArgument()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RemoteCallArgument(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 32) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    Swift::String v11 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
    unint64_t v12 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    *Swift::String v11 = *v12;
    v11[1] = v12[1];
    uint64_t v13 = ((unint64_t)v11 + v6 + 16) & ~v6;
    uint64_t v14 = ((unint64_t)v12 + v6 + 16) & ~v6;
    unint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v13, v14, v4);
  }
  return a1;
}

uint64_t destroy for RemoteCallArgument(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *initializeWithCopy for RemoteCallArgument(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  v5[1] = v6[1];
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(v7 - 8) + 80);
  uint64_t v10 = ((unint64_t)v5 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)v6 + v9 + 16) & ~v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8(v10, v11, v7);
  return a1;
}

void *assignWithCopy for RemoteCallArgument(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v6 = *v7;
  v6[1] = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))(((unint64_t)v6 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), ((unint64_t)v7 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

_OWORD *initializeWithTake for RemoteCallArgument(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (_OWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (_OWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 32))(((unint64_t)v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)v5 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

void *assignWithTake for RemoteCallArgument(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteCallArgument(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 32) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      unint64_t v15 = ((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8;
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))((v15 + v6 + 16) & ~v6);
      }
      unint64_t v16 = *(void *)(v15 + 8);
      if (v16 >= 0xFFFFFFFF) {
        LODWORD(v16) = -1;
      }
      return (v16 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void storeEnumTagSinglePayload for RemoteCallArgument(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 32) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x23B529CECLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        uint64_t v18 = (void *)((unint64_t)(a1 + 23) & 0xFFFFFFFFFFFFFFF8);
        if ((v7 & 0x80000000) != 0)
        {
          char v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(((unint64_t)v18 + v9 + 16) & ~v9);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *uint64_t v18 = a2 ^ 0x80000000;
          v18[1] = 0;
        }
        else
        {
          v18[1] = a2 - 1;
        }
      }
      return;
  }
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeGenericSubstitutions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeNextArgument<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeErrorType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DistributedTargetInvocationDecoder.decodeReturnType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of DistributedTargetInvocationResultHandler.onReturn<A>(value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DistributedTargetInvocationResultHandler.onReturnVoid()(uint64_t a1, uint64_t a2)
{
  unsigned int v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  unsigned int v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unsigned int v5 = v2;
  v5[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v7(a1, a2);
}

uint64_t dispatch thunk of DistributedTargetInvocationResultHandler.onThrow<A>(error:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  BOOL v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *BOOL v11 = v5;
  v11[1] = partial apply for thunk for @callee_guaranteed @Sendable @async (@guaranteed A) -> (@out A1, @error @owned Error);
  return v13(a1, a2, a3, a4, a5);
}

uint64_t destroy for ExecuteDistributedTargetError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for ExecuteDistributedTargetError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ExecuteDistributedTargetError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
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

uint64_t assignWithTake for ExecuteDistributedTargetError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecuteDistributedTargetError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecuteDistributedTargetError(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExecuteDistributedTargetError()
{
  return &type metadata for ExecuteDistributedTargetError;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExecuteDistributedTargetError.ErrorCode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ExecuteDistributedTargetError.ErrorCode(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x23B52A3B0);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for ExecuteDistributedTargetError.ErrorCode(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for ExecuteDistributedTargetError.ErrorCode(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExecuteDistributedTargetError.ErrorCode()
{
  return &type metadata for ExecuteDistributedTargetError.ErrorCode;
}

ValueMetadata *type metadata accessor for DistributedActorCodingError()
{
  return &type metadata for DistributedActorCodingError;
}

uint64_t method lookup function for DistributedRemoteActorReferenceExecutor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DistributedRemoteActorReferenceExecutor);
}

uint64_t type metadata accessor for LocalTestingDistributedActorSystem()
{
  return self;
}

uint64_t method lookup function for LocalTestingDistributedActorSystem(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalTestingDistributedActorSystem);
}

uint64_t dispatch thunk of LocalTestingDistributedActorSystem.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

ValueMetadata *type metadata accessor for LocalTestingActorID()
{
  return &type metadata for LocalTestingActorID;
}

ValueMetadata *type metadata accessor for LocalTestingInvocationEncoder()
{
  return &type metadata for LocalTestingInvocationEncoder;
}

uint64_t type metadata accessor for LocalTestingInvocationDecoder()
{
  return self;
}

uint64_t method lookup function for LocalTestingInvocationDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalTestingInvocationDecoder);
}

ValueMetadata *type metadata accessor for LocalTestingInvocationResultHandler()
{
  return &type metadata for LocalTestingInvocationResultHandler;
}

void *initializeBufferWithCopyOfBuffer for LocalTestingDistributedActorSystemError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LocalTestingDistributedActorSystemError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RemoteCallTarget(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for LocalTestingDistributedActorSystemError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for LocalTestingDistributedActorSystemError()
{
  return &type metadata for LocalTestingDistributedActorSystemError;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for LocalTestingDistributedActorSystem.ActorIDProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for LocalTestingDistributedActorSystem.ActorIDProvider()
{
  return swift_release();
}

void *assignWithCopy for LocalTestingDistributedActorSystem.ActorIDProvider(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for LocalTestingDistributedActorSystem.ActorIDProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteCallTarget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RemoteCallTarget(uint64_t result, int a2, int a3)
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

void *type metadata accessor for LocalTestingDistributedActorSystem.ActorIDProvider()
{
  return &unk_26EE97670;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v7 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v8 + 16) & ~v8));
    swift_retain();
  }
  else if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }
    int v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1;
    }
    memcpy(a1, a2, v7);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
  }
  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      return a1;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }
    int v13 = *(void (**)(void *, uint64_t))(v6 + 8);
    uint64_t v12 = v6 + 8;
    v13(a1, v5);
    int v10 = *(_DWORD *)(v12 + 76);
    size_t v11 = *(void *)(v12 + 56);
  }
  if (v10) {
    size_t v14 = v11;
  }
  else {
    size_t v14 = v11 + 1;
  }
  memcpy(a1, a2, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    if (v7 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_25;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v7);
        if (!*((unsigned char *)a1 + v7)) {
          goto LABEL_25;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v7 > 3) {
          int v12 = 0;
        }
        if (v7)
        {
          if (v7 <= 3) {
            int v13 = v7;
          }
          else {
            int v13 = 4;
          }
          switch(v13)
          {
            case 2:
              int v14 = *a1;
              break;
            case 3:
              int v14 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              int v14 = *(_DWORD *)a1;
              break;
            default:
              int v14 = *(unsigned __int8 *)a1;
              break;
          }
        }
        else
        {
          int v14 = 0;
        }
        return v6 + (v14 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v7);
      if (*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_15;
      }
    }
  }
LABEL_25:
  if (v5 < 2) {
    return 0;
  }
  unsigned int v16 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v16 >= 2) {
    return v16 - 1;
  }
  else {
    return 0;
  }
}

void storeEnumTagSinglePayload for Optional(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 == 0 || !v11)
  {
LABEL_13:
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  if (v10 > 3)
  {
    int v6 = 1;
    if (v9 < a2) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
  unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
  if (!HIWORD(v13))
  {
    if (v13 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v13 > 1;
    }
    goto LABEL_13;
  }
  int v6 = 4;
  if (v9 < a2)
  {
LABEL_14:
    unsigned int v14 = ~v9 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v16 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v6)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
LABEL_21:
  switch(v6)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x23B52B1DCLL);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v8 >= 2)
        {
          int v17 = *(void (**)(void))(v7 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 48))(a1, 1);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(a1, a2, 1);
}

uint64_t sub_23B52B264()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error)()
{
  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_23B52B29C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed A) -> (@out A1, @error @owned Error)(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 40))(*a1);
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t swift_distributed_getGenericEnvironment()
{
  uint64_t result = swift_findAccessibleFunction();
  if (result)
  {
    uint64_t v1 = *(int *)(result + 4);
    if (v1) {
      result += v1 + 4;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t swift_distributed_execute_target()
{
  uint64_t AccessibleFunction = swift_findAccessibleFunction();
  if (AccessibleFunction)
  {
    unint64_t v2 = (int *)(*(int *)(AccessibleFunction + 12) + AccessibleFunction + 12);
    uint64_t v7 = (char *)v2 + *v2;
    uint64_t v3 = (void *)swift_task_alloc();
    if (v0) {
      uint64_t v4 = v0;
    }
    else {
      uint64_t v4 = 0;
    }
    *uint64_t v3 = v4;
    v3[1] = swift_distributed_execute_target_resume;
    __asm { BRAAZ           X8 }
  }
  swift_distributed_makeDistributedTargetAccessorNotFoundError();
  unsigned int v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t swift_distributed_execute_target_resume()
{
  if (*v0) {
    uint64_t v1 = *v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (*(void *)(v1 + 8)) {
    uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  swift_task_dealloc();
  return v3();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

Swift::String __swiftcall String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  uint64_t v3 = MEMORY[0x270F9D6D8](_builtinStringLiteral, utf8CodeUnitCount, isASCII);
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t UnsafeRawPointer.load<A>(fromByteOffset:as:)()
{
  return MEMORY[0x270F9DA38]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t UnownedSerialExecutor._executor.getter()
{
  return MEMORY[0x270FA2010]();
}

Swift::Void __swiftcall SerialExecutor.checkIsolated()()
{
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x270F9DDF0]();
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

Swift::String_optional __swiftcall _getFunctionFullNameFromMangledName(mangledName:)(Swift::String mangledName)
{
  uint64_t v1 = MEMORY[0x270F9E678](mangledName._countAndFlagsBits, mangledName._object);
  result.value._object = v2;
  result.value._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t ExecutorJob.description.getter()
{
  return MEMORY[0x270FA2140]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F878]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x270FA0210]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_distributed_actor_is_remote()
{
  return MEMORY[0x270FA2438]();
}

uint64_t swift_distributed_getWitnessTables()
{
  return MEMORY[0x270FA0258]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_findAccessibleFunction()
{
  return MEMORY[0x270FA02D8]();
}

uint64_t swift_func_getParameterCount()
{
  return MEMORY[0x270FA02E0]();
}

uint64_t swift_func_getParameterTypeInfo()
{
  return MEMORY[0x270FA02E8]();
}

uint64_t swift_func_getReturnTypeInfo()
{
  return MEMORY[0x270FA02F0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x270FA0328]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x270FA2478]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}