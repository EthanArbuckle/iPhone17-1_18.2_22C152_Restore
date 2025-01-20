uint64_t implicit closure #2 in PaymentsFlow.execute()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  const void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char v9;

  v3 = a1;
  v8 = type metadata accessor for PaymentsFlowState();
  v4 = (*(void *)(*(void *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&v2 - v4;
  v5 = (const void *)(MEMORY[0x270FA5388](v3) + OBJC_IVAR____TtC19SiriPaymentsIntents12PaymentsFlow_flowState);
  v6 = &v9;
  swift_beginAccess();
  outlined init with copy of PaymentsFlowState(v5, v7);
  swift_endAccess();
  return String.init<A>(describing:)();
}

uint64_t PaymentsFlow.deinit()
{
  outlined destroy of PaymentsFlowState(v0 + OBJC_IVAR____TtC19SiriPaymentsIntents12PaymentsFlow_flowState);
  __swift_destroy_boxed_opaque_existential_0(v0 + OBJC_IVAR____TtC19SiriPaymentsIntents12PaymentsFlow_flowFactory);
  outlined destroy of [SFCardSection]();
  return v2;
}

uint64_t PaymentsFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Flow.on(input:) in conformance PaymentsFlow()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))() & 1;
}

uint64_t protocol witness for Flow.onAsync(input:) in conformance PaymentsFlow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = v3;
  *(void *)(v3 + 16) = v3;
  v4 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v4;
  void *v4 = *(void *)(v6 + 16);
  v4[1] = protocol witness for NeedsConfirmationFlowStrategyAsync.shouldRequestUnlockForConfirmation(itemToConfirm:resolveRecord:) in conformance SearchForAccountsNeedsConfirmationStrategy;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t protocol witness for Flow.execute(completion:) in conformance PaymentsFlow()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 144))();
}

uint64_t protocol witness for Flow.execute() in conformance PaymentsFlow(uint64_t a1)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(**(void **)v1 + 152) + **(int **)(**(void **)v1 + 152));
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = partial apply for closure #1 in FlowFactory.unsupportedActionFlow();
  return v6(a1);
}

uint64_t protocol witness for Flow.exitValue.getter in conformance PaymentsFlow()
{
  return Flow<>.exitValue.getter();
}

uint64_t protocol witness for Flow.flexibleExecutionSupport.getter in conformance PaymentsFlow()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_25DA1AF40()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1AF6C()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1AF98()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1AFD8()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for PaymentsFlow()
{
  uint64_t v1 = type metadata singleton initialization cache for PaymentsFlow;
  if (!type metadata singleton initialization cache for PaymentsFlow) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t lazy protocol witness table accessor for type PaymentsFlow and conformance PaymentsFlow()
{
  uint64_t v2 = lazy protocol witness table cache variable for type PaymentsFlow and conformance PaymentsFlow;
  if (!lazy protocol witness table cache variable for type PaymentsFlow and conformance PaymentsFlow)
  {
    type metadata accessor for PaymentsFlow();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type PaymentsFlow and conformance PaymentsFlow);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_25DA1B114()
{
  uint64_t v2 = *(void *)(type metadata accessor for Input() - 8);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)));
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in PaymentsFlow.execute()()
{
  type metadata accessor for Input();

  return implicit closure #1 in PaymentsFlow.execute()();
}

uint64_t sub_25DA1B248()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B274()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B2A0()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B2E0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in PaymentsFlow.execute()()
{
  return implicit closure #2 in PaymentsFlow.execute()(v0);
}

uint64_t sub_25DA1B328()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B354()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B380()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B3C0()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B400()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B42C()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B458()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B498()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B4D8()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B504()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B530()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B570()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1B5B0()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #2 in PaymentsFlow.execute()(uint64_t a1)
{
  return closure #2 in PaymentsFlow.execute()(a1, v1);
}

uint64_t sub_25DA1B5F8()
{
  uint64_t v4 = type metadata accessor for Input();
  uint64_t v2 = *(void *)(v4 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v4);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in PaymentsFlow.execute()(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Input();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v1
     + ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80));

  return closure #1 in PaymentsFlow.execute()(a1, v3, v4);
}

unint64_t initializeBufferWithCopyOfBuffer for PaymentsFlowState(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v9 = *(void *)(a3 - 8);
  int v10 = *(_DWORD *)(v9 + 80);
  if ((v10 & 0x20000) != 0)
  {
    uint64_t v5 = *a2;
    swift_retain();
    *a1 = v5;
    return *a1 + ((v10 + 16) & ~(unint64_t)v10);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() <= 2)
    {
      uint64_t v3 = type metadata accessor for Input();
      (*(void (**)(void *, uint64_t *))(*(void *)(v3 - 8) + 16))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v9 + 64));
    }
    return (unint64_t)a1;
  }
}

uint64_t destroy for PaymentsFlowState(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 2)
  {
    uint64_t v2 = type metadata accessor for Input();
    return (*(uint64_t (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1);
  }
  return result;
}

void *initializeWithCopy for PaymentsFlowState(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() <= 2)
  {
    uint64_t v3 = type metadata accessor for Input();
    (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 16))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for PaymentsFlowState(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of PaymentsFlowState((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() <= 2)
    {
      uint64_t v3 = type metadata accessor for Input();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 16))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for PaymentsFlowState(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() <= 2)
  {
    uint64_t v3 = type metadata accessor for Input();
    (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 32))(a1, a2);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for PaymentsFlowState(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of PaymentsFlowState((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() <= 2)
    {
      uint64_t v3 = type metadata accessor for Input();
      (*(void (**)(void *, const void *))(*(void *)(v3 - 8) + 32))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t type metadata completion function for PaymentsFlowState()
{
  uint64_t v2 = type metadata accessor for Input();
  if (v0 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return v2;
}

uint64_t ObjC metadata update function for PaymentsFlow()
{
  return type metadata accessor for PaymentsFlow();
}

uint64_t type metadata completion function for PaymentsFlow()
{
  uint64_t updated = type metadata accessor for PaymentsFlowState();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_25DA1C304()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in closure #1 in PaymentsFlow.execute()()
{
  return implicit closure #1 in closure #1 in PaymentsFlow.execute()();
}

uint64_t sub_25DA1C33C()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1C368()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1C394()
{
  return swift_deallocObject();
}

uint64_t sub_25DA1C3D4()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type GuardFlowResult and conformance GuardFlowResult()
{
  uint64_t v2 = lazy protocol witness table cache variable for type GuardFlowResult and conformance GuardFlowResult;
  if (!lazy protocol witness table cache variable for type GuardFlowResult and conformance GuardFlowResult)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type GuardFlowResult and conformance GuardFlowResult);
    return WitnessTable;
  }
  return v2;
}

uint64_t UsoEntity_common_App.appIdentifier.getter()
{
  uint64_t v28 = 0;
  v29 = closure #1 in UsoEntity_common_App.appIdentifier.getter;
  v30 = closure #2 in UsoEntity_common_App.appIdentifier.getter;
  v31 = closure #3 in UsoEntity_common_App.appIdentifier.getter;
  v32 = closure #2 in UsoEntity_common_App.appIdentifier.getter;
  uint64_t v52 = 0;
  uint64_t v51 = 0;
  uint64_t v33 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoIdentifier?);
  unint64_t v35 = (*(void *)(*(void *)(v34 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v34);
  uint64_t v36 = (uint64_t)&v5 - v35;
  unint64_t v37 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v5 - v35);
  uint64_t v38 = (uint64_t)&v5 - v37;
  uint64_t v52 = v0;
  object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("name", 4uLL, 1)._object;
  uint64_t v40 = dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)();
  swift_bridgeObjectRelease();
  if (!v40)
  {
    uint64_t v15 = v28;
    uint64_t v16 = v28;
    return v15;
  }
  uint64_t v27 = v40;
  uint64_t v2 = v33;
  uint64_t v23 = v40;
  uint64_t v51 = v40;
  uint64_t v48 = v40;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoIdentifier]);
  unint64_t v25 = lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
  uint64_t result = Sequence.first(where:)();
  uint64_t v26 = v2;
  if (v2)
  {
    __break(1u);
    __break(1u);
  }
  else
  {
    _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))v30, 0, v34, MEMORY[0x263F8E628], MEMORY[0x263F8D310], v21, (uint64_t)&v49);
    uint64_t v22 = 0;
    outlined destroy of UsoIdentifier?(v38);
    uint64_t v19 = v49;
    uint64_t v20 = v50;
    if (v50)
    {
      uint64_t v17 = v19;
      uint64_t v18 = v20;
      uint64_t v14 = v20;
      uint64_t v13 = v19;
      uint64_t v41 = v19;
      uint64_t v42 = v20;
      swift_bridgeObjectRelease();
      uint64_t v15 = v13;
      uint64_t v16 = v14;
      return v15;
    }
    uint64_t v4 = v22;
    uint64_t v45 = v23;
    uint64_t result = Sequence.first(where:)();
    uint64_t v12 = v4;
    if (!v4)
    {
      _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))v32, 0, v34, MEMORY[0x263F8E628], MEMORY[0x263F8D310], v21, (uint64_t)&v46);
      outlined destroy of UsoIdentifier?(v36);
      uint64_t v10 = v46;
      uint64_t v11 = v47;
      if (v47)
      {
        uint64_t v8 = v10;
        uint64_t v9 = v11;
        uint64_t v7 = v11;
        uint64_t v6 = v10;
        uint64_t v43 = v10;
        uint64_t v44 = v11;
        swift_bridgeObjectRelease();
        uint64_t v15 = v6;
        uint64_t v16 = v7;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v15 = v28;
        uint64_t v16 = v28;
      }
      return v15;
    }
  }
  __break(1u);
  __break(1u);
  return result;
}

