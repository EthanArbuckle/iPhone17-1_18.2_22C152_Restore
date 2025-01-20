unint64_t PhoneRingsModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result;

  result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      result = 0xD000000000000012;
      break;
    case 2:
      result = 0x6C616F4765766F6DLL;
      break;
    case 3:
      result = 0x61746F5465766F6DLL;
      break;
    case 4:
      result = 0x616F47646E617473;
      break;
    case 5:
      result = 0x746F54646E617473;
      break;
    case 6:
      result = 0x6573696372657865;
      break;
    case 7:
      result = 0xD000000000000012;
      break;
    case 9:
      result = 0x6562614C65766F6DLL;
      break;
    case 10:
      result = 0x756C615665766F6DLL;
      break;
    case 11:
      result = 0x74696E5565766F6DLL;
      break;
    case 12:
      result = 0x62614C646E617473;
      break;
    case 13:
      result = 0x6C6156646E617473;
      break;
    case 14:
      result = 0x696E55646E617473;
      break;
    case 15:
      result = 0x457472616D537369;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance PhoneRingsModel.CodingKeys()
{
  return PhoneRingsModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PhoneRingsModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PhoneRingsModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PhoneRingsModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PhoneRingsModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PhoneRingsModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PhoneRingsModel.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 16);
  int v31 = *(unsigned __int8 *)(v1 + 24);
  uint64_t v28 = *(void *)(v1 + 32);
  uint64_t v29 = v7;
  int v27 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v26 = *(void *)(v1 + 48);
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 56);
  uint64_t v23 = *(void *)(v1 + 64);
  int v24 = *(unsigned __int8 *)(v1 + 72);
  int v25 = v7;
  uint64_t v8 = *(void *)(v1 + 80);
  int v22 = *(unsigned __int8 *)(v1 + 88);
  uint64_t v9 = *(void *)(v1 + 96);
  v21[17] = *(void *)(v1 + 104);
  v21[18] = v8;
  uint64_t v10 = *(void *)(v1 + 112);
  v21[15] = *(void *)(v1 + 120);
  v21[16] = v9;
  uint64_t v11 = *(void *)(v1 + 128);
  v21[13] = *(void *)(v1 + 136);
  v21[14] = v10;
  uint64_t v12 = *(void *)(v1 + 144);
  v21[11] = *(void *)(v1 + 152);
  v21[12] = v11;
  uint64_t v13 = *(void *)(v1 + 160);
  v21[9] = *(void *)(v1 + 168);
  v21[10] = v12;
  v21[6] = *(void *)(v1 + 176);
  v21[7] = *(void *)(v1 + 184);
  v21[8] = v13;
  v21[4] = *(void *)(v1 + 192);
  v21[5] = *(void *)(v1 + 200);
  v21[2] = *(void *)(v1 + 208);
  v21[3] = *(void *)(v1 + 216);
  v21[0] = *(void *)(v1 + 224);
  v21[1] = *(void *)(v1 + 232);
  int v14 = *(unsigned __int8 *)(v1 + 240);
  uint64_t v15 = a1[3];
  v16 = a1;
  uint64_t v18 = v17;
  __swift_project_boxed_opaque_existential_1(v16, v15);
  lazy protocol witness table accessor for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v32 = 0;
  uint64_t v19 = v30;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v19)
  {
    LODWORD(v30) = v14;
    char v32 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 9;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 10;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 11;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 12;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 13;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 14;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    char v32 = 15;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v18);
}

unint64_t lazy protocol witness table accessor for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys);
  }
  return result;
}

