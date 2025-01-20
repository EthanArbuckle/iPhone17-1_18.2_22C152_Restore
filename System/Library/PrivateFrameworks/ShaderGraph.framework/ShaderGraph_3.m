NSObject *MetalStitchingBackend.compile(program:uniformDefinition:additionalLibraries:options:device:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  BOOL v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char *v43;
  NSObject *v44;
  os_signpost_type_t v45;
  NSObject *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  os_signpost_id_t v51;
  uint64_t v52;
  NSObject *isa;
  id v54;
  unint64_t v55;
  char *v56;
  unint64_t v57;
  NSObject *v58;
  int v59;
  void (*v60)(char *, id, uint64_t);
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void (*v65)(void, void, void);
  char *v66;
  os_signpost_id_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  Class v103;
  uint64_t v104;
  Swift::Int v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  char v109;
  void *v110;
  id v111;
  unint64_t v112;
  void *v113;
  unint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  Swift::String v119;
  Class v120;
  NSObject *v121;
  os_signpost_type_t v122;
  char v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  unint64_t v129;
  char *v130;
  NSObject *v131;
  char *v132;
  char *v133;
  uint8_t *v134;
  os_signpost_id_t v135;
  char *v136;
  NSObject *v137;
  int v138;
  char *v139;
  char *v140;
  void (*v141)(char *, char *, uint64_t);
  uint64_t v142;
  void *v143;
  char *v144;
  os_signpost_id_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  id v149;
  NSObject *v150;
  void (*v151)(char *, char *, uint64_t);
  void *v152;
  NSObject *v153;
  uint64_t v154;
  char *v155;
  os_signpost_type_t v156;
  char v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  NSObject *v163;
  char *v164;
  uint64_t v165;
  uint8_t *v166;
  os_signpost_id_t v167;
  char *v168;
  char *v169;
  NSObject *v170;
  uint64_t v171;
  void *v172;
  char *v173;
  os_signpost_id_t v174;
  void v175[2];
  void (*v176)(char *, char *, uint64_t);
  unint64_t v177;
  uint64_t v178;
  char *v179;
  char *v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  char *v185;
  char *v186;
  unint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  NSObject *v191;
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  id v195;
  char *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  char *v200;
  uint64_t v201;
  char *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;

  v197 = (void *)a6;
  v187 = a3;
  v188 = a1;
  v212 = *MEMORY[0x263EF8340];
  v183 = type metadata accessor for OSSignpostError();
  v182 = *(void *)(v183 - 8);
  v11 = MEMORY[0x270FA5388](v183);
  v179 = (char *)v175 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v180 = (char *)v175 - v13;
  v14 = type metadata accessor for OSSignpostID();
  v198 = *(void *)(v14 - 8);
  v15 = MEMORY[0x270FA5388](v14);
  v184 = (char *)v175 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x270FA5388](v15);
  v19 = (char *)v175 - v18;
  v20 = MEMORY[0x270FA5388](v17);
  v185 = (char *)v175 - v21;
  v22 = MEMORY[0x270FA5388](v20);
  v186 = (char *)v175 - v23;
  v24 = MEMORY[0x270FA5388](v22);
  v26 = (char *)v175 - v25;
  v27 = MEMORY[0x270FA5388](v24);
  v196 = (char *)v175 - v28;
  MEMORY[0x270FA5388](v27);
  v202 = (char *)v175 - v29;
  v192 = type metadata accessor for OSSignposter();
  v193 = *(void *)(v192 - 8);
  MEMORY[0x270FA5388](v192);
  v31 = (char *)v175 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v199 = a5;
  v32 = objc_msgSend(a5, sel_argumentBuffersSupport);
  v33 = 0x800000025C427A20;
  if (v32)
  {
    v34 = 0xD000000000000010;
    if ((*(unsigned char *)(a4 + OBJC_IVAR___SGREMaterialCompilationOptions_forceEnableTier1FallbackSupport) & 1) == 0)
    {
      if (one-time initialization token for tier1SupportOverrideEnabled != -1) {
        swift_once();
      }
      swift_beginAccess();
      if (static DebugConfig.tier1SupportOverrideEnabled) {
        v34 = 0xD000000000000010;
      }
      else {
        v34 = 0;
      }
      if (static DebugConfig.tier1SupportOverrideEnabled) {
        v33 = 0x800000025C427A20;
      }
      else {
        v33 = 0xE000000000000000;
      }
    }
  }
  else
  {
    v34 = 0xD000000000000010;
  }
  v191 = v34;
  v189 = a4;
  if (one-time initialization token for logger != -1) {
    swift_once();
  }
  v35 = type metadata accessor for Logger();
  __swift_project_value_buffer(v35, (uint64_t)logger);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v36 = Logger.logObject.getter();
  v37 = static os_log_type_t.info.getter();
  v38 = os_log_type_enabled(v36, v37);
  v200 = v31;
  v201 = v14;
  v203 = (void *)a7;
  v181 = v19;
  v190 = a2;
  v195 = v26;
  if (v38)
  {
    v39 = swift_slowAlloc();
    v40 = (void *)swift_slowAlloc();
    v205 = v40;
    *(_DWORD *)v39 = 136315394;
    swift_bridgeObjectRetain();
    v207 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v197, (unint64_t)v203, (uint64_t *)&v205);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 12) = 2080;
    swift_bridgeObjectRetain();
    v207 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v191, v33, (uint64_t *)&v205);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25C27E000, v36, v37, "Compiling ShaderGraph material: %s %s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    v41 = v40;
    a7 = (uint64_t)v203;
    MEMORY[0x261185880](v41, -1, -1);
    v42 = v39;
    v31 = v200;
    MEMORY[0x261185880](v42, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  OSSignposter.init(subsystem:category:)();
  OSSignposter.logHandle.getter();
  v43 = v202;
  OSSignpostID.init(log:)();
  swift_bridgeObjectRetain_n();
  v44 = OSSignposter.logHandle.getter();
  v45 = static os_signpost_type_t.event.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    v46 = v198;
    v47 = v196;
    v48 = v201;
    (*(void (**)(char *, char *, uint64_t))(v198 + 16))(v196, v43, v201);
    v49 = swift_slowAlloc();
    v50 = (void *)swift_slowAlloc();
    v205 = v50;
    *(_DWORD *)v49 = 141558275;
    v207 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v49 + 12) = 2081;
    swift_bridgeObjectRetain();
    v207 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v197, (unint64_t)v203, (uint64_t *)&v205);
    a7 = (uint64_t)v203;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    v51 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl(&dword_25C27E000, v44, v45, v51, "begin", "%{private,mask.hash}s", (uint8_t *)v49, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261185880](v50, -1, -1);
    v52 = v49;
    v31 = v200;
    MEMORY[0x261185880](v52, -1, -1);

    v44 = v46 + 1;
    isa = v46[1].isa;
    ((void (*)(char *, uint64_t))isa)(v202, v48);
    ((void (*)(char *, uint64_t))isa)(v47, v48);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v46 = v198;
    isa = *(NSObject **)(v198 + 8);
    ((void (*)(char *, uint64_t))isa)(v43, v201);
  }
  v54 = v195;
  v55 = v194;
  v56 = (char *)specialized MetalStitchingBackend.builtinLibrary(for:)(v199);
  v57 = v55;
  if (v55)
  {
    (*(void (**)(char *, uint64_t))(v193 + 8))(v31, v192);
    return v44;
  }
  v191 = isa;
  v202 = v56;
  OSSignposter.logHandle.getter();
  OSSignpostID.init(log:)();
  swift_bridgeObjectRetain_n();
  v58 = OSSignposter.logHandle.getter();
  v59 = static os_signpost_type_t.begin.getter();
  if (OS_os_log.signpostsEnabled.getter())
  {
    v177 = 0;
    v61 = v46 + 2;
    v60 = (void (*)(char *, id, uint64_t))v46[2].isa;
    v194 = (unint64_t)v61 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    LODWORD(v178) = v59;
    v62 = v201;
    v60(v196, v54, v201);
    v63 = swift_slowAlloc();
    v64 = (void *)swift_slowAlloc();
    v205 = v64;
    *(_DWORD *)v63 = 141558275;
    v207 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v63 + 12) = 2081;
    swift_bridgeObjectRetain();
    v207 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v197, (unint64_t)v203, (uint64_t *)&v205);
    v65 = (void (*)(void, void, void))v60;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    v66 = v196;
    v67 = OSSignpostID.rawValue.getter();
    v68 = v62;
    _os_signpost_emit_with_name_impl(&dword_25C27E000, v58, (os_signpost_type_t)v178, v67, "stitchingGraph", "%{private,mask.hash}s", (uint8_t *)v63, 0x16u);
    swift_arrayDestroy();
    v69 = v64;
    a7 = (uint64_t)v203;
    MEMORY[0x261185880](v69, -1, -1);
    v70 = v63;
    v31 = v200;
    MEMORY[0x261185880](v70, -1, -1);

    v71 = v66;
    v57 = v177;
    v44 = v191;
    ((void (*)(char *, uint64_t))v191)(v66, v68);
    v72 = v194;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v65 = (void (*)(void, void, void))v46[2].isa;
    v72 = (unint64_t)&v46[2] & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v68 = v201;
    v71 = v196;
    v44 = v191;
  }
  v176 = (void (*)(char *, char *, uint64_t))v65;
  v194 = v72;
  v65(v71, v54, v68);
  v175[1] = type metadata accessor for OSSignpostIntervalState();
  swift_allocObject();
  v178 = OSSignpostIntervalState.init(id:isOpen:)();
  v198 += 8;
  ((void (*)(id, uint64_t))v44)(v54, v68);
  v73 = (void *)MEMORY[0x263F8EE78];
  v209 = specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(MEMORY[0x263F8EE78]);
  v210 = v74;
  v211 = v75;
  v76 = objc_msgSend(v199, sel_argumentBuffersSupport);
  v77 = v202;
  if (!v76 || (*(unsigned char *)(v189 + OBJC_IVAR___SGREMaterialCompilationOptions_forceEnableTier1FallbackSupport) & 1) != 0) {
    goto LABEL_30;
  }
  if (one-time initialization token for tier1SupportOverrideEnabled != -1) {
    swift_once();
  }
  v44 = &static DebugConfig.tier1SupportOverrideEnabled;
  swift_beginAccess();
  if (static DebugConfig.tier1SupportOverrideEnabled == 1)
  {
LABEL_30:
    specialized MetalStitchingBackend.generateFallbackTier1Getters(for:augmenting:library:)(v190, (uint64_t)&v209, v77);
    if (!v57) {
      goto LABEL_31;
    }
LABEL_41:
    (*(void (**)(char *, uint64_t))(v193 + 8))(v31, v192);
    swift_release();
    swift_unknownObjectRelease();
    goto LABEL_42;
  }
  specialized MetalStitchingBackend.generateStructGetters(for:augmenting:library:)(v190, &v209, v77);
  if (v57) {
    goto LABEL_41;
  }
LABEL_31:
  v78 = v188;
  v195 = (id)MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(v188, (unint64_t)&v209, v77, v187, (uint64_t)v197, a7);
  v177 = 0;
  v79 = (*(uint64_t (**)(void))(*(void *)v78 + 120))();
  v204 = (uint64_t)v73;
  v80 = *(void *)(v79 + 16);
  if (v80)
  {
    v81 = v79 + 32;
    do
    {
      outlined init with copy of MetalFunctionNode(v81, (uint64_t)&v205);
      outlined init with copy of MetalFunctionNode((uint64_t)&v205, (uint64_t)&v207);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      type metadata accessor for MetalFunctionCallNode();
      if ((swift_dynamicCast() & 1) == 0) {
        v208 = 0;
      }
      v82 = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v205);
      if (v208)
      {
        MEMORY[0x261184120](v82);
        if (*(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v204 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v81 += 40;
      --v80;
    }
    while (v80);
    v84 = v204;
  }
  else
  {
    v84 = (unint64_t)v73;
  }
  swift_bridgeObjectRelease();
  if (v84 >> 62)
  {
    swift_bridgeObjectRetain();
    v85 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v85) {
      goto LABEL_48;
    }
LABEL_58:
    swift_bridgeObjectRelease();
    v87 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_59;
  }
  v85 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v85) {
    goto LABEL_58;
  }
LABEL_48:
  v205 = v73;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v85 & ~(v85 >> 63), 0);
  if (v85 < 0)
  {
    __break(1u);
LABEL_97:
    swift_once();
    goto LABEL_65;
  }
  v86 = 0;
  v87 = v205;
  do
  {
    if ((v84 & 0xC000000000000001) != 0)
    {
      v88 = MEMORY[0x2611848A0](v86, v84);
    }
    else
    {
      v88 = *(void *)(v84 + 8 * v86 + 32);
      swift_retain();
    }
    v90 = *(void *)(v88 + 56);
    v89 = *(void *)(v88 + 64);
    swift_bridgeObjectRetain();
    swift_release();
    v205 = v87;
    v92 = v87[2];
    v91 = v87[3];
    if (v92 >= v91 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v91 > 1, v92 + 1, 1);
      v87 = v205;
    }
    ++v86;
    v87[2] = v92 + 1;
    v93 = &v87[2 * v92];
    v93[4] = v90;
    v93[5] = v89;
  }
  while (v85 != v86);
  swift_bridgeObjectRelease();
LABEL_59:
  v94 = v209;
  v95 = v210;
  v96 = v211;
  swift_retain();
  swift_retain();
  v97 = specialized Set.init<A>(_:)(v94, v95);
  v98 = (void *)specialized Set.init<A>(_:)((uint64_t)v87);
  swift_bridgeObjectRelease();
  if (*(void *)(v97 + 16) <= v98[2] >> 3)
  {
    v205 = v98;
    specialized Set._subtract<A>(_:)(v97);
    swift_bridgeObjectRelease();
    v99 = v205;
  }
  else
  {
    v99 = (void *)specialized _NativeSet.subtracting<A>(_:)(v97, (uint64_t)v98);
    swift_bridgeObjectRelease();
  }
  if (v99[2])
  {
    swift_bridgeObjectRelease();
    v205 = v99;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<String>);
    lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type Set<String> and conformance Set<A>, &demangling cache variable for type metadata for Set<String>);
    lazy protocol witness table accessor for type String and conformance String();
    v44 = Sequence<>.joined(separator:)();
    v101 = v100;
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
    swift_allocError();
    *(void *)v102 = v44;
    *(void *)(v102 + 8) = v101;
    *(unsigned char *)(v102 + 16) = 2;
    swift_willThrow();
    swift_release();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v193 + 8))(v200, v192);
    goto LABEL_42;
  }
  swift_bridgeObjectRelease();
  v71 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F12A30]), sel_init);
  swift_retain();
  swift_retain();
  swift_retain();
  specialized _copyCollectionToContiguousArray<A>(_:)(v94, v95, v96);
  swift_release();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for MTLFunction);
  v103 = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  objc_msgSend(v71, sel_setFunctions_, v103);

  if (one-time initialization token for debugMode != -1) {
    goto LABEL_97;
  }
LABEL_65:
  swift_beginAccess();
  v104 = static DebugConfig.debugMode;
  if (!*(void *)(static DebugConfig.debugMode + 16))
  {
LABEL_73:
    v110 = v197;
    goto LABEL_76;
  }
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  v105 = Hasher._finalize()();
  v106 = -1 << *(unsigned char *)(v104 + 32);
  v107 = v105 & ~v106;
  if (((*(void *)(v104 + 56 + ((v107 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v107) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_73;
  }
  v108 = ~v106;
  while (2)
  {
    switch(*(unsigned char *)(*(void *)(v104 + 48) + v107))
    {
      case 5:
        swift_bridgeObjectRelease();
        goto LABEL_75;
      default:
        v109 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v109 & 1) == 0)
        {
          v107 = (v107 + 1) & v108;
          if (((*(void *)(v104 + 56 + ((v107 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v107) & 1) == 0)
          {
            swift_bridgeObjectRelease();
            v110 = v197;
            goto LABEL_76;
          }
          continue;
        }
LABEL_75:
        swift_bridgeObjectRelease();
        v111 = objc_msgSend(v71, sel_functions);
        v112 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        v113 = v203;
        swift_bridgeObjectRetain();
        v110 = v197;
        v114 = v177;
        v115 = (void *)_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo11MTLFunction_pG_SSs5NeverOTg50223_s11ShaderGraph21MetalStitchingBackendV7compile7program17uniformDefinition19additionalLibraries7options6deviceSo10MTLLibrary_pAA0cA7ProgramC_AA0C8DataTypeCSaySoAJ_pGAA30SGREMaterialCompilationOptionsCSo9MTLDevice_ptKFSSSo11D8_pXEfU1_0G5Graph0ijK0VTf1cn_nTf4ng_n(v112);
        v177 = v114;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v205 = v115;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
        lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [String]);
        v116 = BidirectionalCollection<>.joined(separator:)();
        v118 = v117;
        swift_bridgeObjectRelease();
        v205 = 0;
        v206 = (void *)0xE000000000000000;
        _StringGuts.grow(_:)(18);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v205 = v110;
        v206 = v113;
        v119._object = (void *)0x800000025C427A00;
        v119._countAndFlagsBits = 0xD000000000000010;
        String.append(_:)(v119);
        specialized static FileLogger.saveDebugTextSource(_:name:extension:)(v116, v118, (uint64_t)v205, v206, 7633012, 0xE300000000000000);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_76:
        type metadata accessor for NSObject(0, &lazy cache variable for type metadata for MTLFunctionStitchingGraph);
        v120 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        v195 = v71;
        objc_msgSend(v71, sel_setFunctionGraphs_, v120);

        v121 = OSSignposter.logHandle.getter();
        OSSignpostIntervalState.signpostID.getter();
        v122 = static os_signpost_type_t.end.getter();
        v123 = OS_os_log.signpostsEnabled.getter();
        v124 = v201;
        if (v123)
        {
          swift_retain();
          v125 = v180;
          checkForErrorAndConsumeState(state:)();
          swift_release();
          v126 = v182;
          v127 = v183;
          if ((*(unsigned int (**)(char *, uint64_t))(v182 + 88))(v125, v183) == *MEMORY[0x263F90238])
          {
            v128 = "[Error] Interval already ended";
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v126 + 8))(v125, v127);
            v128 = "";
          }
          v132 = v196;
          v133 = v186;
          v124 = v201;
          v176(v196, v186, v201);
          v134 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v134 = 0;
          v135 = OSSignpostID.rawValue.getter();
          _os_signpost_emit_with_name_impl(&dword_25C27E000, v121, v122, v135, "stitchingGraph", v128, v134, 2u);
          MEMORY[0x261185880](v134, -1, -1);

          v131 = v191;
          ((void (*)(char *, uint64_t))v191)(v133, v124);
          v129 = (unint64_t)v203;
          v130 = v185;
          ((void (*)(char *, uint64_t))v131)(v132, v124);
        }
        else
        {

          v129 = (unint64_t)v203;
          v130 = v185;
          v131 = v191;
          ((void (*)(char *, uint64_t))v191)(v186, v124);
        }
        v136 = v200;
        OSSignposter.logHandle.getter();
        OSSignpostID.init(log:)();
        swift_bridgeObjectRetain_n();
        v137 = OSSignposter.logHandle.getter();
        v138 = static os_signpost_type_t.begin.getter();
        if (OS_os_log.signpostsEnabled.getter())
        {
          LODWORD(v190) = v138;
          v139 = v196;
          v140 = v130;
          v141 = v176;
          v176(v196, v140, v124);
          v142 = swift_slowAlloc();
          v143 = (void *)swift_slowAlloc();
          v205 = v143;
          *(_DWORD *)v142 = 141558275;
          v204 = 1752392040;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v142 + 12) = 2081;
          swift_bridgeObjectRetain();
          v204 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v110, (unint64_t)v203, (uint64_t *)&v205);
          v144 = v185;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          v145 = OSSignpostID.rawValue.getter();
          _os_signpost_emit_with_name_impl(&dword_25C27E000, v137, (os_signpost_type_t)v190, v145, "metalStitcher", "%{private,mask.hash}s", (uint8_t *)v142, 0x16u);
          swift_arrayDestroy();
          v146 = v143;
          v129 = (unint64_t)v203;
          MEMORY[0x261185880](v146, -1, -1);
          v147 = v142;
          v136 = v200;
          MEMORY[0x261185880](v147, -1, -1);

          ((void (*)(char *, uint64_t))v131)(v139, v124);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v139 = v196;
          v144 = v130;
          v141 = v176;
        }
        v141(v139, v144, v124);
        swift_allocObject();
        v148 = OSSignpostIntervalState.init(id:isOpen:)();
        ((void (*)(char *, uint64_t))v131)(v144, v124);
        v205 = 0;
        v149 = v195;
        v150 = objc_msgSend(v199, sel_newLibraryWithStitchedDescriptor_error_, v195, &v205);
        if (v150)
        {
          v44 = v150;
          v151 = v141;
          v152 = v205;
          v153 = OSSignposter.logHandle.getter();
          v154 = v148;
          v155 = v181;
          OSSignpostIntervalState.signpostID.getter();
          v156 = static os_signpost_type_t.end.getter();
          v157 = OS_os_log.signpostsEnabled.getter();
          v190 = v154;
          if (v157)
          {
            swift_retain();
            v158 = v179;
            checkForErrorAndConsumeState(state:)();
            swift_release();
            v159 = v182;
            v160 = v183;
            if ((*(unsigned int (**)(char *, uint64_t))(v182 + 88))(v158, v183) == *MEMORY[0x263F90238])
            {
              v161 = "[Error] Interval already ended";
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v159 + 8))(v158, v160);
              v161 = "";
            }
            v164 = v196;
            v165 = v201;
            v151(v196, v155, v201);
            v166 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v166 = 0;
            v167 = OSSignpostID.rawValue.getter();
            _os_signpost_emit_with_name_impl(&dword_25C27E000, v153, v156, v167, "metalStitcher", v161, v166, 2u);
            MEMORY[0x261185880](v166, -1, -1);

            v162 = v165;
            v163 = v191;
            ((void (*)(char *, uint64_t))v191)(v155, v165);
            v129 = (unint64_t)v203;
            ((void (*)(char *, uint64_t))v163)(v164, v165);
          }
          else
          {

            v162 = v201;
            v163 = v191;
            ((void (*)(char *, uint64_t))v191)(v155, v201);
          }
          v168 = v200;
          OSSignposter.logHandle.getter();
          v169 = v184;
          OSSignpostID.init(log:)();
          swift_bridgeObjectRetain_n();
          v170 = OSSignposter.logHandle.getter();
          LODWORD(v203) = static os_signpost_type_t.event.getter();
          if (OS_os_log.signpostsEnabled.getter())
          {
            v176(v196, v169, v162);
            v171 = swift_slowAlloc();
            v172 = (void *)swift_slowAlloc();
            v205 = v172;
            *(_DWORD *)v171 = 141558275;
            v204 = 1752392040;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *(_WORD *)(v171 + 12) = 2081;
            swift_bridgeObjectRetain();
            v204 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v197, v129, (uint64_t *)&v205);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            v173 = v196;
            v174 = OSSignpostID.rawValue.getter();
            _os_signpost_emit_with_name_impl(&dword_25C27E000, v170, (os_signpost_type_t)v203, v174, "end", "%{private,mask.hash}s", (uint8_t *)v171, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x261185880](v172, -1, -1);
            MEMORY[0x261185880](v171, -1, -1);
            swift_release();
            swift_release();

            swift_unknownObjectRelease();
            ((void (*)(char *, uint64_t))v163)(v184, v162);
            (*(void (**)(char *, uint64_t))(v193 + 8))(v200, v192);
            ((void (*)(char *, uint64_t))v163)(v173, v162);
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_release();
            swift_release();

            swift_unknownObjectRelease();
            ((void (*)(char *, uint64_t))v163)(v169, v162);
            (*(void (**)(char *, uint64_t))(v193 + 8))(v168, v192);
          }
        }
        else
        {
          v44 = v205;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          swift_release();
          swift_release();
          swift_unknownObjectRelease();

          (*(void (**)(char *, uint64_t))(v193 + 8))(v136, v192);
        }
LABEL_42:
        swift_release();
        swift_release();
        swift_release();
        return v44;
    }
  }
}

int64_t specialized OrderedSet._reserveCapacity(_:persistent:)(int64_t result, char a2, void (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t, void, uint64_t))
{
  if (result < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v7 = v4;
  unint64_t v9 = result;
  uint64_t v12 = v4[1];
  v10 = v4 + 1;
  uint64_t v11 = v12;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v10 = v12;
  if (isUniquelyReferenced_nonNull_native && v9 <= *(void *)(v11 + 24) >> 1)
  {
    uint64_t v14 = *v7;
    if (*v7) {
      goto LABEL_5;
    }
  }
  else
  {
    a3();
    uint64_t v11 = *v10;
    uint64_t v14 = *v7;
    if (*v7)
    {
LABEL_5:
      swift_beginAccess();
      uint64_t v15 = *(void *)(v14 + 16) & 0x3FLL;
      int64_t v16 = specialized static _HashTable.scale(forCapacity:)(v9);
      int64_t v17 = v16;
      if (a2)
      {
        uint64_t v18 = v16;
        if (v15 >= v16) {
          goto LABEL_17;
        }
      }
      else
      {
        swift_beginAccess();
        uint64_t v18 = *(void *)(v14 + 24) & 0x3FLL;
        if (v15 >= v17) {
          goto LABEL_17;
        }
      }
LABEL_13:
      if (v18 <= v17) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v18;
      }
      goto LABEL_26;
    }
  }
  int64_t v19 = specialized static _HashTable.scale(forCapacity:)(v9);
  int64_t v17 = v19;
  uint64_t v15 = 0;
  if (a2) {
    uint64_t v18 = v19;
  }
  else {
    uint64_t v18 = 0;
  }
  if (v19 > 0) {
    goto LABEL_13;
  }
LABEL_17:
  result = specialized static _HashTable.scale(forCapacity:)(*(void *)(v11 + 16));
  if (v18 <= v17) {
    int64_t v21 = v17;
  }
  else {
    int64_t v21 = v18;
  }
  if (result > v21) {
    int64_t v21 = result;
  }
  if (v21 < v15)
  {
    if (v18 <= v21) {
      uint64_t v20 = v21;
    }
    else {
      uint64_t v20 = v18;
    }
LABEL_26:
    uint64_t v22 = a4(v11, v20, 0, v18);
    result = swift_release();
    uint64_t *v7 = v22;
    return result;
  }
  if (!v14 || (result = swift_isUniquelyReferenced_native(), result))
  {
    uint64_t v23 = *v7;
    if (*v7) {
      goto LABEL_31;
    }
LABEL_35:
    if (!v18) {
      return result;
    }
    __break(1u);
    goto LABEL_37;
  }
  result = *v7;
  if (!*v7)
  {
LABEL_38:
    __break(1u);
    return result;
  }
  uint64_t v23 = _HashTable.copy()((void *)result);
  result = swift_release();
  uint64_t *v7 = v23;
  if (!v23) {
    goto LABEL_35;
  }
LABEL_31:
  result = swift_beginAccess();
  if ((*(void *)(v23 + 24) & 0x3FLL) != v18) {
    *(void *)(v23 + 24) = *(void *)(v23 + 24) & 0xFFFFFFFFFFFFFFC0 | v18 & 0x3F;
  }
  return result;
}

uint64_t MetalStitchingBackend.programName.getter(uint64_t a1)
{
  return a1;
}

uint64_t MetalStitchingBackend.programName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MetalStitchingBackend.programName.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t v11 = MetalShaderProgram.terminalNodes()();
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v44 = MEMORY[0x263F8EE78];
  uint64_t v13 = v11[2];
  uint64_t v35 = a5;
  if (v13)
  {
    uint64_t v14 = (uint64_t)(v11 + 4);
    do
    {
      outlined init with copy of MetalFunctionNode(v14, (uint64_t)&v40);
      outlined init with copy of MetalFunctionNode((uint64_t)&v40, (uint64_t)v46);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      type metadata accessor for MetalFunctionDefinitionNode();
      if ((swift_dynamicCast() & 1) == 0) {
        uint64_t v47 = 0;
      }
      uint64_t v15 = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v40);
      if (v47)
      {
        MEMORY[0x261184120](v15);
        if (*(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      v14 += 40;
      --v13;
    }
    while (v13);
    uint64_t v16 = v44;
    uint64_t v12 = MEMORY[0x263F8EE78];
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    if (v16 < 0)
    {
LABEL_40:
      unint64_t v34 = swift_bridgeObjectRetain();
      uint64_t v17 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v34);
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    if (v12 < 0) {
      goto LABEL_40;
    }
  }
  if ((v16 & 0x4000000000000000) != 0) {
    goto LABEL_40;
  }
  uint64_t v17 = v16 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
LABEL_15:
  uint64_t v40 = v17;
  specialized MutableCollection<>.sort(by:)(&v40);
  if (v7)
  {
    swift_release();
    __break(1u);
    JUMPOUT(0x25C3EE130);
  }
  uint64_t v7 = 0;
  swift_bridgeObjectRelease();
  uint64_t v18 = v40;
  uint64_t v47 = v12;
  uint64_t v44 = 0;
  unint64_t v45 = 0xE000000000000000;
  uint64_t v43 = 0;
  unint64_t v42 = specialized Dictionary.init(dictionaryLiteral:)(v12);
  if (v18 < 0 || (v18 & 0x4000000000000000) != 0)
  {
    swift_retain();
    uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
    v36 = (void *)a6;
    if (v19) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v19 = *(void *)(v18 + 16);
    swift_retain();
    v36 = (void *)a6;
    if (v19)
    {
LABEL_19:
      a6 = 4;
      do
      {
        uint64_t v20 = a6 - 4;
        if ((v18 & 0xC000000000000001) != 0)
        {
          uint64_t v12 = MEMORY[0x2611848A0](a6 - 4, v18);
          BOOL v21 = __OFADD__(v20, 1);
          uint64_t v22 = a6 - 3;
          if (v21) {
            goto LABEL_39;
          }
        }
        else
        {
          uint64_t v12 = *(void *)(v18 + 8 * a6);
          swift_retain();
          BOOL v21 = __OFADD__(v20, 1);
          uint64_t v22 = a6 - 3;
          if (v21)
          {
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
        }
        uint64_t v40 = v12;
        specialized closure #3 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(&v40, a1, (uint64_t *)&v42, &v43, a3, a2, a4, (uint64_t)&v44, &v47);
        swift_release();
        ++a6;
      }
      while (v22 != v19);
    }
  }
  swift_release_n();
  if (one-time initialization token for debugMode != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v23 = static DebugConfig.debugMode;
  if (*(void *)(static DebugConfig.debugMode + 16))
  {
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v24 = Hasher._finalize()();
    uint64_t v25 = -1 << *(unsigned char *)(v23 + 32);
    unint64_t v26 = v24 & ~v25;
    if ((*(void *)(v23 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v26))
    {
      uint64_t v27 = ~v25;
      while (1)
      {
        switch(*(unsigned char *)(*(void *)(v23 + 48) + v26))
        {
          case 3:
            swift_bridgeObjectRelease();
            goto LABEL_36;
          default:
            char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v28)
            {
LABEL_36:
              swift_bridgeObjectRelease();
              uint64_t v29 = v44;
              uint64_t v30 = v45;
              uint64_t v40 = 0;
              v41 = (void *)0xE000000000000000;
              swift_bridgeObjectRetain();
              _StringGuts.grow(_:)(16);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              uint64_t v40 = v35;
              v41 = v36;
              v31._countAndFlagsBits = 0x696863746974735FLL;
              v31._object = (void *)0xEE007473694C676ELL;
              String.append(_:)(v31);
              specialized static FileLogger.saveDebugTextSource(_:name:extension:)(v29, v30, v40, v41, 7633012, 0xE300000000000000);
              swift_bridgeObjectRelease();
              goto LABEL_37;
            }
            unint64_t v26 = (v26 + 1) & v27;
            if (((*(void *)(v23 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v26) & 1) == 0) {
              goto LABEL_37;
            }
            break;
        }
      }
    }
LABEL_37:
    swift_bridgeObjectRelease();
  }
  uint64_t v32 = v47;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v32;
}

uint64_t closure #3 in MetalStitchingBackend.compile(program:uniformDefinition:additionalLibraries:options:device:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  v3 = *a1;
  uint64_t v4 = specialized MetalStitchingBackend.mtlFunctionHash(_:)();
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    id v8 = objc_msgSend(v3, sel_name);
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    uint64_t v29 = v9;
    unint64_t v30 = v11;
    v12._countAndFlagsBits = 8250;
    v12._object = (void *)0xE200000000000000;
    String.append(_:)(v12);
    uint64_t v13 = v6;
  }
  else
  {
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)logger);
    swift_unknownObjectRetain_n();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v29 = v28;
      *(_DWORD *)uint64_t v17 = 136315138;
      id v18 = objc_msgSend(v3, sel_name);
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v21 = v20;

      uint64_t v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25C27E000, v15, v16, "Unable to obtain hash for function %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261185880](v28, -1, -1);
      MEMORY[0x261185880](v17, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    uint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v29 = 0xD000000000000016;
    unint64_t v30 = 0x800000025C427B40;
    id v22 = objc_msgSend(v3, sel_name);
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v24;

    uint64_t v13 = v23;
  }
  uint64_t v25 = v7;
  String.append(_:)(*(Swift::String *)&v13);
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v27 = v30;
  *a2 = v29;
  a2[1] = v27;
  return result;
}

uint64_t *MetalStitchingBackend.typeToLookupFunctionMap.unsafeMutableAddressor()
{
  if (one-time initialization token for typeToLookupFunctionMap != -1) {
    swift_once();
  }
  return &static MetalStitchingBackend.typeToLookupFunctionMap;
}

NSObject *protocol witness for GraphCompilerBackend.compile(program:uniformDefinition:additionalLibraries:options:device:) in conformance MetalStitchingBackend(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  return MetalStitchingBackend.compile(program:uniformDefinition:additionalLibraries:options:device:)(a1, a2, a3, a4, a5, *v5, v5[1]);
}

uint64_t protocol witness for GraphCompilerBackend.programName.getter in conformance MetalStitchingBackend()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for GraphCompilerBackend.programName.setter in conformance MetalStitchingBackend(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*protocol witness for GraphCompilerBackend.programName.modify in conformance MetalStitchingBackend())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

unint64_t one-time initialization function for typeToLookupFunctionMap()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(MetalDataType, String)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25C41F2C0;
  if (one-time initialization token for BOOL != -1) {
    swift_once();
  }
  *(void *)(inited + 32) = static MetalDataType.BOOL;
  *(void *)(inited + 40) = 0x625F70756B6F6F6CLL;
  *(void *)(inited + 48) = 0xEB000000006C6F6FLL;
  uint64_t v1 = one-time initialization token for int32;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(inited + 56) = static MetalDataType.int32;
  *(void *)(inited + 64) = 0x695F70756B6F6F6CLL;
  *(void *)(inited + 72) = 0xEA0000000000746ELL;
  uint64_t v2 = one-time initialization token for uint32;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(inited + 80) = static MetalDataType.uint32;
  *(void *)(inited + 88) = 0x755F70756B6F6F6CLL;
  *(void *)(inited + 96) = 0xEB00000000746E69;
  uint64_t v3 = one-time initialization token for float;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(inited + 104) = static MetalDataType.float;
  strcpy((char *)(inited + 112), "lookup_float");
  *(unsigned char *)(inited + 125) = 0;
  *(_WORD *)(inited + 126) = -5120;
  uint64_t v4 = one-time initialization token for half;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  *(void *)(inited + 128) = static MetalDataType.half;
  *(void *)(inited + 136) = 0x685F70756B6F6F6CLL;
  *(void *)(inited + 144) = 0xEB00000000666C61;
  uint64_t v5 = one-time initialization token for float2;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  *(void *)(inited + 152) = static MetalDataType.float2;
  strcpy((char *)(inited + 160), "lookup_float2");
  *(_WORD *)(inited + 174) = -4864;
  uint64_t v6 = one-time initialization token for float3;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  *(void *)(inited + 176) = static MetalDataType.float3;
  strcpy((char *)(inited + 184), "lookup_float3");
  *(_WORD *)(inited + 198) = -4864;
  uint64_t v7 = one-time initialization token for float4;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  *(void *)(inited + 200) = static MetalDataType.float4;
  strcpy((char *)(inited + 208), "lookup_float4");
  *(_WORD *)(inited + 222) = -4864;
  uint64_t v8 = one-time initialization token for int2;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  *(void *)(inited + 224) = static MetalDataType.int2;
  *(void *)(inited + 232) = 0x695F70756B6F6F6CLL;
  *(void *)(inited + 240) = 0xEB0000000032746ELL;
  uint64_t v9 = one-time initialization token for int3;
  swift_retain();
  if (v9 != -1) {
    swift_once();
  }
  *(void *)(inited + 248) = static MetalDataType.int3;
  *(void *)(inited + 256) = 0x695F70756B6F6F6CLL;
  *(void *)(inited + 264) = 0xEB0000000033746ELL;
  uint64_t v10 = one-time initialization token for int4;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  *(void *)(inited + 272) = static MetalDataType.int4;
  *(void *)(inited + 280) = 0x695F70756B6F6F6CLL;
  *(void *)(inited + 288) = 0xEB0000000034746ELL;
  uint64_t v11 = one-time initialization token for half2;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  *(void *)(inited + 296) = static MetalDataType.half2;
  strcpy((char *)(inited + 304), "lookup_half2");
  *(unsigned char *)(inited + 317) = 0;
  *(_WORD *)(inited + 318) = -5120;
  uint64_t v12 = one-time initialization token for half3;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  *(void *)(inited + 320) = static MetalDataType.half3;
  strcpy((char *)(inited + 328), "lookup_half3");
  *(unsigned char *)(inited + 341) = 0;
  *(_WORD *)(inited + 342) = -5120;
  uint64_t v13 = one-time initialization token for half4;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  *(void *)(inited + 344) = static MetalDataType.half4;
  strcpy((char *)(inited + 352), "lookup_half4");
  *(unsigned char *)(inited + 365) = 0;
  *(_WORD *)(inited + 366) = -5120;
  uint64_t v14 = one-time initialization token for color3;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  *(void *)(inited + 368) = static MetalDataType.color3;
  strcpy((char *)(inited + 376), "lookup_color3");
  *(_WORD *)(inited + 390) = -4864;
  uint64_t v15 = one-time initialization token for color4;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  *(void *)(inited + 392) = static MetalDataType.color4;
  strcpy((char *)(inited + 400), "lookup_color4");
  *(_WORD *)(inited + 414) = -4864;
  uint64_t v16 = one-time initialization token for float2x2;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  *(void *)(inited + 416) = static MetalDataType.float2x2;
  *(void *)(inited + 424) = 0x665F70756B6F6F6CLL;
  *(void *)(inited + 432) = 0xEF32783274616F6CLL;
  uint64_t v17 = one-time initialization token for float3x3;
  swift_retain();
  if (v17 != -1) {
    swift_once();
  }
  *(void *)(inited + 440) = static MetalDataType.float3x3;
  *(void *)(inited + 448) = 0x665F70756B6F6F6CLL;
  *(void *)(inited + 456) = 0xEF33783374616F6CLL;
  uint64_t v18 = one-time initialization token for float4x4;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  *(void *)(inited + 464) = static MetalDataType.float4x4;
  *(void *)(inited + 472) = 0x665F70756B6F6F6CLL;
  *(void *)(inited + 480) = 0xEF34783474616F6CLL;
  uint64_t v19 = one-time initialization token for texture2d_float;
  swift_retain();
  if (v19 != -1) {
    swift_once();
  }
  *(void *)(inited + 488) = static MetalDataType.texture2d_float;
  *(void *)(inited + 496) = 0xD000000000000015;
  *(void *)(inited + 504) = 0x800000025C427A40;
  uint64_t v20 = one-time initialization token for texture2d_half;
  swift_retain();
  if (v20 != -1) {
    swift_once();
  }
  *(void *)(inited + 512) = static MetalDataType.texture2d_half;
  *(void *)(inited + 520) = 0xD000000000000014;
  *(void *)(inited + 528) = 0x800000025C427A60;
  uint64_t v21 = one-time initialization token for texture2darray_float;
  swift_retain();
  if (v21 != -1) {
    swift_once();
  }
  *(void *)(inited + 536) = static MetalDataType.texture2darray_float;
  *(void *)(inited + 544) = 0xD00000000000001ALL;
  *(void *)(inited + 552) = 0x800000025C427A80;
  uint64_t v22 = one-time initialization token for texture2darray_half;
  swift_retain();
  if (v22 != -1) {
    swift_once();
  }
  *(void *)(inited + 560) = static MetalDataType.texture2darray_half;
  *(void *)(inited + 568) = 0xD000000000000019;
  *(void *)(inited + 576) = 0x800000025C427AA0;
  uint64_t v23 = one-time initialization token for texture3d_float;
  swift_retain();
  if (v23 != -1) {
    swift_once();
  }
  *(void *)(inited + 584) = static MetalDataType.texture3d_float;
  *(void *)(inited + 592) = 0xD000000000000015;
  *(void *)(inited + 600) = 0x800000025C427AC0;
  uint64_t v24 = one-time initialization token for texture3d_half;
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  *(void *)(inited + 608) = static MetalDataType.texture3d_half;
  *(void *)(inited + 616) = 0xD000000000000014;
  *(void *)(inited + 624) = 0x800000025C427AE0;
  uint64_t v25 = one-time initialization token for texturecube_float;
  swift_retain();
  if (v25 != -1) {
    swift_once();
  }
  *(void *)(inited + 632) = static MetalDataType.texturecube_float;
  *(void *)(inited + 640) = 0xD000000000000017;
  *(void *)(inited + 648) = 0x800000025C427B00;
  uint64_t v26 = one-time initialization token for texturecube_half;
  swift_retain();
  if (v26 != -1) {
    swift_once();
  }
  *(void *)(inited + 656) = static MetalDataType.texturecube_half;
  *(void *)(inited + 664) = 0xD000000000000016;
  *(void *)(inited + 672) = 0x800000025C427B20;
  swift_retain();
  unint64_t result = specialized Dictionary.init(dictionaryLiteral:)(inited);
  static MetalStitchingBackend.typeToLookupFunctionMap = result;
  return result;
}

uint64_t static MetalStitchingBackend.typeToLookupFunctionMap.getter()
{
  if (one-time initialization token for typeToLookupFunctionMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static MetalStitchingBackend.typeToLookupFunctionMap.setter(uint64_t a1)
{
  if (one-time initialization token for typeToLookupFunctionMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  static MetalStitchingBackend.typeToLookupFunctionMap = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static MetalStitchingBackend.typeToLookupFunctionMap.modify())()
{
  if (one-time initialization token for typeToLookupFunctionMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  return XMLParserDelegate.StringNode.children.modify;
}

uint64_t specialized Set._subtract<A>(_:)(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    unint64_t result = specialized Set._Variant.remove(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t vars8;

  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    uint64_t v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v14 >= v7) {
      goto LABEL_24;
    }
    uint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      int64_t v8 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_24;
      }
      uint64_t v15 = *(void *)(v3 + 8 * v8);
      if (!v15)
      {
        int64_t v8 = v14 + 2;
        if (v14 + 2 >= v7) {
          goto LABEL_24;
        }
        uint64_t v15 = *(void *)(v3 + 8 * v8);
        if (!v15)
        {
          int64_t v8 = v14 + 3;
          if (v14 + 3 >= v7) {
            goto LABEL_24;
          }
          uint64_t v15 = *(void *)(v3 + 8 * v8);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    int64_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    unint64_t v12 = *v11;
    int64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    specialized Set._Variant.remove(_:)(v12, v13);
    swift_bridgeObjectRelease();
    unint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v16 = v14 + 4;
  if (v16 < v7)
  {
    uint64_t v15 = *(void *)(v3 + 8 * v16);
    if (!v15)
    {
      while (1)
      {
        int64_t v8 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        uint64_t v15 = *(void *)(v3 + 8 * v8);
        ++v16;
        if (v15) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v16;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

Swift::Int specialized _NativeSet.subtracting<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  v33[5] = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v6 = a1 + 56;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v32 = ~v7;
    if (-v7 < 64) {
      uint64_t v8 = ~(-1 << -(char)v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v5;
    int64_t v10 = (unint64_t)(63 - v7) >> 6;
    uint64_t v11 = a2 + 56;
    while (1)
    {
      do
      {
        if (v9)
        {
          unint64_t v12 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          unint64_t v13 = v12 | (v4 << 6);
        }
        else
        {
          int64_t v14 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
            __break(1u);
            goto LABEL_37;
          }
          if (v14 >= v10) {
            goto LABEL_35;
          }
          unint64_t v15 = *(void *)(v6 + 8 * v14);
          int64_t v16 = v4 + 1;
          if (!v15)
          {
            int64_t v16 = v4 + 2;
            if (v4 + 2 >= v10) {
              goto LABEL_35;
            }
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v4 + 3;
              if (v4 + 3 >= v10) {
                goto LABEL_35;
              }
              unint64_t v15 = *(void *)(v6 + 8 * v16);
              if (!v15)
              {
                int64_t v16 = v4 + 4;
                if (v4 + 4 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v15 = *(void *)(v6 + 8 * v16);
                if (!v15)
                {
                  int64_t v17 = v4 + 5;
                  if (v4 + 5 >= v10)
                  {
LABEL_35:
                    swift_bridgeObjectRetain();
                    outlined consume of [String : InputSpec].Iterator._Variant();
                    return v2;
                  }
                  unint64_t v15 = *(void *)(v6 + 8 * v17);
                  if (!v15)
                  {
                    while (1)
                    {
                      int64_t v16 = v17 + 1;
                      if (__OFADD__(v17, 1)) {
                        break;
                      }
                      if (v16 >= v10) {
                        goto LABEL_35;
                      }
                      unint64_t v15 = *(void *)(v6 + 8 * v16);
                      ++v17;
                      if (v15) {
                        goto LABEL_23;
                      }
                    }
LABEL_37:
                    __break(1u);
                  }
                  int64_t v16 = v4 + 5;
                }
              }
            }
          }
LABEL_23:
          unint64_t v9 = (v15 - 1) & v15;
          unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
          int64_t v4 = v16;
        }
        Swift::UInt v18 = *(void *)(*(void *)(a1 + 48) + 8 * v13);
        Hasher.init(_seed:)();
        Hasher._combine(_:)(v18);
        Swift::Int v19 = Hasher._finalize()();
        uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v21 = v19 & ~v20;
      }
      while (((*(void *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0);
      uint64_t v22 = *(void *)(v2 + 48);
      if (*(void *)(v22 + 8 * v21) == v18) {
        break;
      }
      while (1)
      {
        unint64_t v21 = (v21 + 1) & ~v20;
        if (((*(void *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          break;
        }
        if (*(void *)(v22 + 8 * v21) == v18) {
          goto LABEL_28;
        }
      }
    }
LABEL_28:
    v33[0] = a1;
    v33[1] = v6;
    v33[2] = v32;
    v33[3] = v4;
    v33[4] = v9;
    unint64_t v23 = (unint64_t)(63 - v20) >> 6;
    size_t v24 = 8 * v23;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v23 < 0x81 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      unint64_t v27 = (char *)&v31 - v26;
      memcpy((char *)&v31 - v26, (const void *)(v2 + 56), v24);
      Swift::Int v28 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((Swift::Int)v27, v23, v2, v21, v33);
      swift_release();
      outlined consume of [String : InputSpec].Iterator._Variant();
    }
    else
    {
      uint64_t v29 = (void *)swift_slowAlloc();
      memcpy(v29, (const void *)(v2 + 56), v24);
      Swift::Int v28 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((Swift::Int)v29, v23, v2, v21, v33);
      swift_release();
      outlined consume of [String : InputSpec].Iterator._Variant();
      MEMORY[0x261185880](v29, -1, -1);
    }
    return v28;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t specialized _NativeSet.subtracting<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v37 = a1 + 56;
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v35 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1 << -(char)v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & v4;
    int64_t v36 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain();
    int64_t v9 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v11 = v10 | (v9 << 6);
      }
      else
      {
        int64_t v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36) {
          goto LABEL_47;
        }
        unint64_t v13 = *(void *)(v37 + 8 * v12);
        int64_t v14 = v9 + 1;
        if (!v13)
        {
          int64_t v14 = v9 + 2;
          if (v9 + 2 >= v36) {
            goto LABEL_47;
          }
          unint64_t v13 = *(void *)(v37 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 3;
            if (v9 + 3 >= v36) {
              goto LABEL_47;
            }
            unint64_t v13 = *(void *)(v37 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v9 + 4;
              if (v9 + 4 >= v36) {
                goto LABEL_47;
              }
              unint64_t v13 = *(void *)(v37 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  outlined consume of [String : InputSpec].Iterator._Variant();
                  return v2;
                }
                unint64_t v13 = *(void *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      break;
                    }
                    if (v14 >= v36) {
                      goto LABEL_47;
                    }
                    unint64_t v13 = *(void *)(v37 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_24;
                    }
                  }
LABEL_49:
                  __break(1u);
                }
                int64_t v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        unint64_t v7 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v9 = v14;
      }
      int64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v19 = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if ((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21)) {
        break;
      }
LABEL_6:
      swift_bridgeObjectRelease();
    }
    uint64_t v22 = *(void *)(v2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    BOOL v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
    }
    else
    {
      uint64_t v25 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v25;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
          goto LABEL_6;
        }
        uint64_t v26 = (void *)(v22 + 16 * v21);
        BOOL v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
      uint64_t v38 = a1;
      uint64_t v39 = v37;
      uint64_t v40 = v35;
      int64_t v41 = v9;
      unint64_t v42 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    char v29 = *(unsigned char *)(v2 + 32);
    unint64_t v30 = (unint64_t)((1 << v29) + 63) >> 6;
    size_t v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      uint64_t v32 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      outlined consume of [String : InputSpec].Iterator._Variant();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      uint64_t v32 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      outlined consume of [String : InputSpec].Iterator._Variant();
      MEMORY[0x261185880](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

Swift::Int specialized closure #1 in _NativeSet.subtracting<A>(_:)(Swift::Int result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  unint64_t v7 = (unint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    int64_t v15 = a5[3];
    unint64_t v16 = a5[4];
    if (!v16) {
      break;
    }
    uint64_t v17 = (v16 - 1) & v16;
    unint64_t v18 = __clz(__rbit64(v16)) | (v15 << 6);
LABEL_16:
    Swift::UInt v25 = *(void *)(*(void *)(*a5 + 48) + 8 * v18);
    a5[3] = v15;
    a5[4] = v17;
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v25);
    unint64_t result = Hasher._finalize()();
    uint64_t v26 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v27 = result & ~v26;
    uint64_t v11 = v27 >> 6;
    uint64_t v12 = 1 << v27;
    if (((1 << v27) & *(void *)(v10 + 8 * (v27 >> 6))) != 0)
    {
      uint64_t v28 = *(void *)(a3 + 48);
      if (*(void *)(v28 + 8 * v27) == v25)
      {
LABEL_3:
        uint64_t v13 = v11;
        unint64_t v14 = v7[v11];
        v7[v13] = v14 & ~v12;
        if ((v12 & v14) != 0)
        {
          if (__OFSUB__(v9--, 1)) {
            goto LABEL_36;
          }
          if (!v9) {
            return MEMORY[0x263F8EE88];
          }
        }
      }
      else
      {
        for (unint64_t i = v27 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & ~v26;
          if (((*(void *)(v10 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
            break;
          }
          if (*(void *)(v28 + 8 * v30) == v25)
          {
            uint64_t v11 = v30 >> 6;
            uint64_t v12 = 1 << v30;
            goto LABEL_3;
          }
        }
      }
    }
  }
  int64_t v19 = v15 + 1;
  if (!__OFADD__(v15, 1))
  {
    int64_t v20 = (unint64_t)(a5[2] + 64) >> 6;
    int64_t v21 = a5[3];
    if (v19 >= v20) {
      goto LABEL_33;
    }
    uint64_t v22 = a5[1];
    unint64_t v23 = *(void *)(v22 + 8 * v19);
    if (v23) {
      goto LABEL_15;
    }
    int64_t v24 = v15 + 2;
    int64_t v21 = v15 + 1;
    if (v15 + 2 >= v20) {
      goto LABEL_33;
    }
    unint64_t v23 = *(void *)(v22 + 8 * v24);
    if (!v23)
    {
      int64_t v21 = v15 + 2;
      if (v15 + 3 >= v20) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v22 + 8 * (v15 + 3));
      if (v23)
      {
        int64_t v19 = v15 + 3;
        goto LABEL_15;
      }
      int64_t v24 = v15 + 4;
      int64_t v21 = v15 + 3;
      if (v15 + 4 >= v20) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v22 + 8 * v24);
      if (!v23)
      {
        int64_t v19 = v15 + 5;
        int64_t v21 = v15 + 4;
        if (v15 + 5 >= v20) {
          goto LABEL_33;
        }
        unint64_t v23 = *(void *)(v22 + 8 * v19);
        if (!v23)
        {
          int64_t v21 = v20 - 1;
          int64_t v31 = v15 + 6;
          while (v20 != v31)
          {
            unint64_t v23 = *(void *)(v22 + 8 * v31++);
            if (v23)
            {
              int64_t v19 = v31 - 1;
              goto LABEL_15;
            }
          }
LABEL_33:
          a5[3] = v21;
          a5[4] = 0;
          swift_retain();
          return specialized _NativeSet.extractSubset(using:count:)(v7, a2, v9, a3);
        }
        goto LABEL_15;
      }
    }
    int64_t v19 = v24;
LABEL_15:
    uint64_t v17 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v19 << 6);
    int64_t v15 = v19;
    goto LABEL_16;
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t specialized closure #1 in _NativeSet.subtracting<A>(_:)(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v39 = (unint64_t *)result;
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v40 = a3 + 56;
  while (2)
  {
    uint64_t v38 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        int64_t v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        int64_t v14 = (unint64_t)(a5[2] + 64) >> 6;
        int64_t v15 = a5[3];
        if (v13 >= v14) {
          goto LABEL_45;
        }
        uint64_t v16 = a5[1];
        unint64_t v17 = *(void *)(v16 + 8 * v13);
        if (!v17)
        {
          int64_t v18 = v9 + 2;
          int64_t v15 = v9 + 1;
          if (v9 + 2 >= v14) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v16 + 8 * v18);
          if (!v17)
          {
            int64_t v15 = v9 + 2;
            if (v9 + 3 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              int64_t v13 = v9 + 3;
              goto LABEL_15;
            }
            int64_t v18 = v9 + 4;
            int64_t v15 = v9 + 3;
            if (v9 + 4 >= v14) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v16 + 8 * v18);
            if (!v17)
            {
              int64_t v13 = v9 + 5;
              int64_t v15 = v9 + 4;
              if (v9 + 5 >= v14) {
                goto LABEL_45;
              }
              unint64_t v17 = *(void *)(v16 + 8 * v13);
              if (!v17)
              {
                int64_t v15 = v14 - 1;
                int64_t v36 = v9 + 6;
                while (v14 != v36)
                {
                  unint64_t v17 = *(void *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    int64_t v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return specialized _NativeSet.extractSubset(using:count:)(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          int64_t v13 = v18;
        }
LABEL_15:
        uint64_t v11 = (v17 - 1) & v17;
        unint64_t v12 = __clz(__rbit64(v17)) + (v13 << 6);
        int64_t v9 = v13;
LABEL_16:
        int64_t v19 = (uint64_t *)(*(void *)(*a5 + 48) + 16 * v12);
        uint64_t v21 = *v19;
        uint64_t v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v22 = Hasher._finalize()();
        uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
        unint64_t v24 = v22 & ~v23;
        unint64_t v25 = v24 >> 6;
        uint64_t v26 = 1 << v24;
        if (((1 << v24) & *(void *)(v40 + 8 * (v24 >> 6))) == 0) {
          goto LABEL_3;
        }
        uint64_t v27 = *(void *)(a3 + 48);
        uint64_t v28 = (void *)(v27 + 16 * v24);
        BOOL v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          break;
        }
        uint64_t v31 = ~v23;
        for (unint64_t i = v24 + 1; ; unint64_t i = v33 + 1)
        {
          unint64_t v33 = i & v31;
          if (((*(void *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0) {
            break;
          }
          unint64_t v34 = (void *)(v27 + 16 * v33);
          BOOL v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            unint64_t result = swift_bridgeObjectRelease();
            unint64_t v25 = v33 >> 6;
            uint64_t v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        unint64_t result = swift_bridgeObjectRelease();
      }
      unint64_t result = swift_bridgeObjectRelease();
LABEL_23:
      unint64_t v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    uint64_t v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

uint64_t specialized _NativeSet.extractSubset(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<FunctionNodeID>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v9 = result;
  uint64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::UInt v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v18);
    uint64_t result = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;

  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = result;
  unint64_t v30 = a2;
  if (a2 < 1) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = *a1;
  }
  unint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      uint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    unint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    uint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      unint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      uint64_t v15 = a1[v10];
      if (!v15)
      {
        unint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        uint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    Swift::UInt v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    unint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      char v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      unint64_t v24 = 0;
      BOOL v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        uint64_t v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      char v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  unint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  uint64_t v15 = a1[v16];
  if (v15)
  {
    unint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    unint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    uint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v26 = (void *)MEMORY[0x263F8EE78];
  int64_t v3 = *(void *)(a1 + 16);
  specialized OrderedSet._reserveCapacity(_:persistent:)(v3, 0, (void (*)(void))specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:));
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
  uint64_t v4 = v2;
  swift_bridgeObjectRetain();
  int64_t v22 = v3;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v21 = a1 + 32;
    do
    {
      uint64_t v6 = v21 + 56 * v5;
      long long v24 = *(_OWORD *)(v6 + 40);
      uint64_t v7 = *(void *)(v6 + 16);
      uint64_t v8 = *(void *)(v6 + 24);
      uint64_t v9 = *(void *)(v6 + 32);
      uint64_t v10 = *(void *)v6;
      uint64_t v11 = *(void *)(v6 + 8);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t result = swift_retain();
      if (!v7) {
        break;
      }
      uint64_t v13 = v26[2];
      if (v13)
      {
        if (v26[4] == v10) {
          goto LABEL_22;
        }
        if (v13 != 1)
        {
          if (v26[5] == v10) {
            goto LABEL_22;
          }
          if (v13 != 2)
          {
            if (v26[6] == v10)
            {
LABEL_22:
              __break(1u);
              return result;
            }
            uint64_t v18 = v13 - 3;
            uint64_t v19 = v26 + 7;
            while (v18)
            {
              uint64_t v20 = *v19++;
              --v18;
              if (v20 == v10) {
                goto LABEL_22;
              }
            }
          }
        }
        uint64_t v14 = v4;
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v14 = v4;
      }
      specialized OrderedSet._appendNew(_:in:)(v10, v13);
      uint64_t v4 = v14;
      uint64_t v25 = v14;
      unint64_t v15 = *(void *)(v14 + 16);
      unint64_t v16 = *(void *)(v4 + 24);
      int64_t v23 = v15 + 1;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      if (v15 >= v16 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v23, 1);
        uint64_t v4 = v25;
      }
      ++v5;
      *(void *)(v4 + 16) = v23;
      uint64_t v17 = v4 + 48 * v15;
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v7;
      *(void *)(v17 + 48) = v8;
      *(void *)(v17 + 56) = v9;
      *(_OWORD *)(v17 + 64) = v24;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    while (v5 != v22);
  }
  swift_bridgeObjectRelease();
  return 0;
}

{
  void *v2;
  int64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char v9;

  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    specialized _copyCollectionToContiguousArray<A>(_:)(MEMORY[0x263F8EE78]);
  }
  int64_t v3 = *(void *)(a1 + 16);
  specialized OrderedSet._reserveCapacity(_:persistent:)(v3, 0, (void (*)(void))specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:));
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  for (unint64_t i = a1 + 48; ; i += 24)
  {
    uint64_t v6 = *(void *)(i - 16);
    uint64_t v5 = *(void *)(i - 8);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    uint64_t result = specialized OrderedSet._find(_:)(v6, v5, 0, v2);
    if ((v9 & 1) == 0) {
      break;
    }
    specialized OrderedSet._appendNew(_:in:)(v6, v5, v8);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    swift_bridgeObjectRelease();
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  __break(1u);
  return result;
}

{
  void *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    specialized _copyCollectionToContiguousArray<A>(_:)(MEMORY[0x263F8EE78]);
  }
  int64_t v3 = *(void *)(a1 + 16);
  specialized OrderedSet._reserveCapacity(_:persistent:)(v3, 0, (void (*)(void))specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:));
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = 0;
  while (1)
  {
    uint64_t v5 = *(void *)(a1 + 32 + 16 * v4);
    uint64_t v6 = v2[2];
    if (v6)
    {
      if (v2[4] == v5) {
        goto LABEL_15;
      }
      if (v6 != 1)
      {
        if (v2[5] == v5) {
          goto LABEL_15;
        }
        if (v6 != 2) {
          break;
        }
      }
    }
LABEL_5:
    ++v4;
    swift_unknownObjectRetain();
    specialized OrderedSet._appendNew(_:in:)(v5, 0);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    if (v4 == v3) {
      goto LABEL_16;
    }
  }
  if (v2[6] != v5)
  {
    uint64_t v7 = v6 - 3;
    uint64_t v8 = v2 + 7;
    while (v7)
    {
      uint64_t v9 = *v8++;
      --v7;
      if (v9 == v5) {
        goto LABEL_15;
      }
    }
    goto LABEL_5;
  }
LABEL_15:
  __break(1u);
LABEL_16:
  swift_bridgeObjectRelease();
  return 0;
}

{
  void *v2;
  int64_t v3;
  void **i;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  uint64_t v10;
  char v11;

  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    specialized _copyCollectionToContiguousArray<A>(_:)(MEMORY[0x263F8EE78]);
  }
  int64_t v3 = *(void *)(a1 + 16);
  specialized OrderedSet._reserveCapacity(_:persistent:)(v3, 0, (void (*)(void))specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:));
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v3) {
    return 0;
  }
  swift_bridgeObjectRetain();
  for (unint64_t i = (void **)(a1 + 48); ; i += 3)
  {
    uint64_t v6 = (uint64_t)*(i - 2);
    uint64_t v5 = (uint64_t)*(i - 1);
    uint64_t v7 = *i;
    swift_bridgeObjectRetain();
    uint64_t v8 = v7;
    uint64_t result = specialized OrderedSet._find(_:)(v6, v5, 0, v2);
    if ((v11 & 1) == 0) {
      break;
    }
    specialized OrderedSet._appendNew(_:in:)(v6, v5, v10);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    swift_bridgeObjectRelease();
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized MetalStitchingBackend.mtlFunctionHash(_:)()
{
  uint64_t result = swift_dynamicCastObjCProtocolConditional();
  if (result)
  {
    uint64_t v1 = (void *)result;
    swift_unknownObjectRetain();
    uint64_t v2 = objc_msgSend(v1, sel_bitCodeHash);
    LOBYTE(v1) = *v2;
    char v3 = v2[1];
    char v4 = v2[2];
    char v5 = v2[3];
    char v6 = v2[4];
    char v166 = v2[5];
    char v167 = v2[6];
    char v168 = v2[7];
    char v169 = v2[8];
    char v170 = v2[9];
    char v171 = v2[10];
    char v172 = v2[11];
    char v173 = v2[12];
    char v174 = v2[13];
    char v175 = v2[14];
    char v176 = v2[15];
    char v177 = v2[16];
    char v178 = v2[17];
    char v179 = v2[18];
    char v180 = v2[19];
    char v181 = v2[20];
    char v182 = v2[21];
    char v183 = v2[22];
    char v184 = v2[23];
    char v185 = v2[24];
    char v186 = v2[25];
    char v187 = v2[26];
    char v188 = v2[27];
    char v189 = v2[28];
    char v190 = v2[29];
    char v191 = v2[30];
    char v192 = v2[31];
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = MEMORY[0x263F8E778];
    *(_OWORD *)(v7 + 16) = xmmword_25C418EE0;
    uint64_t v9 = MEMORY[0x263F8E7C0];
    *(void *)(v7 + 56) = v8;
    *(void *)(v7 + 64) = v9;
    *(unsigned char *)(v7 + 32) = (_BYTE)v1;
    uint64_t v10 = String.init(format:_:)();
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_25C418EE0;
    *(void *)(v11 + 56) = v8;
    *(void *)(v11 + 64) = v9;
    *(unsigned char *)(v11 + 32) = v3;
    uint64_t v12 = String.init(format:_:)();
    uint64_t v14 = v13;
    swift_bridgeObjectRetain();
    v15._countAndFlagsBits = v12;
    v15._object = v14;
    String.append(_:)(v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_25C418EE0;
    *(void *)(v16 + 56) = v8;
    *(void *)(v16 + 64) = v9;
    *(unsigned char *)(v16 + 32) = v4;
    uint64_t v17 = String.init(format:_:)();
    uint64_t v19 = v18;
    swift_bridgeObjectRetain();
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_25C418EE0;
    *(void *)(v21 + 56) = v8;
    *(void *)(v21 + 64) = v9;
    *(unsigned char *)(v21 + 32) = v5;
    uint64_t v22 = String.init(format:_:)();
    long long v24 = v23;
    swift_bridgeObjectRetain();
    v25._countAndFlagsBits = v22;
    v25._object = v24;
    String.append(_:)(v25);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_25C418EE0;
    *(void *)(v26 + 56) = v8;
    *(void *)(v26 + 64) = v9;
    *(unsigned char *)(v26 + 32) = v6;
    uint64_t v27 = String.init(format:_:)();
    BOOL v29 = v28;
    swift_bridgeObjectRetain();
    v30._countAndFlagsBits = v27;
    v30._object = v29;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_25C418EE0;
    *(void *)(v31 + 56) = v8;
    *(void *)(v31 + 64) = v9;
    *(unsigned char *)(v31 + 32) = v166;
    uint64_t v32 = String.init(format:_:)();
    unint64_t v34 = v33;
    swift_bridgeObjectRetain();
    v35._countAndFlagsBits = v32;
    v35._object = v34;
    String.append(_:)(v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_25C418EE0;
    *(void *)(v36 + 56) = v8;
    *(void *)(v36 + 64) = v9;
    *(unsigned char *)(v36 + 32) = v167;
    uint64_t v37 = String.init(format:_:)();
    uint64_t v39 = v38;
    swift_bridgeObjectRetain();
    v40._countAndFlagsBits = v37;
    v40._object = v39;
    String.append(_:)(v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_25C418EE0;
    *(void *)(v41 + 56) = v8;
    *(void *)(v41 + 64) = v9;
    *(unsigned char *)(v41 + 32) = v168;
    uint64_t v42 = String.init(format:_:)();
    uint64_t v44 = v43;
    swift_bridgeObjectRetain();
    v45._countAndFlagsBits = v42;
    v45._object = v44;
    String.append(_:)(v45);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_25C418EE0;
    *(void *)(v46 + 56) = v8;
    *(void *)(v46 + 64) = v9;
    *(unsigned char *)(v46 + 32) = v169;
    uint64_t v47 = String.init(format:_:)();
    v49 = v48;
    swift_bridgeObjectRetain();
    v50._countAndFlagsBits = v47;
    v50._object = v49;
    String.append(_:)(v50);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_25C418EE0;
    *(void *)(v51 + 56) = v8;
    *(void *)(v51 + 64) = v9;
    *(unsigned char *)(v51 + 32) = v170;
    uint64_t v52 = String.init(format:_:)();
    v54 = v53;
    swift_bridgeObjectRetain();
    v55._countAndFlagsBits = v52;
    v55._object = v54;
    String.append(_:)(v55);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = swift_allocObject();
    *(_OWORD *)(v56 + 16) = xmmword_25C418EE0;
    *(void *)(v56 + 56) = v8;
    *(void *)(v56 + 64) = v9;
    *(unsigned char *)(v56 + 32) = v171;
    uint64_t v57 = String.init(format:_:)();
    v59 = v58;
    swift_bridgeObjectRetain();
    v60._countAndFlagsBits = v57;
    v60._object = v59;
    String.append(_:)(v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_25C418EE0;
    *(void *)(v61 + 56) = v8;
    *(void *)(v61 + 64) = v9;
    *(unsigned char *)(v61 + 32) = v172;
    uint64_t v62 = String.init(format:_:)();
    v64 = v63;
    swift_bridgeObjectRetain();
    v65._countAndFlagsBits = v62;
    v65._object = v64;
    String.append(_:)(v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = xmmword_25C418EE0;
    *(void *)(v66 + 56) = v8;
    *(void *)(v66 + 64) = v9;
    *(unsigned char *)(v66 + 32) = v173;
    uint64_t v67 = String.init(format:_:)();
    v69 = v68;
    swift_bridgeObjectRetain();
    v70._countAndFlagsBits = v67;
    v70._object = v69;
    String.append(_:)(v70);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_25C418EE0;
    *(void *)(v71 + 56) = v8;
    *(void *)(v71 + 64) = v9;
    *(unsigned char *)(v71 + 32) = v174;
    uint64_t v72 = String.init(format:_:)();
    v74 = v73;
    swift_bridgeObjectRetain();
    v75._countAndFlagsBits = v72;
    v75._object = v74;
    String.append(_:)(v75);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = xmmword_25C418EE0;
    *(void *)(v76 + 56) = v8;
    *(void *)(v76 + 64) = v9;
    *(unsigned char *)(v76 + 32) = v175;
    uint64_t v77 = String.init(format:_:)();
    v79 = v78;
    swift_bridgeObjectRetain();
    v80._countAndFlagsBits = v77;
    v80._object = v79;
    String.append(_:)(v80);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v81 = swift_allocObject();
    *(_OWORD *)(v81 + 16) = xmmword_25C418EE0;
    *(void *)(v81 + 56) = v8;
    *(void *)(v81 + 64) = v9;
    *(unsigned char *)(v81 + 32) = v176;
    uint64_t v82 = String.init(format:_:)();
    v84 = v83;
    swift_bridgeObjectRetain();
    v85._countAndFlagsBits = v82;
    v85._object = v84;
    String.append(_:)(v85);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v86 = swift_allocObject();
    *(_OWORD *)(v86 + 16) = xmmword_25C418EE0;
    *(void *)(v86 + 56) = v8;
    *(void *)(v86 + 64) = v9;
    *(unsigned char *)(v86 + 32) = v177;
    uint64_t v87 = String.init(format:_:)();
    v89 = v88;
    swift_bridgeObjectRetain();
    v90._countAndFlagsBits = v87;
    v90._object = v89;
    String.append(_:)(v90);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v91 = swift_allocObject();
    *(_OWORD *)(v91 + 16) = xmmword_25C418EE0;
    *(void *)(v91 + 56) = v8;
    *(void *)(v91 + 64) = v9;
    *(unsigned char *)(v91 + 32) = v178;
    uint64_t v92 = String.init(format:_:)();
    v94 = v93;
    swift_bridgeObjectRetain();
    v95._countAndFlagsBits = v92;
    v95._object = v94;
    String.append(_:)(v95);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_25C418EE0;
    *(void *)(v96 + 56) = v8;
    *(void *)(v96 + 64) = v9;
    *(unsigned char *)(v96 + 32) = v179;
    uint64_t v97 = String.init(format:_:)();
    v99 = v98;
    swift_bridgeObjectRetain();
    v100._countAndFlagsBits = v97;
    v100._object = v99;
    String.append(_:)(v100);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v101 = swift_allocObject();
    *(_OWORD *)(v101 + 16) = xmmword_25C418EE0;
    *(void *)(v101 + 56) = v8;
    *(void *)(v101 + 64) = v9;
    *(unsigned char *)(v101 + 32) = v180;
    uint64_t v102 = String.init(format:_:)();
    v104 = v103;
    swift_bridgeObjectRetain();
    v105._countAndFlagsBits = v102;
    v105._object = v104;
    String.append(_:)(v105);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v106 = swift_allocObject();
    *(_OWORD *)(v106 + 16) = xmmword_25C418EE0;
    *(void *)(v106 + 56) = v8;
    *(void *)(v106 + 64) = v9;
    *(unsigned char *)(v106 + 32) = v181;
    uint64_t v107 = String.init(format:_:)();
    v109 = v108;
    swift_bridgeObjectRetain();
    v110._countAndFlagsBits = v107;
    v110._object = v109;
    String.append(_:)(v110);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v111 = swift_allocObject();
    *(_OWORD *)(v111 + 16) = xmmword_25C418EE0;
    *(void *)(v111 + 56) = v8;
    *(void *)(v111 + 64) = v9;
    *(unsigned char *)(v111 + 32) = v182;
    uint64_t v112 = String.init(format:_:)();
    v114 = v113;
    swift_bridgeObjectRetain();
    v115._countAndFlagsBits = v112;
    v115._object = v114;
    String.append(_:)(v115);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v116 = swift_allocObject();
    *(_OWORD *)(v116 + 16) = xmmword_25C418EE0;
    *(void *)(v116 + 56) = v8;
    *(void *)(v116 + 64) = v9;
    *(unsigned char *)(v116 + 32) = v183;
    uint64_t v117 = String.init(format:_:)();
    v119 = v118;
    swift_bridgeObjectRetain();
    v120._countAndFlagsBits = v117;
    v120._object = v119;
    String.append(_:)(v120);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v121 = swift_allocObject();
    *(_OWORD *)(v121 + 16) = xmmword_25C418EE0;
    *(void *)(v121 + 56) = v8;
    *(void *)(v121 + 64) = v9;
    *(unsigned char *)(v121 + 32) = v184;
    uint64_t v122 = String.init(format:_:)();
    v124 = v123;
    swift_bridgeObjectRetain();
    v125._countAndFlagsBits = v122;
    v125._object = v124;
    String.append(_:)(v125);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v126 = swift_allocObject();
    *(_OWORD *)(v126 + 16) = xmmword_25C418EE0;
    *(void *)(v126 + 56) = v8;
    *(void *)(v126 + 64) = v9;
    *(unsigned char *)(v126 + 32) = v185;
    uint64_t v127 = String.init(format:_:)();
    v129 = v128;
    swift_bridgeObjectRetain();
    v130._countAndFlagsBits = v127;
    v130._object = v129;
    String.append(_:)(v130);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v131 = swift_allocObject();
    *(_OWORD *)(v131 + 16) = xmmword_25C418EE0;
    *(void *)(v131 + 56) = v8;
    *(void *)(v131 + 64) = v9;
    *(unsigned char *)(v131 + 32) = v186;
    uint64_t v132 = String.init(format:_:)();
    v134 = v133;
    swift_bridgeObjectRetain();
    v135._countAndFlagsBits = v132;
    v135._object = v134;
    String.append(_:)(v135);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v136 = swift_allocObject();
    *(_OWORD *)(v136 + 16) = xmmword_25C418EE0;
    *(void *)(v136 + 56) = v8;
    *(void *)(v136 + 64) = v9;
    *(unsigned char *)(v136 + 32) = v187;
    uint64_t v137 = String.init(format:_:)();
    v139 = v138;
    swift_bridgeObjectRetain();
    v140._countAndFlagsBits = v137;
    v140._object = v139;
    String.append(_:)(v140);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v141 = swift_allocObject();
    *(_OWORD *)(v141 + 16) = xmmword_25C418EE0;
    *(void *)(v141 + 56) = v8;
    *(void *)(v141 + 64) = v9;
    *(unsigned char *)(v141 + 32) = v188;
    uint64_t v142 = String.init(format:_:)();
    v144 = v143;
    swift_bridgeObjectRetain();
    v145._countAndFlagsBits = v142;
    v145._object = v144;
    String.append(_:)(v145);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v146 = swift_allocObject();
    *(_OWORD *)(v146 + 16) = xmmword_25C418EE0;
    *(void *)(v146 + 56) = v8;
    *(void *)(v146 + 64) = v9;
    *(unsigned char *)(v146 + 32) = v189;
    uint64_t v147 = String.init(format:_:)();
    v149 = v148;
    swift_bridgeObjectRetain();
    v150._countAndFlagsBits = v147;
    v150._object = v149;
    String.append(_:)(v150);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v151 = swift_allocObject();
    *(_OWORD *)(v151 + 16) = xmmword_25C418EE0;
    *(void *)(v151 + 56) = v8;
    *(void *)(v151 + 64) = v9;
    *(unsigned char *)(v151 + 32) = v190;
    uint64_t v152 = String.init(format:_:)();
    v154 = v153;
    swift_bridgeObjectRetain();
    v155._countAndFlagsBits = v152;
    v155._object = v154;
    String.append(_:)(v155);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v156 = swift_allocObject();
    *(_OWORD *)(v156 + 16) = xmmword_25C418EE0;
    *(void *)(v156 + 56) = v8;
    *(void *)(v156 + 64) = v9;
    *(unsigned char *)(v156 + 32) = v191;
    uint64_t v157 = String.init(format:_:)();
    v159 = v158;
    swift_bridgeObjectRetain();
    v160._countAndFlagsBits = v157;
    v160._object = v159;
    String.append(_:)(v160);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v161 = swift_allocObject();
    *(_OWORD *)(v161 + 16) = xmmword_25C418EE0;
    *(void *)(v161 + 56) = v8;
    *(void *)(v161 + 64) = v9;
    *(unsigned char *)(v161 + 32) = v192;
    uint64_t v162 = String.init(format:_:)();
    v164 = v163;
    swift_bridgeObjectRetain();
    v165._countAndFlagsBits = v162;
    v165._object = v164;
    String.append(_:)(v165);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSaySo11MTLFunction_pG_SSs5NeverOTg50223_s11ShaderGraph21MetalStitchingBackendV7compile7program17uniformDefinition19additionalLibraries7options6deviceSo10MTLLibrary_pAA0cA7ProgramC_AA0C8DataTypeCSaySoAJ_pGAA30SGREMaterialCompilationOptionsCSo9MTLDevice_ptKFSSSo11D8_pXEfU1_0G5Graph0ijK0VTf1cn_nTf4ng_n(unint64_t a1)
{
  uint64_t v2 = v1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v4) {
      return v5;
    }
    uint64_t v16 = MEMORY[0x263F8EE78];
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
    if (v4 < 0) {
      break;
    }
    uint64_t v7 = 0;
    uint64_t v5 = v16;
    while (v4 != v7)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (void *)MEMORY[0x2611848A0](v7, a1);
      }
      else
      {
        uint64_t v8 = *(void **)(a1 + 8 * v7 + 32);
        swift_unknownObjectRetain();
      }
      uint64_t v14 = v8;
      closure #3 in MetalStitchingBackend.compile(program:uniformDefinition:additionalLibraries:options:device:)(&v14, v15);
      if (v2)
      {
        swift_release();
        swift_unknownObjectRelease();
        return v5;
      }
      uint64_t v2 = 0;
      swift_unknownObjectRelease();
      uint64_t v9 = v15[0];
      uint64_t v10 = v15[1];
      uint64_t v16 = v5;
      unint64_t v12 = *(void *)(v5 + 16);
      unint64_t v11 = *(void *)(v5 + 24);
      if (v12 >= v11 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
        uint64_t v5 = v16;
      }
      ++v7;
      *(void *)(v5 + 16) = v12 + 1;
      uint64_t v13 = v5 + 16 * v12;
      *(void *)(v13 + 32) = v9;
      *(void *)(v13 + 40) = v10;
      if (v4 == v7) {
        return v5;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id specialized Sequence.reduce<A>(into:_:)(id a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >> 62)
  {
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_3:
      uint64_t v8 = 0;
      while (1)
      {
        if ((a2 & 0xC000000000000001) != 0)
        {
          uint64_t v9 = (void *)MEMORY[0x2611848A0](v8, a2);
          uint64_t v10 = v8 + 1;
          if (__OFADD__(v8, 1)) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v9 = *(void **)(a2 + 8 * v8 + 32);
          swift_unknownObjectRetain();
          uint64_t v10 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
        }
        if (a1)
        {
          swift_unknownObjectRelease();
          ++v8;
          if (v10 == v7) {
            break;
          }
        }
        else
        {
          unint64_t v11 = (void *)MEMORY[0x261183E60](a3, a4);
          a1 = objc_msgSend(v9, sel_newFunctionWithName_, v11);
          swift_unknownObjectRelease();

          uint64_t v8 = v10;
          if (v10 == v7) {
            break;
          }
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v19 = (void *)MEMORY[0x263F8EE78];
  int64_t v3 = *(void *)(a1 + 16);
  specialized OrderedSet._reserveCapacity(_:persistent:)(v3, 0, (void (*)(void))specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:), (uint64_t (*)(uint64_t, uint64_t, void, uint64_t))specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:));
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3, 0);
  uint64_t v4 = v2;
  if (!v3) {
    return 0;
  }
  uint64_t v5 = a1 + 32;
  unint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = (uint64_t *)(v5 + 24 * v7);
    uint64_t v10 = *v8;
    uint64_t v9 = v8[1];
    uint64_t v11 = v8[2];
    uint64_t v12 = v19[2];
    if (v12)
    {
      if (v19[4] == v10) {
        goto LABEL_18;
      }
      if (v12 != 1)
      {
        if (v19[5] == v10) {
          goto LABEL_18;
        }
        if (v12 != 2) {
          break;
        }
      }
    }
LABEL_8:
    swift_bridgeObjectRetain();
    unint64_t result = specialized OrderedSet._appendNew(_:in:)(v10, 0);
    unint64_t v14 = *(void *)(v4 + 16);
    unint64_t v13 = *(void *)(v4 + 24);
    if (v14 >= v13 >> 1) {
      unint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
    }
    ++v7;
    *(void *)(v4 + 16) = v14 + 1;
    uint64_t v15 = v4 + 16 * v14;
    *(void *)(v15 + 32) = v9;
    *(void *)(v15 + 40) = v11;
    if (v7 == v3)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  if (v19[6] != v10)
  {
    uint64_t v16 = v12 - 3;
    uint64_t v17 = v19 + 7;
    while (v16)
    {
      uint64_t v18 = *v17++;
      --v16;
      if (v18 == v10) {
        goto LABEL_18;
      }
    }
    goto LABEL_8;
  }
LABEL_18:
  __break(1u);
  return result;
}

id specialized MetalStitchingBackend.builtinLibrary(for:)(void *a1)
{
  v8[1] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for SGGraph();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v8[0] = 0;
  id v4 = objc_msgSend(a1, sel_newDefaultLibraryWithBundle_error_, v3, v8);
  if (v4)
  {
    id v5 = v8[0];
  }
  else
  {
    id v6 = v8[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  return v4;
}

id specialized MetalStitchingBackend.specializeGetter(for:field:offset:library:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, id a5, int a6, void *a7)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (one-time initialization token for typeToLookupFunctionMap != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v14 = static MetalStitchingBackend.typeToLookupFunctionMap;
  if (!*(void *)(static MetalStitchingBackend.typeToLookupFunctionMap + 16)) {
    goto LABEL_11;
  }
  uint64_t v15 = swift_retain();
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(v15);
  if ((v17 & 1) == 0)
  {
    swift_release();
LABEL_11:
    swift_endAccess();
    uint64_t v37 = *(void *)(a1 + 32);
    id v56 = *(id *)(a1 + 24);
    uint64_t v57 = v37;
    swift_bridgeObjectRetain();
    v38._countAndFlagsBits = 46;
    v38._object = (void *)0xE100000000000000;
    String.append(_:)(v38);
    swift_bridgeObjectRetain();
    v39._countAndFlagsBits = a2;
    v39._object = a3;
    String.append(_:)(v39);
    swift_bridgeObjectRelease();
    v40._countAndFlagsBits = 10272;
    v40._object = (void *)0xE200000000000000;
    String.append(_:)(v40);
    uint64_t v41 = *(uint64_t (**)(uint64_t))(*(void *)a4 + 136);
    uint64_t v42 = swift_retain();
    v43._countAndFlagsBits = v41(v42);
    String.append(_:)(v43);
    swift_release();
    swift_bridgeObjectRelease();
    v44._countAndFlagsBits = 41;
    v44._object = (void *)0xE100000000000000;
    String.append(_:)(v44);
    uint64_t v45 = v57;
    lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
    swift_allocError();
    *(void *)uint64_t v46 = v56;
    *(void *)(v46 + 8) = v45;
    *(unsigned char *)(v46 + 16) = 4;
    swift_willThrow();
    return a5;
  }
  uint64_t v18 = (uint64_t *)(*(void *)(v14 + 56) + 16 * v16);
  uint64_t v54 = *v18;
  id v55 = a7;
  uint64_t v53 = v18[1];
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_release();
  unint64_t v19 = lazy protocol witness table accessor for type String and conformance String();
  uint64_t v20 = MEMORY[0x263F8D310];
  id v56 = (id)StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  uint64_t v57 = v21;
  unint64_t v51 = v19;
  unint64_t v52 = v19;
  uint64_t v49 = v20;
  unint64_t v50 = v19;
  uint64_t v22 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  long long v24 = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(a1 + 32);
  id v56 = *(id *)(a1 + 24);
  uint64_t v57 = v25;
  swift_bridgeObjectRetain();
  v26._countAndFlagsBits = 95;
  v26._object = (void *)0xE100000000000000;
  String.append(_:)(v26);
  v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v27);
  swift_bridgeObjectRelease();
  v28._countAndFlagsBits = 95;
  v28._object = (void *)0xE100000000000000;
  String.append(_:)(v28);
  v29._countAndFlagsBits = v22;
  v29._object = v24;
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  a5 = v56;
  id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F128B8]), sel_init, v49, v50, v51, v52);
  uint64_t v31 = (void *)MEMORY[0x261183E60](v56, v57);
  objc_msgSend(v30, sel_setSpecializedName_, v31);

  id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F128B0]), sel_init);
  objc_msgSend(v30, sel_setConstantValues_, v32);

  unint64_t v33 = (void *)MEMORY[0x261183E60](v54, v53);
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_setName_, v33);

  LODWORD(v56) = a6;
  id v34 = objc_msgSend(v30, sel_constantValues);
  if (v34)
  {
    Swift::String v35 = v34;
    objc_msgSend(v34, sel_setConstantValue_type_atIndex_, &v56, 33, 100);
  }
  id v56 = 0;
  if (objc_msgSend(v55, sel_newFunctionWithDescriptor_error_, v30, &v56))
  {
    id v36 = v56;
  }
  else
  {
    id v48 = v56;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  return a5;
}

void specialized MetalStitchingBackend.generateStructGetters(for:augmenting:library:)(uint64_t a1, void *a2, void *a3)
{
  type metadata accessor for MetalDataType.Struct();
  uint64_t v5 = swift_dynamicCastClass();
  if (!v5)
  {
    if (one-time initialization token for logger != -1) {
      goto LABEL_63;
    }
    goto LABEL_7;
  }
  uint64_t v6 = v5;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v66 = (void *)MEMORY[0x263F8EE78];
  int v61 = 0;
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t v56 = v6;
  if (v8)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v9 = (void *)(v7 + 72);
    do
    {
      uint64_t v10 = *(v9 - 5);
      uint64_t v11 = *(v9 - 4);
      uint64_t v12 = *(v9 - 3);
      uint64_t v13 = *(v9 - 2);
      char v14 = *((unsigned char *)v9 - 8);
      uint64_t v15 = *v9;
      v9 += 6;
      v63[0] = v10;
      v63[1] = v11;
      v63[2] = v12;
      v63[3] = v13;
      char v64 = v14;
      uint64_t v65 = v15;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      specialized closure #1 in calculateOffsets(for:)((uint64_t)v63, &v61, &v66);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    unint64_t v16 = v66;
  }
  else
  {
    swift_retain();
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v55 = v16[2];
  if (!v55)
  {
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v54 = v16 + 4;
  long long v24 = a2 + 2;
  swift_bridgeObjectRetain();
  a1 = 0;
  uint64_t v53 = a2;
  while (1)
  {
    Swift::String v26 = &v54[7 * a1];
    uint64_t v27 = v26[2];
    int v28 = *((_DWORD *)v26 + 12);
    Swift::String v29 = (void *)v26[5];
    uint64_t v30 = *v26;
    uint64_t v31 = (void *)v26[1];
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    id v32 = specialized MetalStitchingBackend.specializeGetter(for:field:offset:library:)(v56, v30, v31, v27, v29, v28, a3);
    if (v60)
    {
      swift_release();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_release_n();
LABEL_59:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v35 = (uint64_t)v32;
    uint64_t v36 = v33;
    uint64_t v59 = v34;
    uint64_t v37 = v24;
    uint64_t v39 = *a2;
    Swift::String v38 = (void *)a2[1];
    uint64_t v40 = v38[2];
    if (*a2)
    {
      swift_retain();
      swift_retain();
      uint64_t v58 = v36;
      unint64_t v41 = specialized _HashTable.UnsafeHandle._find<A>(_:in:)(v35, v36, (uint64_t)(v38 + 4), v40, (void *)(v39 + 16), v39 + 32);
      char v43 = v42;
      uint64_t v25 = v44;
      swift_release();
      swift_release();
      if ((v43 & 1) == 0)
      {
        a2 = v53;
        long long v24 = v37;
        goto LABEL_29;
      }
      a2 = v53;
      long long v24 = v37;
      goto LABEL_27;
    }
    long long v24 = v37;
    if (v40) {
      break;
    }
    uint64_t v25 = 0;
LABEL_13:
    swift_unknownObjectRetain();
    specialized OrderedSet._appendNew(_:in:)(v35, v36, v25);
    swift_unknownObjectRetain();
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
LABEL_14:
    ++a1;
    specialized ContiguousArray._endMutation()();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease_n();
    if (a1 == v55)
    {
      swift_release();
      goto LABEL_59;
    }
  }
  if ((id)v38[4] == v32 && v38[5] == v33)
  {
    unint64_t v41 = 0;
    goto LABEL_29;
  }
  if (_stringCompareWithSmolCheck(_:_:expecting:)())
  {
    unint64_t v41 = 0;
    goto LABEL_29;
  }
  if (v40 == 1) {
    goto LABEL_35;
  }
  BOOL v48 = v38[6] == v35 && v38[7] == v36;
  if (v48 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    unint64_t v41 = 1;
    goto LABEL_29;
  }
  if (v40 == 2)
  {
LABEL_35:
    uint64_t v25 = 0;
    goto LABEL_13;
  }
  uint64_t v58 = v36;
  if ((v38[8] != v35 || v38[9] != v36) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v49 = v38 + 11;
    uint64_t v50 = 3;
    while (v40 != v50)
    {
      unint64_t v41 = v50;
      if (*(v49 - 1) != v35 || *v49 != v58)
      {
        char v52 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v50 = v41 + 1;
        v49 += 2;
        if ((v52 & 1) == 0) {
          continue;
        }
      }
      goto LABEL_29;
    }
    uint64_t v25 = 0;
LABEL_27:
    uint64_t v36 = v58;
    goto LABEL_13;
  }
  unint64_t v41 = 2;
LABEL_29:
  uint64_t v46 = *v24;
  swift_unknownObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *long long v24 = v46;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v46);
  }
  if ((v41 & 0x8000000000000000) == 0)
  {
    if (v41 >= *(void *)(v46 + 16)) {
      goto LABEL_62;
    }
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    *(void *)(v46 + 8 * v41 + 32) = v59;
    goto LABEL_14;
  }
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  swift_once();
LABEL_7:
  uint64_t v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)logger);
  swift_retain();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    v62[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v22 = *(void *)(a1 + 24);
    unint64_t v23 = *(void *)(a1 + 32);
    swift_bridgeObjectRetain();
    uint64_t v66 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C27E000, v18, v19, "Can not generate getters for a non-struct type %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261185880](v21, -1, -1);
    MEMORY[0x261185880](v20, -1, -1);
  }
  else
  {

    swift_release();
  }
}

uint64_t outlined copy of MetalStitchingBackendErrors(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 5u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MetalStitchingBackendErrors(uint64_t a1)
{
  return outlined consume of MetalStitchingBackendErrors(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t outlined consume of MetalStitchingBackendErrors(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 5u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MetalStitchingBackendErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of MetalStitchingBackendErrors(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MetalStitchingBackendErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of MetalStitchingBackendErrors(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of MetalStitchingBackendErrors(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for MetalStitchingBackendErrors(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of MetalStitchingBackendErrors(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetalStitchingBackendErrors(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MetalStitchingBackendErrors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 250;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for MetalStitchingBackendErrors(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 5u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 6);
  }
}

uint64_t destructiveInjectEnumTag for MetalStitchingBackendErrors(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(void *)uint64_t result = a2 - 6;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 6;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MetalStitchingBackendErrors()
{
  return &type metadata for MetalStitchingBackendErrors;
}

ValueMetadata *type metadata accessor for MetalStitchingBackend()
{
  return &type metadata for MetalStitchingBackend;
}

id specialized MetalStitchingBackend.constantFunction(for:name:type:library:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F128B8]), sel_init);
  uint64_t v10 = (void *)MEMORY[0x261183E60](a2, a3);
  objc_msgSend(v9, sel_setSpecializedName_, v10);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F128B0]), sel_init);
  objc_msgSend(v9, sel_setConstantValues_, v11);

  outlined init with take of SGDataTypeStorage(a1, (uint64_t)&v103);
  switch(v107)
  {
    case 1:
      LOBYTE(v102[0]) = v103;
      id v19 = objc_msgSend(v9, sel_constantValues);
      if (v19)
      {
        uint64_t v20 = v19;
        objc_msgSend(v19, sel_setConstantValue_type_atIndex_, v102, 49, 13);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xEE0072616863755FLL;
      goto LABEL_116;
    case 2:
      LODWORD(v102[0]) = v103;
      id v21 = objc_msgSend(v9, sel_constantValues);
      if (v21)
      {
        uint64_t v22 = v21;
        objc_msgSend(v21, sel_setConstantValue_type_atIndex_, v102, 29, 1);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xEC000000746E695FLL;
      goto LABEL_116;
    case 3:
      LODWORD(v102[0]) = v103;
      id v23 = objc_msgSend(v9, sel_constantValues);
      if (v23)
      {
        long long v24 = v23;
        objc_msgSend(v23, sel_setConstantValue_type_atIndex_, v102, 33, 14);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xED0000746E69755FLL;
      goto LABEL_116;
    case 4:
      LOWORD(v102[0]) = v103;
      id v25 = objc_msgSend(v9, sel_constantValues);
      if (v25)
      {
        Swift::String v26 = v25;
        objc_msgSend(v25, sel_setConstantValue_type_atIndex_, v102, 16, 15);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xED0000666C61685FLL;
      goto LABEL_116;
    case 5:
      LODWORD(v102[0]) = v103;
      id v27 = objc_msgSend(v9, sel_constantValues);
      if (v27)
      {
        int v28 = v27;
        objc_msgSend(v27, sel_setConstantValue_type_atIndex_, v102, 3, 2);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xEE0074616F6C665FLL;
      goto LABEL_116;
    case 6:
    case 22:
    case 23:
      goto LABEL_2;
    case 7:
      uint64_t v29 = v103;
      if (one-time initialization token for float2 != -1) {
        swift_once();
      }
      if (MetalDataType.isEqual(to:)())
      {
        unint64_t v18 = 0xEF3274616F6C665FLL;
      }
      else
      {
        if (one-time initialization token for half2 != -1) {
          swift_once();
        }
        if ((MetalDataType.isEqual(to:)() & 1) == 0) {
          goto LABEL_2;
        }
        unint64_t v18 = 0xEE0032666C61685FLL;
      }
      *(void *)&v102[0] = v29;
      id v86 = objc_msgSend(v9, sel_constantValues);
      if (!v86) {
        goto LABEL_115;
      }
      uint64_t v87 = v86;
      objc_msgSend(v86, sel_setConstantValue_type_atIndex_, v102, 4, 3);
      goto LABEL_114;
    case 8:
      long long v97 = v103;
      if (one-time initialization token for float3 != -1) {
        swift_once();
      }
      if (MetalDataType.isEqual(to:)())
      {
        uint64_t v30 = 0x74616F6C665FLL;
LABEL_29:
        unint64_t v18 = v30 & 0xFFFFFFFFFFFFLL | 0xEF33000000000000;
        goto LABEL_106;
      }
      if (one-time initialization token for half3 != -1) {
        swift_once();
      }
      if ((MetalDataType.isEqual(to:)() & 1) == 0)
      {
        if (one-time initialization token for color3 != -1) {
          swift_once();
        }
        if ((MetalDataType.isEqual(to:)() & 1) == 0) {
          goto LABEL_2;
        }
        uint64_t v30 = 0x726F6C6F635FLL;
        goto LABEL_29;
      }
      unint64_t v18 = 0xEE0033666C61685FLL;
LABEL_106:
      v102[0] = v97;
      id v88 = objc_msgSend(v9, sel_constantValues);
      if (!v88) {
        goto LABEL_115;
      }
      uint64_t v87 = v88;
      objc_msgSend(v88, sel_setConstantValue_type_atIndex_, v102, 5, 4);
      goto LABEL_114;
    case 9:
      long long v98 = v103;
      if (one-time initialization token for float4 != -1) {
        swift_once();
      }
      if (MetalDataType.isEqual(to:)())
      {
        uint64_t v31 = 0x74616F6C665FLL;
LABEL_34:
        unint64_t v18 = v31 & 0xFFFFFFFFFFFFLL | 0xEF34000000000000;
        goto LABEL_112;
      }
      if (one-time initialization token for half4 != -1) {
        swift_once();
      }
      if ((MetalDataType.isEqual(to:)() & 1) == 0)
      {
        if (one-time initialization token for color4 != -1) {
          swift_once();
        }
        if ((MetalDataType.isEqual(to:)() & 1) == 0)
        {
LABEL_2:
          outlined init with take of SGDataTypeStorage(a1, (uint64_t)v102);
          _print_unlocked<A, B>(_:_:)();
          id v13 = 0;
          lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
          swift_allocError();
          *(void *)uint64_t v14 = 0;
          *(void *)(v14 + 8) = 0xE000000000000000;
          *(unsigned char *)(v14 + 16) = 3;
          goto LABEL_119;
        }
        uint64_t v31 = 0x726F6C6F635FLL;
        goto LABEL_34;
      }
      unint64_t v18 = 0xEE0034666C61685FLL;
LABEL_112:
      v102[0] = v98;
      id v89 = objc_msgSend(v9, sel_constantValues);
      if (v89)
      {
        uint64_t v87 = v89;
        objc_msgSend(v89, sel_setConstantValue_type_atIndex_, v102, 6, 5);
LABEL_114:
      }
LABEL_115:
      unint64_t v17 = 0x746E6174736E6F63;
LABEL_116:
      Swift::String v90 = (void *)MEMORY[0x261183E60](v17, v18);
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_setName_, v90);

      *(void *)&v102[0] = 0;
      id v91 = objc_msgSend(a5, sel_newFunctionWithDescriptor_error_, v9, v102);
      if (v91)
      {
        id v13 = v91;
        id v92 = *(id *)&v102[0];
      }
      else
      {
        id v13 = *(id *)&v102[0];
        _convertNSErrorToError(_:)();

LABEL_119:
        swift_willThrow();
      }
      return v13;
    case 10:
      LODWORD(v102[0]) = v103;
      id v32 = objc_msgSend(v9, sel_constantValues);
      if (v32)
      {
        uint64_t v33 = v32;
        objc_msgSend(v32, sel_setConstantValue_type_atIndex_, v102, 17, 21);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xEE0032666C61685FLL;
      goto LABEL_116;
    case 11:
      *(void *)&v102[0] = v103;
      id v34 = objc_msgSend(v9, sel_constantValues);
      if (v34)
      {
        uint64_t v35 = v34;
        objc_msgSend(v34, sel_setConstantValue_type_atIndex_, v102, 18, 22);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xEE0033666C61685FLL;
      goto LABEL_116;
    case 12:
      *(void *)&v102[0] = v103;
      id v36 = objc_msgSend(v9, sel_constantValues);
      if (v36)
      {
        uint64_t v37 = v36;
        objc_msgSend(v36, sel_setConstantValue_type_atIndex_, v102, 19, 23);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xEE0034666C61685FLL;
      goto LABEL_116;
    case 13:
      *(void *)&v102[0] = v103;
      id v38 = objc_msgSend(v9, sel_constantValues);
      if (v38)
      {
        uint64_t v39 = v38;
        objc_msgSend(v38, sel_setConstantValue_type_atIndex_, v102, 30, 18);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xED000032746E695FLL;
      goto LABEL_116;
    case 14:
      v102[0] = v103;
      id v40 = objc_msgSend(v9, sel_constantValues);
      if (v40)
      {
        unint64_t v41 = v40;
        objc_msgSend(v40, sel_setConstantValue_type_atIndex_, v102, 31, 19);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xED000033746E695FLL;
      goto LABEL_116;
    case 15:
      v102[0] = v103;
      id v42 = objc_msgSend(v9, sel_constantValues);
      if (v42)
      {
        char v43 = v42;
        objc_msgSend(v42, sel_setConstantValue_type_atIndex_, v102, 32, 20);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xED000034746E695FLL;
      goto LABEL_116;
    case 16:
      uint64_t v44 = *((void *)&v103 + 1);
      *(void *)&v102[0] = v103;
      id v45 = objc_msgSend(v9, sel_constantValues);
      if (v45)
      {
        uint64_t v46 = v45;
        objc_msgSend(v45, sel_setConstantValue_type_atIndex_, v102, 4, 16);
      }
      *(void *)&v102[0] = v44;
      id v47 = objc_msgSend(v9, sel_constantValues);
      if (v47)
      {
        BOOL v48 = v47;
        objc_msgSend(v47, sel_setConstantValue_type_atIndex_, v102, 4, 17);
      }
      unint64_t v17 = 0xD000000000000011;
      uint64_t v49 = "constant_float2x2";
      goto LABEL_95;
    case 17:
      long long v95 = v104;
      long long v99 = v105;
      v102[0] = v103;
      id v50 = objc_msgSend(v9, sel_constantValues);
      if (v50)
      {
        unint64_t v51 = v50;
        objc_msgSend(v50, sel_setConstantValue_type_atIndex_, v102, 5, 6);
      }
      v102[0] = v95;
      id v52 = objc_msgSend(v9, sel_constantValues);
      if (v52)
      {
        uint64_t v53 = v52;
        objc_msgSend(v52, sel_setConstantValue_type_atIndex_, v102, 5, 7);
      }
      v102[0] = v99;
      id v54 = objc_msgSend(v9, sel_constantValues);
      if (v54)
      {
        uint64_t v55 = v54;
        objc_msgSend(v54, sel_setConstantValue_type_atIndex_, v102, 5, 8);
      }
      unint64_t v17 = 0xD000000000000011;
      uint64_t v49 = "constant_float3x3";
      goto LABEL_95;
    case 18:
      long long v94 = v104;
      long long v96 = v105;
      long long v100 = v106;
      v102[0] = v103;
      id v56 = objc_msgSend(v9, sel_constantValues);
      if (v56)
      {
        uint64_t v57 = v56;
        objc_msgSend(v56, sel_setConstantValue_type_atIndex_, v102, 6, 9);
      }
      v102[0] = v94;
      id v58 = objc_msgSend(v9, sel_constantValues);
      if (v58)
      {
        uint64_t v59 = v58;
        objc_msgSend(v58, sel_setConstantValue_type_atIndex_, v102, 6, 10);
      }
      v102[0] = v96;
      id v60 = objc_msgSend(v9, sel_constantValues);
      if (v60)
      {
        int v61 = v60;
        objc_msgSend(v60, sel_setConstantValue_type_atIndex_, v102, 6, 11);
      }
      v102[0] = v100;
      id v62 = objc_msgSend(v9, sel_constantValues);
      if (v62)
      {
        v63 = v62;
        objc_msgSend(v62, sel_setConstantValue_type_atIndex_, v102, 6, 12);
      }
      unint64_t v17 = 0xD000000000000011;
      uint64_t v49 = "constant_float4x4";
      goto LABEL_95;
    case 19:
      WORD2(v12) = WORD3(v103);
      LOWORD(v12) = WORD2(v103);
      uint64_t v101 = v12;
      LODWORD(v102[0]) = v103;
      id v64 = objc_msgSend(v9, sel_constantValues);
      if (v64)
      {
        uint64_t v65 = v64;
        objc_msgSend(v64, sel_setConstantValue_type_atIndex_, v102, 4, 24);
      }
      WORD1(v102[0]) = WORD2(v101);
      LOWORD(v102[0]) = v101;
      id v66 = objc_msgSend(v9, sel_constantValues);
      if (v66)
      {
        uint64_t v67 = v66;
        objc_msgSend(v66, sel_setConstantValue_type_atIndex_, v102, 4, 25);
      }
      unint64_t v17 = 0xD000000000000010;
      uint64_t v49 = "constant_half2x2";
      goto LABEL_95;
    case 20:
      uint64_t v68 = *((void *)&v103 + 1);
      uint64_t v69 = v104;
      *(void *)&v102[0] = v103;
      id v70 = objc_msgSend(v9, sel_constantValues);
      if (v70)
      {
        uint64_t v71 = v70;
        objc_msgSend(v70, sel_setConstantValue_type_atIndex_, v102, 5, 26);
      }
      *(void *)&v102[0] = v68;
      id v72 = objc_msgSend(v9, sel_constantValues);
      if (v72)
      {
        v73 = v72;
        objc_msgSend(v72, sel_setConstantValue_type_atIndex_, v102, 5, 27);
      }
      *(void *)&v102[0] = v69;
      id v74 = objc_msgSend(v9, sel_constantValues);
      if (v74)
      {
        Swift::String v75 = v74;
        objc_msgSend(v74, sel_setConstantValue_type_atIndex_, v102, 5, 28);
      }
      unint64_t v17 = 0xD000000000000010;
      uint64_t v49 = "constant_half3x3";
      goto LABEL_95;
    case 21:
      uint64_t v76 = *((void *)&v103 + 1);
      long long v77 = v104;
      *(void *)&v102[0] = v103;
      id v78 = objc_msgSend(v9, sel_constantValues);
      if (v78)
      {
        v79 = v78;
        objc_msgSend(v78, sel_setConstantValue_type_atIndex_, v102, 6, 29);
      }
      *(void *)&v102[0] = v76;
      id v80 = objc_msgSend(v9, sel_constantValues);
      if (v80)
      {
        uint64_t v81 = v80;
        objc_msgSend(v80, sel_setConstantValue_type_atIndex_, v102, 6, 30);
      }
      *(void *)&v102[0] = v77;
      id v82 = objc_msgSend(v9, sel_constantValues);
      if (v82)
      {
        v83 = v82;
        objc_msgSend(v82, sel_setConstantValue_type_atIndex_, v102, 6, 31);
      }
      *(void *)&v102[0] = *((void *)&v77 + 1);
      id v84 = objc_msgSend(v9, sel_constantValues);
      if (v84)
      {
        Swift::String v85 = v84;
        objc_msgSend(v84, sel_setConstantValue_type_atIndex_, v102, 6, 32);
      }
      unint64_t v17 = 0xD000000000000010;
      uint64_t v49 = "constant_half4x4";
LABEL_95:
      unint64_t v18 = (unint64_t)(v49 - 32) | 0x8000000000000000;
      goto LABEL_116;
    default:
      LODWORD(v102[0]) = v103 & 1;
      id v15 = objc_msgSend(v9, sel_constantValues);
      if (v15)
      {
        unint64_t v16 = v15;
        objc_msgSend(v15, sel_setConstantValue_type_atIndex_, v102, 53, 0);
      }
      unint64_t v17 = 0x746E6174736E6F63;
      unint64_t v18 = 0xED00006C6F6F625FLL;
      goto LABEL_116;
  }
}

uint64_t specialized closure #3 in closure #3 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(uint64_t a1, uint64_t *a2, void *a3, void *a4, uint64_t *a5, void *a6, void *a7, unint64_t a8)
{
  void *(*v77)(_OWORD *__return_ptr);
  long long v78;
  long long v79;
  long long v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned char v87[40];
  _OWORD v88[3];
  uint64_t v89;
  uint64_t v90;
  char v91;
  void v92[10];
  _OWORD v93[3];
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t *v98;

  long long v98 = a5;
  id v15 = (void *)a1;
  outlined init with copy of MetalFunctionNode(a1, (uint64_t)v87);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
  type metadata accessor for MetalFunctionParameterNode();
  if (swift_dynamicCast()) {
    goto LABEL_3;
  }
  type metadata accessor for MetalFunctionDefinitionNode();
  if (swift_dynamicCast()) {
    goto LABEL_3;
  }
  type metadata accessor for MetalLiteralValueNode();
  if (!swift_dynamicCast())
  {
    type metadata accessor for MetalFunctionCallNode();
    if (!swift_dynamicCast())
    {
LABEL_14:
      __swift_project_boxed_opaque_existential_1(v15, v15[3]);
      swift_getDynamicType();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode.Type);
      uint64_t v40 = String.init<A>(describing:)();
      uint64_t v42 = v41;
      lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
      swift_allocError();
      *(void *)uint64_t v43 = v40;
      *(void *)(v43 + 8) = v42;
      *(unsigned char *)(v43 + 16) = 1;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
    }
    uint64_t v81 = a7;
    uint64_t v30 = *(void *)(v84 + 56);
    uint64_t v31 = *(void *)(v84 + 64);
    uint64_t v32 = *v98;
    uint64_t v33 = (void *)v98[1];
    uint64_t v34 = v98[2];
    swift_bridgeObjectRetain_n();
    uint64_t v35 = specialized OrderedSet._find(_:)(v30, v31, v32, v33);
    v83 = a6;
    id v82 = v30;
    if (v36)
    {
      swift_bridgeObjectRelease();
      id v58 = (void *)MEMORY[0x261183E60](v30, v31);
      id v59 = objc_msgSend(a4, sel_newFunctionWithName_, v58);

      uint64_t v60 = v30;
      if (v59)
      {
        uint64_t v39 = v84;
      }
      else
      {
        swift_bridgeObjectRetain();
        id v59 = specialized Sequence.reduce<A>(into:_:)(0, a8, v30, v31);
        swift_bridgeObjectRelease();
        uint64_t v39 = v84;
        if (!v59)
        {
          lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
          swift_allocError();
          *(void *)uint64_t v75 = v60;
          *(void *)(v75 + 8) = v31;
          *(unsigned char *)(v75 + 16) = 0;
          goto LABEL_32;
        }
      }
      swift_bridgeObjectRetain();
      uint64_t v38 = specialized OrderedDictionary.subscript.setter((uint64_t)v59, v60, v31);
    }
    else
    {
      id v15 = (void *)v35;
      if (v35 < 0)
      {
        __break(1u);
        goto LABEL_38;
      }
      unint64_t v37 = *(void *)(v34 + 16);
      uint64_t v38 = swift_bridgeObjectRelease();
      uint64_t v39 = v84;
      if ((unint64_t)v15 >= v37)
      {
        __break(1u);
        goto LABEL_14;
      }
    }
    int v61 = *(uint64_t (**)(uint64_t))(*(void *)v39 + 152);
    uint64_t v62 = v61(v38);
    unint64_t v63 = specialized Sequence.compactMap<A>(_:)(v62, v83);
    uint64_t v64 = swift_bridgeObjectRelease();
    if (v63 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v65 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v64 = swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v65 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v66 = *(void *)(v61(v64) + 16);
    swift_bridgeObjectRelease();
    if (v65 == v66)
    {
      id v67 = objc_allocWithZone(MEMORY[0x263F128D0]);
      uint64_t v68 = (void *)MEMORY[0x261183E60](v82, v31);
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionStitchingNode);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for MTLFunctionStitchingFunctionNode);
      Class v70 = Array._bridgeToObjectiveC()().super.isa;
      id v71 = objc_msgSend(v67, sel_initWithName_arguments_controlDependencies_, v68, isa, v70);

      uint64_t v72 = (*(uint64_t (**)(void))(*(void *)v39 + 128))();
      id v73 = v71;
      specialized OrderedDictionary.subscript.setter((uint64_t)v71, v72);
      id v15 = v73;
      MEMORY[0x261184120]();
      if (*(void *)((*v81 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      {
LABEL_30:
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_release();

        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
      }
LABEL_38:
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
    swift_allocError();
    *(void *)uint64_t v74 = v82;
    *(void *)(v74 + 8) = v31;
    *(unsigned char *)(v74 + 16) = 5;
LABEL_32:
    swift_willThrow();
    goto LABEL_3;
  }
  long long v77 = *(void *(**)(_OWORD *__return_ptr))(*(void *)v86 + 224);
  unint64_t v17 = v77(v88);
  v79 = v88[1];
  id v80 = v88[0];
  id v78 = v88[2];
  uint64_t v19 = v89;
  uint64_t v18 = v90;
  uint64_t v20 = a7;
  char v21 = v91;
  uint64_t v76 = *(uint64_t (**)(void *))(*(void *)v86 + 176);
  uint64_t v22 = v76(v17);
  uint64_t v23 = *a2;
  v93[0] = v80;
  v93[1] = v79;
  v93[2] = v78;
  long long v94 = v19;
  long long v95 = v18;
  long long v96 = v21;
  long long v24 = v20;
  long long v97 = v22;
  if (*(void *)(v23 + 16))
  {
    outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined copy of SGDataTypeStorage);
    swift_retain();
    uint64_t v25 = specialized __RawDictionaryStorage.find<A>(_:)(v93);
    if (v26)
    {
      id v27 = (unint64_t *)(*(void *)(v23 + 56) + 16 * v25);
      unint64_t v28 = *v27;
      unint64_t v29 = v27[1];
      swift_bridgeObjectRetain();
      outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
      swift_release();
      goto LABEL_20;
    }
    outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
    swift_release();
  }
  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  v44._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  id object = v44._object;
  String.append(_:)(v44);
  uint64_t v46 = swift_bridgeObjectRelease();
  if (__OFADD__(*a3, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  unint64_t v28 = 0xD000000000000010;
  unint64_t v29 = 0x800000025C427B60;
  ++*a3;
  id v47 = ((void *(*)(void *__return_ptr, uint64_t))v77)(v92, v46);
  uint64_t v48 = v76(v47);
  specialized MetalStitchingBackend.constantFunction(for:name:type:library:)((uint64_t)v92, 0xD000000000000010, 0x800000025C427B60, v48, a4);
  if (!v8)
  {
    swift_release();
    outlined retain of SGDataTypeStorage((uint64_t)v92, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
    swift_bridgeObjectRetain();
    uint64_t v49 = swift_unknownObjectRetain();
    specialized OrderedDictionary.subscript.setter(v49, 0xD000000000000010, 0x800000025C427B60);
    outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined copy of SGDataTypeStorage);
    swift_retain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::String v85 = *a2;
    *a2 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(0xD000000000000010, 0x800000025C427B60, v93, isUniquelyReferenced_nonNull_native);
    *a2 = v85;
    swift_bridgeObjectRelease();
    outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
    swift_unknownObjectRelease();
    swift_release();
LABEL_20:
    id v51 = objc_allocWithZone(MEMORY[0x263F128D0]);
    id v52 = (void *)MEMORY[0x261183E60](v28, v29);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionStitchingNode);
    Class v53 = Array._bridgeToObjectiveC()().super.isa;
    type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for MTLFunctionStitchingFunctionNode);
    Class v54 = Array._bridgeToObjectiveC()().super.isa;
    id v55 = objc_msgSend(v51, sel_initWithName_arguments_controlDependencies_, v52, v53, v54);

    uint64_t v56 = (*(uint64_t (**)(void))(*(void *)v86 + 128))();
    id v57 = v55;
    specialized OrderedDictionary.subscript.setter((uint64_t)v55, v56);
    id object = v57;
    MEMORY[0x261184120]();
    if (*(void *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_21:
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
      swift_release();

      goto LABEL_3;
    }
LABEL_35:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  outlined retain of SGDataTypeStorage((uint64_t)v88, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
  swift_release();
  swift_release();
  outlined retain of SGDataTypeStorage((uint64_t)v92, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
LABEL_3:
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v87);
}

void specialized closure #4 in closure #3 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(id *a1, uint64_t a2)
{
  unint64_t v3 = (unint64_t)*a1;
  id v4 = objc_msgSend(*a1, sel_name);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  uint64_t v8 = *(void *)(a2 + 16);
  unint64_t v9 = specialized OrderedSet._find(_:)(v5, v7, *(void *)a2, *(void **)(a2 + 8));
  if (v10)
  {
    swift_bridgeObjectRelease();
    return;
  }
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v9 >= *(void *)(v8 + 16))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  a2 = *(void *)(v8 + 8 * v9 + 32);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = specialized MetalStitchingBackend.mtlFunctionHash(_:)();
  if (!v12)
  {
    if (one-time initialization token for logger == -1) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  _StringGuts.grow(_:)(18);
  id v47 = objc_msgSend((id)v3, sel_hash);
  uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
  unint64_t v17 = v16;
  swift_bridgeObjectRelease();
  v46._countAndFlagsBits = v15;
  v46._id object = v17;
  v18._countAndFlagsBits = 2128928;
  v18._id object = (void *)0xE300000000000000;
  String.append(_:)(v18);
  id v19 = objc_msgSend((id)v3, sel_name);
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  v23._countAndFlagsBits = v20;
  v23._id object = v22;
  String.append(_:)(v23);
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 2128928;
  v24._id object = (void *)0xE300000000000000;
  String.append(_:)(v24);
  v25._countAndFlagsBits = v13;
  v25._id object = v14;
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 2128928;
  v26._id object = (void *)0xE300000000000000;
  String.append(_:)(v26);
  id v27 = objc_msgSend((id)v3, sel_arguments);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MTLFunctionStitchingNode);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v3 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_7;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v30 = (void *)MEMORY[0x263F8EE78];
LABEL_25:
    v44._countAndFlagsBits = MEMORY[0x261184160](v30, MEMORY[0x263F8D6C8]);
    String.append(_:)(v44);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45._countAndFlagsBits = 10;
    v45._id object = (void *)0xE100000000000000;
    String.append(_:)(v45);
    String.append(_:)(v46);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v28 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v28) {
    goto LABEL_24;
  }
LABEL_7:
  id v47 = (void *)MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28 & ~(v28 >> 63), 0);
  if ((v28 & 0x8000000000000000) == 0)
  {
    uint64_t v29 = 0;
    uint64_t v30 = v47;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v31 = (void *)MEMORY[0x2611848A0](v29, v3);
      }
      else
      {
        uint64_t v31 = *(void **)(v3 + 8 * v29 + 32);
        swift_unknownObjectRetain();
      }
      id v32 = objc_msgSend(v31, sel_hash);
      swift_unknownObjectRelease();
      id v47 = v30;
      unint64_t v34 = v30[2];
      unint64_t v33 = v30[3];
      if (v34 >= v33 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
        uint64_t v30 = v47;
      }
      ++v29;
      v30[2] = v34 + 1;
      v30[v34 + 4] = v32;
    }
    while (v28 != v29);
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  swift_once();
LABEL_18:
  uint64_t v35 = type metadata accessor for Logger();
  __swift_project_value_buffer(v35, (uint64_t)logger);
  swift_unknownObjectRetain_n();
  char v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v46._countAndFlagsBits = v39;
    *(_DWORD *)uint64_t v38 = 136315138;
    id v40 = objc_msgSend((id)a2, sel_name);
    uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v43 = v42;

    id v47 = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v43, &v46._countAndFlagsBits);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C27E000, v36, v37, "Unable to obtain hash for function %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x261185880](v39, -1, -1);
    MEMORY[0x261185880](v38, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
}

uint64_t specialized closure #3 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(uint64_t *a1, uint64_t a2, uint64_t *a3, void *a4, void *a5, unint64_t a6, unint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v14 = *a1;
  uint64_t v15 = type metadata accessor for MetalFunctionDefinitionNode();
  uint64_t v114 = v15;
  Swift::String v115 = &protocol witness table for MetalFunctionDefinitionNode;
  v113._countAndFlagsBits = v14;
  swift_retain();
  uint64_t v16 = MetalShaderProgram.topologicalSort(from:)(&v113);
  if (v9) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v113);
  }
  uint64_t v18 = v16;
  uint64_t v106 = v15;
  uint64_t v108 = a4;
  v109 = a3;
  uint64_t v102 = a5;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v113);
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v116 = specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(MEMORY[0x263F8EE78]);
  uint64_t v117 = v20;
  uint64_t v118 = v21;
  unint64_t v119 = v19;
  uint64_t v22 = (*(uint64_t (**)(void))(*(void *)v14 + 256))();
  unint64_t v23 = specialized Dictionary.init(dictionaryLiteral:)(v19);
  countAndFlagsBits = (void *)v23;
  unint64_t v111 = *(void *)(v22 + 16);
  uint64_t v104 = v14;
  long long v103 = (uint64_t *)a6;
  uint64_t v105 = v18;
  if (v111)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = 0;
    Swift::String v26 = (void *)(v22 + 48);
    while (1)
    {
      uint64_t v28 = *(v26 - 2);
      uint64_t v29 = *(v26 - 1);
      uint64_t v30 = (void *)*v26;
      id v31 = objc_allocWithZone(MEMORY[0x263F128E0]);
      swift_bridgeObjectRetain();
      uint64_t v112 = v30;
      swift_retain();
      id v32 = objc_msgSend(v31, sel_initWithArgumentIndex_, v25);
      swift_bridgeObjectRetain();
      id v33 = v32;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v113._countAndFlagsBits = (uint64_t)countAndFlagsBits;
      unint64_t v36 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v29);
      uint64_t v37 = countAndFlagsBits[2];
      BOOL v38 = (v35 & 1) == 0;
      uint64_t v39 = v37 + v38;
      if (__OFADD__(v37, v38))
      {
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      a6 = v35;
      if (countAndFlagsBits[3] >= v39)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          countAndFlagsBits = (void *)v113._countAndFlagsBits;
          if ((v35 & 1) == 0) {
            goto LABEL_14;
          }
        }
        else
        {
          specialized _NativeDictionary.copy()();
          countAndFlagsBits = (void *)v113._countAndFlagsBits;
          if ((a6 & 1) == 0) {
            goto LABEL_14;
          }
        }
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v39, isUniquelyReferenced_nonNull_native);
        unint64_t v40 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v29);
        if ((a6 & 1) != (v41 & 1)) {
          goto LABEL_113;
        }
        unint64_t v36 = v40;
        countAndFlagsBits = (void *)v113._countAndFlagsBits;
        if ((a6 & 1) == 0)
        {
LABEL_14:
          countAndFlagsBits[(v36 >> 6) + 8] |= 1 << v36;
          unint64_t v42 = (uint64_t *)(countAndFlagsBits[6] + 16 * v36);
          *unint64_t v42 = v28;
          v42[1] = v29;
          *(void *)(countAndFlagsBits[7] + 8 * v36) = v33;
          uint64_t v43 = countAndFlagsBits[2];
          BOOL v44 = __OFADD__(v43, 1);
          uint64_t v45 = v43 + 1;
          if (v44) {
            goto LABEL_65;
          }
          countAndFlagsBits[2] = v45;
          swift_bridgeObjectRetain();
          goto LABEL_6;
        }
      }
      uint64_t v27 = countAndFlagsBits[7];

      *(void *)(v27 + 8 * v36) = v33;
LABEL_6:
      swift_release();

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      ++v25;
      v26 += 3;
      if (v111 == v25)
      {
        uint64_t v112 = countAndFlagsBits;
        swift_bridgeObjectRelease();
        uint64_t v14 = v104;
        goto LABEL_20;
      }
    }
  }
  uint64_t v112 = (void *)v23;
LABEL_20:
  swift_bridgeObjectRelease();
  uint64_t v114 = v106;
  Swift::String v115 = &protocol witness table for MetalFunctionDefinitionNode;
  v113._countAndFlagsBits = v14;
  swift_retain();
  a6 = MetalShaderProgram.parameterNodes(connectedTo:)(&v113);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v113);
  unint64_t v111 = a6 >> 62;
  if (a6 >> 62)
  {
LABEL_67:
    swift_bridgeObjectRetain();
    uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();
    id v47 = v108;
    if (v46)
    {
LABEL_22:
      if ((a6 & 0xC000000000000001) != 0) {
        goto LABEL_108;
      }
      uint64_t v48 = *(void *)(a6 + 32);
      uint64_t v49 = swift_retain();
LABEL_24:
      uint64_t v50 = (*(uint64_t (**)(uint64_t))(*(void *)v48 + 192))(v49);
      if (v112[2])
      {
        unint64_t v52 = specialized __RawDictionaryStorage.find<A>(_:)(v50, v51);
        if (v53)
        {
          uint64_t v107 = v46;
          uint64_t v54 = 1;
          id v55 = v112;
          while (1)
          {
            id v56 = *(id *)(v55[7] + 8 * v52);
            uint64_t v57 = swift_bridgeObjectRelease();
            Swift::UInt v58 = (*(uint64_t (**)(uint64_t))(*(void *)v48 + 120))(v57);
            uint64_t v59 = v58;
            uint64_t v60 = v117 + 4;
            uint64_t v61 = v117[2];
            if (v116)
            {
              Swift::Int v62 = specialized _HashTable.UnsafeHandle._find<A>(_:in:)(v58, (uint64_t)v60, v61, (void *)(v116 + 16), v116 + 32);
              if (v64)
              {
                uint64_t v67 = v63;
LABEL_41:
                swift_unknownObjectRetain();
                specialized OrderedSet._appendNew(_:in:)(v59, v67);
                swift_unknownObjectRetain();
                specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                goto LABEL_42;
              }
              unint64_t v65 = v62;
            }
            else
            {
              if (!v61) {
                goto LABEL_40;
              }
              if (*v60 == v58)
              {
                unint64_t v65 = 0;
              }
              else
              {
                if (v61 == 1) {
                  goto LABEL_40;
                }
                if (v117[5] == v58)
                {
                  unint64_t v65 = 1;
                }
                else
                {
                  if (v61 == 2) {
                    goto LABEL_40;
                  }
                  if (v117[6] == v58)
                  {
                    unint64_t v65 = 2;
                  }
                  else
                  {
                    if (v61 == 3)
                    {
LABEL_40:
                      uint64_t v67 = 0;
                      goto LABEL_41;
                    }
                    if (v117[7] == v58)
                    {
                      unint64_t v65 = 3;
                    }
                    else
                    {
                      uint64_t v71 = 0;
                      do
                      {
                        if (v61 - 4 == v71) {
                          goto LABEL_40;
                        }
                        uint64_t v72 = v117[v71++ + 8];
                      }
                      while (v72 != v58);
                      unint64_t v65 = v71 + 3;
                    }
                  }
                }
              }
            }
            uint64_t v46 = v118;
            id v66 = v56;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v46);
            }
            if ((v65 & 0x8000000000000000) != 0)
            {
              __break(1u);
LABEL_107:
              __break(1u);
LABEL_108:
              uint64_t v49 = MEMORY[0x2611848A0](0, a6);
              uint64_t v48 = v49;
              goto LABEL_24;
            }
            if (v65 >= *(void *)(v46 + 16)) {
              goto LABEL_107;
            }
            swift_unknownObjectRetain();
            swift_unknownObjectRelease();
            *(void *)(v46 + 8 * v65 + 32) = v66;
            uint64_t v46 = v107;
LABEL_42:
            specialized ContiguousArray._endMutation()();

            swift_release();
            id v47 = v108;
            if (v54 == v46) {
              goto LABEL_68;
            }
            if ((a6 & 0xC000000000000001) != 0)
            {
              uint64_t v48 = MEMORY[0x2611848A0](v54, a6);
              BOOL v44 = __OFADD__(v54++, 1);
              if (v44) {
                goto LABEL_66;
              }
            }
            else
            {
              uint64_t v48 = *(void *)(a6 + 32 + 8 * v54);
              swift_retain();
              BOOL v44 = __OFADD__(v54++, 1);
              if (v44) {
                goto LABEL_66;
              }
            }
            uint64_t v68 = (*(uint64_t (**)(void))(*(void *)v48 + 192))();
            if (v112[2])
            {
              unint64_t v52 = specialized __RawDictionaryStorage.find<A>(_:)(v68, v69);
              id v55 = v112;
              if (v70) {
                continue;
              }
            }
            break;
          }
        }
      }
      swift_bridgeObjectRelease();
      lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
      swift_allocError();
      *(_OWORD *)uint64_t v73 = xmmword_25C41BE30;
      *(unsigned char *)(v73 + 16) = 6;
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_release();
LABEL_89:
      swift_bridgeObjectRelease();
      goto LABEL_90;
    }
  }
  else
  {
    uint64_t v46 = *(void *)((a6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    id v47 = v108;
    if (v46) {
      goto LABEL_22;
    }
  }
LABEL_68:
  swift_bridgeObjectRelease();
  uint64_t v74 = *(void *)(v105 + 16);
  if (v74)
  {
    uint64_t v75 = v105 + 32;
    swift_bridgeObjectRetain();
    do
    {
      specialized closure #3 in closure #3 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)(v75, v109, v47, v102, v103, &v116, &v119, a7);
      v75 += 40;
      --v74;
    }
    while (v74);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unint64_t v76 = v119;
  if (v119 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v77 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v77 = *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v78 = *(void *)(v118 + 16);
  if (v111)
  {
    swift_bridgeObjectRetain();
    uint64_t v79 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v79 = *(void *)((a6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (__OFSUB__(v78, v79))
  {
    __break(1u);
  }
  else
  {
    if (v77 != v78 - v79)
    {
      lazy protocol witness table accessor for type MetalStitchingBackendErrors and conformance MetalStitchingBackendErrors();
      swift_allocError();
      *(_OWORD *)uint64_t v86 = xmmword_25C41C010;
      *(unsigned char *)(v86 + 16) = 6;
      swift_willThrow();
      swift_bridgeObjectRelease();
      goto LABEL_89;
    }
    if (one-time initialization token for debugMode == -1) {
      goto LABEL_82;
    }
  }
  swift_once();
LABEL_82:
  swift_beginAccess();
  uint64_t v80 = static DebugConfig.debugMode;
  if (!*(void *)(static DebugConfig.debugMode + 16)) {
    goto LABEL_103;
  }
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v81 = Hasher._finalize()();
  uint64_t v82 = -1 << *(unsigned char *)(v80 + 32);
  unint64_t v83 = v81 & ~v82;
  if (((*(void *)(v80 + 56 + ((v83 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v83) & 1) == 0)
  {
LABEL_88:
    swift_bridgeObjectRelease();
    goto LABEL_103;
  }
  uint64_t v84 = ~v82;
  while (2)
  {
    switch(*(unsigned char *)(*(void *)(v80 + 48) + v83))
    {
      case 3:
        swift_bridgeObjectRelease();
        goto LABEL_92;
      default:
        char v85 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v85 & 1) == 0)
        {
          unint64_t v83 = (v83 + 1) & v84;
          if (((*(void *)(v80 + 56 + ((v83 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v83) & 1) == 0) {
            goto LABEL_88;
          }
          continue;
        }
LABEL_92:
        swift_bridgeObjectRelease();
        uint64_t v87 = *(void **)(v104 + 64);
        v113._countAndFlagsBits = *(void *)(v104 + 56);
        v113._id object = v87;
        swift_bridgeObjectRetain();
        v88._countAndFlagsBits = 10;
        v88._id object = (void *)0xE100000000000000;
        String.append(_:)(v88);
        String.append(_:)(v113);
        swift_bridgeObjectRelease();
        if (v76 >> 62)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v89 = _CocoaArrayWrapper.endIndex.getter();
        }
        else
        {
          uint64_t v89 = *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain_n();
        }
        if (!v89) {
          goto LABEL_102;
        }
        if (v89 < 1)
        {
          __break(1u);
LABEL_113:
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          JUMPOUT(0x25C3F645CLL);
        }
        uint64_t v90 = 0;
        do
        {
          if ((v76 & 0xC000000000000001) != 0) {
            id v91 = (id)MEMORY[0x2611848A0](v90, v76);
          }
          else {
            id v91 = *(id *)(v76 + 8 * v90 + 32);
          }
          id v92 = v91;
          ++v90;
          v113._countAndFlagsBits = (uint64_t)v91;
          specialized closure #4 in closure #3 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)((id *)&v113, (uint64_t)v103);
        }
        while (v89 != v90);
LABEL_102:
        swift_bridgeObjectRelease_n();
        v93._countAndFlagsBits = 10;
        v93._id object = (void *)0xE100000000000000;
        String.append(_:)(v93);
LABEL_103:
        uint64_t v94 = *(void *)(v104 + 56);
        uint64_t v95 = *(void *)(v104 + 64);
        id v96 = objc_allocWithZone(MEMORY[0x263F128D8]);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        long long v97 = (void *)MEMORY[0x261183E60](v94, v95);
        swift_bridgeObjectRelease();
        type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for MTLFunctionStitchingFunctionNode);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for MTLFunctionStitchingAttribute);
        Class v99 = Array._bridgeToObjectiveC()().super.isa;
        id v100 = objc_msgSend(v96, sel_initWithFunctionName_nodes_outputNode_attributes_, v97, isa, 0, v99);

        id v101 = v100;
        MEMORY[0x261184120]();
        if (*(void *)((*a9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

LABEL_90:
        swift_release();
        swift_release();
        return swift_release();
    }
  }
}

ValueMetadata *type metadata accessor for ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)()
{
  return &type metadata for ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:);
}

unint64_t lazy protocol witness table accessor for type ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:) and conformance ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:)()
{
  unint64_t result = lazy protocol witness table cache variable for type ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:) and conformance ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:);
  if (!lazy protocol witness table cache variable for type ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:) and conformance ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:))
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:) and conformance ConstantKey #1 in MetalStitchingBackend.stitchingGraphs(for:augmenting:coreLibrary:additionalLibraries:));
  }
  return result;
}

uint64_t OrderedSet.SubSequence._slice.getter()
{
  return ContiguousArray.subscript.getter();
}

uint64_t OrderedSet.SubSequence._base.getter(uint64_t a1)
{
  return a1;
}

uint64_t OrderedSet.SubSequence._base.setter(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t result = swift_release();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*OrderedSet.SubSequence._base.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t OrderedSet.SubSequence._bounds.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t OrderedSet.SubSequence._bounds.setter(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 16) = result;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*OrderedSet.SubSequence._bounds.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t OrderedSet.SubSequence._index(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = OrderedSet._find(_:)();
  if (result < a4 || result >= a5) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = result;
  }
  if ((v8 & 1) == 0) {
    return v11;
  }
  return result;
}

BOOL OrderedSet.SubSequence._customContainsEquatableElement(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = OrderedSet._find(_:)();
  return (v8 & 1) == 0 && v7 >= a4 && v7 < a5;
}

uint64_t OrderedSet.SubSequence._copyToContiguousArray()()
{
  uint64_t v0 = specialized OrderedSet.SubSequence._copyToContiguousArray()();
  swift_release();
  swift_release();
  return v0;
}

uint64_t OrderedSet.SubSequence._copyContents(initializing:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, void *a5@<X8>)
{
  uint64_t v10 = 0;
  uint64_t v11 = a3;
  if (a3 != a4
    && (uint64_t v12 = ContiguousArray.subscript.getter(),
        v14[1] = v14,
        MEMORY[0x270FA5388](v12),
        ArraySlice.withUnsafeBufferPointer<A>(_:)(),
        uint64_t result = swift_unknownObjectRelease(),
        uint64_t v10 = v15,
        uint64_t v11 = a3 + v15,
        __OFADD__(a3, v15)))
  {
    __break(1u);
  }
  else
  {
    *a5 = a1;
    a5[1] = a2;
    a5[2] = a3;
    a5[3] = a4;
    a5[4] = v11;
    a5[5] = v10;
  }
  return result;
}

BOOL OrderedSet.SubSequence.isEmpty.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a3 == a4;
}

uint64_t closure #1 in OrderedSet.SubSequence._copyContents(initializing:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t result = UnsafeBufferPointer.baseAddress.getter();
  if (result)
  {
    if (a2 >= a1) {
      a2 = a1;
    }
    if (a2 < 1) {
      goto LABEL_7;
    }
    uint64_t result = UnsafeBufferPointer.baseAddress.getter();
    if (result)
    {
      uint64_t result = UnsafeMutablePointer.initialize(from:count:)();
LABEL_7:
      *a3 = a2;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t OrderedSet.SubSequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return swift_unknownObjectRelease();
}

__n128 protocol witness for Sequence.makeIterator() in conformance OrderedSet<A>.SubSequence@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1->n128_u64[1];
  a1->n128_u64[0] = v1->n128_u64[0];
  a1->n128_u64[1] = v2;
  __n128 result = v1[1];
  a1[1] = result;
  a1[2].n128_u64[0] = result.n128_u64[0];
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance OrderedSet<A>.SubSequence(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

BOOL protocol witness for Sequence._customContainsEquatableElement(_:) in conformance OrderedSet<A>.SubSequence(uint64_t a1)
{
  return OrderedSet.SubSequence._customContainsEquatableElement(_:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance OrderedSet<A>.SubSequence()
{
  uint64_t v0 = specialized OrderedSet.SubSequence._copyToContiguousArray()();
  swift_release();
  swift_release();
  return v0;
}

__n128 protocol witness for Sequence._copyContents(initializing:) in conformance OrderedSet<A>.SubSequence(__n128 *a1)
{
  OrderedSet.SubSequence._copyContents(initializing:)(*v1, v1[1], v1[2], v1[3], v6);
  unint64_t v3 = v6[1];
  unint64_t v4 = v8;
  __n128 result = v7;
  a1->n128_u64[0] = v6[0];
  a1->n128_u64[1] = v3;
  a1[1] = result;
  a1[2].n128_u64[0] = v4;
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance OrderedSet<A>.SubSequence()
{
  return OrderedSet.SubSequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t OrderedSet.SubSequence.startIndex.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t OrderedSet.SubSequence.endIndex.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t OrderedSet.SubSequence.indices.getter()
{
  ContiguousArray.subscript.getter();
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  RandomAccessCollection<>.indices.getter();
  swift_unknownObjectRelease();
  return v1;
}

Swift::Int __swiftcall OrderedSet.SubSequence.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall OrderedSet.SubSequence.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall OrderedSet.SubSequence.formIndex(after:)(Swift::Int *after)
{
  if (__OFADD__(*after, 1)) {
    __break(1u);
  }
  else {
    ++*after;
  }
}

Swift::Void __swiftcall OrderedSet.SubSequence.formIndex(before:)(Swift::Int *before)
{
  if (__OFSUB__(*before, 1)) {
    __break(1u);
  }
  else {
    --*before;
  }
}

Swift::Int __swiftcall OrderedSet.SubSequence.index(_:offsetBy:)(Swift::Int _, Swift::Int offsetBy)
{
  BOOL v2 = __OFADD__(_, offsetBy);
  Swift::Int result = _ + offsetBy;
  if (v2) {
    __break(1u);
  }
  return result;
}

Swift::Int_optional __swiftcall OrderedSet.SubSequence.index(_:offsetBy:limitedBy:)(Swift::Int _, Swift::Int offsetBy, Swift::Int limitedBy)
{
  ContiguousArray.subscript.getter();
  Swift::Int v6 = swift_unknownObjectRelease();
  Swift::Int v8 = limitedBy - _;
  if (__OFSUB__(limitedBy, _))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (offsetBy < 1)
  {
    if (v8 > 0 || v8 <= offsetBy)
    {
LABEL_9:
      Swift::Int v6 = _ + offsetBy;
      if (!__OFADD__(_, offsetBy))
      {
        Swift::Bool v7 = 0;
        goto LABEL_13;
      }
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
  }
  else if (v8 < 0 || v8 >= (unint64_t)offsetBy)
  {
    goto LABEL_9;
  }
  Swift::Int v6 = 0;
  Swift::Bool v7 = 1;
LABEL_13:
  result.value = v6;
  result.is_nil = v7;
  return result;
}

Swift::Int __swiftcall OrderedSet.SubSequence.distance(from:to:)(Swift::Int from, Swift::Int to)
{
  BOOL v2 = __OFSUB__(to, from);
  Swift::Int result = to - from;
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t OrderedSet.SubSequence.subscript.getter()
{
  ContiguousArray.subscript.getter();
  ArraySlice.subscript.getter();
  return swift_unknownObjectRelease();
}

uint64_t OrderedSet.SubSequence.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6 < a5)
  {
    __break(1u);
  }
  else
  {
    ContiguousArray.subscript.getter();
    swift_unknownObjectRelease();
    swift_retain();
    swift_retain();
    return a3;
  }
  return result;
}

uint64_t OrderedSet.SubSequence._failEarlyRangeCheck(_:bounds:)()
{
  ContiguousArray.subscript.getter();
  return swift_unknownObjectRelease();
}

{
  uint64_t vars8;

  ContiguousArray.subscript.getter();
  return swift_unknownObjectRelease();
}

uint64_t OrderedSet.SubSequence.count.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = a4 - a3;
  if (__OFSUB__(a4, a3)) {
    __break(1u);
  }
  return result;
}

uint64_t OrderedSet.SubSequence._customIndexOfEquatableElement(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = OrderedSet._find(_:)();
  if (result < a4 || result >= a5) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = result;
  }
  if ((v8 & 1) == 0) {
    return v11;
  }
  return result;
}

uint64_t OrderedSet.SubSequence._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ContiguousArray.subscript.getter();
  v7[1] = a3;
  uint64_t v8 = a1;
  v7[0] = a2;
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  specialized Collection._failEarlyRangeCheck(_:bounds:)((uint64_t)&v8, (uint64_t)v7);
  return swift_unknownObjectRelease();
}

void protocol witness for Collection.startIndex.getter in conformance OrderedSet<A>.SubSequence(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

void (*protocol witness for Collection.subscript.read in conformance OrderedSet<A>.SubSequence(void *a1, uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v3 = *(void *)(a3 + 16);
  *a1 = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  a1[1] = v4;
  a1[2] = malloc(*(void *)(v4 + 64));
  OrderedSet.SubSequence._slice.getter();
  ArraySlice.subscript.getter();
  swift_unknownObjectRelease();
  return protocol witness for Collection.subscript.read in conformance OrderedDictionary<A, B>.Values;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance OrderedSet<A>.SubSequence@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  if (v2[3] < v2[2])
  {
    __break(1u);
  }
  else
  {
    Swift::Int v6 = v2;
    uint64_t v4 = *v2;
    uint64_t v5 = v6[1];
    uint64_t v8 = *result;
    uint64_t v7 = result[1];
    OrderedSet.SubSequence._slice.getter();
    swift_unknownObjectRelease();
    *a2 = v4;
    a2[1] = v5;
    a2[2] = v8;
    a2[3] = v7;
    swift_retain();
    return (uint64_t *)swift_retain();
  }
  return result;
}

double protocol witness for Collection.indices.getter in conformance OrderedSet<A>.SubSequence@<D0>(_OWORD *a1@<X8>)
{
  OrderedSet.SubSequence._slice.getter();
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  RandomAccessCollection<>.indices.getter();
  swift_unknownObjectRelease();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance OrderedSet<A>.SubSequence()
{
  return *(void *)(v0 + 16) == *(void *)(v0 + 24);
}

uint64_t protocol witness for Collection.count.getter in conformance OrderedSet<A>.SubSequence()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t result = v2 - v1;
  if (__OFSUB__(v2, v1)) {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance OrderedSet<A>.SubSequence@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = OrderedSet.SubSequence._index(of:)(a1, *v2, v2[1], v2[2], v2[3]);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v5 & 1;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance OrderedSet<A>.SubSequence@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a3;
  OrderedSet.SubSequence._slice.getter();
  uint64_t v8 = specialized ContiguousArray.index(_:offsetBy:limitedBy:)(v6, a2, v7);
  LOBYTE(v6) = v9;
  uint64_t result = swift_unknownObjectRelease();
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance OrderedSet<A>.SubSequence()
{
  OrderedSet.SubSequence._slice.getter();
  return swift_unknownObjectRelease();
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance OrderedSet<A>.SubSequence(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  OrderedSet.SubSequence._slice.getter();
  v6[1] = v4;
  uint64_t v7 = v2;
  v6[0] = v3;
  type metadata accessor for ArraySlice();
  swift_getWitnessTable();
  specialized Collection._failEarlyRangeCheck(_:bounds:)((uint64_t)&v7, (uint64_t)v6);
  return swift_unknownObjectRelease();
}

uint64_t static OrderedSet.SubSequence.== infix(_:_:)()
{
  return Sequence<>.elementsEqual<A>(_:)() & 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance OrderedSet<A>.SubSequence()
{
  return static OrderedSet.SubSequence.== infix(_:_:)() & 1;
}

void OrderedSet.SubSequence.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__OFSUB__(v12, v11))
  {
    __break(1u);
    goto LABEL_9;
  }
  Hasher._combine(_:)(v12 - v11);
  if (a4 == a5) {
    return;
  }
  if (a4 >= a5)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v15 = a2;
  uint64_t v16 = (void (**)(char *, uint64_t))(v10 + 8);
  v18[1] = v15;
  swift_retain();
  swift_retain();
  uint64_t v17 = a4;
  do
  {
    ContiguousArray.subscript.getter();
    ArraySlice.subscript.getter();
    swift_unknownObjectRelease();
    ++v17;
    dispatch thunk of Hashable.hash(into:)();
    (*v16)(v14, a6);
  }
  while (a5 != v17);
  swift_release();
  swift_release();
}

Swift::Int OrderedSet.SubSequence.hashValue.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  Hasher.init(_seed:)();
  OrderedSet.SubSequence.hash(into:)((uint64_t)v11, a1, a2, a3, a4, a5);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance OrderedSet<A>.SubSequence(uint64_t a1)
{
  return OrderedSet.SubSequence.hashValue.getter(*v1, v1[1], v1[2], v1[3], *(void *)(a1 + 16));
}

void protocol witness for Hashable.hash(into:) in conformance OrderedSet<A>.SubSequence(uint64_t a1, uint64_t a2)
{
  OrderedSet.SubSequence.hash(into:)(a1, *v2, v2[1], v2[2], v2[3], *(void *)(a2 + 16));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance OrderedSet<A>.SubSequence(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  OrderedSet.SubSequence.hash(into:)((uint64_t)v5, *v2, v2[1], v2[2], v2[3], *(void *)(a2 + 16));
  return Hasher._finalize()();
}

uint64_t specialized OrderedSet.SubSequence._copyToContiguousArray()()
{
  uint64_t v0 = ContiguousArray.subscript.getter();
  return MEMORY[0x270F9E6B8](v0);
}

uint64_t partial apply for closure #1 in OrderedSet.SubSequence._copyContents(initializing:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  return closure #1 in OrderedSet.SubSequence._copyContents(initializing:)(a1, *(void *)(v2 + 40), a2);
}

uint64_t type metadata accessor for OrderedSet.SubSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t base witness table accessor for BidirectionalCollection in OrderedSet<A>.SubSequence()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in OrderedSet<A>.SubSequence()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Collection in OrderedSet<A>.SubSequence()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Sequence in OrderedSet<A>.SubSequence()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Equatable in OrderedSet<A>.SubSequence()
{
  return swift_getWitnessTable();
}

uint64_t initializeWithCopy for OrderedSet.SubSequence(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for OrderedSet.SubSequence(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

_OWORD *assignWithTake for OrderedSet.SubSequence(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

unint64_t MetalFunctionGraphError.description.getter()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  switch(*(unsigned char *)(v0 + 32))
  {
    case 1:
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      unint64_t v28 = 0xD000000000000024;
      v11._countAndFlagsBits = v1;
      v11._id object = (void *)v2;
      String.append(_:)(v11);
      outlined consume of MetalFunctionGraphError.ErrorType(v1, v2, v3, v4, 1);
      unint64_t v9 = 8231;
      unint64_t v10 = 0xE200000000000000;
      goto LABEL_5;
    case 2:
      _StringGuts.grow(_:)(47);
      swift_bridgeObjectRelease();
      unint64_t v28 = 0xD000000000000018;
      v12._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      unint64_t v9 = 0xD000000000000013;
      unint64_t v10 = 0x800000025C427CE0;
      goto LABEL_5;
    case 3:
      swift_bridgeObjectRetain();
      swift_retain();
      _StringGuts.grow(_:)(40);
      swift_bridgeObjectRelease();
      unint64_t v28 = 0x79747265706F7250;
      v16._countAndFlagsBits = v1;
      v16._id object = (void *)v2;
      String.append(_:)(v16);
      swift_bridgeObjectRelease();
      v17._countAndFlagsBits = 0xD000000000000015;
      v17._id object = (void *)0x800000025C427CA0;
      String.append(_:)(v17);
      uint64_t v18 = *(void *)(v3 + 24);
      uint64_t v19 = *(void **)(v3 + 32);
      swift_bridgeObjectRetain();
      v20._countAndFlagsBits = v18;
      v20._id object = v19;
      String.append(_:)(v20);
      swift_bridgeObjectRelease();
      v21._countAndFlagsBits = 2108967;
      v21._id object = (void *)0xE300000000000000;
      String.append(_:)(v21);
      if (*(void *)(v0 + 48))
      {
        swift_bridgeObjectRetain_n();
        uint64_t v22 = String.init<A>(describing:)();
        unint64_t v24 = v23;
      }
      else
      {
        uint64_t v22 = 0x3E6C696E3CLL;
        unint64_t v24 = 0xE500000000000000;
      }
      unint64_t v26 = v24;
      String.append(_:)(*(Swift::String *)&v22);
      swift_release();
      goto LABEL_20;
    case 4:
      if (!(v3 | v2 | v1 | v4)) {
        return 0xD00000000000002BLL;
      }
      if (v1 == 1 && !(v3 | v2 | v4)) {
        return 0xD000000000000020;
      }
      _StringGuts.grow(_:)(17);
      swift_bridgeObjectRelease();
      unint64_t v28 = 0x206E776F6E6B6E55;
      if (*(void *)(v0 + 48))
      {
LABEL_6:
        swift_bridgeObjectRetain_n();
        uint64_t v13 = String.init<A>(describing:)();
        unint64_t v15 = v14;
      }
      else
      {
LABEL_18:
        uint64_t v13 = 0x3E6C696E3CLL;
        unint64_t v15 = 0xE500000000000000;
      }
      unint64_t v27 = v15;
      String.append(_:)(*(Swift::String *)&v13);
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v28;
    default:
      unint64_t v28 = 0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(53);
      v5._countAndFlagsBits = 0xD00000000000001BLL;
      v5._id object = (void *)0x800000025C427D30;
      String.append(_:)(v5);
      v6._countAndFlagsBits = v1;
      v6._id object = (void *)v2;
      String.append(_:)(v6);
      swift_bridgeObjectRelease();
      v7._id object = (void *)0x800000025C427D50;
      v7._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v7);
      v8._countAndFlagsBits = v3;
      v8._id object = (void *)v4;
      String.append(_:)(v8);
      swift_bridgeObjectRelease();
      unint64_t v9 = 2108967;
      unint64_t v10 = 0xE300000000000000;
LABEL_5:
      String.append(_:)(*(Swift::String *)&v9);
      if (*(void *)(v0 + 48)) {
        goto LABEL_6;
      }
      goto LABEL_18;
  }
}

double MetalFunctionGraphError.init(_:details:underlyingErrors:)@<D0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  outlined init with take of MetalFunctionGraphError.ErrorType(a1, (uint64_t)v12);
  char v9 = v13;
  double result = *(double *)v12;
  long long v11 = v12[1];
  *(_OWORD *)a5 = v12[0];
  *(_OWORD *)(a5 + 16) = v11;
  *(unsigned char *)(a5 + 32) = v9;
  *(void *)(a5 + 40) = a2;
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = a4;
  return result;
}

uint64_t outlined init with take of MetalFunctionGraphError.ErrorType(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t MetalFunctionGraphError.type.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of MetalFunctionGraphError.ErrorType(v1, a1);
}

uint64_t outlined init with copy of MetalFunctionGraphError.ErrorType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  char v7 = *(unsigned char *)(a1 + 32);
  outlined copy of MetalFunctionGraphError.ErrorType(*(void *)a1, v4, v5, v6, v7);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(unsigned char *)(a2 + 32) = v7;
  return a2;
}

uint64_t MetalFunctionGraphError.details.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MetalFunctionGraphError.underlyingErrors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for MetalFunctionGraphError(uint64_t a1)
{
  outlined consume of MetalFunctionGraphError.ErrorType(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MetalFunctionGraphError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  outlined copy of MetalFunctionGraphError.ErrorType(*(void *)a2, v5, v6, v7, v8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MetalFunctionGraphError(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  outlined copy of MetalFunctionGraphError.ErrorType(*(void *)a2, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  char v13 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v8;
  outlined consume of MetalFunctionGraphError.ErrorType(v9, v10, v11, v12, v13);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MetalFunctionGraphError(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  char v10 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v4;
  outlined consume of MetalFunctionGraphError.ErrorType(v5, v6, v7, v8, v10);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetalFunctionGraphError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetalFunctionGraphError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
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
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetalFunctionGraphError()
{
  return &type metadata for MetalFunctionGraphError;
}

uint64_t destroy for MetalFunctionGraphError.ErrorType(uint64_t a1)
{
  return outlined consume of MetalFunctionGraphError.ErrorType(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for MetalFunctionGraphError.ErrorType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of MetalFunctionGraphError.ErrorType(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for MetalFunctionGraphError.ErrorType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of MetalFunctionGraphError.ErrorType(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  outlined consume of MetalFunctionGraphError.ErrorType(v8, v9, v10, v11, v12);
  return a1;
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

uint64_t assignWithTake for MetalFunctionGraphError.ErrorType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  outlined consume of MetalFunctionGraphError.ErrorType(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetalFunctionGraphError.ErrorType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MetalFunctionGraphError.ErrorType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 252;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for MetalFunctionGraphError.ErrorType(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 3u) {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t destructiveInjectEnumTag for MetalFunctionGraphError.ErrorType(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)__n128 result = a2 - 4;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 4;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MetalFunctionGraphError.ErrorType()
{
  return &type metadata for MetalFunctionGraphError.ErrorType;
}

uint64_t *realityKitGeometryGetterFuncs.unsafeMutableAddressor()
{
  if (one-time initialization token for realityKitGeometryGetterFuncs != -1) {
    swift_once();
  }
  return &realityKitGeometryGetterFuncs;
}

uint64_t *realityKitSurfaceGetterFuncs.unsafeMutableAddressor()
{
  if (one-time initialization token for realityKitSurfaceGetterFuncs != -1) {
    swift_once();
  }
  return &realityKitSurfaceGetterFuncs;
}

uint64_t one-time initialization function for realityKitGeometryGetterFuncs()
{
  Swift::Int v0 = specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for realityKitGeometryGetterFuncs);
  uint64_t result = swift_arrayDestroy();
  realityKitGeometryGetterFuncs = v0;
  return result;
}

uint64_t one-time initialization function for realityKitSurfaceGetterFuncs()
{
  Swift::Int v0 = specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&outlined read-only object #0 of one-time initialization function for realityKitSurfaceGetterFuncs);
  uint64_t result = swift_arrayDestroy();
  realityKitSurfaceGetterFuncs = v0;
  return result;
}

uint64_t MetalShaderCompiler.__allocating_init(compiling:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  type metadata accessor for MetalShaderCompiler.Scope();
  unsigned int v3 = (void *)swift_allocObject();
  uint64_t v4 = MEMORY[0x263F8EE78];
  v3[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v3[3] = 0;
  swift_weakInit();
  v3[5] = v4;
  v3[6] = specialized Dictionary.init(dictionaryLiteral:)(v4);
  v3[7] = v4;
  v3[8] = v4;
  v3[9] = v4;
  v3[10] = v4;
  swift_beginAccess();
  swift_weakAssign();
  *(void *)(v2 + 24) = v3;
  return v2;
}

uint64_t MetalLiteralValueNode.createMetalInvocation(in:)()
{
  uint64_t v1 = (*(void *(**)(void *__return_ptr))(*(void *)v0 + 224))(v5);
  uint64_t v2 = (*(uint64_t (**)(void *))(*(void *)v0 + 176))(v1);
  uint64_t v3 = SGDataTypeStorage.metalLiteralValue(type:)(v2);
  swift_release();
  outlined release of SGDataTypeStorage((uint64_t)v5);
  return v3;
}

uint64_t protocol witness for HasMetalInvocation.createMetalInvocation(in:) in conformance MetalLiteralValueNode()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (*(void *(**)(void *__return_ptr))(*(void *)v1 + 224))(v6);
  uint64_t v3 = (*(uint64_t (**)(void *))(*(void *)v1 + 176))(v2);
  uint64_t v4 = SGDataTypeStorage.metalLiteralValue(type:)(v3);
  swift_release();
  outlined release of SGDataTypeStorage((uint64_t)v6);
  return v4;
}

uint64_t MetalShaderCompiler.program.getter()
{
  return swift_retain();
}

uint64_t MetalShaderCompiler.init(compiling:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  type metadata accessor for MetalShaderCompiler.Scope();
  uint64_t v2 = (void *)swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v2[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v2[3] = 0;
  swift_weakInit();
  v2[5] = v3;
  v2[6] = specialized Dictionary.init(dictionaryLiteral:)(v3);
  v2[7] = v3;
  v2[8] = v3;
  v2[9] = v3;
  v2[10] = v3;
  swift_beginAccess();
  swift_weakAssign();
  *(void *)(v1 + 24) = v2;
  return v1;
}

void *MetalShaderCompiler.Scope.__allocating_init(enclosingScope:)()
{
  uint64_t v0 = (void *)swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v0[3] = 0;
  swift_weakInit();
  v0[5] = v1;
  v0[6] = specialized Dictionary.init(dictionaryLiteral:)(v1);
  v0[7] = v1;
  v0[8] = v1;
  v0[9] = v1;
  v0[10] = v1;
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for MetalShaderCompiler.Scope()
{
  return self;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MetalShaderCompiler.compile()()
{
  uint64_t v2 = (*(uint64_t (**)(void))(*v0 + 112))();
  uint64_t v4 = v0;
  uint64_t v5 = v0[2];
  uint64_t v3 = (void *)v5;
  uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v5 + 264))(v4);
  if (v1)
  {
    swift_release();
    goto LABEL_3;
  }
  unint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 288))(v6);
  unint64_t v10 = v9;
  uint64_t v118 = MEMORY[0x263F8EE78];
  uint64_t v107 = MEMORY[0x263F8EE78];
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    unint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v89 = v5;
  unint64_t v100 = v11;
  if (v11)
  {
    unint64_t v12 = v11;
    unint64_t v11 = v10 & 0xC000000000000001;
    uint64_t v13 = v10 & 0xFFFFFFFFFFFFFF8;
    unint64_t v14 = v10 + 32;
    while (1)
    {
      BOOL v17 = __OFSUB__(v12--, 1);
      if (v17) {
        break;
      }
      if (v11)
      {
        uint64_t v15 = MEMORY[0x2611848A0](v12, v10);
      }
      else
      {
        if ((v12 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          swift_bridgeObjectRelease();
          specialized Array.append<A>(contentsOf:)(v107);
          uint64_t v117 = MEMORY[0x263F8EE78];
          swift_bridgeObjectRetain();
          unint64_t v36 = v11;
          unint64_t v92 = v14;
          uint64_t v94 = v13;
          while (1)
          {
            BOOL v17 = __OFSUB__(v36, 1);
            unint64_t v7 = v36 - 1;
            if (v17) {
              goto LABEL_104;
            }
            unint64_t v91 = v7;
            if (v14)
            {
              uint64_t v38 = MEMORY[0x2611848A0]();
            }
            else
            {
              if ((v7 & 0x8000000000000000) != 0)
              {
                __break(1u);
LABEL_109:
                __break(1u);
                goto LABEL_110;
              }
              if (v7 >= *(void *)(v13 + 16)) {
                goto LABEL_109;
              }
              uint64_t v38 = swift_retain();
            }
            uint64_t v39 = (*(uint64_t (**)(uint64_t))(*(void *)v38 + 248))(v38);
            int64_t v40 = *(void *)(v39 + 16);
            if (v40) {
              break;
            }
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_48:
            specialized Array.append<A>(contentsOf:)(v37);
            unint64_t v36 = v91;
            if (!v91) {
              goto LABEL_105;
            }
          }
          uint64_t v116 = MEMORY[0x263F8EE78];
          int64_t v96 = v40;
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v40, 0);
          uint64_t v106 = v116;
          unint64_t v41 = specialized Dictionary.Values.startIndex.getter(v39);
          uint64_t v43 = 0;
          uint64_t v44 = v39 + 64;
          char v45 = *(unsigned char *)(v39 + 32);
          int v97 = v42;
          uint64_t v98 = v39 + 64;
          uint64_t v90 = v39 + 96;
          uint64_t v99 = v39;
          while (2)
          {
            if ((v41 & 0x8000000000000000) != 0 || (uint64_t)v41 >= 1 << v45) {
              goto LABEL_96;
            }
            if ((*(void *)(v44 + 8 * (v41 >> 6)) & (1 << v41)) == 0) {
              goto LABEL_97;
            }
            if (*(_DWORD *)(v39 + 36) != v42) {
              goto LABEL_98;
            }
            int v102 = v42;
            uint64_t v103 = 1 << v41;
            unint64_t v104 = v41 >> 6;
            uint64_t v105 = v41;
            uint64_t v101 = v43;
            uint64_t v49 = (uint64_t *)(*(void *)(v39 + 48) + 16 * v41);
            uint64_t v50 = *v49;
            uint64_t v51 = (void *)v49[1];
            uint64_t v52 = *(void *)(*(void *)(v39 + 56) + 8 * v41);
            uint64_t v107 = 0x20746375727473;
            *(void *)&long long v108 = 0xE700000000000000;
            swift_bridgeObjectRetain();
            swift_retain();
            v53._countAndFlagsBits = v50;
            v53._id object = v51;
            String.append(_:)(v53);
            v54._countAndFlagsBits = 686880;
            v54._id object = (void *)0xE300000000000000;
            String.append(_:)(v54);
            uint64_t v114 = v107;
            uint64_t v115 = v108;
            uint64_t v55 = (*(uint64_t (**)(void))(*(void *)v52 + 88))();
            int64_t v56 = *(void *)(v55 + 16);
            if (v56)
            {
              uint64_t v113 = MEMORY[0x263F8EE78];
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v56, 0);
              uint64_t v57 = v113;
              Swift::UInt v58 = (void *)(v55 + 72);
              do
              {
                uint64_t v59 = *(v58 - 2);
                char v60 = *((unsigned char *)v58 - 8);
                uint64_t v61 = *v58;
                uint64_t v107 = *(v58 - 5);
                long long v108 = *((_OWORD *)v58 - 2);
                uint64_t v109 = v59;
                char v110 = v60;
                uint64_t v111 = v61;
                closure #1 in closure #1 in closure #4 in MetalShaderCompiler.compile()(&v107, v112);
                uint64_t v62 = v112[0];
                uint64_t v63 = v112[1];
                uint64_t v113 = v57;
                unint64_t v65 = *(void *)(v57 + 16);
                unint64_t v64 = *(void *)(v57 + 24);
                if (v65 >= v64 >> 1)
                {
                  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v64 > 1, v65 + 1, 1);
                  uint64_t v57 = v113;
                }
                v58 += 6;
                *(void *)(v57 + 16) = v65 + 1;
                uint64_t v66 = v57 + 16 * v65;
                *(void *)(v66 + 32) = v62;
                *(void *)(v66 + 40) = v63;
                --v56;
              }
              while (v56);
              swift_bridgeObjectRelease();
              unint64_t v14 = v92;
              uint64_t v2 = v93;
            }
            else
            {
              swift_bridgeObjectRelease();
              uint64_t v57 = MEMORY[0x263F8EE78];
            }
            uint64_t v107 = v57;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
            lazy protocol witness table accessor for type [String] and conformance [A]();
            uint64_t v67 = BidirectionalCollection<>.joined(separator:)();
            uint64_t v69 = v68;
            swift_bridgeObjectRelease();
            v70._countAndFlagsBits = v67;
            v70._id object = v69;
            String.append(_:)(v70);
            swift_bridgeObjectRelease();
            v71._countAndFlagsBits = 171670794;
            v71._id object = (void *)0xE400000000000000;
            String.append(_:)(v71);
            swift_release();
            swift_bridgeObjectRelease();
            unint64_t v11 = v114;
            uint64_t v72 = v115;
            uint64_t v73 = v106;
            uint64_t v116 = v106;
            unint64_t v75 = *(void *)(v106 + 16);
            unint64_t v74 = *(void *)(v106 + 24);
            if (v75 >= v74 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v74 > 1, v75 + 1, 1);
              uint64_t v73 = v116;
            }
            *(void *)(v73 + 16) = v75 + 1;
            unint64_t v76 = v73 + 16 * v75;
            *(void *)(v76 + 32) = v11;
            *(void *)(v76 + 40) = v72;
            uint64_t v39 = v99;
            char v45 = *(unsigned char *)(v99 + 32);
            unint64_t v46 = 1 << v45;
            unint64_t v10 = v95;
            if (v105 >= 1 << v45) {
              goto LABEL_99;
            }
            uint64_t v44 = v98;
            unint64_t v77 = v104;
            uint64_t v78 = *(void *)(v98 + 8 * v104);
            if ((v78 & v103) == 0) {
              goto LABEL_100;
            }
            if (*(_DWORD *)(v99 + 36) != v102) {
              goto LABEL_101;
            }
            uint64_t v106 = v73;
            unint64_t v79 = v78 & (-2 << (v105 & 0x3F));
            if (v79)
            {
              unint64_t v46 = __clz(__rbit64(v79)) | v105 & 0xFFFFFFFFFFFFFFC0;
              unint64_t v11 = v100;
              uint64_t v13 = v94;
              int64_t v47 = v96;
              uint64_t v48 = v101;
              goto LABEL_58;
            }
            unint64_t v80 = v104 + 1;
            unint64_t v81 = (v46 + 63) >> 6;
            unint64_t v11 = v100;
            uint64_t v13 = v94;
            uint64_t v48 = v101;
            if (v104 + 1 < v81)
            {
              unint64_t v82 = *(void *)(v98 + 8 * v80);
              if (v82)
              {
LABEL_78:
                int64_t v47 = v96;
LABEL_79:
                unint64_t v46 = __clz(__rbit64(v82)) + (v80 << 6);
                goto LABEL_58;
              }
              unint64_t v80 = v104 + 2;
              if (v104 + 2 < v81)
              {
                unint64_t v82 = *(void *)(v98 + 8 * v80);
                if (v82) {
                  goto LABEL_78;
                }
                unint64_t v80 = v104 + 3;
                if (v104 + 3 < v81)
                {
                  unint64_t v82 = *(void *)(v98 + 8 * v80);
                  if (v82) {
                    goto LABEL_78;
                  }
                  unint64_t v83 = v81 - 4;
                  int64_t v47 = v96;
                  while (v83 != v77)
                  {
                    unint64_t v82 = *(void *)(v90 + 8 * v77++);
                    if (v82)
                    {
                      unint64_t v80 = v77 + 3;
                      goto LABEL_79;
                    }
                  }
LABEL_58:
                  uint64_t v43 = v48 + 1;
                  int v42 = v97;
                  unint64_t v41 = v46;
                  if (v43 == v47)
                  {
                    swift_release();
                    swift_bridgeObjectRelease();
                    uint64_t v37 = v106;
                    goto LABEL_48;
                  }
                  continue;
                }
              }
            }
            break;
          }
          int64_t v47 = v96;
          goto LABEL_58;
        }
        if (v12 >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_44;
        }
        uint64_t v15 = *(void *)(v14 + 8 * v12);
        swift_retain();
      }
      uint64_t v16 = (*(uint64_t (**)(void))(*(void *)v15 + 312))();
      swift_release();
      specialized Array.append<A>(contentsOf:)(v16);
      if (!v12) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v18 = v107;
    unint64_t v11 = v100;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v18 = MEMORY[0x263F8EE78];
  }
  int64_t v19 = *(void *)(v18 + 16);
  uint64_t v93 = v2;
  unint64_t v95 = v10;
  if (v19)
  {
    uint64_t v114 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v19, 0);
    uint64_t v20 = v114;
    Swift::String v21 = (void **)(v18 + 40);
    do
    {
      uint64_t v22 = (uint64_t)*(v21 - 1);
      unint64_t v23 = *v21;
      uint64_t v107 = 0x6564756C636E6923;
      *(void *)&long long v108 = 0xE900000000000020;
      swift_bridgeObjectRetain();
      v24._countAndFlagsBits = v22;
      v24._id object = v23;
      String.append(_:)(v24);
      swift_bridgeObjectRelease();
      uint64_t v114 = v20;
      unint64_t v26 = *(void *)(v20 + 16);
      unint64_t v25 = *(void *)(v20 + 24);
      if (v26 >= v25 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
        uint64_t v20 = v114;
      }
      v21 += 2;
      *(void *)(v20 + 16) = v26 + 1;
      uint64_t v27 = v20 + 16 * v26;
      *(void *)(v27 + 32) = 0x6564756C636E6923;
      *(void *)(v27 + 40) = 0xE900000000000020;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease();
    uint64_t v2 = v93;
    unint64_t v10 = v95;
    unint64_t v11 = v100;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  specialized Array.append<A>(contentsOf:)(v20);
  uint64_t v107 = MEMORY[0x263F8EE78];
  if (!v11)
  {
    uint64_t v31 = MEMORY[0x263F8EE78];
    specialized Array.append<A>(contentsOf:)(MEMORY[0x263F8EE78]);
    goto LABEL_34;
  }
  unint64_t v14 = v10 & 0xC000000000000001;
  uint64_t v13 = v10 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  unint64_t v28 = v11;
  while (1)
  {
    BOOL v17 = __OFSUB__(v28--, 1);
    if (v17) {
      goto LABEL_45;
    }
    if (v14)
    {
      uint64_t v29 = MEMORY[0x2611848A0](v28, v10);
      goto LABEL_27;
    }
    if ((v28 & 0x8000000000000000) != 0) {
      break;
    }
    if (v28 >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_95;
    }
    uint64_t v29 = *(void *)(v10 + 32 + 8 * v28);
    swift_retain();
LABEL_27:
    uint64_t v30 = (*(uint64_t (**)(void))(*(void *)v29 + 360))();
    swift_release();
    specialized Array.append<A>(contentsOf:)(v30);
    if (!v28) {
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
LABEL_97:
  __break(1u);
LABEL_98:
  __break(1u);
LABEL_99:
  __break(1u);
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  swift_bridgeObjectRelease();
  uint64_t v31 = v117;
LABEL_34:
  uint64_t v32 = specialized Array.append<A>(contentsOf:)(v31);
  uint64_t v33 = (*(uint64_t (**)(uint64_t))(*(void *)v89 + 192))(v32);
  specialized Array.append<A>(contentsOf:)(v33);
  uint64_t v107 = MEMORY[0x263F8EE78];
  if (v11)
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      BOOL v17 = __OFSUB__(v11--, 1);
      if (v17) {
        break;
      }
      if ((v10 & 0xC000000000000001) != 0)
      {
        uint64_t v34 = MEMORY[0x2611848A0](v11, v10);
      }
      else
      {
        if ((v11 & 0x8000000000000000) != 0) {
          goto LABEL_102;
        }
        if (v11 >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_103;
        }
        uint64_t v34 = *(void *)(v10 + 32 + 8 * v11);
        swift_retain();
      }
      uint64_t v35 = (*(uint64_t (**)(void))(*(void *)v34 + 336))();
      swift_release();
      specialized Array.append<A>(contentsOf:)(v35);
      if (!v11) {
        goto LABEL_92;
      }
    }
    __break(1u);
LABEL_92:
    swift_bridgeObjectRelease_n();
    uint64_t v84 = v107;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v84 = MEMORY[0x263F8EE78];
  }
  uint64_t v85 = specialized Array.append<A>(contentsOf:)(v84);
  uint64_t v86 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 384))(v85);
  specialized Array.append<A>(contentsOf:)(v86);
  uint64_t v107 = v118;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  uint64_t v5 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v3 = v87;
  swift_bridgeObjectRelease();
  swift_release();
LABEL_3:
  unint64_t v7 = v5;
  long long v8 = v3;
LABEL_110:
  result._id object = v8;
  result._countAndFlagsBits = v7;
  return result;
}

void closure #1 in closure #1 in closure #4 in MetalShaderCompiler.compile()(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)a1[1];
  uint64_t v33 = *a1;
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  int64_t v6 = *(void *)(v4 + 16);
  if (v6)
  {
    uint64_t v31 = a1[2];
    uint64_t v32 = (void *)a1[1];
    uint64_t v34 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6, 0);
    unint64_t v7 = (void **)(v4 + 40);
    do
    {
      uint64_t v9 = (uint64_t)*(v7 - 1);
      long long v8 = *v7;
      swift_bridgeObjectRetain();
      v10._countAndFlagsBits = v9;
      v10._id object = v8;
      String.append(_:)(v10);
      v11._countAndFlagsBits = 23901;
      v11._id object = (void *)0xE200000000000000;
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      unint64_t v13 = *(void *)(v34 + 16);
      unint64_t v12 = *(void *)(v34 + 24);
      if (v13 >= v12 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
      }
      v7 += 2;
      *(void *)(v34 + 16) = v13 + 1;
      uint64_t v14 = v34 + 16 * v13;
      *(void *)(v14 + 32) = 23387;
      *(void *)(v14 + 40) = 0xE200000000000000;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    uint64_t v5 = v31;
    uint64_t v3 = v32;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  uint64_t v15 = BidirectionalCollection<>.joined(separator:)();
  BOOL v17 = v16;
  swift_bridgeObjectRelease();
  unint64_t v18 = specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&outlined read-only object #0 of closure #1 in closure #1 in closure #4 in MetalShaderCompiler.compile());
  if (!*(void *)(v18 + 16)) {
    goto LABEL_11;
  }
  uint64_t v20 = *(void *)(v5 + 24);
  uint64_t v19 = *(void *)(v5 + 32);
  swift_bridgeObjectRetain();
  unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(v20, v19);
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void *)(v5 + 24);
    unint64_t v25 = *(void **)(v5 + 32);
    swift_bridgeObjectRetain();
    goto LABEL_12;
  }
  unint64_t v23 = (uint64_t *)(*(void *)(v18 + 56) + 16 * v21);
  uint64_t v24 = *v23;
  unint64_t v25 = (void *)v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_12:
  v26._countAndFlagsBits = v24;
  v26._id object = v25;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 32;
  v27._id object = (void *)0xE100000000000000;
  String.append(_:)(v27);
  swift_bridgeObjectRetain();
  v28._countAndFlagsBits = v33;
  v28._id object = v3;
  String.append(_:)(v28);
  swift_bridgeObjectRelease();
  v29._countAndFlagsBits = v15;
  v29._id object = v17;
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  v30._countAndFlagsBits = 59;
  v30._id object = (void *)0xE100000000000000;
  String.append(_:)(v30);
  *a2 = 9;
  a2[1] = 0xE100000000000000;
}

uint64_t MetalShaderCompiler.currentScope.getter()
{
  return swift_retain();
}

uint64_t MetalShaderCompiler.currentScope.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 24) = a1;
  return swift_release();
}

uint64_t (*MetalShaderCompiler.currentScope.modify())()
{
  return XMLParserDelegate.StringNode.children.modify;
}

uint64_t MetalShaderCompiler.pushScope()()
{
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)v0 + 112);
  uint64_t v1 = v4();
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 408))(v1);
  swift_release();
  (*(void (**)(uint64_t))(*(void *)v0 + 120))(v2);
  return v4();
}

Swift::Void __swiftcall MetalShaderCompiler.popScope()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v0 + 112);
  uint64_t v3 = v2();
  uint64_t v4 = v2();
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v4 + 200))();
  swift_release();
  if (v5)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 120))(v5);
    uint64_t v7 = ((uint64_t (*)(uint64_t))v2)(v6);
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v3 + 384))();
    uint64_t v9 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v7 + 400))(v10);
    specialized Array.append<A>(contentsOf:)(v8);
    v9(v10, 0);
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t MetalShaderCompiler.withChildScope<A>(_:)(uint64_t (*a1)(void))
{
  (*(void (**)(void))(*(void *)v1 + 136))();
  uint64_t v3 = a1();
  (*(void (**)(uint64_t))(*(void *)v1 + 144))(v3);
  return swift_release();
}

uint64_t MetalShaderCompiler.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t MetalShaderCompiler.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t MetalShaderCompiler.Scope.nodesToResultVariableNameMap.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetalShaderCompiler.Scope.lastResultVariableIndex.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 24);
}

uint64_t MetalShaderCompiler.Scope.enclosingScope.getter()
{
  return swift_weakLoadStrong();
}

uint64_t key path setter for MetalShaderCompiler.Scope.childScopes : MetalShaderCompiler.Scope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t MetalShaderCompiler.Scope.childScopes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for MetalShaderCompiler.Scope.definedTypes : MetalShaderCompiler.Scope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 48) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t MetalShaderCompiler.Scope.definedTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetalShaderCompiler.Scope.global.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 200))();
  if (v1) {
    return v1;
  }
  swift_retain();
  return v0;
}

void *MetalShaderCompiler.Scope.init(enclosingScope:)()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  v0[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v0[3] = 0;
  swift_weakInit();
  v0[5] = v1;
  v0[6] = specialized Dictionary.init(dictionaryLiteral:)(v1);
  v0[7] = v1;
  v0[8] = v1;
  v0[9] = v1;
  v0[10] = v1;
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v0;
}

unint64_t MetalShaderCompiler.Scope.allScopes()()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25C4195A0;
  *(void *)(v1 + 32) = v0;
  unint64_t v11 = v1;
  specialized Array._endMutation()();
  unint64_t v2 = v11;
  if (v11 >> 62)
  {
LABEL_14:
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v9 >= 1) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
    if (v3 >= 1)
    {
LABEL_3:
      for (uint64_t i = 0; i < v8; ++i)
      {
        if ((v2 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x2611848A0](i, v2);
          uint64_t v5 = v6;
        }
        else
        {
          if ((unint64_t)i >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_14;
          }
          uint64_t v5 = *(void *)(v2 + 8 * i + 32);
          uint64_t v6 = swift_retain();
        }
        (*(void (**)(uint64_t))(*(void *)v5 + 224))(v6);
        unint64_t v7 = swift_bridgeObjectRetain();
        specialized Array.append<A>(contentsOf:)(v7);
        swift_bridgeObjectRelease();
        swift_release();
        unint64_t v2 = v11;
        if (v11 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v8 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
      }
    }
  }
  return v2;
}

uint64_t MetalShaderCompiler.Scope.resultVariableName(for:)(void *a1)
{
  uint64_t v2 = a1[3];
  uint64_t v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)v1 + 152))();
  if (*(void *)(v5 + 16) && (uint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 16 * v6);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t MetalShaderCompiler.Scope.createResultVariableName(for:)(void *a1)
{
  (*(void (**)(void))(*v1 + 176))();
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  uint64_t result = swift_beginAccess();
  uint64_t v5 = v1[3];
  BOOL v6 = __OFADD__(v5, 1);
  uint64_t v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    v1[3] = v7;
    uint64_t v8 = a1[3];
    uint64_t v9 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v8);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = v1[2];
    v1[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(0x746C7573657224, 0xE700000000000000, v10, isUniquelyReferenced_nonNull_native);
    v1[2] = v12;
    swift_bridgeObjectRelease();
    swift_endAccess();
    return 0x746C7573657224;
  }
  return result;
}

uint64_t MetalShaderCompiler.Scope.includePaths.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetalShaderCompiler.Scope.includePaths.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MetalShaderCompiler.Scope.includePaths.modify())()
{
  return XMLParserDelegate.Element.children.modify;
}

uint64_t MetalShaderCompiler.Scope.globalDeclarations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetalShaderCompiler.Scope.globalDeclarations.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 64) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MetalShaderCompiler.Scope.globalDeclarations.modify())()
{
  return XMLParserDelegate.Element.children.modify;
}

uint64_t MetalShaderCompiler.Scope.topGlobalDeclarations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetalShaderCompiler.Scope.topGlobalDeclarations.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 72) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MetalShaderCompiler.Scope.topGlobalDeclarations.modify())()
{
  return XMLParserDelegate.Element.children.modify;
}

uint64_t MetalShaderCompiler.Scope.metalSourceSegments.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MetalShaderCompiler.Scope.metalSourceSegments.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 80) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*MetalShaderCompiler.Scope.metalSourceSegments.modify())()
{
  return XMLParserDelegate.Element.children.modify;
}

void *MetalShaderCompiler.Scope.createChildScope()()
{
  uint64_t v1 = v0;
  type metadata accessor for MetalShaderCompiler.Scope();
  uint64_t v2 = (void *)swift_allocObject();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v2[2] = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  v2[3] = 0;
  swift_weakInit();
  v2[5] = v3;
  swift_retain();
  v2[6] = specialized Dictionary.init(dictionaryLiteral:)(v3);
  v2[7] = v3;
  v2[8] = v3;
  v2[9] = v3;
  v2[10] = v3;
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x261184120](v4);
  if (*(void *)((*(void *)(v1 + 40) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 40) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  return v2;
}

uint64_t MetalShaderCompiler.Scope.addStructTypeDefinition(_:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *(void *)(v3 + 48) = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t MetalShaderCompiler.Scope.structTypeDefinition(named:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  BOOL v6 = *(uint64_t (**)(uint64_t))(*(void *)v2 + 248);
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = v6(v7);
  if (*(void *)(v8 + 16) && (unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v10 & 1) != 0))
  {
    uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = swift_bridgeObjectRelease();
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 200))(v12);
    if (v13)
    {
      uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v13 + 424))(a1, a2);
      swift_release();
      return v14;
    }
    return 0;
  }
  return v11;
}

uint64_t MetalShaderCompiler.Scope.deinit()
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MetalShaderCompiler.Scope.__deallocating_deinit()
{
  MetalShaderCompiler.Scope.deinit();
  return swift_deallocClassInstance();
}

uint64_t outlined release of SGDataTypeStorage(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C3FA870@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 112))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FA8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 120);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_25C3FA910@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FA960@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 176))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FA9AC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return result;
}

uint64_t sub_25C3FA9F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 200))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FAA3C()
{
  return swift_weakAssign();
}

uint64_t sub_25C3FAA8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 224))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FAADC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 248))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FAB2C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 312))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FAB80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 320);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C3FABDC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 336))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FAC30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 344);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C3FAC8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 360))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FACE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 368);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C3FAD3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 384))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FAD90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 392);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t dispatch thunk of HasMetalInvocation.createMetalInvocation(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MetalSourceGenerator.generateMetalSource(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for MetalShaderCompiler()
{
  return self;
}

uint64_t method lookup function for MetalShaderCompiler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MetalShaderCompiler);
}

uint64_t dispatch thunk of MetalShaderCompiler.__allocating_init(compiling:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MetalShaderCompiler.compile()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MetalShaderCompiler.currentScope.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MetalShaderCompiler.currentScope.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MetalShaderCompiler.currentScope.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MetalShaderCompiler.pushScope()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MetalShaderCompiler.popScope()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MetalShaderCompiler.withChildScope<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t method lookup function for MetalShaderCompiler.Scope(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MetalShaderCompiler.Scope);
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.nodesToResultVariableNameMap.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.lastResultVariableIndex.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.enclosingScope.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.childScopes.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.definedTypes.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.global.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.__allocating_init(enclosingScope:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.allScopes()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.resultVariableName(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.createResultVariableName(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.includePaths.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.includePaths.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.includePaths.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.globalDeclarations.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.globalDeclarations.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.globalDeclarations.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.topGlobalDeclarations.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.topGlobalDeclarations.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.topGlobalDeclarations.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.metalSourceSegments.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.metalSourceSegments.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.metalSourceSegments.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.createChildScope()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.addStructTypeDefinition(_:name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of MetalShaderCompiler.Scope.structTypeDefinition(named:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t static DataType.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 128))(a2) & 1;
}

uint64_t DataType.init(properties:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t DataType.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DataType.properties.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DataType.properties.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*DataType.properties.modify())()
{
  return XMLParserDelegate.StringNode.children.modify;
}

Swift::Int DataType.hashValue.getter()
{
  Hasher.init(_seed:)();
  (*(void (**)(unsigned char *))(*(void *)v0 + 120))(v2);
  return Hasher._finalize()();
}

uint64_t DataTypeProperty.init(label:type:attributes:index:visible:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(unsigned char *)(a7 + 32) = a6;
  *(void *)(a7 + 40) = a5;
  return result;
}

uint64_t DataType.hash(into:)(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)v1 + 88))();
  specialized Array<A>.hash(into:)(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t DataType.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)v3 + 88))();
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    unint64_t v18 = a3;
    unint64_t v9 = (uint64_t *)(v7 + 72);
    while (1)
    {
      uint64_t v10 = *(v9 - 5);
      uint64_t v11 = *(v9 - 4);
      uint64_t v12 = *(v9 - 3);
      uint64_t v13 = *(v9 - 2);
      uint64_t v14 = *((unsigned __int8 *)v9 - 8);
      uint64_t v15 = *v9;
      if (v10 == a1 && v11 == a2) {
        break;
      }
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        goto LABEL_12;
      }
      v9 += 6;
      if (!--v8)
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        goto LABEL_13;
      }
    }
    uint64_t v10 = a1;
    uint64_t v11 = a2;
LABEL_12:
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRelease();
LABEL_13:
    a3 = v18;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  *a3 = v10;
  a3[1] = v11;
  a3[2] = v12;
  a3[3] = v13;
  a3[4] = v14;
  a3[5] = v15;
  return result;
}

uint64_t DataType.__allocating_init(properties:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

BOOL DataType.isEqual(to:)(uint64_t a1)
{
  return v1 == a1;
}

uint64_t DataType.description.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)v0 + 88))();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v29 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    uint64_t v3 = (uint64_t *)(v1 + 56);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      uint64_t v27 = *(v3 - 3);
      uint64_t v28 = *(v3 - 2);
      swift_bridgeObjectRetain();
      v6._countAndFlagsBits = 8250;
      v6._id object = (void *)0xE200000000000000;
      String.append(_:)(v6);
      uint64_t v7 = *(uint64_t (**)(uint64_t))(*(void *)v5 + 136);
      uint64_t v8 = swift_retain();
      v9._countAndFlagsBits = v7(v8);
      String.append(_:)(v9);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v10 = v27;
      uint64_t v11 = v28;
      if (*(void *)(v4 + 16))
      {
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
        lazy protocol witness table accessor for type [String] and conformance [A]();
        uint64_t v12 = BidirectionalCollection<>.joined(separator:)();
        uint64_t v14 = v13;
        swift_bridgeObjectRelease();
        v15._countAndFlagsBits = v12;
        v15._id object = v14;
        String.append(_:)(v15);
        swift_bridgeObjectRelease();
        uint64_t v10 = v27;
        uint64_t v11 = v28;
      }
      unint64_t v17 = *(void *)(v29 + 16);
      unint64_t v16 = *(void *)(v29 + 24);
      if (v17 >= v16 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
      }
      *(void *)(v29 + 16) = v17 + 1;
      uint64_t v18 = v29 + 16 * v17;
      *(void *)(v18 + 32) = v10;
      *(void *)(v18 + 40) = v11;
      v3 += 6;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  uint64_t v19 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  v22._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  v23._countAndFlagsBits = 31550;
  v23._id object = (void *)0xE200000000000000;
  String.append(_:)(v23);
  v24._countAndFlagsBits = v19;
  v24._id object = v21;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 125;
  v25._id object = (void *)0xE100000000000000;
  String.append(_:)(v25);
  return 60;
}

uint64_t DataType.asMetalDataType.getter()
{
  return 0;
}

uint64_t DataType.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance DataType()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152))();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance DataType()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DataType()
{
  Hasher.init(_seed:)();
  (*(void (**)(unsigned char *))(**(void **)v0 + 120))(v2);
  return Hasher._finalize()();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DataType()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 136))();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DataType(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 128))(*a2) & 1;
}

uint64_t DataTypeProperty.label.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DataTypeProperty.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*DataTypeProperty.label.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t DataTypeProperty.type.getter()
{
  return swift_retain();
}

uint64_t DataTypeProperty.type.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*DataTypeProperty.type.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t DataTypeProperty.attributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DataTypeProperty.attributes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*DataTypeProperty.attributes.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t DataTypeProperty.visible.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t DataTypeProperty.visible.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*DataTypeProperty.visible.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t DataTypeProperty.index.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t DataTypeProperty.index.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*DataTypeProperty.index.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

void DataTypeProperty.hash(into:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void (**)(uint64_t))(**(void **)(v1 + 16) + 120);
  swift_retain();
  v3(a1);
  swift_release();
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v7 = v4;
  Swift::UInt v5 = *(void *)(v4 + 16);
  Hasher._combine(_:)(v5);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = v4 + 40;
    do
    {
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      v6 += 16;
      --v5;
    }
    while (v5);
    outlined release of [Input]((uint64_t)&v7);
  }
  Hasher._combine(_:)(*(unsigned char *)(v1 + 32) & 1);
  Hasher._combine(_:)(*(void *)(v1 + 40));
}

Swift::Int DataTypeProperty.hashValue.getter()
{
  Hasher.init(_seed:)();
  DataTypeProperty.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance DataTypeProperty()
{
  Hasher.init(_seed:)();
  DataTypeProperty.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DataTypeProperty()
{
  Hasher.init(_seed:)();
  DataTypeProperty.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DataTypeProperty(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  void v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  id v8[2] = v5;
  return specialized static DataTypeProperty.== infix(_:_:)((uint64_t)v7, (uint64_t)v8);
}

void specialized Array<A>.hash(into:)(uint64_t a1, uint64_t a2)
{
  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  Swift::UInt v15 = v4;
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v14 = a2 + 32;
    do
    {
      uint64_t v6 = v14 + 48 * v5;
      uint64_t v7 = *(void *)(v6 + 16);
      uint64_t v8 = *(void *)(v6 + 24);
      Swift::UInt8 v9 = *(unsigned char *)(v6 + 32);
      Swift::UInt v10 = *(void *)(v6 + 40);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      uint64_t v11 = *(void (**)(uint64_t))(*(void *)v7 + 120);
      swift_retain();
      v11(a1);
      swift_release();
      Hasher._combine(_:)(*(void *)(v8 + 16));
      uint64_t v12 = *(void *)(v8 + 16);
      if (v12)
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = v8 + 40;
        do
        {
          swift_bridgeObjectRetain();
          String.hash(into:)();
          swift_bridgeObjectRelease();
          v13 += 16;
          --v12;
        }
        while (v12);
        swift_bridgeObjectRelease();
      }
      ++v5;
      Hasher._combine(_:)(v9);
      Hasher._combine(_:)(v10);
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v5 != v15);
  }
}

{
  Swift::UInt v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::UInt v18;
  uint64_t v19;
  Swift::UInt8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::UInt8 v26;
  Swift::UInt v27;

  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  uint64_t v18 = v4;
  if (!v4) {
    return;
  }
  uint64_t v5 = 0;
  unint64_t v17 = a2 + 32;
  while (1)
  {
    uint64_t v6 = v17 + (v5 << 6);
    uint64_t v7 = *(void *)(v6 + 16);
    uint64_t v8 = *(void *)(v6 + 32);
    uint64_t v20 = *(unsigned char *)(v6 + 56);
    unint64_t v21 = *(void *)(v6 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_retain();
    Swift::String v22 = v8;
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    Swift::UInt8 v9 = *(void *)(v7 + 16);
    Hasher._combine(_:)(*(void *)(v9 + 16));
    Swift::String v25 = *(void *)(v9 + 16);
    if (v25) {
      break;
    }
LABEL_14:
    if (v22)
    {
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      if (!v21) {
        goto LABEL_18;
      }
    }
    else
    {
      Hasher._combine(_:)(0);
      if (!v21)
      {
LABEL_18:
        Hasher._combine(_:)(0);
        goto LABEL_4;
      }
    }
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
LABEL_4:
    ++v5;
    Hasher._combine(_:)(v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    if (v5 == v18) {
      return;
    }
  }
  uint64_t v19 = v5;
  Swift::String v24 = v9 + 32;
  swift_retain();
  swift_bridgeObjectRetain();
  Swift::UInt v10 = 0;
  Swift::String v23 = v9;
  while (v10 < *(void *)(v9 + 16))
  {
    uint64_t v11 = v24 + 48 * v10;
    uint64_t v13 = *(void *)(v11 + 16);
    uint64_t v12 = *(void *)(v11 + 24);
    Swift::String v26 = *(unsigned char *)(v11 + 32);
    uint64_t v27 = *(void *)(v11 + 40);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t v14 = *(void (**)(uint64_t))(*(void *)v13 + 120);
    swift_retain();
    v14(a1);
    swift_release();
    Hasher._combine(_:)(*(void *)(v12 + 16));
    Swift::UInt v15 = *(void *)(v12 + 16);
    if (v15)
    {
      swift_bridgeObjectRetain();
      unint64_t v16 = v12 + 40;
      do
      {
        swift_bridgeObjectRetain();
        String.hash(into:)();
        swift_bridgeObjectRelease();
        v16 += 16;
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
      Swift::UInt8 v9 = v23;
    }
    ++v10;
    Hasher._combine(_:)(v26);
    Hasher._combine(_:)(v27);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    if (v10 == v25)
    {
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v5 = v19;
      goto LABEL_14;
    }
  }
  __break(1u);
}

{
  Swift::UInt v4;
  Swift::UInt *v5;
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t);
  Swift::UInt v9;
  Swift::UInt v10;

  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  if (v4)
  {
    uint64_t v5 = (Swift::UInt *)(a2 + 80);
    do
    {
      uint64_t v6 = *(v5 - 5);
      uint64_t v7 = *((unsigned __int8 *)v5 - 8);
      Swift::UInt8 v9 = *(v5 - 2);
      Swift::UInt v10 = *v5;
      Hasher._combine(_:)(*(v5 - 6));
      uint64_t v8 = *(void (**)(uint64_t))(*(void *)v6 + 120);
      swift_retain();
      swift_bridgeObjectRetain();
      v8(a1);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      if (v7 == 1)
      {
        Hasher._combine(_:)(0);
      }
      else
      {
        Hasher._combine(_:)(1u);
        Hasher._combine(_:)(v9);
      }
      v5 += 7;
      Hasher._combine(_:)(v10);
      swift_bridgeObjectRelease();
      swift_release();
      --v4;
    }
    while (v4);
  }
}

{
  Swift::UInt v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::UInt *v11;
  uint64_t v12;
  int v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  Swift::UInt *v16;
  uint64_t v17;
  int v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  Swift::UInt v21;
  Swift::UInt v22;
  unint64_t v23;
  uint64_t v24;
  Swift::UInt v25;
  char v26;
  Swift::UInt v27;
  Swift::UInt v28;
  Swift::UInt v29;
  Swift::UInt v30;

  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  unint64_t v21 = v4;
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v20 = a2 + 32;
    do
    {
      Swift::String v24 = v5;
      uint64_t v6 = v20 + 48 * v5;
      uint64_t v7 = *(void *)v6;
      uint64_t v8 = *(void *)(v6 + 8);
      Swift::UInt8 v9 = *(void *)(v6 + 16);
      Swift::String v25 = *(void *)(v6 + 24);
      Swift::String v22 = *(void *)(v6 + 32);
      Swift::String v26 = *(unsigned char *)(v6 + 40);
      outlined copy of NodePersonality(*(void *)v6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      Swift::String v23 = v7;
      NodePersonality.hash(into:)(a1, v7);
      Hasher._combine(_:)(*(void *)(v8 + 16));
      Swift::UInt v10 = *(void *)(v8 + 16);
      if (v10)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = (Swift::UInt *)(v8 + 80);
        do
        {
          uint64_t v12 = *(v11 - 5);
          uint64_t v13 = *((unsigned __int8 *)v11 - 8);
          uint64_t v27 = *(v11 - 2);
          uint64_t v29 = *v11;
          Hasher._combine(_:)(*(v11 - 6));
          uint64_t v14 = *(void (**)(uint64_t))(*(void *)v12 + 120);
          swift_retain();
          swift_bridgeObjectRetain();
          v14(a1);
          swift_bridgeObjectRetain();
          String.hash(into:)();
          swift_bridgeObjectRelease();
          if (v13 == 1)
          {
            Hasher._combine(_:)(0);
          }
          else
          {
            Hasher._combine(_:)(1u);
            Hasher._combine(_:)(v27);
          }
          v11 += 7;
          Hasher._combine(_:)(v29);
          swift_bridgeObjectRelease();
          swift_release();
          --v10;
        }
        while (v10);
        swift_bridgeObjectRelease();
      }
      Hasher._combine(_:)(*(void *)(v9 + 16));
      Swift::UInt v15 = *(void *)(v9 + 16);
      if (v15)
      {
        swift_bridgeObjectRetain();
        unint64_t v16 = (Swift::UInt *)(v9 + 80);
        do
        {
          unint64_t v17 = *(v16 - 5);
          uint64_t v18 = *((unsigned __int8 *)v16 - 8);
          uint64_t v28 = *(v16 - 2);
          Swift::String v30 = *v16;
          Hasher._combine(_:)(*(v16 - 6));
          uint64_t v19 = *(void (**)(uint64_t))(*(void *)v17 + 120);
          swift_retain();
          swift_bridgeObjectRetain();
          v19(a1);
          swift_bridgeObjectRetain();
          String.hash(into:)();
          swift_bridgeObjectRelease();
          if (v18 == 1)
          {
            Hasher._combine(_:)(0);
          }
          else
          {
            Hasher._combine(_:)(1u);
            Hasher._combine(_:)(v28);
          }
          v16 += 7;
          Hasher._combine(_:)(v30);
          swift_bridgeObjectRelease();
          swift_release();
          --v15;
        }
        while (v15);
        swift_bridgeObjectRelease();
      }
      Hasher._combine(_:)(v25);
      if (v26)
      {
        Hasher._combine(_:)(0);
      }
      else
      {
        Hasher._combine(_:)(1u);
        Hasher._combine(_:)(v22);
      }
      uint64_t v5 = v24 + 1;
      outlined consume of NodePersonality(v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v24 + 1 != v21);
  }
}

{
  Swift::UInt v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)(a2 + 48);
    do
    {
      uint64_t v6 = *v5;
      v5 += 3;
      swift_bridgeObjectRetain();
      swift_retain();
      String.hash(into:)();
      uint64_t v7 = *(void (**)(uint64_t))(*(void *)v6 + 120);
      swift_retain();
      v7(a1);
      swift_bridgeObjectRelease();
      swift_release_n();
      --v4;
    }
    while (v4);
  }
}

BOOL specialized static DataTypeProperty.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return ((*(uint64_t (**)(void))(**(void **)(a1 + 16) + 128))(*(void *)(a2 + 16)) & 1) != 0
  }
        && (specialized static Array<A>.== infix(_:_:)(*(void **)(a1 + 24), *(void **)(a2 + 24)) & 1) != 0
        && ((*(unsigned __int8 *)(a1 + 32) ^ *(unsigned __int8 *)(a2 + 32)) & 1) == 0
        && *(void *)(a1 + 40) == *(void *)(a2 + 40);
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  BOOL result = 0;
  if (v5) {
    return ((*(uint64_t (**)(void))(**(void **)(a1 + 16) + 128))(*(void *)(a2 + 16)) & 1) != 0
  }
        && (specialized static Array<A>.== infix(_:_:)(*(void **)(a1 + 24), *(void **)(a2 + 24)) & 1) != 0
        && ((*(unsigned __int8 *)(a1 + 32) ^ *(unsigned __int8 *)(a2 + 32)) & 1) == 0
        && *(void *)(a1 + 40) == *(void *)(a2 + 40);
  return result;
}

unint64_t lazy protocol witness table accessor for type DataType and conformance DataType()
{
  unint64_t result = lazy protocol witness table cache variable for type DataType and conformance DataType;
  if (!lazy protocol witness table cache variable for type DataType and conformance DataType)
  {
    type metadata accessor for DataType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataType and conformance DataType);
  }
  return result;
}

uint64_t type metadata accessor for DataType()
{
  return self;
}

unint64_t lazy protocol witness table accessor for type DataTypeProperty and conformance DataTypeProperty()
{
  unint64_t result = lazy protocol witness table cache variable for type DataTypeProperty and conformance DataTypeProperty;
  if (!lazy protocol witness table cache variable for type DataTypeProperty and conformance DataTypeProperty)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DataTypeProperty and conformance DataTypeProperty);
  }
  return result;
}

uint64_t sub_25C3FCC98@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_25C3FCCE4(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 96);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t method lookup function for DataType(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DataType);
}

uint64_t dispatch thunk of DataType.properties.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of DataType.properties.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of DataType.properties.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of DataType.__allocating_init(properties:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DataType.hash(into:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DataType.isEqual(to:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of DataType.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of DataType.asMetalDataType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of DataType.hashValue.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t destroy for DataTypeProperty()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataTypeProperty(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataTypeProperty(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for DataTypeProperty(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for DataTypeProperty()
{
  return &type metadata for DataTypeProperty;
}

void *specialized Sequence.compactMap<A>(_:)(uint64_t a1, void *a2)
{
  uint64_t v34 = a2;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  Swift::String v25 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v7 - 8);
  Swift::UInt8 v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v31 = v12;
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v28 = (void (**)(uint64_t, char *, uint64_t))(v11 + 16);
    uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 32);
    uint64_t v26 = v14;
    uint64_t v27 = (void (**)(uint64_t, uint64_t))(v11 - 8);
    v24[1] = a1;
    swift_bridgeObjectRetain();
    Swift::UInt v15 = (void *)MEMORY[0x263F8EE78];
    Swift::String v30 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 40);
    v24[0] = (v11 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    v24[2] = v11;
    uint64_t v16 = (uint64_t)v25;
    while (1)
    {
      v31(v9, v13, v4);
      unint64_t v17 = *v30;
      (*v30)(v9, 0, 1, v4);
      if ((*v29)(v9, 1, v4) == 1) {
        break;
      }
      (*v28)(v16, v9, v4);
      closure #5 in NodeDefStore.loadLibrary()(v16, v34, (uint64_t *)&v33);
      if (v2)
      {
        (*v27)(v16, v4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v15;
      }
      (*v27)(v16, v4);
      if ((void)v33)
      {
        long long v32 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          Swift::UInt v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
        }
        unint64_t v19 = v15[2];
        unint64_t v18 = v15[3];
        long long v20 = v32;
        if (v19 >= v18 >> 1)
        {
          unint64_t v21 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v18 > 1), v19 + 1, 1, v15);
          long long v20 = v32;
          Swift::UInt v15 = v21;
        }
        void v15[2] = v19 + 1;
        *(_OWORD *)&v15[2 * v19 + 4] = v20;
        uint64_t v16 = (uint64_t)v25;
      }
      v13 += v26;
      if (!--v10)
      {
        v17(v9, 1, 1, v4);
        break;
      }
    }
  }
  else
  {
    Swift::String v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    swift_bridgeObjectRetain();
    Swift::UInt v15 = (void *)MEMORY[0x263F8EE78];
    v22(v9, 1, 1, v4);
  }
  swift_bridgeObjectRelease();
  return v15;
}

void *specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  uint64_t v4 = 32;
  do
  {
    uint64_t v6 = *(void *)(a1 + v4);
    swift_getObjectType();
    uint64_t v7 = swift_conformsToProtocol2();
    if (v7) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v8)
    {
      swift_unknownObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
      }
      unint64_t v11 = v3[2];
      unint64_t v10 = v3[3];
      if (v11 >= v10 >> 1) {
        uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v10 > 1), v11 + 1, 1, v3);
      }
      v3[2] = v11 + 1;
      uint64_t v5 = &v3[2 * v11];
      v5[4] = v8;
      v5[5] = v9;
    }
    v4 += 16;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph7NodeDefVG_SSs5NeverOTg504_s11d7Graph12fG120StoreV06createC03for2inAA0abC0VAA10XMLElement_p_AA0B0VztKFSSAA0cD0Vcfu0_32dc54af7003c11ac2eedf40a685444c7bAMSSTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v4 - 1);
      uint64_t v5 = *v4;
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v7 > 1, v8 + 1, 1);
      }
      v4 += 18;
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v6;
      *(void *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return result;
  }
  uint64_t v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  long long v33 = a2;
  while (1)
  {
    uint64_t v5 = *v4;
    uint64_t v6 = swift_unknownObjectRetain();
    createNodeDef(for:)(v6, v5, (uint64_t)v36);
    outlined init with take of MetalFunctionNode?((uint64_t)v36, (uint64_t)v37, &demangling cache variable for type metadata for NodeDef?);
    if (getEnumTag for IOAttachment((uint64_t)v37) == 1) {
      goto LABEL_4;
    }
    long long v44 = v37[6];
    long long v45 = v37[7];
    long long v46 = v37[8];
    long long v40 = v37[2];
    long long v41 = v37[3];
    long long v42 = v37[4];
    long long v43 = v37[5];
    long long v38 = v37[0];
    long long v39 = v37[1];
    swift_getObjectType();
    uint64_t v7 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
    if (!v8)
    {
      outlined release of NodeDef?(v36);
LABEL_4:
      swift_unknownObjectRelease();
      goto LABEL_5;
    }
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *a2;
    uint64_t v34 = v9;
    uint64_t v35 = (void *)*a2;
    *a2 = 0x8000000000000000;
    uint64_t v47 = v10;
    unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v10);
    uint64_t v15 = *(void *)(v12 + 16);
    BOOL v16 = (v13 & 1) == 0;
    uint64_t v17 = v15 + v16;
    if (__OFADD__(v15, v16)) {
      break;
    }
    char v18 = v13;
    if (*(void *)(v12 + 24) >= v17)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        specialized _NativeDictionary.copy()();
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v17, isUniquelyReferenced_nonNull_native);
      unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v47);
      if ((v18 & 1) != (v20 & 1)) {
        goto LABEL_23;
      }
      unint64_t v14 = v19;
    }
    if (v18)
    {
      outlined assign with take of NodeDef((uint64_t)&v38, v35[7] + 144 * v14);
    }
    else
    {
      v35[(v14 >> 6) + 8] |= 1 << v14;
      unint64_t v21 = (uint64_t *)(v35[6] + 16 * v14);
      uint64_t v22 = v47;
      *unint64_t v21 = v34;
      v21[1] = v22;
      Swift::String v23 = (_OWORD *)(v35[7] + 144 * v14);
      *Swift::String v23 = v38;
      long long v24 = v39;
      long long v25 = v40;
      long long v26 = v42;
      v23[3] = v41;
      v23[4] = v26;
      v23[1] = v24;
      v23[2] = v25;
      long long v27 = v43;
      long long v28 = v44;
      long long v29 = v46;
      v23[7] = v45;
      v23[8] = v29;
      v23[5] = v27;
      v23[6] = v28;
      uint64_t v30 = v35[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_22;
      }
      v35[2] = v32;
      swift_bridgeObjectRetain();
    }
    a2 = v33;
    void *v33 = v35;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    v4 += 2;
    if (!--v2) {
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;

  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    for (uint64_t i = (uint64_t *)(swift_bridgeObjectRetain() + 40); ; i += 2)
    {
      uint64_t v7 = *i;
      uint64_t v8 = swift_unknownObjectRetain();
      collectNodeDefs(_:into:)(v8, v7, a2);
      if (v3) {
        break;
      }
      swift_unknownObjectRelease();
      if (!--v4) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t *NodeDefStore.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static NodeDefStore.shared;
}

uint64_t NodeDefStore.nodeDef(named:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (!*(void *)(a3 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  if ((v9 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    _s11ShaderGraph7NodeDefVSgWOi0_(__dst);
    goto LABEL_6;
  }
  uint64_t v10 = (_OWORD *)(*(void *)(a3 + 56) + 144 * v8);
  v18[0] = *v10;
  long long v11 = v10[4];
  long long v13 = v10[1];
  long long v12 = v10[2];
  v18[3] = v10[3];
  v18[4] = v11;
  v18[1] = v13;
  void v18[2] = v12;
  long long v14 = v10[8];
  long long v16 = v10[5];
  long long v15 = v10[6];
  v18[7] = v10[7];
  v18[8] = v14;
  v18[5] = v16;
  v18[6] = v15;
  memmove(__dst, v10, 0x90uLL);
  destructiveProjectEnumData for NodePersonality.ShaderType(__dst);
  outlined retain of NodeDef((uint64_t)v18);
  swift_bridgeObjectRelease();
LABEL_6:
  outlined init with take of MetalFunctionNode?((uint64_t)__dst, (uint64_t)v20, &demangling cache variable for type metadata for NodeDef?);
  return outlined init with take of MetalFunctionNode?((uint64_t)v20, a4, &demangling cache variable for type metadata for NodeDef?);
}

uint64_t NodeDefStore.createNode(in:nodeDefName:label:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, _OWORD *a5@<X8>)
{
  if (*(void *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if (v11)
    {
      long long v12 = (_OWORD *)(*(void *)(a4 + 56) + 144 * v10);
      v36[0] = *v12;
      long long v13 = v12[4];
      long long v15 = v12[1];
      long long v14 = v12[2];
      v36[3] = v12[3];
      v36[4] = v13;
      v36[1] = v15;
      v36[2] = v14;
      long long v16 = v12[8];
      long long v18 = v12[5];
      long long v17 = v12[6];
      v36[7] = v12[7];
      v36[8] = v16;
      v36[5] = v18;
      v36[6] = v17;
      outlined retain of NodeDef((uint64_t)v36);
      swift_bridgeObjectRelease();
      specialized NodeDefStore.createNode(in:from:label:)(a1, v36, &v34);
      uint64_t result = outlined release of NodeDef((uint64_t)v36);
      long long v20 = v35[0];
      *a5 = v34;
      a5[1] = v20;
      *(_OWORD *)((char *)a5 + 25) = *(_OWORD *)((char *)v35 + 9);
      return result;
    }
    swift_bridgeObjectRelease();
  }
  v31[0] = a2;
  v31[1] = a3;
  _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi18_((uint64_t)v31);
  outlined init with take of UserGraphError.ErrorType((uint64_t)v31, (uint64_t)v32);
  lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
  long long v33 = 0uLL;
  swift_allocError();
  *unint64_t v21 = v32[0];
  long long v22 = v32[4];
  long long v24 = v32[1];
  long long v23 = v32[2];
  v21[3] = v32[3];
  v21[4] = v22;
  v21[1] = v24;
  v21[2] = v23;
  long long v25 = v32[8];
  long long v27 = v32[5];
  long long v26 = v32[6];
  v21[7] = v32[7];
  v21[8] = v25;
  v21[5] = v27;
  v21[6] = v26;
  long long v28 = v33;
  long long v30 = v32[9];
  long long v29 = v32[10];
  v21[11] = v32[11];
  v21[12] = v28;
  v21[9] = v30;
  v21[10] = v29;
  swift_bridgeObjectRetain();
  return swift_willThrow();
}

ShaderGraph::NodeDefStore __swiftcall NodeDefStore.init()()
{
  uint64_t v0 = MEMORY[0x263F8EE78];
  unint64_t v1 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  unint64_t v2 = specialized Dictionary.init(dictionaryLiteral:)(v0);
  uint64_t v3 = (void *)specialized Dictionary.init(dictionaryLiteral:)(v0);
  uint64_t v4 = (void *)v1;
  uint64_t v5 = (void *)v2;
  result.implementations._rawValue = v3;
  result.geomPropDefs._rawValue = v5;
  result.nodeDefs._rawValue = v4;
  return result;
}

void specialized thunk for @callee_guaranteed () -> (@owned [NodeDef.Implementation])(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
}

double NodeDefStore.createNode(for:in:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  specialized NodeDefStore.createNode(for:in:)(a1, a2, &v7);
  if (!v3)
  {
    long long v6 = v8[0];
    *a3 = v7;
    a3[1] = v6;
    double result = *(double *)((char *)v8 + 9);
    *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v8 + 9);
  }
  return result;
}

uint64_t NodeDefStore.implementations(for:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(void *)(a4 + 16)) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  swift_bridgeObjectRetain();
  unint64_t v7 = specialized __RawDictionaryStorage.find<A>(_:)(v6, v5);
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(a4 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t NodeDefStore.implementation(for:target:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for NodeDef.Implementation(0);
  uint64_t v38 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NodeDef.Implementation?);
  MEMORY[0x270FA5388](v11 - 8);
  long long v13 = (char *)v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a3 + 16)) {
    goto LABEL_13;
  }
  uint64_t v15 = *a1;
  long long v14 = (void *)a1[1];
  swift_bridgeObjectRetain();
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(v15, (uint64_t)v14);
  if ((v17 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_13:
    long long v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    return v26(a4, 1, 1, v8);
  }
  uint64_t v18 = *(void *)(*(void *)(a3 + 56) + 8 * v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void *)(v18 + 16);
  if (v19)
  {
    uint64_t v35 = v15;
    unint64_t v36 = v13;
    uint64_t v37 = a4;
    uint64_t v20 = v18 + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
    uint64_t v21 = *(void *)(v38 + 72);
    v34[1] = v18;
    swift_bridgeObjectRetain();
    while (1)
    {
      outlined init with copy of NodeDef.Implementation(v20, (uint64_t)v10, type metadata accessor for NodeDef.Implementation);
      uint64_t v22 = *(void *)&v10[*(int *)(v8 + 20)];
      if ((v22 & 0xC000000000000001) != 0)
      {
        if (!__CocoaSet.count.getter()) {
          break;
        }
      }
      else if (!*(void *)(v22 + 16))
      {
        break;
      }
      swift_retain();
      uint64_t v23 = swift_bridgeObjectRetain();
      char v24 = specialized Sequence.contains(where:)(v23);
      swift_bridgeObjectRelease();
      swift_release();
      if (v24) {
        break;
      }
      outlined destroy of NodeDef.Implementation((uint64_t)v10, type metadata accessor for NodeDef.Implementation);
      v20 += v21;
      if (!--v19)
      {
        swift_bridgeObjectRelease();
        uint64_t v25 = 1;
        long long v13 = v36;
        a4 = v37;
        uint64_t v15 = v35;
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease();
    long long v13 = v36;
    outlined init with take of NodeDef.Implementation((uint64_t)v10, (uint64_t)v36, type metadata accessor for NodeDef.Implementation);
    uint64_t v25 = 0;
    a4 = v37;
    uint64_t v15 = v35;
  }
  else
  {
    uint64_t v25 = 1;
  }
LABEL_18:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v13, v25, 1, v8);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v13, 1, v8) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_25C418EE0;
    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    _StringGuts.grow(_:)(48);
    v29._id object = (void *)0x800000025C427ED0;
    v29._countAndFlagsBits = 0xD000000000000024;
    String.append(_:)(v29);
    swift_bridgeObjectRetain();
    v30._countAndFlagsBits = v15;
    v30._id object = v14;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 0x2074656772617420;
    v31._id object = (void *)0xE800000000000000;
    String.append(_:)(v31);
    uint64_t v39 = a2;
    type metadata accessor for MaterialXTarget();
    _print_unlocked<A, B>(_:_:)();
    uint64_t v32 = v40;
    unint64_t v33 = v41;
    *(void *)(v28 + 56) = MEMORY[0x263F8D310];
    *(void *)(v28 + 32) = v32;
    *(void *)(v28 + 40) = v33;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
  return outlined init with take of MetalFunctionNode?((uint64_t)v13, a4, (uint64_t *)&demangling cache variable for type metadata for NodeDef.Implementation?);
}

uint64_t NodeDefStore.geomPropDef(named:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if (*(void *)(a3 + 16))
  {
    uint64_t v7 = result;
    swift_bridgeObjectRetain();
    unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(v7, a2);
    if (v9)
    {
      unint64_t v10 = *(void *)(a3 + 56) + (v8 << 6);
      uint64_t v11 = *(void *)(v10 + 8);
      uint64_t v21 = *(void *)v10;
      uint64_t v12 = *(void *)(v10 + 16);
      uint64_t v13 = *(void *)(v10 + 24);
      uint64_t v14 = *(void *)(v10 + 32);
      uint64_t v15 = *(unsigned __int8 *)(v10 + 40);
      uint64_t v16 = *(void *)(v10 + 48);
      char v17 = *(unsigned char *)(v10 + 56);
      unint64_t v18 = v15 | ((unint64_t)*(unsigned __int8 *)(v10 + 41) << 8);
      swift_bridgeObjectRetain();
      swift_retain();
      char v19 = v15;
      uint64_t v20 = v21;
      outlined copy of GeomPropDef.GeomProp(v13, v14, v19);
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      unint64_t v18 = 0;
      uint64_t v16 = 0;
      char v17 = 0;
    }
    double result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v18 = 0;
    uint64_t v16 = 0;
    char v17 = 0;
  }
  *(void *)a4 = v20;
  *(void *)(a4 + 8) = v11;
  *(void *)(a4 + 16) = v12;
  *(void *)(a4 + 24) = v13;
  *(void *)(a4 + 32) = v14;
  *(void *)(a4 + 40) = v18;
  *(void *)(a4 + 48) = v16;
  *(unsigned char *)(a4 + 56) = v17;
  return result;
}

uint64_t static NodeDefStore.createShared()()
{
  return specialized static NodeDefStore.createDefault()();
}

uint64_t static NodeDefStore.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v0 = static NodeDefStore.shared;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t NodeDefStore.nodeDefs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v1 = a1;
  return result;
}

uint64_t (*NodeDefStore.nodeDefs.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t NodeDefStore.geomPropDefs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NodeDefStore.geomPropDefs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*NodeDefStore.geomPropDefs.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t NodeDefStore.implementations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NodeDefStore.implementations.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*NodeDefStore.implementations.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

ShaderGraph::NodeDefStore __swiftcall NodeDefStore.init(nodeDefs:geomPropDefs:implementations:)(Swift::OpaquePointer nodeDefs, Swift::OpaquePointer geomPropDefs, Swift::OpaquePointer implementations)
{
  int64_t v4 = *((void *)nodeDefs._rawValue + 2);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v63 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    uint64_t v6 = v63;
    int64_t v7 = v4 - 1;
    for (uint64_t i = 32; ; i += 144)
    {
      long long v9 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 112);
      long long v60 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 96);
      long long v61 = v9;
      long long v62 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 128);
      long long v10 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 16);
      long long v54 = *(_OWORD *)((char *)nodeDefs._rawValue + i);
      long long v55 = v10;
      long long v11 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 48);
      long long v56 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 32);
      long long v57 = v11;
      long long v12 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 80);
      long long v58 = *(_OWORD *)((char *)nodeDefs._rawValue + i + 64);
      long long v59 = v12;
      long long v13 = v54;
      outlined retain of NodeDef((uint64_t)&v54);
      uint64_t v63 = v6;
      unint64_t v15 = *(void *)(v6 + 16);
      unint64_t v14 = *(void *)(v6 + 24);
      swift_bridgeObjectRetain();
      if (v15 >= v14 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v14 > 1, v15 + 1, 1);
        uint64_t v6 = v63;
      }
      long long v47 = v56;
      long long v48 = v57;
      long long v53 = v62;
      long long v51 = v60;
      long long v52 = v61;
      long long v49 = v58;
      long long v50 = v59;
      long long v45 = v54;
      long long v46 = v55;
      *(void *)(v6 + 16) = v15 + 1;
      uint64_t v16 = (_OWORD *)(v6 + 160 * v15);
      v16[2] = v13;
      v16[3] = v45;
      v16[6] = v48;
      v16[7] = v49;
      v16[4] = v46;
      v16[5] = v47;
      v16[10] = v52;
      v16[11] = v53;
      v16[8] = v50;
      v16[9] = v51;
      if (!v7) {
        break;
      }
      --v7;
    }
    swift_bridgeObjectRelease();
    rawValue = geomPropDefs._rawValue;
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (*(void *)(v6 + 16)) {
      goto LABEL_8;
    }
  }
  else
  {
    rawValue = geomPropDefs._rawValue;
    swift_bridgeObjectRelease();
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_8:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, NodeDef>);
      uint64_t v18 = static _DictionaryStorage.allocate(capacity:)();
      goto LABEL_11;
    }
  }
  uint64_t v18 = MEMORY[0x263F8EE80];
LABEL_11:
  *(void *)&long long v54 = v18;
  uint64_t v19 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v19, 1, &v54);
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)v54;
  int64_t v21 = rawValue[2];
  if (v21)
  {
    uint64_t v37 = (void *)v54;
    *(void *)&long long v54 = v5;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21, 0);
    uint64_t v22 = 0;
    uint64_t v23 = v54;
    do
    {
      uint64_t v24 = rawValue[v22 + 5];
      uint64_t v43 = rawValue[v22 + 4];
      uint64_t v25 = rawValue[v22 + 6];
      uint64_t v26 = rawValue[v22 + 7];
      uint64_t v27 = rawValue[v22 + 8];
      char v28 = rawValue[v22 + 9];
      char v42 = BYTE1(rawValue[v22 + 9]);
      uint64_t v41 = rawValue[v22 + 10];
      char v40 = rawValue[v22 + 11];
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v44 = v27;
      outlined copy of GeomPropDef.GeomProp(v26, v27, v28);
      *(void *)&long long v54 = v23;
      unint64_t v30 = *(void *)(v23 + 16);
      unint64_t v29 = *(void *)(v23 + 24);
      swift_bridgeObjectRetain();
      if (v30 >= v29 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v29 > 1, v30 + 1, 1);
        uint64_t v23 = v54;
      }
      *(void *)(v23 + 16) = v30 + 1;
      uint64_t v31 = v23 + 80 * v30;
      *(void *)(v31 + 32) = v43;
      *(void *)(v31 + 40) = v24;
      *(void *)(v31 + 48) = v43;
      *(void *)(v31 + 56) = v24;
      *(void *)(v31 + 64) = v25;
      *(void *)(v31 + 72) = v26;
      *(void *)(v31 + 80) = v44;
      *(unsigned char *)(v31 + 88) = v28;
      *(unsigned char *)(v31 + 89) = v42;
      *(void *)(v31 + 96) = v41;
      *(unsigned char *)(v31 + 104) = v40;
      v22 += 8;
      --v21;
      rawValue = geomPropDefs._rawValue;
    }
    while (v21);
    swift_bridgeObjectRelease();
    uint64_t v20 = v37;
    if (*(void *)(v23 + 16)) {
      goto LABEL_17;
    }
LABEL_19:
    uint64_t v32 = MEMORY[0x263F8EE80];
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  if (!*(void *)(MEMORY[0x263F8EE78] + 16)) {
    goto LABEL_19;
  }
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, GeomPropDef>);
  uint64_t v32 = static _DictionaryStorage.allocate(capacity:)();
LABEL_20:
  *(void *)&long long v54 = v32;
  uint64_t v33 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v33, 1, &v54);
  swift_bridgeObjectRelease();
  long long v34 = (void *)v54;
  uint64_t v35 = v20;
  unint64_t v36 = implementations._rawValue;
  result.implementations._rawValue = v36;
  result.geomPropDefs._rawValue = v34;
  result.nodeDefs._rawValue = v35;
  return result;
}

uint64_t NodeDefStore.implementation(for:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  type metadata accessor for MaterialXTarget();
  uint64_t inited = swift_initStaticObject();
  return NodeDefStore.implementation(for:target:)(a1, inited, a2, a3);
}

BOOL static NodeDefStore.Errors.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void NodeDefStore.Errors.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int NodeDefStore.Errors.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t static NodeDefStore.createDefault()()
{
  uint64_t result = specialized static NodeDefStore.createDefault()();
  if (v0) {
    return v2;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NodeDefStore.loadLibrary()()
{
  uint64_t v510 = type metadata accessor for NodeDef.Implementation(0);
  uint64_t v0 = MEMORY[0x270FA5388](v510);
  uint64_t v513 = (uint64_t)v490 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  v512 = (_OWORD *)((char *)v490 - v2);
  uint64_t v3 = type metadata accessor for CharacterSet();
  uint64_t v503 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)v490 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v506 = type metadata accessor for NSFastEnumerationIterator();
  v515 = *(char **)(v506 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v506);
  v504 = (char *)v490 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v490 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v516 = (uint64_t)v490 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)v490 - v14;
  MEMORY[0x270FA5388](v13);
  char v17 = (char *)v490 - v16;
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v517 = v18;
  uint64_t v518 = v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v521 = (uint64_t)v490 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v505 = (char *)v490 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  v525 = (ProtocolDescriptor *)((char *)v490 - v25);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v508 = (char *)v490 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  unint64_t v30 = (char *)v490 - v29;
  MEMORY[0x270FA5388](v28);
  v511 = (char *)v490 - v31;
  uint64_t v32 = (void *)MEMORY[0x261183E60](0xD000000000000015, 0x800000025C421E30);
  id v33 = objc_msgSend(self, sel_bundleWithIdentifier_, v32);

  if (!v33)
  {
    lazy protocol witness table accessor for type NodeDefStore.Errors and conformance NodeDefStore.Errors();
    swift_allocError();
    unsigned char *v59 = 0;
    swift_willThrow();
    return;
  }
  id v507 = v33;
  id v34 = objc_msgSend(v33, sel_resourceURL);
  if (!v34)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v518 + 56))(v17, 1, 1, v517);
    goto LABEL_20;
  }
  uint64_t v35 = v34;
  v501 = v5;
  uint64_t v522 = v3;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v37 = v517;
  uint64_t v36 = v518;
  uint64_t v38 = (ProtocolDescriptor *)(v518 + 32);
  uint64_t v39 = *(void **)(v518 + 32);
  ((void (*)(char *, char *, uint64_t))v39)(v17, v30, v517);
  v523 = *(void **)(v36 + 56);
  uint64_t v524 = v36 + 56;
  ((void (*)(char *, void, uint64_t, uint64_t))v523)(v17, 0, 1, v37);
  v519 = *(char **)(v36 + 48);
  uint64_t v520 = v36 + 48;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v519)(v17, 1, v37) == 1)
  {
LABEL_20:
    outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v17, &demangling cache variable for type metadata for URL?);
    lazy protocol witness table accessor for type NodeDefStore.Errors and conformance NodeDefStore.Errors();
    swift_allocError();
    *uint64_t v66 = 1;
    swift_willThrow();

    return;
  }
  v527 = v38;
  v578 = v39;
  ((void (*)(char *, char *, uint64_t))v39)(v511, v17, v37);
  char v40 = v508;
  URL.appendingPathComponent(_:isDirectory:)();
  v500 = (char *)self;
  id v41 = objc_msgSend(v500, sel_defaultManager);
  uint64_t v499 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<NSURLResourceKey>);
  uint64_t v42 = swift_allocObject();
  uint64_t v43 = specialized static Array._adoptStorage(_:count:)(v42, 1);
  uint64_t v44 = (void *)*MEMORY[0x263EFF750];
  *long long v45 = *MEMORY[0x263EFF750];
  destructiveProjectEnumData for NodePersonality.ShaderType(v43);
  id v498 = v44;
  long long v46 = NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();

  swift_bridgeObjectRelease();
  if (!v46)
  {

    uint64_t v94 = *(void (**)(void, void))(v518 + 8);
    v94(v40, v37);
    v94(v511, v37);
    return;
  }
  v497 = v15;
  uint64_t v532 = specialized ContiguousArray.init()();
  specialized ContiguousArray.reserveCapacity(_:)(0);
  id v47 = v46;
  NSEnumerator.makeIterator()();
  id v494 = v47;

  long long v48 = v9;
  uint64_t v49 = lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator((unint64_t *)&lazy protocol witness table cache variable for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator, MEMORY[0x263F06DC0]);
  uint64_t v50 = v506;
  dispatch thunk of IteratorProtocol.next()();
  while (v530)
  {
    outlined init with take of Any(&v529, v531);
    outlined init with copy of Any((uint64_t)v531, (uint64_t)&v529);
    swift_dynamicCast();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v531);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v51 = *(void *)(v532 + 16);
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v51);
    uint64_t v52 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v51, (uint64_t)v30);
    destructiveProjectEnumData for NodePersonality.ShaderType(v52);
    dispatch thunk of IteratorProtocol.next()();
  }
  long long v53 = (char *)*((void *)v515 + 1);
  v515 += 8;
  v495 = v53;
  uint64_t v496 = v49;
  ((void (*)(char *, uint64_t))v53)(v48, v50);
  outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v529, (uint64_t *)&demangling cache variable for type metadata for Any?);
  uint64_t v54 = v532;
  *(void *)&v531[0] = specialized ContiguousArray.init()();
  uint64_t v55 = specialized Array.count.getter(v54);
  uint64_t v56 = v37;
  uint64_t v57 = (uint64_t)v497;
  v514 = (char *)v55;
  if (v55)
  {
    uint64_t v58 = 0;
    v509 = (void (**)(ProtocolDescriptor *, uint64_t))(v518 + 16);
    v502 = (void (**)(ProtocolDescriptor *, uint64_t))(v518 + 8);
    while (1)
    {
      specialized Array._checkSubscript(_:wasNativeTypeChecked:)(v58, 1, v54);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v518 + 16))(v57, v54+ ((*(unsigned __int8 *)(v518 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v518 + 80))+ *(void *)(v518 + 72) * v58, v56);
      long long v60 = (char *)(v58 + 1);
      if (__OFADD__(v58, 1)) {
        goto LABEL_400;
      }
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v523)(v57, 0, 1, v56);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v519)(v57, 1, v56) == 1) {
        goto LABEL_22;
      }
      ((void (*)(ProtocolDescriptor *, uint64_t, uint64_t))v578)(v525, v57, v56);
      if (URL.pathExtension.getter() == 2020373613 && v61 == 0xE400000000000000) {
        break;
      }
      char v62 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v62) {
        goto LABEL_18;
      }
      uint64_t v56 = v517;
      (*v502)(v525, v517);
LABEL_11:
      ++v58;
      if (v60 == v514) {
        goto LABEL_21;
      }
    }
    swift_bridgeObjectRelease();
LABEL_18:
    uint64_t v63 = v517;
    ((void (*)(char *, ProtocolDescriptor *, uint64_t))v578)(v30, v525, v517);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v64 = *(void *)(*(void *)&v531[0] + 16);
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v64);
    uint64_t v65 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v64, (uint64_t)v30);
    destructiveProjectEnumData for NodePersonality.ShaderType(v65);
    uint64_t v56 = v63;
    goto LABEL_11;
  }
LABEL_21:
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v523)(v57, 1, 1, v56);
LABEL_22:
  swift_release();
  outlined destroy of (input: Input, fNode: MetalFunctionNode?)(v57, &demangling cache variable for type metadata for URL?);
  uint64_t v533 = *(void *)&v531[0];
  uint64_t v67 = v505;
  uint64_t v68 = v511;
  URL.appendingPathComponent(_:isDirectory:)();
  id v69 = objc_msgSend(v500, sel_defaultManager);
  uint64_t v70 = swift_allocObject();
  uint64_t v71 = specialized static Array._adoptStorage(_:count:)(v70, 1);
  id v72 = v498;
  void *v73 = v498;
  destructiveProjectEnumData for NodePersonality.ShaderType(v71);
  id v74 = v72;
  unint64_t v75 = NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)();

  swift_bridgeObjectRelease();
  if (!v75)
  {

    uint64_t v404 = v517;
    v405 = *(void (**)(void, void))(v518 + 8);
    v405(v67, v517);
    swift_bridgeObjectRelease();
    v405(v508, v404);
    v405(v68, v404);
    return;
  }
  uint64_t v532 = specialized ContiguousArray.init()();
  specialized ContiguousArray.reserveCapacity(_:)(0);
  id v76 = v75;
  unint64_t v77 = v504;
  NSEnumerator.makeIterator()();
  id v491 = v76;

  uint64_t v78 = v506;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v79 = v517;
  while (v530)
  {
    outlined init with take of Any(&v529, v531);
    outlined init with copy of Any((uint64_t)v531, (uint64_t)&v529);
    swift_dynamicCast();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v531);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v80 = *(void *)(v532 + 16);
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v80);
    uint64_t v81 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v80, (uint64_t)v30);
    destructiveProjectEnumData for NodePersonality.ShaderType(v81);
    dispatch thunk of IteratorProtocol.next()();
  }
  ((void (*)(char *, uint64_t))v495)(v77, v78);
  outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v529, (uint64_t *)&demangling cache variable for type metadata for Any?);
  uint64_t v82 = v532;
  *(void *)&v531[0] = specialized ContiguousArray.init()();
  uint64_t v83 = specialized Array.count.getter(v82);
  uint64_t v84 = v79;
  uint64_t v85 = v516;
  if (v83)
  {
    uint64_t v86 = v83;
    uint64_t v87 = 0;
    v525 = (ProtocolDescriptor *)(v518 + 16);
    v515 = (char *)(v518 + 8);
    do
    {
      specialized Array._checkSubscript(_:wasNativeTypeChecked:)(v87, 1, v82);
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v518 + 16))(v85, v82+ ((*(unsigned __int8 *)(v518 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v518 + 80))+ *(void *)(v518 + 72) * v87, v84);
      uint64_t v91 = v87 + 1;
      if (__OFADD__(v87, 1)) {
        goto LABEL_404;
      }
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v523)(v85, 0, 1, v84);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v519)(v85, 1, v84) == 1) {
        goto LABEL_38;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t))v578)(v521, v85, v84);
      if (URL.pathExtension.getter() == 2020373613 && v92 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v93 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v93 & 1) == 0)
        {
          uint64_t v84 = v517;
          (*(void (**)(uint64_t, uint64_t))v515)(v521, v517);
          goto LABEL_29;
        }
      }
      uint64_t v88 = v517;
      ((void (*)(char *, uint64_t, uint64_t))v578)(v30, v521, v517);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v89 = *(void *)(*(void *)&v531[0] + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v89);
      uint64_t v90 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v89, (uint64_t)v30);
      destructiveProjectEnumData for NodePersonality.ShaderType(v90);
      uint64_t v84 = v88;
      uint64_t v85 = v516;
LABEL_29:
      ++v87;
    }
    while (v91 != v86);
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v523)(v85, 1, 1, v84);
LABEL_38:
  swift_release();
  outlined destroy of (input: Input, fNode: MetalFunctionNode?)(v85, &demangling cache variable for type metadata for URL?);
  specialized Array.append<A>(contentsOf:)(*(uint64_t *)&v531[0]);
  uint64_t v95 = swift_bridgeObjectRetain();
  int64_t v96 = v528;
  int v97 = (char *)v526;
  uint64_t v98 = specialized Sequence.compactMap<A>(_:)(v95, v528);
  uint64_t v99 = v97;
  swift_bridgeObjectRelease();
  v502 = (void (**)(ProtocolDescriptor *, uint64_t))specialized Array._getCount()(v98);
  if (!v502)
  {

LABEL_309:
    uint64_t v406 = v517;
    v407 = *(void (**)(void, void))(v518 + 8);
    v407(v505, v517);
    swift_bridgeObjectRelease();
    v407(v508, v406);
    v407(v511, v406);
    swift_bridgeObjectRelease();
    return;
  }
  v504 = (char *)(v98 + 4);
  v578 = v96 + 1;
  v490[1] = v98;
  swift_bridgeObjectRetain();
  unint64_t v100 = 0;
  while (2)
  {
    if (__OFADD__(v100, 1)) {
      goto LABEL_408;
    }
    v509 = (void (**)(ProtocolDescriptor *, uint64_t))((char *)v100 + 1);
    uint64_t v101 = *(void *)&v504[16 * (void)v100];
    uint64_t v102 = *(void *)&v504[16 * (void)v100 + 8];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v104 = *(void *)(v102 + 8);
    swift_unknownObjectRetain();
    uint64_t v524 = ObjectType;
    uint64_t v516 = v101;
    uint64_t v105 = XMLNode.elements(forXPath:)(0x656465646F6E2F2ELL, 0xE900000000000066, ObjectType, v104);
    v523 = (void *)v104;
    if (v99)
    {

      uint64_t v106 = 0;
      uint64_t v107 = v524;
      goto LABEL_45;
    }
    uint64_t v140 = (uint64_t)v105;
    v526 = 0;
    uint64_t v141 = specialized Array._getCount()(v105);
    if (v141)
    {
      uint64_t v142 = v141;
      swift_bridgeObjectRetain();
      uint64_t v143 = 0;
      uint64_t v520 = v140;
      uint64_t v521 = v142;
      v144 = (uint64_t *)(v140 + 40);
      while (1)
      {
        uint64_t v145 = v143 + 1;
        if (__OFADD__(v143, 1)) {
          goto LABEL_389;
        }
        uint64_t v146 = *v144;
        uint64_t v147 = swift_unknownObjectRetain();
        createNodeDef(for:)(v147, v146, (uint64_t)v534);
        outlined init with take of MetalFunctionNode?((uint64_t)v534, (uint64_t)v562, &demangling cache variable for type metadata for NodeDef?);
        if (getEnumTag for IOAttachment((uint64_t)v562) != 1)
        {
          long long v569 = v562[6];
          long long v570 = v562[7];
          long long v571 = v562[8];
          long long v565 = v562[2];
          long long v566 = v562[3];
          long long v568 = v562[5];
          long long v567 = v562[4];
          long long v564 = v562[1];
          long long v563 = v562[0];
          swift_getObjectType();
          uint64_t v148 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
          if (v149)
          {
            Swift::String v150 = v149;
            uint64_t v151 = v148;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v153 = v96;
            char v154 = isUniquelyReferenced_nonNull_native;
            *(void *)&v531[0] = *v153;
            uint64_t v155 = *(void *)&v531[0];
            void *v153 = 0x8000000000000000;
            v525 = (ProtocolDescriptor *)v151;
            v527 = v150;
            unint64_t v157 = specialized __RawDictionaryStorage.find<A>(_:)(v151, (uint64_t)v150);
            uint64_t v158 = *(void *)(v155 + 16);
            BOOL v159 = (v156 & 1) == 0;
            uint64_t v160 = v158 + v159;
            if (__OFADD__(v158, v159)) {
              goto LABEL_399;
            }
            char v161 = v156;
            if (*(void *)(v155 + 24) >= v160)
            {
              if (v154)
              {
                v164 = *(void **)&v531[0];
                if ((v156 & 1) == 0) {
                  goto LABEL_82;
                }
              }
              else
              {
                specialized _NativeDictionary.copy()();
                v164 = *(void **)&v531[0];
                if ((v161 & 1) == 0) {
                  goto LABEL_82;
                }
              }
            }
            else
            {
              specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v160, v154);
              unint64_t v162 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v525, (uint64_t)v527);
              if ((v161 & 1) != (v163 & 1)) {
                goto LABEL_423;
              }
              unint64_t v157 = v162;
              v164 = *(void **)&v531[0];
              if ((v161 & 1) == 0)
              {
LABEL_82:
                v164[(v157 >> 6) + 8] |= 1 << v157;
                Swift::String v165 = (ProtocolDescriptor **)(v164[6] + 16 * v157);
                char v166 = v527;
                *Swift::String v165 = v525;
                v165[1] = v166;
                char v167 = (_OWORD *)(v164[7] + 144 * v157);
                *char v167 = v563;
                long long v168 = v564;
                long long v169 = v565;
                long long v170 = v567;
                v167[3] = v566;
                v167[4] = v170;
                v167[1] = v168;
                v167[2] = v169;
                long long v171 = v568;
                long long v172 = v569;
                long long v173 = v571;
                v167[7] = v570;
                v167[8] = v173;
                v167[5] = v171;
                v167[6] = v172;
                uint64_t v174 = v164[2];
                BOOL v137 = __OFADD__(v174, 1);
                uint64_t v175 = v174 + 1;
                if (v137) {
                  goto LABEL_405;
                }
                v164[2] = v175;
                swift_bridgeObjectRetain();
                goto LABEL_84;
              }
            }
            outlined assign with take of NodeDef((uint64_t)&v563, v164[7] + 144 * v157);
LABEL_84:
            char v176 = v528;
            void *v528 = v164;
            int64_t v96 = v176;
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v142 = v521;
            goto LABEL_69;
          }
          outlined release of NodeDef?(v534);
        }
        swift_unknownObjectRelease();
LABEL_69:
        v144 += 2;
        ++v143;
        if (v145 == v142)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v104 = (uint64_t)v523;
          goto LABEL_88;
        }
      }
    }
    swift_bridgeObjectRelease();
LABEL_88:
    uint64_t v177 = (*(uint64_t (**)(uint64_t, uint64_t))(v104 + 24))(v524, v104);
    if (!v177)
    {
      uint64_t v107 = v524;
      uint64_t v106 = (char *)v526;
      goto LABEL_45;
    }
    uint64_t v178 = v177;
    uint64_t v179 = specialized static Array._allocateUninitialized(_:)(0);
    *(void *)&v531[0] = v179;
    uint64_t v180 = specialized Array._getCount()(v178);
    if (v180)
    {
      uint64_t v181 = v180;
      if (v180 < 1) {
        goto LABEL_419;
      }
      swift_bridgeObjectRetain();
      uint64_t v182 = 32;
      do
      {
        uint64_t v183 = *(void *)(v178 + v182);
        swift_getObjectType();
        uint64_t v184 = swift_conformsToProtocol2();
        if (v184) {
          uint64_t v185 = v184;
        }
        else {
          uint64_t v185 = 0;
        }
        if (v184) {
          uint64_t v186 = v183;
        }
        else {
          uint64_t v186 = 0;
        }
        if (v186)
        {
          swift_unknownObjectRetain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          uint64_t v187 = *(void *)(*(void *)&v531[0] + 16);
          specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v187);
          uint64_t v188 = v187;
          int64_t v96 = v528;
          uint64_t v189 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v188, v186, v185);
          destructiveProjectEnumData for NodePersonality.ShaderType(v189);
        }
        v182 += 16;
        --v181;
      }
      while (v181);
      swift_bridgeObjectRelease_n();
      uint64_t v179 = *(void *)&v531[0];
      uint64_t v104 = (uint64_t)v523;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v204 = (char *)specialized Array._getCount()(v179);
    uint64_t v107 = v524;
    v495 = v204;
    if (!v204)
    {
      swift_bridgeObjectRelease();
      uint64_t v106 = (char *)v526;
      goto LABEL_45;
    }
    uint64_t v496 = v179 + 32;
    uint64_t v493 = v179;
    swift_bridgeObjectRetain();
    v205 = 0;
    while (1)
    {
      v514 = v205 + 1;
      if (__OFADD__(v205, 1)) {
        goto LABEL_413;
      }
      v206 = *(char **)(v496 + 16 * (void)v205);
      uint64_t v207 = *(void *)(v496 + 16 * (void)v205 + 8);
      uint64_t v208 = swift_getObjectType();
      uint64_t v209 = *(void *)(v207 + 8);
      swift_unknownObjectRetain();
      v519 = v206;
      v210 = v526;
      v211 = XMLNode.elements(forXPath:)(0x656465646F6E2F2ELL, 0xE900000000000066, v208, v209);
      v526 = v210;
      if (v210)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        v315 = v526;
        goto LABEL_305;
      }
      v212 = v211;
      uint64_t v521 = specialized Array._getCount()(v211);
      if (v521)
      {
        v515 = (char *)v209;
        uint64_t v520 = v208;
        swift_bridgeObjectRetain();
        uint64_t v213 = 0;
        uint64_t v506 = (uint64_t)v212;
        v214 = v212 + 5;
        uint64_t v215 = v521;
        while (1)
        {
          uint64_t v216 = v213 + 1;
          if (__OFADD__(v213, 1)) {
            goto LABEL_391;
          }
          uint64_t v217 = *v214;
          uint64_t v218 = swift_unknownObjectRetain();
          createNodeDef(for:)(v218, v217, (uint64_t)v535);
          outlined init with take of MetalFunctionNode?((uint64_t)v535, (uint64_t)v552, &demangling cache variable for type metadata for NodeDef?);
          if (getEnumTag for IOAttachment((uint64_t)v552) != 1)
          {
            long long v559 = v552[6];
            long long v560 = v552[7];
            long long v561 = v552[8];
            long long v555 = v552[2];
            long long v556 = v552[3];
            long long v558 = v552[5];
            long long v557 = v552[4];
            long long v554 = v552[1];
            long long v553 = v552[0];
            swift_getObjectType();
            uint64_t v219 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
            if (v220)
            {
              v221 = v220;
              uint64_t v222 = v219;
              char v223 = swift_isUniquelyReferenced_nonNull_native();
              v224 = v96;
              char v225 = v223;
              *(void *)&v531[0] = *v224;
              uint64_t v226 = *(void *)&v531[0];
              void *v224 = 0x8000000000000000;
              v525 = (ProtocolDescriptor *)v222;
              v527 = v221;
              unint64_t v228 = specialized __RawDictionaryStorage.find<A>(_:)(v222, (uint64_t)v221);
              uint64_t v229 = *(void *)(v226 + 16);
              BOOL v230 = (v227 & 1) == 0;
              uint64_t v231 = v229 + v230;
              if (__OFADD__(v229, v230)) {
                goto LABEL_401;
              }
              char v232 = v227;
              if (*(void *)(v226 + 24) >= v231)
              {
                if (v225)
                {
                  v235 = *(void **)&v531[0];
                  if ((v227 & 1) == 0) {
                    goto LABEL_141;
                  }
                }
                else
                {
                  specialized _NativeDictionary.copy()();
                  v235 = *(void **)&v531[0];
                  if ((v232 & 1) == 0) {
                    goto LABEL_141;
                  }
                }
              }
              else
              {
                specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v231, v225);
                unint64_t v233 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v525, (uint64_t)v527);
                if ((v232 & 1) != (v234 & 1)) {
                  goto LABEL_423;
                }
                unint64_t v228 = v233;
                v235 = *(void **)&v531[0];
                if ((v232 & 1) == 0)
                {
LABEL_141:
                  v235[(v228 >> 6) + 8] |= 1 << v228;
                  v236 = (ProtocolDescriptor **)(v235[6] + 16 * v228);
                  v237 = v527;
                  *v236 = v525;
                  v236[1] = v237;
                  v238 = (_OWORD *)(v235[7] + 144 * v228);
                  _OWORD *v238 = v553;
                  long long v239 = v554;
                  long long v240 = v555;
                  long long v241 = v557;
                  v238[3] = v556;
                  v238[4] = v241;
                  v238[1] = v239;
                  v238[2] = v240;
                  long long v242 = v558;
                  long long v243 = v559;
                  long long v244 = v561;
                  v238[7] = v560;
                  v238[8] = v244;
                  v238[5] = v242;
                  v238[6] = v243;
                  uint64_t v245 = v235[2];
                  BOOL v137 = __OFADD__(v245, 1);
                  uint64_t v246 = v245 + 1;
                  if (v137) {
                    goto LABEL_407;
                  }
                  v235[2] = v246;
                  swift_bridgeObjectRetain();
                  goto LABEL_143;
                }
              }
              outlined assign with take of NodeDef((uint64_t)&v553, v235[7] + 144 * v228);
LABEL_143:
              v247 = v528;
              void *v528 = v235;
              int64_t v96 = v247;
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v215 = v521;
              goto LABEL_128;
            }
            outlined release of NodeDef?(v535);
          }
          swift_unknownObjectRelease();
LABEL_128:
          v214 += 2;
          ++v213;
          if (v216 == v215)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v208 = v520;
            uint64_t v209 = (uint64_t)v515;
            goto LABEL_146;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_146:
      uint64_t v248 = (*(uint64_t (**)(uint64_t, uint64_t))(v209 + 24))(v208, v209);
      if (v248) {
        break;
      }
      swift_unknownObjectRelease();
      uint64_t v104 = (uint64_t)v523;
      uint64_t v107 = v524;
LABEL_214:
      v205 = v514;
      if (v514 == v495)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v106 = (char *)v526;
        goto LABEL_45;
      }
    }
    uint64_t v249 = v248;
    uint64_t v250 = specialized static Array._allocateUninitialized(_:)(0);
    *(void *)&v531[0] = v250;
    uint64_t v251 = specialized Array._getCount()(v249);
    uint64_t v104 = (uint64_t)v523;
    if (v251)
    {
      uint64_t v252 = v251;
      if (v251 < 1) {
        goto LABEL_421;
      }
      swift_bridgeObjectRetain();
      uint64_t v253 = 32;
      do
      {
        uint64_t v254 = *(void *)(v249 + v253);
        swift_getObjectType();
        uint64_t v255 = swift_conformsToProtocol2();
        if (v255) {
          uint64_t v256 = v255;
        }
        else {
          uint64_t v256 = 0;
        }
        if (v255) {
          uint64_t v257 = v254;
        }
        else {
          uint64_t v257 = 0;
        }
        if (v257)
        {
          swift_unknownObjectRetain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          uint64_t v258 = *(void *)(*(void *)&v531[0] + 16);
          specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v258);
          uint64_t v259 = v258;
          int64_t v96 = v528;
          uint64_t v260 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v259, v257, v256);
          destructiveProjectEnumData for NodePersonality.ShaderType(v260);
        }
        v253 += 16;
        --v252;
      }
      while (v252);
      swift_bridgeObjectRelease_n();
      uint64_t v250 = *(void *)&v531[0];
      uint64_t v104 = (uint64_t)v523;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v261 = (char *)specialized Array._getCount()(v250);
    uint64_t v107 = v524;
    v500 = v261;
    if (!v261)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_214;
    }
    uint64_t v506 = v250 + 32;
    uint64_t v492 = v250;
    swift_bridgeObjectRetain();
    v262 = 0;
    while (1)
    {
      v515 = (char *)v262 + 1;
      if (__OFADD__(v262, 1)) {
        goto LABEL_412;
      }
      uint64_t v263 = *(void *)(v506 + 16 * (void)v262);
      uint64_t v264 = *(void *)(v506 + 16 * (void)v262 + 8);
      uint64_t v265 = swift_getObjectType();
      id v266 = *(id *)(v264 + 8);
      swift_unknownObjectRetain();
      v267 = v526;
      v268 = XMLNode.elements(forXPath:)(0x656465646F6E2F2ELL, 0xE900000000000066, v265, (uint64_t)v266);
      v526 = v267;
      if (v267)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        v315 = v526;
        goto LABEL_304;
      }
      v269 = v268;
      uint64_t v270 = specialized Array._getCount()(v268);
      uint64_t v520 = v263;
      uint64_t v521 = v270;
      if (v270)
      {
        id v498 = v266;
        uint64_t v499 = v265;
        swift_bridgeObjectRetain();
        uint64_t v271 = 0;
        v497 = (char *)v269;
        v272 = v269 + 5;
        uint64_t v273 = v521;
        while (1)
        {
          uint64_t v274 = v271 + 1;
          if (__OFADD__(v271, 1)) {
            goto LABEL_387;
          }
          uint64_t v275 = *v272;
          uint64_t v276 = swift_unknownObjectRetain();
          createNodeDef(for:)(v276, v275, (uint64_t)v536);
          outlined init with take of MetalFunctionNode?((uint64_t)v536, (uint64_t)v550, &demangling cache variable for type metadata for NodeDef?);
          if (getEnumTag for IOAttachment((uint64_t)v550) != 1)
          {
            v551[6] = v550[6];
            v551[7] = v550[7];
            v551[8] = v550[8];
            v551[2] = v550[2];
            v551[3] = v550[3];
            v551[5] = v550[5];
            v551[4] = v550[4];
            v551[1] = v550[1];
            v551[0] = v550[0];
            swift_getObjectType();
            uint64_t v277 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
            if (v278)
            {
              v279 = v278;
              uint64_t v280 = v277;
              char v281 = swift_isUniquelyReferenced_nonNull_native();
              v282 = v96;
              char v283 = v281;
              *(void *)&v531[0] = *v282;
              uint64_t v284 = *(void *)&v531[0];
              void *v282 = 0x8000000000000000;
              v525 = (ProtocolDescriptor *)v280;
              v527 = v279;
              unint64_t v286 = specialized __RawDictionaryStorage.find<A>(_:)(v280, (uint64_t)v279);
              uint64_t v287 = *(void *)(v284 + 16);
              BOOL v288 = (v285 & 1) == 0;
              uint64_t v289 = v287 + v288;
              if (__OFADD__(v287, v288)) {
                goto LABEL_396;
              }
              char v290 = v285;
              if (*(void *)(v284 + 24) >= v289)
              {
                if ((v283 & 1) == 0) {
                  specialized _NativeDictionary.copy()();
                }
              }
              else
              {
                specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v289, v283);
                unint64_t v291 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v525, (uint64_t)v527);
                if ((v290 & 1) != (v292 & 1)) {
                  goto LABEL_423;
                }
                unint64_t v286 = v291;
              }
              int64_t v96 = v528;
              uint64_t v293 = *(void *)&v531[0];
              if (v290)
              {
                outlined assign with take of NodeDef((uint64_t)v551, *(void *)(*(void *)&v531[0] + 56) + 144 * v286);
              }
              else
              {
                specialized _NativeDictionary._insert(at:key:value:)(v286, (uint64_t)v525, (uint64_t)v527, v551, *(void **)&v531[0]);
                swift_bridgeObjectRetain();
              }
              *int64_t v96 = v293;
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v273 = v521;
              goto LABEL_172;
            }
            outlined release of NodeDef?(v536);
          }
          swift_unknownObjectRelease();
LABEL_172:
          v272 += 2;
          ++v271;
          if (v274 == v273)
          {
            swift_bridgeObjectRelease_n();
            id v266 = v498;
            uint64_t v265 = v499;
            goto LABEL_188;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_188:
      uint64_t v294 = (*((uint64_t (**)(uint64_t, id))v266 + 3))(v265, v266);
      if (v294) {
        break;
      }
      swift_unknownObjectRelease();
      uint64_t v104 = (uint64_t)v523;
      uint64_t v107 = v524;
LABEL_165:
      v262 = v515;
      if (v515 == v500)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_214;
      }
    }
    uint64_t v295 = v294;
    uint64_t v296 = specialized static Array._allocateUninitialized(_:)(0);
    *(void *)&v531[0] = v296;
    uint64_t v297 = specialized Array._getCount()(v295);
    if (v297)
    {
      uint64_t v298 = v297;
      if (v297 < 1) {
        goto LABEL_418;
      }
      swift_bridgeObjectRetain();
      uint64_t v299 = 32;
      do
      {
        uint64_t v300 = *(void *)(v295 + v299);
        swift_getObjectType();
        uint64_t v301 = swift_conformsToProtocol2();
        if (v301) {
          uint64_t v302 = v301;
        }
        else {
          uint64_t v302 = 0;
        }
        if (v301) {
          uint64_t v303 = v300;
        }
        else {
          uint64_t v303 = 0;
        }
        if (v303)
        {
          swift_unknownObjectRetain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          uint64_t v304 = *(void *)(*(void *)&v531[0] + 16);
          specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v304);
          uint64_t v305 = v304;
          int64_t v96 = v528;
          uint64_t v306 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v305, v303, v302);
          destructiveProjectEnumData for NodePersonality.ShaderType(v306);
        }
        v299 += 16;
        --v298;
      }
      while (v298);
      swift_bridgeObjectRelease_n();
      uint64_t v296 = *(void *)&v531[0];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v307 = specialized Array._getCount()(v296);
    uint64_t v104 = (uint64_t)v523;
    uint64_t v107 = v524;
    v525 = (ProtocolDescriptor *)v307;
    if (!v307)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_165;
    }
    swift_bridgeObjectRetain();
    uint64_t v308 = 0;
    uint64_t v521 = v296;
    v309 = (uint64_t *)(v296 + 40);
    while (1)
    {
      if (__OFADD__(v308, 1)) {
        goto LABEL_402;
      }
      v527 = (ProtocolDescriptor *)(v308 + 1);
      uint64_t v310 = *v309;
      uint64_t v311 = swift_getObjectType();
      uint64_t v312 = *(void *)(v310 + 8);
      swift_unknownObjectRetain();
      v313 = v526;
      v314 = XMLNode.elements(forXPath:)(0x656465646F6E2F2ELL, 0xE900000000000066, v311, v312);
      v315 = v313;
      if (v313) {
        break;
      }
      v316 = v528;
      specialized Sequence.forEach(_:)((uint64_t)v314, v528);
      swift_bridgeObjectRelease();
      uint64_t v317 = (*(uint64_t (**)(uint64_t, uint64_t))(v312 + 24))(v311, v312);
      if (v317)
      {
        v318 = specialized Sequence.compactMap<A>(_:)(v317);
        swift_bridgeObjectRelease();
        specialized Sequence.forEach(_:)((uint64_t)v318, v316);
        int64_t v96 = v316;
        v526 = 0;
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v526 = 0;
        swift_unknownObjectRelease();
        int64_t v96 = v316;
      }
      uint64_t v107 = v524;
      v309 += 2;
      ++v308;
      uint64_t v104 = (uint64_t)v523;
      if (v527 == v525)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_165;
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease();
    int64_t v96 = v528;
LABEL_304:
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
LABEL_305:
    swift_bridgeObjectRelease();

    uint64_t v104 = (uint64_t)v523;
    uint64_t v106 = 0;
LABEL_45:
    long long v108 = XMLNode.elements(forXPath:)(0x72706D6F65672F2ELL, 0xED0000666564706FLL, v107, v104);
    uint64_t v99 = v106;
    if (v106)
    {

      swift_unknownObjectRelease();
      uint64_t v99 = 0;
      goto LABEL_41;
    }
    uint64_t v109 = (uint64_t)v108;
    v527 = (ProtocolDescriptor *)specialized Array._getCount()(v108);
    if (v527)
    {
      swift_bridgeObjectRetain();
      uint64_t v110 = 0;
      uint64_t v111 = (uint64_t *)(v109 + 40);
      v525 = (ProtocolDescriptor *)v109;
      do
      {
        uint64_t v112 = (ProtocolDescriptor *)(v110 + 1);
        if (__OFADD__(v110, 1)) {
          goto LABEL_390;
        }
        uint64_t v113 = *v111;
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v114 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
        if (v115)
        {
          uint64_t v116 = v114;
          uint64_t v117 = v115;
          createGeomPropDef(for:)(v113, (uint64_t)v537);
          if (v99)
          {

            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v99 = 0;
          }
          else
          {
            v526 = 0;
            uint64_t v118 = v578;
            char v119 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v120 = v116;
            *(void *)&v531[0] = *v118;
            uint64_t v121 = *(void *)&v531[0];
            void *v118 = 0x8000000000000000;
            uint64_t v521 = v120;
            unint64_t v123 = specialized __RawDictionaryStorage.find<A>(_:)(v120, v117);
            uint64_t v124 = *(void *)(v121 + 16);
            BOOL v125 = (v122 & 1) == 0;
            uint64_t v126 = v124 + v125;
            if (__OFADD__(v124, v125)) {
              goto LABEL_403;
            }
            if (*(void *)(v121 + 24) >= v126)
            {
              if ((v119 & 1) == 0)
              {
                char v139 = v122;
                specialized _NativeDictionary.copy()();
                LOBYTE(v122) = v139;
              }
            }
            else
            {
              LODWORD(v520) = v122;
              specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v126, v119);
              unint64_t v127 = specialized __RawDictionaryStorage.find<A>(_:)(v521, v117);
              int v128 = v122 & 1;
              LOBYTE(v122) = v520;
              if ((v520 & 1) != v128) {
                goto LABEL_423;
              }
              unint64_t v123 = v127;
            }
            uint64_t v129 = v521;
            Swift::String v130 = *(void **)&v531[0];
            if (v122)
            {
              outlined assign with take of GeomPropDef((uint64_t)v537, *(void *)(*(void *)&v531[0] + 56) + (v123 << 6));
            }
            else
            {
              *(void *)(*(void *)&v531[0] + 8 * (v123 >> 6) + 64) |= 1 << v123;
              uint64_t v131 = (uint64_t *)(v130[6] + 16 * v123);
              *uint64_t v131 = v129;
              v131[1] = v117;
              uint64_t v132 = (_OWORD *)(v130[7] + (v123 << 6));
              long long v133 = v537[0];
              long long v134 = v537[1];
              long long v135 = v538[0];
              *(_OWORD *)((char *)v132 + 41) = *(_OWORD *)((char *)v538 + 9);
              v132[1] = v134;
              v132[2] = v135;
              *uint64_t v132 = v133;
              uint64_t v136 = v130[2];
              BOOL v137 = __OFADD__(v136, 1);
              uint64_t v138 = v136 + 1;
              if (v137) {
                goto LABEL_409;
              }
              v130[2] = v138;
              swift_bridgeObjectRetain();
            }
            void *v578 = v130;
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v99 = (char *)v526;
          }
        }
        else
        {
          swift_unknownObjectRelease();
        }
        v111 += 2;
        ++v110;
      }
      while (v112 != v527);
      swift_bridgeObjectRelease_n();
      int64_t v96 = v528;
      uint64_t v104 = (uint64_t)v523;
      uint64_t v107 = v524;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v190 = (*(uint64_t (**)(uint64_t, uint64_t))(v104 + 24))(v107, v104);
    if (!v190)
    {
      swift_unknownObjectRelease();
      goto LABEL_41;
    }
    uint64_t v191 = v190;
    char v192 = (char *)specialized static Array._allocateUninitialized(_:)(0);
    *(void *)&v531[0] = v192;
    uint64_t v193 = specialized Array._getCount()(v191);
    if (v193)
    {
      uint64_t v194 = v193;
      if (v193 < 1) {
        goto LABEL_420;
      }
      v527 = &protocol descriptor for XMLElement;
      swift_bridgeObjectRetain();
      uint64_t v195 = 32;
      do
      {
        uint64_t v196 = *(void *)(v191 + v195);
        swift_getObjectType();
        uint64_t v197 = swift_conformsToProtocol2();
        if (v197) {
          uint64_t v198 = v197;
        }
        else {
          uint64_t v198 = 0;
        }
        if (v197) {
          uint64_t v199 = v196;
        }
        else {
          uint64_t v199 = 0;
        }
        if (v199)
        {
          swift_unknownObjectRetain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v200 = v99;
          uint64_t v201 = *(void *)(*(void *)&v531[0] + 16);
          specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v201);
          uint64_t v202 = v201;
          uint64_t v99 = v200;
          uint64_t v203 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v202, v199, v198);
          destructiveProjectEnumData for NodePersonality.ShaderType(v203);
        }
        v195 += 16;
        --v194;
      }
      while (v194);
      swift_bridgeObjectRelease_n();
      char v192 = *(char **)&v531[0];
      int64_t v96 = v528;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v515 = (char *)specialized Array._getCount()(v192);
    if (!v515)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
LABEL_41:
      unint64_t v100 = v509;
      if (v509 == v502)
      {
        swift_bridgeObjectRelease();
        v408 = (void (**)(void, void))(v503 + 8);
        swift_bridgeObjectRetain();
        uint64_t v409 = 0;
        id v498 = (id)0x800000025C422390;
        v495 = (char *)0x800000025C4223B0;
        uint64_t v496 = 0xD000000000000010;
        v526 = v408;
        while (1)
        {
          uint64_t v499 = v409 + 1;
          if (__OFADD__(v409, 1)) {
            goto LABEL_414;
          }
          v410 = *(char **)&v504[16 * v409];
          uint64_t v411 = *(void *)&v504[16 * v409 + 8];
          uint64_t v412 = swift_getObjectType();
          uint64_t v413 = *(void *)(v411 + 8);
          swift_unknownObjectRetain();
          v414 = XMLNode.elements(forXPath:)(0xD000000000000015, (uint64_t)v498, v412, v413);
          if (v99) {
            break;
          }
          v515 = 0;
          v416 = v414;
          uint64_t v417 = specialized Array._getCount()(v414);
          v500 = v410;
          v514 = (char *)v417;
          if (v417)
          {
            v509 = (void (**)(ProtocolDescriptor *, uint64_t))(v416 + 4);
            v497 = (char *)v416;
            swift_bridgeObjectRetain();
            v418 = 0;
            uint64_t v506 = v412;
            uint64_t v503 = v413;
            while (!__OFADD__(v418, 1))
            {
              v519 = v418 + 1;
              v422 = (ProtocolDescriptor **)&v509[2 * (void)v418];
              v424 = *v422;
              uint64_t v423 = (uint64_t)v422[1];
              swift_getObjectType();
              uint64_t v516 = v423;
              swift_unknownObjectRetain();
              uint64_t v520 = XMLNode.subscript.getter(0x66656465646F6ELL, 0xE700000000000000);
              uint64_t v521 = v425;
              if (v425)
              {
                uint64_t v426 = XMLNode.subscript.getter(0x746567726174, 0xE600000000000000);
                if (v427)
                {
                  *(void *)&v531[0] = v426;
                  *((void *)&v531[0] + 1) = v427;
                  *(void *)&long long v529 = 44;
                  *((void *)&v529 + 1) = 0xE100000000000000;
                  lazy protocol witness table accessor for type String and conformance String();
                  uint64_t v428 = StringProtocol.components<A>(separatedBy:)();
                  swift_bridgeObjectRelease();
                  uint64_t v429 = specialized Array.count.getter(v428);
                  v527 = v424;
                  if (v429)
                  {
                    uint64_t v430 = v429;
                    *(void *)&long long v529 = specialized ContiguousArray.init()();
                    specialized ContiguousArray.reserveCapacity(_:)(v430);
                    if (v430 < 0) {
                      goto LABEL_416;
                    }
                    v578 = (void *)v428;
                    v431 = (uint64_t *)(v428 + 40);
                    v432 = v501;
                    do
                    {
                      uint64_t v433 = *v431;
                      *(void *)&v531[0] = *(v431 - 1);
                      *((void *)&v531[0] + 1) = v433;
                      swift_bridgeObjectRetain();
                      static CharacterSet.whitespacesAndNewlines.getter();
                      uint64_t v434 = StringProtocol.trimmingCharacters(in:)();
                      uint64_t v436 = v435;
                      (*v526)(v432, v522);
                      swift_bridgeObjectRelease();
                      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                      uint64_t v437 = *(void *)(v529 + 16);
                      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v437);
                      uint64_t v438 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v437, v434, v436);
                      destructiveProjectEnumData for NodePersonality.ShaderType(v438);
                      v431 += 2;
                      --v430;
                    }
                    while (v430);
                    swift_bridgeObjectRelease();
                    int64_t v96 = v528;
                    uint64_t v439 = v529;
                    v424 = v527;
                  }
                  else
                  {
                    uint64_t v439 = specialized static Array._allocateUninitialized(_:)(0);
                    swift_bridgeObjectRelease();
                  }
                  uint64_t v441 = specialized Array.count.getter(v439);
                  if (v441)
                  {
                    uint64_t v442 = v441;
                    *(void *)&v531[0] = specialized ContiguousArray.init()();
                    specialized ContiguousArray.reserveCapacity(_:)();
                    if (v442 < 0) {
                      goto LABEL_417;
                    }
                    v443 = 0;
                    uint64_t v524 = v439;
                    v525 = (ProtocolDescriptor *)(v439 + 32);
                    v523 = (void *)v442;
                    while (v443 != (void *)v442)
                    {
                      v578 = v443;
                      v445 = &v525->Flags + 4 * (void)v443;
                      uint64_t v447 = *(void *)v445;
                      uint64_t v446 = *((void *)v445 + 1);
                      uint64_t v448 = one-time initialization token for allTargets;
                      swift_bridgeObjectRetain();
                      if (v448 != -1) {
                        swift_once();
                      }
                      uint64_t v449 = static MaterialXTarget.allTargets;
                      swift_bridgeObjectRetain_n();
                      uint64_t v450 = specialized Array.count.getter(v449);
                      if (!v450) {
                        goto LABEL_422;
                      }
                      uint64_t v451 = v450;
                      BOOL IsNativeType = specialized Array._hoistableIsNativeTypeChecked()(v449);
                      if (IsNativeType)
                      {
                        uint64_t v453 = *(void *)(v449 + 32);
                        swift_retain();
                      }
                      else
                      {
                        uint64_t v453 = MEMORY[0x2611848A0](0, v449);
                      }
                      BOOL v454 = *(void *)(v453 + 16) == v447 && *(void *)(v453 + 24) == v446;
                      v444 = v578;
                      if (!v454 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
                      {
                        swift_release();
                        if (v451 == 1) {
                          goto LABEL_422;
                        }
                        uint64_t v455 = 5;
                        while (1)
                        {
                          if (IsNativeType)
                          {
                            uint64_t v456 = *(void *)(v449 + 8 * v455);
                            swift_retain();
                          }
                          else
                          {
                            uint64_t v456 = MEMORY[0x2611848A0](v455 - 4, v449);
                          }
                          uint64_t v457 = v455 - 3;
                          if (__OFADD__(v455 - 4, 1)) {
                            break;
                          }
                          BOOL v458 = *(void *)(v456 + 16) == v447 && *(void *)(v456 + 24) == v446;
                          if (v458 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                          {
                            v444 = v578;
                            goto LABEL_335;
                          }
                          swift_release();
                          ++v455;
                          if (v457 == v451) {
                            goto LABEL_422;
                          }
                        }
                        __break(1u);
                        goto LABEL_384;
                      }
LABEL_335:
                      v443 = (void *)((char *)v444 + 1);
                      swift_bridgeObjectRelease_n();
                      swift_bridgeObjectRelease();
                      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                      specialized ContiguousArray._endMutation()();
                      uint64_t v442 = (uint64_t)v523;
                      v424 = v527;
                      int64_t v96 = v528;
                      if (v443 == v523)
                      {
                        unint64_t v440 = *(void *)&v531[0];
                        goto LABEL_363;
                      }
                    }
                    goto LABEL_388;
                  }
                  unint64_t v440 = specialized static Array._allocateUninitialized(_:)(0);
LABEL_363:
                  swift_bridgeObjectRelease();
                }
                else
                {
                  unint64_t v440 = specialized static Array._allocateUninitialized(_:)(0);
                }
                v459 = (void *)*v96;
                uint64_t v460 = v96[1];
                uint64_t v461 = v96[2];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                v462 = v515;
                createGraph(_:nodeDefStore:)(v424, v516, v459, v460, v461, v548);
                v515 = v462;
                if (v462)
                {
                  swift_bridgeObjectRelease_n();
                  swift_unknownObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v415 = v515;
                  goto LABEL_314;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                long long v463 = v549[0];
                v464 = v512;
                v512[8] = v548[8];
                v464[9] = v463;
                *(_OWORD *)((char *)v464 + 153) = *(_OWORD *)((char *)v549 + 9);
                long long v465 = v548[5];
                v464[4] = v548[4];
                v464[5] = v465;
                long long v466 = v548[7];
                v464[6] = v548[6];
                v464[7] = v466;
                long long v467 = v548[1];
                _OWORD *v464 = v548[0];
                v464[1] = v467;
                long long v468 = v548[3];
                v464[2] = v548[2];
                v464[3] = v468;
                type metadata accessor for NodeDef.Implementation.Kind(0);
                swift_storeEnumTagMultiPayload();
                outlined retain of Graph((uint64_t)v548);
                uint64_t v469 = specialized Set.init<A>(_:)(v440);
                swift_bridgeObjectRelease();
                *(void *)((char *)v464 + *(int *)(v510 + 20)) = v469;
                outlined init with copy of NodeDef.Implementation((uint64_t)v464, v513, type metadata accessor for NodeDef.Implementation);
                char v470 = swift_isUniquelyReferenced_nonNull_native();
                *(void *)&v531[0] = v96[2];
                uint64_t v471 = *(void *)&v531[0];
                v96[2] = 0x8000000000000000;
                unint64_t v473 = specialized __RawDictionaryStorage.find<A>(_:)(v520, v521);
                uint64_t v474 = *(void *)(v471 + 16);
                BOOL v475 = (v472 & 1) == 0;
                uint64_t v476 = v474 + v475;
                if (__OFADD__(v474, v475)) {
                  goto LABEL_410;
                }
                char v477 = v472;
                if (*(void *)(v471 + 24) >= v476)
                {
                  if ((v470 & 1) == 0)
                  {
                    specialized _NativeDictionary.copy()();
                    uint64_t v471 = *(void *)&v531[0];
                  }
                }
                else
                {
                  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v476, v470);
                  uint64_t v471 = *(void *)&v531[0];
                  unint64_t v478 = specialized __RawDictionaryStorage.find<A>(_:)(v520, v521);
                  if ((v477 & 1) != (v479 & 1)) {
                    goto LABEL_423;
                  }
                  unint64_t v473 = v478;
                }
                v96[2] = v471;
                swift_bridgeObjectRelease();
                v480 = (void *)v96[2];
                swift_bridgeObjectRetain();
                if ((v477 & 1) == 0)
                {
                  specialized _NativeDictionary._insert(at:key:value:)(v473, v520, v521, MEMORY[0x263F8EE78], v480);
                  swift_bridgeObjectRetain();
                }
                uint64_t v419 = v480[7];
                swift_bridgeObjectRelease();
                specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
                uint64_t v420 = *(void *)(*(void *)(v419 + 8 * v473) + 16);
                specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v420);
                uint64_t v421 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v420, v513);
                destructiveProjectEnumData for NodePersonality.ShaderType(v421);
                outlined release of Graph((uint64_t)v548);
                swift_bridgeObjectRelease();
                outlined destroy of NodeDef.Implementation((uint64_t)v512, type metadata accessor for NodeDef.Implementation);
              }
              swift_unknownObjectRelease();
              v418 = v519;
              uint64_t v412 = v506;
              uint64_t v413 = v503;
              if (v519 == v514)
              {
                swift_bridgeObjectRelease();
                goto LABEL_374;
              }
            }
            goto LABEL_406;
          }
LABEL_374:
          swift_bridgeObjectRelease();
          v481 = v515;
          v482 = XMLNode.elements(forXPath:)(v496, (uint64_t)v495, v412, v413);
          uint64_t v99 = v481;
          if (v481)
          {
            v415 = v481;
            goto LABEL_314;
          }
          v483 = v482;
          uint64_t v484 = specialized Array._getCount()(v482);
          if (v484)
          {
            uint64_t v485 = v484;
            swift_bridgeObjectRetain();
            uint64_t v486 = 0;
            v487 = v483 + 5;
            while (1)
            {
              uint64_t v488 = v486 + 1;
              if (__OFADD__(v486, 1)) {
                goto LABEL_415;
              }
              uint64_t v489 = *v487;
              *(void *)&v531[0] = *(v487 - 1);
              *((void *)&v531[0] + 1) = v489;
              swift_unknownObjectRetain();
              closure #2 in collectImplementations(_:into:)((uint64_t *)v531, (unint64_t)v96);
              swift_unknownObjectRelease();
              v487 += 2;
              ++v486;
              if (v488 == v485)
              {
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease_n();
                goto LABEL_315;
              }
            }
          }
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
LABEL_315:
          uint64_t v409 = v499;
          if ((void (**)(ProtocolDescriptor *, uint64_t))v499 == v502) {
            goto LABEL_385;
          }
        }
        v415 = v99;
LABEL_314:

        swift_unknownObjectRelease();
        uint64_t v99 = 0;
        goto LABEL_315;
      }
      continue;
    }
    break;
  }
  v514 = v192 + 32;
  v500 = v192;
  swift_bridgeObjectRetain();
  v319 = 0;
  while (1)
  {
    if (__OFADD__(v319, 1)) {
      goto LABEL_394;
    }
    v519 = v319 + 1;
    uint64_t v320 = *(void *)&v514[16 * (void)v319];
    uint64_t v321 = *(void *)&v514[16 * (void)v319 + 8];
    uint64_t v322 = swift_getObjectType();
    uint64_t v323 = *(void *)(v321 + 8);
    swift_unknownObjectRetain();
    v324 = XMLNode.elements(forXPath:)(0x72706D6F65672F2ELL, 0xED0000666564706FLL, v322, v323);
    if (v99)
    {

      swift_unknownObjectRelease();
      uint64_t v99 = 0;
      goto LABEL_222;
    }
    v325 = v324;
    v326 = (ProtocolDescriptor *)specialized Array._getCount()(v324);
    v525 = (ProtocolDescriptor *)v320;
    v527 = v326;
    if (v326)
    {
      uint64_t v520 = v323;
      uint64_t v521 = v322;
      swift_bridgeObjectRetain();
      uint64_t v327 = 0;
      uint64_t v506 = (uint64_t)v325;
      v328 = v325 + 5;
      while (1)
      {
        v329 = (ProtocolDescriptor *)(v327 + 1);
        if (__OFADD__(v327, 1)) {
          break;
        }
        uint64_t v330 = *v328;
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v331 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
        if (v332)
        {
          uint64_t v333 = v331;
          uint64_t v334 = v332;
          createGeomPropDef(for:)(v330, (uint64_t)v539);
          if (v99)
          {

            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v99 = 0;
          }
          else
          {
            v526 = 0;
            v335 = v578;
            char v336 = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v337 = v333;
            *(void *)&v531[0] = *v335;
            uint64_t v338 = *(void *)&v531[0];
            void *v335 = 0x8000000000000000;
            uint64_t v524 = v337;
            unint64_t v340 = specialized __RawDictionaryStorage.find<A>(_:)(v337, v334);
            uint64_t v341 = *(void *)(v338 + 16);
            BOOL v342 = (v339 & 1) == 0;
            uint64_t v343 = v341 + v342;
            if (__OFADD__(v341, v342)) {
              goto LABEL_392;
            }
            if (*(void *)(v338 + 24) >= v343)
            {
              if ((v336 & 1) == 0)
              {
                char v355 = v339;
                specialized _NativeDictionary.copy()();
                LOBYTE(v339) = v355;
              }
            }
            else
            {
              LODWORD(v523) = v339;
              specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v343, v336);
              unint64_t v344 = specialized __RawDictionaryStorage.find<A>(_:)(v524, v334);
              int v345 = v339 & 1;
              LOBYTE(v339) = (_BYTE)v523;
              if ((v523 & 1) != v345) {
                goto LABEL_423;
              }
              unint64_t v340 = v344;
            }
            uint64_t v346 = v524;
            v347 = *(void **)&v531[0];
            if (v339)
            {
              outlined assign with take of GeomPropDef((uint64_t)v539, *(void *)(*(void *)&v531[0] + 56) + (v340 << 6));
            }
            else
            {
              *(void *)(*(void *)&v531[0] + 8 * (v340 >> 6) + 64) |= 1 << v340;
              v348 = (uint64_t *)(v347[6] + 16 * v340);
              uint64_t *v348 = v346;
              v348[1] = v334;
              v349 = (_OWORD *)(v347[7] + (v340 << 6));
              long long v350 = v539[0];
              long long v351 = v539[1];
              long long v352 = v540[0];
              *(_OWORD *)((char *)v349 + 41) = *(_OWORD *)((char *)v540 + 9);
              v349[1] = v351;
              v349[2] = v352;
              _OWORD *v349 = v350;
              uint64_t v353 = v347[2];
              BOOL v137 = __OFADD__(v353, 1);
              uint64_t v354 = v353 + 1;
              if (v137) {
                goto LABEL_395;
              }
              v347[2] = v354;
              swift_bridgeObjectRetain();
            }
            void *v578 = v347;
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v99 = (char *)v526;
          }
        }
        else
        {
          swift_unknownObjectRelease();
        }
        v328 += 2;
        ++v327;
        if (v329 == v527)
        {
          swift_bridgeObjectRelease_n();
          int64_t v96 = v528;
          uint64_t v323 = v520;
          uint64_t v322 = v521;
          goto LABEL_246;
        }
      }
LABEL_384:
      __break(1u);
LABEL_385:

      swift_bridgeObjectRelease();
      goto LABEL_309;
    }
    swift_bridgeObjectRelease();
LABEL_246:
    uint64_t v356 = (*(uint64_t (**)(uint64_t, uint64_t))(v323 + 24))(v322, v323);
    if (!v356)
    {
      swift_unknownObjectRelease();
      goto LABEL_222;
    }
    v357 = (ProtocolDescriptor *)v356;
    uint64_t v358 = specialized static Array._allocateUninitialized(_:)(0);
    *(void *)&v531[0] = v358;
    uint64_t v359 = specialized Array._getCount()(v357);
    if (v359)
    {
      uint64_t v360 = v359;
      v527 = v357;
      if (v359 < 1) {
        goto LABEL_411;
      }
      v361 = v527;
      swift_bridgeObjectRetain();
      uint64_t v362 = 32;
      do
      {
        uint64_t v363 = *(void *)((char *)&v361->Flags + v362);
        swift_getObjectType();
        uint64_t v364 = swift_conformsToProtocol2();
        if (v364) {
          uint64_t v365 = v364;
        }
        else {
          uint64_t v365 = 0;
        }
        if (v364) {
          uint64_t v366 = v363;
        }
        else {
          uint64_t v366 = 0;
        }
        if (v366)
        {
          swift_unknownObjectRetain();
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v367 = v99;
          uint64_t v368 = *(void *)(*(void *)&v531[0] + 16);
          specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v368);
          uint64_t v369 = v368;
          uint64_t v99 = v367;
          v361 = v527;
          uint64_t v370 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v369, v366, v365);
          destructiveProjectEnumData for NodePersonality.ShaderType(v370);
        }
        v362 += 16;
        --v360;
      }
      while (v360);
      swift_bridgeObjectRelease_n();
      uint64_t v358 = *(void *)&v531[0];
      int64_t v96 = v528;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v371 = specialized Array._getCount()(v358);
    if (v371) {
      break;
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
LABEL_222:
    v319 = v519;
    if (v519 == v515)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_41;
    }
  }
  uint64_t v372 = v371;
  uint64_t v524 = v358 + 32;
  uint64_t v506 = v358;
  swift_bridgeObjectRetain();
  v373 = 0;
  uint64_t v521 = v372;
  while (!__OFADD__(v373, 1))
  {
    v527 = (ProtocolDescriptor *)((char *)&v373->Flags + 1);
    v374 = *(void **)(v524 + 16 * (void)v373);
    uint64_t v375 = *(void *)(v524 + 16 * (void)v373 + 8);
    uint64_t v376 = swift_getObjectType();
    uint64_t v377 = *(void *)(v375 + 8);
    swift_unknownObjectRetain();
    v378 = XMLNode.elements(forXPath:)(0x72706D6F65672F2ELL, 0xED0000666564706FLL, v376, v377);
    if (v99)
    {

      swift_unknownObjectRelease();
      uint64_t v99 = 0;
    }
    else
    {
      uint64_t v379 = (uint64_t)v378;
      v523 = v374;
      uint64_t v380 = specialized Array._getCount()(v378);
      if (v380)
      {
        uint64_t v381 = v380;
        if (v380 < 1) {
          goto LABEL_393;
        }
        v526 = (void (**)(void, void))v376;
        swift_bridgeObjectRetain();
        uint64_t v520 = v379;
        v382 = (uint64_t *)(v379 + 40);
        do
        {
          uint64_t v383 = *v382;
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v384 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
          if (v385)
          {
            uint64_t v386 = v384;
            uint64_t v387 = v385;
            createGeomPropDef(for:)(v383, (uint64_t)&v541);
            long long v573 = v542;
            long long v574 = v543;
            uint64_t v572 = v541;
            unint64_t v575 = v544 | ((unint64_t)v545 << 8);
            uint64_t v576 = v546;
            char v577 = v547;
            specialized Dictionary.subscript.setter((uint64_t)&v572, v386, v387);
          }
          swift_unknownObjectRelease();
          v382 += 2;
          --v381;
        }
        while (v381);
        swift_bridgeObjectRelease_n();
        uint64_t v99 = 0;
        int64_t v96 = v528;
        uint64_t v376 = (uint64_t)v526;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      uint64_t v388 = (*(uint64_t (**)(uint64_t, uint64_t))(v377 + 24))(v376, v377);
      uint64_t v372 = v521;
      if (v388)
      {
        uint64_t v389 = v388;
        uint64_t v390 = specialized static Array._allocateUninitialized(_:)(0);
        *(void *)&v531[0] = v390;
        uint64_t v391 = specialized Array._getCount()(v389);
        if (v391)
        {
          uint64_t v392 = v391;
          if (v391 < 1) {
            goto LABEL_397;
          }
          v526 = (void (**)(void, void))v99;
          swift_bridgeObjectRetain();
          uint64_t v393 = 32;
          do
          {
            uint64_t v394 = *(void *)(v389 + v393);
            swift_getObjectType();
            uint64_t v395 = swift_conformsToProtocol2();
            if (v395) {
              uint64_t v396 = v395;
            }
            else {
              uint64_t v396 = 0;
            }
            if (v395) {
              uint64_t v397 = v394;
            }
            else {
              uint64_t v397 = 0;
            }
            if (v397)
            {
              swift_unknownObjectRetain();
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              uint64_t v398 = *(void *)(*(void *)&v531[0] + 16);
              specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v398);
              uint64_t v399 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v398, v397, v396);
              destructiveProjectEnumData for NodePersonality.ShaderType(v399);
            }
            v393 += 16;
            --v392;
          }
          while (v392);
          swift_bridgeObjectRelease_n();
          uint64_t v390 = *(void *)&v531[0];
          int64_t v96 = v528;
          uint64_t v99 = (char *)v526;
          uint64_t v372 = v521;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        uint64_t v400 = specialized Array._getCount()(v390);
        if (v400)
        {
          uint64_t v401 = v400;
          if (v400 < 1) {
            goto LABEL_398;
          }
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v401; ++i)
          {
            uint64_t v403 = v390 + 16 * i;
            v531[0] = *(_OWORD *)(v403 + 32);
            closure #3 in collectGeomPropDefs(_:into:)((uint64_t *)v531, (uint64_t)v96);
          }
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    v373 = v527;
    if (v527 == (ProtocolDescriptor *)v372)
    {
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_222;
    }
  }
  __break(1u);
LABEL_387:
  __break(1u);
LABEL_388:
  __break(1u);
LABEL_389:
  __break(1u);
LABEL_390:
  __break(1u);
LABEL_391:
  __break(1u);
LABEL_392:
  __break(1u);
LABEL_393:
  __break(1u);
LABEL_394:
  __break(1u);
LABEL_395:
  __break(1u);
LABEL_396:
  __break(1u);
LABEL_397:
  __break(1u);
LABEL_398:
  __break(1u);
LABEL_399:
  __break(1u);
LABEL_400:
  __break(1u);
LABEL_401:
  __break(1u);
LABEL_402:
  __break(1u);
LABEL_403:
  __break(1u);
LABEL_404:
  __break(1u);
LABEL_405:
  __break(1u);
LABEL_406:
  __break(1u);
LABEL_407:
  __break(1u);
LABEL_408:
  __break(1u);
LABEL_409:
  __break(1u);
LABEL_410:
  __break(1u);
LABEL_411:
  __break(1u);
LABEL_412:
  __break(1u);
LABEL_413:
  __break(1u);
LABEL_414:
  __break(1u);
LABEL_415:
  __break(1u);
LABEL_416:
  __break(1u);
LABEL_417:
  __break(1u);
LABEL_418:
  __break(1u);
LABEL_419:
  __break(1u);
LABEL_420:
  __break(1u);
LABEL_421:
  __break(1u);
LABEL_422:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_423:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NodeDefStore.applyStandardLibraryFixes()()
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = *v1;
  if (*(void *)(v5 + 16))
  {
    unint64_t v0 = specialized __RawDictionaryStorage.find<A>(_:)(0x56556473555F444ELL, 0xEF65727574786554);
    if (v6)
    {
      uint64_t v43 = v4;
      uint64_t v7 = (long long *)(*(void *)(v5 + 56) + 144 * v0);
      long long v8 = v7[3];
      long long v9 = v7[4];
      long long v10 = v7[2];
      long long v51 = v7[1];
      long long v52 = v10;
      long long v11 = *v7;
      long long v53 = v8;
      long long v54 = v9;
      long long v50 = v11;
      long long v12 = v7[5];
      long long v13 = v7[6];
      long long v14 = v7[8];
      long long v57 = v7[7];
      long long v58 = v14;
      long long v55 = v12;
      long long v56 = v13;
      uint64_t v15 = v14;
      int64_t v16 = *(void *)(v14 + 16);
      if (v16)
      {
        outlined retain of NodeDef((uint64_t)&v50);
        uint64_t v73 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16, 0);
        uint64_t v17 = 0;
        uint64_t v18 = v73;
        uint64_t v44 = v15;
        while (1)
        {
          uint64_t v19 = v15 + v17;
          uint64_t v20 = *(void *)(v15 + v17 + 32);
          uint64_t v21 = *(void *)(v19 + 40);
          uint64_t v22 = *(void *)(v19 + 48);
          uint64_t v45 = *(void *)(v19 + 56);
          uint64_t v46 = v20;
          long long v48 = *(_OWORD *)(v19 + 64);
          uint64_t v47 = *(void *)(v19 + 80);
          BOOL v23 = v20 == 0x5370617277 && v21 == 0xE500000000000000;
          if (v23 || (char v24 = *(unsigned char *)(v19 + 88), (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
          {
            uint64_t v25 = v18;
            uint64_t v26 = one-time initialization token for uAddressMode;
            swift_bridgeObjectRetain_n();
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (v26 != -1) {
              swift_once();
            }
            uint64_t v27 = static MaterialXDataType.uAddressMode;
            swift_retain();
            swift_bridgeObjectRetain();
          }
          else
          {
            BOOL v28 = v20 == 0x5470617277 && v21 == 0xE500000000000000;
            if (!v28 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
            {
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_retain();
              swift_bridgeObjectRetain();
              goto LABEL_22;
            }
            uint64_t v25 = v18;
            uint64_t v29 = one-time initialization token for vAddressMode;
            swift_bridgeObjectRetain_n();
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if (v29 != -1) {
              swift_once();
            }
            uint64_t v27 = static MaterialXDataType.vAddressMode;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          char v24 = 1;
          uint64_t v22 = v27;
          uint64_t v18 = v25;
LABEL_22:
          uint64_t v73 = v18;
          unint64_t v31 = *(void *)(v18 + 16);
          unint64_t v30 = *(void *)(v18 + 24);
          if (v31 >= v30 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
            uint64_t v18 = v73;
          }
          *(void *)(v18 + 16) = v31 + 1;
          unint64_t v32 = v18 + (v31 << 6);
          *(void *)(v32 + 32) = v46;
          *(void *)(v32 + 40) = v21;
          uint64_t v15 = v44;
          *(void *)(v32 + 48) = v22;
          *(void *)(v32 + 56) = v45;
          *(_OWORD *)(v32 + 64) = v48;
          *(void *)(v32 + 80) = v47;
          v17 += 64;
          *(unsigned char *)(v32 + 88) = v24;
          if (!--v16)
          {
            swift_bridgeObjectRelease();
            uint64_t v49 = v18;
            goto LABEL_28;
          }
        }
      }
      outlined retain of NodeDef((uint64_t)&v50);
      uint64_t v49 = MEMORY[0x263F8EE78];
LABEL_28:
      unint64_t v33 = *((void *)&v50 + 1);
      unint64_t v34 = v50;
      long long v35 = v51;
      long long v36 = v53;
      uint64_t v37 = *((void *)&v55 + 1);
      uint64_t v38 = *((void *)&v58 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      outlined release of NodeDef((uint64_t)&v50);
      v59[0] = __PAIR128__(v33, v34);
      v59[1] = v35;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      long long v62 = v36;
      uint64_t v63 = 0;
      uint64_t v64 = 0;
      char v65 = 2;
      uint64_t v66 = v37;
      uint64_t v67 = 0;
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      uint64_t v70 = 1;
      uint64_t v71 = v49;
      uint64_t v72 = v38;
      uint64_t v4 = v43;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v73 = *v43;
      *uint64_t v43 = 0x8000000000000000;
      specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v59, 0x56556473555F444ELL, 0xEF65727574786554, isUniquelyReferenced_nonNull_native);
      *uint64_t v43 = v73;
      unint64_t v0 = swift_bridgeObjectRelease();
      uint64_t v3 = v2;
    }
  }
  MEMORY[0x270FA5388](v0);
  uint64_t v40 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v40, (void (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #2 in NodeDefStore.applyStandardLibraryFixes());
  swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v41 = swift_bridgeObjectRetain();
    uint64_t v42 = specialized _NativeDictionary.mapValues<A>(_:)(v41);
    swift_bridgeObjectRelease();
    uint64_t *v4 = v42;
    swift_bridgeObjectRelease();
  }
}

void closure #5 in NodeDefStore.loadLibrary()(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v63 = a3;
  uint64_t v62 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v62 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v62);
  long long v9 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  long long v12 = (char *)&v56 - v11;
  MEMORY[0x270FA5388](v10);
  long long v14 = (char *)&v56 - v13;
  uint64_t v15 = Data.init(contentsOf:options:)();
  uint64_t v61 = (uint8_t *)v16;
  if (v3)
  {

    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)logger);
    uint64_t v18 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v14, a1, v62);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      v65[0] = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      uint64_t v61 = v21 + 4;
      lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x263F06EA8]);
      uint64_t v23 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v66 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v18);
      _os_log_impl(&dword_25C27E000, v19, v20, "Failed to load contents of %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x261185880](v22, -1, -1);
      MEMORY[0x261185880](v21, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v18);
    }

LABEL_11:
    uint64_t v39 = v63;
    uint64_t *v63 = 0;
    v39[1] = 0;
    return;
  }
  uint64_t v25 = v15;
  long long v57 = a2;
  uint64_t v58 = (uint64_t)v9;
  uint64_t v59 = v6;
  id v26 = objc_allocWithZone(MEMORY[0x263F08D58]);
  outlined copy of Data._Representation(v25, (unint64_t)v61);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v28 = objc_msgSend(v26, sel_initWithData_, isa);

  uint64_t v29 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XMLParserDelegate()), sel_init);
  objc_msgSend(v28, sel_setDelegate_, v29);
  objc_msgSend(v28, sel_parse);
  unint64_t v30 = (uint64_t *)&v29[OBJC_IVAR____TtC11ShaderGraph17XMLParserDelegate_rootElement];
  swift_beginAccess();
  uint64_t v31 = *v30;
  uint64_t v60 = v25;
  if (!v31)
  {

    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)logger);
    uint64_t v41 = v59;
    uint64_t v42 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v12, a1, v62);
    uint64_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      uint64_t v66 = v58;
      *(_DWORD *)uint64_t v45 = 136315138;
      long long v57 = (void *)(v45 + 4);
      lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x263F06EA8]);
      uint64_t v46 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v64 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v42);
      _os_log_impl(&dword_25C27E000, v43, v44, "Failed to find root element for XML at %s", (uint8_t *)v45, 0xCu);
      uint64_t v48 = v58;
      swift_arrayDestroy();
      MEMORY[0x261185880](v48, -1, -1);
      MEMORY[0x261185880](v45, -1, -1);
      uint64_t v49 = v60;
      unint64_t v50 = (unint64_t)v61;
      outlined consume of Data._Representation(v60, (unint64_t)v61);

      outlined consume of Data._Representation(v49, v50);
    }
    else
    {
      uint64_t v51 = v60;
      unint64_t v52 = (unint64_t)v61;
      outlined consume of Data._Representation(v60, (unint64_t)v61);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v42);
      outlined consume of Data._Representation(v51, v52);
    }
    goto LABEL_11;
  }
  uint64_t v32 = v30[1];
  uint64_t v33 = v31;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v35 = swift_conformsToProtocol2();
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v35 + 24);
    swift_unknownObjectRetain_n();
    v37(ObjectType, v36);
    swift_unknownObjectRelease();

    uint64_t v38 = v57;
    collectNodeDefs(_:into:)(v33, v32, v57);
    collectGeomPropDefs(_:into:)(v33, v32, (uint64_t)v38);
    uint64_t v53 = v60;
    unint64_t v54 = (unint64_t)v61;
    outlined consume of Data._Representation(v60, (unint64_t)v61);
    outlined consume of Data._Representation(v53, v54);
    long long v55 = v63;
    uint64_t *v63 = v33;
    v55[1] = v32;
  }
  else
  {
    __break(1u);
  }
}

uint64_t closure #2 in NodeDefStore.applyStandardLibraryFixes()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for NodeDef.Implementation(0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14._id object = (void *)0x800000025C427F40;
  v14._countAndFlagsBits = 0xD000000000000014;
  uint64_t result = String.hasPrefix(_:)(v14);
  if (result)
  {
    uint64_t v27 = a1;
    uint64_t v28 = a4;
    int64_t v16 = *(void *)(a3 + 16);
    uint64_t v17 = MEMORY[0x263F8EE78];
    if (v16)
    {
      uint64_t v26 = a2;
      uint64_t v29 = MEMORY[0x263F8EE78];
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16, 0);
      uint64_t v17 = v29;
      unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      uint64_t v19 = a3 + v18;
      uint64_t v20 = *(void *)(v11 + 72);
      while (1)
      {
        closure #1 in closure #2 in NodeDefStore.applyStandardLibraryFixes()(v19, (uint64_t)v13);
        if (v5) {
          return swift_release();
        }
        uint64_t v5 = 0;
        uint64_t v29 = v17;
        unint64_t v22 = *(void *)(v17 + 16);
        unint64_t v21 = *(void *)(v17 + 24);
        if (v22 >= v21 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
          uint64_t v17 = v29;
        }
        *(void *)(v17 + 16) = v22 + 1;
        outlined init with take of NodeDef.Implementation((uint64_t)v13, v17 + v18 + v22 * v20, type metadata accessor for NodeDef.Implementation);
        v19 += v20;
        if (!--v16)
        {
          a2 = v26;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      uint64_t v24 = v27;
      uint64_t v23 = v28;
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v29 = *(void *)(v23 + 16);
      *(void *)(v23 + 16) = 0x8000000000000000;
      specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v17, v24, a2, isUniquelyReferenced_nonNull_native);
      *(void *)(v23 + 16) = v29;
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t closure #1 in closure #2 in NodeDefStore.applyStandardLibraryFixes()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for NodeDef.Implementation.Kind(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (long long *)((char *)&v65 - v9);
  outlined init with copy of NodeDef.Implementation(a1, (uint64_t)&v65 - v9, type metadata accessor for NodeDef.Implementation.Kind);
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of NodeDef.Implementation((uint64_t)v10, type metadata accessor for NodeDef.Implementation.Kind);
    return outlined init with copy of NodeDef.Implementation(a1, a2, type metadata accessor for NodeDef.Implementation);
  }
  uint64_t v70 = a1;
  uint64_t v71 = a2;
  uint64_t v65 = v5;
  uint64_t v66 = v8;
  uint64_t v72 = v2;
  long long v12 = v10[2];
  long long v13 = v10[3];
  long long v14 = *v10;
  long long v89 = v10[1];
  long long v90 = v12;
  long long v15 = v10[4];
  long long v16 = v10[6];
  long long v17 = v10[7];
  long long v93 = v10[5];
  v94[0] = v16;
  long long v91 = v13;
  long long v92 = v15;
  *(_OWORD *)((char *)v96 + 9) = *(long long *)((char *)v10 + 153);
  long long v18 = v10[9];
  long long v95 = v10[8];
  v96[0] = v18;
  v94[1] = v17;
  long long v88 = v14;
  long long v69 = v93;
  long long v67 = *(_OWORD *)((char *)v94 + 8);
  LODWORD(v68) = BYTE8(v17);
  unint64_t v73 = v16;
  uint64_t v19 = *(void *)(v16 + 16);
  if (!v19)
  {
LABEL_11:
    unint64_t v28 = v69;
    long long v75 = v69;
    *(void *)&v76[0] = v73;
    *(_OWORD *)((char *)v76 + 8) = v67;
    BYTE8(v76[1]) = v68;
    *(void *)&long long v77 = 0x6B6361626C6C6166;
    *((void *)&v77 + 1) = 0xE800000000000000;
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi9_((uint64_t)&v75);
    outlined init with take of UserGraphError.ErrorType((uint64_t)&v75, (uint64_t)v84);
    uint64_t v86 = 0;
    uint64_t v87 = 0;
    swift_bridgeObjectRetain();
    outlined copy of NodePersonality(v28);
    swift_bridgeObjectRetain();
    outlined release of UserGraphError((uint64_t *)v84);
LABEL_24:
    outlined release of Graph((uint64_t)&v88);
    return outlined init with copy of NodeDef.Implementation(v70, v71, type metadata accessor for NodeDef.Implementation);
  }
  uint64_t v20 = (void *)(v73 + 80);
  while (1)
  {
    uint64_t v21 = *(v20 - 6);
    uint64_t v103 = *(v20 - 5);
    uint64_t v23 = *(v20 - 4);
    unint64_t v22 = *(v20 - 3);
    uint64_t v24 = *(v20 - 2);
    char v25 = *((unsigned char *)v20 - 8);
    uint64_t v26 = *v20;
    if (v23 == 0x6B6361626C6C6166 && v22 == 0xE800000000000000) {
      break;
    }
    if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
      goto LABEL_13;
    }
    v20 += 7;
    if (!--v19) {
      goto LABEL_11;
    }
  }
  unint64_t v22 = 0xE800000000000000;
LABEL_13:
  v97[0] = v21;
  v97[1] = v103;
  v97[2] = v23;
  v97[3] = v22;
  v97[4] = v24;
  char v98 = v25;
  uint64_t v99 = v26;
  uint64_t v29 = v92;
  unint64_t v30 = *(void *)(v92 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  if (!v30)
  {
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_24;
  }
  uint64_t v31 = v29 + 32;
  *(void *)&long long v69 = v29;
  swift_bridgeObjectRetain_n();
  unint64_t v32 = 0;
  *((void *)&v69 + 1) = 0x800000025C425160;
  unint64_t v73 = v22;
  while (1)
  {
    uint64_t v33 = (unint64_t *)(v31 + 48 * v32);
    if (v33[3] == -7) {
      goto LABEL_19;
    }
    unint64_t v34 = *v33;
    if (*v33 >> 61 != 5) {
      goto LABEL_19;
    }
    uint64_t v35 = v31;
    unint64_t v37 = v33[1];
    unint64_t v36 = v33[2];
    outlined copy of NodePersonality(v34);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v38._countAndFlagsBits = 0xD000000000000011;
    v38._id object = (void *)*((void *)&v69 + 1);
    Swift::Bool v39 = String.hasPrefix(_:)(v38);
    swift_bridgeObjectRelease();
    if (v39) {
      break;
    }
    outlined consume of NodePersonality(v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v31 = v35;
LABEL_19:
    if ((uint64_t)++v32 >= (uint64_t)v30) {
      goto LABEL_22;
    }
    if (v32 >= v30)
    {
      __break(1u);
LABEL_22:
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease_n();
      goto LABEL_24;
    }
  }
  *(void *)&long long v67 = v34;
  unint64_t v68 = v36;
  swift_bridgeObjectRelease_n();
  *(void *)&long long v69 = v37;
  uint64_t v40 = *(void *)(v37 + 16);
  if (v40)
  {
    uint64_t v41 = (void *)(v69 + 80);
    while (1)
    {
      uint64_t v42 = *(v41 - 5);
      *((void *)&v69 + 1) = *(v41 - 6);
      uint64_t v43 = *(v41 - 4);
      uint64_t v44 = *(v41 - 2);
      char v45 = *((unsigned char *)v41 - 8);
      uint64_t v46 = *v41;
      if (v43 == 0x746C7561666564 && *(v41 - 3) == 0xE700000000000000) {
        break;
      }
      unint64_t v48 = *(v41 - 3);
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        goto LABEL_35;
      }
      v41 += 7;
      if (!--v40) {
        goto LABEL_33;
      }
    }
    unint64_t v48 = 0xE700000000000000;
LABEL_35:
    v100[0] = *((void *)&v69 + 1);
    v100[1] = v42;
    v100[2] = v43;
    v100[3] = v48;
    v100[4] = v44;
    char v101 = v45;
    uint64_t v102 = v46;
    swift_retain();
    swift_bridgeObjectRetain();
    long long v82 = v95;
    v83[0] = v96[0];
    *(_OWORD *)((char *)v83 + 9) = *(_OWORD *)((char *)v96 + 9);
    long long v78 = v92;
    long long v79 = v93;
    long long v80 = v94[0];
    long long v81 = v94[1];
    long long v75 = v88;
    v76[0] = v89;
    v76[1] = v90;
    long long v77 = v91;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    outlined retain of Graph((uint64_t)&v88);
    Graph.connect(_:to:)((uint64_t)v97, (unint64_t)v100);
    *((void *)&v69 + 1) = v48;
    swift_bridgeObjectRelease();
    uint64_t v70 = v42;
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    v84[7] = v81;
    v84[8] = v82;
    v85[0] = v83[0];
    *(_OWORD *)((char *)v85 + 9) = *(_OWORD *)((char *)v83 + 9);
    long long v49 = v78;
    long long v50 = v79;
    v84[4] = v78;
    v84[5] = v79;
    long long v51 = v81;
    long long v52 = v80;
    v84[6] = v80;
    long long v53 = v75;
    long long v54 = v76[0];
    v84[0] = v75;
    v84[1] = v76[0];
    long long v56 = v76[1];
    long long v55 = v77;
    v84[2] = v76[1];
    v84[3] = v77;
    long long v57 = v83[0];
    uint64_t v58 = v66;
    v66[8] = v82;
    v58[9] = v57;
    *(_OWORD *)((char *)v58 + 153) = *(_OWORD *)((char *)v83 + 9);
    v58[4] = v49;
    v58[5] = v50;
    v58[6] = v52;
    v58[7] = v51;
    _OWORD *v58 = v53;
    v58[1] = v54;
    v58[2] = v56;
    v58[3] = v55;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_25C4195A0;
    outlined retain of Graph((uint64_t)v84);
    type metadata accessor for MaterialXTarget();
    *(void *)(v59 + 32) = swift_initStaticObject();
    unint64_t v74 = v59;
    specialized Array._endMutation()();
    unint64_t v60 = v74;
    if (v74 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v61 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v61 = *(void *)((v74 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v61) {
      unint64_t v62 = specialized Set.init(_nonEmptyArrayLiteral:)(v60);
    }
    else {
      unint64_t v62 = MEMORY[0x263F8EE88];
    }
    swift_bridgeObjectRelease();
    outlined consume of NodePersonality(v67);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined release of Graph((uint64_t)&v88);
    outlined release of Graph((uint64_t)v84);
    uint64_t v63 = (uint64_t)v58;
    uint64_t v64 = v71;
    outlined init with take of NodeDef.Implementation(v63, v71, type metadata accessor for NodeDef.Implementation.Kind);
    uint64_t result = type metadata accessor for NodeDef.Implementation(0);
    *(void *)(v64 + *(int *)(result + 20)) = v62;
  }
  else
  {
LABEL_33:
    outlined init with copy of NodeDef.Implementation(v70, v71, type metadata accessor for NodeDef.Implementation);
    outlined consume of NodePersonality(v67);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return outlined release of Graph((uint64_t)&v88);
  }
  return result;
}

uint64_t closure #3 in NodeDefStore.applyStandardLibraryFixes()@<X0>(long long *a1@<X0>, long long *a2@<X8>)
{
  long long v3 = a1[3];
  *(_OWORD *)long long v50 = a1[2];
  *(_OWORD *)&v50[16] = v3;
  long long v4 = a1[8];
  long long v5 = a1[6];
  long long v53 = a1[7];
  long long v54 = v4;
  long long v6 = a1[5];
  *(_OWORD *)&v50[32] = a1[4];
  long long v51 = v6;
  long long v52 = v5;
  long long v7 = a1[1];
  long long v48 = *a1;
  long long v49 = v7;
  uint64_t v8 = *(void *)(v4 + 16);
  if (v8)
  {
    uint64_t v42 = a2;
    uint64_t v43 = swift_bridgeObjectRetain();
    uint64_t v9 = (unsigned __int8 *)(v43 + 88);
    while (1)
    {
      int v10 = *v9;
      uint64_t v11 = one-time initialization token for filename;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v11 != -1) {
        swift_once();
      }
      int v12 = MaterialXDataType.isEqual(to:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if (v12 & v10) {
        break;
      }
      v9 += 64;
      if (!--v8)
      {
        swift_bridgeObjectRelease();
        a2 = v42;
        goto LABEL_14;
      }
    }
    uint64_t v13 = v43;
    swift_bridgeObjectRelease();
    int64_t v14 = *(void *)(v43 + 16);
    uint64_t v15 = MEMORY[0x263F8EE78];
    if (v14)
    {
      uint64_t v55 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
      uint64_t v16 = 0;
      uint64_t v15 = v55;
      do
      {
        uint64_t v17 = v13 + v16;
        uint64_t v18 = *(void *)(v13 + v16 + 40);
        uint64_t v19 = *(void *)(v13 + v16 + 48);
        uint64_t v46 = *(void *)(v13 + v16 + 56);
        uint64_t v47 = *(void *)(v13 + v16 + 32);
        uint64_t v20 = *(void *)(v13 + v16 + 64);
        uint64_t v45 = *(void *)(v13 + v16 + 72);
        uint64_t v21 = *(void *)(v13 + v16 + 80);
        char v44 = *(unsigned char *)(v17 + 88);
        char v22 = MaterialXDataType.isEqual(to:)();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v55 = v15;
        unint64_t v24 = *(void *)(v15 + 16);
        unint64_t v23 = *(void *)(v15 + 24);
        if (v24 >= v23 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1);
          uint64_t v15 = v55;
        }
        *(void *)(v15 + 16) = v24 + 1;
        uint64_t v25 = v15 + (v24 << 6);
        *(void *)(v25 + 32) = v47;
        *(void *)(v25 + 40) = v18;
        *(void *)(v25 + 48) = v19;
        *(void *)(v25 + 56) = v46;
        *(void *)(v25 + 64) = v20;
        *(void *)(v25 + 72) = v45;
        *(void *)(v25 + 80) = v21;
        v16 += 64;
        *(unsigned char *)(v25 + 88) = (v22 ^ 1) & v44 & 1;
        --v14;
        uint64_t v13 = v43;
      }
      while (v14);
      swift_bridgeObjectRelease();
    }
    uint64_t v31 = *((void *)&v48 + 1);
    long long v32 = v49;
    uint64_t v33 = *(void *)v50;
    uint64_t v34 = *(void *)&v50[40];
    char v35 = v51;
    uint64_t v36 = *((void *)&v51 + 1);
    unint64_t v37 = *((void *)&v52 + 1);
    unint64_t v38 = v52;
    uint64_t v39 = v53;
    uint64_t v40 = *((void *)&v54 + 1);
    uint64_t v41 = *((void *)&v53 + 1);
    *(void *)uint64_t v42 = v48;
    *((void *)v42 + 1) = v31;
    v42[1] = v32;
    *((void *)v42 + 4) = v33;
    *(long long *)((char *)v42 + 40) = *(_OWORD *)&v50[8];
    *(long long *)((char *)v42 + 56) = *(_OWORD *)&v50[24];
    *((void *)v42 + 9) = v34;
    *((unsigned char *)v42 + 80) = v35;
    *((void *)v42 + 11) = v36;
    v42[6] = __PAIR128__(v37, v38);
    *((void *)v42 + 14) = v39;
    *((void *)v42 + 15) = v41;
    *((void *)v42 + 16) = v15;
    *((void *)v42 + 17) = v40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return outlined copy of MaterialXAvailability(v39, v41);
  }
  else
  {
LABEL_14:
    long long v26 = a1[7];
    a2[6] = a1[6];
    a2[7] = v26;
    a2[8] = a1[8];
    long long v27 = a1[3];
    a2[2] = a1[2];
    a2[3] = v27;
    long long v28 = a1[5];
    a2[4] = a1[4];
    a2[5] = v28;
    long long v29 = a1[1];
    *a2 = *a1;
    a2[1] = v29;
    return outlined retain of NodeDef((uint64_t)&v48);
  }
}

double NodeDefStore.createNode(in:from:label:)@<D0>(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  specialized NodeDefStore.createNode(in:from:label:)(a1, a2, &v6);
  long long v4 = v7[0];
  *a3 = v6;
  a3[1] = v4;
  double result = *(double *)((char *)v7 + 9);
  *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v7 + 9);
  return result;
}

uint64_t closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v7 = a2[16];
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)(v7 + 40);
    while (1)
    {
      uint64_t v10 = v9[1];
      BOOL v11 = *(v9 - 1) == v6 && *v9 == v5;
      if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      v9 += 8;
      if (!--v8) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (MaterialXDataType.isEqual(to:)())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
    }
    if (*(void *)(v10 + 24))
    {
      if (one-time initialization token for string != -1) {
        swift_once();
      }
      char v19 = MaterialXDataType.isEqual(to:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if (v19) {
        return 1;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
LABEL_9:
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)logger);
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v23 = v20;
      *(_DWORD *)uint64_t v15 = 136315650;
      uint64_t v17 = *a2;
      unint64_t v16 = a2[1];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v16, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C27E000, v13, v14, "Nodedef '%s' cannot instantiate element '%s because it does not have input '%s'", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261185880](v20, -1, -1);
      MEMORY[0x261185880](v15, -1, -1);
    }
    else
    {
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

uint64_t closure #2 in implicit closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = *a1;
  unint64_t v5 = a1[1];
  uint64_t v7 = a2[17];
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)(v7 + 40);
    while (1)
    {
      uint64_t v10 = v9[1];
      BOOL v11 = *(v9 - 1) == v6 && *v9 == v5;
      if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      v9 += 8;
      if (!--v8) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (MaterialXDataType.isEqual(to:)())
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return 1;
    }
    if (*(void *)(v10 + 24))
    {
      if (one-time initialization token for string != -1) {
        swift_once();
      }
      char v19 = MaterialXDataType.isEqual(to:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if (v19) {
        return 1;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
LABEL_9:
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)logger);
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    outlined retain of NodeDef((uint64_t)a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v23 = v20;
      *(_DWORD *)uint64_t v15 = 136315650;
      uint64_t v17 = *a2;
      unint64_t v16 = a2[1];
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v16, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 22) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v5, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25C27E000, v13, v14, "Nodedef '%s' cannot instantiate element '%s because it does not have output '%s'", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261185880](v20, -1, -1);
      MEMORY[0x261185880](v15, -1, -1);
    }
    else
    {
      outlined release of NodeDef((uint64_t)a2);
      outlined release of NodeDef((uint64_t)a2);

      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
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
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Swift::UInt v11 = *(void *)(*(void *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        Hasher._combine(_:)(v11);
        double result = Hasher._finalize()();
        unint64_t v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          os_log_type_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *os_log_type_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            long long v9 = *v18;
            long long v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)unint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    char v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    char v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *char v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  long long v9;
  long long v10;
  long long v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  long long *v18;
  long long *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        unint64_t v12 = Hasher._finalize()();
        double result = swift_bridgeObjectRelease();
        uint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          os_log_type_t v14 = *(void *)(a2 + 48);
          uint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          uint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *uint64_t v15 = *v16;
          }
          unint64_t v17 = *(void *)(a2 + 56);
          uint64_t v18 = (long long *)(v17 + (v3 << 6));
          char v19 = (long long *)(v17 + (v6 << 6));
          if (v3 << 6 != v6 << 6 || (int64_t v3 = v6, v18 >= v19 + 4))
          {
            long long v9 = *v19;
            long long v10 = v19[1];
            Swift::UInt v11 = v19[3];
            void v18[2] = v19[2];
            v18[3] = v11;
            *uint64_t v18 = v9;
            v18[1] = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
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
  BOOL v23 = *(void *)(a2 + 16);
  uint64_t v24 = __OFSUB__(v23, 1);
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

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::Int v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        long long v9 = Hasher._finalize()();
        double result = swift_bridgeObjectRelease();
        long long v10 = v9 & v7;
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
          Swift::UInt v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *unint64_t v12 = *v13;
          }
          os_log_type_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
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
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    char v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    char v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  uint64_t v21 = __OFSUB__(v20, 1);
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

uint64_t specialized Sequence.filter(_:)(uint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  int64_t v6 = 0;
  uint64_t v7 = result + 64;
  uint64_t v8 = 1 << *(unsigned char *)(result + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(result + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = MEMORY[0x263F8EE78];
  int64_t v34 = v11;
  if (v10) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v15 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v15 < v11)
    {
      unint64_t v16 = *(void *)(v7 + 8 * v15);
      ++v6;
      if (v16) {
        goto LABEL_23;
      }
      int64_t v6 = v15 + 1;
      if (v15 + 1 >= v11) {
        goto LABEL_31;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (v16) {
        goto LABEL_23;
      }
      int64_t v6 = v15 + 2;
      if (v15 + 2 >= v11) {
        goto LABEL_31;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (v16) {
        goto LABEL_23;
      }
      int64_t v6 = v15 + 3;
      if (v15 + 3 >= v11) {
        goto LABEL_31;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (v16)
      {
LABEL_23:
        unint64_t v10 = (v16 - 1) & v16;
        for (unint64_t i = __clz(__rbit64(v16)) + (v6 << 6); ; unint64_t i = v13 | (v6 << 6))
        {
          uint64_t v18 = (long long *)(*(void *)(v5 + 56) + 144 * i);
          long long v35 = *v18;
          long long v19 = v18[4];
          long long v21 = v18[1];
          long long v20 = v18[2];
          long long v38 = v18[3];
          long long v39 = v19;
          long long v36 = v21;
          long long v37 = v20;
          long long v22 = v18[8];
          long long v24 = v18[5];
          long long v23 = v18[6];
          long long v42 = v18[7];
          long long v43 = v22;
          long long v40 = v24;
          long long v41 = v23;
          if (v36 == __PAIR128__(a3, a2) || (double result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
          {
            outlined retain of NodeDef((uint64_t)&v35);
            double result = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v44 = v12;
            if ((result & 1) == 0)
            {
              double result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v12 + 16) + 1, 1);
              uint64_t v12 = v44;
            }
            unint64_t v26 = *(void *)(v12 + 16);
            unint64_t v25 = *(void *)(v12 + 24);
            if (v26 >= v25 >> 1)
            {
              double result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
              uint64_t v12 = v44;
            }
            *(void *)(v12 + 16) = v26 + 1;
            long long v27 = (_OWORD *)(v12 + 144 * v26);
            v27[2] = v35;
            long long v28 = v36;
            long long v29 = v37;
            long long v30 = v39;
            v27[5] = v38;
            v27[6] = v30;
            v27[3] = v28;
            v27[4] = v29;
            long long v31 = v40;
            long long v32 = v41;
            long long v33 = v43;
            v27[9] = v42;
            v27[10] = v33;
            v27[7] = v31;
            v27[8] = v32;
            int64_t v11 = v34;
            if (!v10) {
              goto LABEL_8;
            }
          }
          else if (!v10)
          {
            goto LABEL_8;
          }
LABEL_7:
          unint64_t v13 = __clz(__rbit64(v10));
          v10 &= v10 - 1;
        }
      }
      int64_t v17 = v15 + 4;
      if (v17 < v11)
      {
        unint64_t v16 = *(void *)(v7 + 8 * v17);
        if (v16)
        {
          int64_t v6 = v17;
          goto LABEL_23;
        }
        while (1)
        {
          int64_t v6 = v17 + 1;
          if (__OFADD__(v17, 1)) {
            goto LABEL_33;
          }
          if (v6 >= v11) {
            break;
          }
          unint64_t v16 = *(void *)(v7 + 8 * v6);
          ++v17;
          if (v16) {
            goto LABEL_23;
          }
        }
      }
    }
LABEL_31:
    swift_release();
    return v12;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  unint64_t v5 = *(void *)(result + 16);
  if (v5)
  {
    uint64_t v8 = a2;
    unint64_t v9 = 0;
    uint64_t v43 = result + 32;
    long long v37 = (uint64_t *)(a2 + 48);
    uint64_t v40 = MEMORY[0x263F8EE78];
    unint64_t v42 = *(void *)(result + 16);
    while (1)
    {
      if (v9 <= v5) {
        unint64_t v10 = v5;
      }
      else {
        unint64_t v10 = v9;
      }
      unint64_t v41 = v10;
      while (1)
      {
        if (v9 == v10)
        {
          __break(1u);
          return result;
        }
        int64_t v11 = (long long *)(v43 + 144 * v9);
        long long v12 = v11[7];
        long long v54 = v11[6];
        long long v55 = v12;
        long long v56 = v11[8];
        long long v13 = v11[3];
        long long v50 = v11[2];
        long long v51 = v13;
        long long v14 = v11[5];
        long long v52 = v11[4];
        long long v53 = v14;
        long long v15 = v11[1];
        long long v48 = *v11;
        long long v49 = v15;
        uint64_t v16 = *(void *)(v8 + 16);
        outlined retain of NodeDef((uint64_t)&v48);
        unint64_t v44 = v9 + 1;
        if (v16)
        {
          swift_bridgeObjectRetain();
          int64_t v17 = v37;
          while (1)
          {
            uint64_t v19 = *(v17 - 1);
            uint64_t v18 = *v17;
            uint64_t v45 = *(v17 - 2);
            uint64_t v46 = v19;
            uint64_t v47 = v18;
            swift_bridgeObjectRetain();
            swift_retain();
            char v20 = closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(&v45, (uint64_t *)&v48, a3, a4);
            swift_release();
            swift_bridgeObjectRelease();
            if ((v20 & 1) == 0) {
              break;
            }
            v17 += 3;
            if (!--v16)
            {
              swift_bridgeObjectRelease();
              goto LABEL_13;
            }
          }
          swift_bridgeObjectRelease();
          double result = outlined release of NodeDef((uint64_t)&v48);
          goto LABEL_20;
        }
LABEL_13:
        uint64_t v21 = *a5;
        uint64_t v22 = *(void *)(*a5 + 16);
        if (!v22) {
          break;
        }
        swift_bridgeObjectRetain();
        long long v23 = (uint64_t *)(v21 + 48);
        while (1)
        {
          uint64_t v25 = *(v23 - 1);
          uint64_t v24 = *v23;
          uint64_t v45 = *(v23 - 2);
          uint64_t v46 = v25;
          uint64_t v47 = v24;
          swift_bridgeObjectRetain();
          swift_retain();
          char v26 = closure #2 in implicit closure #1 in closure #6 in NodeDefStore.createNode(for:in:)(&v45, (uint64_t *)&v48, a3, a4);
          swift_release();
          swift_bridgeObjectRelease();
          if ((v26 & 1) == 0) {
            break;
          }
          v23 += 3;
          if (!--v22)
          {
            swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
        swift_bridgeObjectRelease();
        double result = outlined release of NodeDef((uint64_t)&v48);
        uint64_t v8 = a2;
LABEL_20:
        unint64_t v10 = v41;
        unint64_t v9 = v44;
        if (v44 == v42) {
          return v40;
        }
      }
LABEL_22:
      uint64_t v27 = v40;
      double result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v57 = v40;
      if ((result & 1) == 0)
      {
        double result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v40 + 16) + 1, 1);
        uint64_t v27 = v57;
      }
      uint64_t v8 = a2;
      unint64_t v29 = *(void *)(v27 + 16);
      unint64_t v28 = *(void *)(v27 + 24);
      if (v29 >= v28 >> 1)
      {
        double result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v28 > 1, v29 + 1, 1);
        uint64_t v27 = v57;
      }
      *(void *)(v27 + 16) = v29 + 1;
      uint64_t v40 = v27;
      long long v30 = (_OWORD *)(v27 + 144 * v29);
      v30[2] = v48;
      long long v31 = v49;
      long long v32 = v50;
      long long v33 = v52;
      v30[5] = v51;
      v30[6] = v33;
      v30[3] = v31;
      v30[4] = v32;
      long long v34 = v53;
      long long v35 = v54;
      long long v36 = v56;
      v30[9] = v55;
      v30[10] = v36;
      v30[7] = v34;
      v30[8] = v35;
      unint64_t v5 = v42;
      unint64_t v9 = v44;
      if (v44 == v42) {
        return v40;
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

double specialized NodeDefStore.createNode(in:from:label:)@<D0>(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3 = a2[16];
  uint64_t v35 = v3;
  int64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    *(void *)&long long v32 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    uint64_t v5 = v32;
    int64_t v6 = (uint64_t *)(v3 + 48);
    do
    {
      uint64_t v7 = *(v6 - 2);
      uint64_t v8 = *(v6 - 1);
      uint64_t v9 = *v6;
      *(void *)&long long v32 = v5;
      unint64_t v11 = *(void *)(v5 + 16);
      unint64_t v10 = *(void *)(v5 + 24);
      swift_bridgeObjectRetain();
      swift_retain();
      if (v11 >= v10 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        uint64_t v5 = v32;
      }
      v6 += 8;
      *(void *)(v5 + 16) = v11 + 1;
      long long v12 = (void *)(v5 + 24 * v11);
      v12[4] = v7;
      v12[5] = v8;
      v12[6] = v9;
      --v4;
    }
    while (v4);
    outlined release of [Input]((uint64_t)&v35);
    long long v13 = a2;
  }
  else
  {
    long long v13 = a2;
  }
  uint64_t v14 = v13[17];
  uint64_t v34 = v14;
  int64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = MEMORY[0x263F8EE78];
  if (v15)
  {
    *(void *)&long long v32 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15, 0);
    uint64_t v16 = v32;
    int64_t v17 = (uint64_t *)(v14 + 48);
    do
    {
      uint64_t v18 = *(v17 - 2);
      uint64_t v19 = *(v17 - 1);
      uint64_t v20 = *v17;
      *(void *)&long long v32 = v16;
      unint64_t v22 = *(void *)(v16 + 16);
      unint64_t v21 = *(void *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_retain();
      if (v22 >= v21 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22 + 1, 1);
        uint64_t v16 = v32;
      }
      v17 += 8;
      *(void *)(v16 + 16) = v22 + 1;
      long long v23 = (void *)(v16 + 24 * v22);
      v23[4] = v18;
      v23[5] = v19;
      v23[6] = v20;
      --v15;
    }
    while (v15);
    outlined release of [Input]((uint64_t)&v34);
    long long v13 = a2;
  }
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v13[1];
  *(void *)(v24 + 16) = *v13;
  *(void *)(v24 + 24) = v25;
  unint64_t v26 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  specialized static Graph._insertNode(graphID:inputs:outputs:shaderGraphData:nodes:adjacency:)(v26, v5, v16, v24 | 0xA000000000000000, a1 + 64, a1, (unint64_t *)&v32);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v27 = v33[0];
  *a3 = v32;
  a3[1] = v27;
  double result = *(double *)((char *)v33 + 9);
  *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v33 + 9);
  return result;
}

uint64_t specialized NodeDefStore.createNode(for:in:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _OWORD *a3@<X8>)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(ObjectType, v7);
  if (v9)
  {
    unint64_t v151 = v8;
    unint64_t v10 = v9;
    unint64_t v11 = a3;
    long long v12 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v13 = v12(0x7475706E692F2ELL, 0xE700000000000000, ObjectType, v7);
    if (v3)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v28 = v13;
      uint64_t v147 = v12;
      uint64_t v148 = v7;
      uint64_t v149 = ObjectType;
      uint64_t v29 = *(void *)(v13 + 16);
      uint64_t v30 = MEMORY[0x263F8EE78];
      Swift::String v150 = v11;
      if (v29)
      {
        swift_bridgeObjectRetain();
        long long v31 = (void *)MEMORY[0x263F8EE78];
        uint64_t v32 = 32;
        do
        {
          uint64_t v34 = *(void *)(v28 + v32);
          swift_getObjectType();
          uint64_t v35 = swift_conformsToProtocol2();
          if (v35) {
            uint64_t v36 = v34;
          }
          else {
            uint64_t v36 = 0;
          }
          if (v35) {
            uint64_t v37 = v35;
          }
          else {
            uint64_t v37 = 0;
          }
          if (v36)
          {
            swift_unknownObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              long long v31 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v31[2] + 1, 1, v31);
            }
            long long v38 = v31;
            unint64_t v39 = v31[2];
            uint64_t v40 = v38;
            unint64_t v41 = v38[3];
            if (v39 >= v41 >> 1) {
              uint64_t v40 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v41 > 1), v39 + 1, 1, v40);
            }
            v40[2] = v39 + 1;
            long long v33 = &v40[2 * v39];
            long long v31 = v40;
            v33[4] = v36;
            v33[5] = v37;
          }
          v32 += 16;
          --v29;
        }
        while (v29);
        swift_bridgeObjectRelease();
        unint64_t v42 = v150;
        uint64_t v30 = MEMORY[0x263F8EE78];
      }
      else
      {
        long long v31 = (void *)MEMORY[0x263F8EE78];
        unint64_t v42 = v11;
      }
      swift_bridgeObjectRelease();
      int64_t v43 = v31[2];
      if (v43)
      {
        uint64_t v145 = v10;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v43, 0);
        uint64_t v44 = v30;
        uint64_t v45 = v31 + 5;
        while (1)
        {
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v154 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
          if (!v46) {
            break;
          }
          uint64_t v47 = v46;
          int64_t v153 = v43;
          uint64_t v48 = v44;
          uint64_t v49 = XMLNode.subscript.getter(1701869940, 0xE400000000000000);
          if (!v50)
          {
            swift_bridgeObjectRelease();
            break;
          }
          uint64_t v51 = v49;
          uint64_t v52 = v50;
          uint64_t v53 = XMLNode.subscript.getter(1836412517, 0xE400000000000000);
          if (v54)
          {
            uint64_t v55 = v53;
            uint64_t v56 = v54;
            swift_bridgeObjectRelease();
            *(void *)&long long v158 = v55;
            *((void *)&v158 + 1) = v56;
            v157[0] = 44;
            v157[1] = 0xE100000000000000;
            lazy protocol witness table accessor for type String and conformance String();
            uint64_t v57 = StringProtocol.components<A>(separatedBy:)();
            swift_bridgeObjectRelease();
            type metadata accessor for MaterialXDataType();
            uint64_t v58 = (void *)swift_allocObject();
            v58[4] = v154;
            v58[5] = v47;
            v58[3] = v57;
            v58[2] = MEMORY[0x263F8EE78];
            swift_bridgeObjectRetain();
          }
          else
          {
            type metadata accessor for MaterialXDataType();
            uint64_t v58 = (void *)swift_allocObject();
            v58[4] = v51;
            v58[5] = v52;
            v58[3] = 0;
            v58[2] = MEMORY[0x263F8EE78];
          }
          swift_unknownObjectRelease();
          uint64_t v44 = v48;
          unint64_t v60 = *(void *)(v48 + 16);
          unint64_t v59 = *(void *)(v48 + 24);
          if (v60 >= v59 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v59 > 1, v60 + 1, 1);
            uint64_t v44 = v48;
          }
          *(void *)(v44 + 16) = v60 + 1;
          uint64_t v61 = (void *)(v44 + 24 * v60);
          v61[4] = v154;
          v61[5] = v47;
          v61[6] = v58;
          v45 += 2;
          int64_t v43 = v153 - 1;
          if (v153 == 1)
          {
            swift_bridgeObjectRelease();
            unint64_t v10 = v145;
            unint64_t v42 = v150;
            goto LABEL_36;
          }
        }
        _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v157);
        outlined init with take of UserGraphError.ErrorType((uint64_t)v157, (uint64_t)&v158);
        *(void *)&long long v170 = 0xD000000000000020;
        *((void *)&v170 + 1) = 0x800000025C428200;
        lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
        swift_allocError();
        *unint64_t v62 = v158;
        long long v63 = v162;
        long long v65 = v159;
        long long v64 = v160;
        uint64_t v62[3] = v161;
        v62[4] = v63;
        v62[1] = v65;
        v62[2] = v64;
        long long v66 = v166;
        long long v68 = v163;
        long long v67 = v164;
        v62[7] = v165;
        v62[8] = v66;
        v62[5] = v68;
        v62[6] = v67;
        long long v69 = v170;
        long long v71 = v167;
        long long v70 = v168;
        v62[11] = v169;
        v62[12] = v69;
        v62[9] = v71;
        v62[10] = v70;
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v44 = MEMORY[0x263F8EE78];
LABEL_36:
        uint64_t v72 = v147(0x74757074756F2F2ELL, 0xE800000000000000, v149, v148);
        uint64_t v155 = v44;
        uint64_t v73 = *(void *)(v72 + 16);
        unint64_t v74 = (void *)MEMORY[0x263F8EE78];
        if (v73)
        {
          swift_bridgeObjectRetain();
          uint64_t v75 = 32;
          do
          {
            uint64_t v77 = *(void *)(v72 + v75);
            swift_getObjectType();
            uint64_t v78 = swift_conformsToProtocol2();
            if (v78) {
              uint64_t v79 = v77;
            }
            else {
              uint64_t v79 = 0;
            }
            if (v78) {
              uint64_t v80 = v78;
            }
            else {
              uint64_t v80 = 0;
            }
            if (v79)
            {
              swift_unknownObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v74 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v74[2] + 1, 1, v74);
              }
              long long v81 = v74;
              unint64_t v82 = v74[2];
              uint64_t v83 = v81;
              unint64_t v84 = v81[3];
              if (v82 >= v84 >> 1) {
                uint64_t v83 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v84 > 1), v82 + 1, 1, v83);
              }
              v83[2] = v82 + 1;
              id v76 = &v83[2 * v82];
              unint64_t v74 = v83;
              v76[4] = v79;
              v76[5] = v80;
            }
            v75 += 16;
            --v73;
          }
          while (v73);
          swift_bridgeObjectRelease();
          unint64_t v42 = v150;
        }
        swift_bridgeObjectRelease();
        int64_t v85 = v74[2];
        if (v85)
        {
          uint64_t v146 = v10;
          *(void *)&long long v158 = MEMORY[0x263F8EE78];
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v85, 0);
          uint64_t v86 = (void *)v158;
          uint64_t v87 = v74 + 5;
          while (1)
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            uint64_t result = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
            if (!v88) {
              break;
            }
            uint64_t v89 = result;
            uint64_t v90 = v88;
            uint64_t result = XMLNode.subscript.getter(1701869940, 0xE400000000000000);
            if (!v91) {
              goto LABEL_84;
            }
            uint64_t v92 = result;
            uint64_t v93 = v91;
            type metadata accessor for MaterialXDataType();
            uint64_t v94 = (void *)swift_allocObject();
            v94[4] = v92;
            v94[5] = v93;
            v94[3] = 0;
            _OWORD v94[2] = MEMORY[0x263F8EE78];
            swift_unknownObjectRelease();
            *(void *)&long long v158 = v86;
            unint64_t v96 = v86[2];
            unint64_t v95 = v86[3];
            if (v96 >= v95 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v95 > 1, v96 + 1, 1);
              uint64_t v86 = (void *)v158;
            }
            v86[2] = v96 + 1;
            int v97 = &v86[3 * v96];
            v97[4] = v89;
            void v97[5] = v90;
            v97[6] = v94;
            v87 += 2;
            if (!--v85)
            {
              swift_bridgeObjectRelease();
              unint64_t v10 = v146;
              unint64_t v42 = v150;
              goto LABEL_61;
            }
          }
          __break(1u);
LABEL_84:
          __break(1u);
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v86 = (void *)MEMORY[0x263F8EE78];
LABEL_61:
          uint64_t v174 = v86;
          if (!v86[2])
          {
            uint64_t v98 = XMLNode.subscript.getter(1701869940, 0xE400000000000000);
            if (v99)
            {
              uint64_t v100 = v98;
              uint64_t v101 = v99;
              if (v98 == 0x74756F69746C756DLL && v99 == 0xEB00000000747570
                || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                type metadata accessor for MaterialXDataType();
                uint64_t v102 = (void *)swift_allocObject();
                v102[4] = v100;
                _OWORD v102[5] = v101;
                v102[3] = 0;
                v102[2] = MEMORY[0x263F8EE78];
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v86 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v86[2] + 1, 1, v86);
                }
                unint64_t v104 = v86[2];
                unint64_t v103 = v86[3];
                if (v104 >= v103 >> 1) {
                  uint64_t v86 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v103 > 1), v104 + 1, 1, v86);
                }
                v86[2] = v104 + 1;
                uint64_t v105 = &v86[3 * v104];
                v105[4] = 7632239;
                v105[5] = 0xE300000000000000;
                v105[6] = v102;
                uint64_t v174 = v86;
              }
            }
          }
          swift_bridgeObjectRetain();
          uint64_t v106 = swift_bridgeObjectRetain();
          uint64_t v107 = specialized Sequence.filter(_:)(v106, v151, (unint64_t)v10);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          uint64_t v108 = swift_bridgeObjectRetain();
          uint64_t v109 = specialized _ArrayProtocol.filter(_:)(v108, v155, v151, (unint64_t)v10, (uint64_t *)&v174);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (*(void *)(v109 + 16))
          {
            long long v110 = *(_OWORD *)(v109 + 128);
            v173[5] = *(_OWORD *)(v109 + 112);
            v173[6] = v110;
            long long v111 = *(_OWORD *)(v109 + 160);
            v173[7] = *(_OWORD *)(v109 + 144);
            v173[8] = v111;
            long long v112 = *(_OWORD *)(v109 + 48);
            long long v113 = *(_OWORD *)(v109 + 80);
            long long v114 = *(_OWORD *)(v109 + 96);
            v173[2] = *(_OWORD *)(v109 + 64);
            v173[3] = v113;
            v173[4] = v114;
            v173[0] = *(_OWORD *)(v109 + 32);
            v173[1] = v112;
            outlined retain of NodeDef((uint64_t)v173);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v115._countAndFlagsBits = 1701667182;
            v115._id object = (void *)0xE400000000000000;
            XMLElement.getRequiredAttribute(_:)(v115);
            if (v116)
            {
              outlined release of NodeDef((uint64_t)v173);
              return swift_bridgeObjectRelease();
            }
            else
            {
              specialized NodeDefStore.createNode(in:from:label:)(a2, v173, &v171);
              swift_bridgeObjectRelease();
              outlined release of NodeDef((uint64_t)v173);
              uint64_t result = swift_bridgeObjectRelease();
              long long v144 = v172[0];
              *unint64_t v42 = v171;
              v42[1] = v144;
              *(_OWORD *)((char *)v42 + 25) = *(_OWORD *)((char *)v172 + 9);
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            *(void *)&long long v158 = 0;
            *((void *)&v158 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(88);
            long long v156 = v158;
            v117._countAndFlagsBits = 0xD00000000000002DLL;
            v117._id object = (void *)0x800000025C428230;
            String.append(_:)(v117);
            v118._countAndFlagsBits = v151;
            v118._id object = v10;
            String.append(_:)(v118);
            swift_bridgeObjectRelease();
            v119._countAndFlagsBits = 0x223D656D616E20;
            v119._id object = (void *)0xE700000000000000;
            String.append(_:)(v119);
            uint64_t v120 = XMLNode.subscript.getter(1701667182, 0xE400000000000000);
            if (v121) {
              uint64_t v122 = v120;
            }
            else {
              uint64_t v122 = 0x3E6C696E3CLL;
            }
            if (v121) {
              unint64_t v123 = v121;
            }
            else {
              unint64_t v123 = (void *)0xE500000000000000;
            }
            _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v157);
            v124._countAndFlagsBits = v122;
            v124._id object = v123;
            String.append(_:)(v124);
            swift_bridgeObjectRelease();
            v125._countAndFlagsBits = 0x756F203E2E2E2E22;
            v125._id object = (void *)0xED000020666F2074;
            String.append(_:)(v125);
            *(void *)&long long v158 = *(void *)(v107 + 16);
            v126._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
            String.append(_:)(v126);
            swift_bridgeObjectRelease();
            v127._countAndFlagsBits = 0x616469646E616320;
            v127._id object = (void *)0xEE005B202E736574;
            String.append(_:)(v127);
            uint64_t v128 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph7NodeDefVG_SSs5NeverOTg504_s11d7Graph12fG120StoreV06createC03for2inAA0abC0VAA10XMLElement_p_AA0B0VztKFSSAA0cD0Vcfu0_32dc54af7003c11ac2eedf40a685444c7bAMSSTf3nnnpk_nTf1cn_n(v107);
            swift_bridgeObjectRelease();
            *(void *)&long long v158 = v128;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
            lazy protocol witness table accessor for type [String] and conformance [A]();
            uint64_t v129 = BidirectionalCollection<>.joined(separator:)();
            uint64_t v131 = v130;
            swift_bridgeObjectRelease();
            v132._countAndFlagsBits = v129;
            v132._id object = v131;
            String.append(_:)(v132);
            swift_bridgeObjectRelease();
            v133._countAndFlagsBits = 93;
            v133._id object = (void *)0xE100000000000000;
            String.append(_:)(v133);
            outlined init with take of UserGraphError.ErrorType((uint64_t)v157, (uint64_t)&v158);
            long long v170 = v156;
            lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
            swift_allocError();
            _OWORD *v134 = v158;
            long long v135 = v162;
            long long v137 = v159;
            long long v136 = v160;
            v134[3] = v161;
            v134[4] = v135;
            v134[1] = v137;
            v134[2] = v136;
            long long v138 = v166;
            long long v140 = v163;
            long long v139 = v164;
            v134[7] = v165;
            v134[8] = v138;
            v134[5] = v140;
            v134[6] = v139;
            long long v141 = v170;
            long long v143 = v167;
            long long v142 = v168;
            v134[11] = v169;
            v134[12] = v141;
            v134[9] = v143;
            v134[10] = v142;
            swift_willThrow();
            return swift_bridgeObjectRelease();
          }
        }
      }
    }
  }
  else
  {
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v157);
    *(void *)&long long v158 = 0;
    *((void *)&v158 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    v15._countAndFlagsBits = 0xD000000000000037;
    v15._id object = (void *)0x800000025C4281C0;
    String.append(_:)(v15);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XMLElement);
    _print_unlocked<A, B>(_:_:)();
    v16._countAndFlagsBits = 62;
    v16._id object = (void *)0xE100000000000000;
    String.append(_:)(v16);
    long long v17 = v158;
    outlined init with take of UserGraphError.ErrorType((uint64_t)v157, (uint64_t)&v158);
    long long v170 = v17;
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    swift_allocError();
    *uint64_t v18 = v158;
    long long v19 = v162;
    long long v21 = v159;
    long long v20 = v160;
    v18[3] = v161;
    v18[4] = v19;
    v18[1] = v21;
    void v18[2] = v20;
    long long v22 = v166;
    long long v24 = v163;
    long long v23 = v164;
    v18[7] = v165;
    v18[8] = v22;
    v18[5] = v24;
    v18[6] = v23;
    long long v25 = v170;
    long long v27 = v167;
    long long v26 = v168;
    v18[11] = v169;
    v18[12] = v25;
    _OWORD v18[9] = v27;
    v18[10] = v26;
    return swift_willThrow();
  }
  return result;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = v2;
  uint64_t v6 = a1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 64);
  int64_t v22 = (unint64_t)(v7 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  if (!v9) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v18, v19, v20);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v11 >= v22) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    if (!v15)
    {
      int64_t v16 = v11 + 1;
      if (v11 + 1 >= v22) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v6 + 8 * v16);
      if (v15) {
        goto LABEL_14;
      }
      int64_t v16 = v11 + 2;
      if (v11 + 2 >= v22) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v6 + 8 * v16);
      if (v15) {
        goto LABEL_14;
      }
      int64_t v16 = v11 + 3;
      if (v11 + 3 >= v22) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v6 + 8 * v16);
      if (v15)
      {
LABEL_14:
        int64_t v11 = v16;
        goto LABEL_15;
      }
      int64_t v21 = v11 + 4;
      if (v11 + 4 >= v22) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v6 + 8 * v21);
      v11 += 4;
      if (!v15) {
        break;
      }
    }
LABEL_15:
    unint64_t v9 = (v15 - 1) & v15;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v22) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v21;
    if (v15) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized static NodeDefStore.createDefault()()
{
  uint64_t v324 = type metadata accessor for NodeDef.Implementation.Kind(0);
  uint64_t v0 = MEMORY[0x270FA5388](v324);
  v314 = (uint64_t *)((char *)&v306 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  v313 = (uint64_t *)((char *)&v306 - v3);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v312 = (uint64_t *)((char *)&v306 - v5);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v311 = (uint64_t *)((char *)&v306 - v7);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v310 = (uint64_t *)((char *)&v306 - v9);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v309 = (uint64_t *)((char *)&v306 - v11);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v308 = (uint64_t *)((char *)&v306 - v13);
  MEMORY[0x270FA5388](v12);
  uint64_t v307 = (uint64_t *)((char *)&v306 - v14);
  uint64_t v15 = MEMORY[0x263F8EE78];
  unint64_t v16 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  unint64_t v17 = specialized Dictionary.init(dictionaryLiteral:)(v15);
  unint64_t v18 = specialized Dictionary.init(dictionaryLiteral:)(v15);
  unint64_t v329 = v17;
  unint64_t v330 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NodeDef.IOSpec>);
  uint64_t v20 = swift_allocObject();
  long long v315 = xmmword_25C418EF0;
  *(_OWORD *)(v20 + 16) = xmmword_25C418EF0;
  if (one-time initialization token for float != -1) {
    swift_once();
  }
  uint64_t v21 = static MaterialXDataType.float;
  *(void *)(v20 + 32) = 0x7974696361706FLL;
  *(void *)(v20 + 40) = 0xE700000000000000;
  *(void *)(v20 + 48) = v21;
  *(_OWORD *)(v20 + 56) = xmmword_25C41F9D0;
  *(void *)(v20 + 72) = 0;
  *(void *)(v20 + 80) = 0;
  *(unsigned char *)(v20 + 88) = 0;
  *(void *)(v20 + 96) = 0xD000000000000010;
  *(void *)(v20 + 104) = 0x800000025C422700;
  *(void *)(v20 + 112) = v21;
  *(_OWORD *)(v20 + 120) = xmmword_25C41F9E0;
  *(void *)(v20 + 136) = 0;
  *(void *)(v20 + 144) = 0;
  *(unsigned char *)(v20 + 152) = 0;
  uint64_t v22 = swift_allocObject();
  long long v326 = xmmword_25C418EE0;
  *(_OWORD *)(v22 + 16) = xmmword_25C418EE0;
  *(void *)(v22 + 32) = 7632239;
  *(void *)(v22 + 40) = 0xE300000000000000;
  *(void *)(v22 + 48) = v21;
  *(_OWORD *)(v22 + 56) = 0u;
  *(_OWORD *)(v22 + 72) = 0u;
  *(unsigned char *)(v22 + 88) = 0;
  uint64_t v731 = v19;
  *(void *)&long long v698 = 0xD000000000000023;
  *((void *)&v698 + 1) = 0x800000025C422530;
  unint64_t v699 = 0xD00000000000001ALL;
  unint64_t v700 = 0x800000025C427F60;
  uint64_t v702 = 0;
  uint64_t v701 = 0;
  unint64_t v325 = (unint64_t)"function definition: ";
  unint64_t v703 = 0xD000000000000013;
  unint64_t v704 = 0x800000025C4279E0;
  uint64_t v706 = 0;
  uint64_t v705 = 0;
  char v707 = 2;
  *(_DWORD *)v708 = *(_DWORD *)v716;
  *(_DWORD *)&v708[3] = *(_DWORD *)&v716[3];
  uint64_t v709 = v15;
  uint64_t v710 = 0;
  uint64_t v712 = 0;
  uint64_t v711 = 0;
  uint64_t v713 = 1;
  uint64_t v714 = v20;
  uint64_t v715 = v22;
  swift_retain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v16;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v698, 0xD000000000000023, 0x800000025C422530, isUniquelyReferenced_nonNull_native);
  unint64_t v24 = v327;
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_25C41BFA0;
  if (one-time initialization token for coord != -1) {
    swift_once();
  }
  uint64_t v26 = static MaterialXDataType.realitykit.coord;
  *(void *)(v25 + 32) = 0x64726F6F63;
  *(void *)(v25 + 40) = 0xE500000000000000;
  *(void *)(v25 + 48) = v26;
  *(_OWORD *)(v25 + 56) = 0u;
  *(_OWORD *)(v25 + 72) = 0u;
  *(unsigned char *)(v25 + 88) = 1;
  uint64_t v27 = one-time initialization token for u_wrap_mode;
  swift_retain();
  if (v27 != -1) {
    swift_once();
  }
  uint64_t v28 = static MaterialXDataType.realitykit.u_wrap_mode;
  *(void *)(v25 + 96) = 0x6D5F706172775F75;
  *(void *)(v25 + 104) = 0xEB0000000065646FLL;
  *(void *)(v25 + 112) = v28;
  *(_OWORD *)(v25 + 120) = 0u;
  *(_OWORD *)(v25 + 136) = 0u;
  *(unsigned char *)(v25 + 152) = 1;
  uint64_t v29 = one-time initialization token for v_wrap_mode;
  swift_retain();
  if (v29 != -1) {
    swift_once();
  }
  uint64_t v30 = static MaterialXDataType.realitykit.v_wrap_mode;
  *(void *)(v25 + 160) = 0x6D5F706172775F76;
  *(void *)(v25 + 168) = 0xEB0000000065646FLL;
  *(void *)(v25 + 176) = v30;
  *(_OWORD *)(v25 + 184) = 0u;
  *(_OWORD *)(v25 + 200) = 0u;
  *(unsigned char *)(v25 + 216) = 1;
  uint64_t v31 = one-time initialization token for borderColor;
  swift_retain();
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v32 = static MaterialXDataType.realitykit.borderColor;
  *(_OWORD *)(v25 + 248) = 0u;
  strcpy((char *)(v25 + 224), "border_color");
  *(unsigned char *)(v25 + 237) = 0;
  *(_WORD *)(v25 + 238) = -5120;
  *(void *)(v25 + 240) = v32;
  *(_OWORD *)(v25 + 264) = 0u;
  *(unsigned char *)(v25 + 280) = 1;
  uint64_t v33 = one-time initialization token for magFilter;
  swift_retain();
  if (v33 != -1) {
    swift_once();
  }
  uint64_t v34 = static MaterialXDataType.realitykit.magFilter;
  *(void *)(v25 + 288) = 0x746C69665F67616DLL;
  *(void *)(v25 + 296) = 0xEA00000000007265;
  *(void *)(v25 + 304) = v34;
  *(_OWORD *)(v25 + 312) = 0u;
  *(_OWORD *)(v25 + 328) = 0u;
  *(unsigned char *)(v25 + 344) = 1;
  uint64_t v35 = one-time initialization token for minFilter;
  swift_retain();
  if (v35 != -1) {
    swift_once();
  }
  uint64_t v36 = static MaterialXDataType.realitykit.minFilter;
  *(void *)(v25 + 352) = 0x746C69665F6E696DLL;
  *(void *)(v25 + 360) = 0xEA00000000007265;
  *(void *)(v25 + 368) = v36;
  *(_OWORD *)(v25 + 376) = 0u;
  *(_OWORD *)(v25 + 392) = 0u;
  *(unsigned char *)(v25 + 408) = 1;
  uint64_t v37 = one-time initialization token for mipFilter;
  swift_retain();
  if (v37 != -1) {
    swift_once();
  }
  uint64_t v38 = static MaterialXDataType.realitykit.mipFilter;
  *(void *)(v25 + 416) = 0x746C69665F70696DLL;
  *(void *)(v25 + 424) = 0xEA00000000007265;
  *(void *)(v25 + 432) = v38;
  *(_OWORD *)(v25 + 440) = 0u;
  *(_OWORD *)(v25 + 456) = 0u;
  *(unsigned char *)(v25 + 472) = 1;
  uint64_t v39 = one-time initialization token for max_anisotropy;
  swift_retain();
  if (v39 != -1) {
    swift_once();
  }
  uint64_t v40 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v25 + 480), "max_anisotropy");
  *(unsigned char *)(v25 + 495) = -18;
  *(void *)(v25 + 496) = v40;
  *(_OWORD *)(v25 + 504) = 0u;
  *(_OWORD *)(v25 + 520) = 0u;
  *(unsigned char *)(v25 + 536) = 1;
  uint64_t v41 = one-time initialization token for lod_clamp;
  swift_retain();
  if (v41 != -1) {
    swift_once();
  }
  uint64_t v42 = static MaterialXDataType.lod_clamp;
  *(void *)(v25 + 544) = 0x6D616C635F646F6CLL;
  *(void *)(v25 + 552) = 0xE900000000000070;
  *(void *)(v25 + 560) = v42;
  *(_OWORD *)(v25 + 568) = 0u;
  *(_OWORD *)(v25 + 584) = 0u;
  *(unsigned char *)(v25 + 600) = 1;
  uint64_t v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = v326;
  uint64_t v323 = type metadata accessor for MaterialXDataType();
  uint64_t v44 = swift_allocObject();
  long long v322 = xmmword_25C41B800;
  *(_OWORD *)(v44 + 24) = xmmword_25C41B800;
  *(void *)(v44 + 40) = 0xE700000000000000;
  uint64_t v45 = MEMORY[0x263F8EE78];
  *(void *)(v44 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v43 + 32) = 7632239;
  *(void *)(v43 + 40) = 0xE300000000000000;
  *(void *)(v43 + 48) = v44;
  *(_OWORD *)(v43 + 56) = 0u;
  *(_OWORD *)(v43 + 72) = 0u;
  *(unsigned char *)(v43 + 88) = 0;
  *(void *)&long long v680 = 0xD000000000000013;
  *((void *)&v680 + 1) = 0x800000025C427F80;
  unint64_t v681 = 0xD000000000000013;
  unint64_t v682 = 0x800000025C427F80;
  uint64_t v684 = 0;
  uint64_t v683 = 0;
  unint64_t v685 = 0xD000000000000013;
  unint64_t v686 = v325 | 0x8000000000000000;
  uint64_t v688 = 0;
  uint64_t v687 = 0;
  char v689 = 2;
  *(_DWORD *)v690 = *(_DWORD *)v717;
  *(_DWORD *)&v690[3] = *(_DWORD *)&v717[3];
  uint64_t v691 = v45;
  uint64_t v692 = 0;
  uint64_t v694 = 0;
  uint64_t v693 = 0;
  uint64_t v695 = 2;
  uint64_t v696 = v25;
  uint64_t v697 = v43;
  swift_retain();
  char v46 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v24;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v680, 0xD000000000000013, 0x800000025C427F80, v46);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_25C41F9F0;
  uint64_t v48 = static MaterialXDataType.realitykit.coord;
  *(void *)(v47 + 32) = 0x64726F6F63;
  *(void *)(v47 + 40) = 0xE500000000000000;
  *(void *)(v47 + 48) = v48;
  *(_OWORD *)(v47 + 56) = 0u;
  *(_OWORD *)(v47 + 72) = 0u;
  *(unsigned char *)(v47 + 88) = 1;
  uint64_t v49 = one-time initialization token for u_pixel_wrap_mode;
  swift_retain();
  if (v49 != -1) {
    swift_once();
  }
  uint64_t v50 = static MaterialXDataType.realitykit.u_pixel_wrap_mode;
  *(void *)(v47 + 96) = 0x6D5F706172775F75;
  *(void *)(v47 + 104) = 0xEB0000000065646FLL;
  *(void *)(v47 + 112) = v50;
  *(_OWORD *)(v47 + 120) = 0u;
  *(_OWORD *)(v47 + 136) = 0u;
  *(unsigned char *)(v47 + 152) = 1;
  uint64_t v51 = one-time initialization token for v_pixel_wrap_mode;
  swift_retain();
  if (v51 != -1) {
    swift_once();
  }
  uint64_t v52 = static MaterialXDataType.realitykit.v_pixel_wrap_mode;
  *(_OWORD *)(v47 + 248) = 0u;
  *(void *)(v47 + 160) = 0x6D5F706172775F76;
  *(void *)(v47 + 168) = 0xEB0000000065646FLL;
  *(void *)(v47 + 176) = v52;
  *(_OWORD *)(v47 + 184) = 0u;
  *(_OWORD *)(v47 + 200) = 0u;
  *(unsigned char *)(v47 + 216) = 1;
  uint64_t v53 = static MaterialXDataType.realitykit.borderColor;
  strcpy((char *)(v47 + 224), "border_color");
  *(unsigned char *)(v47 + 237) = 0;
  *(_WORD *)(v47 + 238) = -5120;
  *(void *)(v47 + 240) = v53;
  *(_OWORD *)(v47 + 264) = 0u;
  *(unsigned char *)(v47 + 280) = 1;
  uint64_t v54 = one-time initialization token for filter;
  swift_retain();
  swift_retain();
  if (v54 != -1) {
    swift_once();
  }
  uint64_t v55 = static MaterialXDataType.realitykit.filter;
  *(void *)(v47 + 288) = 0x7265746C6966;
  *(void *)(v47 + 296) = 0xE600000000000000;
  *(void *)(v47 + 304) = v55;
  *(_OWORD *)(v47 + 312) = 0u;
  *(_OWORD *)(v47 + 328) = 0u;
  *(unsigned char *)(v47 + 344) = 1;
  uint64_t v56 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v47 + 352), "max_anisotropy");
  *(unsigned char *)(v47 + 367) = -18;
  *(void *)(v47 + 368) = v56;
  *(_OWORD *)(v47 + 376) = 0u;
  *(_OWORD *)(v47 + 392) = 0u;
  *(unsigned char *)(v47 + 408) = 1;
  uint64_t v57 = static MaterialXDataType.lod_clamp;
  *(void *)(v47 + 416) = 0x6D616C635F646F6CLL;
  *(void *)(v47 + 424) = 0xE900000000000070;
  *(void *)(v47 + 432) = v57;
  *(_OWORD *)(v47 + 440) = 0u;
  *(_OWORD *)(v47 + 456) = 0u;
  *(unsigned char *)(v47 + 472) = 1;
  uint64_t v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = v326;
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 24) = v322;
  *(void *)(v59 + 40) = 0xE700000000000000;
  uint64_t v60 = MEMORY[0x263F8EE78];
  *(void *)(v59 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v58 + 32) = 7632239;
  *(void *)(v58 + 40) = 0xE300000000000000;
  *(void *)(v58 + 48) = v59;
  *(_OWORD *)(v58 + 56) = 0u;
  *(_OWORD *)(v58 + 72) = 0u;
  *(unsigned char *)(v58 + 88) = 0;
  strcpy((char *)&v663, "SamplerPixel2D");
  HIBYTE(v663) = -18;
  strcpy(v664, "SamplerPixel2D");
  v664[15] = -18;
  uint64_t v665 = 0;
  uint64_t v666 = 0;
  unint64_t v667 = 0xD000000000000013;
  *(void *)&long long v320 = v325 | 0x8000000000000000;
  unint64_t v668 = v325 | 0x8000000000000000;
  uint64_t v670 = 0;
  uint64_t v669 = 0;
  char v671 = 2;
  *(_DWORD *)v672 = *(_DWORD *)v718;
  *(_DWORD *)&v672[3] = *(_DWORD *)&v718[3];
  uint64_t v673 = v60;
  uint64_t v674 = 0;
  uint64_t v676 = 0;
  uint64_t v675 = 0;
  uint64_t v677 = 2;
  uint64_t v678 = v47;
  uint64_t v679 = v58;
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v61 = v328;
  char v62 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v61;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v663, 0x5072656C706D6153, 0xEE0044326C657869, v62);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_25C41D580;
  uint64_t v64 = static MaterialXDataType.realitykit.coord;
  *(void *)(v63 + 32) = 0x64726F6F63;
  *(void *)(v63 + 40) = 0xE500000000000000;
  *(void *)(v63 + 48) = v64;
  *(_OWORD *)(v63 + 56) = 0u;
  *(_OWORD *)(v63 + 72) = 0u;
  *(unsigned char *)(v63 + 88) = 1;
  uint64_t v65 = static MaterialXDataType.realitykit.u_wrap_mode;
  *(void *)(v63 + 96) = 0x6D5F706172775F75;
  *(void *)(v63 + 104) = 0xEB0000000065646FLL;
  *(void *)(v63 + 112) = v65;
  *(_OWORD *)(v63 + 120) = 0u;
  *(_OWORD *)(v63 + 136) = 0u;
  *(unsigned char *)(v63 + 152) = 1;
  uint64_t v66 = static MaterialXDataType.realitykit.v_wrap_mode;
  *(void *)(v63 + 160) = 0x6D5F706172775F76;
  *(void *)(v63 + 168) = 0xEB0000000065646FLL;
  *(void *)(v63 + 176) = v66;
  *(_OWORD *)(v63 + 200) = 0u;
  *(_OWORD *)(v63 + 184) = 0u;
  *(unsigned char *)(v63 + 216) = 1;
  uint64_t v67 = one-time initialization token for w_wrap_mode;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v67 != -1) {
    swift_once();
  }
  uint64_t v68 = static MaterialXDataType.realitykit.w_wrap_mode;
  uint64_t v319 = static MaterialXDataType.realitykit.w_wrap_mode;
  unint64_t v321 = 0x6D5F706172775F77;
  *(void *)(v63 + 224) = 0x6D5F706172775F77;
  *(void *)(v63 + 232) = 0xEB0000000065646FLL;
  *(void *)(v63 + 240) = v68;
  *(_OWORD *)(v63 + 248) = 0u;
  *(_OWORD *)(v63 + 264) = 0u;
  *(unsigned char *)(v63 + 280) = 1;
  uint64_t v69 = static MaterialXDataType.realitykit.borderColor;
  *(void *)&long long v318 = static MaterialXDataType.realitykit.borderColor;
  strcpy((char *)(v63 + 288), "border_color");
  *(unsigned char *)(v63 + 301) = 0;
  *(_WORD *)(v63 + 302) = -5120;
  *(void *)(v63 + 304) = v69;
  *(_OWORD *)(v63 + 312) = 0u;
  *(_OWORD *)(v63 + 328) = 0u;
  *(unsigned char *)(v63 + 344) = 1;
  uint64_t v70 = static MaterialXDataType.realitykit.magFilter;
  *(void *)(v63 + 352) = 0x746C69665F67616DLL;
  *(void *)(v63 + 360) = 0xEA00000000007265;
  *(void *)(v63 + 368) = v70;
  *(_OWORD *)(v63 + 376) = 0u;
  *(_OWORD *)(v63 + 392) = 0u;
  *(unsigned char *)(v63 + 408) = 1;
  uint64_t v71 = static MaterialXDataType.realitykit.minFilter;
  *(void *)(v63 + 416) = 0x746C69665F6E696DLL;
  *(void *)(v63 + 424) = 0xEA00000000007265;
  *(void *)(v63 + 432) = v71;
  *(_OWORD *)(v63 + 440) = 0u;
  *(_OWORD *)(v63 + 456) = 0u;
  *(unsigned char *)(v63 + 472) = 1;
  uint64_t v72 = static MaterialXDataType.realitykit.mipFilter;
  *(void *)(v63 + 480) = 0x746C69665F70696DLL;
  *(void *)(v63 + 488) = 0xEA00000000007265;
  *(void *)(v63 + 496) = v72;
  *(_OWORD *)(v63 + 504) = 0u;
  *(_OWORD *)(v63 + 520) = 0u;
  *(unsigned char *)(v63 + 536) = 1;
  uint64_t v73 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v63 + 544), "max_anisotropy");
  *(unsigned char *)(v63 + 559) = -18;
  *(void *)(v63 + 560) = v73;
  *(_OWORD *)(v63 + 568) = 0u;
  *(_OWORD *)(v63 + 584) = 0u;
  *(unsigned char *)(v63 + 600) = 1;
  uint64_t v74 = static MaterialXDataType.lod_clamp;
  *(void *)(v63 + 608) = 0x6D616C635F646F6CLL;
  *(void *)(v63 + 616) = 0xE900000000000070;
  *(void *)(v63 + 624) = v74;
  *(_OWORD *)(v63 + 632) = 0u;
  *(_OWORD *)(v63 + 648) = 0u;
  *(unsigned char *)(v63 + 664) = 1;
  uint64_t v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = v326;
  uint64_t v76 = swift_allocObject();
  *(_OWORD *)(v76 + 24) = v322;
  *(void *)(v76 + 40) = 0xE700000000000000;
  uint64_t v77 = MEMORY[0x263F8EE78];
  *(void *)(v76 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v75 + 32) = 7632239;
  *(void *)(v75 + 40) = 0xE300000000000000;
  *(void *)(v75 + 48) = v76;
  *(_OWORD *)(v75 + 56) = 0u;
  *(_OWORD *)(v75 + 72) = 0u;
  *(unsigned char *)(v75 + 88) = 0;
  *(void *)&long long v645 = 0xD000000000000013;
  *((void *)&v645 + 1) = 0x800000025C427FA0;
  unint64_t v646 = 0xD000000000000013;
  unint64_t v647 = 0x800000025C427FA0;
  uint64_t v649 = 0;
  uint64_t v648 = 0;
  unint64_t v650 = 0xD000000000000013;
  uint64_t v651 = v320;
  uint64_t v653 = 0;
  uint64_t v652 = 0;
  char v654 = 2;
  *(_DWORD *)v655 = *(_DWORD *)v719;
  *(_DWORD *)&v655[3] = *(_DWORD *)&v719[3];
  uint64_t v656 = v77;
  uint64_t v657 = 0;
  uint64_t v659 = 0;
  uint64_t v658 = 0;
  uint64_t v660 = 2;
  uint64_t v661 = v63;
  uint64_t v662 = v75;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v78 = v328;
  char v79 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v78;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v645, 0xD000000000000013, 0x800000025C427FA0, v79);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v80 = swift_allocObject();
  *(_OWORD *)(v80 + 16) = xmmword_25C41D5A0;
  uint64_t v81 = static MaterialXDataType.realitykit.coord;
  *(void *)(v80 + 32) = 0x64726F6F63;
  *(void *)(v80 + 40) = 0xE500000000000000;
  *(void *)(v80 + 48) = v81;
  *(_OWORD *)(v80 + 56) = 0u;
  *(_OWORD *)(v80 + 72) = 0u;
  *(unsigned char *)(v80 + 88) = 1;
  uint64_t v82 = static MaterialXDataType.realitykit.u_pixel_wrap_mode;
  *(void *)(v80 + 96) = 0x6D5F706172775F75;
  *(void *)(v80 + 104) = 0xEB0000000065646FLL;
  *(void *)(v80 + 112) = v82;
  *(_OWORD *)(v80 + 120) = 0u;
  *(_OWORD *)(v80 + 136) = 0u;
  *(unsigned char *)(v80 + 152) = 1;
  uint64_t v83 = static MaterialXDataType.realitykit.v_pixel_wrap_mode;
  *(void *)(v80 + 160) = 0x6D5F706172775F76;
  *(void *)(v80 + 168) = 0xEB0000000065646FLL;
  *(void *)(v80 + 176) = v83;
  *(_OWORD *)(v80 + 200) = 0u;
  *(_OWORD *)(v80 + 184) = 0u;
  *(unsigned char *)(v80 + 216) = 1;
  uint64_t v84 = one-time initialization token for w_pixel_wrap_mode;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v84 != -1) {
    swift_once();
  }
  uint64_t v85 = static MaterialXDataType.realitykit.w_pixel_wrap_mode;
  *(void *)(v80 + 224) = v321;
  *(void *)(v80 + 232) = 0xEB0000000065646FLL;
  *(void *)(v80 + 240) = v85;
  *(_OWORD *)(v80 + 248) = 0u;
  *(_OWORD *)(v80 + 264) = 0u;
  *(unsigned char *)(v80 + 280) = 1;
  uint64_t v86 = static MaterialXDataType.realitykit.borderColor;
  strcpy((char *)(v80 + 288), "border_color");
  *(unsigned char *)(v80 + 301) = 0;
  *(_WORD *)(v80 + 302) = -5120;
  *(void *)(v80 + 304) = v86;
  *(_OWORD *)(v80 + 312) = 0u;
  *(_OWORD *)(v80 + 328) = 0u;
  *(unsigned char *)(v80 + 344) = 1;
  uint64_t v87 = static MaterialXDataType.realitykit.filter;
  *(void *)(v80 + 352) = 0x7265746C6966;
  *(void *)(v80 + 360) = 0xE600000000000000;
  *(void *)(v80 + 368) = v87;
  *(_OWORD *)(v80 + 376) = 0u;
  *(_OWORD *)(v80 + 392) = 0u;
  *(unsigned char *)(v80 + 408) = 1;
  uint64_t v88 = static MaterialXDataType.max_anisotropy;
  strcpy((char *)(v80 + 416), "max_anisotropy");
  *(unsigned char *)(v80 + 431) = -18;
  *(void *)(v80 + 432) = v88;
  *(_OWORD *)(v80 + 440) = 0u;
  *(_OWORD *)(v80 + 456) = 0u;
  *(unsigned char *)(v80 + 472) = 1;
  uint64_t v89 = static MaterialXDataType.lod_clamp;
  *(void *)(v80 + 480) = 0x6D616C635F646F6CLL;
  *(void *)(v80 + 488) = 0xE900000000000070;
  *(void *)(v80 + 496) = v89;
  *(_OWORD *)(v80 + 504) = 0u;
  *(_OWORD *)(v80 + 520) = 0u;
  *(unsigned char *)(v80 + 536) = 1;
  uint64_t v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = v326;
  uint64_t v91 = swift_allocObject();
  *(_OWORD *)(v91 + 24) = v322;
  *(void *)(v91 + 40) = 0xE700000000000000;
  uint64_t v92 = MEMORY[0x263F8EE78];
  *(void *)(v91 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v90 + 32) = 7632239;
  *(void *)(v90 + 40) = 0xE300000000000000;
  *(void *)(v90 + 48) = v91;
  *(_OWORD *)(v90 + 56) = 0u;
  *(_OWORD *)(v90 + 72) = 0u;
  *(unsigned char *)(v90 + 88) = 0;
  strcpy((char *)&v628, "SamplerPixel3D");
  HIBYTE(v628) = -18;
  strcpy(v629, "SamplerPixel3D");
  v629[15] = -18;
  uint64_t v631 = 0;
  uint64_t v630 = 0;
  unint64_t v632 = 0xD000000000000013;
  *(void *)&long long v322 = v325 | 0x8000000000000000;
  unint64_t v633 = v325 | 0x8000000000000000;
  uint64_t v635 = 0;
  uint64_t v634 = 0;
  char v636 = 2;
  *(_DWORD *)v637 = *(_DWORD *)v720;
  *(_DWORD *)&v637[3] = *(_DWORD *)&v720[3];
  uint64_t v638 = v92;
  uint64_t v639 = 0;
  uint64_t v641 = 0;
  uint64_t v640 = 0;
  uint64_t v642 = 2;
  uint64_t v643 = v80;
  uint64_t v644 = v90;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v93 = v328;
  char v94 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v93;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v628, 0x5072656C706D6153, 0xEE0044336C657869, v94);
  unint64_t v95 = v327;
  swift_bridgeObjectRelease();
  uint64_t v96 = swift_allocObject();
  *(_OWORD *)(v96 + 16) = v326;
  uint64_t v97 = MEMORY[0x263F8EE78];
  if (one-time initialization token for filename != -1) {
    swift_once();
  }
  uint64_t v98 = static MaterialXDataType.filename;
  *(void *)(v96 + 32) = 1701603686;
  *(void *)(v96 + 40) = 0xE400000000000000;
  *(void *)(v96 + 48) = v98;
  *(_OWORD *)(v96 + 56) = 0u;
  *(_OWORD *)(v96 + 72) = 0u;
  *(unsigned char *)(v96 + 88) = 0;
  uint64_t v99 = swift_allocObject();
  *(_OWORD *)(v99 + 16) = v326;
  uint64_t v100 = swift_allocObject();
  long long v320 = xmmword_25C41B7B0;
  *(_OWORD *)(v100 + 24) = xmmword_25C41B7B0;
  *(void *)(v100 + 40) = 0xED0000666C616864;
  *(void *)(v100 + 16) = v97;
  *(void *)(v99 + 32) = 7632239;
  *(void *)(v99 + 40) = 0xE300000000000000;
  *(void *)(v99 + 48) = v100;
  *(_OWORD *)(v99 + 56) = 0u;
  *(_OWORD *)(v99 + 72) = 0u;
  *(unsigned char *)(v99 + 88) = 0;
  *(void *)&long long v610 = 0xD00000000000001ALL;
  *((void *)&v610 + 1) = 0x800000025C427FC0;
  unint64_t v611 = 0xD000000000000013;
  unint64_t v612 = 0x800000025C421DA0;
  unint64_t v321 = 0x800000025C421DA0;
  uint64_t v614 = 0;
  uint64_t v613 = 0;
  unint64_t v615 = 0xD000000000000013;
  uint64_t v616 = v322;
  uint64_t v618 = 0;
  uint64_t v617 = 0;
  char v619 = 2;
  *(_DWORD *)v620 = *(_DWORD *)v721;
  *(_DWORD *)&v620[3] = *(_DWORD *)&v721[3];
  uint64_t v621 = v97;
  uint64_t v622 = 0;
  uint64_t v624 = 0;
  uint64_t v623 = 0;
  uint64_t v625 = 2;
  uint64_t v626 = v96;
  uint64_t v627 = v99;
  swift_retain();
  char v101 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v95;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v610, 0xD00000000000001ALL, 0x800000025C427FC0, v101);
  unint64_t v102 = v327;
  swift_bridgeObjectRelease();
  uint64_t v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = v326;
  uint64_t v104 = static MaterialXDataType.filename;
  *(void *)(v103 + 32) = 1701603686;
  *(void *)(v103 + 40) = 0xE400000000000000;
  *(void *)(v103 + 48) = v104;
  *(_OWORD *)(v103 + 56) = 0u;
  *(_OWORD *)(v103 + 72) = 0u;
  *(unsigned char *)(v103 + 88) = 0;
  uint64_t v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = v326;
  uint64_t v106 = swift_allocObject();
  *(_OWORD *)(v106 + 24) = xmmword_25C41B720;
  *(void *)(v106 + 40) = 0x800000025C4244B0;
  uint64_t v107 = MEMORY[0x263F8EE78];
  *(void *)(v106 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v105 + 32) = 7632239;
  *(void *)(v105 + 40) = 0xE300000000000000;
  *(void *)(v105 + 48) = v106;
  *(_OWORD *)(v105 + 56) = 0u;
  *(_OWORD *)(v105 + 72) = 0u;
  *(unsigned char *)(v105 + 88) = 0;
  *(void *)&long long v592 = 0xD000000000000021;
  *((void *)&v592 + 1) = 0x800000025C427FE0;
  unint64_t v593 = 0xD000000000000013;
  unint64_t v594 = 0x800000025C421DA0;
  uint64_t v596 = 0;
  uint64_t v595 = 0;
  unint64_t v597 = 0xD000000000000013;
  uint64_t v108 = v322;
  uint64_t v598 = v322;
  uint64_t v600 = 0;
  uint64_t v599 = 0;
  char v601 = 2;
  *(_DWORD *)v602 = *(_DWORD *)v722;
  *(_DWORD *)&v602[3] = *(_DWORD *)&v722[3];
  uint64_t v603 = v107;
  uint64_t v604 = 0;
  uint64_t v606 = 0;
  uint64_t v605 = 0;
  uint64_t v607 = 2;
  uint64_t v608 = v103;
  uint64_t v609 = v105;
  swift_retain();
  char v109 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v102;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v592, 0xD000000000000021, 0x800000025C427FE0, v109);
  unint64_t v110 = v327;
  swift_bridgeObjectRelease();
  uint64_t v111 = swift_allocObject();
  *(_OWORD *)(v111 + 16) = v326;
  uint64_t v112 = static MaterialXDataType.filename;
  *(void *)(v111 + 32) = 1701603686;
  *(void *)(v111 + 40) = 0xE400000000000000;
  *(void *)(v111 + 48) = v112;
  *(_OWORD *)(v111 + 56) = 0u;
  *(_OWORD *)(v111 + 72) = 0u;
  *(unsigned char *)(v111 + 88) = 0;
  uint64_t v113 = swift_allocObject();
  *(_OWORD *)(v113 + 16) = v326;
  uint64_t v114 = swift_allocObject();
  *(_OWORD *)(v114 + 24) = v320;
  *(void *)(v114 + 40) = 0xEE0074616F6C6664;
  uint64_t v115 = MEMORY[0x263F8EE78];
  *(void *)(v114 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v113 + 32) = 7632239;
  *(void *)(v113 + 40) = 0xE300000000000000;
  *(void *)(v113 + 48) = v114;
  *(_OWORD *)(v113 + 56) = 0u;
  *(_OWORD *)(v113 + 72) = 0u;
  *(unsigned char *)(v113 + 88) = 0;
  *(void *)&long long v574 = 0xD00000000000001BLL;
  *((void *)&v574 + 1) = 0x800000025C428010;
  unint64_t v575 = 0xD000000000000013;
  unint64_t v116 = v321;
  unint64_t v576 = v321;
  uint64_t v578 = 0;
  uint64_t v577 = 0;
  unint64_t v579 = 0xD000000000000013;
  uint64_t v580 = v108;
  uint64_t v582 = 0;
  uint64_t v581 = 0;
  char v583 = 2;
  *(_DWORD *)v584 = *(_DWORD *)v723;
  *(_DWORD *)&v584[3] = *(_DWORD *)&v723[3];
  uint64_t v585 = v115;
  uint64_t v586 = 0;
  uint64_t v588 = 0;
  uint64_t v587 = 0;
  uint64_t v589 = 2;
  uint64_t v590 = v111;
  uint64_t v591 = v113;
  swift_retain();
  char v117 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v110;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v574, 0xD00000000000001BLL, 0x800000025C428010, v117);
  unint64_t v118 = v327;
  swift_bridgeObjectRelease();
  uint64_t v119 = swift_allocObject();
  *(_OWORD *)(v119 + 16) = v326;
  uint64_t v120 = static MaterialXDataType.filename;
  *(void *)(v119 + 32) = 1701603686;
  *(void *)(v119 + 40) = 0xE400000000000000;
  *(void *)(v119 + 48) = v120;
  *(_OWORD *)(v119 + 56) = 0u;
  *(_OWORD *)(v119 + 72) = 0u;
  *(unsigned char *)(v119 + 88) = 0;
  uint64_t v121 = swift_allocObject();
  *(_OWORD *)(v121 + 16) = v326;
  uint64_t v122 = swift_allocObject();
  *(_OWORD *)(v122 + 24) = xmmword_25C41B7C0;
  *(void *)(v122 + 40) = 0x800000025C424490;
  uint64_t v123 = MEMORY[0x263F8EE78];
  *(void *)(v122 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v121 + 32) = 7632239;
  *(void *)(v121 + 40) = 0xE300000000000000;
  *(void *)(v121 + 48) = v122;
  *(_OWORD *)(v121 + 56) = 0u;
  *(_OWORD *)(v121 + 72) = 0u;
  *(unsigned char *)(v121 + 88) = 0;
  *(void *)&long long v556 = 0xD000000000000022;
  *((void *)&v556 + 1) = 0x800000025C428030;
  unint64_t v557 = 0xD000000000000013;
  unint64_t v558 = v116;
  uint64_t v560 = 0;
  uint64_t v559 = 0;
  unint64_t v561 = 0xD000000000000013;
  uint64_t v562 = v108;
  uint64_t v564 = 0;
  uint64_t v563 = 0;
  char v565 = 2;
  *(_DWORD *)long long v566 = *(_DWORD *)v724;
  *(_DWORD *)&v566[3] = *(_DWORD *)&v724[3];
  uint64_t v567 = v123;
  uint64_t v124 = v123;
  uint64_t v568 = 0;
  uint64_t v570 = 0;
  uint64_t v569 = 0;
  uint64_t v571 = 2;
  uint64_t v572 = v119;
  uint64_t v573 = v121;
  swift_retain();
  char v125 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v118;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v556, 0xD000000000000022, 0x800000025C428030, v125);
  unint64_t v126 = v327;
  swift_bridgeObjectRelease();
  uint64_t v127 = swift_allocObject();
  *(_OWORD *)(v127 + 16) = v326;
  uint64_t v128 = static MaterialXDataType.filename;
  *(void *)(v127 + 32) = 1701603686;
  *(void *)(v127 + 40) = 0xE400000000000000;
  *(void *)(v127 + 48) = v128;
  *(_OWORD *)(v127 + 56) = 0u;
  *(_OWORD *)(v127 + 72) = 0u;
  *(unsigned char *)(v127 + 88) = 0;
  uint64_t v129 = swift_allocObject();
  *(_OWORD *)(v129 + 16) = v326;
  uint64_t v130 = swift_allocObject();
  long long v318 = xmmword_25C41B7E0;
  *(_OWORD *)(v130 + 24) = xmmword_25C41B7E0;
  *(void *)(v130 + 40) = 0xED0000666C616864;
  uint64_t v131 = v124;
  *(void *)(v130 + 16) = v124;
  *(void *)(v129 + 32) = 7632239;
  *(void *)(v129 + 40) = 0xE300000000000000;
  *(void *)(v129 + 48) = v130;
  *(_OWORD *)(v129 + 56) = 0u;
  *(_OWORD *)(v129 + 72) = 0u;
  *(unsigned char *)(v129 + 88) = 0;
  *(void *)&long long v538 = 0xD00000000000001CLL;
  uint64_t v319 = 0xD00000000000001CLL;
  *((void *)&v538 + 1) = 0x800000025C428060;
  unint64_t v539 = 0xD000000000000013;
  unint64_t v132 = v321;
  unint64_t v540 = v321;
  uint64_t v542 = 0;
  uint64_t v541 = 0;
  unint64_t v543 = 0xD000000000000013;
  uint64_t v544 = v322;
  uint64_t v546 = 0;
  uint64_t v545 = 0;
  char v547 = 2;
  *(_DWORD *)v548 = *(_DWORD *)v725;
  *(_DWORD *)&v548[3] = *(_DWORD *)&v725[3];
  uint64_t v549 = v131;
  uint64_t v550 = 0;
  uint64_t v552 = 0;
  uint64_t v551 = 0;
  uint64_t v553 = 2;
  uint64_t v554 = v127;
  uint64_t v555 = v129;
  swift_retain();
  char v133 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v126;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v538, 0xD00000000000001CLL, 0x800000025C428060, v133);
  unint64_t v134 = v327;
  swift_bridgeObjectRelease();
  uint64_t v135 = swift_allocObject();
  *(_OWORD *)(v135 + 16) = v326;
  uint64_t v136 = static MaterialXDataType.filename;
  *(void *)(v135 + 32) = 1701603686;
  *(void *)(v135 + 40) = 0xE400000000000000;
  *(void *)(v135 + 48) = v136;
  *(_OWORD *)(v135 + 56) = 0u;
  *(_OWORD *)(v135 + 72) = 0u;
  *(unsigned char *)(v135 + 88) = 0;
  uint64_t v137 = swift_allocObject();
  *(_OWORD *)(v137 + 16) = v326;
  uint64_t v138 = swift_allocObject();
  *(_OWORD *)(v138 + 24) = v318;
  *(void *)(v138 + 40) = 0xEE0074616F6C6664;
  uint64_t v139 = MEMORY[0x263F8EE78];
  *(void *)(v138 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v137 + 32) = 7632239;
  *(void *)(v137 + 40) = 0xE300000000000000;
  *(void *)(v137 + 48) = v138;
  *(_OWORD *)(v137 + 56) = 0u;
  *(_OWORD *)(v137 + 72) = 0u;
  *(unsigned char *)(v137 + 88) = 0;
  *(void *)&long long v520 = 0xD00000000000001DLL;
  *((void *)&v520 + 1) = 0x800000025C428080;
  unint64_t v521 = 0xD000000000000013;
  unint64_t v522 = v132;
  uint64_t v524 = 0;
  uint64_t v523 = 0;
  unint64_t v525 = 0xD000000000000013;
  uint64_t v140 = v322;
  uint64_t v526 = v322;
  uint64_t v528 = 0;
  uint64_t v527 = 0;
  char v529 = 2;
  *(_DWORD *)uint64_t v530 = *(_DWORD *)v726;
  *(_DWORD *)&v530[3] = *(_DWORD *)&v726[3];
  uint64_t v531 = v139;
  uint64_t v532 = 0;
  uint64_t v534 = 0;
  uint64_t v533 = 0;
  uint64_t v535 = 2;
  uint64_t v536 = v135;
  uint64_t v537 = v137;
  swift_retain();
  char v141 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v134;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v520, 0xD00000000000001DLL, 0x800000025C428080, v141);
  unint64_t v142 = v327;
  swift_bridgeObjectRelease();
  uint64_t v143 = swift_allocObject();
  *(_OWORD *)(v143 + 16) = v326;
  uint64_t v144 = static MaterialXDataType.filename;
  *(void *)(v143 + 32) = 1701603686;
  *(void *)(v143 + 40) = 0xE400000000000000;
  *(void *)(v143 + 48) = v144;
  *(_OWORD *)(v143 + 56) = 0u;
  *(_OWORD *)(v143 + 72) = 0u;
  *(unsigned char *)(v143 + 88) = 0;
  uint64_t v145 = swift_allocObject();
  *(_OWORD *)(v145 + 16) = v326;
  uint64_t v146 = swift_allocObject();
  *(_OWORD *)(v146 + 24) = xmmword_25C41B7F0;
  *(void *)(v146 + 40) = 0xEF666C6168656275;
  uint64_t v147 = MEMORY[0x263F8EE78];
  *(void *)(v146 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v145 + 32) = 7632239;
  *(void *)(v145 + 40) = 0xE300000000000000;
  *(void *)(v145 + 48) = v146;
  *(_OWORD *)(v145 + 56) = 0u;
  *(_OWORD *)(v145 + 72) = 0u;
  *(unsigned char *)(v145 + 88) = 0;
  *(void *)&long long v502 = 0xD00000000000001ELL;
  *((void *)&v502 + 1) = 0x800000025C4280A0;
  unint64_t v503 = 0xD000000000000013;
  unint64_t v504 = v321;
  uint64_t v506 = 0;
  uint64_t v505 = 0;
  unint64_t v507 = 0xD000000000000013;
  uint64_t v508 = v140;
  uint64_t v510 = 0;
  uint64_t v509 = 0;
  char v511 = 2;
  *(_DWORD *)v512 = *(_DWORD *)v727;
  *(_DWORD *)&v512[3] = *(_DWORD *)&v727[3];
  uint64_t v513 = v147;
  uint64_t v148 = v147;
  uint64_t v514 = 0;
  uint64_t v516 = 0;
  uint64_t v515 = 0;
  uint64_t v517 = 2;
  uint64_t v518 = v143;
  uint64_t v519 = v145;
  swift_retain();
  char v149 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v142;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v502, 0xD00000000000001ELL, 0x800000025C4280A0, v149);
  unint64_t v150 = v327;
  swift_bridgeObjectRelease();
  uint64_t v151 = swift_allocObject();
  *(_OWORD *)(v151 + 16) = v326;
  uint64_t v152 = static MaterialXDataType.filename;
  *(void *)(v151 + 32) = 1701603686;
  *(void *)(v151 + 40) = 0xE400000000000000;
  *(void *)(v151 + 48) = v152;
  *(_OWORD *)(v151 + 56) = 0u;
  *(_OWORD *)(v151 + 72) = 0u;
  *(unsigned char *)(v151 + 88) = 0;
  uint64_t v153 = swift_allocObject();
  *(_OWORD *)(v153 + 16) = v326;
  uint64_t v154 = swift_allocObject();
  *(_OWORD *)(v154 + 24) = xmmword_25C41B760;
  *(void *)(v154 + 40) = 0x800000025C424450;
  uint64_t v155 = v148;
  *(void *)(v154 + 16) = v148;
  *(void *)(v153 + 32) = 7632239;
  *(void *)(v153 + 40) = 0xE300000000000000;
  *(void *)(v153 + 48) = v154;
  *(_OWORD *)(v153 + 56) = 0u;
  *(_OWORD *)(v153 + 72) = 0u;
  *(unsigned char *)(v153 + 88) = 0;
  *(void *)&long long v484 = 0xD00000000000001FLL;
  *((void *)&v484 + 1) = 0x800000025C4280C0;
  unint64_t v485 = 0xD000000000000013;
  unint64_t v156 = v321;
  unint64_t v486 = v321;
  uint64_t v487 = 0;
  uint64_t v488 = 0;
  unint64_t v489 = 0xD000000000000013;
  uint64_t v490 = v322;
  uint64_t v492 = 0;
  uint64_t v491 = 0;
  char v493 = 2;
  *(_DWORD *)id v494 = *(_DWORD *)v728;
  *(_DWORD *)&v494[3] = *(_DWORD *)&v728[3];
  uint64_t v495 = v155;
  uint64_t v496 = 0;
  uint64_t v498 = 0;
  uint64_t v497 = 0;
  uint64_t v499 = 2;
  uint64_t v500 = v151;
  uint64_t v501 = v153;
  swift_retain();
  char v157 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v150;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v484, 0xD00000000000001FLL, 0x800000025C4280C0, v157);
  unint64_t v158 = v327;
  swift_bridgeObjectRelease();
  uint64_t v159 = swift_allocObject();
  *(_OWORD *)(v159 + 16) = v326;
  uint64_t v160 = static MaterialXDataType.filename;
  *(void *)(v159 + 32) = 1701603686;
  *(void *)(v159 + 40) = 0xE400000000000000;
  *(void *)(v159 + 48) = v160;
  *(_OWORD *)(v159 + 56) = 0u;
  *(_OWORD *)(v159 + 72) = 0u;
  *(unsigned char *)(v159 + 88) = 0;
  uint64_t v161 = swift_allocObject();
  *(_OWORD *)(v161 + 16) = v326;
  uint64_t v162 = swift_allocObject();
  *(_OWORD *)(v162 + 24) = v320;
  *(void *)(v162 + 40) = 0xEC000000746E6964;
  uint64_t v163 = MEMORY[0x263F8EE78];
  *(void *)(v162 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v161 + 32) = 7632239;
  *(void *)(v161 + 40) = 0xE300000000000000;
  *(void *)(v161 + 48) = v162;
  *(_OWORD *)(v161 + 56) = 0u;
  *(_OWORD *)(v161 + 72) = 0u;
  *(unsigned char *)(v161 + 88) = 0;
  uint64_t v164 = v319;
  *(void *)&long long v466 = v319;
  *((void *)&v466 + 1) = 0x800000025C4280E0;
  unint64_t v467 = 0xD000000000000013;
  unint64_t v468 = v156;
  uint64_t v469 = 0;
  uint64_t v470 = 0;
  unint64_t v471 = 0xD000000000000013;
  uint64_t v472 = v322;
  uint64_t v474 = 0;
  uint64_t v473 = 0;
  char v475 = 2;
  *(_DWORD *)uint64_t v476 = *(_DWORD *)v729;
  *(_DWORD *)&v476[3] = *(_DWORD *)&v729[3];
  uint64_t v477 = v163;
  uint64_t v478 = 0;
  uint64_t v480 = 0;
  uint64_t v479 = 0;
  uint64_t v481 = 2;
  uint64_t v482 = v159;
  uint64_t v483 = v161;
  swift_retain();
  char v165 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v158;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v466, v164, 0x800000025C4280E0, v165);
  unint64_t v166 = v327;
  swift_bridgeObjectRelease();
  uint64_t v167 = swift_allocObject();
  *(_OWORD *)(v167 + 16) = v326;
  if (one-time initialization token for integer != -1) {
    swift_once();
  }
  uint64_t v168 = static MaterialXDataType.integer;
  *(void *)(v167 + 32) = 28265;
  *(void *)(v167 + 40) = 0xE200000000000000;
  *(void *)(v167 + 48) = v168;
  *(_OWORD *)(v167 + 56) = 0u;
  *(_OWORD *)(v167 + 72) = 0u;
  *(unsigned char *)(v167 + 88) = 1;
  uint64_t v169 = swift_allocObject();
  *(_OWORD *)(v169 + 16) = v326;
  uint64_t v170 = static MaterialXDataType.max_anisotropy;
  *(void *)(v169 + 32) = 7632239;
  *(void *)(v169 + 40) = 0xE300000000000000;
  *(void *)(v169 + 48) = v170;
  *(_OWORD *)(v169 + 56) = 0u;
  *(_OWORD *)(v169 + 72) = 0u;
  *(unsigned char *)(v169 + 88) = 0;
  *(void *)&long long v448 = 0xD000000000000017;
  *((void *)&v448 + 1) = 0x800000025C428100;
  unint64_t v449 = 0xD000000000000017;
  unint64_t v450 = 0x800000025C428100;
  uint64_t v452 = 0;
  uint64_t v451 = 0;
  unint64_t v453 = 0xD000000000000013;
  unint64_t v454 = v325 | 0x8000000000000000;
  uint64_t v456 = 0;
  uint64_t v455 = 0;
  char v457 = 2;
  *(_DWORD *)BOOL v458 = v730[0];
  *(_DWORD *)&v458[3] = *(_DWORD *)((char *)v730 + 3);
  uint64_t v459 = MEMORY[0x263F8EE78];
  uint64_t v460 = 0;
  uint64_t v462 = 0;
  uint64_t v461 = 0;
  uint64_t v463 = 2;
  uint64_t v464 = v167;
  uint64_t v465 = v169;
  swift_retain();
  swift_retain();
  char v171 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v166;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v448, 0xD000000000000017, 0x800000025C428100, v171);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v172 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NodeDef.Implementation>);
  uint64_t v323 = type metadata accessor for NodeDef.Implementation(0);
  uint64_t v173 = *(void *)(*(void *)(v323 - 8) + 72);
  uint64_t v174 = *(unsigned __int8 *)(*(void *)(v323 - 8) + 80);
  uint64_t v175 = (v174 + 32) & ~v174;
  *(void *)&long long v322 = v172;
  uint64_t v319 = v174 | 7;
  *(void *)&long long v320 = v175 + v173;
  uint64_t v176 = swift_allocObject();
  *(_OWORD *)(v176 + 16) = v326;
  unint64_t v321 = v175;
  uint64_t v177 = v176 + v175;
  uint64_t v178 = (uint64_t)v307;
  *uint64_t v307 = 0x73696E615F78616DLL;
  *(void *)(v178 + 8) = 0xEE0079706F72746FLL;
  swift_storeEnumTagMultiPayload();
  *(void *)&long long v318 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v179 = swift_allocObject();
  long long v317 = xmmword_25C4195A0;
  *(_OWORD *)(v179 + 16) = xmmword_25C4195A0;
  uint64_t v316 = type metadata accessor for MaterialXTarget();
  *(void *)(v179 + 32) = swift_initStaticObject();
  unint64_t v327 = v179;
  specialized Array._endMutation()();
  unint64_t v180 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v182 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v182) {
      goto LABEL_37;
    }
  }
  else if (*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    unint64_t v181 = specialized Set.init(_nonEmptyArrayLiteral:)(v180);
    goto LABEL_40;
  }
  unint64_t v181 = MEMORY[0x263F8EE88];
LABEL_40:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v178, v177, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v177 + *(int *)(v323 + 20)) = v181;
  char v183 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v176, 0xD000000000000017, 0x800000025C428100, v183);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v184 = swift_allocObject();
  *(_OWORD *)(v184 + 16) = v326;
  uint64_t v185 = static MaterialXDataType.float;
  *(void *)(v184 + 32) = 28265;
  *(void *)(v184 + 40) = 0xE200000000000000;
  *(void *)(v184 + 48) = v185;
  *(_OWORD *)(v184 + 56) = 0u;
  *(_OWORD *)(v184 + 72) = 0u;
  *(unsigned char *)(v184 + 88) = 0;
  uint64_t v186 = swift_allocObject();
  *(_OWORD *)(v186 + 16) = v326;
  uint64_t v187 = one-time initialization token for bias;
  swift_retain();
  if (v187 != -1) {
    swift_once();
  }
  uint64_t v188 = static MaterialXDataType.bias;
  *(void *)(v186 + 32) = 7632239;
  *(void *)(v186 + 40) = 0xE300000000000000;
  *(void *)(v186 + 48) = v188;
  *(_OWORD *)(v186 + 56) = 0u;
  *(_OWORD *)(v186 + 72) = 0u;
  *(unsigned char *)(v186 + 88) = 0;
  strcpy((char *)&v432, "INTERNAL_bias");
  HIWORD(v432) = -4864;
  strcpy((char *)v433, "INTERNAL_bias");
  v433[7] = -4864;
  uint64_t v434 = 0;
  uint64_t v435 = 0;
  unint64_t v436 = 0xD000000000000013;
  unint64_t v437 = v325 | 0x8000000000000000;
  uint64_t v439 = 0;
  uint64_t v438 = 0;
  char v440 = 2;
  uint64_t v441 = MEMORY[0x263F8EE78];
  uint64_t v442 = 0;
  uint64_t v443 = 0;
  uint64_t v444 = 0;
  uint64_t v445 = 2;
  uint64_t v446 = v184;
  uint64_t v447 = v186;
  swift_retain();
  char v189 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v432, 0x4C414E5245544E49, 0xED0000736169625FLL, v189);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v190 = swift_allocObject();
  *(_OWORD *)(v190 + 16) = v326;
  uint64_t v191 = v190 + v321;
  uint64_t v192 = (uint64_t)v308;
  *uint64_t v308 = 0xD000000000000012;
  *(void *)(v192 + 8) = 0x800000025C424A60;
  swift_storeEnumTagMultiPayload();
  uint64_t v193 = swift_allocObject();
  *(_OWORD *)(v193 + 16) = v317;
  *(void *)(v193 + 32) = swift_initStaticObject();
  unint64_t v327 = v193;
  specialized Array._endMutation()();
  unint64_t v194 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v195 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v195 = *(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v196 = MEMORY[0x263F8EE78];
  if (v195) {
    unint64_t v197 = specialized Set.init(_nonEmptyArrayLiteral:)(v194);
  }
  else {
    unint64_t v197 = MEMORY[0x263F8EE88];
  }
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v192, v191, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v191 + *(int *)(v323 + 20)) = v197;
  char v198 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v190, 0x4C414E5245544E49, 0xED0000736169625FLL, v198);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v199 = swift_allocObject();
  *(_OWORD *)(v199 + 16) = v326;
  uint64_t v200 = static MaterialXDataType.float;
  *(void *)(v199 + 32) = 28265;
  *(void *)(v199 + 40) = 0xE200000000000000;
  *(void *)(v199 + 48) = v200;
  *(_OWORD *)(v199 + 56) = 0u;
  *(_OWORD *)(v199 + 72) = 0u;
  *(unsigned char *)(v199 + 88) = 0;
  uint64_t v201 = swift_allocObject();
  *(_OWORD *)(v201 + 16) = v326;
  uint64_t v202 = one-time initialization token for level;
  swift_retain();
  if (v202 != -1) {
    swift_once();
  }
  uint64_t v203 = static MaterialXDataType.level;
  *(void *)(v201 + 32) = 7632239;
  *(void *)(v201 + 40) = 0xE300000000000000;
  *(void *)(v201 + 48) = v203;
  *(_OWORD *)(v201 + 56) = 0u;
  *(_OWORD *)(v201 + 72) = 0u;
  *(unsigned char *)(v201 + 88) = 0;
  strcpy((char *)&v416, "INTERNAL_level");
  HIBYTE(v416) = -18;
  strcpy(v417, "INTERNAL_level");
  v417[15] = -18;
  uint64_t v419 = 0;
  uint64_t v418 = 0;
  unint64_t v420 = 0xD000000000000013;
  unint64_t v421 = v325 | 0x8000000000000000;
  uint64_t v423 = 0;
  uint64_t v422 = 0;
  char v424 = 2;
  uint64_t v425 = v196;
  uint64_t v426 = 0;
  uint64_t v427 = 0;
  uint64_t v428 = 0;
  uint64_t v429 = 2;
  uint64_t v430 = v199;
  uint64_t v431 = v201;
  swift_retain();
  char v204 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v416, 0x4C414E5245544E49, 0xEE006C6576656C5FLL, v204);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v205 = swift_allocObject();
  *(_OWORD *)(v205 + 16) = v326;
  uint64_t v206 = v205 + v321;
  uint64_t v207 = (uint64_t)v309;
  void *v309 = 0xD000000000000013;
  *(void *)(v207 + 8) = 0x800000025C424A20;
  swift_storeEnumTagMultiPayload();
  uint64_t v208 = swift_allocObject();
  *(_OWORD *)(v208 + 16) = v317;
  *(void *)(v208 + 32) = swift_initStaticObject();
  unint64_t v327 = v208;
  specialized Array._endMutation()();
  unint64_t v209 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v211 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v211) {
      goto LABEL_51;
    }
  }
  else if (*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_51:
    unint64_t v210 = specialized Set.init(_nonEmptyArrayLiteral:)(v209);
    goto LABEL_55;
  }
  unint64_t v210 = MEMORY[0x263F8EE88];
LABEL_55:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v207, v206, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v206 + *(int *)(v323 + 20)) = v210;
  char v212 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v205, 0x4C414E5245544E49, 0xEE006C6576656C5FLL, v212);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v213 = swift_allocObject();
  *(_OWORD *)(v213 + 16) = v326;
  uint64_t v214 = static MaterialXDataType.float;
  *(void *)(v213 + 32) = 28265;
  *(void *)(v213 + 40) = 0xE200000000000000;
  *(void *)(v213 + 48) = v214;
  *(_OWORD *)(v213 + 56) = 0u;
  *(_OWORD *)(v213 + 72) = 0u;
  *(unsigned char *)(v213 + 88) = 0;
  uint64_t v215 = swift_allocObject();
  *(_OWORD *)(v215 + 16) = v326;
  uint64_t v216 = one-time initialization token for min_lod_clamp;
  swift_retain();
  if (v216 != -1) {
    swift_once();
  }
  uint64_t v217 = static MaterialXDataType.min_lod_clamp;
  *(void *)(v215 + 32) = 7632239;
  *(void *)(v215 + 40) = 0xE300000000000000;
  *(void *)(v215 + 48) = v217;
  *(_OWORD *)(v215 + 56) = 0u;
  *(_OWORD *)(v215 + 72) = 0u;
  *(unsigned char *)(v215 + 88) = 0;
  *(void *)&long long v399 = 0xD000000000000016;
  *((void *)&v399 + 1) = 0x800000025C428120;
  unint64_t v400 = 0xD000000000000016;
  unint64_t v401 = 0x800000025C428120;
  uint64_t v403 = 0;
  uint64_t v402 = 0;
  unint64_t v404 = 0xD000000000000013;
  unint64_t v405 = v325 | 0x8000000000000000;
  uint64_t v407 = 0;
  uint64_t v406 = 0;
  char v408 = 2;
  uint64_t v409 = MEMORY[0x263F8EE78];
  uint64_t v410 = 0;
  uint64_t v411 = 0;
  uint64_t v412 = 0;
  uint64_t v413 = 2;
  uint64_t v414 = v213;
  uint64_t v415 = v215;
  swift_retain();
  char v218 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v399, 0xD000000000000016, 0x800000025C428120, v218);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v219 = swift_allocObject();
  *(_OWORD *)(v219 + 16) = v326;
  uint64_t v220 = v219 + v321;
  uint64_t v221 = (uint64_t)v310;
  *uint64_t v310 = 0xD00000000000001BLL;
  *(void *)(v221 + 8) = 0x800000025C424A40;
  swift_storeEnumTagMultiPayload();
  uint64_t v222 = swift_allocObject();
  *(_OWORD *)(v222 + 16) = v317;
  *(void *)(v222 + 32) = swift_initStaticObject();
  unint64_t v327 = v222;
  specialized Array._endMutation()();
  unint64_t v223 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v225 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v225) {
      goto LABEL_59;
    }
  }
  else if (*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_59:
    unint64_t v224 = specialized Set.init(_nonEmptyArrayLiteral:)(v223);
    goto LABEL_62;
  }
  unint64_t v224 = MEMORY[0x263F8EE88];
LABEL_62:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v221, v220, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v220 + *(int *)(v323 + 20)) = v224;
  char v226 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v219, 0xD000000000000016, 0x800000025C428120, v226);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v227 = swift_allocObject();
  *(_OWORD *)(v227 + 16) = v315;
  uint64_t v228 = static MaterialXDataType.float;
  *(void *)(v227 + 32) = 7235949;
  *(void *)(v227 + 40) = 0xE300000000000000;
  *(void *)(v227 + 48) = v228;
  *(_OWORD *)(v227 + 56) = 0u;
  *(_OWORD *)(v227 + 72) = 0u;
  *(unsigned char *)(v227 + 88) = 1;
  *(void *)(v227 + 96) = 7889261;
  *(void *)(v227 + 104) = 0xE300000000000000;
  *(void *)(v227 + 112) = v228;
  *(_OWORD *)(v227 + 120) = 0u;
  *(_OWORD *)(v227 + 136) = 0u;
  *(unsigned char *)(v227 + 152) = 1;
  uint64_t v229 = swift_allocObject();
  *(_OWORD *)(v229 + 16) = v326;
  uint64_t v230 = static MaterialXDataType.lod_clamp;
  *(void *)(v229 + 32) = 7632239;
  *(void *)(v229 + 40) = 0xE300000000000000;
  *(void *)(v229 + 48) = v230;
  *(_OWORD *)(v229 + 56) = 0u;
  *(_OWORD *)(v229 + 72) = 0u;
  *(unsigned char *)(v229 + 88) = 0;
  *(void *)&long long v382 = 0xD000000000000012;
  *((void *)&v382 + 1) = 0x800000025C428140;
  unint64_t v383 = 0xD000000000000012;
  unint64_t v384 = 0x800000025C428140;
  uint64_t v386 = 0;
  uint64_t v385 = 0;
  unint64_t v387 = 0xD000000000000013;
  unint64_t v388 = v325 | 0x8000000000000000;
  uint64_t v390 = 0;
  uint64_t v389 = 0;
  char v391 = 2;
  uint64_t v392 = MEMORY[0x263F8EE78];
  uint64_t v393 = 0;
  uint64_t v395 = 0;
  uint64_t v394 = 0;
  uint64_t v396 = 2;
  uint64_t v397 = v227;
  uint64_t v398 = v229;
  swift_retain_n();
  swift_retain();
  char v231 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v382, 0xD000000000000012, 0x800000025C428140, v231);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v232 = swift_allocObject();
  *(_OWORD *)(v232 + 16) = v326;
  uint64_t v233 = v232 + v321;
  uint64_t v234 = (uint64_t)v311;
  *uint64_t v311 = 0x6D616C635F646F6CLL;
  *(void *)(v234 + 8) = 0xE900000000000070;
  swift_storeEnumTagMultiPayload();
  uint64_t v235 = swift_allocObject();
  *(_OWORD *)(v235 + 16) = v317;
  *(void *)(v235 + 32) = swift_initStaticObject();
  unint64_t v327 = v235;
  specialized Array._endMutation()();
  unint64_t v236 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v238 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v238) {
      goto LABEL_64;
    }
  }
  else if (*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_64:
    unint64_t v237 = specialized Set.init(_nonEmptyArrayLiteral:)(v236);
    goto LABEL_67;
  }
  unint64_t v237 = MEMORY[0x263F8EE88];
LABEL_67:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v234, v233, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v233 + *(int *)(v323 + 20)) = v237;
  char v239 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v232, 0xD000000000000012, 0x800000025C428140, v239);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v240 = swift_allocObject();
  *(_OWORD *)(v240 + 16) = v315;
  if (one-time initialization token for vector2 != -1) {
    swift_once();
  }
  uint64_t v241 = static MaterialXDataType.vector2;
  *(void *)(v240 + 32) = 2019840100;
  *(void *)(v240 + 40) = 0xE400000000000000;
  *(void *)(v240 + 48) = v241;
  *(_OWORD *)(v240 + 56) = 0u;
  *(_OWORD *)(v240 + 72) = 0u;
  *(unsigned char *)(v240 + 88) = 0;
  *(void *)(v240 + 96) = 2036617316;
  *(void *)(v240 + 104) = 0xE400000000000000;
  *(void *)(v240 + 112) = v241;
  *(_OWORD *)(v240 + 120) = 0u;
  *(_OWORD *)(v240 + 136) = 0u;
  *(unsigned char *)(v240 + 152) = 0;
  uint64_t v242 = swift_allocObject();
  *(_OWORD *)(v242 + 16) = v326;
  uint64_t v243 = one-time initialization token for gradient2d;
  swift_retain_n();
  if (v243 != -1) {
    swift_once();
  }
  uint64_t v244 = static MaterialXDataType.gradient2d;
  *(void *)(v242 + 32) = 7632239;
  *(void *)(v242 + 40) = 0xE300000000000000;
  *(void *)(v242 + 48) = v244;
  *(_OWORD *)(v242 + 56) = 0u;
  *(_OWORD *)(v242 + 72) = 0u;
  *(unsigned char *)(v242 + 88) = 0;
  *(void *)&long long v365 = 0xD000000000000013;
  *((void *)&v365 + 1) = 0x800000025C428160;
  unint64_t v366 = 0xD000000000000013;
  unint64_t v367 = 0x800000025C428160;
  uint64_t v369 = 0;
  uint64_t v368 = 0;
  unint64_t v370 = 0xD000000000000013;
  unint64_t v371 = v325 | 0x8000000000000000;
  uint64_t v373 = 0;
  uint64_t v372 = 0;
  char v374 = 2;
  uint64_t v375 = MEMORY[0x263F8EE78];
  uint64_t v376 = 0;
  uint64_t v377 = 0;
  uint64_t v378 = 0;
  uint64_t v379 = 2;
  uint64_t v380 = v240;
  uint64_t v381 = v242;
  swift_retain();
  char v245 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v365, 0xD000000000000013, 0x800000025C428160, v245);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v246 = swift_allocObject();
  *(_OWORD *)(v246 + 16) = v326;
  uint64_t v247 = v246 + v321;
  uint64_t v248 = (uint64_t)v312;
  *uint64_t v312 = 0xD000000000000018;
  *(void *)(v248 + 8) = 0x800000025C424A00;
  swift_storeEnumTagMultiPayload();
  uint64_t v249 = swift_allocObject();
  *(_OWORD *)(v249 + 16) = v317;
  *(void *)(v249 + 32) = swift_initStaticObject();
  unint64_t v327 = v249;
  specialized Array._endMutation()();
  unint64_t v250 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v252 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v252) {
      goto LABEL_73;
    }
  }
  else if (*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_73:
    unint64_t v251 = specialized Set.init(_nonEmptyArrayLiteral:)(v250);
    goto LABEL_76;
  }
  unint64_t v251 = MEMORY[0x263F8EE88];
LABEL_76:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v248, v247, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v247 + *(int *)(v323 + 20)) = v251;
  char v253 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v246, 0xD000000000000013, 0x800000025C428160, v253);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v254 = swift_allocObject();
  *(_OWORD *)(v254 + 16) = v315;
  if (one-time initialization token for vector3 != -1) {
    swift_once();
  }
  uint64_t v255 = static MaterialXDataType.vector3;
  *(void *)(v254 + 32) = 2019840100;
  *(void *)(v254 + 40) = 0xE400000000000000;
  *(void *)(v254 + 48) = v255;
  *(_OWORD *)(v254 + 56) = 0u;
  *(_OWORD *)(v254 + 72) = 0u;
  *(unsigned char *)(v254 + 88) = 0;
  *(void *)(v254 + 96) = 2036617316;
  *(void *)(v254 + 104) = 0xE400000000000000;
  *(void *)(v254 + 112) = v255;
  *(_OWORD *)(v254 + 120) = 0u;
  *(_OWORD *)(v254 + 136) = 0u;
  *(unsigned char *)(v254 + 152) = 0;
  uint64_t v256 = swift_allocObject();
  *(_OWORD *)(v256 + 16) = v326;
  uint64_t v257 = one-time initialization token for gradient3d;
  swift_retain_n();
  if (v257 != -1) {
    swift_once();
  }
  uint64_t v258 = static MaterialXDataType.gradient3d;
  *(void *)(v256 + 32) = 7632239;
  *(void *)(v256 + 40) = 0xE300000000000000;
  *(void *)(v256 + 48) = v258;
  *(_OWORD *)(v256 + 56) = 0u;
  *(_OWORD *)(v256 + 72) = 0u;
  *(unsigned char *)(v256 + 88) = 0;
  *(void *)&long long v348 = 0xD000000000000013;
  *((void *)&v348 + 1) = 0x800000025C428180;
  unint64_t v349 = 0xD000000000000013;
  unint64_t v350 = 0x800000025C428180;
  uint64_t v351 = 0;
  uint64_t v352 = 0;
  unint64_t v353 = 0xD000000000000013;
  unint64_t v354 = v325 | 0x8000000000000000;
  uint64_t v355 = 0;
  uint64_t v356 = 0;
  char v357 = 2;
  uint64_t v358 = MEMORY[0x263F8EE78];
  uint64_t v359 = 0;
  uint64_t v360 = 0;
  uint64_t v361 = 0;
  uint64_t v362 = 2;
  uint64_t v363 = v254;
  uint64_t v364 = v256;
  swift_retain();
  char v259 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v348, 0xD000000000000013, 0x800000025C428180, v259);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v260 = swift_allocObject();
  *(_OWORD *)(v260 + 16) = v326;
  uint64_t v261 = v260 + v321;
  uint64_t v262 = (uint64_t)v313;
  void *v313 = 0xD000000000000018;
  *(void *)(v262 + 8) = 0x800000025C4249E0;
  swift_storeEnumTagMultiPayload();
  uint64_t v263 = swift_allocObject();
  *(_OWORD *)(v263 + 16) = v317;
  *(void *)(v263 + 32) = swift_initStaticObject();
  unint64_t v327 = v263;
  specialized Array._endMutation()();
  unint64_t v264 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v266 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v266) {
      goto LABEL_82;
    }
  }
  else if (*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_82:
    unint64_t v265 = specialized Set.init(_nonEmptyArrayLiteral:)(v264);
    goto LABEL_85;
  }
  unint64_t v265 = MEMORY[0x263F8EE88];
LABEL_85:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v262, v261, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v261 + *(int *)(v323 + 20)) = v265;
  char v267 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v260, 0xD000000000000013, 0x800000025C428180, v267);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  uint64_t v268 = swift_allocObject();
  *(_OWORD *)(v268 + 16) = v315;
  uint64_t v269 = static MaterialXDataType.vector3;
  *(void *)(v268 + 32) = 2019840100;
  *(void *)(v268 + 40) = 0xE400000000000000;
  *(void *)(v268 + 48) = v269;
  *(_OWORD *)(v268 + 56) = 0u;
  *(_OWORD *)(v268 + 72) = 0u;
  *(unsigned char *)(v268 + 88) = 0;
  *(void *)(v268 + 96) = 2036617316;
  *(void *)(v268 + 104) = 0xE400000000000000;
  *(void *)(v268 + 112) = v269;
  *(_OWORD *)(v268 + 120) = 0u;
  *(_OWORD *)(v268 + 136) = 0u;
  *(unsigned char *)(v268 + 152) = 0;
  uint64_t v270 = swift_allocObject();
  *(_OWORD *)(v270 + 16) = v326;
  uint64_t v271 = one-time initialization token for gradientcube;
  swift_retain_n();
  if (v271 != -1) {
    swift_once();
  }
  uint64_t v272 = static MaterialXDataType.gradientcube;
  *(void *)(v270 + 32) = 7632239;
  *(void *)(v270 + 40) = 0xE300000000000000;
  *(void *)(v270 + 48) = v272;
  *(_OWORD *)(v270 + 56) = 0u;
  *(_OWORD *)(v270 + 72) = 0u;
  *(unsigned char *)(v270 + 88) = 0;
  *(void *)&long long v331 = 0xD000000000000015;
  *((void *)&v331 + 1) = 0x800000025C4281A0;
  unint64_t v332 = 0xD000000000000015;
  unint64_t v333 = 0x800000025C4281A0;
  uint64_t v334 = 0;
  uint64_t v335 = 0;
  unint64_t v336 = 0xD000000000000013;
  unint64_t v337 = v325 | 0x8000000000000000;
  uint64_t v338 = 0;
  uint64_t v339 = 0;
  char v340 = 2;
  uint64_t v341 = MEMORY[0x263F8EE78];
  uint64_t v342 = 0;
  uint64_t v343 = 0;
  uint64_t v344 = 0;
  uint64_t v345 = 2;
  uint64_t v346 = v268;
  uint64_t v347 = v270;
  swift_retain();
  char v273 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v328;
  unint64_t v328 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(&v331, 0xD000000000000015, 0x800000025C4281A0, v273);
  unint64_t v328 = v327;
  swift_bridgeObjectRelease();
  uint64_t v274 = swift_allocObject();
  *(_OWORD *)(v274 + 16) = v326;
  uint64_t v275 = v274 + v321;
  uint64_t v276 = (uint64_t)v314;
  void *v314 = 0xD00000000000001ALL;
  *(void *)(v276 + 8) = 0x800000025C4249C0;
  swift_storeEnumTagMultiPayload();
  uint64_t v277 = swift_allocObject();
  *(_OWORD *)(v277 + 16) = v317;
  *(void *)(v277 + 32) = swift_initStaticObject();
  unint64_t v327 = v277;
  specialized Array._endMutation()();
  unint64_t v278 = v327;
  if (v327 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v280 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v280) {
      goto LABEL_89;
    }
LABEL_91:
    unint64_t v279 = MEMORY[0x263F8EE88];
    goto LABEL_92;
  }
  if (!*(void *)((v327 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_91;
  }
LABEL_89:
  unint64_t v279 = specialized Set.init(_nonEmptyArrayLiteral:)(v278);
LABEL_92:
  swift_bridgeObjectRelease();
  outlined init with take of NodeDef.Implementation(v276, v275, type metadata accessor for NodeDef.Implementation.Kind);
  *(void *)(v275 + *(int *)(v323 + 20)) = v279;
  char v281 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v327 = v330;
  unint64_t v330 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v274, 0xD000000000000015, 0x800000025C4281A0, v281);
  unint64_t v330 = v327;
  swift_bridgeObjectRelease();
  NodeDefStore.loadLibrary()();
  if (v282 || (NodeDefStore.applyStandardLibraryFixes()(), v283))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v285 = qword_270996A18;
    unint64_t v286 = off_270996A20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v287 = specialized __RawDictionaryStorage.find<A>(_:)(v285, (uint64_t)v286);
    char v289 = v288;
    swift_bridgeObjectRelease();
    if (v289)
    {
      char v290 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v291 = v330;
      unint64_t v327 = v330;
      unint64_t v330 = 0x8000000000000000;
      if ((v290 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        uint64_t v291 = v327;
      }
      swift_bridgeObjectRelease();
      specialized _NativeDictionary._delete(at:)(v287, v291);
      unint64_t v330 = v291;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v292 = qword_270996A28;
    uint64_t v293 = off_270996A30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v294 = specialized __RawDictionaryStorage.find<A>(_:)(v292, (uint64_t)v293);
    char v296 = v295;
    swift_bridgeObjectRelease();
    if (v296)
    {
      char v297 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v298 = v330;
      unint64_t v327 = v330;
      unint64_t v330 = 0x8000000000000000;
      if ((v297 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        uint64_t v298 = v327;
      }
      swift_bridgeObjectRelease();
      specialized _NativeDictionary._delete(at:)(v294, v298);
      unint64_t v330 = v298;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    uint64_t v299 = qword_270996A38;
    uint64_t v300 = off_270996A40;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v301 = specialized __RawDictionaryStorage.find<A>(_:)(v299, (uint64_t)v300);
    char v303 = v302;
    swift_bridgeObjectRelease();
    if (v303)
    {
      char v304 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v305 = v330;
      unint64_t v327 = v330;
      unint64_t v330 = 0x8000000000000000;
      if ((v304 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        uint64_t v305 = v327;
      }
      swift_bridgeObjectRelease();
      specialized _NativeDictionary._delete(at:)(v301, v305);
      unint64_t v330 = v305;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_arrayDestroy();
    return v328;
  }
}

uint64_t specialized Sequence.contains(where:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator((unint64_t *)&lazy protocol witness table cache variable for type MaterialXTarget and conformance MaterialXTarget, (void (*)(uint64_t))type metadata accessor for MaterialXTarget);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v20;
    uint64_t v19 = v21;
    uint64_t v3 = v22;
    uint64_t v4 = v23;
    unint64_t v5 = v24;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v19 = a1 + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  while (1)
  {
    uint64_t v14 = v4;
    if (v1 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_33;
      }
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v12 = v25;
      swift_unknownObjectRelease();
      if (!v25) {
        goto LABEL_33;
      }
      goto LABEL_10;
    }
    if (!v5) {
      break;
    }
    unint64_t v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_9:
    uint64_t v12 = *(void *)(*(void *)(v1 + 48) + 8 * v11);
    swift_retain();
    if (!v12) {
      goto LABEL_33;
    }
LABEL_10:
    char v13 = MaterialXTarget.conformsTo(_:)(v12);
    uint64_t result = swift_release();
    if (v13)
    {
      uint64_t v18 = 1;
      goto LABEL_34;
    }
  }
  int64_t v15 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v15 >= v9) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v19 + 8 * v15);
    ++v4;
    if (!v16)
    {
      uint64_t v4 = v14 + 2;
      if (v14 + 2 >= v9) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v19 + 8 * v4);
      if (!v16)
      {
        uint64_t v4 = v14 + 3;
        if (v14 + 3 >= v9) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v19 + 8 * v4);
        if (!v16)
        {
          uint64_t v4 = v14 + 4;
          if (v14 + 4 >= v9) {
            goto LABEL_33;
          }
          unint64_t v16 = *(void *)(v19 + 8 * v4);
          if (!v16)
          {
            uint64_t v4 = v14 + 5;
            if (v14 + 5 >= v9) {
              goto LABEL_33;
            }
            unint64_t v16 = *(void *)(v19 + 8 * v4);
            if (!v16)
            {
              uint64_t v17 = v14 + 6;
              while (v9 != v17)
              {
                unint64_t v16 = *(void *)(v19 + 8 * v17++);
                if (v16)
                {
                  uint64_t v4 = v17 - 1;
                  goto LABEL_28;
                }
              }
LABEL_33:
              uint64_t v18 = 0;
LABEL_34:
              outlined consume of [String : InputSpec].Iterator._Variant();
              return v18;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v4 << 6);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t specialized static NodeDefStore.inferLibraryFunctionName(forNodeDefName:)(uint64_t a1, void *a2)
{
  v4._uint64_t countAndFlagsBits = 6243406;
  v4._id object = (void *)0xE300000000000000;
  if (!String.hasPrefix(_:)(v4)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  Swift::String_optional v5 = String.Iterator.next()();
  if (v5.value._object)
  {
    uint64_t countAndFlagsBits = v5.value._countAndFlagsBits;
    id object = v5.value._object;
    do
    {
      if (countAndFlagsBits == 95 && object == (void *)0xE100000000000000
        || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        MEMORY[0x261183F40](countAndFlagsBits, object);
      }
      swift_bridgeObjectRelease();
      Swift::String_optional v8 = String.Iterator.next()();
      uint64_t countAndFlagsBits = v8.value._countAndFlagsBits;
      id object = v8.value._object;
    }
    while (v8.value._object);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = String.count.getter();
  swift_bridgeObjectRelease();
  if (v9 >= 2)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_11:
    v10._uint64_t countAndFlagsBits = a1;
    v10._id object = a2;
    String.append(_:)(v10);
    return 0x3A3A786C746DLL;
  }
  return a1;
}

unint64_t lazy protocol witness table accessor for type NodeDefStore.Errors and conformance NodeDefStore.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors;
  if (!lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors;
  if (!lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeDefStore.Errors and conformance NodeDefStore.Errors);
  }
  return result;
}

uint64_t partial apply for closure #2 in NodeDefStore.applyStandardLibraryFixes()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return closure #2 in NodeDefStore.applyStandardLibraryFixes()(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t destroy for NodeDefStore()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for NodeDefStore(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NodeDefStore(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NodeDefStore(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NodeDefStore()
{
  return &type metadata for NodeDefStore;
}

unsigned char *storeEnumTagSinglePayload for NodeDefStore.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25C40AEE0);
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

ValueMetadata *type metadata accessor for NodeDefStore.Errors()
{
  return &type metadata for NodeDefStore.Errors;
}

uint64_t outlined init with copy of NodeDef.Implementation(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of NodeDef.Implementation(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t lazy protocol witness table accessor for type NSFastEnumerationIterator and conformance NSFastEnumerationIterator(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C40B030()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

Swift::Void __swiftcall OrderedSet._ensureUnique()()
{
  if (*v0 && (swift_isUniquelyReferenced_native() & 1) == 0)
  {
    if (*v0)
    {
      uint64_t v1 = _HashTable.copy()((void *)*v0);
      swift_release();
      uint64_t *v0 = v1;
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall OrderedSet._regenerateExistingHashTable()()
{
  if (*v1)
  {
    uint64_t v2 = v0;
    OrderedSet._ensureUnique()();
    uint64_t v3 = *v1;
    if (*v1)
    {
      uint64_t v5 = *(void *)(v2 + 16);
      uint64_t v4 = *(void *)(v2 + 24);
      swift_retain();
      closure #1 in OrderedSet._regenerateExistingHashTable()((void *)(v3 + 16), v3 + 32, (uint64_t)v1, v5, v4);
      swift_release();
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall OrderedSet._regenerateHashTable()()
{
  uint64_t v1 = *v0;
  if (*v0)
  {
    swift_beginAccess();
    Swift::Int v2 = *(void *)(v1 + 24) & 0x3FLL;
  }
  else
  {
    Swift::Int v2 = 0;
  }
  if (ContiguousArray.count.getter() <= 15 && v2 == 0)
  {
    swift_release();
    uint64_t *v0 = 0;
  }
  else
  {
    int64_t v4 = ContiguousArray.count.getter();
    Swift::Int v5 = specialized static _HashTable.scale(forCapacity:)(v4);
    OrderedSet._regenerateHashTable(scale:reservedScale:)(v5, v2);
  }
}

uint64_t OrderedSet._table.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t OrderedSet.init(_uniqueElements:_:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OrderedSet.elements.getter()
{
  return Array.init<A>(_:)();
}

uint64_t OrderedSet._find(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (index: Int?, bucket: _HashTable.Bucket));
  ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  return v1;
}

uint64_t OrderedSet._bucket(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return 0;
  }
  unsigned int v6 = (void *)(a2 + 16);
  uint64_t v7 = a2 + 32;
  swift_retain();
  closure #1 in OrderedSet._bucket(for:)(v6, v7, a1, a4, &v9);
  swift_release();
  return v9;
}

void OrderedSet._removeExistingMember(at:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v4 = v3;
  uint64_t v8 = *(void *)(a3 + 16);
  swift_retain();
  uint64_t v9 = ContiguousArray.count.getter();
  swift_release();
  uint64_t v10 = v9 - 1;
  if (__OFSUB__(v9, 1))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v11 = *v3;
  uint64_t v12 = *(void *)(a3 + 24);
  if (v10 >= OrderedSet._minimumCapacity.getter(*v4))
  {
    if (!v11)
    {
LABEL_9:
      type metadata accessor for ContiguousArray();
      ContiguousArray.remove(at:)();
      return;
    }
    OrderedSet._ensureUnique()();
    uint64_t v13 = *v4;
    if (*v4)
    {
      swift_retain();
      closure #1 in OrderedSet._removeExistingMember(at:in:)((uint64_t *)(v13 + 16), v13 + 32, a2, (uint64_t)v4, a1, v8, v12);
      swift_release();
      goto LABEL_9;
    }
LABEL_11:
    __break(1u);
    return;
  }
  type metadata accessor for ContiguousArray();
  ContiguousArray.remove(at:)();
  OrderedSet._regenerateHashTable()();
}

uint64_t OrderedSet._minimumCapacity.getter(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    Swift::Int v2 = (void *)(result + 16);
    swift_beginAccess();
    unsigned int v3 = *(_DWORD *)(v1 + 16);
    swift_beginAccess();
    if (((*(_DWORD *)(v1 + 24) ^ v3) & 0x3FLL) != 0)
    {
      swift_beginAccess();
      uint64_t result = 0;
      unint64_t v4 = *v2 & 0x3FLL;
      if (v4 >= 5)
      {
        double v5 = (double)(1 << v4) * 0.25;
        if ((~*(void *)&v5 & 0x7FF0000000000000) != 0)
        {
          if (v5 > -9.22337204e18)
          {
            if (v5 < 9.22337204e18) {
              return (uint64_t)v5;
            }
            goto LABEL_12;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
LABEL_12:
        __break(1u);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t OrderedSet._find_inlined(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (index: Int?, bucket: _HashTable.Bucket));
  ContiguousArray.withUnsafeBufferPointer<A>(_:)();
  return v1;
}

uint64_t OrderedSet._scale.getter(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    swift_beginAccess();
    return *(void *)(v1 + 16) & 0x3FLL;
  }
  return result;
}

uint64_t OrderedSet._reservedScale.getter(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    swift_beginAccess();
    return *(void *)(v1 + 24) & 0x3FLL;
  }
  return result;
}

Swift::Void __swiftcall OrderedSet._regenerateHashTable(scale:reservedScale:)(Swift::Int scale, Swift::Int reservedScale)
{
  uint64_t v4 = v2;
  uint64_t v10 = v3[1];
  if (reservedScale <= scale) {
    Swift::Int v6 = scale;
  }
  else {
    Swift::Int v6 = reservedScale;
  }
  uint64_t v7 = type metadata accessor for ContiguousArray();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v9 = static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)((uint64_t)&v10, v6, 0, reservedScale, v7, WitnessTable, *(void *)(v4 + 24));
  swift_release();
  uint64_t *v3 = v9;
}

uint64_t OrderedSet.lastIndex(of:)()
{
  return OrderedSet._find(_:)();
}

Swift::Int OrderedSet._extractSubset(using:extraCapacity:)(uint64_t *a1, uint64_t a2, uint64_t a3, Swift::Int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v17)
  {
    uint64_t v22 = OrderedSet.init(minimumCapacity:persistent:)(a4, 0);
    swift_release();
    swift_release();
    return v22;
  }
  uint64_t v31 = a5;
  if (ContiguousArray.count.getter() == a3)
  {
    uint64_t v18 = v31;
    uint64_t v19 = OrderedSet._capacity.getter(v31);
    Swift::Int result = ContiguousArray.count.getter();
    if (__OFSUB__(v19, result)) {
      goto LABEL_29;
    }
    if (v19 - result < a4)
    {
      uint64_t v32 = v18;
      uint64_t v33 = a6;
      swift_retain();
      swift_retain();
      Swift::Int result = ContiguousArray.count.getter();
      Swift::Int v21 = result + a4;
      if (__OFADD__(result, a4)) {
        goto LABEL_31;
      }
      type metadata accessor for OrderedSet();
      OrderedSet.reserveCapacity(_:)(v21);
      swift_release();
LABEL_25:
      swift_release();
      return v32;
    }
    return v18;
  }
  Swift::Int result = a3 + a4;
  if (__OFADD__(a3, a4)) {
    goto LABEL_30;
  }
  Swift::Int result = OrderedSet.init(minimumCapacity:persistent:)(result, 0);
  uint64_t v32 = result;
  uint64_t v33 = v23;
  if (a2 < 1) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = *a1;
  }
  uint64_t v25 = 0;
  for (i = (uint64_t (**)(char *, uint64_t))(v14 + 8); ; Swift::Int result = (*i)(v16, a7))
  {
    if (v24)
    {
      v24 &= v24 - 1;
      goto LABEL_14;
    }
    uint64_t v28 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      goto LABEL_28;
    }
    if (v28 >= a2)
    {
LABEL_24:
      swift_release();
      goto LABEL_25;
    }
    uint64_t v29 = a1[v28];
    if (!v29) {
      break;
    }
    ++v25;
LABEL_23:
    uint64_t v24 = (v29 - 1) & v29;
LABEL_14:
    ContiguousArray.subscript.getter();
    uint64_t v27 = type metadata accessor for OrderedSet();
    OrderedSet._appendNew(_:)((uint64_t)v16, v27);
  }
  while (1)
  {
    uint64_t v25 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v25 >= a2) {
      goto LABEL_24;
    }
    uint64_t v29 = a1[v25];
    ++v28;
    if (v29) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t OrderedSet.__storage.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*OrderedSet.__storage.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t OrderedSet._elements.getter()
{
  return swift_retain();
}

uint64_t OrderedSet._elements.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*OrderedSet._elements.modify())()
{
  return destructiveProjectEnumData for NodePersonality.ShaderType;
}

uint64_t (*OrderedSet._table.modify(void *a1))(uint64_t *a1, char a2)
{
  *a1 = *v1;
  a1[1] = v1;
  swift_retain();
  return OrderedSet._table.modify;
}

uint64_t OrderedSet._table.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  unsigned int v3 = (void *)a1[1];
  if (a2)
  {
    swift_retain();
    swift_release();
    void *v3 = v2;
    return swift_release();
  }
  else
  {
    uint64_t result = swift_release();
    void *v3 = v2;
  }
  return result;
}

uint64_t key path setter for OrderedSet.elements : <A>OrderedSet<A>()
{
  uint64_t v0 = type metadata accessor for OrderedSet();
  uint64_t v1 = swift_bridgeObjectRetain();
  return OrderedSet.elements.setter(v1, v0);
}

uint64_t OrderedSet.elements.setter(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v11 = a1;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = type metadata accessor for Array();
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = OrderedSet.init<A>(_:)((uint64_t)&v11, v5, v6, v7, WitnessTable);
  uint64_t *v2 = result;
  v2[1] = v10;
  return result;
}

void (*OrderedSet.elements.modify(void *a1, uint64_t a2))(uint64_t **a1)
{
  uint64_t v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[2] = a2;
  v5[3] = v2;
  v5[1] = *(void *)(v2 + 8);
  v5[4] = *(void *)(a2 + 16);
  type metadata accessor for ContiguousArray();
  swift_retain();
  swift_getWitnessTable();
  *uint64_t v5 = Array.init<A>(_:)();
  static Array._allocateUninitialized(_:)();
  uint64_t v6 = ContiguousArray.init(arrayLiteral:)();
  swift_release();
  *(void *)(v2 + 8) = v6;
  return OrderedSet.elements.modify;
}

void OrderedSet.elements.modify(uint64_t **a1)
{
  uint64_t v1 = *a1;
  $defer #1 <A>() in OrderedSet.elements.modify((uint64_t *)(*a1)[3], v1, v1[4], *(void *)(v1[2] + 24));
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t $defer #1 <A>() in OrderedSet.elements.modify(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *a2;
  uint64_t v7 = type metadata accessor for Array();
  swift_bridgeObjectRetain();
  uint64_t WitnessTable = swift_getWitnessTable();
  *a1 = OrderedSet.init<A>(_:)((uint64_t)&v11, a3, v7, a4, WitnessTable);
  a1[1] = v9;
  swift_release();
  return swift_release();
}

uint64_t OrderedSet._capacity.getter(uint64_t a1)
{
  if (!a1) {
    return 15;
  }
  uint64_t result = swift_beginAccess();
  unint64_t v3 = *(void *)(a1 + 16) & 0x3FLL;
  if (v3 < 5) {
    return 15;
  }
  double v4 = (double)(1 << v3) * 0.75;
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v4 < 9.22337204e18) {
    return (uint64_t)v4;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t OrderedSet._bias.getter(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    swift_beginAccess();
    return *(uint64_t *)(v1 + 24) >> 6;
  }
  return result;
}

uint64_t closure #1 in OrderedSet._regenerateExistingHashTable()(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _HashTable.UnsafeHandle.clear()();
  uint64_t v12 = *(void *)(a3 + 8);
  uint64_t v9 = type metadata accessor for ContiguousArray();
  uint64_t WitnessTable = swift_getWitnessTable();
  return _HashTable.UnsafeHandle.fill<A>(uncheckedUniqueElements:)((uint64_t)&v12, a1, a2, v9, WitnessTable, a5);
}

Swift::Bool __swiftcall OrderedSet._isUnique()()
{
  return swift_isUniquelyReferenced_native();
}

uint64_t closure #1 in OrderedSet._find_inlined(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  if (a3)
  {
    uint64_t v9 = (void *)(a3 + 16);
    uint64_t v10 = a3 + 32;
    v16[0] = a1;
    v16[1] = a2;
    uint64_t v11 = type metadata accessor for UnsafeBufferPointer();
    swift_retain();
    uint64_t WitnessTable = swift_getWitnessTable();
    *(void *)a6 = _HashTable.UnsafeHandle._find<A>(_:in:)(a4, (uint64_t)v16, v9, v10, v11, WitnessTable, a5);
    *(unsigned char *)(a6 + 8) = v13 & 1;
    *(void *)(a6 + 16) = v14;
    return swift_release();
  }
  else
  {
    type metadata accessor for UnsafeBufferPointer();
    swift_getWitnessTable();
    uint64_t result = Collection<>.firstIndex(of:)();
    *(void *)(a6 + 16) = 0;
  }
  return result;
}

void closure #1 in OrderedSet._bucket(for:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v10 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContiguousArray.subscript.getter();
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = 1 << *a1;
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    uint64_t v32 = a5;
    uint64_t v17 = v16 & v13;
    uint64_t v18 = _HashTable.UnsafeHandle._startIterator(bucket:)(v16 & v13, a1, a2);
    uint64_t v25 = a1;
    uint64_t v26 = a2;
    uint64_t v27 = v17;
    uint64_t v28 = v18;
    uint64_t v29 = v19;
    uint64_t v30 = v20;
    char v31 = 0;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, a4);
    if (v18)
    {
      while (1)
      {
        uint64_t v21 = -1 << *v25;
        unint64_t v22 = (v21 ^ ~v18) + ((uint64_t)v25[1] >> 6);
        uint64_t v23 = v22 >= ~v21 ? ~v21 : 0;
        if (v22 - v23 == a3) {
          break;
        }
        _HashTable.BucketIterator.advance()();
        uint64_t v18 = v28;
        if (!v28) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      __break(1u);
    }
    *uint64_t v32 = v27;
  }
}

void closure #1 in OrderedSet._removeExistingMember(at:in:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v14[2] = a6;
  void v14[3] = a7;
  v14[4] = a4;
  _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)(a3, (uint64_t (*)(unint64_t, uint64_t))partial apply for closure #1 in closure #1 in OrderedSet._removeExistingMember(at:in:), (uint64_t)v14, a1, a2);
  uint64_t v16 = *(void *)(a4 + 8);
  if (__OFADD__(a5, 1))
  {
    __break(1u);
  }
  else if (a5 + 1 >= a5)
  {
    v15[0] = a5;
    v15[1] = a5 + 1;
    uint64_t v12 = type metadata accessor for ContiguousArray();
    uint64_t WitnessTable = swift_getWitnessTable();
    _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)((uint64_t)v15, (uint64_t)&v16, a1, a2, v12, WitnessTable, a7);
    return;
  }
  __break(1u);
}

uint64_t closure #1 in closure #1 in OrderedSet._removeExistingMember(at:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  ContiguousArray.subscript.getter();
  uint64_t v8 = dispatch thunk of Hashable._rawHashValue(seed:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a4);
  return v8;
}

uint64_t _s11ShaderGraph10OrderedSetV13_find_inlinedySiSg5index_AA10_HashTableV6BucketV6buckettxFAeF_AjKtSRyxGXEfU_TA_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return partial apply for closure #1 in OrderedSet._find_inlined(_:)(a1, a2, a3);
}

uint64_t type metadata accessor for OrderedSet()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25C40C5F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_25C40C5FC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  uint64_t result = swift_release();
  *a2 = v3;
  return result;
}

uint64_t sub_25C40C640()
{
  return 16;
}

__n128 sub_25C40C64C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_25C40C658@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = OrderedSet.elements.getter();
  *a1 = result;
  return result;
}

uint64_t sub_25C40C690()
{
  return 16;
}

__n128 sub_25C40C69C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in OrderedSet._removeExistingMember(at:in:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in closure #1 in OrderedSet._removeExistingMember(at:in:)(a1, a2, *(void *)(v2 + 32), *(void *)(v2 + 16));
}

uint64_t OrderedSet.append<A>(contentsOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a2;
  uint64_t v25 = a1;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v22 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v17 = (char *)&v21 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v25, a3);
  dispatch thunk of Sequence.makeIterator()();
  swift_getAssociatedConformanceWitness();
  uint64_t v24 = v17;
  uint64_t v25 = AssociatedTypeWitness;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v18(v11, 1, v4) != 1)
  {
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    do
    {
      v19(v7, v11, v4);
      OrderedSet._append(_:)((uint64_t)v7);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      dispatch thunk of IteratorProtocol.next()();
    }
    while (v18(v11, 1, v4) != 1);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v25);
}

void OrderedSet._appendNew(_:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v6 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ContiguousArray();
  ContiguousArray.append(_:)();
  swift_retain();
  uint64_t v7 = ContiguousArray.count.getter();
  swift_release();
  uint64_t v8 = *v2;
  if (OrderedSet._capacity.getter(v8) >= v7)
  {
    if (v8)
    {
      OrderedSet._ensureUnique()();
      uint64_t v9 = *v3;
      if (*v3)
      {
        swift_retain();
        closure #1 in OrderedSet._appendNew(_:in:)((void *)(v9 + 16), v9 + 32, a2);
        swift_release();
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    OrderedSet._regenerateHashTable()();
  }
}

uint64_t OrderedSet.insert(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OrderedSet._find(_:)();
  char v8 = v7;
  if (v7) {
    OrderedSet._insertNew(_:at:in:)(a1, a2, v6, a3);
  }
  return v8 & 1;
}

void OrderedSet._insertNew(_:at:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v16 = a3;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  uint64_t v11 = ContiguousArray.count.getter();
  swift_release();
  uint64_t v12 = *v4;
  uint64_t v13 = *(void *)(a4 + 24);
  if (v11 >= OrderedSet._capacity.getter(v12))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
    type metadata accessor for ContiguousArray();
    ContiguousArray.insert(_:at:)();
    OrderedSet._regenerateHashTable()();
  }
  else
  {
    uint64_t v14 = v18;
    if (!v12)
    {
LABEL_5:
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v17, v7);
      type metadata accessor for ContiguousArray();
      ContiguousArray.insert(_:at:)();
      return;
    }
    OrderedSet._ensureUnique()();
    uint64_t v15 = *v5;
    if (*v5)
    {
      swift_retain();
      closure #1 in OrderedSet._insertNew(_:at:in:)((void *)(v15 + 16), v15 + 32, v16, v14, (uint64_t)v5, v7, v13);
      swift_release();
      goto LABEL_5;
    }
    __break(1u);
  }
}

void OrderedSet._appendNew(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a2 + 16);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  type metadata accessor for ContiguousArray();
  ContiguousArray.append(_:)();
  swift_retain();
  uint64_t v8 = ContiguousArray.count.getter();
  swift_release();
  uint64_t v9 = *v2;
  if (OrderedSet._capacity.getter(v9) >= v8)
  {
    if (v9)
    {
      OrderedSet._ensureUnique()();
      uint64_t v10 = *v3;
      if (*v3)
      {
        swift_retain();
        closure #1 in OrderedSet._appendNew(_:)((void *)(v10 + 16), v10 + 32);
        swift_release();
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    OrderedSet._regenerateHashTable()();
  }
}

uint64_t OrderedSet._append(_:)(uint64_t a1)
{
  OrderedSet._find(_:)();
  char v4 = v3;
  if (v3) {
    OrderedSet._appendNew(_:in:)(a1, v2);
  }
  return v4 & 1;
}

uint64_t closure #1 in OrderedSet._appendNew(_:)(void *a1, uint64_t a2)
{
  uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v5 = 1 << *a1;
  BOOL v6 = __OFSUB__(v5, 1);
  uint64_t v7 = v5 - 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    if (_HashTable.UnsafeHandle._startIterator(bucket:)(v7 & result, a1, a2))
    {
      while (1)
        _HashTable.BucketIterator.advance()();
    }
    swift_retain();
    uint64_t v8 = ContiguousArray.count.getter();
    swift_release();
    uint64_t result = v8 - 1;
    if (!__OFSUB__(v8, 1)) {
      return _HashTable.BucketIterator.currentValue.setter(result, 0);
    }
  }
  __break(1u);
  return result;
}

unint64_t closure #1 in OrderedSet._appendNew(_:in:)(void *a1, uint64_t a2, uint64_t a3)
{
  swift_retain();
  uint64_t v6 = ContiguousArray.count.getter();
  unint64_t result = swift_release();
  if (__OFSUB__(v6, 1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v6 - 1 - ((uint64_t)a1[1] >> 6);
    return _HashTable.UnsafeHandle.subscript.setter((-1 << *a1) ^ ~(((v8 >> 63) & ~(-1 << *a1)) + v8), a3, a1, a2);
  }
  return result;
}

unint64_t closure #1 in OrderedSet._insertNew(_:at:in:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = *(void (**)(char *, uint64_t))(a5 + 8);
  uint64_t v12 = type metadata accessor for ContiguousArray();
  uint64_t WitnessTable = swift_getWitnessTable();
  _HashTable.UnsafeHandle.adjustContents<A>(preparingForInsertionOfElementAtOffset:in:)(a4, &v15, a1, a2, v12, WitnessTable, a7);
  return _HashTable.UnsafeHandle.subscript.setter((-1 << *a1) ^ ~((((a4 - ((uint64_t)a1[1] >> 6)) >> 63) & ~(-1 << *a1)) + a4 - ((uint64_t)a1[1] >> 6)), a3, a1, a2);
}

uint64_t OrderedSet.update(_:at:)(uint64_t a1, Swift::Int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)(v3 + 8);
  ContiguousArray.subscript.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  char v11 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v11)
  {
    uint64_t v13 = type metadata accessor for ContiguousArray();
    ContiguousArray._makeMutableAndUnique()();
    uint64_t v14 = *v10;
    ContiguousArray._checkSubscript_mutating(_:)(a2);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 24))(v14+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * a2, a1, v6);
    return destructiveProjectEnumData for NodePersonality.ShaderType(v13);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t OrderedSet.updateOrAppend(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (OrderedSet._append(_:)(a1))
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 56);
    uint64_t v9 = a3;
    uint64_t v10 = 1;
  }
  else
  {
    Swift::Int v11 = v7;
    uint64_t v12 = *(void *)(a2 + 16);
    ContiguousArray.subscript.getter();
    uint64_t v13 = type metadata accessor for ContiguousArray();
    ContiguousArray._makeMutableAndUnique()();
    uint64_t v14 = *(void *)(v3 + 8);
    ContiguousArray._checkSubscript_mutating(_:)(v11);
    uint64_t v16 = *(void *)(v12 - 8);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 24))(v14+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(void *)(v16 + 72) * v11, a1, v12);
    destructiveProjectEnumData for NodePersonality.ShaderType(v13);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 56);
    uint64_t v9 = a3;
    uint64_t v10 = 0;
  }
  return v8(v9, v10, 1);
}

uint64_t OrderedSet.updateOrInsert(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (uint64_t *)(v4 + 8);
  uint64_t v9 = *(void *)(a4 + 16);
  swift_retain();
  swift_retain();
  uint64_t v19 = a2;
  Swift::Int v10 = OrderedSet._find(_:)();
  LOBYTE(a2) = v11;
  uint64_t v13 = v12;
  swift_release();
  swift_release();
  if (a2)
  {
    OrderedSet._insertNew(_:at:in:)(v19, a3, v13, a4);
    uint64_t v16 = *(void *)(v9 - 8);
    uint64_t v17 = 1;
  }
  else
  {
    ContiguousArray.subscript.getter();
    uint64_t v14 = type metadata accessor for ContiguousArray();
    ContiguousArray._makeMutableAndUnique()();
    uint64_t v15 = *v8;
    ContiguousArray._checkSubscript_mutating(_:)(v10);
    uint64_t v16 = *(void *)(v9 - 8);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 24))(v15+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(void *)(v16 + 72) * v10, v19, v9);
    destructiveProjectEnumData for NodePersonality.ShaderType(v14);
    uint64_t v17 = 0;
    a3 = v10;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a1, v17, 1, v9);
  return a3;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
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

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  _OWORD v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x263F8E628], MEMORY[0x263F8D310], v2, (uint64_t)&v8);
  if (v9) {
    uint64_t v3 = v8;
  }
  else {
    uint64_t v3 = 0x3E6C696E3CLL;
  }
  if (v9) {
    unint64_t v4 = v9;
  }
  else {
    unint64_t v4 = 0xE500000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = String.init<A>(describing:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)(a1, a2);
}

uint64_t String.camelCaseToCapitalized.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1;
  uint64_t v22 = a2;
  v20[6] = 0x295D5A2D415B28;
  v20[7] = 0xE700000000000000;
  v20[4] = 3220512;
  v20[5] = 0xE300000000000000;
  v20[2] = a1;
  v20[3] = a2;
  v20[0] = a1;
  v20[1] = a2;
  uint64_t v11 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.range<A>(of:options:range:locale:)();
  outlined destroy of Locale?((uint64_t)v10);
  uint64_t v12 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v21 = v12;
  uint64_t v22 = v14;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v15 = StringProtocol.trimmingCharacters(in:)();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t v21 = v15;
  uint64_t v22 = v17;
  uint64_t v18 = StringProtocol.capitalized.getter();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t UserGraphCompiler.CompileContext.setSource(_:for:)(uint64_t a1, uint64_t a2)
{
  long long v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *(void *)(v2 + 192);
  *(void *)(v2 + 192) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a1, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 192) = v7;
  swift_release();
  swift_bridgeObjectRelease();
  return outlined release of String((uint64_t)&v8);
}

{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  long long v8;

  long long v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *(void *)(v2 + 184);
  *(void *)(v2 + 184) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a1, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 184) = v7;
  swift_release();
  swift_bridgeObjectRelease();
  return outlined release of String((uint64_t)&v8);
}

uint64_t UserGraphCompiler.CompileContext.setOutput(_:for:)(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  long long v6 = *(_OWORD *)(a2 + 3);
  char v7 = *((unsigned char *)a2 + 40);
  uint64_t v43 = v5;
  if (*(void *)(v5 + 16) == 1)
  {
    uint64_t v8 = *(void *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 40);
    uint64_t v10 = *(void *)(v5 + 48);
    uint64_t v11 = *(void *)(v5 + 56);
    uint64_t v12 = *(void *)(v5 + 64);
    char v13 = *(unsigned char *)(v5 + 72);
    uint64_t v14 = *(void *)(v5 + 80);
    v44[0] = v8;
    v44[1] = v9;
    v44[2] = v10;
    v44[3] = v11;
    v44[4] = v12;
    char v45 = v13;
    uint64_t v46 = v14;
    uint64_t v15 = a1[3];
    uint64_t v16 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v15);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 24);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v18 = v17(v15, v16);
    swift_retain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&v39[0] = *(void *)(v2 + 192);
    *(void *)(v2 + 192) = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v18, (uint64_t)v44, isUniquelyReferenced_nonNull_native);
    *(void *)(v2 + 192) = *(void *)&v39[0];
    swift_bridgeObjectRelease_n();
    swift_release_n();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v36[0] = v3;
    v36[1] = v4;
    v36[2] = v5;
    long long v37 = v6;
    char v38 = v7 & 1;
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi30_((uint64_t)v36);
    *(void *)&v39[0] = 0;
    *((void *)&v39[0] + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease();
    *(void *)&v39[0] = 0xD000000000000027;
    *((void *)&v39[0] + 1) = 0x800000025C428260;
    v22._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    v23._uint64_t countAndFlagsBits = 1701080942;
    v23._id object = (void *)0xE400000000000000;
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    v24._uint64_t countAndFlagsBits = 41;
    v24._id object = (void *)0xE100000000000000;
    String.append(_:)(v24);
    long long v25 = v39[0];
    outlined init with take of UserGraphError.ErrorType((uint64_t)v36, (uint64_t)v39);
    long long v40 = v25;
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    swift_allocError();
    *uint64_t v26 = v39[0];
    long long v27 = v39[4];
    long long v29 = v39[1];
    long long v28 = v39[2];
    v26[3] = v39[3];
    v26[4] = v27;
    v26[1] = v29;
    v26[2] = v28;
    long long v30 = v39[8];
    long long v32 = v39[5];
    long long v31 = v39[6];
    v26[7] = v39[7];
    v26[8] = v30;
    v26[5] = v32;
    v26[6] = v31;
    long long v33 = v40;
    long long v35 = v39[9];
    long long v34 = v39[10];
    v26[11] = v39[11];
    v26[12] = v33;
    v26[9] = v35;
    v26[10] = v34;
    outlined init with take of NodePersonality(a2, &v42);
    uint64_t v41 = a2[1];
    outlined retain of NodePersonality(&v42);
    outlined retain of [Input]((uint64_t)&v41);
    outlined retain of [Input]((uint64_t)&v43);
    return swift_willThrow();
  }
}

Swift::Void __swiftcall UserGraphCompiler.CompileContext.setSource(_:for:)(ShaderGraph::ShaderGraphNode::ID _, ShaderGraph::FunctionNodeID a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *(void *)(v2 + 176);
  *(void *)(v2 + 176) = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2.value, _.value, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + 176) = v6;
  swift_bridgeObjectRelease();
}

double UserGraphCompiler.CompileContext.compiledNode(for:in:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(v3 + 184);
  if (*(void *)(v5 + 16))
  {
    long long v12 = *(_OWORD *)(a1 + 16);
    swift_retain();
    outlined retain of String((uint64_t)&v12);
    unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(v5 + 56) + 8 * v8);
      swift_release();
      outlined release of String((uint64_t)&v12);
      (*(void (**)(uint64_t))(*(void *)a2 + 272))(v10);
      return result;
    }
    swift_release();
    outlined release of String((uint64_t)&v12);
  }
  *(void *)(a3 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

{
  uint64_t v3;
  uint64_t v5;
  unint64_t v8;
  char v9;
  uint64_t v10;
  double result;
  long long v12;

  uint64_t v5 = *(void *)(v3 + 192);
  if (*(void *)(v5 + 16))
  {
    long long v12 = *(_OWORD *)(a1 + 16);
    swift_retain();
    outlined retain of String((uint64_t)&v12);
    unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    if (v9)
    {
      uint64_t v10 = *(void *)(*(void *)(v5 + 56) + 8 * v8);
      swift_release();
      outlined release of String((uint64_t)&v12);
      (*(void (**)(uint64_t))(*(void *)a2 + 272))(v10);
      return result;
    }
    swift_release();
    outlined release of String((uint64_t)&v12);
  }
  *(void *)(a3 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  return result;
}

uint64_t UserGraphCompiler.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  _s11ShaderGraph04UserB8CompilerC14CompileContextVSgWOi0_((uint64_t)v2);
  outlined init with take of MetalFunctionNode?((uint64_t)v2, v0 + 16, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  return v0;
}

uint64_t UserGraphCompiler.CompileContext.compiledNodeID(for:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 192);
  if (!*(void *)(v2 + 16)) {
    return 0;
  }
  long long v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  if (v5) {
    uint64_t v6 = *(void *)(*(void *)(v2 + 56) + 8 * v4);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_release();
  outlined release of String((uint64_t)&v8);
  return v6;
}

{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  long long v8;

  uint64_t v2 = *(void *)(v1 + 184);
  if (!*(void *)(v2 + 16)) {
    return 0;
  }
  long long v8 = *(_OWORD *)(a1 + 16);
  swift_retain();
  outlined retain of String((uint64_t)&v8);
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  if (v5) {
    uint64_t v6 = *(void *)(*(void *)(v2 + 56) + 8 * v4);
  }
  else {
    uint64_t v6 = 0;
  }
  swift_release();
  outlined release of String((uint64_t)&v8);
  return v6;
}

{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;

  uint64_t v2 = *(void *)(v1 + 176);
  if (*(void *)(v2 + 16)
    && (uint64_t v3 = specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(a1 + 24)), (v4 & 1) != 0))
  {
    return *(void *)(*(void *)(v2 + 56) + 8 * v3);
  }
  else
  {
    return 0;
  }
}

uint64_t key path setter for UserGraphCompiler.context : UserGraphCompiler(uint64_t a1, uint64_t a2)
{
  outlined init with take of MetalFunctionNode?(a1, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  uint64_t v3 = *(uint64_t (**)(void *))(**(void **)a2 + 96);
  outlined retain of UserGraphCompiler.CompileContext?(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of UserGraphCompiler.CompileContext?);
  return v3(v5);
}

uint64_t UserGraphCompiler.context.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  outlined init with take of MetalFunctionNode?(v1 + 16, (uint64_t)v4, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined retain of UserGraphCompiler.CompileContext?(v4, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined copy of UserGraphCompiler.CompileContext?);
  return outlined init with take of MetalFunctionNode?((uint64_t)v4, a1, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
}

void *UserGraphCompiler.context.setter(uint64_t a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  outlined init with take of MetalFunctionNode?(v3, (uint64_t)v5, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined init with take of MetalFunctionNode?(a1, v3, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  return outlined retain of UserGraphCompiler.CompileContext?(v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of UserGraphCompiler.CompileContext?);
}

uint64_t (*UserGraphCompiler.context.modify())()
{
  return XMLParserDelegate.StringNode.children.modify;
}

uint64_t UserGraphCompiler.init()()
{
  _s11ShaderGraph04UserB8CompilerC14CompileContextVSgWOi0_((uint64_t)v2);
  outlined init with take of MetalFunctionNode?((uint64_t)v2, v0 + 16, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  return v0;
}

uint64_t UserGraphCompiler.compile(sourceProgram:into:)(long long *a1, uint64_t a2)
{
  uint64_t v4 = v2;
  long long v6 = a1[9];
  long long v60 = a1[8];
  v61[0] = v6;
  *(_OWORD *)((char *)v61 + 9) = *(long long *)((char *)a1 + 153);
  long long v7 = a1[5];
  long long v56 = a1[4];
  long long v57 = v7;
  long long v8 = a1[7];
  long long v58 = a1[6];
  long long v59 = v8;
  long long v9 = a1[1];
  long long v52 = *a1;
  long long v53 = v9;
  long long v10 = a1[3];
  long long v54 = a1[2];
  long long v55 = v10;
  outlined retain of Graph((uint64_t)a1);
  Graph.flatten()();
  long long v83 = v60;
  v84[0] = v61[0];
  *(_OWORD *)((char *)v84 + 9) = *(_OWORD *)((char *)v61 + 9);
  long long v79 = v56;
  long long v80 = v57;
  long long v82 = v59;
  long long v81 = v58;
  long long v75 = v52;
  long long v76 = v53;
  long long v78 = v55;
  long long v77 = v54;
  uint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v12 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  outlined retain of Graph((uint64_t)&v75);
  unint64_t v13 = specialized Dictionary.init(dictionaryLiteral:)(v11);
  unint64_t v14 = specialized Dictionary.init(dictionaryLiteral:)(v11);
  long long v48 = v83;
  v49[0] = v84[0];
  *(_OWORD *)((char *)v49 + 9) = *(_OWORD *)((char *)v84 + 9);
  long long v44 = v79;
  long long v45 = v80;
  long long v46 = v81;
  long long v47 = v82;
  long long v40 = v75;
  long long v41 = v76;
  long long v42 = v77;
  long long v43 = v78;
  *(void *)&long long v50 = v12;
  *((void *)&v50 + 1) = v13;
  unint64_t v51 = v14;
  uint64_t v15 = specialized UserGraphCompiler.emitFunctionNodes(context:into:)((uint64_t)&v40, a2);
  if (v3)
  {
    long long v37 = v49[1];
    long long v38 = v50;
    unint64_t v39 = v51;
    long long v33 = v46;
    long long v34 = v47;
    long long v35 = v48;
    long long v36 = v49[0];
    long long v29 = v42;
    long long v30 = v43;
    long long v31 = v44;
    long long v32 = v45;
    long long v27 = v40;
    long long v28 = v41;
    outlined release of UserGraphCompiler.CompileContext((uint64_t)&v27);
    outlined release of Graph((uint64_t)&v75);
  }
  else
  {
    uint64_t v16 = v15;
    v73[8] = v48;
    v74[0] = v49[0];
    *(_OWORD *)((char *)v74 + 9) = *(_OWORD *)((char *)v49 + 9);
    v73[4] = v44;
    v73[5] = v45;
    v73[7] = v47;
    v73[6] = v46;
    v73[0] = v40;
    v73[1] = v41;
    v73[3] = v43;
    v73[2] = v42;
    uint64_t v18 = *((void *)&v40 + 1);
    uint64_t v17 = v40;
    uint64_t v19 = v41;
    MEMORY[0x270FA5388](v15);
    swift_retain();
    outlined retain of Graph((uint64_t)v73);
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v20 = specialized Sequence.compactMap<A>(_:)(v17, v18, v19, (void (*)(void *__return_ptr, uint64_t, long long *))partial apply for closure #1 in Graph.sinkNodes());
    swift_release();
    swift_release();
    swift_release();
    specialized Graph.DepthFirstEdgeIterator.init(_:initial:)((uint64_t *)v73, v20, &v62);
    outlined release of Graph((uint64_t)v73);
    swift_retain();
    specialized Sequence.forEach(_:)((uint64_t *)&v62, &v40, v16);
    swift_release();
    long long v69 = v62;
    uint64_t v21 = v63;
    outlined init with take of MetalFunctionNode?((uint64_t)&v69, (uint64_t)v71, &demangling cache variable for type metadata for _HashTable.Storage?);
    outlined release of _HashTable.Storage?((uint64_t)v71);
    uint64_t v70 = *((void *)&v69 + 1);
    outlined release of _HashTable.Storage?((uint64_t)&v70);
    uint64_t v68 = v21;
    outlined release of _HashTable.Storage?((uint64_t)&v68);
    uint64_t v67 = v64;
    outlined release of [Input]((uint64_t)&v67);
    uint64_t v66 = v65;
    outlined release of [Input]((uint64_t)&v66);
    swift_release();
    swift_retain();
    uint64_t v23 = specialized UserGraphCompiler.applyConstExpr(context:into:)((uint64_t)&v40, v16);
    swift_release_n();
    swift_retain();
    a2 = specialized UserGraphCompiler.removePassthroughNodes(context:into:)((uint64_t)&v40, v23);
    swift_release_n();
    v25[10] = v49[1];
    v25[11] = v50;
    v25[6] = v46;
    v25[7] = v47;
    v25[8] = v48;
    v25[9] = v49[0];
    v25[2] = v42;
    v25[3] = v43;
    v25[4] = v44;
    v25[5] = v45;
    v25[0] = v40;
    v25[1] = v41;
    long long v37 = v49[1];
    long long v38 = v50;
    long long v33 = v46;
    long long v34 = v47;
    long long v35 = v48;
    long long v36 = v49[0];
    long long v29 = v42;
    long long v30 = v43;
    long long v31 = v44;
    long long v32 = v45;
    unint64_t v26 = v51;
    unint64_t v39 = v51;
    long long v27 = v40;
    long long v28 = v41;
    destructiveProjectEnumData for NodePersonality.ShaderType(&v27);
    outlined init with take of MetalFunctionNode?((uint64_t)&v27, (uint64_t)v72, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
    Swift::String v24 = *(void (**)(unsigned char *))(*(void *)v4 + 96);
    outlined retain of UserGraphCompiler.CompileContext((uint64_t)v25);
    v24(v72);
    outlined release of UserGraphCompiler.CompileContext((uint64_t)v25);
    outlined release of Graph((uint64_t)&v75);
  }
  return a2;
}

__n128 UserGraphCompiler.CompileContext.init(sourceProgram:)@<Q0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  long long v16 = a1[8];
  *(_OWORD *)uint64_t v17 = a1[9];
  *(_OWORD *)&v17[9] = *(_OWORD *)((char *)a1 + 153);
  long long v12 = a1[4];
  long long v13 = a1[5];
  long long v14 = a1[6];
  long long v15 = a1[7];
  __n128 v8 = *(__n128 *)a1;
  long long v9 = a1[1];
  long long v10 = a1[2];
  __n128 v11 = *((__n128 *)a1 + 3);
  uint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v4 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  unint64_t v5 = specialized Dictionary.init(dictionaryLiteral:)(v3);
  unint64_t v6 = specialized Dictionary.init(dictionaryLiteral:)(v3);
  *(_OWORD *)(a2 + 128) = v16;
  *(_OWORD *)(a2 + 144) = *(_OWORD *)v17;
  *(_OWORD *)(a2 + 160) = *(_OWORD *)&v17[16];
  *(_OWORD *)(a2 + 64) = v12;
  *(_OWORD *)(a2 + 80) = v13;
  *(_OWORD *)(a2 + 96) = v14;
  *(_OWORD *)(a2 + 112) = v15;
  *(__n128 *)a2 = v8;
  *(_OWORD *)(a2 + 16) = v9;
  __n128 result = v11;
  *(_OWORD *)(a2 + 32) = v10;
  *(__n128 *)(a2 + 48) = v11;
  *(void *)(a2 + 176) = v4;
  *(void *)(a2 + 184) = v5;
  *(void *)(a2 + 192) = v6;
  return result;
}

unint64_t closure #1 in UserGraphCompiler.emitFunctionNodes(context:into:)(long long *a1, uint64_t *a2, uint64_t a3)
{
  long long v6 = a1[1];
  long long v24 = *a1;
  v25[0] = v6;
  *(_OWORD *)((char *)v25 + 9) = *(long long *)((char *)a1 + 25);
  unint64_t v7 = v24;
  uint64_t v8 = *a2;
  outlined copy of NodePersonality(v24);
  swift_retain();
  uint64_t v9 = NodePersonality.emitFunctionNodes(node:context:into:)((uint64_t)&v24, a3, v8, v24);
  if (v3)
  {
    swift_release();
    if (one-time initialization token for logger != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)logger);
    uint64_t v26 = *((void *)&v24 + 1);
    uint64_t v27 = *(void *)&v25[0];
    outlined copy of NodePersonality(v7);
    id v11 = v3;
    outlined retain of [Input]((uint64_t)&v26);
    outlined retain of [Input]((uint64_t)&v27);
    outlined copy of NodePersonality(v7);
    id v12 = v3;
    outlined retain of [Input]((uint64_t)&v26);
    outlined retain of [Input]((uint64_t)&v27);
    long long v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = v22;
      *(_DWORD *)uint64_t v15 = 136315650;
      id v16 = v3;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
      uint64_t v17 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      *(_WORD *)(v15 + 12) = 2080;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000020, 0x800000025C428320, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v15 + 22) = 2080;
      v19._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v19);
      swift_bridgeObjectRelease();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(1701080942, 0xE400000000000000, &v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
      _os_log_impl(&dword_25C27E000, v13, v14, "Got error:\n    %s\nIn '%s'\n    Node: '%s'", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x261185880](v22, -1, -1);
      MEMORY[0x261185880](v15, -1, -1);
    }
    else
    {

      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
      outlined consume of NodePersonality(v7);
      outlined release of [Input]((uint64_t)&v26);
      outlined release of [Input]((uint64_t)&v27);
    }

    swift_willThrow();
  }
  else
  {
    uint64_t v20 = v9;
    swift_release();
    *a2 = v20;
    swift_release();
  }
  return outlined consume of NodePersonality(v7);
}

uint64_t closure #1 in UserGraphCompiler.emitEdges(context:into:)(long long *a1, long long *a2, uint64_t a3)
{
  long long v5 = a1[1];
  long long v95 = *a1;
  long long v96 = v5;
  long long v97 = a1[2];
  uint64_t v6 = *((void *)a1 + 6);
  uint64_t v98 = v6;
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *((void *)a1 + 1);
  uint64_t v9 = *((void *)a1 + 2);
  uint64_t v61 = *((void *)a1 + 4);
  uint64_t v62 = *((void *)a1 + 3);
  uint64_t v10 = *((unsigned __int8 *)a1 + 40);
  long long v11 = *(long long *)((char *)a1 + 56);
  long long v12 = *(long long *)((char *)a1 + 72);
  long long v13 = *(long long *)((char *)a1 + 88);
  uint64_t v92 = *((void *)a1 + 13);
  long long v90 = v12;
  long long v91 = v13;
  long long v89 = v11;
  uint64_t v58 = *((void *)a1 + 8);
  uint64_t v59 = *((void *)a1 + 7);
  uint64_t v56 = *((void *)a1 + 10);
  uint64_t v57 = *((void *)a1 + 9);
  uint64_t v60 = *((unsigned __int8 *)a1 + 96);
  uint64_t v54 = *((void *)a1 + 13);
  uint64_t v55 = *((void *)a1 + 11);
  long long v14 = *a2;
  long long v15 = a2[1];
  long long v16 = a2[3];
  v99[2] = a2[2];
  v99[3] = v16;
  v99[0] = v14;
  v99[1] = v15;
  long long v17 = a2[4];
  long long v18 = a2[5];
  long long v19 = a2[7];
  v99[6] = a2[6];
  v99[7] = v19;
  v99[4] = v17;
  v99[5] = v18;
  long long v20 = a2[8];
  long long v21 = a2[9];
  long long v22 = a2[10];
  long long v23 = a2[11];
  uint64_t v100 = *((void *)a2 + 24);
  v99[10] = v22;
  v99[11] = v23;
  v99[8] = v20;
  v99[9] = v21;
  outlined retain of UserGraphCompiler.CompileContext((uint64_t)v99);
  UserGraphCompiler.CompileContext.compiledNode(for:in:)((uint64_t)&v95, a3, (uint64_t)&v85);
  outlined release of UserGraphCompiler.CompileContext((uint64_t)v99);
  if (v86)
  {
    outlined init with take of MetalFunctionNode(&v85, (uint64_t)v88);
    long long v24 = a2[11];
    v93[10] = a2[10];
    v93[11] = v24;
    uint64_t v94 = *((void *)a2 + 24);
    long long v25 = a2[7];
    v93[6] = a2[6];
    v93[7] = v25;
    long long v26 = a2[9];
    v93[8] = a2[8];
    v93[9] = v26;
    long long v27 = a2[3];
    v93[2] = a2[2];
    v93[3] = v27;
    long long v28 = a2[5];
    v93[4] = a2[4];
    v93[5] = v28;
    long long v29 = a2[1];
    v93[0] = *a2;
    v93[1] = v29;
    outlined retain of UserGraphCompiler.CompileContext((uint64_t)v93);
    UserGraphCompiler.CompileContext.compiledNode(for:in:)((uint64_t)&v89, a3, (uint64_t)&v63);
    outlined release of UserGraphCompiler.CompileContext((uint64_t)v93);
    if (v64)
    {
      outlined init with take of MetalFunctionNode(&v63, (uint64_t)&v85);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<MetalFunctionNode>);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_25C418EE0;
      outlined init with copy of MetalFunctionNode((uint64_t)v88, v30 + 32);
      uint64_t v31 = v86;
      uint64_t v32 = v87;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v85, v86);
      MetalFunctionNode.setInputs(_:)(v30, v31, v32);
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      swift_arrayDestroy();
      swift_deallocClassInstance();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v85);
    }
    else
    {
      outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v63, (uint64_t *)&demangling cache variable for type metadata for MetalFunctionNode?);
      long long v102 = v90;
      uint64_t v65 = v59;
      uint64_t v66 = v58;
      uint64_t v67 = v57;
      uint64_t v68 = v56;
      uint64_t v69 = v55;
      uint64_t v70 = v60;
      uint64_t v71 = v54;
      _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi23_((uint64_t)&v65);
      outlined init with take of UserGraphError.ErrorType((uint64_t)&v65, (uint64_t)&v72);
      lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
      long long v84 = 0uLL;
      swift_allocError();
      *long long v44 = v72;
      long long v45 = v76;
      long long v47 = v73;
      long long v46 = v74;
      v44[3] = v75;
      v44[4] = v45;
      v44[1] = v47;
      v44[2] = v46;
      long long v48 = v80;
      long long v50 = v77;
      long long v49 = v78;
      v44[7] = v79;
      v44[8] = v48;
      void v44[5] = v50;
      v44[6] = v49;
      long long v51 = v84;
      long long v53 = v81;
      long long v52 = v82;
      v44[11] = v83;
      v44[12] = v51;
      v44[9] = v53;
      v44[10] = v52;
      swift_retain();
      outlined retain of String((uint64_t)&v102);
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    }
  }
  else
  {
    outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v85, (uint64_t *)&demangling cache variable for type metadata for MetalFunctionNode?);
    long long v101 = v96;
    uint64_t v65 = v7;
    uint64_t v66 = v8;
    uint64_t v67 = v9;
    uint64_t v68 = v62;
    uint64_t v69 = v61;
    uint64_t v70 = v10;
    uint64_t v71 = v6;
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi24_((uint64_t)&v65);
    outlined init with take of UserGraphError.ErrorType((uint64_t)&v65, (uint64_t)&v72);
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    long long v84 = 0uLL;
    swift_allocError();
    *long long v34 = v72;
    long long v35 = v76;
    long long v37 = v73;
    long long v36 = v74;
    v34[3] = v75;
    v34[4] = v35;
    v34[1] = v37;
    void v34[2] = v36;
    long long v38 = v80;
    long long v40 = v77;
    long long v39 = v78;
    v34[7] = v79;
    v34[8] = v38;
    v34[5] = v40;
    v34[6] = v39;
    long long v41 = v84;
    long long v43 = v81;
    long long v42 = v82;
    v34[11] = v83;
    v34[12] = v41;
    v34[9] = v43;
    v34[10] = v42;
    swift_retain();
    outlined retain of String((uint64_t)&v101);
    return swift_willThrow();
  }
}

uint64_t applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v48 = a3;
  swift_beginAccess();
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  uint64_t v10 = *(void *)(v9 + 8);
  long long v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 24);
  swift_bridgeObjectRetain();
  uint64_t v12 = v11(v8, v10);
  char v13 = specialized Set.contains(_:)(v12, v7);
  uint64_t result = swift_bridgeObjectRelease();
  if ((v13 & 1) == 0)
  {
    uint64_t v15 = a2;
    outlined init with copy of MetalFunctionNode((uint64_t)a1, (uint64_t)v45);
    uint64_t v17 = v46;
    uint64_t v16 = v47;
    __swift_project_boxed_opaque_existential_1(v45, v46);
    Swift::UInt v18 = (*(uint64_t (**)(uint64_t))(*(void *)(v16 + 8) + 24))(v17);
    swift_beginAccess();
    specialized Set._Variant.insert(_:)(v38, v18);
    swift_endAccess();
    uint64_t v19 = v46;
    uint64_t v20 = v47;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, v46);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 24))(1, v19, v20);
    uint64_t v22 = v46;
    uint64_t v21 = v47;
    __swift_project_boxed_opaque_existential_1(v45, v46);
    uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)(v21 + 8) + 48))(v22);
    uint64_t v24 = v48;
    swift_retain();
    uint64_t v25 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v23, v24);
    swift_bridgeObjectRelease();
    swift_release();
    if (!v4)
    {
      uint64_t v26 = *(void *)(v25 + 16);
      if (v26)
      {
        uint64_t v27 = v25 + 32;
        swift_bridgeObjectRetain();
        while (1)
        {
          outlined init with copy of MetalFunctionNode(v27, (uint64_t)v43);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
          if (!swift_dynamicCast()) {
            break;
          }
          outlined init with take of MetalFunctionNode(v41, (uint64_t)v44);
          applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(v44, v15, v24);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
          v27 += 40;
          if (!--v26) {
            goto LABEL_10;
          }
        }
        memset(v41, 0, sizeof(v41));
        uint64_t v42 = 0;
        outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v41, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
        _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v38);
        outlined init with take of UserGraphError.ErrorType((uint64_t)v38, (uint64_t)v39);
        *(void *)&long long v40 = 0xD00000000000005CLL;
        *((void *)&v40 + 1) = 0x800000025C4282C0;
        lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
        swift_allocError();
        *long long v28 = v39[0];
        long long v29 = v39[4];
        long long v31 = v39[1];
        long long v30 = v39[2];
        v28[3] = v39[3];
        v28[4] = v29;
        v28[1] = v31;
        v28[2] = v30;
        long long v32 = v39[8];
        long long v34 = v39[5];
        long long v33 = v39[6];
        v28[7] = v39[7];
        v28[8] = v32;
        v28[5] = v34;
        v28[6] = v33;
        long long v35 = v40;
        long long v37 = v39[9];
        long long v36 = v39[10];
        v28[11] = v39[11];
        v28[12] = v35;
        v28[9] = v37;
        v28[10] = v36;
        swift_willThrow();
LABEL_10:
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  }
  return result;
}

uint64_t closure #2 in applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of MetalFunctionNode(a1, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
  if (swift_dynamicCast())
  {
    outlined init with take of MetalFunctionNode(v19, (uint64_t)v22);
    applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(v22, a2, a3);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  }
  else
  {
    memset(v19, 0, sizeof(v19));
    uint64_t v20 = 0;
    outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v19, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
    _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v16);
    outlined init with take of UserGraphError.ErrorType((uint64_t)v16, (uint64_t)v17);
    *(void *)&long long v18 = 0xD00000000000005CLL;
    *((void *)&v18 + 1) = 0x800000025C4282C0;
    lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
    swift_allocError();
    *uint64_t v6 = v17[0];
    long long v7 = v17[4];
    long long v9 = v17[1];
    long long v8 = v17[2];
    v6[3] = v17[3];
    v6[4] = v7;
    v6[1] = v9;
    void v6[2] = v8;
    long long v10 = v17[8];
    long long v12 = v17[5];
    long long v11 = v17[6];
    v6[7] = v17[7];
    v6[8] = v10;
    v6[5] = v12;
    v6[6] = v11;
    long long v13 = v18;
    long long v15 = v17[9];
    long long v14 = v17[10];
    v6[11] = v17[11];
    v6[12] = v13;
    v6[9] = v15;
    void v6[10] = v14;
    return swift_willThrow();
  }
}

void *closure #4 in UserGraphCompiler.removePassthroughNodes(context:into:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 48))(v7, v8);
  if (!result[2])
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v10 = result[4];
  swift_bridgeObjectRelease();
  uint64_t result = (*(void *(**)(void *__return_ptr, uint64_t))(*(void *)a2 + 272))(v39, v10);
  if (v3) {
    return result;
  }
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  Swift::UInt v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  if (*(void *)(a3 + 16))
  {
    unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if (v15)
    {
      outlined init with copy of MetalFunctionNode(*(void *)(a3 + 56) + 40 * v14, (uint64_t)v35);
      outlined init with take of MetalFunctionNode(v35, (uint64_t)v36);
      uint64_t v16 = v37;
      uint64_t v17 = v38;
      __swift_project_boxed_opaque_existential_1(v36, v37);
      uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 48))(v16, v17);
      uint64_t v19 = a1[3];
      uint64_t v20 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v19);
      uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 24))(v19, v20);
      uint64_t v22 = specialized Collection<>.firstIndex(of:)(v21, v18);
      char v24 = v23;
      swift_bridgeObjectRelease();
      if (v24)
      {
LABEL_9:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
        return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
      }
      uint64_t v25 = v37;
      uint64_t v26 = v38;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
      uint64_t v27 = (void (*)(long long *, void))(*(uint64_t (**)(long long *, uint64_t, uint64_t))(v26 + 64))(v35, v25, v26);
      specialized Array.remove(at:)(v22);
      v27(v35, 0);
      uint64_t v28 = v40;
      uint64_t v29 = v41;
      __swift_project_boxed_opaque_existential_1(v39, v40);
      uint64_t v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 24))(v28, v29);
      uint64_t v31 = v37;
      uint64_t v32 = v38;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v36, v37);
      uint64_t result = (void *)(*(uint64_t (**)(long long *, uint64_t, uint64_t))(v32 + 64))(v35, v31, v32);
      if (*(void *)(*(void *)v33 + 16) >= v22)
      {
        if ((v22 & 0x8000000000000000) == 0)
        {
          long long v34 = (void (*)(long long *, void))result;
          specialized Array.replaceSubrange<A>(_:with:)(v22, v22, v30);
          v34(v35, 0);
          goto LABEL_9;
        }
LABEL_14:
        __break(1u);
        return result;
      }
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
  }
  return (void *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
}

uint64_t closure #5 in UserGraphCompiler.removePassthroughNodes(context:into:)(uint64_t a1)
{
  outlined init with copy of MetalFunctionNode(a1, (uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
  type metadata accessor for MetalPassthroughNode();
  int v1 = swift_dynamicCast();
  if (v1) {
    swift_release();
  }
  return v1 ^ 1u;
}

uint64_t UserGraphCompiler.deinit()
{
  outlined init with take of MetalFunctionNode?(v0 + 16, (uint64_t)v2, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined retain of UserGraphCompiler.CompileContext?(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of UserGraphCompiler.CompileContext?);
  return v0;
}

uint64_t UserGraphCompiler.__deallocating_deinit()
{
  outlined init with take of MetalFunctionNode?(v0 + 16, (uint64_t)v2, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
  outlined retain of UserGraphCompiler.CompileContext?(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))outlined consume of UserGraphCompiler.CompileContext?);
  return swift_deallocClassInstance();
}

uint64_t UserGraphCompiler.CompileContext.sourceProgram.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of Graph(v1, a1);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(*(void *)a1);
  Swift::Int v2 = *(void (**)(unsigned char *))(**(void **)(a1 + 8) + 120);
  swift_retain();
  v2(v6);
  swift_release();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(a1 + 40) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    Swift::UInt v3 = *(void *)(a1 + 32);
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v3);
  }
  Hasher._combine(_:)(*(void *)(a1 + 48));
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)((uint64_t *)a1, v4);
}

{
  uint64_t v2;
  uint64_t vars8;

  Swift::Int v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  void (*v2)(unsigned char *);
  Swift::Int v3;
  unsigned char v5[72];
  unsigned char v6[80];

  Hasher.init(_seed:)();
  outlined init with take of SGDataTypeStorage(a1, (uint64_t)v6);
  SGDataTypeStorage.hash(into:)();
  Swift::Int v2 = *(void (**)(unsigned char *))(**(void **)(a1 + 72) + 120);
  swift_retain();
  v2(v5);
  swift_release();
  Swift::UInt v3 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

{
  Swift::Int v2;
  unsigned char v4[72];
  uint64_t vars8;

  Hasher.init(_seed:)();
  (*(void (**)(unsigned char *))(*(void *)a1 + 120))(v4);
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2, char a3)
{
  char v6 = a3 & 1;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a3 & 1);
  String.hash(into:)();
  Swift::Int v7 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v6, v7);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        Swift::UInt v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unsigned char v13[80];
  unsigned char v14[80];

  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    unint64_t v6 = v2;
    uint64_t v8 = ~v4;
    outlined init with take of SGDataTypeStorage(a1, (uint64_t)v13);
    do
    {
      uint64_t v9 = *(void *)(v6 + 48) + 80 * v5;
      outlined init with take of SGDataTypeStorage(v9, (uint64_t)v14);
      uint64_t v10 = *(void *)(v9 + 72);
      outlined retain of SGDataTypeStorage((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, char))outlined copy of SGDataTypeStorage);
      swift_retain();
      if (specialized static SGDataTypeStorage.== infix(_:_:)((uint64_t)v14, (uint64_t)v13))
      {
        BOOL v11 = (*(uint64_t (**)(void))(*(void *)v10 + 128))(*(void *)(a1 + 72));
        outlined retain of SGDataTypeStorage((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
        swift_release();
        if (v11) {
          return v5;
        }
      }
      else
      {
        outlined retain of SGDataTypeStorage((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, char))outlined consume of SGDataTypeStorage);
        swift_release();
      }
      uint64_t v5 = (v5 + 1) & v8;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  char v11;

  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    unint64_t v6 = v2;
    uint64_t v8 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v2 + 48) + 8 * i) + 128);
    swift_retain();
    LOBYTE(v8) = v8(a1);
    swift_release();
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        uint64_t v10 = *(uint64_t (**)(uint64_t))(**(void **)(*(void *)(v6 + 48) + 8 * i) + 128);
        swift_retain();
        BOOL v11 = v10(a1);
        swift_release();
        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v7 = ~v4;
    uint64_t v8 = *a1;
    uint64_t v25 = *a1;
    uint64_t v26 = ~v4;
    do
    {
      uint64_t v9 = *(void *)(v2 + 48) + 56 * v5;
      if (*(void *)v9 != v8) {
        goto LABEL_4;
      }
      uint64_t v27 = *(void *)(v9 + 16);
      uint64_t v10 = *(void *)(v9 + 24);
      uint64_t v11 = *(void *)(v9 + 32);
      char v12 = *(unsigned char *)(v9 + 40);
      uint64_t v13 = *(void *)(v9 + 48);
      uint64_t v14 = a1[1];
      char v15 = *(uint64_t (**)(uint64_t))(**(void **)(v9 + 8) + 128);
      swift_retain();
      swift_bridgeObjectRetain();
      if ((v15(v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v3 = v23;
        uint64_t v2 = v24;
        uint64_t v8 = v25;
        uint64_t v7 = v26;
        goto LABEL_4;
      }
      char v16 = v12;
      uint64_t v17 = v11;
      uint64_t v18 = v13;
      if (v27 == a1[2] && v10 == a1[3])
      {
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v3 = v23;
        uint64_t v2 = v24;
        uint64_t v8 = v25;
        uint64_t v7 = v26;
        int v21 = *((unsigned __int8 *)a1 + 40);
        if (v16) {
          goto LABEL_13;
        }
      }
      else
      {
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v3 = v23;
        uint64_t v2 = v24;
        uint64_t v8 = v25;
        uint64_t v7 = v26;
        if ((v20 & 1) == 0) {
          goto LABEL_4;
        }
        int v21 = *((unsigned __int8 *)a1 + 40);
        if (v16)
        {
LABEL_13:
          if (!v21) {
            goto LABEL_4;
          }
          goto LABEL_19;
        }
      }
      if (v17 != a1[4]) {
        LOBYTE(v21) = 1;
      }
      if (v21) {
        goto LABEL_4;
      }
LABEL_19:
      if (v18 == a1[6]) {
        return v5;
      }
LABEL_4:
      unint64_t v5 = (v5 + 1) & v7;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if ((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = v12 + 24 * v7;
      if (*(unsigned char *)(v13 + 16))
      {
        if ((a3 & 1) == 0) {
          goto LABEL_3;
        }
      }
      else if (a3)
      {
        goto LABEL_3;
      }
      BOOL v14 = *(void *)v13 == a1 && *(void *)(v13 + 8) == a2;
      if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return v7;
      }
LABEL_3:
      unint64_t v7 = (v7 + 1) & v11;
    }
    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t specialized Sequence.forEach(_:)(uint64_t *a1, long long *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v3 = (void *)a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = (void *)a1[3];
  uint64_t v116 = a1[4];
  char v117 = v6;
  uint64_t v100 = v116;
  long long v101 = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  outlined retain of [Input]((uint64_t)&v117);
  outlined retain of [Input]((uint64_t)&v116);
  uint64_t v65 = v5;
  if (!v6[2])
  {
LABEL_73:
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  uint64_t v68 = v4;
  uint64_t v66 = v3;
  uint64_t v67 = v3 + 4;
  uint64_t v63 = v4 + 32;
  uint64_t v64 = (void *)(v4 + 16);
  uint64_t v62 = v5 + 32;
  uint64_t v58 = v3 + 7;
  while (1)
  {
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      uint64_t v7 = v6[2];
      if (!v7) {
        goto LABEL_72;
      }
    }
    else
    {
      uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew()(v6);
      uint64_t v7 = v6[2];
      if (!v7)
      {
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
    }
    uint64_t v8 = v7 - 1;
    uint64_t v9 = &v6[7 * v8];
    long long v10 = *((_OWORD *)v9 + 2);
    long long v11 = *((_OWORD *)v9 + 3);
    long long v12 = *((_OWORD *)v9 + 4);
    Swift::UInt v121 = v9[10];
    long long v119 = v11;
    long long v120 = v12;
    long long v118 = v10;
    uint64_t v13 = v9[4];
    uint64_t v14 = v9[6];
    uint64_t v74 = v9[7];
    uint64_t v75 = v9[5];
    uint64_t v15 = v9[8];
    char v16 = *((unsigned char *)v9 + 72);
    uint64_t v17 = v9[10];
    void v6[2] = v8;
    long long v101 = v6;
    uint64_t v18 = v100;
    uint64_t v72 = v14;
    uint64_t v73 = v13;
    uint64_t v71 = v15;
    char v70 = v16;
    uint64_t v69 = v17;
    if (*(void *)(v100 + 16))
    {
      Hasher.init(_seed:)();
      uint64_t v123 = v118;
      Hasher._combine(_:)(v118);
      uint64_t v19 = *((void *)&v118 + 1);
      char v20 = *(void (**)(long long *))(**((void **)&v118 + 1) + 120);
      swift_retain();
      v20(&v87);
      swift_release();
      long long v21 = v119;
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      Swift::UInt v22 = v120;
      char v80 = BYTE8(v120);
      uint64_t v76 = v120;
      if (BYTE8(v120) == 1)
      {
        Hasher._combine(_:)(0);
      }
      else
      {
        Hasher._combine(_:)(1u);
        Hasher._combine(_:)(v22);
      }
      Swift::UInt v79 = v121;
      Hasher._combine(_:)(v121);
      Swift::Int v23 = Hasher._finalize()();
      uint64_t v24 = -1 << *(unsigned char *)(v18 + 32);
      unint64_t v25 = v23 & ~v24;
      if ((*(void *)(v18 + 56 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25))
      {
        long long v77 = v6;
        uint64_t v26 = ~v24;
        while (1)
        {
          uint64_t v27 = *(void *)(v18 + 48) + 56 * v25;
          if (*(void *)v27 == v123)
          {
            uint64_t v28 = *(void *)(v27 + 16);
            uint64_t v29 = *(void *)(v27 + 24);
            uint64_t v82 = *(void *)(v27 + 32);
            char v30 = *(unsigned char *)(v27 + 40);
            uint64_t v85 = *(void *)(v27 + 48);
            uint64_t v31 = *(uint64_t (**)(uint64_t))(**(void **)(v27 + 8) + 128);
            swift_retain();
            swift_bridgeObjectRetain();
            if (v31(v19))
            {
              if (v28 == (void)v21 && v29 == *((void *)&v21 + 1))
              {
                swift_bridgeObjectRelease();
                swift_release();
                if (v30)
                {
LABEL_24:
                  char v34 = v80;
                  if (v85 != v79) {
                    char v34 = 0;
                  }
                  if (v34)
                  {
LABEL_35:
                    swift_bridgeObjectRelease();
                    swift_release();
                    uint64_t v4 = v68;
                    uint64_t v3 = v66;
                    uint64_t v6 = v77;
                    goto LABEL_4;
                  }
                  goto LABEL_15;
                }
                goto LABEL_29;
              }
              char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_release();
              if (v33)
              {
                if (v30) {
                  goto LABEL_24;
                }
LABEL_29:
                if ((v80 & 1) == 0 && v82 == v76 && v85 == v79) {
                  goto LABEL_35;
                }
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_release();
            }
          }
LABEL_15:
          unint64_t v25 = (v25 + 1) & v26;
          if (((*(void *)(v18 + 56 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          {
            uint64_t v4 = v68;
            uint64_t v3 = v66;
            uint64_t v6 = v77;
            goto LABEL_38;
          }
        }
      }
      uint64_t v3 = v66;
    }
LABEL_38:
    v122[0] = v119;
    swift_retain();
    outlined retain of String((uint64_t)v122);
    specialized Set._Variant.insert(_:)((uint64_t)&v87, (Swift::Int)&v118);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v36 = v3[2];
    if (v4) {
      break;
    }
    if (!v36) {
      goto LABEL_3;
    }
    if (*v67 == (void)v118)
    {
      unint64_t result = 0;
      uint64_t v39 = v65;
    }
    else
    {
      if (v36 == 1) {
        goto LABEL_3;
      }
      if (v3[5] == (void)v118)
      {
        unint64_t result = 1;
        uint64_t v39 = v65;
      }
      else
      {
        if (v36 == 2) {
          goto LABEL_3;
        }
        if (v3[6] != (void)v118)
        {
          uint64_t v40 = 0;
          while (v36 - 3 != v40)
          {
            uint64_t v41 = v58[v40++];
            if (v41 == (void)v118)
            {
              unint64_t result = v40 + 2;
              uint64_t v39 = v65;
              if ((result & 0x8000000000000000) != 0) {
                goto LABEL_76;
              }
              goto LABEL_55;
            }
          }
LABEL_3:
          swift_release();
          outlined release of String((uint64_t)v122);
          goto LABEL_4;
        }
        unint64_t result = 2;
        uint64_t v39 = v65;
      }
    }
LABEL_55:
    if (result >= *(void *)(v39 + 16)) {
      goto LABEL_77;
    }
    long long v78 = v6;
    uint64_t v42 = (void *)(v62 + 48 * result);
    uint64_t v43 = v42[3];
    uint64_t v44 = v42[4];
    uint64_t v45 = v42[5];
    uint64_t v46 = *(void *)(v44 + 16);
    if (v43)
    {
      swift_retain();
      outlined retain of String((uint64_t)v122);
      swift_retain();
      swift_retain();
      swift_retain();
      unint64_t result = specialized _HashTable.UnsafeHandle._find<A>(_:in:)((uint64_t)&v118, v44 + 32, v46, (void *)(v43 + 16), v43 + 32);
      if (v47) {
        goto LABEL_65;
      }
    }
    else
    {
      swift_retain();
      outlined retain of String((uint64_t)v122);
      swift_retain();
      swift_retain();
      unint64_t result = specialized Collection<>.firstIndex(of:)(&v118, v44 + 32, v46);
      if (v48)
      {
LABEL_65:
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        outlined release of String((uint64_t)v122);
        swift_release();
        outlined release of String((uint64_t)v122);
LABEL_67:
        uint64_t v6 = v78;
        uint64_t v4 = v68;
        goto LABEL_4;
      }
    }
    if ((result & 0x8000000000000000) != 0) {
      goto LABEL_78;
    }
    if (result >= *(void *)(v45 + 16)) {
      goto LABEL_79;
    }
    long long v49 = (void *)(v45 + 56 * result);
    uint64_t v51 = v49[4];
    uint64_t v50 = v49[5];
    uint64_t v52 = v49[6];
    uint64_t v53 = v49[8];
    uint64_t v54 = v49[9];
    uint64_t v55 = v49[10];
    uint64_t v123 = v49[7];
    uint64_t v84 = v53;
    char v86 = v54;
    outlined copy of Output?(v51, v50);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    outlined release of String((uint64_t)v122);
    if (!v50)
    {
      swift_release();
      outlined release of String((uint64_t)v122);
      goto LABEL_67;
    }
    uint64_t v83 = v55;
    uint64_t v4 = v68;
    specialized OrderedDictionary.subscript.getter(v51, v68, v3, v65, v102);
    outlined init with take of MetalFunctionNode?((uint64_t)v102, (uint64_t)&v103, &demangling cache variable for type metadata for Graph.Adjacent?);
    if (*((void *)&v103 + 1))
    {
      long long v111 = v103;
      long long v108 = v105;
      uint64_t v81 = v104;
      uint64_t v56 = v106;
      outlined init with take of MetalFunctionNode?((uint64_t)&v108, (uint64_t)v110, &demangling cache variable for type metadata for _HashTable.Storage?);
      uint64_t v57 = *((void *)&v108 + 1);
      uint64_t v109 = *((void *)&v108 + 1);
      uint64_t v107 = v56;
      long long v113 = v111;
      outlined init with take of MetalFunctionNode?((uint64_t)&v113, (uint64_t)v115, &demangling cache variable for type metadata for _HashTable.Storage?);
      swift_retain();
      outlined retain of String((uint64_t)v122);
      outlined retain of _HashTable.Storage?((uint64_t)v110);
      outlined retain of _HashTable.Storage?((uint64_t)&v109);
      outlined retain of _HashTable.Storage?((uint64_t)&v107);
      outlined release of _HashTable.Storage?((uint64_t)v115);
      uint64_t v114 = *((void *)&v113 + 1);
      outlined release of _HashTable.Storage?((uint64_t)&v114);
      uint64_t v112 = v81;
      outlined release of _HashTable.Storage?((uint64_t)&v112);
      outlined release of _HashTable.Storage?((uint64_t)v110);
      outlined release of _HashTable.Storage?((uint64_t)&v109);
      outlined release of _HashTable.Storage?((uint64_t)&v107);
      outlined release of _HashTable.Storage?((uint64_t)&v107);
      outlined release of _HashTable.Storage?((uint64_t)v110);
    }
    else
    {
      swift_retain();
      outlined retain of String((uint64_t)v122);
      uint64_t v57 = MEMORY[0x263F8EE78];
    }
    specialized Array.append<A>(contentsOf:)(v57);
    swift_release();
    outlined release of String((uint64_t)v122);
    *(void *)&long long v87 = v51;
    *((void *)&v87 + 1) = v50;
    uint64_t v88 = v52;
    uint64_t v89 = v123;
    uint64_t v90 = v84;
    char v91 = v86 & 1;
    uint64_t v92 = v83;
    uint64_t v93 = v73;
    uint64_t v94 = v75;
    uint64_t v95 = v72;
    uint64_t v96 = v74;
    uint64_t v97 = v71;
    char v98 = v70;
    uint64_t v99 = v69;
    closure #1 in UserGraphCompiler.emitEdges(context:into:)(&v87, a2, a3);
    if (v61)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v61 = 0;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v6 = v101;
    uint64_t v3 = v66;
LABEL_4:
    if (!v6[2]) {
      goto LABEL_73;
    }
  }
  unint64_t result = specialized _HashTable.UnsafeHandle._find<A>(_:in:)(v118, (uint64_t)v67, v36, v64, v63);
  if (v38) {
    goto LABEL_3;
  }
  uint64_t v39 = v65;
  if ((result & 0x8000000000000000) == 0) {
    goto LABEL_55;
  }
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
  return result;
}

uint64_t specialized UserGraphCompiler.emitFunctionNodes(context:into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a2;
  uint64_t v4 = *(void *)(a1 + 64);
  int64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    swift_retain();
    return v21;
  }
  uint64_t v6 = v4 + 32;
  swift_bridgeObjectRetain_n();
  swift_retain();
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = v6 + 48 * v7;
    uint64_t v9 = *(void *)(v8 + 24);
    if (v9 != -7) {
      break;
    }
    if ((uint64_t)++v7 >= v5) {
      goto LABEL_10;
    }
LABEL_8:
    if (v7 >= v5)
    {
      __break(1u);
LABEL_10:
      swift_bridgeObjectRelease_n();
      return v21;
    }
  }
  unint64_t v11 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  uint64_t v12 = *(void *)(v8 + 16);
  char v13 = *(unsigned char *)(v8 + 40);
  uint64_t v14 = *(void *)(v8 + 32);
  *(void *)&long long v16 = v11;
  *((void *)&v16 + 1) = v10;
  uint64_t v17 = v12;
  uint64_t v18 = v9;
  uint64_t v19 = v14;
  char v20 = v13;
  outlined copy of NodePersonality(v11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  closure #1 in UserGraphCompiler.emitFunctionNodes(context:into:)(&v16, &v21, a1);
  if (!v2)
  {
    ++v7;
    outlined consume of NodePersonality(v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((uint64_t)v7 >= v5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  outlined consume of NodePersonality(v11);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t specialized UserGraphCompiler.applyConstExpr(context:into:)(uint64_t a1, uint64_t a2)
{
  void (*v99)(long long *__return_ptr, void);
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  Swift::UInt v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _OWORD *v126;
  long long v127;
  long long v128;
  long long v129;
  long long v130;
  long long v131;
  long long v132;
  long long v133;
  long long v134;
  long long v135;
  uint64_t v136;
  _OWORD *v137;
  long long v138;
  long long v139;
  long long v140;
  long long v141;
  long long v142;
  long long v143;
  long long v144;
  long long v145;
  long long v146;
  uint64_t v147;
  _OWORD *v148;
  long long v149;
  long long v150;
  long long v151;
  long long v152;
  long long v153;
  long long v154;
  long long v155;
  long long v156;
  long long v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  long long v171[2];
  uint64_t v172;
  Swift::UInt v173[5];
  long long v174;
  long long v175;
  uint64_t v176;
  void v177[3];
  uint64_t v178;
  uint64_t v179;
  long long v180[12];
  long long v181;
  long long v182;
  long long v183;
  long long v184;
  long long v185;
  long long v186;
  long long v187;
  long long v188;
  long long v189;
  long long v190;
  long long v191;
  long long v192;
  long long v193;
  long long v194;
  long long v195;
  uint64_t v196;
  void v197[3];
  uint64_t v198;
  uint64_t v199;
  void v200[3];
  uint64_t v201;
  uint64_t v202;
  long long v203;
  long long v204;
  uint64_t v205;
  uint64_t v206;

  uint64_t v169 = swift_allocObject();
  *(void *)(v169 + 16) = MEMORY[0x263F8EE88];
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)a2 + 120))();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 32;
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    do
    {
      outlined init with copy of MetalFunctionNode(v5, (uint64_t)&v181);
      outlined init with copy of MetalFunctionNode((uint64_t)&v181, (uint64_t)v180);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v205 = 0;
        uint64_t v203 = 0u;
        char v204 = 0u;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v181);
      if (*((void *)&v204 + 1))
      {
        outlined init with take of MetalFunctionNode(&v203, (uint64_t)v180);
        outlined init with take of MetalFunctionNode(v180, (uint64_t)&v203);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6[2] + 1, 1, v6);
        }
        unint64_t v8 = v6[2];
        unint64_t v7 = v6[3];
        if (v8 >= v7 >> 1) {
          uint64_t v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v7 > 1), v8 + 1, 1, v6);
        }
        void v6[2] = v8 + 1;
        outlined init with take of MetalFunctionNode(&v203, (uint64_t)&v6[5 * v8 + 4]);
      }
      else
      {
        outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v203, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
      }
      v5 += 40;
      --v4;
    }
    while (v4);
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  }
  *(void *)&uint64_t v203 = MEMORY[0x263F8EE78];
  uint64_t v10 = v6[2];
  if (!v10)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v18 = *(void *)(v203 + 16);
    if (!v18)
    {
      swift_release();
LABEL_92:
      uint64_t v45 = a2;
      swift_retain();
      swift_release();
      return v45;
    }
    uint64_t v19 = v203 + 32;
    swift_retain();
    char v20 = (uint64_t *)(v169 + 16);
    swift_beginAccess();
    uint64_t v21 = 0;
    uint64_t v159 = v18;
    uint64_t v163 = v19;
    while (1)
    {
      uint64_t v168 = v21;
      Swift::UInt v22 = (void *)(v19 + 40 * v21);
      uint64_t v23 = *v20;
      uint64_t v25 = v22[3];
      uint64_t v24 = v22[4];
      __swift_project_boxed_opaque_existential_1(v22, v25);
      uint64_t v26 = *(void *)(v24 + 8);
      uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))(v26 + 24);
      swift_bridgeObjectRetain();
      uint64_t v28 = v27(v25, v26);
      if (!*(void *)(v23 + 16)) {
        break;
      }
      Swift::UInt v29 = v28;
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v29);
      Swift::Int v30 = Hasher._finalize()();
      uint64_t v31 = -1 << *(unsigned char *)(v23 + 32);
      unint64_t v32 = v30 & ~v31;
      uint64_t v33 = v23 + 56;
      if (((*(void *)(v23 + 56 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0) {
        break;
      }
      uint64_t v34 = *(void *)(v23 + 48);
      if (*(void *)(v34 + 8 * v32) != v29)
      {
        uint64_t v35 = ~v31;
        unint64_t v36 = (v32 + 1) & v35;
        if (((*(void *)(v33 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0) {
          break;
        }
        while (*(void *)(v34 + 8 * v36) != v29)
        {
          unint64_t v36 = (v36 + 1) & v35;
          if (((*(void *)(v33 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0) {
            goto LABEL_35;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_89:
      uint64_t v19 = v163;
      uint64_t v21 = v168 + 1;
      if (v168 + 1 == v18)
      {
        swift_release_n();
        goto LABEL_92;
      }
    }
LABEL_35:
    swift_bridgeObjectRelease();
    outlined init with copy of MetalFunctionNode((uint64_t)v22, (uint64_t)&v203);
    uint64_t v38 = *((void *)&v204 + 1);
    uint64_t v37 = v205;
    __swift_project_boxed_opaque_existential_1(&v203, *((uint64_t *)&v204 + 1));
    Swift::UInt v39 = (*(uint64_t (**)(uint64_t))(*(void *)(v37 + 8) + 24))(v38);
    swift_beginAccess();
    specialized Set._Variant.insert(_:)((Swift::UInt *)v180, v39);
    swift_endAccess();
    uint64_t v40 = *((void *)&v204 + 1);
    uint64_t v41 = v205;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v203, *((uint64_t *)&v204 + 1));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 24))(1, v40, v41);
    uint64_t v43 = *((void *)&v204 + 1);
    uint64_t v42 = v205;
    __swift_project_boxed_opaque_existential_1(&v203, *((uint64_t *)&v204 + 1));
    uint64_t v44 = (*(uint64_t (**)(uint64_t))(*(void *)(v42 + 8) + 48))(v43);
    uint64_t v45 = a2;
    swift_retain();
    uint64_t v46 = v206;
    uint64_t v47 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v44, a2);
    uint64_t v206 = v46;
    if (v46)
    {
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_98;
    }
    uint64_t v48 = v47;
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v166 = *(void *)(v48 + 16);
    if (!v166)
    {
      swift_bridgeObjectRelease();
LABEL_88:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v203);
      uint64_t v18 = v159;
      goto LABEL_89;
    }
    uint64_t v49 = v48 + 32;
    swift_bridgeObjectRetain();
    uint64_t v50 = 0;
    uint64_t v160 = v48 + 32;
    while (1)
    {
      uint64_t v167 = v50;
      outlined init with copy of MetalFunctionNode(v49 + 40 * v50, (uint64_t)v197);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalConstExprFunctionNode);
      if (!swift_dynamicCast())
      {
        unint64_t v194 = 0u;
        uint64_t v195 = 0u;
        uint64_t v196 = 0;
        outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v194, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
        _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v180);
        outlined init with take of UserGraphError.ErrorType((uint64_t)v180, (uint64_t)&v181);
        *(void *)&uint64_t v193 = 0xD00000000000005CLL;
        *((void *)&v193 + 1) = 0x800000025C4282C0;
        lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
        uint64_t v136 = swift_allocError();
        *uint64_t v137 = v181;
        uint64_t v138 = v185;
        uint64_t v140 = v182;
        uint64_t v139 = v183;
        v137[3] = v184;
        v137[4] = v138;
        v137[1] = v140;
        v137[2] = v139;
        char v141 = v189;
        uint64_t v143 = v186;
        unint64_t v142 = v187;
        v137[7] = v188;
        v137[8] = v141;
        v137[5] = v143;
        v137[6] = v142;
        uint64_t v144 = v193;
        uint64_t v146 = v190;
        uint64_t v145 = v191;
        v137[11] = v192;
        v137[12] = v144;
        v137[9] = v146;
        v137[10] = v145;
        uint64_t v206 = v136;
        swift_willThrow();
        swift_bridgeObjectRelease_n();
        goto LABEL_98;
      }
      outlined init with take of MetalFunctionNode(&v194, (uint64_t)v200);
      uint64_t v51 = *v20;
      uint64_t v53 = v201;
      uint64_t v52 = v202;
      __swift_project_boxed_opaque_existential_1(v200, v201);
      uint64_t v54 = *(void *)(v52 + 8);
      uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t))(v54 + 24);
      swift_bridgeObjectRetain();
      uint64_t v56 = v55(v53, v54);
      if (*(void *)(v51 + 16))
      {
        Swift::UInt v57 = v56;
        Hasher.init(_seed:)();
        Hasher._combine(_:)(v57);
        Swift::Int v58 = Hasher._finalize()();
        uint64_t v59 = -1 << *(unsigned char *)(v51 + 32);
        unint64_t v60 = v58 & ~v59;
        if ((*(void *)(v51 + 56 + ((v60 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v60))
        {
          uint64_t v61 = *(void *)(v51 + 48);
          if (*(void *)(v61 + 8 * v60) == v57)
          {
LABEL_45:
            swift_bridgeObjectRelease();
            goto LABEL_85;
          }
          uint64_t v62 = ~v59;
          while (1)
          {
            unint64_t v60 = (v60 + 1) & v62;
            if (((*(void *)(v51 + 56 + ((v60 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v60) & 1) == 0) {
              break;
            }
            if (*(void *)(v61 + 8 * v60) == v57) {
              goto LABEL_45;
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      outlined init with copy of MetalFunctionNode((uint64_t)v200, (uint64_t)v197);
      uint64_t v64 = v198;
      uint64_t v63 = v199;
      __swift_project_boxed_opaque_existential_1(v197, v198);
      Swift::UInt v65 = (*(uint64_t (**)(uint64_t))(*(void *)(v63 + 8) + 24))(v64);
      swift_beginAccess();
      specialized Set._Variant.insert(_:)((Swift::UInt *)v180, v65);
      swift_endAccess();
      uint64_t v66 = v198;
      uint64_t v67 = v199;
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v197, v198);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 24))(1, v66, v67);
      uint64_t v69 = v198;
      uint64_t v68 = v199;
      __swift_project_boxed_opaque_existential_1(v197, v198);
      uint64_t v70 = (*(uint64_t (**)(uint64_t))(*(void *)(v68 + 8) + 48))(v69);
      swift_retain();
      uint64_t v71 = v206;
      uint64_t v72 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v70, v45);
      uint64_t v206 = v71;
      if (v71)
      {
        swift_bridgeObjectRelease();
        swift_release();
LABEL_97:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v197);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v200);
        swift_bridgeObjectRelease_n();
LABEL_98:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v203);
        swift_release();
        swift_release_n();
        return v45;
      }
      uint64_t v73 = v72;
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v162 = *(void *)(v73 + 16);
      if (v162)
      {
        uint64_t v74 = v73 + 32;
        swift_bridgeObjectRetain();
        uint64_t v75 = 0;
        uint64_t v161 = v48;
        unint64_t v158 = v73 + 32;
        while (1)
        {
          outlined init with copy of MetalFunctionNode(v74 + 40 * v75, (uint64_t)v177);
          if (!swift_dynamicCast())
          {
            uint64_t v174 = 0u;
            uint64_t v175 = 0u;
            uint64_t v176 = 0;
            outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)&v174, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
            _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v180);
            outlined init with take of UserGraphError.ErrorType((uint64_t)v180, (uint64_t)&v181);
            *(void *)&uint64_t v193 = 0xD00000000000005CLL;
            *((void *)&v193 + 1) = 0x800000025C4282C0;
            lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
            uint64_t v147 = swift_allocError();
            void *v148 = v181;
            char v149 = v185;
            uint64_t v151 = v182;
            unint64_t v150 = v183;
            v148[3] = v184;
            v148[4] = v149;
            v148[1] = v151;
            v148[2] = v150;
            uint64_t v152 = v189;
            uint64_t v154 = v186;
            uint64_t v153 = v187;
            v148[7] = v188;
            v148[8] = v152;
            v148[5] = v154;
            v148[6] = v153;
            uint64_t v155 = v193;
            char v157 = v190;
            unint64_t v156 = v191;
            v148[11] = v192;
            v148[12] = v155;
            v148[9] = v157;
            v148[10] = v156;
            uint64_t v206 = v147;
            swift_willThrow();
            swift_bridgeObjectRelease_n();
            goto LABEL_97;
          }
          uint64_t v164 = v75;
          outlined init with take of MetalFunctionNode(&v174, (uint64_t)&v194);
          uint64_t v76 = *v20;
          uint64_t v77 = *((void *)&v195 + 1);
          uint64_t v78 = v196;
          __swift_project_boxed_opaque_existential_1(&v194, *((uint64_t *)&v195 + 1));
          uint64_t v79 = *(void *)(v78 + 8);
          char v80 = *(uint64_t (**)(uint64_t, uint64_t))(v79 + 24);
          swift_bridgeObjectRetain();
          uint64_t v81 = v80(v77, v79);
          if (*(void *)(v76 + 16))
          {
            Swift::UInt v82 = v81;
            Hasher.init(_seed:)();
            Hasher._combine(_:)(v82);
            Swift::Int v83 = Hasher._finalize()();
            uint64_t v84 = -1 << *(unsigned char *)(v76 + 32);
            unint64_t v85 = v83 & ~v84;
            if ((*(void *)(v76 + 56 + ((v85 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v85))
            {
              uint64_t v86 = *(void *)(v76 + 48);
              if (*(void *)(v86 + 8 * v85) == v82)
              {
LABEL_56:
                swift_bridgeObjectRelease();
                goto LABEL_80;
              }
              uint64_t v87 = ~v84;
              while (1)
              {
                unint64_t v85 = (v85 + 1) & v87;
                if (((*(void *)(v76 + 56 + ((v85 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v85) & 1) == 0) {
                  break;
                }
                if (*(void *)(v86 + 8 * v85) == v82) {
                  goto LABEL_56;
                }
              }
            }
          }
          swift_bridgeObjectRelease();
          outlined init with copy of MetalFunctionNode((uint64_t)&v194, (uint64_t)v177);
          uint64_t v89 = v178;
          uint64_t v88 = v179;
          __swift_project_boxed_opaque_existential_1(v177, v178);
          Swift::UInt v90 = (*(uint64_t (**)(uint64_t))(*(void *)(v88 + 8) + 24))(v89);
          swift_beginAccess();
          specialized Set._Variant.insert(_:)((Swift::UInt *)v180, v90);
          swift_endAccess();
          uint64_t v91 = v178;
          uint64_t v92 = v179;
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v177, v178);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 24))(1, v91, v92);
          uint64_t v94 = v178;
          uint64_t v93 = v179;
          __swift_project_boxed_opaque_existential_1(v177, v178);
          uint64_t v95 = (*(uint64_t (**)(uint64_t))(*(void *)(v93 + 8) + 48))(v94);
          int64_t v96 = *(void *)(v95 + 16);
          if (v96)
          {
            *(void *)&v180[0] = MEMORY[0x263F8EE78];
            swift_retain();
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v96, 0);
            uint64_t v97 = 0;
            uint64_t v98 = *(void *)&v180[0];
            uint64_t v99 = *(void (**)(long long *__return_ptr, void))(*(void *)v45 + 272);
            while (1)
            {
              uint64_t v100 = v206;
              v99(&v181, *(void *)(v95 + 8 * v97 + 32));
              uint64_t v206 = v100;
              if (v100) {
                break;
              }
              *(void *)&v180[0] = v98;
              long long v102 = *(void *)(v98 + 16);
              long long v101 = *(void *)(v98 + 24);
              if (v102 >= v101 >> 1)
              {
                specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v101 > 1, v102 + 1, 1);
                uint64_t v98 = *(void *)&v180[0];
              }
              ++v97;
              *(void *)(v98 + 16) = v102 + 1;
              outlined init with take of MetalFunctionNode(&v181, v98 + 40 * v102 + 32);
              if (v96 == v97)
              {
                swift_bridgeObjectRelease();
                uint64_t v45 = a2;
                swift_release();
                uint64_t v48 = v161;
                goto LABEL_65;
              }
            }
            swift_bridgeObjectRelease();
            uint64_t v45 = a2;
            swift_release();
            swift_release();
            goto LABEL_96;
          }
          swift_bridgeObjectRelease();
          uint64_t v98 = MEMORY[0x263F8EE78];
LABEL_65:
          char v165 = *(void *)(v98 + 16);
          if (v165)
          {
            swift_bridgeObjectRetain();
            long long v103 = 0;
            while (1)
            {
              outlined init with copy of MetalFunctionNode(v98 + 32 + 40 * v103, (uint64_t)v173);
              if (!swift_dynamicCast()) {
                break;
              }
              outlined init with take of MetalFunctionNode(v171, (uint64_t)&v174);
              uint64_t v104 = *(void *)(v169 + 16);
              uint64_t v106 = *((void *)&v175 + 1);
              long long v105 = v176;
              __swift_project_boxed_opaque_existential_1(&v174, *((uint64_t *)&v175 + 1));
              uint64_t v107 = *(void *)(v105 + 8);
              long long v108 = *(uint64_t (**)(uint64_t, uint64_t))(v107 + 24);
              swift_bridgeObjectRetain();
              uint64_t v109 = v108(v106, v107);
              unint64_t v110 = specialized Set.contains(_:)(v109, v104);
              swift_bridgeObjectRelease();
              if ((v110 & 1) == 0)
              {
                outlined init with copy of MetalFunctionNode((uint64_t)&v174, (uint64_t)&v181);
                long long v111 = *((void *)&v182 + 1);
                uint64_t v112 = v183;
                __swift_project_boxed_opaque_existential_1(&v181, *((uint64_t *)&v182 + 1));
                long long v113 = (*(uint64_t (**)(uint64_t))(*(void *)(v112 + 8) + 24))(v111);
                swift_beginAccess();
                specialized Set._Variant.insert(_:)(v173, v113);
                swift_endAccess();
                uint64_t v114 = *((void *)&v182 + 1);
                uint64_t v115 = v183;
                __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v181, *((uint64_t *)&v182 + 1));
                (*(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 24))(1, v114, v115);
                uint64_t v116 = *((void *)&v182 + 1);
                char v117 = v183;
                __swift_project_boxed_opaque_existential_1(&v181, *((uint64_t *)&v182 + 1));
                long long v118 = (*(uint64_t (**)(uint64_t))(*(void *)(v117 + 8) + 48))(v116);
                swift_retain();
                long long v119 = v206;
                long long v120 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay11ShaderGraph14FunctionNodeIDVG_AF05MetalfG0_psAE_pTg504_s11d41Graph13createDotText12representing12inputg20IDs06outputhI0SSAA05i18A7ProgramC_SayAA08F28H2IDVGAJtKFAA0kmH0_pAIKXEfU_AF0idR0CTf1cn_nTf4ng_nTm(v118, v45);
                uint64_t v206 = v119;
                if (v119)
                {
                  swift_bridgeObjectRelease();
                  swift_release();
LABEL_95:
                  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v181);
                  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v174);
                  swift_bridgeObjectRelease_n();
                  goto LABEL_96;
                }
                Swift::UInt v121 = v120;
                swift_bridgeObjectRelease();
                swift_release();
                uint64_t v122 = *(void *)(v121 + 16);
                if (v122)
                {
                  uint64_t v123 = v121 + 32;
                  swift_bridgeObjectRetain();
                  uint64_t v124 = v206;
                  while (1)
                  {
                    closure #2 in applyConstExpr #1 (_:) in UserGraphCompiler.applyConstExpr(context:into:)(v123, v169, v45);
                    if (v124) {
                      break;
                    }
                    v123 += 40;
                    if (!--v122)
                    {
                      uint64_t v206 = 0;
                      swift_bridgeObjectRelease_n();
                      goto LABEL_77;
                    }
                  }
                  uint64_t v206 = v124;
                  swift_bridgeObjectRelease_n();
                  goto LABEL_95;
                }
                swift_bridgeObjectRelease();
LABEL_77:
                __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v181);
              }
              ++v103;
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v174);
              if (v103 == v165)
              {
                swift_bridgeObjectRelease_n();
                uint64_t v48 = v161;
                goto LABEL_79;
              }
            }
            memset(v171, 0, sizeof(v171));
            uint64_t v172 = 0;
            outlined destroy of (input: Input, fNode: MetalFunctionNode?)((uint64_t)v171, &demangling cache variable for type metadata for MetalConstExprFunctionNode?);
            _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi47_((uint64_t)v180);
            outlined init with take of UserGraphError.ErrorType((uint64_t)v180, (uint64_t)&v181);
            *(void *)&uint64_t v193 = 0xD00000000000005CLL;
            *((void *)&v193 + 1) = 0x800000025C4282C0;
            lazy protocol witness table accessor for type UserGraphError and conformance UserGraphError();
            char v125 = swift_allocError();
            *unint64_t v126 = v181;
            uint64_t v127 = v185;
            uint64_t v129 = v182;
            uint64_t v128 = v183;
            v126[3] = v184;
            v126[4] = v127;
            v126[1] = v129;
            v126[2] = v128;
            uint64_t v130 = v189;
            unint64_t v132 = v186;
            uint64_t v131 = v187;
            v126[7] = v188;
            v126[8] = v130;
            v126[5] = v132;
            v126[6] = v131;
            char v133 = v193;
            uint64_t v135 = v190;
            unint64_t v134 = v191;
            v126[11] = v192;
            v126[12] = v133;
            v126[9] = v135;
            v126[10] = v134;
            uint64_t v206 = v125;
            swift_willThrow();
            swift_bridgeObjectRelease_n();
LABEL_96:
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v177);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v194);
            swift_bridgeObjectRelease_n();
            goto LABEL_97;
          }
          swift_bridgeObjectRelease();
LABEL_79:
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v177);
          char v20 = (uint64_t *)(v169 + 16);
LABEL_80:
          uint64_t v74 = v158;
          uint64_t v75 = v164 + 1;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v194);
          if (v164 + 1 == v162)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_84;
          }
        }
      }
      swift_bridgeObjectRelease();
LABEL_84:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v197);
LABEL_85:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v200);
      uint64_t v50 = v167 + 1;
      uint64_t v49 = v160;
      if (v167 + 1 == v166)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_88;
      }
    }
  }
  unint64_t v11 = 0;
  uint64_t v12 = (uint64_t)(v6 + 4);
  while (v11 < v6[2])
  {
    outlined init with copy of MetalFunctionNode(v12, (uint64_t)&v181);
    uint64_t v13 = *((void *)&v182 + 1);
    uint64_t v14 = v183;
    __swift_project_boxed_opaque_existential_1(&v181, *((uint64_t *)&v182 + 1));
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v14 + 16))(v13, v14))
    {
      outlined init with take of MetalFunctionNode(&v181, (uint64_t)v180);
      uint64_t v15 = v203;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v15 + 16) + 1, 1);
        uint64_t v15 = v203;
      }
      unint64_t v17 = *(void *)(v15 + 16);
      unint64_t v16 = *(void *)(v15 + 24);
      if (v17 >= v16 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
        uint64_t v15 = v203;
      }
      *(void *)(v15 + 16) = v17 + 1;
      uint64_t result = outlined init with take of MetalFunctionNode(v180, v15 + 40 * v17 + 32);
    }
    else
    {
      uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v181);
    }
    ++v11;
    v12 += 40;
    if (v10 == v11) {
      goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized UserGraphCompiler.removePassthroughNodes(context:into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *(uint64_t (**)(void))(*(void *)a2 + 120);
  uint64_t v2 = v44();
  uint64_t v3 = v2;
  uint64_t v4 = MEMORY[0x263F8EE78];
  uint64_t v54 = MEMORY[0x263F8EE78];
  uint64_t v5 = *(void *)(v2 + 16);
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = v2 + 32;
    while (v6 < *(void *)(v3 + 16))
    {
      outlined init with copy of MetalFunctionNode(v7, (uint64_t)v49);
      outlined init with copy of MetalFunctionNode((uint64_t)v49, (uint64_t)&v51);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      type metadata accessor for MetalPassthroughNode();
      if (swift_dynamicCast())
      {
        swift_release();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
      }
      else
      {
        outlined init with take of MetalFunctionNode(v49, (uint64_t)&v51);
        uint64_t v8 = v54;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v54;
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v9 > 1, v10 + 1, 1);
          uint64_t v8 = v54;
        }
        *(void *)(v8 + 16) = v10 + 1;
        outlined init with take of MetalFunctionNode(&v51, v8 + 40 * v10 + 32);
      }
      ++v6;
      v7 += 40;
      if (v5 == v6)
      {
        uint64_t v11 = v54;
        uint64_t v4 = MEMORY[0x263F8EE78];
        goto LABEL_14;
      }
    }
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v11 = MEMORY[0x263F8EE78];
LABEL_14:
  swift_bridgeObjectRelease();
  int64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v54 = v4;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12, 0);
    uint64_t v13 = 0;
    int64_t v46 = v12;
    uint64_t v47 = v11 + 32;
    do
    {
      uint64_t v48 = v13;
      outlined init with copy of MetalFunctionNode(v47 + 40 * v13, (uint64_t)&v51);
      uint64_t v14 = v52;
      uint64_t v15 = v53;
      __swift_project_boxed_opaque_existential_1(&v51, v52);
      uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 48))(v14, v15);
      int64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        uint64_t v50 = v4;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v17, 0);
        uint64_t v18 = 0;
        uint64_t v19 = v50;
        do
        {
          *(void *)&v49[0] = *(void *)(v16 + 8 * v18 + 32);
          outlined init with copy of MetalFunctionNode((uint64_t)&v51, (uint64_t)v49 + 8);
          uint64_t v50 = v19;
          unint64_t v21 = *(void *)(v19 + 16);
          unint64_t v20 = *(void *)(v19 + 24);
          if (v21 >= v20 >> 1)
          {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1);
            uint64_t v19 = v50;
          }
          ++v18;
          *(void *)(v19 + 16) = v21 + 1;
          Swift::UInt v22 = (_OWORD *)(v19 + 48 * v21);
          long long v23 = v49[0];
          long long v24 = v49[2];
          v22[3] = v49[1];
          v22[4] = v24;
          v22[2] = v23;
        }
        while (v17 != v18);
        swift_bridgeObjectRelease();
        uint64_t v4 = MEMORY[0x263F8EE78];
        int64_t v12 = v46;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = v4;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v51);
      uint64_t v25 = v54;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v25 + 16) + 1, 1);
        uint64_t v25 = v54;
      }
      unint64_t v27 = *(void *)(v25 + 16);
      unint64_t v26 = *(void *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
        uint64_t v25 = v54;
      }
      uint64_t v13 = v48 + 1;
      *(void *)(v25 + 16) = v27 + 1;
      *(void *)(v25 + 8 * v27 + 32) = v19;
    }
    while (v48 + 1 != v12);
  }
  swift_release();
  *(void *)&v49[0] = MEMORY[0x263F8EE80];
  uint64_t v28 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v28, 1, v49);
  uint64_t v29 = a2;
  if (v43) {
    goto LABEL_49;
  }
  uint64_t v30 = swift_bridgeObjectRelease();
  uint64_t v31 = *(void *)&v49[0];
  uint64_t v32 = ((uint64_t (*)(uint64_t))v44)(v30);
  uint64_t v33 = v32;
  uint64_t v54 = v4;
  uint64_t v34 = *(void *)(v32 + 16);
  if (v34)
  {
    unint64_t v35 = 0;
    uint64_t v36 = v32 + 32;
    while (v35 < *(void *)(v33 + 16))
    {
      outlined init with copy of MetalFunctionNode(v36, (uint64_t)v49);
      outlined init with copy of MetalFunctionNode((uint64_t)v49, (uint64_t)&v51);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MetalFunctionNode);
      type metadata accessor for MetalPassthroughNode();
      if (swift_dynamicCast())
      {
        swift_release();
        outlined init with take of MetalFunctionNode(v49, (uint64_t)&v51);
        uint64_t v37 = v54;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v37 + 16) + 1, 1);
          uint64_t v37 = v54;
        }
        unint64_t v39 = *(void *)(v37 + 16);
        unint64_t v38 = *(void *)(v37 + 24);
        if (v39 >= v38 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
          uint64_t v37 = v54;
        }
        *(void *)(v37 + 16) = v39 + 1;
        outlined init with take of MetalFunctionNode(&v51, v37 + 40 * v39 + 32);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
      }
      ++v35;
      v36 += 40;
      if (v34 == v35)
      {
        uint64_t v4 = v54;
        uint64_t v29 = a2;
        goto LABEL_41;
      }
    }
LABEL_48:
    __break(1u);
LABEL_49:
    uint64_t result = swift_unexpectedError();
    __break(1u);
    return result;
  }
LABEL_41:
  swift_bridgeObjectRelease();
  uint64_t v40 = *(void *)(v4 + 16);
  if (v40)
  {
    uint64_t v41 = (void *)(v4 + 32);
    swift_bridgeObjectRetain();
    do
    {
      closure #4 in UserGraphCompiler.removePassthroughNodes(context:into:)(v41, v29, v31);
      v41 += 5;
      --v40;
    }
    while (v40);
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
  }
  swift_release();
  (*(void (**)(uint64_t (*)(uint64_t), void))(*(void *)v29 + 288))(closure #5 in UserGraphCompiler.removePassthroughNodes(context:into:), 0);
  swift_retain();
  return v29;
}

uint64_t sub_25C413120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(void *__return_ptr))(**(void **)a1 + 88))(v4);
  return outlined init with take of MetalFunctionNode?((uint64_t)v4, a2, (uint64_t *)&demangling cache variable for type metadata for UserGraphCompiler.CompileContext?);
}

uint64_t dispatch thunk of FunctionGraphInsertable.emitFunctionNodes(node:context:into:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5 = *((unsigned char *)a1 + 40);
  unint64_t v6 = *(uint64_t (**)(uint64_t *))(a5 + 8);
  uint64_t v8 = *a1;
  long long v9 = *(_OWORD *)(a1 + 1);
  long long v10 = *(_OWORD *)(a1 + 3);
  char v11 = v5;
  return v6(&v8);
}

uint64_t type metadata accessor for UserGraphCompiler()
{
  return self;
}

uint64_t method lookup function for UserGraphCompiler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UserGraphCompiler);
}

uint64_t dispatch thunk of UserGraphCompiler.context.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of UserGraphCompiler.context.setter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 192);
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(*(void *)v1 + 96);
  long long v4 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v7;
  long long v8 = *(_OWORD *)(a1 + 144);
  v11[8] = *(_OWORD *)(a1 + 128);
  v11[9] = v8;
  long long v9 = *(_OWORD *)(a1 + 176);
  v11[10] = *(_OWORD *)(a1 + 160);
  v11[11] = v9;
  uint64_t v12 = v2;
  return v3(v11);
}

uint64_t dispatch thunk of UserGraphCompiler.context.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of UserGraphCompiler.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of UserGraphCompiler.compile(sourceProgram:into:)(uint64_t *a1)
{
  long long v2 = *(_OWORD *)(a1 + 3);
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  char v5 = *((unsigned char *)a1 + 120);
  uint64_t v6 = a1[16];
  char v7 = *((unsigned char *)a1 + 168);
  long long v8 = *(uint64_t (**)(uint64_t *))(*(void *)v1 + 120);
  uint64_t v10 = *a1;
  long long v11 = *(_OWORD *)(a1 + 1);
  long long v12 = v2;
  uint64_t v13 = v3;
  long long v14 = *((_OWORD *)a1 + 3);
  uint64_t v15 = v4;
  long long v16 = *(_OWORD *)(a1 + 9);
  long long v17 = *(_OWORD *)(a1 + 11);
  long long v18 = *(_OWORD *)(a1 + 13);
  char v19 = v5;
  uint64_t v20 = v6;
  long long v21 = *(_OWORD *)(a1 + 17);
  long long v22 = *(_OWORD *)(a1 + 19);
  char v23 = v7;
  return v8(&v10);
}

uint64_t destroy for UserGraphCompiler.CompileContext(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of NodePersonality(*(void *)(a1 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of NodePersonality(*(void *)(a1 + 128));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserGraphCompiler.CompileContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  unint64_t v9 = *(void *)(a2 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of NodePersonality(v9);
  uint64_t v10 = *(void *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 96);
  *(void *)(a1 + 80) = v9;
  *(void *)(a1 + 88) = v10;
  uint64_t v12 = *(void *)(a2 + 104);
  uint64_t v13 = *(void *)(a2 + 112);
  *(void *)(a1 + 96) = v11;
  *(void *)(a1 + 104) = v12;
  *(void *)(a1 + 112) = v13;
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  unint64_t v14 = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of NodePersonality(v14);
  uint64_t v15 = *(void *)(a2 + 136);
  uint64_t v16 = *(void *)(a2 + 144);
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = v15;
  uint64_t v17 = *(void *)(a2 + 152);
  uint64_t v18 = *(void *)(a2 + 160);
  *(void *)(a1 + 144) = v16;
  *(void *)(a1 + 152) = v17;
  *(void *)(a1 + 160) = v18;
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  uint64_t v19 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v19;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserGraphCompiler.CompileContext(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  unint64_t v4 = *(void *)(a2 + 80);
  outlined copy of NodePersonality(v4);
  unint64_t v5 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v4;
  outlined consume of NodePersonality(v5);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v6 = *(void *)(a2 + 112);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(void *)(a1 + 112) = v6;
  unint64_t v7 = *(void *)(a2 + 128);
  outlined copy of NodePersonality(v7);
  unint64_t v8 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = v7;
  outlined consume of NodePersonality(v8);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  uint64_t v9 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v9;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy200_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for UserGraphCompiler.CompileContext(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  unint64_t v5 = *(void *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  outlined consume of NodePersonality(v5);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v6;
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  unint64_t v7 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  outlined consume of NodePersonality(v7);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v8;
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserGraphCompiler.CompileContext(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 200)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGraphCompiler.CompileContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 200) = 1;
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
    *(unsigned char *)(result + 200) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserGraphCompiler.CompileContext()
{
  return &type metadata for UserGraphCompiler.CompileContext;
}

uint64_t outlined init with copy of (FunctionNodeID, MetalFunctionNode)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (FunctionNodeID, MetalFunctionNode));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25C413A20()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi24_(uint64_t result)
{
  *(void *)(result + 168) = *(void *)(result + 168) & 1 | 0x6400000000000000;
  return result;
}

uint64_t _s11ShaderGraph04UserB5ErrorV0D4TypeOWOi23_(uint64_t result)
{
  *(void *)(result + 168) = *(void *)(result + 168) & 1 | 0x6000000000000000;
  return result;
}

Swift::String __swiftcall NodeData.operationalDescription(replacements:)(Swift::OpaquePointer replacements)
{
  uint64_t v2 = v1;
  outlined init with take of NodeData(v1, (uint64_t)v38);
  uint64_t v4 = v39;
  unint64_t v5 = v40;
  int v6 = v41;
  int v7 = v42;
  int v9 = v43;
  int v8 = v44;
  int v10 = v45;
  int v37 = v46;
  char v11 = v47;
  outlined init with take of NodeData(v2, (uint64_t)v48);
  int v12 = v54 >> 6;
  if (v12)
  {
    if (v12 == 1)
    {
      unint64_t v13 = 0xE800000000000000;
      uint64_t v14 = 0x6870617267627573;
    }
    else
    {
      int v15 = v54 & 0x3F;
      unsigned __int8 v54 = v15;
      long long v56 = v50;
      long long v57 = v51;
      long long v58 = v52;
      uint64_t v55 = v49;
      uint64_t v59 = v53;
      char v60 = v15;
      if (v15 == 6)
      {
        uint64_t v36 = v49;
        uint64_t v35 = v50;
        uint64_t v34 = *((void *)replacements._rawValue + 2);
        char v16 = v11 & 0x3F;
        outlined retain of NodeData(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
        if (v34)
        {
          outlined retain of NodeData(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
          outlined copy of SGDataTypeStorage(v4, v5, v6, v7, v9, v8, v10, v37, v16);
          uint64_t v17 = v36;
          uint64_t v18 = (void *)v35;
          unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v36, v35);
          if (v20)
          {
            long long v21 = (uint64_t *)(*((void *)replacements._rawValue + 7) + 16 * v19);
            uint64_t v17 = *v21;
            uint64_t v18 = (void *)v21[1];
            swift_bridgeObjectRetain();
            outlined retain of NodeData(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
          }
          outlined retain of NodeData(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
        }
        else
        {
          outlined copy of SGDataTypeStorage(v4, v5, v6, v7, v9, v8, v10, v37, v16);
          uint64_t v17 = v36;
          uint64_t v18 = (void *)v35;
        }
        v28._uint64_t countAndFlagsBits = SGDataType.stringValue.getter();
        String.append(_:)(v28);
        swift_bridgeObjectRelease();
        v29._uint64_t countAndFlagsBits = 95;
        v29._id object = (void *)0xE100000000000000;
        String.append(_:)(v29);
        v30._uint64_t countAndFlagsBits = v17;
        v30._id object = v18;
        String.append(_:)(v30);
      }
      else
      {
        unint64_t v22 = SGDataType.stringValue.getter();
        long long v24 = v23;
        outlined retain of NodeData(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
        v25._uint64_t countAndFlagsBits = v22;
        v25._id object = v24;
        String.append(_:)(v25);
        swift_bridgeObjectRelease();
        v26._uint64_t countAndFlagsBits = 95;
        v26._id object = (void *)0xE100000000000000;
        String.append(_:)(v26);
        v27._uint64_t countAndFlagsBits = SGDataTypeStorage.valueString.getter();
        String.append(_:)(v27);
      }
      swift_bridgeObjectRelease();
      outlined retain of NodeData(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
      uint64_t v14 = 24419;
      unint64_t v13 = 0xE200000000000000;
    }
  }
  else
  {
    uint64_t v14 = v48[0];
    unint64_t v13 = v48[1];
    swift_bridgeObjectRetain();
  }
  uint64_t v31 = v14;
  uint64_t v32 = (void *)v13;
  result._id object = v32;
  result._uint64_t countAndFlagsBits = v31;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NodeData(uint64_t a1, uint64_t a2)
{
  outlined init with take of NodeData(a1, (uint64_t)v4);
  outlined init with take of NodeData(a2, (uint64_t)v5);
  return specialized static NodeData.== infix(_:_:)((uint64_t)v4, (uint64_t)v5) & 1;
}

ShaderGraph::NodeData::CodingKeys_optional __swiftcall NodeData.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  id object = stringValue._object;
  v2._uint64_t countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._id object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of NodeData.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return (ShaderGraph::NodeData::CodingKeys_optional)3;
  }
  else {
    return (ShaderGraph::NodeData::CodingKeys_optional)v3;
  }
}

ShaderGraph::NodeData::CodingKeys_optional __swiftcall NodeData.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (ShaderGraph::NodeData::CodingKeys_optional)3;
}

uint64_t NodeData.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t NodeData.CodingKeys.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x656D614E65736163;
  }
  if (a1 == 1) {
    return 0x65756C6176;
  }
  return 1701869940;
}

uint64_t NodeData.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x656D614E65736163;
  }
  if (a1 == 1) {
    return 0x65756C6176;
  }
  return 1701869940;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NodeData.CodingKeys(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a1;
  unint64_t v3 = 0xE500000000000000;
  uint64_t v4 = 0x65756C6176;
  if (v2 != 1)
  {
    uint64_t v4 = 1701869940;
    unint64_t v3 = 0xE400000000000000;
  }
  if (*a1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0x656D614E65736163;
  }
  if (v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  unint64_t v7 = 0xE500000000000000;
  uint64_t v8 = 0x65756C6176;
  if (*a2 != 1)
  {
    uint64_t v8 = 1701869940;
    unint64_t v7 = 0xE400000000000000;
  }
  if (*a2) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0x656D614E65736163;
  }
  if (*a2) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = 0xE800000000000000;
  }
  if (v5 == v9 && v6 == v10) {
    char v11 = 1;
  }
  else {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance NodeData.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NodeData.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NodeData.CodingKeys()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NodeData.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized NodeData.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance NodeData.CodingKeys(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE800000000000000;
  unint64_t v4 = 0xE500000000000000;
  uint64_t v5 = 0x65756C6176;
  if (v2 != 1)
  {
    uint64_t v5 = 1701869940;
    unint64_t v4 = 0xE400000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x656D614E65736163;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance NodeData.CodingKeys()
{
  uint64_t v1 = 0x65756C6176;
  if (*v0 != 1) {
    uint64_t v1 = 1701869940;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656D614E65736163;
  }
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance NodeData.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized NodeData.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance NodeData.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NodeData.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NodeData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = specialized NodeData.init(from:)(a1, v5);
  if (!v2) {
    return outlined init with take of NodeData((uint64_t)v5, a2);
  }
  return result;
}

void NodeData.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  outlined init with take of NodeData(v2, (uint64_t)v49);
  unint64_t v4 = (void *)v49[0];
  id v35 = (id)v49[3];
  id v36 = (id)v49[2];
  uint64_t v33 = v49[5];
  uint64_t v34 = v49[4];
  uint64_t v31 = v49[7];
  uint64_t v32 = v49[6];
  uint64_t v29 = v49[9];
  uint64_t v30 = v49[8];
  char v5 = v50;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<NodeData.CodingKeys>);
  uint64_t v38 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v37 = v2;
  outlined init with take of NodeData(v2, (uint64_t)v51);
  int v9 = v52 >> 6;
  if (!v9)
  {
    v52 &= 0x3Fu;
    LOBYTE(v40) = 0;
    uint64_t v14 = v39;
    KeyedEncodingContainer.encode(_:forKey:)();
    unint64_t v13 = v14;
    if (!v14)
    {
      LOBYTE(v40) = 1;
      KeyedEncodingContainer.encode(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
      return;
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
LABEL_10:
    type metadata accessor for SGError();
    id v21 = v13;
    SGError.__allocating_init(_:)(v13);
    swift_willThrow();

    return;
  }
  if (v9 != 1)
  {
    int v15 = v52 & 0x3F;
    v52 &= 0x3Fu;
    uint64_t v27 = v51[3];
    uint64_t v28 = v51[0];
    uint64_t v25 = v51[4];
    uint64_t v26 = v51[2];
    uint64_t v23 = v51[6];
    uint64_t v24 = v51[5];
    char v16 = (void *)v51[8];
    uint64_t v22 = v51[7];
    uint64_t v17 = (void *)v51[9];
    LOBYTE(v40) = 0;
    outlined copy of SGDataTypeStorage(v36, v35, v34, v33, v32, v31, v30, v29, v5 & 0x3F);
    uint64_t v18 = v39;
    KeyedEncodingContainer.encode(_:forKey:)();
    unint64_t v13 = v18;
    if (!v18)
    {
      id v35 = v17;
      id v36 = v16;
      LODWORD(v39) = v15;
      uint64_t v19 = v26;
      uint64_t v20 = v27;
      uint64_t v40 = v28;
      char v53 = 2;
      type metadata accessor for SGDataType(0);
      lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGDataType and conformance SGDataType, type metadata accessor for SGDataType);
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      uint64_t v40 = v19;
      uint64_t v41 = v20;
      uint64_t v42 = v25;
      uint64_t v43 = v24;
      uint64_t v44 = v23;
      uint64_t v45 = v22;
      id v46 = v36;
      id v47 = v35;
      char v48 = (char)v39;
      char v53 = 1;
      lazy protocol witness table accessor for type SGDataTypeStorage and conformance SGDataTypeStorage();
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v52 &= 0x3Fu;
  uint64_t v10 = v51[0];
  LOBYTE(v40) = 0;
  id v11 = v4;
  int v12 = v39;
  KeyedEncodingContainer.encode(_:forKey:)();
  unint64_t v13 = v12;
  if (v12)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
    outlined retain of NodeData(v37, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
    goto LABEL_10;
  }
  uint64_t v40 = v10;
  char v53 = 1;
  type metadata accessor for SGGraph();
  lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGGraph and conformance SGGraph, (void (*)(uint64_t))type metadata accessor for SGGraph);
LABEL_12:
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v6);
  outlined retain of NodeData(v37, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
}

uint64_t protocol witness for Decodable.init(from:) in conformance NodeData@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = specialized NodeData.init(from:)(a1, v5);
  if (!v2) {
    return outlined init with take of NodeData((uint64_t)v5, a2);
  }
  return result;
}

void protocol witness for Encodable.encode(to:) in conformance NodeData(void *a1)
{
  outlined init with take of NodeData(v1, (uint64_t)&v3);
  NodeData.encode(to:)(a1);
}

uint64_t specialized static NodeData.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  outlined init with take of NodeData(a1, (uint64_t)&v26);
  int v4 = v33 >> 6;
  if (!v4)
  {
    v33 &= 0x3Fu;
    long long v41 = v26;
    long long v42 = v27;
    v43[0] = v28;
    outlined init with take of NodeData(a2, (uint64_t)&v20);
    if (v25 > 0x3Fu) {
      goto LABEL_21;
    }
    long long v6 = v21;
    long long v7 = v22;
    if (v41 != v20 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      goto LABEL_21;
    }
    if ((specialized static Array<A>.== infix(_:_:)(v42, v6) & 1) == 0
      || (specialized static Array<A>.== infix(_:_:)(*((void **)&v42 + 1), *((void **)&v6 + 1)) & 1) == 0)
    {
      goto LABEL_21;
    }
    outlined init with take of MaterialXAvailability((uint64_t)v43, (uint64_t)v34);
    outlined init with take of MaterialXAvailability((uint64_t)v34, (uint64_t)v35);
    if (*((void *)&v35[0] + 1) == 2)
    {
      if (*((void *)&v7 + 1) != 2) {
        goto LABEL_21;
      }
    }
    else if (*((void *)&v35[0] + 1) == 1)
    {
      if (*((void *)&v7 + 1) != 1) {
        goto LABEL_21;
      }
    }
    else
    {
      if ((unint64_t)(*((void *)&v7 + 1) - 1) < 2) {
        goto LABEL_21;
      }
      if (*((void *)&v35[0] + 1))
      {
        if (!*((void *)&v7 + 1) || v35[0] != v7 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
          goto LABEL_21;
        }
      }
      else if (*((void *)&v7 + 1))
      {
        outlined release of MaterialXAvailability(v34);
        goto LABEL_21;
      }
    }
    char v16 = 1;
    return v16 & 1;
  }
  if (v4 != 1)
  {
    char v8 = v33 & 0x3F;
    v33 &= 0x3Fu;
    uint64_t v9 = v26;
    uint64_t v10 = *((void *)&v27 + 1);
    long long v11 = v28;
    uint64_t v12 = v29;
    uint64_t v13 = v30;
    uint64_t v14 = v31;
    uint64_t v18 = v32;
    uint64_t v19 = v27;
    outlined init with take of NodeData(a2, (uint64_t)&v20);
    if ((v25 & 0xC0) == 0x80)
    {
      char v15 = v25 & 0x3F;
      v25 &= 0x3Fu;
      if (v9 == (void)v20)
      {
        *(void *)&v35[0] = v19;
        *((void *)&v35[0] + 1) = v10;
        v35[1] = v11;
        uint64_t v36 = v12;
        uint64_t v37 = v13;
        uint64_t v38 = v14;
        uint64_t v39 = v18;
        char v40 = v8;
        long long v41 = v21;
        long long v42 = v22;
        v43[0] = v23;
        v43[1] = v24;
        char v44 = v15;
        outlined retain of NodeData(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
        outlined retain of NodeData(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
        char v5 = specialized static SGDataTypeStorage.== infix(_:_:)((uint64_t)v35, (uint64_t)&v41);
        goto LABEL_17;
      }
    }
LABEL_21:
    char v16 = 0;
    return v16 & 1;
  }
  v33 &= 0x3Fu;
  outlined init with take of NodeData(a2, (uint64_t)&v20);
  if ((v25 & 0xC0) != 0x40) {
    goto LABEL_21;
  }
  v25 &= 0x3Fu;
  type metadata accessor for NSObject();
  outlined retain of NodeData(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
  outlined retain of NodeData(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined copy of NodeData);
  char v5 = static NSObject.== infix(_:_:)();
LABEL_17:
  char v16 = v5;
  outlined retain of NodeData(a2, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
  outlined retain of NodeData(a1, (void (*)(void, void, void, void, void, void, void, void, void, void, char))outlined consume of NodeData);
  return v16 & 1;
}

unint64_t specialized NodeData.CodingKeys.init(rawValue:)(Swift::String string)
{
  id object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._id object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of NodeData.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t specialized NodeData.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = v2;
  uint64_t v78 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<NodeData.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    goto LABEL_8;
  }
  uint64_t v55 = v6;
  LOBYTE(v57) = 0;
  uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v10;
  BOOL v13 = v11 == 0x6E49746C697562 && v10 == 0xE700000000000000;
  if (!v13 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    BOOL v29 = v11 == 0x6870617267 && v12 == 0xE500000000000000;
    if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for SGGraph();
      LOBYTE(v56[0]) = 1;
      lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGGraph and conformance SGGraph, (void (*)(uint64_t))type metadata accessor for SGGraph);
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v8, v5);
      uint64_t v22 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v27 = 0;
      uint64_t v52 = 0;
      uint64_t v53 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = v57;
      char v28 = 64;
      goto LABEL_19;
    }
    if (v11 == 0x746E6174736E6F63 && v12 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v45 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v45 & 1) == 0)
      {
        _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi5_((uint64_t)v56);
        outlined init with take of SGInternalError.ErrorType(v56, &v57);
        lazy protocol witness table accessor for type SGInternalError and conformance SGInternalError();
        long long v70 = 0uLL;
        goto LABEL_21;
      }
    }
    LOBYTE(v56[0]) = 1;
    lazy protocol witness table accessor for type SGDataTypeStorage and conformance SGDataTypeStorage();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v48 = *((void *)&v57 + 1);
    uint64_t v49 = v57;
    uint64_t v46 = *((void *)&v58 + 1);
    uint64_t v27 = *((void *)&v59 + 1);
    uint64_t v47 = v59;
    uint64_t v53 = v60;
    uint64_t v54 = v58;
    uint64_t v52 = *((void *)&v60 + 1);
    LODWORD(v50) = v61;
    type metadata accessor for SGDataType(0);
    LOBYTE(v56[0]) = 2;
    lazy protocol witness table accessor for type SGDataType and conformance SGDataType(&lazy protocol witness table cache variable for type SGDataType and conformance SGDataType, type metadata accessor for SGDataType);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v8, v5);
    uint64_t v55 = v47;
    uint64_t v22 = 0;
    char v28 = v50 | 0x80;
    uint64_t v26 = v48;
    uint64_t v25 = v49;
    uint64_t v50 = v46;
    uint64_t v51 = v57;
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  LOBYTE(v57) = 1;
  uint64_t v16 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v18 = v17;
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v19 = *(void *)(static BuiltInDefinitionStore.shared + 40);
  long long v20 = *(void **)(static BuiltInDefinitionStore.shared + 48);
  uint64_t v21 = *(void *)(static BuiltInDefinitionStore.shared + 56);
  swift_bridgeObjectRetain();
  specialized OrderedDictionary.subscript.getter(v16, v18, v19, v20, v21, v71);
  swift_bridgeObjectRelease();
  outlined init with take of BuiltInDefinition?((uint64_t)v71, (uint64_t)&v72);
  uint64_t v22 = v73;
  if (!v73)
  {
    _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi4_((uint64_t)v56);
    outlined init with take of SGInternalError.ErrorType(v56, &v57);
    *(void *)&long long v70 = v16;
    *((void *)&v70 + 1) = v18;
    lazy protocol witness table accessor for type SGInternalError and conformance SGInternalError();
LABEL_21:
    unint64_t v3 = (void *)swift_allocError();
    long long v33 = v58;
    *uint64_t v34 = v57;
    v34[1] = v33;
    long long v35 = v62;
    long long v37 = v59;
    long long v36 = v60;
    v34[4] = v61;
    v34[5] = v35;
    uint64_t v34[2] = v37;
    v34[3] = v36;
    long long v38 = v66;
    long long v40 = v63;
    long long v39 = v64;
    v34[8] = v65;
    v34[9] = v38;
    v34[6] = v40;
    v34[7] = v39;
    long long v41 = v70;
    long long v43 = v67;
    long long v42 = v68;
    v34[12] = v69;
    v34[13] = v41;
    v34[10] = v43;
    v34[11] = v42;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v8, v5);
LABEL_8:
    type metadata accessor for SGError();
    id v14 = v3;
    SGError.__allocating_init(_:)(v3);
    swift_willThrow();

    return __swift_destroy_boxed_opaque_existential_1Tm(v9);
  }
  uint64_t v23 = v75;
  uint64_t v54 = v76;
  uint64_t v50 = v77;
  uint64_t v51 = v72;
  long long v24 = v8;
  uint64_t v25 = v74;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v24, v5);
  uint64_t v26 = v23;
  swift_bridgeObjectRelease();
  uint64_t v55 = 0;
  uint64_t v27 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  char v28 = 0;
LABEL_19:
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm(v9);
  uint64_t v30 = v78;
  void *v78 = v51;
  v30[1] = v22;
  v30[2] = v25;
  v30[3] = v26;
  uint64_t v31 = v50;
  v30[4] = v54;
  v30[5] = v31;
  v30[6] = v55;
  v30[7] = v27;
  uint64_t v32 = v52;
  v30[8] = v53;
  v30[9] = v32;
  *((unsigned char *)v30 + 80) = v28;
  return result;
}

unint64_t lazy protocol witness table accessor for type NodeData.CodingKeys and conformance NodeData.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys;
  if (!lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NodeData.CodingKeys and conformance NodeData.CodingKeys);
  }
  return result;
}

void destroy for NodeData(uint64_t a1)
{
}

uint64_t initializeWithCopy for NodeData(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  unsigned __int8 v14 = *(unsigned char *)(a2 + 80);
  outlined copy of NodeData(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(unsigned char *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for NodeData(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  unsigned __int8 v25 = *(unsigned char *)(a2 + 80);
  outlined copy of NodeData(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  unsigned __int8 v14 = *(void **)(a1 + 16);
  char v15 = *(void **)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  unsigned __int8 v22 = *(unsigned char *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(unsigned char *)(a1 + 80) = v25;
  outlined consume of NodeData(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 __swift_memcpy81_16(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for NodeData(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 80);
  long long v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  long long v5 = *(void **)(a1 + 16);
  uint64_t v7 = *(void **)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  unsigned __int8 v14 = *(unsigned char *)(a1 + 80);
  long long v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  long long v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = v3;
  outlined consume of NodeData(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for NodeData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 6 && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 6);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 80) >> 3) & 4 | (*(unsigned __int8 *)(a1 + 80) >> 6)) ^ 7;
  if (v3 >= 5) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for NodeData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 5)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 6;
    if (a3 >= 6) {
      *(unsigned char *)(result + 81) = 1;
    }
  }
  else
  {
    if (a3 >= 6) {
      *(unsigned char *)(result + 81) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)__n128 result = 0u;
      *(unsigned char *)(result + 80) = 32 * (((-a2 & 4) != 0) - 2 * a2);
    }
  }
  return result;
}

uint64_t getEnumTag for NodeData(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80) >> 6;
}

uint64_t destructiveProjectEnumData for NodeData(uint64_t result)
{
  *(unsigned char *)(result + 80) &= 0x3Fu;
  return result;
}

uint64_t destructiveInjectEnumTag for NodeData(uint64_t result, char a2)
{
  *(unsigned char *)(result + 80) = *(unsigned char *)(result + 80) & 0x1F | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for NodeData()
{
  return &type metadata for NodeData;
}

unsigned char *storeEnumTagSinglePayload for NodeData.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25C415914);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NodeData.CodingKeys()
{
  return &type metadata for NodeData.CodingKeys;
}

double _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi5_(uint64_t a1)
{
  *(void *)a1 = 2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(void *)(a1 + 168) = 0x200000000000000;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  return result;
}

double _s11ShaderGraph15SGInternalErrorV0D4TypeOWOi4_(uint64_t a1)
{
  *(void *)a1 = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(void *)(a1 + 168) = 0x200000000000000;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  return result;
}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

uint64_t OrderedSet<>.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  uint64_t v7 = a3;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  type metadata accessor for ContiguousArray();
  swift_getWitnessTable();
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance <> OrderedSet<A>(void *a1, uint64_t a2)
{
  return OrderedSet<>.encode(to:)(a1, a2, *(void *)(v2 + 8));
}

uint64_t OrderedSet<>.init(from:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v32 = a2;
  uint64_t v7 = type metadata accessor for DecodingError.Context();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v4) {
    goto LABEL_8;
  }
  char v28 = v10;
  uint64_t v29 = v8;
  uint64_t v30 = v7;
  __swift_project_boxed_opaque_existential_1(v35, v36);
  uint64_t v12 = type metadata accessor for ContiguousArray();
  uint64_t v37 = v31;
  swift_getWitnessTable();
  dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
  uint64_t v13 = v33[0];
  uint64_t v34 = v33[0];
  uint64_t v14 = specialized default argument 1 of OrderedSet._extractSubset(using:extraCapacity:)();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v16 = static _HashTable.create<A>(untilFirstDuplicateIn:scale:reservedScale:)((char *)v33, (uint64_t)&v34, 0, 1, v14, v12, WitnessTable, a4);
  uint64_t v17 = v33[0];
  if (v33[0] != *(void *)(v13 + 16))
  {
    swift_release();
    __swift_project_boxed_opaque_existential_1(v35, v36);
    dispatch thunk of SingleValueDecodingContainer.codingPath.getter();
    v33[0] = 0;
    v33[1] = 0xE000000000000000;
    _StringGuts.grow(_:)(61);
    v19._id object = (void *)0x800000025C428350;
    v19._uint64_t countAndFlagsBits = 0xD00000000000003ALL;
    String.append(_:)(v19);
    uint64_t v34 = v17;
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v20._uint64_t countAndFlagsBits = 41;
    v20._id object = (void *)0xE100000000000000;
    String.append(_:)(v20);
    uint64_t v21 = v28;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    uint64_t v11 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v23 = v22;
    uint64_t v25 = v29;
    uint64_t v24 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v22, v21, v30);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v23, *MEMORY[0x263F8DCB8], v11);
    swift_willThrow();
    swift_release();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v24);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
LABEL_8:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return v11;
  }
  if (ContiguousArray.count.getter() < 16)
  {
    uint64_t v18 = 0;
  }
  else
  {
    swift_retain();
    uint64_t v18 = v16;
  }
  uint64_t v11 = OrderedSet.init(_uniqueElements:_:)(v13, v18);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v11;
}

uint64_t protocol witness for Decodable.init(from:) in conformance <> OrderedSet<A>@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = OrderedSet<>.init(from:)(a1, *(void *)(a2 + 16), *(void *)(a3 - 8), *(void *)(a2 + 24));
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
  }
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x270EEE188]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x270EEE258]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEF238]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x270EEF250]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x270EEF268]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEF288]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x270EEF830]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t URL.init(fileURLWithPath:relativeTo:)()
{
  return MEMORY[0x270EEFC98]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x270EEFCB0]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t URL.appendingPathExtension(_:)()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x270EEFFC8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return MEMORY[0x270FA2D68]();
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

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x270FA2DF0]();
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

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t SHA512Digest.hash(into:)()
{
  return MEMORY[0x270EEAAC0]();
}

uint64_t type metadata accessor for SHA512Digest()
{
  return MEMORY[0x270EEAAC8]();
}

uint64_t type metadata accessor for SHA512()
{
  return MEMORY[0x270EEB0B0]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x270F9CFB0]();
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

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x270F9D210]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x270F9D320]();
}

uint64_t Character.write<A>(to:)()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t dispatch thunk of BidirectionalCollection.formIndex(before:)()
{
  return MEMORY[0x270F9D410]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t dispatch thunk of MutableCollection.swapAt(_:_:)()
{
  return MEMORY[0x270F9D4B8]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t MutableCollection.swapAt(_:_:)()
{
  return MEMORY[0x270F9D4D8]();
}

uint64_t MutableCollection<>.reverse()()
{
  return MEMORY[0x270F9D4F8]();
}

uint64_t MutableCollection<>.partition(by:)()
{
  return MEMORY[0x270F9D500]();
}

uint64_t MutableCollection<>.sort()()
{
  return MEMORY[0x270F9D508]();
}

uint64_t MutableCollection<>.sort(by:)()
{
  return MEMORY[0x270F9D510]();
}

uint64_t MutableCollection<>.shuffle<A>(using:)()
{
  return MEMORY[0x270F9D518]();
}

uint64_t type metadata accessor for ClosedRange()
{
  return MEMORY[0x270F9D550]();
}

uint64_t ObjectIdentifier.debugDescription.getter()
{
  return MEMORY[0x270F9D568]();
}

uint64_t ObjectIdentifier.hashValue.getter()
{
  return MEMORY[0x270F9D578]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t UnsafeBufferPointer.baseAddress.getter()
{
  return MEMORY[0x270F9D5A0]();
}

uint64_t type metadata accessor for UnsafeBufferPointer()
{
  return MEMORY[0x270F9D5C0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x270F9D600]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x270F9D740]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

{
  MEMORY[0x270F9D798](a1._countAndFlagsBits, a1._object);
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x270F9D7D8]();
  result.value._id object = v1;
  result.value._uint64_t countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D878](a1._countAndFlagsBits, a1._object);
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x270F9D880](a1._countAndFlagsBits, a1._object);
}

Swift::String __swiftcall String.init(repeating:count:)(Swift::String repeating, Swift::Int count)
{
  uint64_t v2 = MEMORY[0x270F9D898](repeating._countAndFlagsBits, repeating._object, count);
  result._id object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

{
  uint64_t v2;
  void *v3;
  Swift::String result;

  uint64_t v2 = MEMORY[0x270F9D8A0](repeating._countAndFlagsBits, repeating._object, count);
  result._id object = v3;
  result._uint64_t countAndFlagsBits = v2;
  return result;
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Sequence.underestimatedCount.getter()
{
  return MEMORY[0x270F9D908]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x270F9D948]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t Sequence.lazy.getter()
{
  return MEMORY[0x270F9D980]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x270F9D990]();
}

uint64_t Sequence.sorted(by:)()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t Sequence.forEach(_:)()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t Sequence<>.elementsEqual<A>(_:)()
{
  return MEMORY[0x270F9DA08]();
}

uint64_t Sequence<>.contains(_:)()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t dispatch thunk of RangeExpression.relative<A>(to:)()
{
  return MEMORY[0x270F9DA60]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x270F9DBD0]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t Array.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x270F9DC18]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x270F9DCA8]();
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

uint64_t Double.description.getter()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t Float.description.getter()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

Swift::Void __swiftcall Set.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t Set.count.getter()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t Set.isEmpty.getter()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t Set.contains(_:)()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t Set.isSubset<A>(of:)()
{
  return MEMORY[0x270F9DFA0]();
}

uint64_t type metadata accessor for Set()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t dispatch thunk of RandomAccessCollection.index(_:offsetBy:)()
{
  return MEMORY[0x270F9E040]();
}

uint64_t dispatch thunk of RandomAccessCollection.distance(from:to:)()
{
  return MEMORY[0x270F9E048]();
}

uint64_t RandomAccessCollection<>.indices.getter()
{
  return MEMORY[0x270F9E070]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection._failEarlyRangeCheck(_:bounds:)()
{
  return MEMORY[0x270F9E090]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.index(after:)()
{
  return MEMORY[0x270F9E0A8]();
}

uint64_t dispatch thunk of Collection.indices.getter()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t Collection.count.getter()
{
  return MEMORY[0x270F9E138]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E178]();
}

uint64_t Collection.subscript.getter()
{
  return MEMORY[0x270F9E1A8]();
}

uint64_t Collection<>.firstIndex(of:)()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.append(_:)()
{
  return MEMORY[0x270F9E218]();
}

Swift::Void __swiftcall RangeReplaceableCollection.removeFirst(_:)(Swift::Int a1)
{
}

uint64_t RangeReplaceableCollection.removeSubrange(_:)()
{
  return MEMORY[0x270F9E250]();
}

uint64_t RangeReplaceableCollection.applying(_:)()
{
  return MEMORY[0x270F9E2B8]();
}

uint64_t RangeReplaceableCollection<>.removeLast()()
{
  return MEMORY[0x270F9E2D8]();
}

uint64_t RangeReplaceableCollection<>.removeLast(_:)()
{
  return MEMORY[0x270F9E2E0]();
}

uint64_t RangeReplaceableCollection<>.removeAll(where:)()
{
  return MEMORY[0x270F9E2F0]();
}

uint64_t dispatch thunk of RangeReplaceableCollection.init()()
{
  return MEMORY[0x270F9E2F8]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x270F9E330]();
}

uint64_t CGColorRef.components.getter()
{
  return MEMORY[0x270EE5820]();
}

uint64_t NSEnumerator.makeIterator()()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t NSFileManager.enumerator(at:includingPropertiesForKeys:options:errorHandler:)()
{
  return MEMORY[0x270EF1EE8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
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

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270FA1170](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x270FA1180]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x270FA1190]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t UnsafeMutablePointer.initialize(from:count:)()
{
  return MEMORY[0x270F9E360]();
}

uint64_t UnsafeMutablePointer.move()()
{
  return MEMORY[0x270F9E388]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t Optional<A>.hash(into:)()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t UnsafeMutableBufferPointer.baseAddress.getter()
{
  return MEMORY[0x270F9E400]();
}

Swift::Void __swiftcall UnsafeMutableBufferPointer.swapAt(_:_:)(Swift::Int a1, Swift::Int a2)
{
}

uint64_t UnsafeMutableBufferPointer.endIndex.getter()
{
  return MEMORY[0x270F9E438]();
}

uint64_t type metadata accessor for UnsafeMutableBufferPointer()
{
  return MEMORY[0x270F9E450]();
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

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t StringProtocol.capitalized.getter()
{
  return MEMORY[0x270EF2410]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x270EF2478]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return MEMORY[0x270EF2560]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t ArraySlice.startIndex.getter()
{
  return MEMORY[0x270F9E6C0]();
}

uint64_t ArraySlice.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x270F9E6D8]();
}

Swift::Bool __swiftcall ArraySlice._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x270F9E6E0]();
}

uint64_t ArraySlice.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9E6F0]();
}

uint64_t ArraySlice.endIndex.getter()
{
  return MEMORY[0x270F9E700]();
}

uint64_t type metadata accessor for ArraySlice()
{
  return MEMORY[0x270F9E708]();
}

uint64_t ArraySlice.subscript.getter()
{
  return MEMORY[0x270F9E720]();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return MEMORY[0x270F9E740]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x270F9E800]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x270F9E818]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x270F9E848]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x270F9E858]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x270F9E870]();
}

uint64_t __CocoaSet.contains(_:)()
{
  return MEMORY[0x270F9E878]();
}

uint64_t debugPrint<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x270F9E8A8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x270F9E968]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t type metadata accessor for LazySequence()
{
  return MEMORY[0x270F9E9E0]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError.Context()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _ArrayProtocol.filter(_:)()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t ContiguousArray.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9EBA0]();
}

uint64_t ContiguousArray.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9EBA8]();
}

uint64_t ContiguousArray._copyToContiguousArray()()
{
  return MEMORY[0x270F9EBB0]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t ContiguousArray.init(arrayLiteral:)()
{
  return MEMORY[0x270F9EBC8]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EBE8]();
}

Swift::Void __swiftcall ContiguousArray._makeMutableAndUnique()()
{
}

uint64_t ContiguousArray.withUnsafeBufferPointer<A>(_:)()
{
  return MEMORY[0x270F9EBF8]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t ContiguousArray.count.getter()
{
  return MEMORY[0x270F9EC18]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t ContiguousArray.insert(_:at:)()
{
  return MEMORY[0x270F9EC50]();
}

uint64_t ContiguousArray.remove(at:)()
{
  return MEMORY[0x270F9EC58]();
}

Swift::Void __swiftcall ContiguousArray.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t ContiguousArray.init<A>(_:)()
{
  return MEMORY[0x270F9ECA0]();
}

uint64_t ContiguousArray.subscript.getter()
{
  return MEMORY[0x270F9ECA8]();
}

{
  return MEMORY[0x270F9ECB8]();
}

uint64_t ContiguousArray.subscript.modify()
{
  return MEMORY[0x270F9ECB0]();
}

uint64_t type metadata accessor for LazyMapSequence()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t type metadata accessor for PartialRangeFrom()
{
  return MEMORY[0x270F9EDA8]();
}

uint64_t type metadata accessor for PartialRangeUpTo()
{
  return MEMORY[0x270F9EDB0]();
}

uint64_t static FixedWidthInteger.random<A>(in:using:)()
{
  return MEMORY[0x270F9EE90]();
}

Swift::Void __swiftcall _NativeDictionary.removeAll(isUnique:)(Swift::Bool isUnique)
{
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x270F9F088]();
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

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t type metadata accessor for CollectionDifference.Change()
{
  return MEMORY[0x270F9F108]();
}

uint64_t type metadata accessor for CollectionDifference()
{
  return MEMORY[0x270F9F118]();
}

uint64_t CollectionDifference.init<A>(_:)()
{
  return MEMORY[0x270F9F128]();
}

uint64_t LazySequenceProtocol.map<A>(_:)()
{
  return MEMORY[0x270F9F148]();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F300]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F330]();
}

{
  return MEMORY[0x270F9F340]();
}

{
  return MEMORY[0x270F9F348]();
}

{
  return MEMORY[0x270F9F350]();
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

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F440]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F470]();
}

{
  return MEMORY[0x270F9F480]();
}

{
  return MEMORY[0x270F9F488]();
}

{
  return MEMORY[0x270F9F490]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9F4C0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x270F9F4C8](a1);
}

uint64_t _writeBackMutableSlice<A, B>(_:bounds:slice:)()
{
  return MEMORY[0x270F9F4D8]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F518]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.currentIndex.getter()
{
  return MEMORY[0x270F9F520]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x270F9F578]();
}

uint64_t dispatch thunk of UnkeyedDecodingContainer.isAtEnd.getter()
{
  return MEMORY[0x270F9F5A0]();
}

uint64_t dispatch thunk of UnkeyedEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F658]();
}

uint64_t dispatch thunk of LosslessStringConvertible.init(_:)()
{
  return MEMORY[0x270F9F758]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

{
  return MEMORY[0x270F9F778]();
}

uint64_t _forceBridgeFromObjectiveC<A>(_:_:)()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F7E0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x270F9F818]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F878]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x270F9F920]();
}

uint64_t SIMD.description.getter()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t SIMD.init<A>(_:)()
{
  return MEMORY[0x270F9FAF8]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t type metadata accessor for Slice()
{
  return MEMORY[0x270F9FBD8]();
}

uint64_t print<A>(_:separator:terminator:to:)()
{
  return MEMORY[0x270F9FC20]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x270F9FC88]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t type metadata accessor for Mirror.DisplayStyle()
{
  return MEMORY[0x270F9FCB8]();
}

uint64_t type metadata accessor for Mirror.AncestorRepresentation()
{
  return MEMORY[0x270F9FCC8]();
}

uint64_t Mirror.init<A, B>(_:unlabeledChildren:displayStyle:ancestorRepresentation:)()
{
  return MEMORY[0x270F9FCE0]();
}

uint64_t dispatch thunk of Decoder.unkeyedContainer()()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.unkeyedContainer()()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t Float16.description.getter()
{
  return MEMORY[0x270F9FDA0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5C38](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

void bzero(void *a1, size_t a2)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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