uint64_t UsoEntity_common_PaymentAccount.balanceTypeAsINType.getter()
{
  uint64_t v166 = 0;
  v145 = closure #1 in closure #1 in static Transformer<>.transformer(previousIntent:contactResolver:);
  v146 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v147 = partial apply for implicit closure #1 in UsoEntity_common_PaymentAccount.balanceTypeAsINType.getter;
  v148 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v149 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v151 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v152 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v153 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v204 = 0;
  uint64_t v203 = 0;
  uint64_t v154 = 0;
  uint64_t v196 = 0;
  char v182 = 0;
  uint64_t v155 = type metadata accessor for Logger();
  uint64_t v156 = *(void *)(v155 - 8);
  uint64_t v157 = v155 - 8;
  unint64_t v158 = (*(void *)(v156 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v155);
  v159 = (char *)&v40 - v158;
  unint64_t v160 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v40 - v158);
  v161 = (char *)&v40 - v160;
  unint64_t v162 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v40 - v160);
  v163 = (char *)&v40 - v162;
  unint64_t v164 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v40 - v162);
  v165 = (char *)&v40 - v164;
  unint64_t v167 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoIdentifier?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v166);
  uint64_t v168 = (uint64_t)&v40 - v167;
  uint64_t v169 = type metadata accessor for UsoIdentifier();
  uint64_t v170 = *(void *)(v169 - 8);
  uint64_t v171 = v169 - 8;
  unint64_t v172 = (*(void *)(v170 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v169);
  v173 = (char *)&v40 - v172;
  v204 = (char *)&v40 - v172;
  uint64_t v203 = v0;
  uint64_t v174 = dispatch thunk of UsoEntity_common_PaymentAccount.balance.getter();
  if (v174
    && (uint64_t v144 = v174,
        uint64_t v142 = v174,
        uint64_t v143 = dispatch thunk of UsoEntity_common_CurrencyAmount.currency.getter(),
        swift_release(),
        v143))
  {
    uint64_t v141 = v143;
    uint64_t v138 = v143;
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("name", 4uLL, 1)._object;
    uint64_t v139 = dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v140 = v139;
  }
  else
  {
    uint64_t v140 = 0;
  }
  uint64_t v136 = v140;
  if (!v140)
  {
    uint64_t v34 = v159;
    uint64_t v35 = Logger.payments.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v34, v35, v155);
    v59 = Logger.logObject.getter();
    int v58 = static os_log_type_t.debug.getter();
    v56 = &v201;
    uint64_t v201 = 2;
    unint64_t v54 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v55 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v57 = v202;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v60 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v59, (os_log_type_t)v58))
    {
      uint64_t v36 = v154;
      uint64_t v44 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v43 = 0;
      uint64_t v45 = createStorage<A>(capacity:type:)(0);
      uint64_t v46 = createStorage<A>(capacity:type:)(v43);
      uint64_t v50 = &v200;
      v200 = v44;
      uint64_t v51 = &v199;
      uint64_t v199 = v45;
      uint64_t v48 = &v198;
      uint64_t v198 = v46;
      unsigned int v47 = 0;
      serialize(_:at:)(0, &v200);
      serialize(_:at:)(v47, v50);
      uint64_t v197 = v60;
      uint64_t v49 = &v40;
      MEMORY[0x270FA5388](&v40);
      unint64_t v37 = v51;
      uint64_t v38 = &v40 - 6;
      uint64_t v52 = &v40 - 6;
      v38[2] = (uint64_t)v50;
      v38[3] = (uint64_t)v37;
      v38[4] = v39;
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v36)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_25D85A000, v59, (os_log_type_t)v58, "#UsoEntity_common_PaymentAccount no USO identifiers found trying to determine balance type, returning unknown", v44, v57);
        uint64_t v41 = 0;
        destroyStorage<A>(_:count:)(v45, 0, v42);
        destroyStorage<A>(_:count:)(v46, v41, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611B9630](v44, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v156 + 8))(v159, v155);
    return v166;
  }
  uint64_t v135 = v136;
  uint64_t v4 = v154;
  uint64_t v132 = v136;
  uint64_t v196 = v136;
  uint64_t v195 = v136;
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoIdentifier]);
  lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
  uint64_t result = Sequence.first(where:)();
  uint64_t v134 = v4;
  if (!v4)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v170 + 48))(v168, 1, v169) == 1)
    {
      uint64_t v28 = v161;
      outlined destroy of UsoIdentifier?(v168);
      uint64_t v29 = Logger.payments.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v28, v29, v155);
      v79 = Logger.logObject.getter();
      int v78 = static os_log_type_t.debug.getter();
      v76 = &v193;
      uint64_t v193 = 2;
      unint64_t v74 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v75 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v77 = v194;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v80 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v79, (os_log_type_t)v78))
      {
        uint64_t v30 = v134;
        v64 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v63 = 0;
        uint64_t v65 = createStorage<A>(capacity:type:)(0);
        uint64_t v66 = createStorage<A>(capacity:type:)(v63);
        v70 = &v192;
        v192 = v64;
        v71 = &v191;
        uint64_t v191 = v65;
        v68 = &v190;
        uint64_t v190 = v66;
        unsigned int v67 = 0;
        serialize(_:at:)(0, &v192);
        serialize(_:at:)(v67, v70);
        uint64_t v189 = v80;
        v69 = &v40;
        MEMORY[0x270FA5388](&v40);
        v31 = v71;
        v32 = &v40 - 6;
        v72 = &v40 - 6;
        v32[2] = (uint64_t)v70;
        v32[3] = (uint64_t)v31;
        v32[4] = v33;
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v30)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_25D85A000, v79, (os_log_type_t)v78, "#UsoEntity_common_PaymentAccount no identifiers for balance type had the expected namespace, returning unknown", v64, v77);
          uint64_t v61 = 0;
          destroyStorage<A>(_:count:)(v65, 0, v62);
          destroyStorage<A>(_:count:)(v66, v61, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x2611B9630](v64, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v156 + 8))(v161, v155);
      swift_bridgeObjectRelease();
      return v166;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v170 + 32))(v173, v168, v169);
      v6._countAndFlagsBits = UsoIdentifier.value.getter();
      LOBYTE(v7) = Constants.PaymentAccountBalanceType.init(rawValue:)(v6);
      int v131 = v7;
      if (v7 == 4)
      {
        uint64_t v22 = v163;
        uint64_t v23 = Logger.payments.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v22, v23, v155);
        v99 = Logger.logObject.getter();
        int v98 = static os_log_type_t.debug.getter();
        v96 = &v187;
        uint64_t v187 = 2;
        unint64_t v94 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v95 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v97 = v188;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v100 = _allocateUninitializedArray<A>(_:)();
        if (os_log_type_enabled(v99, (os_log_type_t)v98))
        {
          uint64_t v24 = v134;
          v84 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v83 = 0;
          uint64_t v85 = createStorage<A>(capacity:type:)(0);
          uint64_t v86 = createStorage<A>(capacity:type:)(v83);
          v90 = &v186;
          v186 = v84;
          v91 = &v185;
          uint64_t v185 = v85;
          v88 = &v184;
          uint64_t v184 = v86;
          unsigned int v87 = 0;
          serialize(_:at:)(0, &v186);
          serialize(_:at:)(v87, v90);
          uint64_t v183 = v100;
          v89 = &v40;
          MEMORY[0x270FA5388](&v40);
          unint64_t v25 = v91;
          uint64_t v26 = &v40 - 6;
          v92 = &v40 - 6;
          v26[2] = (uint64_t)v90;
          v26[3] = (uint64_t)v25;
          v26[4] = v27;
          uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
          lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
          Sequence.forEach(_:)();
          if (v24)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_25D85A000, v99, (os_log_type_t)v98, "#UsoEntity_common_PaymentAccount balanceType couldn't parse, returning unknown", v84, v97);
            uint64_t v81 = 0;
            destroyStorage<A>(_:count:)(v85, 0, v82);
            destroyStorage<A>(_:count:)(v86, v81, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x2611B9630](v84, MEMORY[0x263F8E778]);
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v156 + 8))(v163, v155);
        (*(void (**)(char *, uint64_t))(v170 + 8))(v173, v169);
        swift_bridgeObjectRelease();
        return v166;
      }
      else
      {
        int v130 = v131;
        uint64_t v8 = v165;
        int v112 = v131;
        char v182 = v131;
        uint64_t v9 = Logger.payments.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v8, v9, v155);
        uint64_t v117 = 17;
        uint64_t v119 = 7;
        uint64_t v120 = swift_allocObject();
        *(unsigned char *)(v120 + 16) = v112;
        v128 = Logger.logObject.getter();
        int v129 = static os_log_type_t.debug.getter();
        v115 = &v180;
        uint64_t v180 = 12;
        unint64_t v113 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v114 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v116 = v181;
        uint64_t v122 = swift_allocObject();
        *(unsigned char *)(v122 + 16) = 32;
        uint64_t v123 = swift_allocObject();
        *(unsigned char *)(v123 + 16) = 8;
        uint64_t v118 = 32;
        uint64_t v10 = swift_allocObject();
        uint64_t v11 = v120;
        uint64_t v121 = v10;
        *(void *)(v10 + 16) = v147;
        *(void *)(v10 + 24) = v11;
        uint64_t v12 = swift_allocObject();
        uint64_t v13 = v121;
        uint64_t v125 = v12;
        *(void *)(v12 + 16) = v148;
        *(void *)(v12 + 24) = v13;
        uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v124 = _allocateUninitializedArray<A>(_:)();
        v126 = v14;
        swift_retain();
        uint64_t v15 = v122;
        uint64_t v16 = v126;
        *v126 = v149;
        v16[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
        swift_retain();
        uint64_t v17 = v123;
        uint64_t v18 = v126;
        v126[2] = v150;
        v18[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v17;
        swift_retain();
        uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v125;
        uint64_t v20 = v126;
        v126[4] = v151;
        v20[5] = v19;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v128, (os_log_type_t)v129))
        {
          uint64_t v21 = v134;
          v105 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v106 = createStorage<A>(capacity:type:)(0);
          uint64_t v107 = createStorage<A>(capacity:type:)(1);
          v108 = &v179;
          v179 = v105;
          v109 = &v178;
          uint64_t v178 = v106;
          v110 = &v177;
          uint64_t v177 = v107;
          serialize(_:at:)(2, &v179);
          serialize(_:at:)(1, v108);
          v175 = v149;
          uint64_t v176 = v122;
          closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)v108, (uint64_t)v109, (uint64_t)v110);
          uint64_t v111 = v21;
          if (v21)
          {
            __break(1u);
          }
          else
          {
            v175 = v150;
            uint64_t v176 = v123;
            closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
            uint64_t v103 = 0;
            v175 = v151;
            uint64_t v176 = v125;
            closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
            _os_log_impl(&dword_25D85A000, v128, (os_log_type_t)v129, "#UsoEntity_common_PaymentAccount found balance type %s", v105, v116);
            destroyStorage<A>(_:count:)(v106, 0, v104);
            destroyStorage<A>(_:count:)(v107, 1, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x2611B9630](v105, MEMORY[0x263F8E778]);
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

        (*(void (**)(char *, uint64_t))(v156 + 8))(v165, v155);
        uint64_t v101 = Constants.PaymentAccountBalanceType.asINBalanceType.getter(v112);
        (*(void (**)(char *, uint64_t))(v170 + 8))(v173, v169);
        swift_bridgeObjectRelease();
        return v101;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t UsoEntity_common_PaymentAccount.accountAsINType.getter()
{
  uint64_t v166 = 0;
  v145 = closure #1 in UsoEntity_common_PaymentAccount.accountAsINType.getter;
  v146 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v147 = partial apply for implicit closure #1 in UsoEntity_common_PaymentAccount.accountAsINType.getter;
  v148 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  v149 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v150 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v151 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v152 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v153 = partial apply for closure #1 in osLogInternal(_:log:type:);
  v205 = 0;
  uint64_t v204 = 0;
  uint64_t v154 = 0;
  uint64_t v197 = 0;
  char v183 = 0;
  uint64_t v182 = 0;
  uint64_t v155 = type metadata accessor for Logger();
  uint64_t v156 = *(void *)(v155 - 8);
  uint64_t v157 = v155 - 8;
  unint64_t v158 = (*(void *)(v156 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v155);
  v159 = (char *)&v41 - v158;
  unint64_t v160 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v41 - v158);
  v161 = (char *)&v41 - v160;
  unint64_t v162 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v41 - v160);
  v163 = (char *)&v41 - v162;
  unint64_t v164 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v41 - v162);
  v165 = (char *)&v41 - v164;
  unint64_t v167 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoIdentifier?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v166);
  uint64_t v168 = (uint64_t)&v41 - v167;
  uint64_t v169 = type metadata accessor for UsoIdentifier();
  uint64_t v170 = *(void *)(v169 - 8);
  uint64_t v171 = v169 - 8;
  unint64_t v172 = (*(void *)(v170 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v169);
  v173 = (char *)&v41 - v172;
  v205 = (char *)&v41 - v172;
  uint64_t v204 = v0;
  uint64_t v174 = dispatch thunk of UsoEntity_common_PaymentAccount.accountType.getter();
  if (v174)
  {
    uint64_t v144 = v174;
    uint64_t v141 = v174;
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("name", 4uLL, 1)._object;
    uint64_t v142 = dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v143 = v142;
  }
  else
  {
    uint64_t v143 = 0;
  }
  uint64_t v139 = v143;
  if (!v143)
  {
    uint64_t v35 = v159;
    uint64_t v36 = Logger.payments.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v35, v36, v155);
    uint64_t v60 = Logger.logObject.getter();
    int v59 = static os_log_type_t.debug.getter();
    uint32_t v57 = &v202;
    uint64_t v202 = 2;
    unint64_t v55 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    unint64_t v56 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
    lazy protocol witness table accessor for type Int and conformance Int();
    UnsignedInteger<>.init<A>(_:)();
    uint32_t v58 = v203;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
    uint64_t v61 = _allocateUninitializedArray<A>(_:)();
    if (os_log_type_enabled(v60, (os_log_type_t)v59))
    {
      uint64_t v37 = v154;
      uint64_t v45 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      uint64_t v44 = 0;
      uint64_t v46 = createStorage<A>(capacity:type:)(0);
      uint64_t v47 = createStorage<A>(capacity:type:)(v44);
      uint64_t v51 = &v201;
      uint64_t v201 = v45;
      uint64_t v52 = &v200;
      uint64_t v200 = v46;
      uint64_t v49 = &v199;
      uint64_t v199 = v47;
      unsigned int v48 = 0;
      serialize(_:at:)(0, &v201);
      serialize(_:at:)(v48, v51);
      uint64_t v198 = v61;
      uint64_t v50 = &v41;
      MEMORY[0x270FA5388](&v41);
      uint64_t v38 = v52;
      uint64_t v39 = &v41 - 6;
      uint64_t v53 = &v41 - 6;
      v39[2] = (uint64_t)v51;
      v39[3] = (uint64_t)v38;
      v39[4] = v40;
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
      lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
      Sequence.forEach(_:)();
      if (v37)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_25D85A000, v60, (os_log_type_t)v59, "#UsoEntity_common_PaymentAccount no USO identifiers found trying to determine account type,returning unknown", v45, v58);
        uint64_t v42 = 0;
        destroyStorage<A>(_:count:)(v46, 0, v43);
        destroyStorage<A>(_:count:)(v47, v42, MEMORY[0x263F8EE58] + 8);
        MEMORY[0x2611B9630](v45, MEMORY[0x263F8E778]);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v156 + 8))(v159, v155);
    return v166;
  }
  uint64_t v138 = v139;
  uint64_t v4 = v154;
  uint64_t v135 = v139;
  uint64_t v197 = v139;
  uint64_t v196 = v139;
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoIdentifier]);
  lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
  uint64_t result = Sequence.first(where:)();
  uint64_t v137 = v4;
  if (!v4)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v170 + 48))(v168, 1, v169) == 1)
    {
      uint64_t v29 = v161;
      outlined destroy of UsoIdentifier?(v168);
      uint64_t v30 = Logger.payments.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v29, v30, v155);
      uint64_t v80 = Logger.logObject.getter();
      int v79 = static os_log_type_t.debug.getter();
      uint32_t v77 = &v194;
      uint64_t v194 = 2;
      unint64_t v75 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v76 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v78 = v195;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v81 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v80, (os_log_type_t)v79))
      {
        uint64_t v31 = v137;
        uint64_t v65 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v64 = 0;
        uint64_t v66 = createStorage<A>(capacity:type:)(0);
        uint64_t v67 = createStorage<A>(capacity:type:)(v64);
        v71 = &v193;
        uint64_t v193 = v65;
        v72 = &v192;
        uint64_t v192 = v66;
        v69 = &v191;
        uint64_t v191 = v67;
        unsigned int v68 = 0;
        serialize(_:at:)(0, &v193);
        serialize(_:at:)(v68, v71);
        uint64_t v190 = v81;
        v70 = &v41;
        MEMORY[0x270FA5388](&v41);
        v32 = v72;
        uint64_t v33 = &v41 - 6;
        uint64_t v73 = &v41 - 6;
        v33[2] = (uint64_t)v71;
        v33[3] = (uint64_t)v32;
        v33[4] = v34;
        uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v31)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_25D85A000, v80, (os_log_type_t)v79, "#UsoEntity_common_PaymentAccount no identifiers had the expected namespace, returning unknown", v65, v78);
          uint64_t v62 = 0;
          destroyStorage<A>(_:count:)(v66, 0, v63);
          destroyStorage<A>(_:count:)(v67, v62, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x2611B9630](v65, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v156 + 8))(v161, v155);
      swift_bridgeObjectRelease();
      return v166;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v170 + 32))(v173, v168, v169);
      v6.value._countAndFlagsBits = UsoIdentifier.value.getter();
      LOBYTE(v7) = Constants.PaymentAccountType.init(from:)(v6);
      int v134 = v7;
      if (v7 == 9
        || (int v133 = v134,
            int v131 = v134,
            char v183 = v134,
            uint64_t v132 = Constants.PaymentAccountType.asINAccountType.getter(v134),
            (v8 & 1) != 0))
      {
        uint64_t v23 = v163;
        uint64_t v24 = Logger.payments.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v23, v24, v155);
        uint64_t v100 = Logger.logObject.getter();
        int v99 = static os_log_type_t.debug.getter();
        uint32_t v97 = &v188;
        uint64_t v188 = 2;
        unint64_t v95 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v96 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v98 = v189;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v101 = _allocateUninitializedArray<A>(_:)();
        if (os_log_type_enabled(v100, (os_log_type_t)v99))
        {
          uint64_t v25 = v137;
          uint64_t v85 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v84 = 0;
          uint64_t v86 = createStorage<A>(capacity:type:)(0);
          uint64_t v87 = createStorage<A>(capacity:type:)(v84);
          v91 = &v187;
          uint64_t v187 = v85;
          v92 = &v186;
          uint64_t v186 = v86;
          v89 = &v185;
          uint64_t v185 = v87;
          unsigned int v88 = 0;
          serialize(_:at:)(0, &v187);
          serialize(_:at:)(v88, v91);
          uint64_t v184 = v101;
          v90 = &v41;
          MEMORY[0x270FA5388](&v41);
          uint64_t v26 = v92;
          uint64_t v27 = &v41 - 6;
          uint64_t v93 = &v41 - 6;
          v27[2] = (uint64_t)v91;
          v27[3] = (uint64_t)v26;
          v27[4] = v28;
          uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
          lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
          Sequence.forEach(_:)();
          if (v25)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_25D85A000, v100, (os_log_type_t)v99, "#UsoEntity_common_PaymentAccount accountType couldn't parse, returning unknown", v85, v98);
            uint64_t v82 = 0;
            destroyStorage<A>(_:count:)(v86, 0, v83);
            destroyStorage<A>(_:count:)(v87, v82, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x2611B9630](v85, MEMORY[0x263F8E778]);
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v156 + 8))(v163, v155);
        (*(void (**)(char *, uint64_t))(v170 + 8))(v173, v169);
        swift_bridgeObjectRelease();
        return v166;
      }
      else
      {
        uint64_t v130 = v132;
        uint64_t v9 = v165;
        uint64_t v112 = v132;
        uint64_t v182 = v132;
        uint64_t v10 = Logger.payments.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v9, v10, v155);
        uint64_t v117 = 17;
        uint64_t v119 = 7;
        uint64_t v120 = swift_allocObject();
        *(unsigned char *)(v120 + 16) = v131;
        v128 = Logger.logObject.getter();
        int v129 = static os_log_type_t.debug.getter();
        v115 = &v180;
        uint64_t v180 = 12;
        unint64_t v113 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v114 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v116 = v181;
        uint64_t v122 = swift_allocObject();
        *(unsigned char *)(v122 + 16) = 32;
        uint64_t v123 = swift_allocObject();
        *(unsigned char *)(v123 + 16) = 8;
        uint64_t v118 = 32;
        uint64_t v11 = swift_allocObject();
        uint64_t v12 = v120;
        uint64_t v121 = v11;
        *(void *)(v11 + 16) = v147;
        *(void *)(v11 + 24) = v12;
        uint64_t v13 = swift_allocObject();
        uint64_t v14 = v121;
        uint64_t v125 = v13;
        *(void *)(v13 + 16) = v148;
        *(void *)(v13 + 24) = v14;
        uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v124 = _allocateUninitializedArray<A>(_:)();
        v126 = v15;
        swift_retain();
        uint64_t v16 = v122;
        uint64_t v17 = v126;
        *v126 = v149;
        v17[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v16;
        swift_retain();
        uint64_t v18 = v123;
        uint64_t v19 = v126;
        v126[2] = v150;
        v19[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v18;
        swift_retain();
        uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v125;
        uint64_t v21 = v126;
        v126[4] = v151;
        v21[5] = v20;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v128, (os_log_type_t)v129))
        {
          uint64_t v22 = v137;
          v105 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v106 = createStorage<A>(capacity:type:)(0);
          uint64_t v107 = createStorage<A>(capacity:type:)(1);
          v108 = &v179;
          v179 = v105;
          v109 = &v178;
          uint64_t v178 = v106;
          v110 = &v177;
          uint64_t v177 = v107;
          serialize(_:at:)(2, &v179);
          serialize(_:at:)(1, v108);
          v175 = v149;
          uint64_t v176 = v122;
          closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)v108, (uint64_t)v109, (uint64_t)v110);
          uint64_t v111 = v22;
          if (v22)
          {
            __break(1u);
          }
          else
          {
            v175 = v150;
            uint64_t v176 = v123;
            closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
            uint64_t v103 = 0;
            v175 = v151;
            uint64_t v176 = v125;
            closure #1 in osLogInternal(_:log:type:)(&v175, (uint64_t)&v179, (uint64_t)&v178, (uint64_t)&v177);
            _os_log_impl(&dword_25D85A000, v128, (os_log_type_t)v129, "#UsoEntity_common_PaymentAccount found accountType %s", v105, v116);
            destroyStorage<A>(_:count:)(v106, 0, v104);
            destroyStorage<A>(_:count:)(v107, 1, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x2611B9630](v105, MEMORY[0x263F8E778]);
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

        (*(void (**)(char *, uint64_t))(v156 + 8))(v165, v155);
        (*(void (**)(char *, uint64_t))(v170 + 8))(v173, v169);
        swift_bridgeObjectRelease();
        return v112;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t UsoEntity_common_CurrencyAmount.currencyIdentifier.getter()
{
  uint64_t v143 = 0;
  uint32_t v116 = closure #1 in closure #1 in static Transformer<>.transformer(previousIntent:contactResolver:);
  uint64_t v117 = closure #2 in UsoEntity_common_CurrencyAmount.currencyIdentifier.getter;
  uint64_t v118 = implicit closure #2 in UsoEntity_common_CurrencyAmount.currencyIdentifier.getter;
  uint64_t v119 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v120 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v121 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v122 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v123 = implicit closure #2 in UsoEntity_common_CurrencyAmount.currencyIdentifier.getter;
  uint64_t v124 = partial apply for implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:);
  uint64_t v125 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  v126 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v127 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in OSLogArguments.append(_:);
  uint64_t v177 = 0;
  uint64_t v176 = 0;
  uint64_t v128 = 0;
  uint64_t v172 = 0;
  unint64_t v129 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoIdentifier?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v130 = (uint64_t)&v37 - v129;
  uint64_t v131 = type metadata accessor for UsoIdentifier();
  uint64_t v132 = *(void *)(v131 - 8);
  uint64_t v133 = v131 - 8;
  unint64_t v134 = (*(void *)(v132 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v143);
  uint64_t v135 = (char *)&v37 - v134;
  uint64_t v177 = (char *)&v37 - v134;
  uint64_t v136 = type metadata accessor for Locale();
  uint64_t v137 = *(void *)(v136 - 8);
  uint64_t v138 = v136 - 8;
  unint64_t v139 = (*(void *)(v137 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v136);
  uint64_t v140 = (char *)&v37 - v139;
  unint64_t v141 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v37 - v139);
  uint64_t v142 = (char *)&v37 - v141;
  unint64_t v144 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale.Currency?)
                                - 8)
                    + 64)
        + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v143);
  uint64_t v145 = (uint64_t)&v37 - v144;
  unint64_t v146 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v147 = (uint64_t)&v37 - v146;
  uint64_t v148 = type metadata accessor for Logger();
  uint64_t v149 = *(void *)(v148 - 8);
  uint64_t v150 = v148 - 8;
  unint64_t v151 = (*(void *)(v149 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v148);
  v152 = (char *)&v37 - v151;
  unint64_t v153 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v37 - v151);
  uint64_t v154 = (char *)&v37 - v153;
  uint64_t v176 = v0;
  uint64_t v155 = dispatch thunk of UsoEntity_common_CurrencyAmount.currency.getter();
  if (v155)
  {
    uint64_t v115 = v155;
    uint64_t v112 = v155;
    object = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("name", 4uLL, 1)._object;
    uint64_t v113 = dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v114 = v113;
  }
  else
  {
    uint64_t v114 = 0;
  }
  uint64_t v174 = v114;
  if (v114)
  {
    uint64_t v175 = v174;
  }
  else
  {
    uint64_t v175 = _allocateUninitializedArray<A>(_:)();
    outlined destroy of [SFCardSection]();
  }
  uint64_t v5 = v128;
  uint64_t v173 = v175;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoIdentifier]);
  lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
  uint64_t result = _ArrayProtocol.filter(_:)();
  uint64_t v109 = v5;
  uint64_t v110 = result;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    uint64_t v105 = v110;
    uint64_t v172 = v110;
    swift_bridgeObjectRetain();
    uint64_t v106 = &v171;
    uint64_t v171 = v105;
    lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
    int v107 = Collection.isEmpty.getter();
    outlined destroy of [SFCardSection]();
    if (v107)
    {
      int v7 = v154;
      uint64_t v8 = Logger.payments.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v7, v8, v148);
      uint64_t v103 = Logger.logObject.getter();
      int v104 = static os_log_type_t.debug.getter();
      v91 = &v161;
      uint64_t v161 = 12;
      unint64_t v89 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v90 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v92 = v162;
      uint64_t v93 = 17;
      uint64_t v95 = 7;
      uint64_t v97 = swift_allocObject();
      *(unsigned char *)(v97 + 16) = 32;
      uint64_t v98 = swift_allocObject();
      *(unsigned char *)(v98 + 16) = 8;
      uint64_t v94 = 32;
      uint64_t v9 = swift_allocObject();
      uint64_t v96 = v9;
      *(void *)(v9 + 16) = v123;
      *(void *)(v9 + 24) = 0;
      uint64_t v10 = swift_allocObject();
      uint64_t v11 = v96;
      uint64_t v100 = v10;
      *(void *)(v10 + 16) = v124;
      *(void *)(v10 + 24) = v11;
      uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v99 = _allocateUninitializedArray<A>(_:)();
      uint64_t v101 = v12;
      swift_retain();
      uint64_t v13 = v97;
      uint64_t v14 = v101;
      *uint64_t v101 = v125;
      v14[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v13;
      swift_retain();
      uint64_t v15 = v98;
      uint64_t v16 = v101;
      v101[2] = v126;
      v16[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v15;
      swift_retain();
      uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v100;
      uint64_t v18 = v101;
      v101[4] = v127;
      v18[5] = v17;
      _finalizeUninitializedArray<A>(_:)();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v103, (os_log_type_t)v104))
      {
        uint64_t v19 = v109;
        uint64_t v82 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v83 = createStorage<A>(capacity:type:)(0);
        uint64_t v84 = createStorage<A>(capacity:type:)(1);
        uint64_t v85 = &v160;
        unint64_t v160 = v82;
        uint64_t v86 = &v159;
        uint64_t v159 = v83;
        uint64_t v87 = &v158;
        uint64_t v158 = v84;
        serialize(_:at:)(2, &v160);
        serialize(_:at:)(1, v85);
        uint64_t v156 = v125;
        uint64_t v157 = v97;
        closure #1 in osLogInternal(_:log:type:)(&v156, (uint64_t)v85, (uint64_t)v86, (uint64_t)v87);
        uint64_t v88 = v19;
        if (v19)
        {
          __break(1u);
        }
        else
        {
          uint64_t v156 = v126;
          uint64_t v157 = v98;
          closure #1 in osLogInternal(_:log:type:)(&v156, (uint64_t)&v160, (uint64_t)&v159, (uint64_t)&v158);
          uint64_t v80 = 0;
          uint64_t v156 = v127;
          uint64_t v157 = v100;
          closure #1 in osLogInternal(_:log:type:)(&v156, (uint64_t)&v160, (uint64_t)&v159, (uint64_t)&v158);
          _os_log_impl(&dword_25D85A000, v103, (os_log_type_t)v104, "#UsoEntity_common_CurrencyAmount currencyIdentifier could not find any USO identifiers for currencyUnit, will use Locale.current's unit %s", v82, v92);
          destroyStorage<A>(_:count:)(v83, 0, v81);
          destroyStorage<A>(_:count:)(v84, 1, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x2611B9630](v82, MEMORY[0x263F8E778]);
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

      (*(void (**)(char *, uint64_t))(v149 + 8))(v154, v148);
      static Locale.current.getter();
      Locale.currency.getter();
      (*(void (**)(char *, uint64_t))(v137 + 8))(v142, v136);
      uint64_t v77 = type metadata accessor for Locale.Currency();
      uint64_t v78 = *(void *)(v77 - 8);
      uint64_t v79 = v77 - 8;
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v78 + 48))(v147, 1) == 1)
      {
        uint64_t v72 = 0;
        outlined destroy of Locale.Currency?(v147);
        *(void *)&long long v76 = v72;
        *((void *)&v76 + 1) = v72;
      }
      else
      {
        *(void *)&long long v75 = MEMORY[0x2611B6CD0]();
        *((void *)&v75 + 1) = v20;
        (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v147, v77);
        long long v76 = v75;
      }
      long long v73 = v76;
      swift_bridgeObjectRelease();
      return v73;
    }
    uint64_t v21 = v109;
    uint64_t v170 = v105;
    lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
    uint64_t result = Sequence.first(where:)();
    uint64_t v71 = v21;
    if (!v21)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v132 + 48))(v130, 1, v131) == 1)
      {
        uint64_t v23 = v152;
        outlined destroy of UsoIdentifier?(v130);
        uint64_t v24 = Logger.payments.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v23, v24, v148);
        uint64_t v67 = Logger.logObject.getter();
        int v68 = static os_log_type_t.debug.getter();
        unint64_t v55 = &v168;
        uint64_t v168 = 12;
        unint64_t v53 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        unint64_t v54 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
        lazy protocol witness table accessor for type Int and conformance Int();
        UnsignedInteger<>.init<A>(_:)();
        uint32_t v56 = v169;
        uint64_t v57 = 17;
        uint64_t v59 = 7;
        uint64_t v61 = swift_allocObject();
        *(unsigned char *)(v61 + 16) = 32;
        uint64_t v62 = swift_allocObject();
        *(unsigned char *)(v62 + 16) = 8;
        uint64_t v58 = 32;
        uint64_t v25 = swift_allocObject();
        uint64_t v60 = v25;
        *(void *)(v25 + 16) = v118;
        *(void *)(v25 + 24) = 0;
        uint64_t v26 = swift_allocObject();
        uint64_t v27 = v60;
        uint64_t v64 = v26;
        *(void *)(v26 + 16) = v119;
        *(void *)(v26 + 24) = v27;
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
        uint64_t v63 = _allocateUninitializedArray<A>(_:)();
        uint64_t v65 = v28;
        swift_retain();
        uint64_t v29 = v61;
        uint64_t v30 = v65;
        *uint64_t v65 = v120;
        v30[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v29;
        swift_retain();
        uint64_t v31 = v62;
        v32 = v65;
        v65[2] = v121;
        v32[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v31;
        swift_retain();
        uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v64;
        uint64_t v34 = v65;
        v65[4] = v122;
        v34[5] = v33;
        _finalizeUninitializedArray<A>(_:)();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v67, (os_log_type_t)v68))
        {
          uint64_t v35 = v71;
          uint64_t v46 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
          uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          uint64_t v47 = createStorage<A>(capacity:type:)(0);
          uint64_t v48 = createStorage<A>(capacity:type:)(1);
          uint64_t v49 = &v167;
          unint64_t v167 = v46;
          uint64_t v50 = &v166;
          uint64_t v166 = v47;
          uint64_t v51 = &v165;
          uint64_t v165 = v48;
          serialize(_:at:)(2, &v167);
          serialize(_:at:)(1, v49);
          v163 = v120;
          uint64_t v164 = v61;
          closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51);
          uint64_t v52 = v35;
          if (v35)
          {
            __break(1u);
          }
          else
          {
            v163 = v121;
            uint64_t v164 = v62;
            closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v167, (uint64_t)&v166, (uint64_t)&v165);
            uint64_t v44 = 0;
            v163 = v122;
            uint64_t v164 = v64;
            closure #1 in osLogInternal(_:log:type:)(&v163, (uint64_t)&v167, (uint64_t)&v166, (uint64_t)&v165);
            _os_log_impl(&dword_25D85A000, v67, (os_log_type_t)v68, "#UsoEntity_common_CurrencyAmount currencyIdentifier isAmbiguousCurrency is true, will use Locale.current's unit %s", v46, v56);
            destroyStorage<A>(_:count:)(v47, 0, v45);
            destroyStorage<A>(_:count:)(v48, 1, MEMORY[0x263F8EE58] + 8);
            MEMORY[0x2611B9630](v46, MEMORY[0x263F8E778]);
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

        (*(void (**)(char *, uint64_t))(v149 + 8))(v152, v148);
        static Locale.current.getter();
        Locale.currency.getter();
        (*(void (**)(char *, uint64_t))(v137 + 8))(v140, v136);
        uint64_t v41 = type metadata accessor for Locale.Currency();
        uint64_t v42 = *(void *)(v41 - 8);
        uint64_t v43 = v41 - 8;
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v42 + 48))(v145, 1) == 1)
        {
          uint64_t v37 = 0;
          outlined destroy of Locale.Currency?(v145);
          *(void *)&long long v40 = v37;
          *((void *)&v40 + 1) = v37;
        }
        else
        {
          *(void *)&long long v39 = MEMORY[0x2611B6CD0]();
          *((void *)&v39 + 1) = v36;
          (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v145, v41);
          long long v40 = v39;
        }
        long long v38 = v40;
        swift_bridgeObjectRelease();
        return v38;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v132 + 32))(v135, v130, v131);
        UsoIdentifier.value.getter();
        uint64_t v69 = v22;
        Swift::String v70 = String.uppercased()();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v132 + 8))(v135, v131);
        swift_bridgeObjectRelease();
        return v70._countAndFlagsBits;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t UsoEntity_common_Person.contactId.getter()
{
  uint64_t v18 = closure #1 in UsoEntity_common_Person.contactId.getter;
  uint64_t v20 = 0;
  uint64_t v16 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoIdentifier?);
  unint64_t v13 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v15 = (uint64_t)&v4 - v13;
  uint64_t v20 = v0;
  swift_retain();
  uint64_t v14 = dispatch thunk of CodeGenBase.usoIdentifiers.getter();
  swift_release();
  uint64_t v19 = v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoIdentifier]);
  lazy protocol witness table accessor for type [UsoIdentifier] and conformance [A]();
  Sequence.first(where:)();
  outlined destroy of [SFCardSection]();
  uint64_t v10 = type metadata accessor for UsoIdentifier();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = v10 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 48))(v15, 1) == 1)
  {
    uint64_t v5 = 0;
    outlined destroy of UsoIdentifier?(v15);
    uint64_t v8 = v5;
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v6 = UsoIdentifier.value.getter();
    uint64_t v7 = v2;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v10);
    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }
  return v8;
}