uint64_t PhoneRingsModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PhoneRingsModel.CodingKeys>);
  uint64_t v5 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v160 = 1;
  char v158 = 1;
  char v156 = 1;
  char v154 = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PhoneRingsModel.CodingKeys and conformance PhoneRingsModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v97 = a1;
  if (v2)
  {
    uint64_t v165 = v2;
    uint64_t v98 = 0;
LABEL_4:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v97);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v95 = v5;
  LOBYTE(v115) = 0;
  uint64_t v8 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  char v164 = v9 & 1;
  LOBYTE(v115) = 1;
  int v10 = v9;
  uint64_t v11 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v93 = v10;
  uint64_t v94 = v11;
  char v162 = v12 & 1;
  LOBYTE(v115) = 2;
  int v13 = v12;
  uint64_t v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v91 = v13;
  uint64_t v92 = v14;
  char v160 = v15 & 1;
  LOBYTE(v115) = 3;
  int v16 = v15;
  uint64_t v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v89 = v16;
  uint64_t v90 = v17;
  char v158 = v18 & 1;
  LOBYTE(v115) = 4;
  int v19 = v18;
  uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v87 = v19;
  uint64_t v88 = v20;
  char v156 = v21 & 1;
  LOBYTE(v115) = 5;
  int v22 = v21;
  uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v85 = v22;
  uint64_t v86 = v23;
  char v154 = v24 & 1;
  LOBYTE(v115) = 6;
  int v25 = v24;
  uint64_t v26 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v29 = v28;
  int v83 = v25;
  uint64_t v84 = v26;
  LOBYTE(v115) = 7;
  swift_bridgeObjectRetain();
  uint64_t v81 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v82 = v29;
  LOBYTE(v115) = 8;
  uint64_t v31 = v30;
  swift_bridgeObjectRetain();
  uint64_t v32 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v165 = 0;
  uint64_t v34 = v32;
  uint64_t v79 = v33;
  uint64_t v80 = v31;
  LOBYTE(v115) = 9;
  swift_bridgeObjectRetain();
  uint64_t v35 = v165;
  uint64_t v36 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v78 = v37;
  uint64_t v165 = v35;
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = 0;
    goto LABEL_4;
  }
  uint64_t v38 = v36;
  LOBYTE(v115) = 10;
  swift_bridgeObjectRetain();
  uint64_t v39 = v165;
  uint64_t v40 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v77 = v41;
  uint64_t v165 = v39;
  if (v39)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = 0;
    goto LABEL_4;
  }
  uint64_t v42 = v40;
  LOBYTE(v115) = 11;
  swift_bridgeObjectRetain();
  uint64_t v43 = v165;
  *(void *)&long long v76 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  *((void *)&v76 + 1) = v44;
  uint64_t v165 = v43;
  if (v43)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = 0;
    goto LABEL_4;
  }
  LOBYTE(v115) = 12;
  swift_bridgeObjectRetain();
  uint64_t v45 = v165;
  *(void *)&long long v75 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  *((void *)&v75 + 1) = v46;
  uint64_t v165 = v45;
  if (v45)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = 0;
    goto LABEL_4;
  }
  LOBYTE(v115) = 13;
  swift_bridgeObjectRetain();
  uint64_t v47 = v165;
  *(void *)&long long v74 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  *((void *)&v74 + 1) = v48;
  uint64_t v165 = v47;
  if (v47)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = 0;
    goto LABEL_4;
  }
  LOBYTE(v115) = 14;
  swift_bridgeObjectRetain();
  uint64_t v49 = v165;
  uint64_t v73 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v98 = v50;
  uint64_t v165 = v49;
  if (v49)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v98 = 0;
    goto LABEL_4;
  }
  char v152 = 15;
  swift_bridgeObjectRetain();
  uint64_t v51 = v165;
  char v52 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v165 = v51;
  if (v51)
  {
    (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  char v53 = v52;
  (*(void (**)(char *, uint64_t))(v95 + 8))(v7, v96);
  LODWORD(v96) = v53 & 1;
  uint64_t v69 = v8;
  *(void *)&long long v99 = v8;
  BYTE8(v99) = v93 & 1;
  *(void *)&long long v100 = v94;
  BYTE8(v100) = v91 & 1;
  *(void *)&long long v101 = v92;
  BYTE8(v101) = v89 & 1;
  *(void *)&long long v102 = v90;
  BYTE8(v102) = v87 & 1;
  *(void *)&long long v103 = v88;
  BYTE8(v103) = v85 & 1;
  *(void *)&long long v104 = v86;
  BYTE8(v104) = v83 & 1;
  *(void *)&long long v105 = v84;
  *((void *)&v105 + 1) = v82;
  *(void *)&long long v106 = v81;
  *((void *)&v106 + 1) = v80;
  uint64_t v71 = v38;
  uint64_t v72 = v34;
  uint64_t v54 = v78;
  *(void *)&long long v107 = v34;
  *((void *)&v107 + 1) = v79;
  *(void *)&long long v108 = v38;
  *((void *)&v108 + 1) = v78;
  uint64_t v70 = v42;
  uint64_t v55 = *((void *)&v76 + 1);
  uint64_t v56 = v77;
  *(void *)&long long v109 = v42;
  *((void *)&v109 + 1) = v77;
  uint64_t v57 = *((void *)&v75 + 1);
  long long v110 = v76;
  long long v111 = v75;
  long long v112 = v74;
  uint64_t v58 = v98;
  *(void *)&long long v113 = v73;
  *((void *)&v113 + 1) = v98;
  char v114 = v53 & 1;
  outlined retain of PhoneRingsModel((uint64_t)&v99);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v59 = v79;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v60 = *((void *)&v74 + 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v61 = v112;
  *(_OWORD *)(a2 + 192) = v111;
  *(_OWORD *)(a2 + 208) = v61;
  *(_OWORD *)(a2 + 224) = v113;
  *(unsigned char *)(a2 + 240) = v114;
  long long v62 = v108;
  *(_OWORD *)(a2 + 128) = v107;
  *(_OWORD *)(a2 + 144) = v62;
  long long v63 = v110;
  *(_OWORD *)(a2 + 160) = v109;
  *(_OWORD *)(a2 + 176) = v63;
  long long v64 = v104;
  *(_OWORD *)(a2 + 64) = v103;
  *(_OWORD *)(a2 + 80) = v64;
  long long v65 = v106;
  *(_OWORD *)(a2 + 96) = v105;
  *(_OWORD *)(a2 + 112) = v65;
  long long v66 = v100;
  *(_OWORD *)a2 = v99;
  *(_OWORD *)(a2 + 16) = v66;
  long long v67 = v102;
  *(_OWORD *)(a2 + 32) = v101;
  *(_OWORD *)(a2 + 48) = v67;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v97);
  uint64_t v115 = v69;
  char v116 = v164;
  *(_DWORD *)v117 = *(_DWORD *)v163;
  *(_DWORD *)&v117[3] = *(_DWORD *)&v163[3];
  uint64_t v118 = v94;
  char v119 = v162;
  *(_DWORD *)v120 = *(_DWORD *)v161;
  *(_DWORD *)&v120[3] = *(_DWORD *)&v161[3];
  uint64_t v121 = v92;
  char v122 = v160;
  *(_DWORD *)&v123[3] = *(_DWORD *)&v159[3];
  *(_DWORD *)v123 = *(_DWORD *)v159;
  uint64_t v124 = v90;
  char v125 = v158;
  *(_DWORD *)v126 = *(_DWORD *)v157;
  *(_DWORD *)&v126[3] = *(_DWORD *)&v157[3];
  uint64_t v127 = v88;
  char v128 = v156;
  *(_DWORD *)v129 = *(_DWORD *)v155;
  *(_DWORD *)&v129[3] = *(_DWORD *)&v155[3];
  uint64_t v130 = v86;
  char v131 = v154;
  *(_DWORD *)&v132[3] = *(_DWORD *)&v153[3];
  *(_DWORD *)v132 = *(_DWORD *)v153;
  uint64_t v133 = v84;
  uint64_t v134 = v82;
  uint64_t v135 = v81;
  uint64_t v136 = v80;
  uint64_t v137 = v72;
  uint64_t v138 = v59;
  uint64_t v139 = v71;
  uint64_t v140 = v54;
  uint64_t v141 = v70;
  uint64_t v142 = v56;
  uint64_t v143 = v76;
  uint64_t v144 = v55;
  uint64_t v145 = v75;
  uint64_t v146 = v57;
  uint64_t v147 = v74;
  uint64_t v148 = v60;
  uint64_t v149 = v73;
  uint64_t v150 = v58;
  char v151 = v96;
  return outlined release of PhoneRingsModel((uint64_t)&v115);
}

uint64_t protocol witness for Decodable.init(from:) in conformance PhoneRingsModel@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PhoneRingsModel.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PhoneRingsModel(void *a1)
{
  return PhoneRingsModel.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PhoneRingsModel()
{
  return &type metadata for PhoneRingsModel;
}

unsigned char *storeEnumTagSinglePayload for PhoneRingsModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 15 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 15) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF0)
  {
    unsigned int v6 = ((a2 - 241) >> 8) + 1;
    *unint64_t result = a2 + 15;
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
        JUMPOUT(0x261873A68);
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
          *unint64_t result = a2 + 15;
        break;
    }
  }
  return result;
}

void *type metadata accessor for PhoneRingsModel.CodingKeys()
{
  return &unk_270D87CC0;
}

uint64_t specialized PhoneRingsModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x8000000261883BE0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000261883C00 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C616F4765766F6DLL && a2 == 0xED000065756C6156 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x61746F5465766F6DLL && a2 == 0xEE0065756C61566CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x616F47646E617473 && a2 == 0xEE0065756C61566CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x746F54646E617473 && a2 == 0xEF65756C61566C61 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6573696372657865 && a2 == 0xED00006C6562614CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000261884180 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002618841A0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6562614C65766F6DLL && a2 == 0xE90000000000006CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x756C615665766F6DLL && a2 == 0xEE006C6562614C65 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x74696E5565766F6DLL && a2 == 0xED00006C6562614CLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x62614C646E617473 && a2 == 0xEA00000000006C65 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6C6156646E617473 && a2 == 0xEF6C6562614C6575 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x696E55646E617473 && a2 == 0xEE006C6562614C74 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x457472616D537369 && a2 == 0xEE0064656C62616ELL)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 15;
    }
    else {
      return 16;
    }
  }
}

uint64_t WellnessUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t WellnessUIPlugin.init()()
{
  return v0;
}