uint64_t static UsoEntity.from(_:)(void *a1)
{
  id v139 = a1;
  uint64_t v168 = 0;
  uint64_t v167 = 0;
  uint64_t v166 = 0;
  uint64_t v165 = 0;
  uint64_t v157 = 0;
  uint64_t v155 = 0;
  uint64_t v156 = 0;
  uint64_t v153 = 0;
  uint64_t v154 = 0;
  id v152 = 0;
  uint64_t v151 = 0;
  uint64_t v149 = 0;
  uint64_t v150 = 0;
  uint64_t v148 = 0;
  id v147 = 0;
  uint64_t v146 = 0;
  uint64_t v141 = 0;
  uint64_t v142 = 0;
  Builtin::Word v130 = 0;
  uint64_t v123 = type metadata accessor for SpeakableString();
  uint64_t v124 = *(void *)(v123 - 8);
  uint64_t v125 = v123 - 8;
  unint64_t v126 = (*(void *)(v124 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v127 = (char *)v34 - v126;
  uint64_t v168 = v2;
  uint64_t v167 = v1;
  type metadata accessor for UsoEntityBuilder_common_PaymentAccount();
  uint64_t v136 = UsoEntityBuilder_common_PaymentAccount.__allocating_init()();
  uint64_t v166 = v136;
  type metadata accessor for UsoEntityBuilder_common_PaymentAccountType();
  uint64_t v138 = UsoEntityBuilder_common_PaymentAccountType.__allocating_init()();
  uint64_t v165 = v138;
  uint64_t v3 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  uint64_t v133 = &v163;
  uint64_t v163 = v3;
  uint64_t v164 = v4;
  unint64_t v129 = "";
  int v131 = 1;
  Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", v130, 1);
  object = v5._object;
  DefaultStringInterpolation.appendLiteral(_:)(v5);
  swift_bridgeObjectRelease();
  objc_msgSend(v139, sel_accountType);
  INBalanceType.rawValue.getter();
  uint64_t v162 = v6;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v129, v130, v131 & 1);
  uint64_t v132 = v7._object;
  DefaultStringInterpolation.appendLiteral(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v135 = v163;
  uint64_t v134 = v164;
  swift_bridgeObjectRetain();
  outlined destroy of String.UTF8View();
  String.init(stringInterpolation:)();
  uint64_t v137 = v8;
  dispatch thunk of UsoEntityBuilder_common_PaymentAccountType.setName(value:)();
  swift_bridgeObjectRelease();
  swift_retain();
  dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setAccountType(value:)();
  swift_release();
  id v140 = objc_msgSend(v139, sel_accountNumber);
  if (v140)
  {
    id v122 = v140;
    id v117 = v140;
    uint64_t v118 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v119 = v9;

    uint64_t v120 = v118;
    uint64_t v121 = v119;
  }
  else
  {
    uint64_t v120 = 0;
    uint64_t v121 = 0;
  }
  uint64_t v115 = v121;
  uint64_t v116 = v120;
  if (v121)
  {
    uint64_t v113 = v116;
    uint64_t v114 = v115;
    uint64_t v112 = v115;
    uint64_t v141 = v116;
    uint64_t v142 = v115;
    dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setAccountNumber(value:)();
    swift_bridgeObjectRelease();
  }
  id v111 = objc_msgSend(v139, sel_balance);
  if (v111)
  {
    id v110 = v111;
    id v107 = v111;
    id v152 = v111;
    type metadata accessor for UsoEntityBuilder_common_CurrencyAmount();
    uint64_t v108 = UsoEntityBuilder_common_CurrencyAmount.__allocating_init()();
    uint64_t v151 = v108;
    id v109 = objc_msgSend(v107, sel_amount);
    if (v109)
    {
      id v106 = v109;
      id v105 = v109;
      id v147 = v109;
      Builtin::Word v97 = 0;
      type metadata accessor for UsoEntityBuilder_common_Number();
      uint64_t v104 = UsoEntityBuilder_common_Number.__allocating_init()();
      uint64_t v146 = v104;
      uint64_t v10 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v100 = &v144;
      uint64_t v144 = v10;
      uint64_t v145 = v11;
      uint64_t v96 = "";
      int v98 = 1;
      Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", v97, 1);
      uint64_t v93 = v12._object;
      DefaultStringInterpolation.appendLiteral(_:)(v12);
      swift_bridgeObjectRelease();
      uint64_t v95 = &v143;
      id v143 = v105;
      unint64_t v94 = type metadata accessor for NSDecimalNumber();
      lazy protocol witness table accessor for type NSDecimalNumber and conformance NSObject();
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      Swift::String v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v96, v97, v98 & 1);
      uint64_t v99 = v13._object;
      DefaultStringInterpolation.appendLiteral(_:)(v13);
      swift_bridgeObjectRelease();
      uint64_t v102 = v144;
      uint64_t v101 = v145;
      swift_bridgeObjectRetain();
      outlined destroy of String.UTF8View();
      String.init(stringInterpolation:)();
      uint64_t v103 = v14;
      dispatch thunk of UsoEntityBuilder_common_Number.setName(value:)();
      swift_bridgeObjectRelease();
      swift_retain();
      dispatch thunk of UsoEntityBuilder_common_CurrencyAmount.setAmount(value:)();
      swift_release();
      swift_release();
    }
    id v92 = objc_msgSend(v107, sel_currencyCode);
    if (v92)
    {
      id v91 = v92;
      id v86 = v92;
      uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v88 = v15;

      uint64_t v89 = v87;
      uint64_t v90 = v88;
    }
    else
    {
      uint64_t v89 = 0;
      uint64_t v90 = 0;
    }
    uint64_t v84 = v90;
    uint64_t v85 = v89;
    if (v90)
    {
      uint64_t v82 = v85;
      uint64_t v83 = v84;
      uint64_t v81 = v84;
      uint64_t v79 = v85;
      uint64_t v149 = v85;
      uint64_t v150 = v84;
      type metadata accessor for UsoEntityBuilder_common_Currency();
      uint64_t v80 = UsoEntityBuilder_common_Currency.__allocating_init()();
      uint64_t v148 = v80;
      dispatch thunk of UsoEntityBuilder_common_Currency.setName(value:)();
      swift_retain();
      dispatch thunk of UsoEntityBuilder_common_CurrencyAmount.setCurrency(value:)();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_retain();
    dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setBalance(value:)();
    swift_release();
    swift_release();
  }
  id v78 = objc_msgSend(v139, sel_nickname);
  if (v78)
  {
    id v77 = v78;
    id v72 = v78;
    INSpeakableString.toSpeakableString.getter();

    uint64_t v73 = SpeakableString.print.getter();
    uint64_t v74 = v16;
    (*(void (**)(char *, uint64_t))(v124 + 8))(v127, v123);
    uint64_t v75 = v73;
    uint64_t v76 = v74;
  }
  else
  {
    uint64_t v75 = 0;
    uint64_t v76 = 0;
  }
  uint64_t v70 = v76;
  uint64_t v71 = v75;
  if (v76)
  {
    uint64_t v68 = v71;
    uint64_t v69 = v70;
    uint64_t v67 = v70;
    uint64_t v153 = v71;
    uint64_t v154 = v70;
    dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setNickname(value:)();
    swift_bridgeObjectRelease();
  }
  id v66 = objc_msgSend(v139, sel_organizationName);
  if (v66)
  {
    id v65 = v66;
    id v60 = v66;
    INSpeakableString.toSpeakableString.getter();

    uint64_t v61 = SpeakableString.print.getter();
    uint64_t v62 = v17;
    (*(void (**)(char *, uint64_t))(v124 + 8))(v127, v123);
    uint64_t v63 = v61;
    uint64_t v64 = v62;
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v64 = 0;
  }
  uint64_t v58 = v64;
  uint64_t v59 = v63;
  if (v64)
  {
    uint64_t v56 = v59;
    uint64_t v57 = v58;
    uint64_t v55 = v58;
    uint64_t v155 = v59;
    uint64_t v156 = v58;
    dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setOrganization(value:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v54 = MEMORY[0x2611B8260](v136);
  if (v54)
  {
    uint64_t v53 = v54;
    uint64_t v52 = v54;
    uint64_t v157 = v54;
    swift_release();
    swift_release();
    return v52;
  }
  else
  {
    Builtin::Word v43 = 0;
    uint64_t v49 = type metadata accessor for TransformationError();
    lazy protocol witness table accessor for type TransformationError and conformance TransformationError();
    int v36 = 1;
    uint64_t v51 = swift_allocError();
    uint64_t v48 = v19;
    v34[6] = 1;
    uint64_t v20 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    v34[3] = &v160;
    uint64_t v160 = v20;
    uint64_t v161 = v21;
    uint64_t v35 = "";
    Swift::String v22 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", v43, v36 & 1);
    v34[1] = v22._object;
    DefaultStringInterpolation.appendLiteral(_:)(v22);
    swift_bridgeObjectRelease();
    type metadata accessor for INPaymentAccount();
    DefaultStringInterpolation.appendInterpolation(_:)();
    Swift::String v23 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v35, v43, v36 & 1);
    v34[2] = v23._object;
    DefaultStringInterpolation.appendLiteral(_:)(v23);
    swift_bridgeObjectRelease();
    v34[5] = v160;
    v34[4] = v161;
    swift_bridgeObjectRetain();
    outlined destroy of String.UTF8View();
    uint64_t v44 = String.init(stringInterpolation:)();
    uint64_t v45 = v24;
    uint64_t v25 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    long long v38 = &v158;
    uint64_t v158 = v25;
    uint64_t v159 = v26;
    Swift::String v27 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v35, v43, v36 & 1);
    v34[7] = v27._object;
    DefaultStringInterpolation.appendLiteral(_:)(v27);
    swift_bridgeObjectRelease();
    type metadata accessor for UsoEntity();
    DefaultStringInterpolation.appendInterpolation(_:)();
    Swift::String v28 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(v35, v43, v36 & 1);
    uint64_t v37 = v28._object;
    DefaultStringInterpolation.appendLiteral(_:)(v28);
    swift_bridgeObjectRelease();
    uint64_t v40 = v158;
    uint64_t v39 = v159;
    swift_bridgeObjectRetain();
    outlined destroy of String.UTF8View();
    uint64_t v41 = String.init(stringInterpolation:)();
    uint64_t v42 = v29;
    uint64_t v169 = v44;
    uint64_t v170 = v45;
    uint64_t v171 = v41;
    uint64_t v172 = v29;
    uint64_t v173 = 0;
    uint64_t v174 = 0;
    char v175 = 5;
    uint64_t v46 = PaymentsError.errorDescription.getter();
    uint64_t v47 = v30;
    outlined consume of PaymentsError(v44, v45, v41, v42, v43, v43, 5);
    uint64_t v31 = v47;
    v32 = v48;
    uint64_t v33 = v49;
    *uint64_t v48 = v46;
    v32[1] = v31;
    (*(void (**)(void))(*(void *)(v33 - 8) + 104))();
    swift_willThrow();
    swift_release();
    swift_release();
    return v50;
  }
}

{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  Swift::String v12;
  Swift::String v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;

  id v77 = 0;
  uint64_t v69 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  id v66 = 0;
  id v65 = 0;
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  uint64_t v62 = 0;
  uint64_t v61 = 0;
  id v60 = 0;
  uint64_t v56 = 0;
  uint64_t v55 = 0;
  uint64_t v54 = 0;
  id v78 = a1;
  type metadata accessor for UsoEntityBuilder_common_Payment();
  uint64_t v50 = UsoEntityBuilder_common_Payment.__allocating_init()();
  uint64_t v76 = v50;
  uint64_t v74 = objc_msgSend(a1, sel_payee);
  uint64_t v1 = a1;
  if (v74)
  {
    uint64_t v75 = v74;
  }
  else
  {
    uint64_t v75 = objc_msgSend(a1, sel_payer);
    outlined destroy of SFRichText?(&v74);
  }

  uint64_t v49 = v75;
  if (v75)
  {
    uint64_t v56 = v75;
    type metadata accessor for UsoEntityBuilder_common_PaymentAccount();
    uint64_t v55 = UsoEntityBuilder_common_PaymentAccount.__allocating_init()();
    type metadata accessor for UsoEntityBuilder_common_Person();
    uint64_t v54 = UsoEntityBuilder_common_Person.__allocating_init()();
    uint64_t v53 = objc_msgSend(v49, sel_personHandle);
    if (v53)
    {
      uint64_t v47 = v53;
      uint64_t v2 = v53;
      outlined destroy of SFRichText?(&v53);
      uint64_t v48 = objc_msgSend(v47, sel_value);
      if (v48)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v45 = v3;

        uint64_t v46 = v45;
      }
      else
      {
        uint64_t v46 = 0;
      }

      uint64_t v44 = v46;
    }
    else
    {
      outlined destroy of SFRichText?(&v53);
      uint64_t v44 = 0;
    }
    if (v44)
    {
      type metadata accessor for UsoEntityBuilder_common_ContactAddress();
      UsoEntityBuilder_common_ContactAddress.__allocating_init()();
      dispatch thunk of UsoEntityBuilder_common_ContactAddress.setValue(value:)();
      swift_retain();
      dispatch thunk of UsoEntityBuilder_common_Person.setSpecifyingContactAddress(value:)();
      swift_release();
      Builtin::Word v43 = objc_msgSend(v49, sel_displayName);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      dispatch thunk of UsoEntityBuilder_common_Person.setName(value:)();
      swift_bridgeObjectRelease();

      swift_retain();
      dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setHolder(value:)();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
    }
    uint64_t v52 = objc_msgSend(a1, sel_payee);
    uint64_t v42 = v52 != 0;
    outlined destroy of SFRichText?(&v52);
    swift_retain();
    if (v42) {
      dispatch thunk of UsoEntityBuilder_common_Payment.setPayee(value:)();
    }
    else {
      dispatch thunk of UsoEntityBuilder_common_Payment.setPayer(value:)();
    }
    swift_release();
    swift_release();
    swift_release();
  }
  uint64_t v41 = objc_msgSend(a1, sel_currencyAmount);
  if (v41)
  {
    id v66 = v41;
    type metadata accessor for UsoEntityBuilder_common_CurrencyAmount();
    id v65 = UsoEntityBuilder_common_CurrencyAmount.__allocating_init()();
    uint64_t v40 = objc_msgSend(v41, sel_amount);
    if (v40)
    {
      uint64_t v61 = v40;
      type metadata accessor for UsoEntityBuilder_common_Number();
      id v60 = UsoEntityBuilder_common_Number.__allocating_init()();
      uint64_t v58 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
      uint64_t v59 = v4;
      Swift::String v5 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v5);
      swift_bridgeObjectRelease();
      uint64_t v57 = v40;
      type metadata accessor for NSDecimalNumber();
      lazy protocol witness table accessor for type NSDecimalNumber and conformance NSObject();
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      uint64_t v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
      DefaultStringInterpolation.appendLiteral(_:)(v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      outlined destroy of String.UTF8View();
      String.init(stringInterpolation:)();
      dispatch thunk of UsoEntityBuilder_common_Number.setName(value:)();
      swift_bridgeObjectRelease();
      swift_retain();
      dispatch thunk of UsoEntityBuilder_common_CurrencyAmount.setAmount(value:)();
      swift_release();
      swift_release();
    }
    uint64_t v39 = objc_msgSend(v41, sel_currencyCode);
    if (v39)
    {
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      int v36 = v7;

      uint64_t v37 = v35;
      long long v38 = v36;
    }
    else
    {
      uint64_t v37 = 0;
      long long v38 = 0;
    }
    if (v38)
    {
      uint64_t v63 = v37;
      uint64_t v64 = v38;
      type metadata accessor for UsoEntityBuilder_common_Currency();
      uint64_t v62 = UsoEntityBuilder_common_Currency.__allocating_init()();
      dispatch thunk of UsoEntityBuilder_common_Currency.setName(value:)();
      swift_retain();
      dispatch thunk of UsoEntityBuilder_common_CurrencyAmount.setCurrency(value:)();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_retain();
    dispatch thunk of UsoEntityBuilder_common_Payment.setAmount(value:)();
    swift_release();
    swift_release();
  }
  uint64_t v34 = objc_msgSend(a1, sel_note);
  if (v34)
  {
    uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v31 = v8;

    v32 = v30;
    uint64_t v33 = v31;
  }
  else
  {
    v32 = 0;
    uint64_t v33 = 0;
  }
  if (v33)
  {
    uint64_t v67 = v32;
    uint64_t v68 = v33;
    dispatch thunk of UsoEntityBuilder_common_Payment.setMemo(value:)();
    swift_bridgeObjectRelease();
  }
  uint64_t v29 = MEMORY[0x2611B8260](v50);
  if (v29)
  {
    uint64_t v69 = v29;
    swift_release();
    return v29;
  }
  else
  {
    Swift::String v27 = type metadata accessor for TransformationError();
    lazy protocol witness table accessor for type TransformationError and conformance TransformationError();
    swift_allocError();
    uint64_t v26 = v10;
    id v72 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    uint64_t v73 = v11;
    Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v12);
    swift_bridgeObjectRelease();
    type metadata accessor for INPaymentRecord();
    DefaultStringInterpolation.appendInterpolation(_:)();
    Swift::String v13 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of String.UTF8View();
    Swift::String v22 = String.init(stringInterpolation:)();
    Swift::String v23 = v14;
    uint64_t v70 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
    uint64_t v71 = v15;
    uint64_t v16 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v16);
    swift_bridgeObjectRelease();
    type metadata accessor for UsoEntity();
    DefaultStringInterpolation.appendInterpolation(_:)();
    uint64_t v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    DefaultStringInterpolation.appendLiteral(_:)(v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    outlined destroy of String.UTF8View();
    uint64_t v20 = String.init(stringInterpolation:)();
    uint64_t v21 = v18;
    uint64_t v79 = v22;
    uint64_t v80 = v23;
    uint64_t v81 = v20;
    uint64_t v82 = v18;
    uint64_t v83 = 0;
    uint64_t v84 = 0;
    uint64_t v85 = 5;
    uint64_t v24 = PaymentsError.errorDescription.getter();
    uint64_t v25 = v19;
    outlined consume of PaymentsError(v22, v23, v20, v21, 0, 0, 5);
    *uint64_t v26 = v24;
    v26[1] = v25;
    (*(void (**)(void))(*(void *)(v27 - 8) + 104))();
    swift_willThrow();
    swift_release();
    return v28;
  }
}

uint64_t UsoEntity.eraseToAny.getter()
{
  return swift_release();
}

uint64_t closure #1 in UsoEntity_common_Person.contactId.getter(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v43 = 0;
  uint64_t v22 = 0;
  uint64_t v37 = type metadata accessor for UsoIdentifier();
  uint64_t v33 = *(void *)(v37 - 8);
  uint64_t v34 = v37 - 8;
  unint64_t v23 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v35 = &v7[-v23];
  uint64_t v28 = type metadata accessor for IdentifierAppBundle();
  uint64_t v25 = *(void *)(v28 - 8);
  uint64_t v26 = v28 - 8;
  unint64_t v24 = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v28);
  Swift::String v27 = &v7[-v24];
  uint64_t v43 = a1;
  UsoIdentifier.appBundleSemantic.getter();
  uint64_t v29 = IdentifierAppBundle.rawValue.getter();
  uint64_t v32 = v2;
  (*(void (**)(unsigned char *, uint64_t))(v25 + 8))(v27, v28);
  uint64_t v3 = AppUtil.usoContactsBundleId.unsafeMutableAddressor();
  uint64_t v30 = *(void *)v3;
  uint64_t v31 = *((void *)v3 + 1);
  swift_bridgeObjectRetain();
  int v38 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v33 + 16))(v35, v36, v37);
  if ((v38 & 1) == 0)
  {
    int v10 = 0;
    goto LABEL_12;
  }
  uint64_t v19 = UsoIdentifier.namespace.getter();
  uint64_t v20 = v4;
  swift_bridgeObjectRetain();
  uint64_t v18 = UsoIdentifierNamespace.rawValue.getter(0);
  uint64_t v21 = v5;
  swift_bridgeObjectRetain();
  v40[0] = v19;
  v40[1] = v20;
  uint64_t v41 = v18;
  uint64_t v42 = v21;
  if (!v20)
  {
    if (!v42)
    {
      outlined destroy of String.UTF8View();
      int v17 = 1;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  outlined init with copy of String(v40, v39);
  if (!v42)
  {
    outlined destroy of String.UTF8View();
LABEL_9:
    outlined destroy of DIIdentifier();
    int v17 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = v39[0];
  uint64_t v14 = v39[1];
  swift_bridgeObjectRetain();
  uint64_t v12 = v41;
  uint64_t v15 = v40;
  uint64_t v13 = v42;
  swift_bridgeObjectRetain();
  int v16 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String.UTF8View();
  int v17 = v16;
LABEL_8:
  int v9 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v10 = v9;
LABEL_12:
  int v8 = v10;
  (*(void (**)(unsigned char *, uint64_t))(v33 + 8))(v35, v37);
  return v8 & 1;
}

uint64_t closure #1 in UsoEntity_common_App.appIdentifier.getter(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v37 = 0;
  uint64_t v24 = type metadata accessor for UsoIdentifier();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  unint64_t v27 = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v7 - v27;
  uint64_t v37 = a1;
  uint64_t v29 = UsoIdentifier.namespace.getter();
  uint64_t v30 = v2;
  swift_bridgeObjectRetain();
  uint64_t v3 = AppUtil.usoNamespace.unsafeMutableAddressor();
  uint64_t v31 = *(void *)v3;
  uint64_t v32 = *((void *)v3 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v34[0] = v29;
  v34[1] = v30;
  uint64_t v35 = v31;
  uint64_t v36 = v32;
  if (v30)
  {
    outlined init with copy of String(v34, v33);
    if (v36)
    {
      uint64_t v16 = v33[0];
      uint64_t v19 = v33[1];
      swift_bridgeObjectRetain();
      uint64_t v20 = v34;
      uint64_t v17 = v35;
      uint64_t v18 = v36;
      swift_bridgeObjectRetain();
      int v21 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined destroy of String.UTF8View();
      int v22 = v21;
      goto LABEL_7;
    }
    outlined destroy of String.UTF8View();
    goto LABEL_9;
  }
  if (v36)
  {
LABEL_9:
    outlined destroy of DIIdentifier();
    int v22 = 0;
    goto LABEL_7;
  }
  outlined destroy of String.UTF8View();
  int v22 = 1;
LABEL_7:
  int v15 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v23, v24);
  if (v15)
  {
    uint64_t v9 = UsoIdentifier.appBundleId.getter();
    uint64_t v12 = v4;
    uint64_t v5 = AppUtil.usoAppBundleId.unsafeMutableAddressor();
    uint64_t v10 = *(void *)v5;
    uint64_t v11 = *((void *)v5 + 1);
    swift_bridgeObjectRetain();
    int v13 = static String.== infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v14 = v13;
  }
  else
  {
    int v14 = 0;
  }
  int v8 = v14;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
  return v8 & 1;
}

uint64_t closure #2 in UsoEntity_common_App.appIdentifier.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UsoIdentifier.value.getter();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v18 = a7;
  uint64_t v19 = a1;
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  uint64_t v25 = a6;
  uint64_t v39 = a4;
  uint64_t v38 = a5;
  uint64_t v26 = *(void *)(a4 - 8);
  uint64_t v27 = a4 - 8;
  unint64_t v28 = (*(void *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v29 = (char *)v17 - v28;
  uint64_t v35 = *(void *)(v9 + 16);
  uint64_t v37 = v35;
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v34 = v35 - 8;
  unint64_t v30 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v31 = (char *)v17 - v30;
  unint64_t v32 = (*(void *)(*(void *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v12 = (const void *)MEMORY[0x270FA5388](v10);
  uint64_t v36 = (char *)v17 - v32;
  _sxSgs5ErrorRd__Ri_d_0_r_0_lWOc(v12, (char *)v17 - v32, v13, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v36, 1, v35) == 1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v18, 1);
    v17[1] = v24;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v31, v36, v35);
    uint64_t v16 = v24;
    v19(v31, v29);
    v17[0] = v16;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v35);
    if (v16)
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v25, v29, v22);
    }
    else
    {
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 56))(v18, 0, 1);
      return v17[0];
    }
  }
  return result;
}

uint64_t closure #3 in UsoEntity_common_App.appIdentifier.getter(uint64_t a1)
{
  uint64_t v34 = a1;
  uint64_t v52 = 0;
  uint64_t v35 = type metadata accessor for UsoIdentifier();
  uint64_t v36 = *(void **)(v35 - 8);
  uint64_t v37 = v35 - 8;
  unint64_t v38 = (v36[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35);
  uint64_t v39 = &v10[-v38];
  unint64_t v40 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v10[-v38]);
  uint64_t v41 = &v10[-v40];
  uint64_t v52 = a1;
  uint64_t v43 = UsoIdentifier.namespace.getter();
  uint64_t v44 = v3;
  swift_bridgeObjectRetain();
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("appName", 7uLL, 1);
  uint64_t countAndFlagsBits = v4._countAndFlagsBits;
  object = v4._object;
  swift_bridgeObjectRetain();
  v49[0] = v43;
  v49[1] = v44;
  uint64_t v50 = countAndFlagsBits;
  uint64_t v51 = object;
  if (v44)
  {
    outlined init with copy of String(v49, v46);
    if (v51)
    {
      uint64_t v27 = v46[0];
      uint64_t v30 = v46[1];
      swift_bridgeObjectRetain();
      uint64_t v31 = v49;
      uint64_t v28 = v50;
      uint64_t v29 = v51;
      swift_bridgeObjectRetain();
      int v32 = static String.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      outlined destroy of String.UTF8View();
      int v33 = v32;
      goto LABEL_7;
    }
    outlined destroy of String.UTF8View();
    goto LABEL_9;
  }
  if (v51)
  {
LABEL_9:
    outlined destroy of DIIdentifier();
    int v33 = 0;
    goto LABEL_7;
  }
  outlined destroy of String.UTF8View();
  int v33 = 1;
LABEL_7:
  int v26 = v33;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = (void (*)(unsigned char *, uint64_t, uint64_t))v36[2];
  uint64_t v25 = v36 + 2;
  v24(v41, v34, v35);
  if (v26)
  {
    uint64_t v19 = UsoIdentifier.appBundleId.getter();
    uint64_t v21 = v5;
    uint64_t v20 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("com.apple.siri.sirinl", 0x15uLL, 1)._object;
    int v22 = static String.== infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v23 = v22;
  }
  else
  {
    int v23 = 0;
  }
  int v18 = v23;
  uint64_t v16 = (void (*)(unsigned char *, uint64_t))v36[1];
  uint64_t v17 = v36 + 1;
  v16(v41, v35);
  v24(v39, v34, v35);
  if (v18)
  {
    uint64_t v6 = UsoIdentifier.value.getter();
    uint64_t v13 = v48;
    v48[0] = v6;
    v48[1] = v7;
    Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(".", 1uLL, 1);
    uint64_t v12 = &v47;
    Swift::String v47 = v8;
    lazy protocol witness table accessor for type String and conformance String();
    int v14 = StringProtocol.contains<A>(_:)();
    outlined destroy of String.UTF8View();
    outlined destroy of String.UTF8View();
    int v15 = v14;
  }
  else
  {
    int v15 = 0;
  }
  int v11 = v15;
  v16(v39, v35);
  return v11 & 1;
}

uint64_t closure #1 in UsoEntity_common_PaymentAccount.accountAsINType.getter(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v6 = UsoIdentifier.namespace.getter();
  uint64_t v7 = v1;
  swift_bridgeObjectRetain();
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsAccountType", 0x13uLL, 1);
  swift_bridgeObjectRetain();
  v9[0] = v6;
  v9[1] = v7;
  Swift::String v10 = v2;
  if (!v7)
  {
    if (!v10._object)
    {
      outlined destroy of String.UTF8View();
      char v5 = 1;
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  outlined init with copy of String(v9, &v8);
  if (!v10._object)
  {
    outlined destroy of String.UTF8View();
LABEL_8:
    outlined destroy of DIIdentifier();
    char v5 = 0;
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = static String.== infix(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of String.UTF8View();
  char v5 = v4;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t implicit closure #1 in UsoEntity_common_PaymentAccount.accountAsINType.getter(char a1)
{
  return Constants.PaymentAccountType.rawValue.getter(a1);
}

uint64_t implicit closure #1 in UsoEntity_common_PaymentAccount.balanceTypeAsINType.getter(char a1)
{
  return Constants.PaymentAccountBalanceType.rawValue.getter(a1);
}

uint64_t implicit closure #2 in UsoEntity_common_CurrencyAmount.currencyIdentifier.getter()
{
  uint64_t v15 = 0;
  uint64_t v14 = type metadata accessor for Locale();
  uint64_t v11 = *(void *)(v14 - 8);
  uint64_t v12 = v14 - 8;
  unint64_t v9 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v13 = (char *)v3 - v9;
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale.Currency?);
  unint64_t v10 = (*(void *)(*(void *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v0);
  uint64_t v16 = (uint64_t)v3 - v10;
  static Locale.current.getter();
  Locale.currency.getter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v14);
  uint64_t v17 = type metadata accessor for Locale.Currency();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = v17 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 48))(v16, 1) == 1)
  {
    uint64_t v6 = 0;
    outlined destroy of Locale.Currency?(v16);
    uint64_t v7 = v6;
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v4 = MEMORY[0x2611B6CD0]();
    uint64_t v5 = v1;
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    uint64_t v7 = v4;
    uint64_t v8 = v5;
  }
  v3[1] = v20;
  v20[0] = v7;
  v20[1] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  return String.init<A>(describing:)();
}

BOOL closure #2 in UsoEntity_common_CurrencyAmount.currencyIdentifier.getter()
{
  UsoIdentifier.value.getter();
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("ambiguous", 9uLL, 1);
  BOOL v2 = String.hasPrefix(_:)(v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return !v2;
}

uint64_t sub_25DA23DF0()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in UsoEntity_common_PaymentAccount.balanceTypeAsINType.getter()
{
  return implicit closure #1 in UsoEntity_common_PaymentAccount.balanceTypeAsINType.getter(*(unsigned char *)(v0 + 16));
}

uint64_t sub_25DA23E24()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23E50()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23E7C()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23EBC()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23EFC()
{
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #1 in UsoEntity_common_PaymentAccount.accountAsINType.getter()
{
  return implicit closure #1 in UsoEntity_common_PaymentAccount.accountAsINType.getter(*(unsigned char *)(v0 + 16));
}

uint64_t sub_25DA23F30()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23F5C()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23F88()
{
  return swift_deallocObject();
}

uint64_t sub_25DA23FC8()
{
  return swift_deallocObject();
}

uint64_t sub_25DA24110()
{
  return swift_deallocObject();
}

uint64_t sub_25DA2413C()
{
  return swift_deallocObject();
}

uint64_t sub_25DA24168()
{
  return swift_deallocObject();
}

uint64_t sub_25DA241A8()
{
  return swift_deallocObject();
}

uint64_t outlined destroy of Locale.Currency?(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Locale.Currency();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_25DA24298()
{
  return swift_deallocObject();
}

uint64_t sub_25DA242C4()
{
  return swift_deallocObject();
}

uint64_t sub_25DA242F0()
{
  return swift_deallocObject();
}

uint64_t sub_25DA24330()
{
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type NSDecimalNumber and conformance NSObject()
{
  uint64_t v2 = lazy protocol witness table cache variable for type NSDecimalNumber and conformance NSObject;
  if (!lazy protocol witness table cache variable for type NSDecimalNumber and conformance NSObject)
  {
    type metadata accessor for NSDecimalNumber();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type NSDecimalNumber and conformance NSObject);
    return WitnessTable;
  }
  return v2;
}

void *_sxSgs5ErrorRd__Ri_d_0_r_0_lWOc(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v9 + 48))(a1, 1))
  {
    memcpy(a2, a1, *(void *)(*(void *)(a4 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a2, a1, a3);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, a3);
  }
  return a2;
}

uint64_t Globals.__allocating_init(contactResolver:deviceState:aceServiceInvoker:outputPublisher:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Globals.init(contactResolver:deviceState:aceServiceInvoker:outputPublisher:)(a1, a2, a3, a4);
}

uint64_t Globals.contactResolver.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of GlobalsProviding(v1 + 16, a1);
}

uint64_t Globals.deviceState.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of GlobalsProviding(v1 + 56, a1);
}

uint64_t Globals.aceServiceInvoker.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of GlobalsProviding(v1 + 96, a1);
}

uint64_t Globals.outputPublisher.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of GlobalsProviding(v1 + 136, a1);
}

uint64_t Globals.init(contactResolver:deviceState:aceServiceInvoker:outputPublisher:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = 0;
  uint64_t v19 = a1;
  uint64_t v18 = a2;
  uint64_t v17 = a3;
  uint64_t v16 = a4;
  outlined init with copy of GlobalsProviding(a1, (uint64_t)v14);
  outlined init with take of CommonLabelsProviding(v14, (void *)(v4 + 16));
  outlined init with copy of GlobalsProviding(a2, (uint64_t)v13);
  outlined init with take of CommonLabelsProviding(v13, (void *)(v4 + 56));
  outlined init with copy of GlobalsProviding(a3, (uint64_t)v12);
  outlined init with take of CommonLabelsProviding(v12, (void *)(v4 + 96));
  outlined init with copy of GlobalsProviding(a4, (uint64_t)v11);
  outlined init with take of CommonLabelsProviding(v11, (void *)(v4 + 136));
  __swift_destroy_boxed_opaque_existential_0(a4);
  __swift_destroy_boxed_opaque_existential_0(a3);
  __swift_destroy_boxed_opaque_existential_0(a2);
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v10;
}

uint64_t Globals.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  __swift_destroy_boxed_opaque_existential_0(v0 + 96);
  __swift_destroy_boxed_opaque_existential_0(v0 + 136);
  return v2;
}

uint64_t Globals.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t protocol witness for GlobalsProviding.contactResolver.getter in conformance Globals@<X0>(uint64_t a1@<X8>)
{
  return Globals.contactResolver.getter(a1);
}

uint64_t protocol witness for GlobalsProviding.deviceState.getter in conformance Globals@<X0>(uint64_t a1@<X8>)
{
  return Globals.deviceState.getter(a1);
}

uint64_t protocol witness for GlobalsProviding.aceServiceInvoker.getter in conformance Globals@<X0>(uint64_t a1@<X8>)
{
  return Globals.aceServiceInvoker.getter(a1);
}

uint64_t protocol witness for GlobalsProviding.outputPublisher.getter in conformance Globals@<X0>(uint64_t a1@<X8>)
{
  return Globals.outputPublisher.getter(a1);
}

uint64_t type metadata accessor for Globals()
{
  return self;
}

uint64_t SiriKitContactResolver.defaultConfig.unsafeMutableAddressor()
{
  if (one-time initialization token for defaultConfig != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for ContactResolverConfig();
  return __swift_project_value_buffer(v0, (uint64_t)static SiriKitContactResolver.defaultConfig);
}

uint64_t one-time initialization function for defaultConfig()
{
  uint64_t v14 = 0;
  unint64_t v4 = (*(void *)(*(void *)(type metadata accessor for ContactResolverDomain() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v18 = (char *)&v4 - v4;
  unint64_t v5 = (*(void *)(*(void *)(type metadata accessor for Locale() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v27 = (char *)&v4 - v5;
  uint64_t v17 = type metadata accessor for RecommenderType();
  uint64_t v15 = *(void *)(v17 - 8);
  uint64_t v16 = v17 - 8;
  unint64_t v6 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v4 - v6;
  unint64_t v7 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContactHandleTypePreference?)
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v20 = (char *)&v4 - v7;
  uint64_t v13 = type metadata accessor for SearchSuggestedContacts();
  uint64_t v11 = *(void *)(v13 - 8);
  uint64_t v12 = v13 - 8;
  unint64_t v8 = (*(void *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v4 - v8;
  uint64_t v10 = type metadata accessor for ContactResolverConfig();
  uint64_t v9 = static SiriKitContactResolver.defaultConfig;
  __swift_allocate_value_buffer(v10, static SiriKitContactResolver.defaultConfig);
  uint64_t v22 = __swift_project_value_buffer(v10, (uint64_t)v9);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v19, *MEMORY[0x263F6D438], v13);
  static ContactHandleTypePreference.preferPhone.getter();
  uint64_t v0 = type metadata accessor for ContactHandleTypePreference();
  (*(void (**)(char *, void, uint64_t))(*(void *)(v0 - 8) + 56))(v20, 0, 1);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v21, *MEMORY[0x263F6D3E0], v17);
  uint64_t v23 = default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  uint64_t v24 = v1;
  uint64_t v25 = default argument 2 of OSLogInterpolation.appendInterpolation(_:privacy:attributes:)();
  uint64_t v26 = v2;
  default argument 2 of ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)();
  int has_malloc_size = _swift_stdlib_has_malloc_size();
  int v29 = _swift_stdlib_has_malloc_size();
  uint64_t v30 = default argument 5 of ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)();
  default argument 6 of ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)();
  return ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)();
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  uint64_t v3 = type metadata accessor for ContactResolverConfig();
  __swift_allocate_value_buffer(v3, static ContactResolverConfig.defaultConfig);
  uint64_t v1 = __swift_project_value_buffer(v3, (uint64_t)static ContactResolverConfig.defaultConfig);
  uint64_t v2 = SiriKitContactResolver.defaultConfig.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v1, v2);
  return swift_endAccess();
}

uint64_t default argument 2 of ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)()
{
  return static Locale.current.getter();
}

uint64_t default argument 5 of ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)()
{
  return specialized static Array._allocateUninitialized(_:)(0);
}

uint64_t default argument 6 of ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)()
{
  return static ContactResolverDomain.all.getter();
}

uint64_t protocol witness for ContactResolving.resolve(queries:config:) in conformance SiriKitContactResolver()
{
  uint64_t v3 = SiriKitContactResolver.resolve(queries:config:)();
  if (v0) {
    return v2;
  }
  else {
    return v3;
  }
}

uint64_t protocol witness for ContactResolving.findMatches(queries:config:) in conformance SiriKitContactResolver()
{
  uint64_t v3 = SiriKitContactResolver.findMatches(queries:config:)();
  if (v0) {
    return v2;
  }
  else {
    return v3;
  }
}

uint64_t ContactResolverConfig.defaultConfig.unsafeMutableAddressor()
{
  if (one-time initialization token for defaultConfig != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for ContactResolverConfig();
  return __swift_project_value_buffer(v0, (uint64_t)static ContactResolverConfig.defaultConfig);
}

uint64_t specialized static Array._allocateUninitialized(_:)(uint64_t result)
{
  uint64_t v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else if (result > 0)
  {
    uint64_t v1 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v1 + 16) = v4;
    return v1;
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
    swift_retain();
    return v2;
  }
  return result;
}

id static AceViewProviding.makeSash(app:isDisambiguation:)(uint64_t a1, char a2)
{
  type metadata accessor for SAUISash();
  id v16 = SAUIAppPunchOut.__allocating_init()();
  if (a2)
  {
    if (App.isFirstParty.getter()) {
      uint64_t v14 = static AppUtil.CONTACTS_APP_BUNDLE_ID.getter();
    }
    else {
      uint64_t v14 = App.appIdentifier.getter();
    }
    if (v2)
    {
      uint64_t v12 = MEMORY[0x2611B9130](v14);
      swift_bridgeObjectRelease();
      uint64_t v13 = (void *)v12;
    }
    else
    {
      uint64_t v13 = 0;
    }
    objc_msgSend(v16, sel_setApplicationBundleIdentifier_);
  }
  else
  {
    if (App.isFirstParty.getter())
    {
      uint64_t v3 = AppUtil.MESSAGES_APP_BUNDLE_ID.unsafeMutableAddressor();
      uint64_t v8 = *(void *)v3;
      uint64_t v9 = *((void *)v3 + 1);
      swift_bridgeObjectRetain();
      uint64_t v10 = v8;
      uint64_t v11 = v9;
    }
    else
    {
      uint64_t v10 = App.appIdentifier.getter();
      uint64_t v11 = v4;
    }
    if (v11)
    {
      uint64_t v7 = MEMORY[0x2611B9130](v10);
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_setApplicationBundleIdentifier_, v7);
    }
    else
    {
      objc_msgSend(v16, sel_setApplicationBundleIdentifier_, 0);
    }
  }
  return v16;
}

unint64_t type metadata accessor for SAUISash()
{
  uint64_t v2 = lazy cache variable for type metadata for SAUISash;
  if (!lazy cache variable for type metadata for SAUISash)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for SAUISash);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t static AceViewProviding.makeAceViewsForDisambiguation(app:disambiguationList:deviceState:disambiguationSnippetProvider:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v76 = a1;
  uint64_t v75 = a2;
  id v72 = a3;
  uint64_t v73 = a4;
  uint64_t v74 = a5;
  uint64_t v86 = 0;
  id v60 = partial apply for closure #1 in osLogInternal(_:log:type:);
  uint64_t v103 = 0;
  uint64_t v102 = 0;
  uint64_t v101 = 0;
  uint64_t v99 = 0;
  uint64_t v100 = 0;
  char v96 = 0;
  id v95 = 0;
  uint64_t v94 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = type metadata accessor for ImageSize();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = v62 - 8;
  unint64_t v65 = (*(void *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  id v66 = (char *)&v23 - v65;
  uint64_t v67 = type metadata accessor for UnlockDevicePolicy();
  uint64_t v68 = *(void *)(v67 - 8);
  uint64_t v69 = v67 - 8;
  unint64_t v70 = (*(void *)(v68 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v86);
  uint64_t v71 = (char *)&v23 - v70;
  uint64_t v81 = type metadata accessor for Logger();
  uint64_t v79 = *(void *)(v81 - 8);
  uint64_t v80 = v81 - 8;
  unint64_t v77 = (*(void *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v76);
  id v6 = (char *)&v23 - v77;
  id v78 = (char *)&v23 - v77;
  uint64_t v103 = v5;
  uint64_t v102 = v7;
  uint64_t v101 = v8;
  uint64_t v99 = v9;
  uint64_t v100 = v10;
  uint64_t v11 = Logger.payments.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v6, v11, v81);
  uint64_t v88 = Logger.logObject.getter();
  int v87 = static os_log_type_t.debug.getter();
  uint64_t v84 = &v97;
  uint64_t v97 = 2;
  unint64_t v82 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  unint64_t v83 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  lazy protocol witness table accessor for type Int and conformance Int();
  UnsignedInteger<>.init<A>(_:)();
  uint32_t v85 = v98;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
  uint64_t v89 = _allocateUninitializedArray<A>(_:)();
  if (os_log_type_enabled(v88, (os_log_type_t)v87))
  {
    uint64_t v12 = v61;
    uint64_t v50 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    uint64_t v49 = 0;
    uint64_t v51 = createStorage<A>(capacity:type:)(0);
    uint64_t v52 = createStorage<A>(capacity:type:)(v49);
    uint64_t v56 = &v93;
    uint64_t v93 = v50;
    uint64_t v57 = &v92;
    uint64_t v92 = v51;
    uint64_t v54 = &v91;
    uint64_t v91 = v52;
    unsigned int v53 = 0;
    serialize(_:at:)(0, &v93);
    serialize(_:at:)(v53, v56);
    uint64_t v90 = v89;
    uint64_t v55 = &v23;
    MEMORY[0x270FA5388](&v23);
    uint64_t v13 = v57;
    uint64_t v14 = &v23 - 6;
    uint64_t v58 = &v23 - 6;
    v14[2] = (uint64_t)v56;
    v14[3] = (uint64_t)v13;
    v14[4] = v15;
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
    lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
    Sequence.forEach(_:)();
    if (v12)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_25D85A000, v88, (os_log_type_t)v87, "#AceViewProviding building disambiguation snippet", v50, v85);
      uint64_t v47 = 0;
      destroyStorage<A>(_:count:)(v51, 0, v48);
      destroyStorage<A>(_:count:)(v52, v47, MEMORY[0x263F8EE58] + 8);
      MEMORY[0x2611B9630](v50, MEMORY[0x263F8E778]);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v79 + 8))(v78, v81);
  uint64_t v41 = v72[3];
  uint64_t v42 = v72[4];
  __swift_project_boxed_opaque_existential_1(v72, v41);
  static UnlockDevicePolicy.default.getter();
  int v43 = dispatch thunk of DeviceState.isAuthenticated(for:)();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v67);
  int v44 = v43 ^ 1;
  char v96 = (v43 ^ 1) & 1;
  uint64_t v46 = v72[3];
  uint64_t v45 = v72[4];
  __swift_project_boxed_opaque_existential_1(v72, v46);
  if (dispatch thunk of DeviceState.isWatch.getter())
  {
    unint64_t v39 = type metadata accessor for SAAceView();
    uint64_t v38 = _allocateUninitializedArray<A>(_:)();
    uint64_t v37 = v16;
    uint64_t v35 = SiriKitDisambiguationList.disambiguationItems.getter();
    uint64_t v34 = v72[3];
    uint64_t v33 = v72[4];
    __swift_project_boxed_opaque_existential_1(v72, v34);
    char v17 = dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
    uint64_t v36 = (*(uint64_t (**)(uint64_t, void))(v74 + 16))(v35, v17 & 1);
    swift_bridgeObjectRelease();
    uint64_t v18 = v38;
    *uint64_t v37 = v36;
    _finalizeUninitializedArray<A>(_:)();
    return v18;
  }
  else
  {
    uint64_t v31 = SiriKitDisambiguationList.disambiguationItems.getter();
    (*(void (**)(char *, void, uint64_t))(v63 + 104))(v66, *MEMORY[0x263F6FFF8], v62);
    id v32 = (id)(*(uint64_t (**)(uint64_t, void, char *))(v74 + 8))(v31, v44 & 1, v66);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v62);
    swift_bridgeObjectRelease();
    id v95 = v32;
    swift_retain();
    if (v76)
    {
      uint64_t v30 = v76;
      uint64_t v29 = v76;
      uint64_t v94 = v76;
      id v28 = static AceViewProviding.makeSash(app:isDisambiguation:)(v76, 1);
      objc_msgSend(v32, sel_setSash_);

      swift_release();
    }
    unint64_t v25 = type metadata accessor for SAAceView();
    uint64_t v26 = _allocateUninitializedArray<A>(_:)();
    uint64_t v24 = v19;
    id v20 = v32;
    uint64_t v21 = v26;
    *uint64_t v24 = v32;
    _finalizeUninitializedArray<A>(_:)();
    uint64_t v27 = v21;

    return v27;
  }
}

id static AceViewProviding.makePersonPicker(parameterName:)()
{
  type metadata accessor for SAABPersonPicker();
  id v11 = SAUIAppPunchOut.__allocating_init()();
  id v0 = v11;
  uint64_t countAndFlagsBits = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsContactId", 0x11uLL, 1)._countAndFlagsBits;
  id v8 = (id)MEMORY[0x2611B9130](countAndFlagsBits);
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setIdNodeName_, v8);

  objc_msgSend(v11, sel_setShowImmediately_, 1);
  id v2 = v11;
  objc_msgSend(v11, sel_setCanBeRefreshed_, 0);

  id v3 = v11;
  objc_msgSend(v11, sel_setCanUseServerTTS_, 0);

  id v4 = v11;
  id v9 = (id)*MEMORY[0x263F65128];
  id v5 = (id)*MEMORY[0x263F65128];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = (id)MEMORY[0x2611B9130](v6);
  swift_bridgeObjectRelease();

  objc_msgSend(v11, sel_setItemType_, v10);
  return v11;
}

id static AceViewProviding.makePlaceHolderCardSection(commands:)(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v18 = 0;
  id v17 = 0;
  uint64_t v13 = 0;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v9 - 8);
  uint64_t v8 = v9 - 8;
  unint64_t v6 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  id v10 = (char *)&v5 - v6;
  uint64_t v18 = v1;
  type metadata accessor for SFCardSection();
  id v16 = SAUIAppPunchOut.__allocating_init()();
  id v17 = v16;
  UUID.init()();
  uint64_t v2 = UUID.uuidString.getter();
  uint64_t v11 = v3;
  id v12 = (id)MEMORY[0x2611B9130](v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v9);
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setCardSectionId_, v12);

  swift_bridgeObjectRetain();
  type metadata accessor for SFAbstractCommand();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setCommands_, isa);

  return v16;
}

id static AceViewProviding.makeTitleCardSection(title:keyPaths:commands:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v29 = a3;
  uint64_t v32 = a4;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  id v35 = 0;
  uint64_t v31 = 0;
  uint64_t v25 = type metadata accessor for UUID();
  uint64_t v23 = *(void *)(v25 - 8);
  uint64_t v24 = v25 - 8;
  unint64_t v17 = (*(void *)(v23 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v26 = (char *)&v16 - v17;
  uint64_t v38 = v4;
  uint64_t v39 = v5;
  uint64_t v37 = v6;
  uint64_t v36 = v7;
  type metadata accessor for SFTitleCardSection();
  id v34 = SAUIAppPunchOut.__allocating_init()();
  id v35 = v34;
  swift_bridgeObjectRetain();
  id v20 = (id)MEMORY[0x2611B9130](v18, v19);
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setTitle_, v20);

  Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("CardSectionTypeTitle", 0x14uLL, 1);
  object = v8._object;
  id v22 = (id)MEMORY[0x2611B9130](v8._countAndFlagsBits);
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setType_, v22);

  id v9 = v34;
  objc_msgSend(v34, sel_setSeparatorStyle_, 5);

  id v10 = v34;
  UUID.init()();
  uint64_t v11 = UUID.uuidString.getter();
  uint64_t v27 = v12;
  id v28 = (id)MEMORY[0x2611B9130](v11);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v25);
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setCardSectionId_, v28);

  id v13 = v34;
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setParameterKeyPaths_, isa);

  id v14 = v34;
  swift_bridgeObjectRetain();
  type metadata accessor for SFAbstractCommand();
  Class v33 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setCommands_, v33);

  return v34;
}

uint64_t static AceViewProviding.makePersonLabel(person:recipientIndex:deviceState:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v57 = a1;
  uint64_t v61 = a2;
  uint64_t v60 = a3;
  uint64_t v58 = partial apply for closure #1 in osLogInternal(_:log:type:);
  id v78 = 0;
  uint64_t v77 = 0;
  uint64_t v76 = 0;
  uint64_t v59 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v62 = type metadata accessor for Logger();
  uint64_t v63 = *(void *)(v62 - 8);
  uint64_t v64 = v62 - 8;
  unint64_t v65 = (*(void *)(v63 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v62);
  id v66 = (char *)&v16 - v65;
  id v78 = a1;
  uint64_t v77 = v4;
  uint64_t v76 = v5;
  if (INPerson.hasHandleValue.getter())
  {
    id v75 = objc_msgSend(v57, sel_personHandle);
    if (v75)
    {
      uint64_t v54 = &v75;
      id v55 = v75;
      id v6 = v75;
      outlined destroy of SFRichText?(v54);
      id v56 = objc_msgSend(v55, sel_value);
      if (v56)
      {
        id v53 = v56;
        id v48 = v56;
        uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v50 = v7;

        uint64_t v51 = v49;
        uint64_t v52 = v50;
      }
      else
      {
        uint64_t v51 = 0;
        uint64_t v52 = 0;
      }
      uint64_t v45 = v52;
      uint64_t v44 = v51;

      uint64_t v46 = v44;
      uint64_t v47 = v45;
    }
    else
    {
      uint64_t v38 = 0;
      outlined destroy of SFRichText?(&v75);
      uint64_t v46 = (uint64_t)v38;
      uint64_t v47 = v38;
    }
    uint64_t v42 = v47;
    uint64_t v43 = v46;
    if (v47)
    {
      uint64_t v40 = v43;
      uint64_t v41 = v42;
      uint64_t v67 = v43;
      uint64_t v68 = v42;
      v39._uint64_t countAndFlagsBits = v43;
      v39._object = v42;
    }
    else
    {
      Swift::String v8 = v66;
      uint64_t v9 = Logger.payments.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v8, v9, v62);
      uint64_t v36 = Logger.logObject.getter();
      int v35 = static os_log_type_t.error.getter();
      Class v33 = &v73;
      uint64_t v73 = 2;
      unint64_t v31 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      unint64_t v32 = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
      lazy protocol witness table accessor for type Int and conformance Int();
      UnsignedInteger<>.init<A>(_:)();
      uint32_t v34 = v74;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (_:_:_:));
      uint64_t v37 = _allocateUninitializedArray<A>(_:)();
      if (os_log_type_enabled(v36, (os_log_type_t)v35))
      {
        uint64_t v10 = v59;
        uint64_t v21 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)();
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        uint64_t v20 = 0;
        uint64_t v22 = createStorage<A>(capacity:type:)(0);
        uint64_t v23 = createStorage<A>(capacity:type:)(v20);
        uint64_t v27 = &v72;
        id v72 = v21;
        id v28 = &v71;
        uint64_t v71 = v22;
        uint64_t v25 = &v70;
        uint64_t v70 = v23;
        unsigned int v24 = 0;
        serialize(_:at:)(0, &v72);
        serialize(_:at:)(v24, v27);
        uint64_t v69 = v37;
        uint64_t v26 = &v16;
        MEMORY[0x270FA5388](&v16);
        uint64_t v11 = v28;
        uint64_t v12 = &v16 - 6;
        uint64_t v29 = &v16 - 6;
        v12[2] = v27;
        v12[3] = v11;
        v12[4] = v13;
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [(_:_:_:)]);
        lazy protocol witness table accessor for type [(_:_:_:)] and conformance [A]();
        Sequence.forEach(_:)();
        if (v10)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_25D85A000, v36, (os_log_type_t)v35, "#AceViewProviding handle value is nil when recipient is specified by handle value", v21, v34);
          uint64_t v18 = 0;
          destroyStorage<A>(_:count:)(v22, 0, v19);
          destroyStorage<A>(_:count:)(v23, v18, MEMORY[0x263F8EE58] + 8);
          MEMORY[0x2611B9630](v21, MEMORY[0x263F8E778]);
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v62);
      Swift::String v39 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0, 1);
    }
  }
  else
  {
    id v16 = objc_msgSend(v57, sel_displayName);
    v17._uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v17._object = v14;

    Swift::String v39 = v17;
  }
  return v39._countAndFlagsBits;
}

unint64_t type metadata accessor for SAABPersonPicker()
{
  uint64_t v2 = lazy cache variable for type metadata for SAABPersonPicker;
  if (!lazy cache variable for type metadata for SAABPersonPicker)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for SAABPersonPicker);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t type metadata accessor for SFTitleCardSection()
{
  uint64_t v2 = lazy cache variable for type metadata for SFTitleCardSection;
  if (!lazy cache variable for type metadata for SFTitleCardSection)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&lazy cache variable for type metadata for SFTitleCardSection);
    return ObjCClassMetadata;
  }
  return v2;
}

ValueMetadata *type metadata accessor for AceViewProviding()
{
  return &type metadata for AceViewProviding;
}

uint64_t protocol witness for PaymentConfirmationLabelProviding.confirmButtonLabel() in conformance SendPaymentCATs(uint64_t a1)
{
  uint64_t v4 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v2;
  *uint64_t v2 = *(void *)(v4 + 16);
  v2[1] = protocol witness for ContinueInAppDialogFlowStrategyAsync.makeContinueInAppResponse(intentResolutionRecord:) in conformance SearchForAccountsContinueInAppStrategy;
  return SendPaymentCATs.confirmButtonLabel()(a1);
}

uint64_t protocol witness for PaymentSlotDisplayValueProviding.slotDisplayValue(slot:) in conformance SendPaymentCATs(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = protocol witness for ContinueInAppDialogFlowStrategyAsync.makeContinueInAppResponse(intentResolutionRecord:) in conformance SearchForAccountsContinueInAppStrategy;
  return SendPaymentCATs.slotDisplayValue(slot:)(a1, a2);
}