uint64_t WellnessUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  return specialized WellnessUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t WellnessUIPlugin.deinit()
{
  return v0;
}

uint64_t WellnessUIPlugin.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t protocol witness for SnippetProviding.init() in conformance WellnessUIPlugin@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t protocol witness for SnippetProviding.snippet(for:mode:idiom:) in conformance WellnessUIPlugin(uint64_t a1)
{
  return specialized WellnessUIPlugin.snippet(for:mode:idiom:)(a1);
}

uint64_t specialized WellnessUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  uint64_t v202 = a1;
  uint64_t Snippet = type metadata accessor for TemperatureQuerySnippet();
  MEMORY[0x270FA5388](Snippet);
  uint64_t v200 = (uint64_t)&v159 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Model = type metadata accessor for TemperatureQueryModel();
  MEMORY[0x270FA5388](Model - 8);
  uint64_t v199 = (uint64_t)&v159 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = type metadata accessor for SpecificMedCompletedLogSnippet();
  MEMORY[0x270FA5388](v198);
  uint64_t v197 = (uint64_t)&v159 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SpecificMedCompletedLogModel();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v192 = (uint64_t)&v159 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v194 = (uint64_t)&v159 - v8;
  uint64_t v196 = type metadata accessor for SleepQuerySnippet();
  MEMORY[0x270FA5388](v196);
  uint64_t v195 = (uint64_t)&v159 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SleepQueryModel();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v193 = (uint64_t)&v159 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v190 = type metadata accessor for SingleActivitySummarySnippet();
  MEMORY[0x270FA5388](v190);
  uint64_t v189 = (uint64_t)&v159 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for SingleActivitySummaryModel();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v187 = (uint64_t)&v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = type metadata accessor for PhoneRingsSnippet();
  uint64_t v15 = MEMORY[0x270FA5388](v191);
  v186 = (uint64_t *)((char *)&v159 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  uint64_t v188 = (uint64_t)&v159 - v17;
  uint64_t v185 = type metadata accessor for HeightQuerySnippet();
  MEMORY[0x270FA5388](v185);
  uint64_t v184 = (uint64_t)&v159 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for HeightQueryModel();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v181 = (uint64_t)&v159 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = type metadata accessor for HealthDataLogSnippet();
  uint64_t v21 = MEMORY[0x270FA5388](v183);
  v180 = (char *)&v159 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v182 = (uint64_t)&v159 - v23;
  uint64_t v24 = type metadata accessor for HealthDataLogModel();
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  uint64_t v178 = (uint64_t)&v159 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v179 = (char *)&v159 - v27;
  uint64_t v177 = type metadata accessor for GenericQuerySnippet();
  MEMORY[0x270FA5388](v177);
  uint64_t v176 = (uint64_t)&v159 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for GenericQueryModel();
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v175 = (uint64_t)&v159 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = type metadata accessor for GenericMedCompletedLogSnippet();
  MEMORY[0x270FA5388](v174);
  uint64_t v173 = (uint64_t)&v159 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for GenericMedCompletedLogModel();
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  uint64_t v168 = (uint64_t)&v159 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v172 = (uint64_t)&v159 - v35;
  uint64_t v169 = type metadata accessor for GenericButtonSnippet();
  MEMORY[0x270FA5388](v169);
  v167 = (char *)&v159 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = type metadata accessor for GenericButtonModel();
  MEMORY[0x270FA5388](v37 - 8);
  uint64_t v165 = (uint64_t)&v159 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = type metadata accessor for CycleTrackingLogSnippet();
  MEMORY[0x270FA5388](v171);
  uint64_t v170 = (uint64_t)&v159 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for CycleTrackingLogModel();
  MEMORY[0x270FA5388](v40 - 8);
  uint64_t v166 = (uint64_t)&v159 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = type metadata accessor for BloodPressureQuerySnippet();
  MEMORY[0x270FA5388](v164);
  uint64_t v163 = (uint64_t)&v159 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for BloodPressureQueryModel();
  MEMORY[0x270FA5388](v43 - 8);
  uint64_t v160 = (uint64_t)&v159 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = type metadata accessor for BloodPressureLogSnippet();
  uint64_t v45 = MEMORY[0x270FA5388](v162);
  uint64_t v47 = (char *)&v159 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v45);
  uint64_t v161 = (uint64_t)&v159 - v48;
  uint64_t v49 = type metadata accessor for BloodPressureLogModel();
  uint64_t v50 = MEMORY[0x270FA5388](v49 - 8);
  char v52 = (char *)&v159 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v50);
  uint64_t v54 = (char *)&v159 - v53;
  uint64_t v55 = type metadata accessor for OxygenSaturationQuerySnippet();
  MEMORY[0x270FA5388](v55);
  uint64_t v57 = (char *)&v159 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for OxygenSaturationQueryModel();
  MEMORY[0x270FA5388](v58 - 8);
  uint64_t v60 = (char *)&v159 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for WellnessSnippets();
  MEMORY[0x270FA5388](v61);
  long long v63 = (char *)&v159 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of WellnessSnippets(v202, (uint64_t)v63, (uint64_t (*)(void))type metadata accessor for WellnessSnippets);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v68 = v160;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v160, (uint64_t (*)(void))type metadata accessor for BloodPressureQueryModel);
      uint64_t v69 = v163;
      outlined init with copy of WellnessSnippets(v68, v163, (uint64_t (*)(void))type metadata accessor for BloodPressureQueryModel);
      uint64_t v70 = (uint64_t *)(v69 + *(int *)(v164 + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *uint64_t v70 = EnvironmentObject.init()();
      v70[1] = v71;
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type BloodPressureQuerySnippet and conformance BloodPressureQuerySnippet, (void (*)(uint64_t))type metadata accessor for BloodPressureQuerySnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v69, (uint64_t (*)(void))type metadata accessor for BloodPressureQuerySnippet);
      uint64_t v72 = type metadata accessor for BloodPressureQueryModel;
      goto LABEL_19;
    case 2u:
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, (uint64_t)v54, (uint64_t (*)(void))type metadata accessor for BloodPressureLogModel);
      outlined init with copy of WellnessSnippets((uint64_t)v54, (uint64_t)v52, (uint64_t (*)(void))type metadata accessor for BloodPressureLogModel);
      uint64_t v73 = v162;
      long long v74 = (uint64_t *)&v47[*(int *)(v162 + 20)];
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *long long v74 = EnvironmentObject.init()();
      v74[1] = v75;
      long long v76 = (uint64_t *)&v47[*(int *)(v73 + 24)];
      *long long v76 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
      swift_storeEnumTagMultiPayload();
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v52, (uint64_t)v47, (uint64_t (*)(void))type metadata accessor for BloodPressureLogModel);
      uint64_t v77 = v161;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v47, v161, (uint64_t (*)(void))type metadata accessor for BloodPressureLogSnippet);
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type BloodPressureLogSnippet and conformance BloodPressureLogSnippet, (void (*)(uint64_t))type metadata accessor for BloodPressureLogSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v77, (uint64_t (*)(void))type metadata accessor for BloodPressureLogSnippet);
      uint64_t v78 = type metadata accessor for BloodPressureLogModel;
      uint64_t v79 = (uint64_t)v54;
      goto LABEL_20;
    case 3u:
      uint64_t v68 = v166;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v166, (uint64_t (*)(void))type metadata accessor for CycleTrackingLogModel);
      uint64_t v80 = v170;
      outlined init with copy of WellnessSnippets(v68, v170, (uint64_t (*)(void))type metadata accessor for CycleTrackingLogModel);
      uint64_t v81 = v171;
      uint64_t v82 = (uint64_t *)(v80 + *(int *)(v171 + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *uint64_t v82 = EnvironmentObject.init()();
      v82[1] = v83;
      uint64_t v84 = (uint64_t *)(v80 + *(int *)(v81 + 24));
      *uint64_t v84 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
      swift_storeEnumTagMultiPayload();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type CycleTrackingLogSnippet and conformance CycleTrackingLogSnippet, (void (*)(uint64_t))type metadata accessor for CycleTrackingLogSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v80, (uint64_t (*)(void))type metadata accessor for CycleTrackingLogSnippet);
      uint64_t v72 = type metadata accessor for CycleTrackingLogModel;
      goto LABEL_19;
    case 4u:
      uint64_t v85 = v165;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v165, (uint64_t (*)(void))type metadata accessor for GenericButtonModel);
      uint64_t v86 = (uint64_t)v167;
      outlined init with copy of WellnessSnippets(v85, (uint64_t)&v167[*(int *)(v169 + 20)], (uint64_t (*)(void))type metadata accessor for GenericButtonModel);
      ActionHandler.init()();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type GenericButtonSnippet and conformance GenericButtonSnippet, (void (*)(uint64_t))type metadata accessor for GenericButtonSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v86, (uint64_t (*)(void))type metadata accessor for GenericButtonSnippet);
      uint64_t v78 = type metadata accessor for GenericButtonModel;
      uint64_t v79 = v85;
      goto LABEL_20;
    case 5u:
      uint64_t v87 = *(void *)v63;
      uint64_t v88 = *((void *)v63 + 1);
      uint64_t v90 = *((void *)v63 + 2);
      uint64_t v89 = *((void *)v63 + 3);
      uint64_t v92 = *((void *)v63 + 4);
      uint64_t v91 = *((void *)v63 + 5);
      LODWORD(v202) = v63[48];
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      int v93 = (void *)EnvironmentObject.init()();
      *(void *)&long long v203 = v87;
      *((void *)&v203 + 1) = v88;
      *(void *)&long long v204 = v90;
      *((void *)&v204 + 1) = v89;
      *(void *)&long long v205 = v92;
      *((void *)&v205 + 1) = v91;
      LOBYTE(v206) = v202;
      *((void *)&v206 + 1) = v93;
      *(void *)&long long v207 = v94;
      lazy protocol witness table accessor for type GenericBinaryButtonSnippet and conformance GenericBinaryButtonSnippet();
      uint64_t v66 = View.eraseToAnyView()();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return v66;
    case 6u:
      uint64_t v95 = (uint64_t)v63;
      uint64_t v96 = v172;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1(v95, v172, (uint64_t (*)(void))type metadata accessor for GenericMedCompletedLogModel);
      uint64_t v97 = v168;
      outlined init with copy of WellnessSnippets(v96, v168, (uint64_t (*)(void))type metadata accessor for GenericMedCompletedLogModel);
      uint64_t v98 = v173;
      GenericMedCompletedLogSnippet.init(model:)(v97, v173);
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type GenericMedCompletedLogSnippet and conformance GenericMedCompletedLogSnippet, (void (*)(uint64_t))type metadata accessor for GenericMedCompletedLogSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v98, (uint64_t (*)(void))type metadata accessor for GenericMedCompletedLogSnippet);
      long long v99 = type metadata accessor for GenericMedCompletedLogModel;
      goto LABEL_17;
    case 7u:
      uint64_t v60 = v179;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, (uint64_t)v179, (uint64_t (*)(void))type metadata accessor for HealthDataLogModel);
      uint64_t v100 = v178;
      outlined init with copy of WellnessSnippets((uint64_t)v60, v178, (uint64_t (*)(void))type metadata accessor for HealthDataLogModel);
      uint64_t v101 = v183;
      uint64_t v102 = (uint64_t)v180;
      long long v103 = (uint64_t *)&v180[*(int *)(v183 + 20)];
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *long long v103 = EnvironmentObject.init()();
      v103[1] = v104;
      long long v105 = (uint64_t *)(v102 + *(int *)(v101 + 24));
      *long long v105 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
      swift_storeEnumTagMultiPayload();
      _s10WellnessUI21TemperatureQueryModelVWObTm_1(v100, v102, (uint64_t (*)(void))type metadata accessor for HealthDataLogModel);
      uint64_t v106 = v182;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1(v102, v182, (uint64_t (*)(void))type metadata accessor for HealthDataLogSnippet);
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type HealthDataLogSnippet and conformance HealthDataLogSnippet, (void (*)(uint64_t))type metadata accessor for HealthDataLogSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v106, (uint64_t (*)(void))type metadata accessor for HealthDataLogSnippet);
      long long v67 = type metadata accessor for HealthDataLogModel;
      goto LABEL_10;
    case 8u:
      uint64_t v68 = v175;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v175, (uint64_t (*)(void))type metadata accessor for GenericQueryModel);
      uint64_t v107 = v176;
      outlined init with copy of WellnessSnippets(v68, v176, (uint64_t (*)(void))type metadata accessor for GenericQueryModel);
      long long v108 = (uint64_t *)(v107 + *(int *)(v177 + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *long long v108 = EnvironmentObject.init()();
      v108[1] = v109;
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type GenericQuerySnippet and conformance GenericQuerySnippet, (void (*)(uint64_t))type metadata accessor for GenericQuerySnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v107, (uint64_t (*)(void))type metadata accessor for GenericQuerySnippet);
      uint64_t v72 = type metadata accessor for GenericQueryModel;
      goto LABEL_19;
    case 9u:
      uint64_t v68 = v181;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v181, (uint64_t (*)(void))type metadata accessor for HeightQueryModel);
      uint64_t v110 = v184;
      outlined init with copy of WellnessSnippets(v68, v184, (uint64_t (*)(void))type metadata accessor for HeightQueryModel);
      long long v111 = (uint64_t *)(v110 + *(int *)(v185 + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *long long v111 = EnvironmentObject.init()();
      v111[1] = v112;
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type HeightQuerySnippet and conformance HeightQuerySnippet, (void (*)(uint64_t))type metadata accessor for HeightQuerySnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v110, (uint64_t (*)(void))type metadata accessor for HeightQuerySnippet);
      uint64_t v72 = type metadata accessor for HeightQueryModel;
      goto LABEL_19;
    case 0xAu:
      long long v113 = *((_OWORD *)v63 + 13);
      long long v215 = *((_OWORD *)v63 + 12);
      long long v216 = v113;
      long long v217 = *((_OWORD *)v63 + 14);
      char v218 = v63[240];
      long long v114 = *((_OWORD *)v63 + 9);
      long long v211 = *((_OWORD *)v63 + 8);
      long long v212 = v114;
      long long v115 = *((_OWORD *)v63 + 11);
      long long v213 = *((_OWORD *)v63 + 10);
      long long v214 = v115;
      long long v116 = *((_OWORD *)v63 + 5);
      long long v207 = *((_OWORD *)v63 + 4);
      long long v208 = v116;
      long long v117 = *((_OWORD *)v63 + 7);
      long long v209 = *((_OWORD *)v63 + 6);
      long long v210 = v117;
      long long v118 = *((_OWORD *)v63 + 1);
      long long v203 = *(_OWORD *)v63;
      long long v204 = v118;
      long long v119 = *((_OWORD *)v63 + 3);
      long long v205 = *((_OWORD *)v63 + 2);
      long long v206 = v119;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v121 = v186;
      uint64_t *v186 = KeyPath;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<DynamicTypeSize>.Content);
      swift_storeEnumTagMultiPayload();
      char v122 = (char *)v121 + *(int *)(v191 + 20);
      long long v123 = v216;
      *((_OWORD *)v122 + 12) = v215;
      *((_OWORD *)v122 + 13) = v123;
      *((_OWORD *)v122 + 14) = v217;
      v122[240] = v218;
      long long v124 = v212;
      *((_OWORD *)v122 + 8) = v211;
      *((_OWORD *)v122 + 9) = v124;
      long long v125 = v214;
      *((_OWORD *)v122 + 10) = v213;
      *((_OWORD *)v122 + 11) = v125;
      long long v126 = v208;
      *((_OWORD *)v122 + 4) = v207;
      *((_OWORD *)v122 + 5) = v126;
      long long v127 = v210;
      *((_OWORD *)v122 + 6) = v209;
      *((_OWORD *)v122 + 7) = v127;
      long long v128 = v204;
      *(_OWORD *)char v122 = v203;
      *((_OWORD *)v122 + 1) = v128;
      long long v129 = v206;
      *((_OWORD *)v122 + 2) = v205;
      *((_OWORD *)v122 + 3) = v129;
      uint64_t v130 = (uint64_t)v121;
      uint64_t v96 = v188;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1(v130, v188, (uint64_t (*)(void))type metadata accessor for PhoneRingsSnippet);
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type PhoneRingsSnippet and conformance PhoneRingsSnippet, (void (*)(uint64_t))type metadata accessor for PhoneRingsSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      long long v99 = type metadata accessor for PhoneRingsSnippet;
      goto LABEL_17;
    case 0xBu:
      uint64_t v68 = v187;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v187, (uint64_t (*)(void))type metadata accessor for SingleActivitySummaryModel);
      uint64_t v131 = v189;
      outlined init with copy of WellnessSnippets(v68, v189, (uint64_t (*)(void))type metadata accessor for SingleActivitySummaryModel);
      uint64_t v132 = v190;
      uint64_t v133 = (uint64_t *)(v131 + *(int *)(v190 + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *uint64_t v133 = EnvironmentObject.init()();
      v133[1] = v134;
      uint64_t v135 = (void *)(v131 + *(int *)(v132 + 24));
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type SingleActivitySummarySnippet and conformance SingleActivitySummarySnippet, (void (*)(uint64_t))type metadata accessor for SingleActivitySummarySnippet);
      *uint64_t v135 = 0;
      v135[1] = 0;
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v131, (uint64_t (*)(void))type metadata accessor for SingleActivitySummarySnippet);
      uint64_t v72 = type metadata accessor for SingleActivitySummaryModel;
      goto LABEL_19;
    case 0xCu:
      uint64_t v68 = v193;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v193, (uint64_t (*)(void))type metadata accessor for SleepQueryModel);
      uint64_t v136 = v195;
      outlined init with copy of WellnessSnippets(v68, v195, (uint64_t (*)(void))type metadata accessor for SleepQueryModel);
      uint64_t v137 = v196;
      uint64_t v138 = (uint64_t *)(v136 + *(int *)(v196 + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *uint64_t v138 = EnvironmentObject.init()();
      v138[1] = v139;
      uint64_t v140 = (void *)(v136 + *(int *)(v137 + 24));
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type SleepQuerySnippet and conformance SleepQuerySnippet, (void (*)(uint64_t))type metadata accessor for SleepQuerySnippet);
      *uint64_t v140 = 0;
      v140[1] = 0;
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v136, (uint64_t (*)(void))type metadata accessor for SleepQuerySnippet);
      uint64_t v72 = type metadata accessor for SleepQueryModel;
      goto LABEL_19;
    case 0xDu:
      uint64_t v141 = (uint64_t)v63;
      uint64_t v96 = v194;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1(v141, v194, (uint64_t (*)(void))type metadata accessor for SpecificMedCompletedLogModel);
      uint64_t v142 = v192;
      outlined init with copy of WellnessSnippets(v96, v192, (uint64_t (*)(void))type metadata accessor for SpecificMedCompletedLogModel);
      uint64_t v143 = v197;
      SpecificMedCompletedLogSnippet.init(model:)(v142, v197);
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type SpecificMedCompletedLogSnippet and conformance SpecificMedCompletedLogSnippet, (void (*)(uint64_t))type metadata accessor for SpecificMedCompletedLogSnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v143, (uint64_t (*)(void))type metadata accessor for SpecificMedCompletedLogSnippet);
      long long v99 = type metadata accessor for SpecificMedCompletedLogModel;