uint64_t protocol witness for PaymentSlotDisplayValueProviding.labelForResponseSlot(slot:) in conformance SendPaymentCATs(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  *(void *)(v2 + 16) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  *uint64_t v3 = *(void *)(v5 + 16);
  v3[1] = protocol witness for ContinueInAppDialogFlowStrategyAsync.makeContinueInAppResponse(intentResolutionRecord:) in conformance SearchForAccountsContinueInAppStrategy;
  return SendPaymentCATs.labelForResponseSlot(slot:)(a1, a2);
}

uint64_t SendPaymentCATs.confirmButtonLabel(completion:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.confirmButtonLabel()(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](SendPaymentCATs.confirmButtonLabel(), 0);
}

uint64_t SendPaymentCATs.confirmButtonLabel()()
{
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmButtonLabel", 0x1EuLL, 1);
  v0[6] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v0[7] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = PaymentsUnsupportedIntentCATs.disabledSurfIntent();
  uint64_t v3 = v5[4];
  return v7(v3, v1._countAndFlagsBits, v1._object, v6);
}

{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmButtonLabel", 0x1EuLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.confirmSlotValue(slot:paymentsConcept:completion:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Class v33 = a1;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  unint64_t v28 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  int v35 = (char *)v22 - v28;
  uint64_t v43 = MEMORY[0x270FA5388](v33);
  uint64_t v42 = v5;
  uint64_t v40 = v6;
  uint64_t v41 = v7;
  uint64_t v39 = v4;
  unsigned int v34 = 1;
  Swift::String v29 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmSlotValue", 0x1CuLL, 1);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v31 = _allocateUninitializedArray<A>(_:)();
  unint64_t v32 = v8;
  Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v34 & 1);
  uint64_t v10 = v33;
  uint64_t v11 = v35;
  Swift::String *v32 = v9;
  outlined init with copy of SpeakableString?(v10, v11);
  uint64_t v36 = type metadata accessor for SpeakableString();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = v36 - 8;
  if ((*(unsigned int (**)(char *, void))(v37 + 48))(v35, v34) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v35);
    uint64_t v21 = v32;
    v32[1]._uint64_t countAndFlagsBits = 0;
    v21[1]._object = 0;
    v21[2]._uint64_t countAndFlagsBits = 0;
    v21[2]._object = 0;
  }
  else
  {
    uint64_t v12 = v32;
    v32[2]._object = (void *)v36;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v12[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v37 + 32))(boxed_opaque_existential_1, v35, v36);
  }
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  v32[3] = v14;
  swift_retain();
  if (v25)
  {
    uint64_t v24 = v25;
    uint64_t v23 = v25;
    uint64_t v15 = type metadata accessor for PaymentsDialogConcept();
    id v16 = v32;
    uint64_t v17 = v23;
    v32[5]._object = (void *)v15;
    v16[4]._uint64_t countAndFlagsBits = v17;
  }
  else
  {
    uint64_t v20 = v32;
    v32[4]._uint64_t countAndFlagsBits = 0;
    v20[4]._object = 0;
    v20[5]._uint64_t countAndFlagsBits = 0;
    v20[5]._object = 0;
  }
  uint64_t v18 = v31;
  _finalizeUninitializedArray<A>(_:)();
  v22[1] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v22[2] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.confirmSlotValue(slot:paymentsConcept:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = v3;
  v4[8] = a3;
  v4[7] = a2;
  v4[6] = a1;
  v4[2] = v4;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v4[10] = swift_task_alloc();
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return MEMORY[0x270FA2498](SendPaymentCATs.confirmSlotValue(slot:paymentsConcept:), 0);
}

uint64_t SendPaymentCATs.confirmSlotValue(slot:paymentsConcept:)()
{
  uint64_t v15 = (void *)v0[10];
  Swift::String v14 = (const void *)v0[7];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmSlotValue", 0x1CuLL, 1);
  v0[11] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  id v13 = v2;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, 1);
  outlined init with copy of SpeakableString?(v14, v15);
  uint64_t v16 = type metadata accessor for SpeakableString();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    outlined destroy of SpeakableString?(v12[10]);
    v13[1]._uint64_t countAndFlagsBits = 0;
    v13[1]._object = 0;
    v13[2]._uint64_t countAndFlagsBits = 0;
    v13[2]._object = 0;
  }
  else
  {
    uint64_t v11 = v12[10];
    v13[2]._object = (void *)v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v13[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v11, v16);
  }
  uint64_t v10 = v12[8];
  v13[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  swift_retain();
  if (v10)
  {
    uint64_t v9 = v12[8];
    v13[5]._object = (void *)type metadata accessor for PaymentsDialogConcept();
    v13[4]._uint64_t countAndFlagsBits = v9;
  }
  else
  {
    v13[4]._uint64_t countAndFlagsBits = 0;
    v13[4]._object = 0;
    v13[5]._uint64_t countAndFlagsBits = 0;
    v13[5]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = KeyValuePairs.init(dictionaryLiteral:)();
  v12[12] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v12[13] = v4;
  void *v4 = v12[2];
  v4[1] = RequestPaymentCATs.confirmSlotValue(slot:paymentsConcept:);
  uint64_t v5 = v12[6];
  return v8(v5, v1._countAndFlagsBits, v1._object, v7);
}

uint64_t SendPaymentCATs.confirmSlotValue(slot:paymentsConcept:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  Swift::String v29 = a1;
  uint64_t v23 = a2;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  unint64_t v24 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v31 = (char *)v19 - v24;
  uint64_t v37 = MEMORY[0x270FA5388](v29);
  uint64_t v36 = v4;
  uint64_t v35 = v3;
  unsigned int v30 = 1;
  Swift::String v25 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmSlotValue", 0x1CuLL, 1);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v27 = _allocateUninitializedArray<A>(_:)();
  unint64_t v28 = v5;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v30 & 1);
  uint64_t v7 = v29;
  uint64_t v8 = v31;
  *unint64_t v28 = v6;
  outlined init with copy of SpeakableString?(v7, v8);
  uint64_t v32 = type metadata accessor for SpeakableString();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = v32 - 8;
  if ((*(unsigned int (**)(char *, void))(v33 + 48))(v31, v30) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v31);
    uint64_t v18 = v28;
    v28[1]._uint64_t countAndFlagsBits = 0;
    v18[1]._object = 0;
    v18[2]._uint64_t countAndFlagsBits = 0;
    v18[2]._object = 0;
  }
  else
  {
    uint64_t v9 = v28;
    v28[2]._object = (void *)v32;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v9[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v33 + 32))(boxed_opaque_existential_1, v31, v32);
  }
  Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  v28[3] = v11;
  swift_retain();
  if (v23)
  {
    uint64_t v21 = v23;
    uint64_t v20 = v23;
    uint64_t v12 = type metadata accessor for PaymentsDialogConcept();
    id v13 = v28;
    uint64_t v14 = v20;
    v28[5]._object = (void *)v12;
    v13[4]._uint64_t countAndFlagsBits = v14;
  }
  else
  {
    uint64_t v17 = v28;
    v28[4]._uint64_t countAndFlagsBits = 0;
    v17[4]._object = 0;
    v17[5]._uint64_t countAndFlagsBits = 0;
    v17[5]._object = 0;
  }
  uint64_t v15 = v27;
  _finalizeUninitializedArray<A>(_:)();
  v19[0] = v15;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v19[1] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.confirmSnippetHeader(completion:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.confirmSnippetHeader()(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](SendPaymentCATs.confirmSnippetHeader(), 0);
}

uint64_t SendPaymentCATs.confirmSnippetHeader()()
{
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmSnippetHeader", 0x20uLL, 1);
  v0[6] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v0[7] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = PaymentsUnsupportedIntentCATs.disabledSurfIntent();
  uint64_t v3 = v5[4];
  return v7(v3, v1._countAndFlagsBits, v1._object, v6);
}

{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#ConfirmSnippetHeader", 0x20uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.disambiguateSlotValue(slot:payee:completion:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a1;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  unint64_t v28 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v35 = (char *)v22 - v28;
  uint64_t v43 = MEMORY[0x270FA5388](v33);
  uint64_t v42 = v5;
  uint64_t v40 = v6;
  uint64_t v41 = v7;
  uint64_t v39 = v4;
  unsigned int v34 = 1;
  Swift::String v29 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#DisambiguateSlotValue", 0x21uLL, 1);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v31 = _allocateUninitializedArray<A>(_:)();
  uint64_t v32 = v8;
  Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v34 & 1);
  uint64_t v10 = v33;
  Swift::String v11 = v35;
  Swift::String *v32 = v9;
  outlined init with copy of SpeakableString?(v10, v11);
  uint64_t v36 = type metadata accessor for SpeakableString();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = v36 - 8;
  if ((*(unsigned int (**)(char *, void))(v37 + 48))(v35, v34) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v35);
    uint64_t v21 = v32;
    v32[1]._uint64_t countAndFlagsBits = 0;
    v21[1]._object = 0;
    v21[2]._uint64_t countAndFlagsBits = 0;
    v21[2]._object = 0;
  }
  else
  {
    uint64_t v12 = v32;
    v32[2]._object = (void *)v36;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v12[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v37 + 32))(boxed_opaque_existential_1, v35, v36);
  }
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("payee", 5uLL, 1);
  v32[3] = v14;
  swift_retain();
  if (v25)
  {
    uint64_t v24 = v25;
    uint64_t v23 = v25;
    uint64_t v15 = type metadata accessor for DialogPerson();
    uint64_t v16 = v32;
    uint64_t v17 = v23;
    v32[5]._object = (void *)v15;
    v16[4]._uint64_t countAndFlagsBits = v17;
  }
  else
  {
    uint64_t v20 = v32;
    v32[4]._uint64_t countAndFlagsBits = 0;
    v20[4]._object = 0;
    v20[5]._uint64_t countAndFlagsBits = 0;
    v20[5]._object = 0;
  }
  uint64_t v18 = v31;
  _finalizeUninitializedArray<A>(_:)();
  v22[1] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v22[2] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.disambiguateSlotValue(slot:payee:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = v3;
  v4[8] = a3;
  v4[7] = a2;
  v4[6] = a1;
  v4[2] = v4;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v4[10] = swift_task_alloc();
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return MEMORY[0x270FA2498](SendPaymentCATs.disambiguateSlotValue(slot:payee:), 0);
}

uint64_t SendPaymentCATs.disambiguateSlotValue(slot:payee:)()
{
  uint64_t v15 = (void *)v0[10];
  Swift::String v14 = (const void *)v0[7];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#DisambiguateSlotValue", 0x21uLL, 1);
  v0[11] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  id v13 = v2;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, 1);
  outlined init with copy of SpeakableString?(v14, v15);
  uint64_t v16 = type metadata accessor for SpeakableString();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    outlined destroy of SpeakableString?(v12[10]);
    v13[1]._uint64_t countAndFlagsBits = 0;
    v13[1]._object = 0;
    v13[2]._uint64_t countAndFlagsBits = 0;
    v13[2]._object = 0;
  }
  else
  {
    uint64_t v11 = v12[10];
    v13[2]._object = (void *)v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v13[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v11, v16);
  }
  uint64_t v10 = v12[8];
  v13[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("payee", 5uLL, 1);
  swift_retain();
  if (v10)
  {
    uint64_t v9 = v12[8];
    v13[5]._object = (void *)type metadata accessor for DialogPerson();
    v13[4]._uint64_t countAndFlagsBits = v9;
  }
  else
  {
    v13[4]._uint64_t countAndFlagsBits = 0;
    v13[4]._object = 0;
    v13[5]._uint64_t countAndFlagsBits = 0;
    v13[5]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = KeyValuePairs.init(dictionaryLiteral:)();
  v12[12] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v12[13] = v4;
  void *v4 = v12[2];
  v4[1] = RequestPaymentCATs.confirmSlotValue(slot:paymentsConcept:);
  uint64_t v5 = v12[6];
  return v8(v5, v1._countAndFlagsBits, v1._object, v7);
}

uint64_t SendPaymentCATs.disambiguateSlotValue(slot:payee:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  Swift::String v29 = a1;
  uint64_t v23 = a2;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  unint64_t v24 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v31 = (char *)v19 - v24;
  uint64_t v37 = MEMORY[0x270FA5388](v29);
  uint64_t v36 = v4;
  uint64_t v35 = v3;
  unsigned int v30 = 1;
  Swift::String v25 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#DisambiguateSlotValue", 0x21uLL, 1);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v27 = _allocateUninitializedArray<A>(_:)();
  unint64_t v28 = v5;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v30 & 1);
  uint64_t v7 = v29;
  uint64_t v8 = v31;
  *unint64_t v28 = v6;
  outlined init with copy of SpeakableString?(v7, v8);
  uint64_t v32 = type metadata accessor for SpeakableString();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = v32 - 8;
  if ((*(unsigned int (**)(char *, void))(v33 + 48))(v31, v30) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v31);
    uint64_t v18 = v28;
    v28[1]._uint64_t countAndFlagsBits = 0;
    v18[1]._object = 0;
    v18[2]._uint64_t countAndFlagsBits = 0;
    v18[2]._object = 0;
  }
  else
  {
    uint64_t v9 = v28;
    v28[2]._object = (void *)v32;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v9[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v33 + 32))(boxed_opaque_existential_1, v31, v32);
  }
  Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("payee", 5uLL, 1);
  v28[3] = v11;
  swift_retain();
  if (v23)
  {
    uint64_t v21 = v23;
    uint64_t v20 = v23;
    uint64_t v12 = type metadata accessor for DialogPerson();
    id v13 = v28;
    uint64_t v14 = v20;
    v28[5]._object = (void *)v12;
    v13[4]._uint64_t countAndFlagsBits = v14;
  }
  else
  {
    uint64_t v17 = v28;
    v28[4]._uint64_t countAndFlagsBits = 0;
    v17[4]._object = 0;
    v17[5]._uint64_t countAndFlagsBits = 0;
    v17[5]._object = 0;
  }
  uint64_t v15 = v27;
  _finalizeUninitializedArray<A>(_:)();
  v19[0] = v15;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v19[1] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.handledSnippetHeader(completion:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.handledSnippetHeader()(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](SendPaymentCATs.handledSnippetHeader(), 0);
}

uint64_t SendPaymentCATs.handledSnippetHeader()()
{
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#HandledSnippetHeader", 0x20uLL, 1);
  v0[6] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v0[7] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = PaymentsUnsupportedIntentCATs.disabledSurfIntent();
  uint64_t v3 = v5[4];
  return v7(v3, v1._countAndFlagsBits, v1._object, v6);
}

{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#HandledSnippetHeader", 0x20uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.intentConfirmationPrompt(paymentsConcept:completion:)(uint64_t a1)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#IntentConfirmationPrompt", 0x24uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = v1;
  *Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  swift_retain();
  if (a1)
  {
    v3[2]._object = (void *)type metadata accessor for PaymentsDialogConcept();
    v3[1]._uint64_t countAndFlagsBits = a1;
  }
  else
  {
    v3[1]._uint64_t countAndFlagsBits = 0;
    v3[1]._object = 0;
    v3[2]._uint64_t countAndFlagsBits = 0;
    v3[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.intentConfirmationPrompt(paymentsConcept:)(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  void v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](SendPaymentCATs.intentConfirmationPrompt(paymentsConcept:), 0);
}

uint64_t SendPaymentCATs.intentConfirmationPrompt(paymentsConcept:)()
{
  uint64_t v11 = v0[6];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#IntentConfirmationPrompt", 0x24uLL, 1);
  v0[8] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v10 = v2;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  swift_retain();
  if (v11)
  {
    uint64_t v8 = v9[6];
    v10[2]._object = (void *)type metadata accessor for PaymentsDialogConcept();
    v10[1]._uint64_t countAndFlagsBits = v8;
  }
  else
  {
    v10[1]._uint64_t countAndFlagsBits = 0;
    v10[1]._object = 0;
    v10[2]._uint64_t countAndFlagsBits = 0;
    v10[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v9[9] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v3 = (void *)swift_task_alloc();
  v9[10] = v3;
  *uint64_t v3 = v9[2];
  v3[1] = RequestPaymentCATs.intentConfirmationPrompt(paymentsConcept:);
  uint64_t v4 = v9[5];
  return v7(v4, v1._countAndFlagsBits, v1._object, v6);
}

uint64_t SendPaymentCATs.intentConfirmationPrompt(paymentsConcept:)(uint64_t a1)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#IntentConfirmationPrompt", 0x24uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = v1;
  *Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  swift_retain();
  if (a1)
  {
    v3[2]._object = (void *)type metadata accessor for PaymentsDialogConcept();
    v3[1]._uint64_t countAndFlagsBits = a1;
  }
  else
  {
    v3[1]._uint64_t countAndFlagsBits = 0;
    v3[1]._object = 0;
    v3[2]._uint64_t countAndFlagsBits = 0;
    v3[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.intentHandledResponse(app:completion:)(uint64_t a1)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#IntentHandledResponse", 0x21uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = v1;
  *Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app", 3uLL, 1);
  swift_retain();
  if (a1)
  {
    v3[2]._object = (void *)type metadata accessor for SirikitApp();
    v3[1]._uint64_t countAndFlagsBits = a1;
  }
  else
  {
    v3[1]._uint64_t countAndFlagsBits = 0;
    v3[1]._object = 0;
    v3[2]._uint64_t countAndFlagsBits = 0;
    v3[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.intentHandledResponse(app:)(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  void v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](SendPaymentCATs.intentHandledResponse(app:), 0);
}

uint64_t SendPaymentCATs.intentHandledResponse(app:)()
{
  uint64_t v11 = v0[6];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#IntentHandledResponse", 0x21uLL, 1);
  v0[8] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v10 = v2;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app", 3uLL, 1);
  swift_retain();
  if (v11)
  {
    uint64_t v8 = v9[6];
    v10[2]._object = (void *)type metadata accessor for SirikitApp();
    v10[1]._uint64_t countAndFlagsBits = v8;
  }
  else
  {
    v10[1]._uint64_t countAndFlagsBits = 0;
    v10[1]._object = 0;
    v10[2]._uint64_t countAndFlagsBits = 0;
    v10[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v9[9] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v3 = (void *)swift_task_alloc();
  v9[10] = v3;
  *uint64_t v3 = v9[2];
  v3[1] = RequestPaymentCATs.intentConfirmationPrompt(paymentsConcept:);
  uint64_t v4 = v9[5];
  return v7(v4, v1._countAndFlagsBits, v1._object, v6);
}

uint64_t SendPaymentCATs.intentHandledResponse(app:)(uint64_t a1)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#IntentHandledResponse", 0x21uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = v1;
  *Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app", 3uLL, 1);
  swift_retain();
  if (a1)
  {
    v3[2]._object = (void *)type metadata accessor for SirikitApp();
    v3[1]._uint64_t countAndFlagsBits = a1;
  }
  else
  {
    v3[1]._uint64_t countAndFlagsBits = 0;
    v3[1]._object = 0;
    v3[2]._uint64_t countAndFlagsBits = 0;
    v3[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.labelForResponseSlot(slot:completion:)(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  v15[4] = a2;
  v15[5] = a3;
  uint64_t v30 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = (char *)v15 - v16;
  uint64_t v30 = MEMORY[0x270FA5388](v21);
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v27 = v3;
  unsigned int v22 = 1;
  Swift::String v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#LabelForResponseSlot", 0x20uLL, 1);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v19 = _allocateUninitializedArray<A>(_:)();
  uint64_t v20 = v6;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v22 & 1);
  uint64_t v8 = v21;
  uint64_t v9 = v23;
  *uint64_t v20 = v7;
  outlined init with copy of SpeakableString?(v8, v9);
  uint64_t v24 = type metadata accessor for SpeakableString();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  if ((*(unsigned int (**)(char *, void))(v25 + 48))(v23, v22) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v23);
    uint64_t v14 = v20;
    v20[1]._uint64_t countAndFlagsBits = 0;
    v14[1]._object = 0;
    v14[2]._uint64_t countAndFlagsBits = 0;
    v14[2]._object = 0;
  }
  else
  {
    uint64_t v10 = v20;
    v20[2]._object = (void *)v24;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v10[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 32))(boxed_opaque_existential_1, v23, v24);
  }
  uint64_t v12 = v19;
  _finalizeUninitializedArray<A>(_:)();
  v15[1] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v15[2] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.labelForResponseSlot(slot:)(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  void v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v3[8] = swift_task_alloc();
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](SendPaymentCATs.labelForResponseSlot(slot:), 0);
}

uint64_t SendPaymentCATs.labelForResponseSlot(slot:)()
{
  id v13 = (void *)v0[8];
  uint64_t v12 = (const void *)v0[6];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#LabelForResponseSlot", 0x20uLL, 1);
  v0[9] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  p_uint64_t countAndFlagsBits = &v2->_countAndFlagsBits;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, 1);
  outlined init with copy of SpeakableString?(v12, v13);
  uint64_t v14 = type metadata accessor for SpeakableString();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v15 + 48))(v13, 1) == 1)
  {
    outlined destroy of SpeakableString?(v10[8]);
    p_countAndFlagsBits[2] = 0;
    p_countAndFlagsBits[3] = 0;
    p_countAndFlagsBits[4] = 0;
    p_countAndFlagsBits[5] = 0;
  }
  else
  {
    uint64_t v9 = v10[8];
    p_countAndFlagsBits[5] = v14;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(p_countAndFlagsBits + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32))(boxed_opaque_existential_1, v9, v14);
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = KeyValuePairs.init(dictionaryLiteral:)();
  v10[10] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v10[11] = v4;
  void *v4 = v10[2];
  v4[1] = RequestPaymentCATs.disambiguateSlotValue(slot:);
  uint64_t v5 = v10[5];
  return v8(v5, v1._countAndFlagsBits, v1._object, v7);
}

uint64_t SendPaymentCATs.labelForResponseSlot(slot:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  v12[2] = a2;
  uint64_t v18 = a1;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v13 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = (char *)v12 - v13;
  uint64_t v25 = MEMORY[0x270FA5388](v18);
  uint64_t v24 = v2;
  unsigned int v19 = 1;
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#LabelForResponseSlot", 0x20uLL, 1);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v16 = _allocateUninitializedArray<A>(_:)();
  Swift::String v17 = v3;
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v19 & 1);
  uint64_t v5 = v18;
  uint64_t v6 = v20;
  *Swift::String v17 = v4;
  outlined init with copy of SpeakableString?(v5, v6);
  uint64_t v21 = type metadata accessor for SpeakableString();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v21 - 8;
  if ((*(unsigned int (**)(char *, void))(v22 + 48))(v20, v19) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v20);
    uint64_t v11 = v17;
    v17[1]._uint64_t countAndFlagsBits = 0;
    v11[1]._object = 0;
    v11[2]._uint64_t countAndFlagsBits = 0;
    v11[2]._object = 0;
  }
  else
  {
    uint64_t v7 = v17;
    v17[2]._object = (void *)v21;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v7[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 32))(boxed_opaque_existential_1, v20, v21);
  }
  uint64_t v9 = v16;
  _finalizeUninitializedArray<A>(_:)();
  v12[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v12[1] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.noResultsResponse(app:completion:)(uint64_t a1)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#NoResultsResponse", 0x1DuLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = v1;
  *Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app", 3uLL, 1);
  swift_retain();
  if (a1)
  {
    v3[2]._object = (void *)type metadata accessor for SirikitApp();
    v3[1]._uint64_t countAndFlagsBits = a1;
  }
  else
  {
    v3[1]._uint64_t countAndFlagsBits = 0;
    v3[1]._object = 0;
    v3[2]._uint64_t countAndFlagsBits = 0;
    v3[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.noResultsResponse(app:)(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  void v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](SendPaymentCATs.noResultsResponse(app:), 0);
}

uint64_t SendPaymentCATs.noResultsResponse(app:)()
{
  uint64_t v11 = v0[6];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#NoResultsResponse", 0x1DuLL, 1);
  v0[8] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v10 = v2;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app", 3uLL, 1);
  swift_retain();
  if (v11)
  {
    uint64_t v8 = v9[6];
    v10[2]._object = (void *)type metadata accessor for SirikitApp();
    v10[1]._uint64_t countAndFlagsBits = v8;
  }
  else
  {
    v10[1]._uint64_t countAndFlagsBits = 0;
    v10[1]._object = 0;
    v10[2]._uint64_t countAndFlagsBits = 0;
    v10[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v9[9] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v3 = (void *)swift_task_alloc();
  v9[10] = v3;
  *uint64_t v3 = v9[2];
  v3[1] = RequestPaymentCATs.intentConfirmationPrompt(paymentsConcept:);
  uint64_t v4 = v9[5];
  return v7(v4, v1._countAndFlagsBits, v1._object, v6);
}

uint64_t SendPaymentCATs.noResultsResponse(app:)(uint64_t a1)
{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#NoResultsResponse", 0x1DuLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  uint64_t v3 = v1;
  *Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("app", 3uLL, 1);
  swift_retain();
  if (a1)
  {
    v3[2]._object = (void *)type metadata accessor for SirikitApp();
    v3[1]._uint64_t countAndFlagsBits = a1;
  }
  else
  {
    v3[1]._uint64_t countAndFlagsBits = 0;
    v3[1]._object = 0;
    v3[2]._uint64_t countAndFlagsBits = 0;
    v3[2]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.preHandleIntentResponse(completion:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.preHandleIntentResponse()(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](SendPaymentCATs.preHandleIntentResponse(), 0);
}

uint64_t SendPaymentCATs.preHandleIntentResponse()()
{
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PreHandleIntentResponse", 0x23uLL, 1);
  v0[6] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v0[7] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = PaymentsUnsupportedIntentCATs.disabledSurfIntent();
  uint64_t v3 = v5[4];
  return v7(v3, v1._countAndFlagsBits, v1._object, v6);
}

{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PreHandleIntentResponse", 0x23uLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.promptCancelled(completion:)()
{
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.promptCancelled()(uint64_t a1)
{
  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return MEMORY[0x270FA2498](SendPaymentCATs.promptCancelled(), 0);
}

uint64_t SendPaymentCATs.promptCancelled()()
{
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PromptCancelled", 0x1BuLL, 1);
  v0[6] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v6 = KeyValuePairs.init(dictionaryLiteral:)();
  v0[7] = v6;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v2 = (void *)swift_task_alloc();
  v5[8] = v2;
  *uint64_t v2 = v5[2];
  v2[1] = PaymentsUnsupportedIntentCATs.disabledSurfIntent();
  uint64_t v3 = v5[4];
  return v7(v3, v1._countAndFlagsBits, v1._object, v6);
}

{
  String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PromptCancelled", 0x1BuLL, 1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.promptForSlotValue(slot:completion:)(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  v15[4] = a2;
  v15[5] = a3;
  uint64_t v30 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = (char *)v15 - v16;
  uint64_t v30 = MEMORY[0x270FA5388](v21);
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v27 = v3;
  unsigned int v22 = 1;
  Swift::String v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PromptForSlotValue", 0x1EuLL, 1);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v19 = _allocateUninitializedArray<A>(_:)();
  uint64_t v20 = v6;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v22 & 1);
  uint64_t v8 = v21;
  uint64_t v9 = v23;
  *uint64_t v20 = v7;
  outlined init with copy of SpeakableString?(v8, v9);
  uint64_t v24 = type metadata accessor for SpeakableString();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  if ((*(unsigned int (**)(char *, void))(v25 + 48))(v23, v22) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v23);
    Swift::String v14 = v20;
    v20[1]._uint64_t countAndFlagsBits = 0;
    v14[1]._object = 0;
    v14[2]._uint64_t countAndFlagsBits = 0;
    v14[2]._object = 0;
  }
  else
  {
    uint64_t v10 = v20;
    v20[2]._object = (void *)v24;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v10[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 32))(boxed_opaque_existential_1, v23, v24);
  }
  uint64_t v12 = v19;
  _finalizeUninitializedArray<A>(_:)();
  v15[1] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v15[2] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.promptForSlotValue(slot:)(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  void v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v3[8] = swift_task_alloc();
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](SendPaymentCATs.promptForSlotValue(slot:), 0);
}

uint64_t SendPaymentCATs.promptForSlotValue(slot:)()
{
  unint64_t v13 = (void *)v0[8];
  uint64_t v12 = (const void *)v0[6];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PromptForSlotValue", 0x1EuLL, 1);
  v0[9] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  p_uint64_t countAndFlagsBits = &v2->_countAndFlagsBits;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, 1);
  outlined init with copy of SpeakableString?(v12, v13);
  uint64_t v14 = type metadata accessor for SpeakableString();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v15 + 48))(v13, 1) == 1)
  {
    outlined destroy of SpeakableString?(v10[8]);
    p_countAndFlagsBits[2] = 0;
    p_countAndFlagsBits[3] = 0;
    p_countAndFlagsBits[4] = 0;
    p_countAndFlagsBits[5] = 0;
  }
  else
  {
    uint64_t v9 = v10[8];
    p_countAndFlagsBits[5] = v14;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(p_countAndFlagsBits + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32))(boxed_opaque_existential_1, v9, v14);
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = KeyValuePairs.init(dictionaryLiteral:)();
  v10[10] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v10[11] = v4;
  void *v4 = v10[2];
  v4[1] = RequestPaymentCATs.disambiguateSlotValue(slot:);
  uint64_t v5 = v10[5];
  return v8(v5, v1._countAndFlagsBits, v1._object, v7);
}

uint64_t SendPaymentCATs.promptForSlotValue(slot:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  v12[2] = a2;
  uint64_t v18 = a1;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v13 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = (char *)v12 - v13;
  uint64_t v25 = MEMORY[0x270FA5388](v18);
  uint64_t v24 = v2;
  unsigned int v19 = 1;
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#PromptForSlotValue", 0x1EuLL, 1);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v16 = _allocateUninitializedArray<A>(_:)();
  Swift::String v17 = v3;
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v19 & 1);
  uint64_t v5 = v18;
  uint64_t v6 = v20;
  *Swift::String v17 = v4;
  outlined init with copy of SpeakableString?(v5, v6);
  uint64_t v21 = type metadata accessor for SpeakableString();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v21 - 8;
  if ((*(unsigned int (**)(char *, void))(v22 + 48))(v20, v19) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v20);
    uint64_t v11 = v17;
    v17[1]._uint64_t countAndFlagsBits = 0;
    v11[1]._object = 0;
    v11[2]._uint64_t countAndFlagsBits = 0;
    v11[2]._object = 0;
  }
  else
  {
    uint64_t v7 = v17;
    v17[2]._object = (void *)v21;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v7[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 32))(boxed_opaque_existential_1, v20, v21);
  }
  uint64_t v9 = v16;
  _finalizeUninitializedArray<A>(_:)();
  v12[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v12[1] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.slotDisplayValue(slot:completion:)(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a1;
  v15[4] = a2;
  v15[5] = a3;
  uint64_t v30 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  unint64_t v16 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v23 = (char *)v15 - v16;
  uint64_t v30 = MEMORY[0x270FA5388](v21);
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v27 = v3;
  unsigned int v22 = 1;
  Swift::String v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#SlotDisplayValue", 0x1CuLL, 1);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v19 = _allocateUninitializedArray<A>(_:)();
  uint64_t v20 = v6;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v22 & 1);
  uint64_t v8 = v21;
  uint64_t v9 = v23;
  *uint64_t v20 = v7;
  outlined init with copy of SpeakableString?(v8, v9);
  uint64_t v24 = type metadata accessor for SpeakableString();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  if ((*(unsigned int (**)(char *, void))(v25 + 48))(v23, v22) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v23);
    Swift::String v14 = v20;
    v20[1]._uint64_t countAndFlagsBits = 0;
    v14[1]._object = 0;
    v14[2]._uint64_t countAndFlagsBits = 0;
    v14[2]._object = 0;
  }
  else
  {
    uint64_t v10 = v20;
    v20[2]._object = (void *)v24;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v10[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 32))(boxed_opaque_existential_1, v23, v24);
  }
  uint64_t v12 = v19;
  _finalizeUninitializedArray<A>(_:)();
  v15[1] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v15[2] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.slotDisplayValue(slot:)(uint64_t a1, uint64_t a2)
{
  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  void v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v3[8] = swift_task_alloc();
  v3[3] = a2;
  v3[4] = v2;
  return MEMORY[0x270FA2498](SendPaymentCATs.slotDisplayValue(slot:), 0);
}

uint64_t SendPaymentCATs.slotDisplayValue(slot:)()
{
  unint64_t v13 = (void *)v0[8];
  uint64_t v12 = (const void *)v0[6];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#SlotDisplayValue", 0x1CuLL, 1);
  v0[9] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  p_uint64_t countAndFlagsBits = &v2->_countAndFlagsBits;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, 1);
  outlined init with copy of SpeakableString?(v12, v13);
  uint64_t v14 = type metadata accessor for SpeakableString();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v15 + 48))(v13, 1) == 1)
  {
    outlined destroy of SpeakableString?(v10[8]);
    p_countAndFlagsBits[2] = 0;
    p_countAndFlagsBits[3] = 0;
    p_countAndFlagsBits[4] = 0;
    p_countAndFlagsBits[5] = 0;
  }
  else
  {
    uint64_t v9 = v10[8];
    p_countAndFlagsBits[5] = v14;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(p_countAndFlagsBits + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 32))(boxed_opaque_existential_1, v9, v14);
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = KeyValuePairs.init(dictionaryLiteral:)();
  v10[10] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v10[11] = v4;
  void *v4 = v10[2];
  v4[1] = RequestPaymentCATs.disambiguateSlotValue(slot:);
  uint64_t v5 = v10[5];
  return v8(v5, v1._countAndFlagsBits, v1._object, v7);
}

uint64_t SendPaymentCATs.slotDisplayValue(slot:)@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  v12[2] = a2;
  uint64_t v18 = a1;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  unint64_t v13 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v20 = (char *)v12 - v13;
  uint64_t v25 = MEMORY[0x270FA5388](v18);
  uint64_t v24 = v2;
  unsigned int v19 = 1;
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#SlotDisplayValue", 0x1CuLL, 1);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v16 = _allocateUninitializedArray<A>(_:)();
  Swift::String v17 = v3;
  Swift::String v4 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v19 & 1);
  uint64_t v5 = v18;
  uint64_t v6 = v20;
  *Swift::String v17 = v4;
  outlined init with copy of SpeakableString?(v5, v6);
  uint64_t v21 = type metadata accessor for SpeakableString();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = v21 - 8;
  if ((*(unsigned int (**)(char *, void))(v22 + 48))(v20, v19) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v20);
    uint64_t v11 = v17;
    v17[1]._uint64_t countAndFlagsBits = 0;
    v11[1]._object = 0;
    v11[2]._uint64_t countAndFlagsBits = 0;
    v11[2]._object = 0;
  }
  else
  {
    uint64_t v7 = v17;
    v17[2]._object = (void *)v21;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v7[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v22 + 32))(boxed_opaque_existential_1, v20, v21);
  }
  uint64_t v9 = v16;
  _finalizeUninitializedArray<A>(_:)();
  v12[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v12[1] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.unsupportedSlotValue(slot:paymentsConcept:completion:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a1;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v43 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v39 = 0;
  unint64_t v28 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v35 = (char *)v22 - v28;
  uint64_t v43 = MEMORY[0x270FA5388](v33);
  uint64_t v42 = v5;
  uint64_t v40 = v6;
  uint64_t v41 = v7;
  uint64_t v39 = v4;
  unsigned int v34 = 1;
  Swift::String v29 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#UnsupportedSlotValue", 0x20uLL, 1);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v31 = _allocateUninitializedArray<A>(_:)();
  uint64_t v32 = v8;
  Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v34 & 1);
  uint64_t v10 = v33;
  uint64_t v11 = v35;
  Swift::String *v32 = v9;
  outlined init with copy of SpeakableString?(v10, v11);
  uint64_t v36 = type metadata accessor for SpeakableString();
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = v36 - 8;
  if ((*(unsigned int (**)(char *, void))(v37 + 48))(v35, v34) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v35);
    uint64_t v21 = v32;
    v32[1]._uint64_t countAndFlagsBits = 0;
    v21[1]._object = 0;
    v21[2]._uint64_t countAndFlagsBits = 0;
    v21[2]._object = 0;
  }
  else
  {
    uint64_t v12 = v32;
    v32[2]._object = (void *)v36;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v12[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v37 + 32))(boxed_opaque_existential_1, v35, v36);
  }
  Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  v32[3] = v14;
  swift_retain();
  if (v25)
  {
    uint64_t v24 = v25;
    uint64_t v23 = v25;
    uint64_t v15 = type metadata accessor for PaymentsDialogConcept();
    uint64_t v16 = v32;
    uint64_t v17 = v23;
    v32[5]._object = (void *)v15;
    v16[4]._uint64_t countAndFlagsBits = v17;
  }
  else
  {
    uint64_t v20 = v32;
    v32[4]._uint64_t countAndFlagsBits = 0;
    v20[4]._object = 0;
    v20[5]._uint64_t countAndFlagsBits = 0;
    v20[5]._object = 0;
  }
  uint64_t v18 = v31;
  _finalizeUninitializedArray<A>(_:)();
  v22[1] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v22[2] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:completion:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SendPaymentCATs.unsupportedSlotValue(slot:paymentsConcept:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[9] = v3;
  v4[8] = a3;
  v4[7] = a2;
  v4[6] = a1;
  v4[2] = v4;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  v4[10] = swift_task_alloc();
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return MEMORY[0x270FA2498](SendPaymentCATs.unsupportedSlotValue(slot:paymentsConcept:), 0);
}

uint64_t SendPaymentCATs.unsupportedSlotValue(slot:paymentsConcept:)()
{
  uint64_t v15 = (void *)v0[10];
  Swift::String v14 = (const void *)v0[7];
  v0[2] = v0;
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#UnsupportedSlotValue", 0x20uLL, 1);
  v0[11] = v1._object;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  _allocateUninitializedArray<A>(_:)();
  unint64_t v13 = v2;
  *uint64_t v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, 1);
  outlined init with copy of SpeakableString?(v14, v15);
  uint64_t v16 = type metadata accessor for SpeakableString();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    outlined destroy of SpeakableString?(v12[10]);
    v13[1]._uint64_t countAndFlagsBits = 0;
    v13[1]._object = 0;
    v13[2]._uint64_t countAndFlagsBits = 0;
    v13[2]._object = 0;
  }
  else
  {
    uint64_t v11 = v12[10];
    v13[2]._object = (void *)v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v13[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v11, v16);
  }
  uint64_t v10 = v12[8];
  v13[3] = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  swift_retain();
  if (v10)
  {
    uint64_t v9 = v12[8];
    v13[5]._object = (void *)type metadata accessor for PaymentsDialogConcept();
    v13[4]._uint64_t countAndFlagsBits = v9;
  }
  else
  {
    v13[4]._uint64_t countAndFlagsBits = 0;
    v13[4]._object = 0;
    v13[5]._uint64_t countAndFlagsBits = 0;
    v13[5]._object = 0;
  }
  _finalizeUninitializedArray<A>(_:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v7 = KeyValuePairs.init(dictionaryLiteral:)();
  v12[12] = v7;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t))(MEMORY[0x263F6D058] + (int)*MEMORY[0x263F6D058]);
  uint64_t v4 = (void *)swift_task_alloc();
  v12[13] = v4;
  void *v4 = v12[2];
  v4[1] = RequestPaymentCATs.confirmSlotValue(slot:paymentsConcept:);
  uint64_t v5 = v12[6];
  return v8(v5, v1._countAndFlagsBits, v1._object, v7);
}

uint64_t SendPaymentCATs.unsupportedSlotValue(slot:paymentsConcept:)@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  Swift::String v29 = a1;
  uint64_t v23 = a2;
  uint64_t v37 = 0;
  uint64_t v36 = 0;
  uint64_t v35 = 0;
  unint64_t v24 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v31 = (char *)v19 - v24;
  uint64_t v37 = MEMORY[0x270FA5388](v29);
  uint64_t v36 = v4;
  uint64_t v35 = v3;
  unsigned int v30 = 1;
  Swift::String v25 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("SendPayment#UnsupportedSlotValue", 0x20uLL, 1);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any?));
  uint64_t v27 = _allocateUninitializedArray<A>(_:)();
  unint64_t v28 = v5;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("slot", 4uLL, v30 & 1);
  uint64_t v7 = v29;
  uint64_t v8 = v31;
  *unint64_t v28 = v6;
  outlined init with copy of SpeakableString?(v7, v8);
  uint64_t v32 = type metadata accessor for SpeakableString();
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = v32 - 8;
  if ((*(unsigned int (**)(char *, void))(v33 + 48))(v31, v30) == 1)
  {
    outlined destroy of SpeakableString?((uint64_t)v31);
    uint64_t v18 = v28;
    v28[1]._uint64_t countAndFlagsBits = 0;
    v18[1]._object = 0;
    v18[2]._uint64_t countAndFlagsBits = 0;
    v18[2]._object = 0;
  }
  else
  {
    uint64_t v9 = v28;
    v28[2]._object = (void *)v32;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(&v9[1]._countAndFlagsBits);
    (*(void (**)(uint64_t *, char *, uint64_t))(v33 + 32))(boxed_opaque_existential_1, v31, v32);
  }
  Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("paymentsConcept", 0xFuLL, 1);
  v28[3] = v11;
  swift_retain();
  if (v23)
  {
    uint64_t v21 = v23;
    uint64_t v20 = v23;
    uint64_t v12 = type metadata accessor for PaymentsDialogConcept();
    unint64_t v13 = v28;
    uint64_t v14 = v20;
    v28[5]._object = (void *)v12;
    v13[4]._uint64_t countAndFlagsBits = v14;
  }
  else
  {
    uint64_t v17 = v28;
    v28[4]._uint64_t countAndFlagsBits = 0;
    v17[4]._object = 0;
    v17[5]._uint64_t countAndFlagsBits = 0;
    v17[5]._object = 0;
  }
  uint64_t v15 = v27;
  _finalizeUninitializedArray<A>(_:)();
  v19[0] = v15;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  v19[1] = KeyValuePairs.init(dictionaryLiteral:)();
  dispatch thunk of CATWrapper.execute(catId:parameters:)();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SendPaymentCATs()
{
  uint64_t v1 = type metadata singleton initialization cache for SendPaymentCATs;
  if (!type metadata singleton initialization cache for SendPaymentCATs) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t type metadata completion function for SendPaymentCATs()
{
  uint64_t inited = swift_initClassMetadata2();
  if (!inited) {
    return 0;
  }
  return inited;
}

uint64_t SendPaymentCATs.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2, void *a3)
{
  return SendPaymentCATs.init(templateDir:options:globals:)(a1, a2, a3);
}

uint64_t SendPaymentCATs.init(templateDir:options:globals:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = a1;
  uint64_t v17 = a2;
  id v14 = a3;
  uint64_t v24 = 0;
  uint64_t v23 = 0;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  uint64_t v18 = type metadata accessor for CATOption();
  uint64_t v15 = *(void *)(v18 - 8);
  uint64_t v16 = v18 - 8;
  unint64_t v10 = (*(void *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v18);
  uint64_t v12 = (char *)&v9 - v10;
  unint64_t v11 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?)
                               - 8)
                   + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (const void *)MEMORY[0x270FA5388](v19);
  unint64_t v13 = (char *)&v9 - v11;
  uint64_t v23 = v4;
  uint64_t v22 = v5;
  uint64_t v21 = v6;
  uint64_t v24 = v3;
  outlined init with copy of URL?(v4, (char *)&v9 - v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v12, v17, v18);
  id v7 = v14;
  uint64_t v20 = CATWrapper.init(templateDir:options:globals:)();
  swift_retain();
  uint64_t v24 = v20;

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v18);
  outlined destroy of URL?(v19);
  swift_release();
  return v20;
}

uint64_t ObjC metadata update function for SendPaymentCATs()
{
  return type metadata accessor for SendPaymentCATs();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.__allocating_init()()
{
  return MEMORY[0x270EEDE00]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t JSONEncoder.__allocating_init()()
{
  return MEMORY[0x270EEDF10]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x270EEE188]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x270EEE920]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x270EEE930]();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return MEMORY[0x270EEE940]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x270EEE950]();
}

uint64_t PersonNameComponents.givenName.getter()
{
  return MEMORY[0x270EEF320]();
}

uint64_t PersonNameComponents.familyName.getter()
{
  return MEMORY[0x270EEF340]();
}

uint64_t PersonNameComponents.middleName.getter()
{
  return MEMORY[0x270EEF360]();
}

uint64_t PersonNameComponents.namePrefix.getter()
{
  return MEMORY[0x270EEF390]();
}

uint64_t PersonNameComponents.nameSuffix.getter()
{
  return MEMORY[0x270EEF3B8]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  id v0 = (objc_class *)MEMORY[0x270EEF3F0]();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEF410]();
}

uint64_t PersonNameComponents.nickname.getter()
{
  return MEMORY[0x270EEF420]();
}

Swift::String __swiftcall PersonNameComponents.formatted()()
{
  uint64_t v0 = MEMORY[0x270EEF440]();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x270EEF460]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

void __swiftcall pow(_:_:)(NSDecimal *__return_ptr retstr, NSDecimal *a2, Swift::Int a3)
{
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x270EF0130](options);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.init()()
{
  return MEMORY[0x270EF0288]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t Locale.Currency.identifier.getter()
{
  return MEMORY[0x270EF0FB0]();
}

uint64_t type metadata accessor for Locale.Currency()
{
  return MEMORY[0x270EF0FC8]();
}

uint64_t Locale.currency.getter()
{
  return MEMORY[0x270EF1078]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t SnippetPluginModel.snippetHidden(for:idiom:)()
{
  return MEMORY[0x270F739D8]();
}

uint64_t CodableIntent.init(wrappedValue:)()
{
  return MEMORY[0x270F74020]();
}

uint64_t type metadata accessor for CodableIntent()
{
  return MEMORY[0x270F74028]();
}

uint64_t static RFFeatureFlags.ResponseFramework.SMART.getter()
{
  return MEMORY[0x270F741D8]();
}

uint64_t CodableIntentResponse.init(wrappedValue:)()
{
  return MEMORY[0x270F74C80]();
}

uint64_t type metadata accessor for CodableIntentResponse()
{
  return MEMORY[0x270F74C88]();
}

uint64_t static CommonGuardFlowUtils.makeGuardFlow(withGuards:)()
{
  return MEMORY[0x270F66328]();
}

uint64_t HandleIntentFlowStrategyAsync.authenticationPolicy.getter()
{
  return MEMORY[0x270F66360]();
}

uint64_t SimpleOutputFlowAsync.__allocating_init(outputPublisher:outputGenerator:)()
{
  return MEMORY[0x270F663D0]();
}

uint64_t type metadata accessor for SimpleOutputFlowAsync()
{
  return MEMORY[0x270F663E0]();
}

uint64_t NeedsDisambiguationFlowStrategyAsync.paginationStyle(resolveRecord:)()
{
  return MEMORY[0x270F66618]();
}

uint64_t NeedsDisambiguationFlowStrategyAsync.authenticationPolicy.getter()
{
  return MEMORY[0x270F66620]();
}

uint64_t NeedsDisambiguationFlowStrategyAsync.pervasiveUseCaseDescription(resolveRecord:)()
{
  return MEMORY[0x270F66640]();
}

uint64_t ClientHandledRequestTCCAcceptanceFlowStrategyAsync.handoffTCCFlow(deviceState:)()
{
  return MEMORY[0x270F66820]();
}

uint64_t dispatch thunk of AnyFlow.on(input:)()
{
  return MEMORY[0x270F66878]();
}

uint64_t type metadata accessor for AnyFlow()
{
  return MEMORY[0x270F66888]();
}

uint64_t type metadata accessor for GuardFlow()
{
  return MEMORY[0x270F668B8]();
}

uint64_t static GuardFlowResult.== infix(_:_:)()
{
  return MEMORY[0x270F668C8]();
}

uint64_t static CommonFlowGuard.disallowInSharingMode.getter()
{
  return MEMORY[0x270F66980]();
}

uint64_t static CommonFlowGuard.ensuringDeviceIsAuthenticated(using:)()
{
  return MEMORY[0x270F66988]();
}

uint64_t type metadata accessor for CommonFlowGuard()
{
  return MEMORY[0x270F669B0]();
}

uint64_t static RCHChildFlowFactoryHelper.makeNeedsValueFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66A68]();
}

uint64_t static RCHChildFlowFactoryHelper.makeHandleIntentFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66A88]();
}

uint64_t static RCHChildFlowFactoryHelper.makeAppResolutionFlowProducer<A, B, C>(strategy:)()
{
  return MEMORY[0x270F66AA8]();
}

uint64_t static RCHChildFlowFactoryHelper.makeConfirmIntentFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66AB0]();
}

uint64_t static RCHChildFlowFactoryHelper.makeContinueInAppFlowWithDialogProducer<A>(strategy:)()
{
  return MEMORY[0x270F66AB8]();
}

uint64_t static RCHChildFlowFactoryHelper.makeNeedsConfirmationFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66AC8]();
}

{
  return MEMORY[0x270F66AD0]();
}

uint64_t static RCHChildFlowFactoryHelper.makeNeedsDisambiguationFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66AE0]();
}

uint64_t static RCHChildFlowFactoryHelper.makeRequestTCCAcceptanceFlow<A, B>(strategy:)()
{
  return MEMORY[0x270F66AF0]();
}

uint64_t static RCHChildFlowFactoryHelper.makeUnsupportedValueAndCancelFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66B10]();
}

uint64_t static RCHChildFlowFactoryHelper.makeUnsupportedValueAndPromptFlowProducer<A>(strategy:)()
{
  return MEMORY[0x270F66B20]();
}

uint64_t RCHChildFlowProducersAsync.needsValueFlowProducer.setter()
{
  return MEMORY[0x270F66B40]();
}

uint64_t RCHChildFlowProducersAsync.handleIntentFlowProducer.setter()
{
  return MEMORY[0x270F66B48]();
}

uint64_t RCHChildFlowProducersAsync.appResolutionFlowProducer.setter()
{
  return MEMORY[0x270F66B50]();
}

uint64_t RCHChildFlowProducersAsync.confirmIntentFlowProducer.setter()
{
  return MEMORY[0x270F66B58]();
}

uint64_t RCHChildFlowProducersAsync.continueInAppFlowProducer.setter()
{
  return MEMORY[0x270F66B60]();
}

uint64_t RCHChildFlowProducersAsync.unsupportedValueFlowProducer.setter()
{
  return MEMORY[0x270F66B68]();
}

uint64_t RCHChildFlowProducersAsync.needsConfirmationFlowProducer.setter()
{
  return MEMORY[0x270F66B70]();
}

uint64_t RCHChildFlowProducersAsync.needsDisambiguationFlowProducer.setter()
{
  return MEMORY[0x270F66B78]();
}

uint64_t RCHChildFlowProducersAsync.requestTCCAcceptanceFlowProducer.setter()
{
  return MEMORY[0x270F66B80]();
}

uint64_t RCHChildFlowProducersAsync.init()()
{
  return MEMORY[0x270F66B90]();
}