LABEL_17:
      uint64_t v78 = v99;
      uint64_t v79 = v96;
      goto LABEL_20;
    case 0xEu:
      uint64_t v68 = v199;
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, v199, (uint64_t (*)(void))type metadata accessor for TemperatureQueryModel);
      uint64_t v144 = v200;
      outlined init with copy of WellnessSnippets(v68, v200, (uint64_t (*)(void))type metadata accessor for TemperatureQueryModel);
      uint64_t v145 = (uint64_t *)(v144 + *(int *)(Snippet + 20));
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *uint64_t v145 = EnvironmentObject.init()();
      v145[1] = v146;
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type TemperatureQuerySnippet and conformance TemperatureQuerySnippet, (void (*)(uint64_t))type metadata accessor for TemperatureQuerySnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet(v144, (uint64_t (*)(void))type metadata accessor for TemperatureQuerySnippet);
      uint64_t v72 = type metadata accessor for TemperatureQueryModel;
LABEL_19:
      uint64_t v78 = v72;
      uint64_t v79 = v68;
      goto LABEL_20;
    case 0xFu:
      char v148 = v63[8];
      uint64_t v149 = *((void *)v63 + 2);
      char v150 = v63[24];
      uint64_t v151 = *((void *)v63 + 4);
      char v152 = v63[40];
      uint64_t v153 = *((void *)v63 + 6);
      char v154 = v63[56];
      uint64_t v155 = *((void *)v63 + 8);
      char v156 = v63[72];
      uint64_t v157 = *((void *)v63 + 10);
      char v158 = v63[88];
      *(void *)&long long v203 = *(void *)v63;
      BYTE8(v203) = v148;
      *(void *)&long long v204 = v149;
      BYTE8(v204) = v150;
      *(void *)&long long v205 = v151;
      BYTE8(v205) = v152;
      *(void *)&long long v206 = v153;
      BYTE8(v206) = v154;
      *(void *)&long long v207 = v155;
      BYTE8(v207) = v156;
      *(void *)&long long v208 = v157;
      BYTE8(v208) = v158;
      lazy protocol witness table accessor for type WatchRingsSnippet and conformance WatchRingsSnippet();
      return View.eraseToAnyView()();
    default:
      _s10WellnessUI21TemperatureQueryModelVWObTm_1((uint64_t)v63, (uint64_t)v60, (uint64_t (*)(void))type metadata accessor for OxygenSaturationQueryModel);
      outlined init with copy of WellnessSnippets((uint64_t)v60, (uint64_t)v57, (uint64_t (*)(void))type metadata accessor for OxygenSaturationQueryModel);
      long long v64 = (uint64_t *)&v57[*(int *)(v55 + 20)];
      type metadata accessor for Context();
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type Context and conformance Context, MEMORY[0x263F77978]);
      *long long v64 = EnvironmentObject.init()();
      v64[1] = v65;
      lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type OxygenSaturationQuerySnippet and conformance OxygenSaturationQuerySnippet, (void (*)(uint64_t))type metadata accessor for OxygenSaturationQuerySnippet);
      uint64_t v66 = View.eraseToAnyView()();
      outlined destroy of TemperatureQuerySnippet((uint64_t)v57, (uint64_t (*)(void))type metadata accessor for OxygenSaturationQuerySnippet);
      long long v67 = type metadata accessor for OxygenSaturationQueryModel;