uint64_t RCHChildFlowFactory.__allocating_init(producers:)()
{
  return MEMORY[0x270F66B98]();
}

uint64_t Flow.eraseToAnyFlow()()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t Flow.deferToExecuteAsync(_:)()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t Flow.flexibleExecutionSupport.getter()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t Flow<>.exitValue.getter()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t SiriKitDisambiguationItem.__allocating_init(components:image:directInvocation:allowLineWrapForDisplayText:)()
{
  return MEMORY[0x270F66E68]();
}

uint64_t type metadata accessor for SiriKitDisambiguationItem()
{
  return MEMORY[0x270F66EB0]();
}

uint64_t SiriKitDisambiguationList.disambiguationItems.getter()
{
  return MEMORY[0x270F66EC0]();
}

uint64_t SiriKitDisambiguationList.__allocating_init(rawItems:disambiguationItems:shouldReadItemsInVox:requestUnlockForEmptyOrDuplicateItems:)()
{
  return MEMORY[0x270F66ED8]();
}

uint64_t type metadata accessor for SiriKitDisambiguationList()
{
  return MEMORY[0x270F66EF0]();
}

uint64_t static SiriKitIntentExecutionBehavior.standard()()
{
  return MEMORY[0x270F66F20]();
}

uint64_t type metadata accessor for SiriKitIntentExecutionBehavior()
{
  return MEMORY[0x270F66F28]();
}

uint64_t static SiriKitDirectInvocationPayloads.cancel.getter()
{
  return MEMORY[0x270F66F50]();
}

uint64_t static SiriKitDirectInvocationPayloads.reject.getter()
{
  return MEMORY[0x270F66F58]();
}

uint64_t static SiriKitDirectInvocationPayloads.confirm.getter()
{
  return MEMORY[0x270F66F60]();
}

uint64_t dispatch thunk of static SiriKitDisambiguationItemComponent.makeBuilder(_:)()
{
  return MEMORY[0x270F66F68]();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withPrintBlue(_:)()
{
  return MEMORY[0x270F66F78]();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.hideOnLockScreen()()
{
  return MEMORY[0x270F66F80]();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.build()()
{
  return MEMORY[0x270F66FA0]();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withPrint(_:)()
{
  return MEMORY[0x270F66FA8]();
}

uint64_t dispatch thunk of SiriKitDisambiguationItemComponent.Builder.withSpeak(_:)()
{
  return MEMORY[0x270F66FB0]();
}

uint64_t type metadata accessor for SiriKitDisambiguationItemComponent()
{
  return MEMORY[0x270F66FB8]();
}

uint64_t static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetPhone(disambiguationItems:deviceIsLocked:imageSize:)()
{
  return MEMORY[0x270F66FC8]();
}

uint64_t static SiriKitDisambiguationSnippetFactory.makeDisambiguationSnippetForWatch(disambiguationItems:textToSpeechIsEnabled:)()
{
  return MEMORY[0x270F66FE0]();
}

uint64_t type metadata accessor for SiriKitDisambiguationSnippetFactory()
{
  return MEMORY[0x270F66FE8]();
}

uint64_t static AceService.currentAsync.getter()
{
  return MEMORY[0x270F670A0]();
}

uint64_t dispatch thunk of DeviceState.siriLocale.getter()
{
  return MEMORY[0x270F671A8]();
}

uint64_t dispatch thunk of DeviceState.isAuthenticated(for:)()
{
  return MEMORY[0x270F671D8]();
}

uint64_t dispatch thunk of DeviceState.isTextToSpeechEnabled.getter()
{
  return MEMORY[0x270F671E8]();
}

uint64_t dispatch thunk of DeviceState.isPad.getter()
{
  return MEMORY[0x270F67210]();
}

uint64_t dispatch thunk of DeviceState.isPod.getter()
{
  return MEMORY[0x270F67218]();
}

uint64_t dispatch thunk of DeviceState.isPhone.getter()
{
  return MEMORY[0x270F67220]();
}

uint64_t dispatch thunk of DeviceState.isWatch.getter()
{
  return MEMORY[0x270F67228]();
}

uint64_t dispatch thunk of DeviceState.isCarPlay.getter()
{
  return MEMORY[0x270F67238]();
}

uint64_t DeviceState.asInvocationContext.getter()
{
  return MEMORY[0x270F672B0]();
}

uint64_t static DialogPhase.confirmation.getter()
{
  return MEMORY[0x270F672F8]();
}

uint64_t static DialogPhase.clarification.getter()
{
  return MEMORY[0x270F67300]();
}

uint64_t static DialogPhase.canceled.getter()
{
  return MEMORY[0x270F67330]();
}

uint64_t type metadata accessor for DialogPhase()
{
  return MEMORY[0x270F67340]();
}

uint64_t static EmptyOutput.instance.getter()
{
  return MEMORY[0x270F67368]();
}

uint64_t type metadata accessor for EmptyOutput()
{
  return MEMORY[0x270F67370]();
}

uint64_t type metadata accessor for BargeInError()
{
  return MEMORY[0x270F673B0]();
}

uint64_t type metadata accessor for ResponseType()
{
  return MEMORY[0x270F67430]();
}

uint64_t TCCResponses.init()()
{
  return MEMORY[0x270F67458]();
}

uint64_t type metadata accessor for TCCResponses()
{
  return MEMORY[0x270F67460]();
}

uint64_t static CasinoFactory.makePlaceholderCardSection()()
{
  return MEMORY[0x270F67480]();
}

uint64_t static CasinoFactory.makeReferentialAbstractCommand(originalCommand:)()
{
  return MEMORY[0x270F67488]();
}

uint64_t static ActionForInput.cancel()()
{
  return MEMORY[0x270F67500]();
}

uint64_t static ActionForInput.handle()()
{
  return MEMORY[0x270F67508]();
}

uint64_t static ActionForInput.ignore()()
{
  return MEMORY[0x270F67510]();
}

uint64_t CommandFailure.errorCode.getter()
{
  return MEMORY[0x270F67528]();
}

uint64_t type metadata accessor for CommandFailure()
{
  return MEMORY[0x270F67530]();
}

uint64_t RCHFlowFactory.makeAppResolvingRCHFlow()()
{
  return MEMORY[0x270F675F8]();
}

uint64_t RCHFlowFactory.init(strategy:childFlowFactory:)()
{
  return MEMORY[0x270F67608]();
}

uint64_t TemplatingText.init(text:speakableTextOverride:)()
{
  return MEMORY[0x270F67648]();
}

uint64_t TemplatingText.text.getter()
{
  return MEMORY[0x270F67650]();
}

uint64_t type metadata accessor for TemplatingText()
{
  return MEMORY[0x270F67658]();
}

uint64_t static AceOutputHelper.makeCompletionViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return MEMORY[0x270F67678]();
}

uint64_t static AceOutputHelper.makeCancellationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:canUseServerTTS:flowActivity:)()
{
  return MEMORY[0x270F67680]();
}

uint64_t static AceOutputHelper.makeConfirmationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return MEMORY[0x270F67688]();
}

uint64_t static AceOutputHelper.makeClarificationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return MEMORY[0x270F67690]();
}

uint64_t static AceOutputHelper.makeErrorOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)()
{
  return MEMORY[0x270F676C0]();
}

uint64_t static ExecuteResponse.ongoing<A>(next:childCompletion:)()
{
  return MEMORY[0x270F676E0]();
}

uint64_t static ExecuteResponse.complete(next:)()
{
  return MEMORY[0x270F67720]();
}

uint64_t static ExecuteResponse.complete()()
{
  return MEMORY[0x270F67730]();
}

uint64_t NLContextUpdate.rrEntities.setter()
{
  return MEMORY[0x270F67770]();
}

uint64_t NLContextUpdate.currentDomainName.setter()
{
  return MEMORY[0x270F67788]();
}

uint64_t NLContextUpdate.nluSystemDialogActs.setter()
{
  return MEMORY[0x270F67798]();
}

uint64_t NLContextUpdate.weightedPromptStrict.setter()
{
  return MEMORY[0x270F677B0]();
}

uint64_t NLContextUpdate.weightedPromptTargetDomain.setter()
{
  return MEMORY[0x270F677D8]();
}

uint64_t NLContextUpdate.conversationStateAttachments.setter()
{
  return MEMORY[0x270F677E8]();
}

uint64_t NLContextUpdate.weightedPromptResponseOptions.setter()
{
  return MEMORY[0x270F677F0]();
}

uint64_t NLContextUpdate.weightedPromptResponseTargets.setter()
{
  return MEMORY[0x270F67800]();
}

uint64_t NLContextUpdate.nlInput.setter()
{
  return MEMORY[0x270F67818]();
}

uint64_t NLContextUpdate.init()()
{
  return MEMORY[0x270F67820]();
}

uint64_t type metadata accessor for NLContextUpdate()
{
  return MEMORY[0x270F67828]();
}

uint64_t ResponseFactory.__allocating_init()()
{
  return MEMORY[0x270F67880]();
}

uint64_t type metadata accessor for ResponseFactory()
{
  return MEMORY[0x270F67890]();
}

uint64_t static SAAppInfoFactory.createAppInfo(app:)()
{
  return MEMORY[0x270F678D0]();
}

uint64_t TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)()
{
  return MEMORY[0x270F678F0]();
}

uint64_t TemplatingResult.sections.getter()
{
  return MEMORY[0x270F67928]();
}

uint64_t type metadata accessor for TemplatingResult()
{
  return MEMORY[0x270F67930]();
}

uint64_t static ProtectedAppCheck.client(for:)()
{
  return MEMORY[0x270F679E0]();
}

uint64_t type metadata accessor for ProtectedAppCheck()
{
  return MEMORY[0x270F679E8]();
}

uint64_t TemplatingSection.init(id:content:caption:spokenOnly:)()
{
  return MEMORY[0x270F67A48]();
}

uint64_t TemplatingSection.content.getter()
{
  return MEMORY[0x270F67A58]();
}

uint64_t type metadata accessor for TemplatingSection()
{
  return MEMORY[0x270F67A60]();
}

uint64_t IntentPromptAnswer.init(answeredValue:updatedIntent:)()
{
  return MEMORY[0x270F67A78]();
}

uint64_t type metadata accessor for IntentPromptAnswer()
{
  return MEMORY[0x270F67A80]();
}

uint64_t type metadata accessor for ProtectedAppStatus.AppState()
{
  return MEMORY[0x270F67A90]();
}

uint64_t ProtectedAppStatus.state.getter()
{
  return MEMORY[0x270F67AA0]();
}

uint64_t type metadata accessor for ProtectedAppStatus()
{
  return MEMORY[0x270F67AA8]();
}

uint64_t static UnlockDevicePolicy.requiringDeviceUnlock.getter()
{
  return MEMORY[0x270F67B00]();
}

uint64_t static UnlockDevicePolicy.default.getter()
{
  return MEMORY[0x270F67B08]();
}

uint64_t type metadata accessor for UnlockDevicePolicy()
{
  return MEMORY[0x270F67B18]();
}

uint64_t static AppResolutionAction.noAppFound()()
{
  return MEMORY[0x270F67B20]();
}

uint64_t static AppResolutionAction.disambiguate(apps:)()
{
  return MEMORY[0x270F67B28]();
}

uint64_t static AppResolutionAction.appNotSupported(app:)()
{
  return MEMORY[0x270F67B30]();
}

uint64_t static AppResolutionAction.screenTimeEnabled(app:)()
{
  return MEMORY[0x270F67B38]();
}

uint64_t static AppResolutionAction.select(app:)()
{
  return MEMORY[0x270F67B48]();
}

uint64_t static AppResolutionAction.confirm(app:)()
{
  return MEMORY[0x270F67B50]();
}

uint64_t type metadata accessor for AppResolutionAction()
{
  return MEMORY[0x270F67B58]();
}

uint64_t ConfirmIntentAnswer.init(confirmationResponse:intent:)()
{
  return MEMORY[0x270F67B68]();
}

uint64_t ParameterIdentifier.multicardinalIndex.getter()
{
  return MEMORY[0x270F67B90]();
}

uint64_t ParameterIdentifier.name.getter()
{
  return MEMORY[0x270F67B98]();
}

uint64_t type metadata accessor for ParameterIdentifier()
{
  return MEMORY[0x270F67BA0]();
}

uint64_t type metadata accessor for ConfirmationResponse()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t static DisambiguationResult.chosenItem(_:)()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t RCHFlowStrategyAsync.makeParameterMetadata(intent:)()
{
  return MEMORY[0x270F67C20]();
}

uint64_t static AppResolutionResponse.makeConfirmationView(confirmDialog:cancelDialog:)()
{
  return MEMORY[0x270F67C48]();
}

uint64_t static AppResolutionResponse.makeDisambiguationList(apps:inLocale:)()
{
  return MEMORY[0x270F67C50]();
}

uint64_t static AppResolutionResponse.makeDisambiguationViews(apps:utteranceViews:disambiguationList:deviceState:compact:)()
{
  return MEMORY[0x270F67C58]();
}

uint64_t type metadata accessor for BehaviorAfterSpeaking()
{
  return MEMORY[0x270F67C60]();
}

uint64_t dispatch thunk of AppInformationResolver.getLocalizedAppDisplayName(inLocale:)()
{
  return MEMORY[0x270F67CF8]();
}

uint64_t AppInformationResolver.__allocating_init(app:)()
{
  return MEMORY[0x270F67D00]();
}

uint64_t type metadata accessor for AppInformationResolver()
{
  return MEMORY[0x270F67D10]();
}

uint64_t IntentResolutionRecord.intentResponse.getter()
{
  return MEMORY[0x270F67D28]();
}

uint64_t IntentResolutionRecord.app.getter()
{
  return MEMORY[0x270F67D30]();
}

uint64_t IntentResolutionRecord.intent.getter()
{
  return MEMORY[0x270F67D40]();
}

uint64_t type metadata accessor for IntentResolutionRecord()
{
  return MEMORY[0x270F67D48]();
}

uint64_t static OutputPublisherFactory.makeOutputPublisherAsync()()
{
  return MEMORY[0x270F67D58]();
}

uint64_t PaginatedItemContainer.items.getter()
{
  return MEMORY[0x270F67D70]();
}

uint64_t static AppConfirmationResponse.cancel()()
{
  return MEMORY[0x270F67D90]();
}

uint64_t static AppConfirmationResponse.ignore()()
{
  return MEMORY[0x270F67D98]();
}

uint64_t static AppConfirmationResponse.select()()
{
  return MEMORY[0x270F67DA8]();
}

uint64_t type metadata accessor for AppConfirmationResponse()
{
  return MEMORY[0x270F67DB0]();
}

uint64_t dispatch thunk of MachineUtteranceBuilder.addMappingIfPresent(node:value:)()
{
  return MEMORY[0x270F67DC0]();
}

uint64_t dispatch thunk of MachineUtteranceBuilder.build()()
{
  return MEMORY[0x270F67DC8]();
}

uint64_t MachineUtteranceBuilder.__allocating_init()()
{
  return MEMORY[0x270F67DD0]();
}

uint64_t type metadata accessor for MachineUtteranceBuilder()
{
  return MEMORY[0x270F67DE0]();
}

uint64_t NeedsConfirmationAnswer.init(answeredValue:updatedIntent:)()
{
  return MEMORY[0x270F67DE8]();
}

uint64_t OutputGenerationManifest.init(dialogPhase:_:)()
{
  return MEMORY[0x270F67E40]();
}

uint64_t OutputGenerationManifest.responseType.setter()
{
  return MEMORY[0x270F67E68]();
}

uint64_t OutputGenerationManifest.responseViewId.setter()
{
  return MEMORY[0x270F67E80]();
}

uint64_t OutputGenerationManifest.canUseServerTTS.setter()
{
  return MEMORY[0x270F67E90]();
}

uint64_t OutputGenerationManifest.nlContextUpdate.setter()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t OutputGenerationManifest.listenAfterSpeaking.setter()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t type metadata accessor for OutputGenerationManifest()
{
  return MEMORY[0x270F67F18]();
}

uint64_t static AppDisambiguationResponse.error(_:)()
{
  return MEMORY[0x270F67F30]();
}

uint64_t static AppDisambiguationResponse.cancel()()
{
  return MEMORY[0x270F67F38]();
}

uint64_t static AppDisambiguationResponse.select(app:)()
{
  return MEMORY[0x270F67F48]();
}

uint64_t type metadata accessor for AppDisambiguationResponse()
{
  return MEMORY[0x270F67F50]();
}

uint64_t ParameterResolutionRecord.app.getter()
{
  return MEMORY[0x270F67F60]();
}

uint64_t ParameterResolutionRecord.intent.getter()
{
  return MEMORY[0x270F67F68]();
}

uint64_t ParameterResolutionRecord.result.getter()
{
  return MEMORY[0x270F67F70]();
}

uint64_t ParameterResolutionRecord.parameter.getter()
{
  return MEMORY[0x270F67F78]();
}

uint64_t type metadata accessor for ParameterResolutionRecord()
{
  return MEMORY[0x270F67F80]();
}

uint64_t BasicDisambiguationItemContainer.__allocating_init(_:_:)()
{
  return MEMORY[0x270F68158]();
}

uint64_t type metadata accessor for Image()
{
  return MEMORY[0x270F68208]();
}

uint64_t Input.parse.getter()
{
  return MEMORY[0x270F68220]();
}

uint64_t type metadata accessor for Input()
{
  return MEMORY[0x270F68230]();
}

uint64_t Parse.DirectInvocation.identifier.getter()
{
  return MEMORY[0x270F68258]();
}

uint64_t Parse.DirectInvocation.userData.getter()
{
  return MEMORY[0x270F68260]();
}

uint64_t type metadata accessor for Parse.DirectInvocation()
{
  return MEMORY[0x270F68268]();
}

uint64_t type metadata accessor for Parse()
{
  return MEMORY[0x270F682A0]();
}

uint64_t static Device.current.getter()
{
  return MEMORY[0x270F682B8]();
}

uint64_t USOParse.debugDescription.getter()
{
  return MEMORY[0x270F68368]();
}

uint64_t USOParse.userParse.getter()
{
  return MEMORY[0x270F68378]();
}

uint64_t type metadata accessor for USOParse()
{
  return MEMORY[0x270F68388]();
}

uint64_t AceOutput.init(commands:flowActivity:)()
{
  return MEMORY[0x270F683A8]();
}

uint64_t type metadata accessor for AceOutput()
{
  return MEMORY[0x270F683B8]();
}

uint64_t type metadata accessor for ImageSize()
{
  return MEMORY[0x270F683C0]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x270F28690]();
}

uint64_t dispatch thunk of FeatureFlagsKey.domain.getter()
{
  return MEMORY[0x270F28698]();
}

uint64_t dispatch thunk of FeatureFlagsKey.feature.getter()
{
  return MEMORY[0x270F286A0]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x270F6A350]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x270F6A370]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x270F6A498]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return MEMORY[0x270F6A718]();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return MEMORY[0x270F6A720]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return MEMORY[0x270F6A728]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter()
{
  return MEMORY[0x270F6A758]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x270F6A768]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x270F6A770]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasCancelled.getter()
{
  return MEMORY[0x270F6A788]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x270F6A7B0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.setter()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x270F6A860]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x270F6A868]();
}

uint64_t Siri_Nlu_External_SystemPrompted.target.setter()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t Siri_Nlu_External_SystemPrompted.init()()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemPrompted()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x270F6AAB0]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.setter()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t Siri_Nlu_External_UserStatedTask.init()()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.gaveOptions.setter()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.prompted.setter()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemDialogAct()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.choices.setter()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t Siri_Nlu_External_SystemGaveOptions.init()()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemGaveOptions()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t Siri_Nlu_External_UserWantedToProceed.reference.setter()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t Siri_Nlu_External_UserWantedToProceed.init()()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return MEMORY[0x270F6AF98]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return MEMORY[0x270F6AFB0]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return MEMORY[0x270F6AFC0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x270F6AFC8]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x270F6BB18]();
}

uint64_t static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_NoVerb.setEntity(value:)()
{
  return MEMORY[0x270F6C048]();
}

uint64_t dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)()
{
  return MEMORY[0x270F6C810]();
}

uint64_t dispatch thunk of CodeGenBase.usoIdentifiers.getter()
{
  return MEMORY[0x270F6C830]();
}

uint64_t CodeGenBase.entity.getter()
{
  return MEMORY[0x270F6C848]();
}

uint64_t UsoIdentifier.appBundleId.getter()
{
  return MEMORY[0x270F6C960]();
}

uint64_t UsoIdentifier.appBundleSemantic.getter()
{
  return MEMORY[0x270F6C988]();
}

uint64_t UsoIdentifier.init(value:appBundleId:namespace:)()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t UsoIdentifier.value.getter()
{
  return MEMORY[0x270F6C9C8]();
}

uint64_t UsoIdentifier.namespace.getter()
{
  return MEMORY[0x270F6C9D0]();
}

uint64_t type metadata accessor for UsoIdentifier()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t type metadata accessor for UsoTaskBuilder()
{
  return MEMORY[0x270F6CA30]();
}

uint64_t static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t type metadata accessor for UsoEntityBuilder()
{
  return MEMORY[0x270F6CCF8]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoAssociatedApp.getter()
{
  return MEMORY[0x270F6CD38]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)()
{
  return MEMORY[0x270F6CD60]();
}

uint64_t UsoBuilderOptions.init(longhandDefinedValues:)()
{
  return MEMORY[0x270F6CD68]();
}

uint64_t type metadata accessor for UsoBuilderOptions()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t IdentifierAppBundle.rawValue.getter()
{
  return MEMORY[0x270F6CE10]();
}

uint64_t type metadata accessor for IdentifierAppBundle()
{
  return MEMORY[0x270F6CE18]();
}

uint64_t type metadata accessor for UsoEntity_common_App()
{
  return MEMORY[0x270F6CE48]();
}

uint64_t UsoEntity_common_Agent.toContactQuery()()
{
  return MEMORY[0x270F65430]();
}

uint64_t dispatch thunk of UsoEntity_common_Number.definedValue.getter()
{
  return MEMORY[0x270F6D030]();
}

uint64_t type metadata accessor for UsoEntity_common_Number.DefinedValues()
{
  return MEMORY[0x270F6D038]();
}

uint64_t type metadata accessor for UsoEntity_common_Number()
{
  return MEMORY[0x270F6D040]();
}

uint64_t UsoEntity_common_Person.toContactQuery()()
{
  return MEMORY[0x270F65438]();
}

uint64_t type metadata accessor for UsoEntity_common_Person()
{
  return MEMORY[0x270F6D0B8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Target.target.getter()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t dispatch thunk of UsoEntity_common_Decimal.definedValue.getter()
{
  return MEMORY[0x270F6D0F8]();
}

uint64_t type metadata accessor for UsoEntity_common_Decimal.DefinedValues()
{
  return MEMORY[0x270F6D108]();
}

uint64_t dispatch thunk of UsoEntity_common_Decimal.canonicalString.getter()
{
  return MEMORY[0x270F6D110]();
}

uint64_t type metadata accessor for UsoEntity_common_Decimal()
{
  return MEMORY[0x270F6D118]();
}

uint64_t dispatch thunk of UsoEntity_common_Integer.integerValue.getter()
{
  return MEMORY[0x270F6D120]();
}

uint64_t type metadata accessor for UsoEntity_common_Integer()
{
  return MEMORY[0x270F6D128]();
}

uint64_t dispatch thunk of UsoEntity_common_Payment.memo.getter()
{
  return MEMORY[0x270F6D198]();
}

uint64_t dispatch thunk of UsoEntity_common_Payment.payee.getter()
{
  return MEMORY[0x270F6D1A0]();
}

uint64_t dispatch thunk of UsoEntity_common_Payment.payer.getter()
{
  return MEMORY[0x270F6D1A8]();
}

uint64_t dispatch thunk of UsoEntity_common_Payment.amount.getter()
{
  return MEMORY[0x270F6D1B0]();
}

uint64_t type metadata accessor for UsoEntity_common_Payment()
{
  return MEMORY[0x270F6D1B8]();
}

uint64_t static UsoTask_CodegenConverter.convert(task:)()
{
  return MEMORY[0x270F6D200]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)()
{
  return MEMORY[0x270F6D220]();
}

uint64_t dispatch thunk of UsoEntityBuilderGlobalArgs.setUsoAssociatedApp(value:)()
{
  return MEMORY[0x270F6D3D8]();
}

uint64_t static UsoEntity_CodeGenConverter.convert(entity:)()
{
  return MEMORY[0x270F6D3E8]();
}

uint64_t static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t type metadata accessor for UsoTask_pay_common_Payment()
{
  return MEMORY[0x270F6D4C8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.reference.getter()
{
  return MEMORY[0x270F6D510]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_App.name.getter()
{
  return MEMORY[0x270F6D518]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_App.setName(value:)()
{
  return MEMORY[0x270F6D520]();
}

uint64_t UsoEntityBuilder_common_App.__allocating_init()()
{
  return MEMORY[0x270F6D528]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_App()
{
  return MEMORY[0x270F6D538]();
}

uint64_t type metadata accessor for UsoTask_noVerb_uso_NoEntity()
{
  return MEMORY[0x270F6D630]();
}

uint64_t dispatch thunk of UsoEntity_common_Organization.name.getter()
{
  return MEMORY[0x270F6D9A0]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_Payment()
{
  return MEMORY[0x270F6DA60]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Number.setName(value:)()
{
  return MEMORY[0x270F6DB10]();
}

uint64_t UsoEntityBuilder_common_Number.__allocating_init()()
{
  return MEMORY[0x270F6DB18]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Number()
{
  return MEMORY[0x270F6DB28]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Person.setStructuredName(value:)()
{
  return MEMORY[0x270F6DB30]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Person.setSpecifyingContactAddress(value:)()
{
  return MEMORY[0x270F6DB50]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Person.name.getter()
{
  return MEMORY[0x270F6DB58]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Person.setName(value:)()
{
  return MEMORY[0x270F6DB60]();
}

uint64_t UsoEntityBuilder_common_Person.__allocating_init()()
{
  return MEMORY[0x270F6DB68]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Person()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t dispatch thunk of UsoEntity_common_MixedFraction.wholeValue.getter()
{
  return MEMORY[0x270F6DC38]();
}

uint64_t dispatch thunk of UsoEntity_common_MixedFraction.numeratorValue.getter()
{
  return MEMORY[0x270F6DC40]();
}

uint64_t dispatch thunk of UsoEntity_common_MixedFraction.denominatorValue.getter()
{
  return MEMORY[0x270F6DC48]();
}

uint64_t type metadata accessor for UsoEntity_common_MixedFraction()
{
  return MEMORY[0x270F6DC50]();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_Target.setTarget(value:)()
{
  return MEMORY[0x270F6DD48]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Payment.setMemo(value:)()
{
  return MEMORY[0x270F6DDD8]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Payment.setPayee(value:)()
{
  return MEMORY[0x270F6DDE0]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Payment.setPayer(value:)()
{
  return MEMORY[0x270F6DDE8]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Payment.setAmount(value:)()
{
  return MEMORY[0x270F6DDF0]();
}

uint64_t UsoEntityBuilder_common_Payment.__allocating_init()()
{
  return MEMORY[0x270F6DDF8]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Payment()
{
  return MEMORY[0x270F6DE00]();
}

uint64_t dispatch thunk of UsoEntity_common_CurrencyAmount.amount.getter()
{
  return MEMORY[0x270F6DE98]();
}

uint64_t dispatch thunk of UsoEntity_common_CurrencyAmount.currency.getter()
{
  return MEMORY[0x270F6DEA0]();
}

uint64_t dispatch thunk of UsoEntity_common_PaymentAccount.accountType.getter()
{
  return MEMORY[0x270F6DED0]();
}

uint64_t dispatch thunk of UsoEntity_common_PaymentAccount.bank.getter()
{
  return MEMORY[0x270F6DED8]();
}

uint64_t dispatch thunk of UsoEntity_common_PaymentAccount.name.getter()
{
  return MEMORY[0x270F6DEE0]();
}

uint64_t dispatch thunk of UsoEntity_common_PaymentAccount.holder.getter()
{
  return MEMORY[0x270F6DEE8]();
}

uint64_t dispatch thunk of UsoEntity_common_PaymentAccount.balance.getter()
{
  return MEMORY[0x270F6DEF0]();
}

uint64_t type metadata accessor for UsoEntity_common_PaymentAccount()
{
  return MEMORY[0x270F6DEF8]();
}

uint64_t static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)()
{
  return MEMORY[0x270F6DF80]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_Currency.setName(value:)()
{
  return MEMORY[0x270F6DF90]();
}

uint64_t UsoEntityBuilder_common_Currency.__allocating_init()()
{
  return MEMORY[0x270F6DF98]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Currency()
{
  return MEMORY[0x270F6DFA0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter()
{
  return MEMORY[0x270F6E1E8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t dispatch thunk of UsoEntity_common_MultipliedNumber.multiplier.getter()
{
  return MEMORY[0x270F6E2E0]();
}

uint64_t dispatch thunk of UsoEntity_common_MultipliedNumber.value.getter()
{
  return MEMORY[0x270F6E2E8]();
}

uint64_t type metadata accessor for UsoEntity_common_MultipliedNumber()
{
  return MEMORY[0x270F6E2F0]();
}

uint64_t UsoTaskBuilder_pay_common_Payment.__allocating_init()()
{
  return MEMORY[0x270F6E338]();
}

uint64_t type metadata accessor for UsoTaskBuilder_pay_common_Payment()
{
  return MEMORY[0x270F6E340]();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_Reference.setReference(value:)()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PersonName.setNamePrefix(value:)()
{
  return MEMORY[0x270F6E458]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PersonName.setNamePostfix(value:)()
{
  return MEMORY[0x270F6E460]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PersonName.setNickName(value:)()
{
  return MEMORY[0x270F6E468]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PersonName.setGivenName(value:)()
{
  return MEMORY[0x270F6E470]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PersonName.setFamilyName(value:)()
{
  return MEMORY[0x270F6E478]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PersonName.setMiddleName(value:)()
{
  return MEMORY[0x270F6E480]();
}

uint64_t UsoEntityBuilder_common_PersonName.__allocating_init()()
{
  return MEMORY[0x270F6E488]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_PersonName()
{
  return MEMORY[0x270F6E498]();
}

uint64_t dispatch thunk of UsoEntity_common_PaymentAccountType.name.getter()
{
  return MEMORY[0x270F6E688]();
}

uint64_t type metadata accessor for UsoTask_requestMoney_common_Payment()
{
  return MEMORY[0x270F6E748]();
}

uint64_t UsoTaskBuilder_noVerb_common_Payment.__allocating_init()()
{
  return MEMORY[0x270F6E920]();
}

uint64_t type metadata accessor for UsoTaskBuilder_noVerb_common_Payment()
{
  return MEMORY[0x270F6E928]();
}

uint64_t type metadata accessor for UsoTask_create_common_PaymentAccount()
{
  return MEMORY[0x270F6E988]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_PaymentAccount()
{
  return MEMORY[0x270F6E990]();
}

uint64_t type metadata accessor for UsoTask_request_common_PaymentAccount()
{
  return MEMORY[0x270F6EBA0]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_ContactAddress.setValue(value:)()
{
  return MEMORY[0x270F6EBF8]();
}

uint64_t UsoEntityBuilder_common_ContactAddress.__allocating_init()()
{
  return MEMORY[0x270F6EC00]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_ContactAddress()
{
  return MEMORY[0x270F6EC10]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_CurrencyAmount.setCurrency(value:)()
{
  return MEMORY[0x270F6EC18]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_CurrencyAmount.setAmount(value:)()
{
  return MEMORY[0x270F6EC20]();
}

uint64_t UsoEntityBuilder_common_CurrencyAmount.__allocating_init()()
{
  return MEMORY[0x270F6EC28]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_CurrencyAmount()
{
  return MEMORY[0x270F6EC30]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setAccountType(value:)()
{
  return MEMORY[0x270F6EC50]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setAccountNumber(value:)()
{
  return MEMORY[0x270F6EC58]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setBalance(value:)()
{
  return MEMORY[0x270F6EC60]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setNickname(value:)()
{
  return MEMORY[0x270F6EC68]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setOrganization(value:)()
{
  return MEMORY[0x270F6EC70]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccount.setHolder(value:)()
{
  return MEMORY[0x270F6EC78]();
}

uint64_t UsoEntityBuilder_common_PaymentAccount.__allocating_init()()
{
  return MEMORY[0x270F6EC80]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_PaymentAccount()
{
  return MEMORY[0x270F6EC88]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_PaymentAccount()
{
  return MEMORY[0x270F6EE10]();
}

uint64_t dispatch thunk of Uso_VerbTemplateBuilder_ReferenceSelect.setReference(value:)()
{
  return MEMORY[0x270F6EE18]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_PaymentAccountType.setName(value:)()
{
  return MEMORY[0x270F6EFA0]();
}

uint64_t UsoEntityBuilder_common_PaymentAccountType.__allocating_init()()
{
  return MEMORY[0x270F6EFA8]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_PaymentAccountType()
{
  return MEMORY[0x270F6EFB0]();
}

uint64_t UsoTaskBuilder_requestMoney_common_Payment.__allocating_init()()
{
  return MEMORY[0x270F6EFF8]();
}

uint64_t type metadata accessor for UsoTaskBuilder_requestMoney_common_Payment()
{
  return MEMORY[0x270F6F000]();
}

uint64_t UsoTaskBuilder_request_common_PaymentAccount.__allocating_init()()
{
  return MEMORY[0x270F6F0A0]();
}

uint64_t type metadata accessor for UsoTaskBuilder_request_common_PaymentAccount()
{
  return MEMORY[0x270F6F0A8]();
}

uint64_t UsoTaskBuilder_summarise_common_PaymentAccount.__allocating_init()()
{
  return MEMORY[0x270F6F100]();
}

uint64_t type metadata accessor for UsoTaskBuilder_summarise_common_PaymentAccount()
{
  return MEMORY[0x270F6F108]();
}

uint64_t UsoEntity.debugString.getter()
{
  return MEMORY[0x270F70740]();
}

uint64_t type metadata accessor for UsoEntity()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t SiriKitContactResolver.findMatches(queries:config:)()
{
  return MEMORY[0x270F654A8]();
}

uint64_t SiriKitContactResolver.resolve(queries:config:)()
{
  return MEMORY[0x270F654B8]();
}

uint64_t SiriKitContactResolver.init()()
{
  return MEMORY[0x270F654C8]();
}

uint64_t type metadata accessor for SiriKitContactResolver()
{
  return MEMORY[0x270F654D0]();
}

uint64_t ContactQuery.familyName.setter()
{
  return MEMORY[0x270F655E8]();
}

uint64_t ContactQuery.middleName.setter()
{
  return MEMORY[0x270F655F8]();
}

uint64_t ContactQuery.namePrefix.setter()
{
  return MEMORY[0x270F65608]();
}

uint64_t ContactQuery.nameSuffix.setter()
{
  return MEMORY[0x270F65618]();
}

uint64_t ContactQuery.description.getter()
{
  return MEMORY[0x270F65620]();
}

uint64_t ContactQuery.relationship.setter()
{
  return MEMORY[0x270F65628]();
}

uint64_t ContactQuery.id.setter()
{
  return MEMORY[0x270F65650]();
}

uint64_t ContactQuery.isMe.setter()
{
  return MEMORY[0x270F65660]();
}

uint64_t ContactQuery.handle.setter()
{
  return MEMORY[0x270F65668]();
}

uint64_t ContactQuery.fullName.setter()
{
  return MEMORY[0x270F65678]();
}

uint64_t ContactQuery.nickname.setter()
{
  return MEMORY[0x270F65688]();
}

uint64_t ContactQuery.givenName.setter()
{
  return MEMORY[0x270F65698]();
}

uint64_t ContactQuery.init()()
{
  return MEMORY[0x270F656A0]();
}

uint64_t type metadata accessor for ContactQuery()
{
  return MEMORY[0x270F656A8]();
}

uint64_t type metadata accessor for ContactHandle.HandleType()
{
  return MEMORY[0x270F65718]();
}

uint64_t type metadata accessor for RecommenderType()
{
  return MEMORY[0x270F65830]();
}

uint64_t ContactHandleQuery.init(type:label:value:)()
{
  return MEMORY[0x270F658A0]();
}

uint64_t type metadata accessor for ContactHandleQuery()
{
  return MEMORY[0x270F658A8]();
}

uint64_t ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:handleTypePreference:recommender:customGenerator:)()
{
  return MEMORY[0x270F658E8]();
}

uint64_t type metadata accessor for ContactResolverConfig()
{
  return MEMORY[0x270F65900]();
}

uint64_t static ContactResolverDomain.all.getter()
{
  return MEMORY[0x270F65908]();
}

uint64_t type metadata accessor for ContactResolverDomain()
{
  return MEMORY[0x270F65910]();
}

uint64_t type metadata accessor for SearchSuggestedContacts()
{
  return MEMORY[0x270F65990]();
}

uint64_t ContactRelationshipQuery.init(label:fromContact:)()
{
  return MEMORY[0x270F65998]();
}

uint64_t type metadata accessor for ContactRelationshipQuery()
{
  return MEMORY[0x270F659A0]();
}

uint64_t static ContactHandleTypePreference.preferPhone.getter()
{
  return MEMORY[0x270F65A10]();
}

uint64_t type metadata accessor for ContactHandleTypePreference()
{
  return MEMORY[0x270F65A20]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x270F728F0]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x270F72910]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x270F72918]();
}

uint64_t Transformer.init(transform:)()
{
  return MEMORY[0x270F72A20]();
}

uint64_t Transformer.transform.getter()
{
  return MEMORY[0x270F72A28]();
}

uint64_t type metadata accessor for TransformationError()
{
  return MEMORY[0x270F72C20]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.build()()
{
  return MEMORY[0x270F64A90]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)()
{
  return MEMORY[0x270F64AA0]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)()
{
  return MEMORY[0x270F64AA8]();
}

uint64_t DialogPerson.__allocating_init(namedPerson:locale:useConversationalName:)()
{
  return MEMORY[0x270F64B00]();
}

uint64_t DialogPerson.__allocating_init(person:locale:useConversationalName:)()
{
  return MEMORY[0x270F64B58]();
}

uint64_t type metadata accessor for DialogPerson()
{
  return MEMORY[0x270F64C48]();
}

uint64_t DialogCurrency.Builder.__allocating_init()()
{
  return MEMORY[0x270F64D40]();
}

uint64_t type metadata accessor for DialogCurrency.Builder()
{
  return MEMORY[0x270F64D50]();
}

uint64_t type metadata accessor for DialogCurrency()
{
  return MEMORY[0x270F64D60]();
}

uint64_t CATGlobals.__allocating_init()()
{
  return MEMORY[0x270F64E98]();
}

uint64_t type metadata accessor for CATGlobals()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t CATWrapper.init(templateDir:options:globals:)()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t dispatch thunk of CATWrapper.execute(catId:parameters:completion:)()
{
  return MEMORY[0x270F64EB0]();
}

uint64_t dispatch thunk of CATWrapper.execute(catId:parameters:)()
{
  return MEMORY[0x270F64EB8]();
}

uint64_t CATWrapper.__allocating_init(options:globals:)()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t CATWrapper.deinit()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t dispatch thunk of SirikitApp.Builder.withLocalizedAppNames(_:)()
{
  return MEMORY[0x270F64EE0]();
}

uint64_t dispatch thunk of SirikitApp.Builder.withAppId(print:speak:)()
{
  return MEMORY[0x270F64EE8]();
}

uint64_t dispatch thunk of SirikitApp.Builder.build()()
{
  return MEMORY[0x270F64EF8]();
}

uint64_t SirikitApp.Builder.__allocating_init()()
{
  return MEMORY[0x270F64F00]();
}

uint64_t type metadata accessor for SirikitApp.Builder()
{
  return MEMORY[0x270F64F10]();
}

uint64_t type metadata accessor for SirikitApp()
{
  return MEMORY[0x270F64F20]();
}

uint64_t SpeakableString.init(serializedValue:)()
{
  return MEMORY[0x270F64F90]();
}

uint64_t SpeakableString.init(print:speak:)()
{
  return MEMORY[0x270F64FA0]();
}

uint64_t SpeakableString.print.getter()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t type metadata accessor for SpeakableString()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t CATWrapperSimple.init(templateDir:options:globals:)()
{
  return MEMORY[0x270F64FC8]();
}

uint64_t CATWrapperSimple.init(useResponseMode:options:)()
{
  return MEMORY[0x270F64FD0]();
}

uint64_t CATWrapperSimple.__allocating_init(options:globals:)()
{
  return MEMORY[0x270F64FD8]();
}

uint64_t CATWrapperSimple.deinit()
{
  return MEMORY[0x270F64FE8]();
}

uint64_t dispatch thunk of SirikitLocalizedAppName.Builder.withAppName(_:)()
{
  return MEMORY[0x270F650F0]();
}

uint64_t dispatch thunk of SirikitLocalizedAppName.Builder.withLocale(_:)()
{
  return MEMORY[0x270F650F8]();
}

uint64_t dispatch thunk of SirikitLocalizedAppName.Builder.build()()
{
  return MEMORY[0x270F65100]();
}

uint64_t SirikitLocalizedAppName.Builder.__allocating_init()()
{
  return MEMORY[0x270F65108]();
}

uint64_t type metadata accessor for SirikitLocalizedAppName.Builder()
{
  return MEMORY[0x270F65118]();
}

uint64_t type metadata accessor for SirikitLocalizedAppName()
{
  return MEMORY[0x270F65120]();
}

uint64_t CATType.toDictionary.getter()
{
  return MEMORY[0x270F65130]();
}

uint64_t static CATOption.defaultMode.getter()
{
  return MEMORY[0x270F65158]();
}

uint64_t type metadata accessor for CATOption()
{
  return MEMORY[0x270F65180]();
}

uint64_t App.__allocating_init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)()
{
  return MEMORY[0x270F63AD0]();
}

uint64_t App.__allocating_init(appIdentifier:)()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t App.appIdentifier.getter()
{
  return MEMORY[0x270F63AE8]();
}

uint64_t App.pluginIdentifier.getter()
{
  return MEMORY[0x270F63AF0]();
}

uint64_t App.systemExtensionBundleId.getter()
{
  return MEMORY[0x270F63AF8]();
}

uint64_t App.systemUIExtensionBundleId.getter()
{
  return MEMORY[0x270F63B00]();
}

uint64_t type metadata accessor for App()
{
  return MEMORY[0x270F63B10]();
}

uint64_t AppDisplayInfo.init(displayName:isFirstParty:)()
{
  return MEMORY[0x270F63B18]();
}

uint64_t type metadata accessor for AppDisplayInfo()
{
  return MEMORY[0x270F63B28]();
}

uint64_t type metadata accessor for AppSelectionResponse()
{
  return MEMORY[0x270F63B78]();
}

uint64_t AppResolutionStateProvider.init(appSelectionState:)()
{
  return MEMORY[0x270F63BA0]();
}

uint64_t type metadata accessor for AppResolutionStateProvider()
{
  return MEMORY[0x270F63BA8]();
}

uint64_t AppResolutionStateProviding.previousSelectionResponse.getter()
{
  return MEMORY[0x270F63BD0]();
}

uint64_t type metadata accessor for AppResolutionResult.AppResolutionResultError()
{
  return MEMORY[0x270F63BD8]();
}

uint64_t type metadata accessor for AppResolutionResult()
{
  return MEMORY[0x270F63BE0]();
}

uint64_t dispatch thunk of AppResolutionService.resolveApp(intent:appResolutionState:_:)()
{
  return MEMORY[0x270F63BE8]();
}

uint64_t AppResolutionService.init()()
{
  return MEMORY[0x270F63BF0]();
}

uint64_t AppResolutionService.deinit()
{
  return MEMORY[0x270F63C00]();
}

uint64_t ContactResolutionCommonKeys.rawValue.getter()
{
  return MEMORY[0x270F65F10]();
}

uint64_t type metadata accessor for ContactResolutionCommonKeys()
{
  return MEMORY[0x270F65F18]();
}

uint64_t type metadata accessor for ContactResolutionResponseHandler.DirectInvocationValue()
{
  return MEMORY[0x270F65F28]();
}

uint64_t ContactResolutionResponseHandler.directInvocationValue.getter()
{
  return MEMORY[0x270F65F30]();
}

uint64_t ContactResolutionResponseHandler.init(userData:)()
{
  return MEMORY[0x270F65F38]();
}

uint64_t type metadata accessor for ContactResolutionResponseHandler()
{
  return MEMORY[0x270F65F40]();
}

uint64_t ContactResolutionSnippetGenerator.__allocating_init(appBundleId:globals:deviceState:)()
{
  return MEMORY[0x270F65FA0]();
}

uint64_t ContactResolutionSnippetGenerator.__allocating_init(appBundleId:globals:)()
{
  return MEMORY[0x270F65FB0]();
}

uint64_t type metadata accessor for ContactResolutionSnippetGenerator()
{
  return MEMORY[0x270F65FC0]();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return MEMORY[0x270F446F8]();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return MEMORY[0x270F44710]();
}

uint64_t dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)()
{
  return MEMORY[0x270F706D8]();
}

uint64_t ReferenceResolutionClient.__allocating_init()()
{
  return MEMORY[0x270F706F0]();
}

uint64_t type metadata accessor for ReferenceResolutionClient()
{
  return MEMORY[0x270F706F8]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t type metadata accessor for RRMetadata()
{
  return MEMORY[0x270F70750]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x270F70760]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x270F70768]();
}

uint64_t GroupIdentifier.init(id:seq:)()
{
  return MEMORY[0x270F70808]();
}

uint64_t type metadata accessor for GroupIdentifier()
{
  return MEMORY[0x270F70820]();
}

uint64_t type metadata accessor for RRDataSourceMetadataValue()
{
  return MEMORY[0x270F709C0]();
}

uint64_t type metadata accessor for RRQuery()
{
  return MEMORY[0x270F70A18]();
}

uint64_t RREntity.appBundleId.getter()
{
  return MEMORY[0x270F70A30]();
}

uint64_t RREntity.init(id:appBundleId:usoEntity:dataType:data:group:)()
{
  return MEMORY[0x270F70A78]();
}

uint64_t RREntity.id.getter()
{
  return MEMORY[0x270F70A80]();
}

uint64_t RREntity.metadata.getter()
{
  return MEMORY[0x270F70AA0]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t type metadata accessor for RRFilter()
{
  return MEMORY[0x270F70AC8]();
}

uint64_t type metadata accessor for RRResult()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1840]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x270F9D208]();
}

Swift::Int __swiftcall Hashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9D330](seed);
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
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

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x270F9D5F8]();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.uppercased()()
{
  uint64_t v0 = MEMORY[0x270F9D610]();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.toSpeakableString.getter()
{
  return MEMORY[0x270F65190]();
}

uint64_t String.init(stringInterpolation:)()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t static String.< infix(_:_:)()
{
  return MEMORY[0x270F9D6C8]();
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

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.isEmpty.getter()
{
  return MEMORY[0x270F9D7D0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x270F9D908]();
}

uint64_t Sequence.allSatisfy(_:)()
{
  return MEMORY[0x270F9D930]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x270F9D938]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x270F9D940]();
}

uint64_t Sequence.first(where:)()
{
  return MEMORY[0x270F9D988]();
}

uint64_t Sequence.sorted(by:)()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t Sequence.contains(where:)()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t UnsignedInteger<>.init<A>(_:)()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
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

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
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

uint64_t Array.remove(at:)()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Array.subscript.modify()
{
  return MEMORY[0x270F9DD20]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t Float.init(truncating:)()
{
  return MEMORY[0x270EF1C40]();
}

uint64_t Float._roundSlowPath(_:)()
{
  return MEMORY[0x270F9DE08]();
}

uint64_t static Float.greatestFiniteMagnitude.getter()
{
  return MEMORY[0x270F9DE20]();
}

uint64_t Float.sign.getter()
{
  return MEMORY[0x270F9DE40]();
}

uint64_t Float.init<A>(_:)()
{
  return MEMORY[0x270F9DE98]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t Set.init(arrayLiteral:)()
{
  return MEMORY[0x270F9DED0]();
}

uint64_t Set.contains(_:)()
{
  return MEMORY[0x270F9DF90]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
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

uint64_t Collection<>.popFirst()()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t Collection.firstIndex(where:)()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x270F9E140]();
}

uint64_t Collection.prefix(_:)()
{
  return MEMORY[0x270F9E168]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E178]();
}

uint64_t Collection.dropFirst(_:)()
{
  return MEMORY[0x270F9E190]();
}

uint64_t Collection<>.makeIterator()()
{
  return MEMORY[0x270F9E1C8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t static RangeReplaceableCollection.+ infix<A>(_:_:)()
{
  return MEMORY[0x270F9E278]();
}

uint64_t static SACardSnippet.makeFromCardSections(cardSections:shouldGenerateAceId:sashBundleId:referencedCommands:)()
{
  return MEMORY[0x270F68430]();
}

uint64_t static SACardSnippet.makeFromCardSectionsWithIntentData(cardSections:intent:intentResponse:shouldGenerateAceId:)()
{
  return MEMORY[0x270F68438]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t INSpeakableString.toSpeakableString.getter()
{
  return MEMORY[0x270F65198]();
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

Swift::String_optional __swiftcall AceObject.serializeToBase64()()
{
  uint64_t v0 = MEMORY[0x270F68448]();
  result.value._object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

void __swiftcall NSDecimal.init(floatLiteral:)(NSDecimal *__return_ptr retstr, Swift::Double floatLiteral)
{
}

void __swiftcall NSDecimal._bridgeToObjectiveC()(NSDecimalNumber *__return_ptr retstr)
{
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

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

Swift::String __swiftcall Substring.uppercased()()
{
  uint64_t v0 = MEMORY[0x270F9E470]();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x270EF2478]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t ArraySlice.init<A>(_:)()
{
  return MEMORY[0x270F9E718]();
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

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t KeyValuePairs.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9EAC0]();
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

uint64_t _dictionaryUpCast<A, B, C, D>(_:)()
{
  return MEMORY[0x270F9F008]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x270F9F038]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x270F9F040]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t _arrayConditionalCast<A, B>(_:)()
{
  return MEMORY[0x270F9F220]();
}

uint64_t _convertToAnyHashable<A>(_:)()
{
  return MEMORY[0x270F9F228]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x270F9F750]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F778]();
}

{
  return MEMORY[0x270F9F780]();
}

Swift::Void __swiftcall DefaultStringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270F9F790]();
}

uint64_t _allocateUninitializedArray<A>(_:)()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x270F9F940]();
}

uint64_t _convertInOutToPointerArgument<A>(_:)()
{
  return MEMORY[0x270F9FA20]();
}

uint64_t zip<A, B>(_:_:)()
{
  return MEMORY[0x270F9FAB8]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x270FA00B8]();
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

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t INIntentSlotValueTransformToContactValue()
{
  return MEMORY[0x270EF5230]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getFunctionReplacement()
{
  return MEMORY[0x270FA0378]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}