LABEL_10:
      uint64_t v78 = v67;
      uint64_t v79 = (uint64_t)v60;
LABEL_20:
      outlined destroy of TemperatureQuerySnippet(v79, (uint64_t (*)(void))v78);
      return v66;
  }
}

uint64_t associated type witness table accessor for SnippetProviding.SnippetPluginModelType : SnippetPluginModel in WellnessUIPlugin()
{
  return lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(&lazy protocol witness table cache variable for type WellnessSnippets and conformance WellnessSnippets, (void (*)(uint64_t))type metadata accessor for WellnessSnippets);
}

uint64_t type metadata accessor for WellnessUIPlugin()
{
  return self;
}

uint64_t method lookup function for WellnessUIPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WellnessUIPlugin);
}

uint64_t dispatch thunk of WellnessUIPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t lazy protocol witness table accessor for type WatchRingsSnippet and conformance WatchRingsSnippet()
{
  unint64_t result = lazy protocol witness table cache variable for type WatchRingsSnippet and conformance WatchRingsSnippet;
  if (!lazy protocol witness table cache variable for type WatchRingsSnippet and conformance WatchRingsSnippet)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WatchRingsSnippet and conformance WatchRingsSnippet);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericBinaryButtonSnippet and conformance GenericBinaryButtonSnippet()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericBinaryButtonSnippet and conformance GenericBinaryButtonSnippet;
  if (!lazy protocol witness table cache variable for type GenericBinaryButtonSnippet and conformance GenericBinaryButtonSnippet)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericBinaryButtonSnippet and conformance GenericBinaryButtonSnippet);
  }
  return result;
}

uint64_t _s10WellnessUI21TemperatureQueryModelVWObTm_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of WellnessSnippets(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t lazy protocol witness table accessor for type WellnessSnippets and conformance WellnessSnippets(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined destroy of TemperatureQuerySnippet(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

objc_class *one-time initialization function for resourceBundle()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t result = (objc_class *)objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.isa = result;
  return result;
}

uint64_t one-time initialization function for healthdataGlyphBodymeasurements(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphBodymeasurements, 0xD000000000000021, 0x8000000261884330);
}

uint64_t ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphBodymeasurements, (uint64_t)static ImageResource.healthdataGlyphBodymeasurements);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static ImageResource.healthdataGlyphBodymeasurements.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphBodymeasurements, (uint64_t)static ImageResource.healthdataGlyphBodymeasurements, a1);
}

uint64_t one-time initialization function for healthdataGlyphFitness(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphFitness, 0xD000000000000018, 0x8000000261884310);
}

uint64_t ImageResource.healthdataGlyphFitness.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphFitness, (uint64_t)static ImageResource.healthdataGlyphFitness);
}

uint64_t static ImageResource.healthdataGlyphFitness.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphFitness, (uint64_t)static ImageResource.healthdataGlyphFitness, a1);
}

uint64_t one-time initialization function for healthdataGlyphHeart(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphHeart, 0xD000000000000016, 0x80000002618842F0);
}

uint64_t ImageResource.healthdataGlyphHeart.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphHeart, (uint64_t)static ImageResource.healthdataGlyphHeart);
}

uint64_t static ImageResource.healthdataGlyphHeart.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphHeart, (uint64_t)static ImageResource.healthdataGlyphHeart, a1);
}

uint64_t one-time initialization function for healthdataGlyphMedicationTracking(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphMedicationTracking, 0xD000000000000023, 0x80000002618842C0);
}

uint64_t ImageResource.healthdataGlyphMedicationTracking.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphMedicationTracking, (uint64_t)static ImageResource.healthdataGlyphMedicationTracking);
}

uint64_t static ImageResource.healthdataGlyphMedicationTracking.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphMedicationTracking, (uint64_t)static ImageResource.healthdataGlyphMedicationTracking, a1);
}

uint64_t one-time initialization function for healthdataGlyphReproductive(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphReproductive, 0xD00000000000001DLL, 0x80000002618842A0);
}

uint64_t ImageResource.healthdataGlyphReproductive.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphReproductive, (uint64_t)static ImageResource.healthdataGlyphReproductive);
}

uint64_t static ImageResource.healthdataGlyphReproductive.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphReproductive, (uint64_t)static ImageResource.healthdataGlyphReproductive, a1);
}

uint64_t one-time initialization function for healthdataGlyphRespiratory(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphRespiratory, 0xD00000000000001CLL, 0x8000000261884280);
}

uint64_t ImageResource.healthdataGlyphRespiratory.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphRespiratory, (uint64_t)static ImageResource.healthdataGlyphRespiratory);
}

uint64_t static ImageResource.healthdataGlyphRespiratory.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphRespiratory, (uint64_t)static ImageResource.healthdataGlyphRespiratory, a1);
}

uint64_t one-time initialization function for healthdataGlyphSleep(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphSleep, 0xD000000000000016, 0x8000000261884260);
}

uint64_t ImageResource.healthdataGlyphSleep.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphSleep, (uint64_t)static ImageResource.healthdataGlyphSleep);
}

uint64_t static ImageResource.healthdataGlyphSleep.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphSleep, (uint64_t)static ImageResource.healthdataGlyphSleep, a1);
}

uint64_t one-time initialization function for healthdataGlyphVitals(uint64_t a1)
{
  return one-time initialization function for healthdataGlyphBodymeasurements(a1, static ImageResource.healthdataGlyphVitals, 0xD000000000000017, 0x8000000261884240);
}

uint64_t one-time initialization function for healthdataGlyphBodymeasurements(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1) {
    swift_once();
  }
  return MEMORY[0x263E41500](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.healthdataGlyphVitals.unsafeMutableAddressor()
{
  return ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(&one-time initialization token for healthdataGlyphVitals, (uint64_t)static ImageResource.healthdataGlyphVitals);
}

uint64_t ImageResource.healthdataGlyphBodymeasurements.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.healthdataGlyphVitals.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.healthdataGlyphBodymeasurements.getter(&one-time initialization token for healthdataGlyphVitals, (uint64_t)static ImageResource.healthdataGlyphVitals, a1);
}

uint64_t static ImageResource.healthdataGlyphBodymeasurements.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
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

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x270EEFC58]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
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

uint64_t AppPunchout.init(punchOutUri:bundleId:appDisplayName:)()
{
  return MEMORY[0x270F73A58]();
}

uint64_t type metadata accessor for AppPunchout()
{
  return MEMORY[0x270F73A88]();
}

uint64_t type metadata accessor for SashStandard.Title()
{
  return MEMORY[0x270F73F90]();
}

uint64_t SashStandard.init(title:thumbnail:titleColor:backgroundColor:action:componentName:showOnWatch:)()
{
  return MEMORY[0x270F73FA0]();
}

uint64_t type metadata accessor for SashStandard()
{
  return MEMORY[0x270F73FD0]();
}

uint64_t type metadata accessor for ActionProperty()
{
  return MEMORY[0x270F74130]();
}

uint64_t ActionProperty.init(_:)()
{
  return MEMORY[0x270F74150]();
}

uint64_t type metadata accessor for SeparatorStyle()
{
  return MEMORY[0x270F741F8]();
}

uint64_t type metadata accessor for VisualProperty()
{
  return MEMORY[0x270F74290]();
}

uint64_t type metadata accessor for Color()
{
  return MEMORY[0x270F75458]();
}

uint64_t type metadata accessor for Command()
{
  return MEMORY[0x270F755C8]();
}

uint64_t DialogPersonHeight.Builder.init()()
{
  return MEMORY[0x270F648E8]();
}

uint64_t type metadata accessor for DialogPersonHeight.Builder()
{
  return MEMORY[0x270F648F0]();
}

uint64_t dispatch thunk of DialogPersonHeight.symbolic.getter()
{
  return MEMORY[0x270F648F8]();
}

uint64_t dispatch thunk of DialogPreciseTemperature.longSpokenTwoDigits.getter()
{
  return MEMORY[0x270F64A48]();
}

uint64_t dispatch thunk of DialogPreciseTemperature.mediumSpokenTwoDigits.getter()
{
  return MEMORY[0x270F64A50]();
}

uint64_t DialogPreciseTemperature.Builder.init()()
{
  return MEMORY[0x270F64A58]();
}

uint64_t type metadata accessor for DialogPreciseTemperature.Builder()
{
  return MEMORY[0x270F64A60]();
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

uint64_t dispatch thunk of DialogConvertibleMeasurement.Builder.build()()
{
  return MEMORY[0x270F64AD0]();
}

uint64_t dispatch thunk of DialogConvertibleMeasurement.Builder.withUnits(_:)()
{
  return MEMORY[0x270F64AD8]();
}

uint64_t dispatch thunk of DialogConvertibleMeasurement.Builder.withValue(_:)()
{
  return MEMORY[0x270F64AE0]();
}

uint64_t dispatch thunk of DialogCalendar.dateDescriptive.getter()
{
  return MEMORY[0x270F64CC8]();
}

uint64_t dispatch thunk of DialogCalendar.timeDescriptive.getter()
{
  return MEMORY[0x270F64CD0]();
}

uint64_t type metadata accessor for DialogCalendar()
{
  return MEMORY[0x270F64D30]();
}

uint64_t dispatch thunk of DialogDuration.hoursMinutesAbbreviated.getter()
{
  return MEMORY[0x270F64D90]();
}

uint64_t type metadata accessor for DialogDuration()
{
  return MEMORY[0x270F64DF0]();
}

uint64_t SpeakableString.print.getter()
{
  return MEMORY[0x270F64FA8]();
}

uint64_t type metadata accessor for SpeakableString()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x270EEB1C8]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x270EEB1E8]();
}

uint64_t EdgeInsets.init(_all:)()
{
  return MEMORY[0x270EFED00]();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return MEMORY[0x270EFEF18]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x270EFEF28]();
}

uint64_t type metadata accessor for Environment.Content()
{
  return MEMORY[0x270EFEFC8]();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return MEMORY[0x270EFF130]();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return MEMORY[0x270EFF5A0]();
}

uint64_t static DynamicTypeSize.== infix(_:_:)()
{
  return MEMORY[0x270EFFEC8]();
}

uint64_t type metadata accessor for DynamicTypeSize()
{
  return MEMORY[0x270EFFED8]();
}

uint64_t EnvironmentObject.error()()
{
  return MEMORY[0x270F00830]();
}

uint64_t EnvironmentObject.init()()
{
  return MEMORY[0x270F00848]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x270F008C8]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x270F008E0]();
}

uint64_t EnvironmentValues.dynamicTypeSize.getter()
{
  return MEMORY[0x270F00A08]();
}

uint64_t EnvironmentValues.dynamicTypeSize.setter()
{
  return MEMORY[0x270F00A10]();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return MEMORY[0x270F00A28]();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return MEMORY[0x270F00A38]();
}

uint64_t EnvironmentValues.colorSchemeContrast.getter()
{
  return MEMORY[0x270F00BB0]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x270F00ED0]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x270F00EE8]();
}

uint64_t static VerticalAlignment.lastTextBaseline.getter()
{
  return MEMORY[0x270F01030]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x270F01068]();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return MEMORY[0x270F01240]();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return MEMORY[0x270F01260]();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return MEMORY[0x270F01268]();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return MEMORY[0x270F01278]();
}

uint64_t static ColorSchemeContrast.== infix(_:_:)()
{
  return MEMORY[0x270F01480]();
}

uint64_t type metadata accessor for ColorSchemeContrast()
{
  return MEMORY[0x270F01488]();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return MEMORY[0x270F01518]();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return MEMORY[0x270F01700]();
}

uint64_t UIViewRepresentable.body.getter()
{
  return MEMORY[0x270F01770]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x270F01808]();
}

uint64_t static PrimitiveButtonStyle<>.rfButton.getter()
{
  return MEMORY[0x270F75930]();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return MEMORY[0x270F01D40]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x270F029E8]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x270F02A28]();
}

uint64_t static Edge.Set.top.getter()
{
  return MEMORY[0x270F02A40]();
}

uint64_t static Edge.Set.bottom.getter()
{
  return MEMORY[0x270F02A50]();
}

uint64_t static Edge.Set.leading.getter()
{
  return MEMORY[0x270F02A58]();
}

uint64_t static Edge.Set.trailing.getter()
{
  return MEMORY[0x270F02A80]();
}

uint64_t static Font.subheadline.getter()
{
  return MEMORY[0x270F02AE0]();
}

uint64_t type metadata accessor for Font.Design()
{
  return MEMORY[0x270F02BA0]();
}

uint64_t static Font.Weight.medium.getter()
{
  return MEMORY[0x270F02BF0]();
}

uint64_t static Font.Weight.regular.getter()
{
  return MEMORY[0x270F02C08]();
}

uint64_t static Font.Weight.semibold.getter()
{
  return MEMORY[0x270F02C18]();
}

uint64_t static Font.system(_:design:weight:)()
{
  return MEMORY[0x270F02C60]();
}

uint64_t Font.weight(_:)()
{
  return MEMORY[0x270F02C90]();
}

uint64_t static Font.footnote.getter()
{
  return MEMORY[0x270F02D00]();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return MEMORY[0x270F02D28]();
}

uint64_t Font.smallCaps()()
{
  return MEMORY[0x270F02D48]();
}

uint64_t Text.fontWeight(_:)()
{
  return MEMORY[0x270F02F20]();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return MEMORY[0x270F03018]();
}

uint64_t static Text.+ infix(_:_:)()
{
  return MEMORY[0x270F03068]();
}

uint64_t Text.bold()()
{
  return MEMORY[0x270F03098]();
}

uint64_t Text.font(_:)()
{
  return MEMORY[0x270F030B0]();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return MEMORY[0x270F03230]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03258]();
}

uint64_t View.eraseToAnyView()()
{
  return MEMORY[0x270F75948]();
}

uint64_t View.buttonRole(_:)()
{
  return MEMORY[0x270F75968]();
}

uint64_t View.separators(_:isOverride:)()
{
  return MEMORY[0x270F759A8]();
}

uint64_t View.componentTapped(isNavigation:perform:)()
{
  return MEMORY[0x270F759D0]();
}

uint64_t View.componentSpacing(top:bottom:)()
{
  return MEMORY[0x270F759F8]();
}

uint64_t View.lastComponentBottomSpacing(_:)()
{
  return MEMORY[0x270F75A78]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x270F03440]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036B8]();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return MEMORY[0x270F043A0]();
}

uint64_t static Color.red.getter()
{
  return MEMORY[0x270F043E0]();
}

uint64_t static Color.blue.getter()
{
  return MEMORY[0x270F043F0]();
}

uint64_t static Color.gray.getter()
{
  return MEMORY[0x270F04418]();
}

uint64_t static Color.black.getter()
{
  return MEMORY[0x270F04458]();
}

uint64_t static Color.green.getter()
{
  return MEMORY[0x270F04490]();
}

uint64_t static Color.white.getter()
{
  return MEMORY[0x270F044A0]();
}

uint64_t Color.init(_:red:green:blue:opacity:)()
{
  return MEMORY[0x270F04568]();
}

uint64_t Image.init(uiImage:)()
{
  return MEMORY[0x270F04628]();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return MEMORY[0x270F04688]();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return MEMORY[0x270F04710]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048A8]();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return MEMORY[0x270F048F0]();
}

uint64_t AnyView.init<A>(_:)()
{
  return MEMORY[0x270F04B18]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x270F05080]();
}

uint64_t static Alignment.trailing.getter()
{
  return MEMORY[0x270F050A0]();
}

uint64_t type metadata accessor for ButtonItemButtonStyle.Role()
{
  return MEMORY[0x270F75AD8]();
}

uint64_t SnippetBody.init(content:)()
{
  return MEMORY[0x270F75AE8]();
}

uint64_t ActionHandler.wrappedValue.getter()
{
  return MEMORY[0x270F75B88]();
}

uint64_t ActionHandler.init()()
{
  return MEMORY[0x270F75BA0]();
}

uint64_t type metadata accessor for ActionHandler()
{
  return MEMORY[0x270F75BB0]();
}

uint64_t type metadata accessor for RFButtonStyle()
{
  return MEMORY[0x270F75C00]();
}

uint64_t ComponentStack.init(content:)()
{
  return MEMORY[0x270F75C28]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x270F75C70]();
}

uint64_t BinaryButtonView.init(primaryButton:secondaryButton:)()
{
  return MEMORY[0x270F75C78]();
}

uint64_t type metadata accessor for BinaryButtonView()
{
  return MEMORY[0x270F75C88]();
}

uint64_t SashStandardView.init(icon:title:showOnWatch:)()
{
  return MEMORY[0x270F75D00]();
}

uint64_t SashStandardView.init(model:)()
{
  return MEMORY[0x270F75D08]();
}

uint64_t type metadata accessor for SashStandardView()
{
  return MEMORY[0x270F75D10]();
}

uint64_t SimpleItemRichView.init(text1:text2:text3:text4:text5:text6:text7:text8:thumbnail:)()
{
  return MEMORY[0x270F75DB0]();
}

uint64_t type metadata accessor for SimpleItemRichView()
{
  return MEMORY[0x270F75DC8]();
}

uint64_t type metadata accessor for StatusIndicatorView.IndicatorType()
{
  return MEMORY[0x270F75E60]();
}

uint64_t StatusIndicatorView.init(message:type:showIndicator:)()
{
  return MEMORY[0x270F75E68]();
}

uint64_t type metadata accessor for StatusIndicatorView()
{
  return MEMORY[0x270F75E78]();
}

uint64_t StandardActionHandler.perform(_:interactionType:)()
{
  return MEMORY[0x270F75EE8]();
}

uint64_t type metadata accessor for StandardActionHandler()
{
  return MEMORY[0x270F75EF8]();
}

uint64_t FactItemHeroNumberView.init(number:text1:text2:text3:text4:text5:)()
{
  return MEMORY[0x270F75F38]();
}

uint64_t type metadata accessor for FactItemHeroNumberView()
{
  return MEMORY[0x270F75F40]();
}

uint64_t type metadata accessor for ComponentStackBottomSpacing()
{
  return MEMORY[0x270F760C8]();
}

uint64_t dispatch thunk of Context.perform(appPunchout:)()
{
  return MEMORY[0x270F76258]();
}

uint64_t dispatch thunk of Context.perform(directInvocation:payload:)()
{
  return MEMORY[0x270F76268]();
}

uint64_t type metadata accessor for Context()
{
  return MEMORY[0x270F76278]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:arguments:)()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

Swift::String __swiftcall String.firstLetterCapitalized()()
{
  uint64_t v0 = MEMORY[0x270F31B70]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
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

uint64_t String.UTF8View._foreignDistance(from:to:)()
{
  return MEMORY[0x270F9D808]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t Optional.description.getter()
{
  return MEMORY[0x270F62148]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t StringProtocol.capitalized.getter()
{
  return MEMORY[0x270EF2410]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x270FA13A0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
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

{
  return MEMORY[0x270F9F280]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F308]();
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

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3C0]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F448]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}