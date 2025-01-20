void sub_25DDB6700()
{
  qword_26B380868 = 0x746E656D676553;
  *(void *)algn_26B380870 = 0xE700000000000000;
}

uint64_t static SegmentStore.readLastRecordedSegments()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25DDE2C90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_25DDB6818((uint64_t)v6);
  if (!v1)
  {
    sub_25DDB6C80((uint64_t)v6, a1);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_25DDB6818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v26 = sub_25DDE2F30();
  uint64_t v24 = *(void *)(v26 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380720);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25DDE2C90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v23 = (char *)&v23 - v10;
  id v11 = objc_msgSend(self, sel_defaultManager);
  v12 = (void *)sub_25DDE3100();
  id v13 = objc_msgSend(v11, sel_containerURLForSecurityApplicationGroupIdentifier_, v12);

  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_7;
  }
  sub_25DDE2C80();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_7:
    sub_25DDB7B2C((uint64_t)v4);
    uint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_25DDE3330();
    sub_25DDE3130();
    sub_25DDE3130();
    sub_25DDE3130();
    uint64_t v20 = v27;
    unint64_t v21 = v28;
    sub_25DDB7B8C();
    swift_allocError();
    void *v22 = v20;
    v22[1] = v21;
    return swift_willThrow();
  }
  v15 = v23;
  v14(v23, v4, v5);
  if (qword_26B380730 != -1) {
    swift_once();
  }
  sub_25DDE2F20();
  sub_25DDE2C60();
  v16 = *(void (**)(char *, uint64_t))(v24 + 8);
  uint64_t v17 = v26;
  v16(v2, v26);
  sub_25DDE2F10();
  sub_25DDE2C60();
  v16(v2, v17);
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v9, v5);
  return ((uint64_t (*)(char *, uint64_t))v18)(v15, v5);
}

uint64_t sub_25DDB6C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_25DDE2C90();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_25DDE3040();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B3808C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v11 = sub_25DDE3020();
  os_log_type_t v12 = sub_25DDE3250();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v26 = a2;
    uint64_t v14 = v13;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v28 = v23;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v27 = sub_25DDCA0E4(0xD00000000000001FLL, 0x800000025DDE54C0, &v28);
    uint64_t v25 = v2;
    sub_25DDE32D0();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v24 = a1;
    sub_25DDB7AE4(&qword_26B380848, MEMORY[0x263F06EA8]);
    uint64_t v15 = sub_25DDE3470();
    uint64_t v27 = sub_25DDCA0E4(v15, v16, &v28);
    uint64_t v3 = v25;
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_25DDB4000, v11, v12, "SegmentStore.%s from: %s", (uint8_t *)v14, 0x16u);
    uint64_t v17 = v23;
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v17, -1, -1);
    MEMORY[0x2611C78C0](v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  uint64_t result = sub_25DDE2CA0();
  if (!v3)
  {
    uint64_t v20 = result;
    unint64_t v21 = v19;
    sub_25DDE2BF0();
    swift_allocObject();
    sub_25DDE2BE0();
    type metadata accessor for SegmentsSummary();
    sub_25DDB7AE4((unint64_t *)&unk_26A6C7AA8, (void (*)(uint64_t))type metadata accessor for SegmentsSummary);
    sub_25DDE2BD0();
    sub_25DDB7A48(v20, v21);
    return swift_release();
  }
  return result;
}

uint64_t SegmentStore.deinit()
{
  return v0;
}

uint64_t SegmentStore.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SegmentStore()
{
  return self;
}

uint64_t method lookup function for SegmentStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SegmentStore);
}

void *initializeBufferWithCopyOfBuffer for SegmentStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SegmentStoreError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SegmentStoreError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SegmentStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentStoreError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SegmentStoreError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SegmentStoreError()
{
  return &type metadata for SegmentStoreError;
}

void sub_25DDB71DC(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_25DDB71E8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_25DDB71FC(void *a1@<X8>)
{
  *a1 = *v1;
}

_DWORD *sub_25DDB7208@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t sub_25DDB7218(uint64_t a1, uint64_t a2)
{
  uint64_t v64 = a1;
  v68[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_25DDE2C90();
  uint64_t v4 = *(char **)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v61 = &v53[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v9 = &v53[-v8];
  MEMORY[0x270FA5388](v7);
  id v11 = &v53[-v10];
  uint64_t v12 = sub_25DDE3040();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = &v53[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_26B380880 != -1) {
    swift_once();
  }
  unint64_t v16 = __swift_project_value_buffer(v12, (uint64_t)qword_26B3808C0);
  uint64_t v17 = *(void (**)(unsigned char *))(v13 + 16);
  os_log_t v60 = v16;
  v17(v15);
  v18 = (void (*)(unsigned char *, uint64_t, uint64_t))*((void *)v4 + 2);
  uint64_t v66 = a2;
  v58 = v18;
  uint64_t v59 = (uint64_t)(v4 + 16);
  v18(v11, a2, v3);
  unint64_t v19 = sub_25DDE3020();
  os_log_type_t v20 = sub_25DDE3250();
  int v21 = v20;
  BOOL v22 = os_log_type_enabled(v19, v20);
  v62 = v4;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    os_log_t v55 = v19;
    uint64_t v24 = v23;
    v56 = (void *)swift_slowAlloc();
    v68[0] = v56;
    *(_DWORD *)uint64_t v24 = 136315394;
    int v54 = v21;
    uint64_t v67 = sub_25DDCA0E4(0x3A5F286574697277, 0xEC000000293A6F74, (uint64_t *)v68);
    v57 = v9;
    sub_25DDE32D0();
    *(_WORD *)(v24 + 12) = 2080;
    v63 = (void (*)(unsigned char *, uint64_t))(v24 + 14);
    sub_25DDB7AE4(&qword_26B380848, MEMORY[0x263F06EA8]);
    uint64_t v25 = sub_25DDE3470();
    uint64_t v67 = sub_25DDCA0E4(v25, v26, (uint64_t *)v68);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    v9 = v57;
    v63 = (void (*)(unsigned char *, uint64_t))*((void *)v4 + 1);
    v63(v11, v3);
    os_log_t v27 = v55;
    _os_log_impl(&dword_25DDB4000, v55, (os_log_type_t)v54, "SegmentStore.%s to: %s", (uint8_t *)v24, 0x16u);
    uint64_t v28 = v56;
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v28, -1, -1);
    MEMORY[0x2611C78C0](v24, -1, -1);
  }
  else
  {
    v63 = (void (*)(unsigned char *, uint64_t))*((void *)v4 + 1);
    v63(v11, v3);
  }
  (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v15, v12);
  sub_25DDE2C30();
  swift_allocObject();
  sub_25DDE2C20();
  sub_25DDE2C00();
  type metadata accessor for SegmentsSummary();
  sub_25DDB7AE4((unint64_t *)&unk_26A6C7A30, (void (*)(uint64_t))type metadata accessor for SegmentsSummary);
  v29 = v65;
  uint64_t v30 = sub_25DDE2C10();
  uint64_t v32 = v66;
  if (!v29)
  {
    uint64_t v33 = v30;
    unint64_t v34 = v31;
    uint64_t v35 = v3;
    id v36 = objc_msgSend(self, sel_defaultManager);
    sub_25DDE2C70();
    v37 = (void *)sub_25DDE2C50();
    v65 = v62 + 8;
    v63(v9, v35);
    v68[0] = 0;
    unsigned int v38 = objc_msgSend(v36, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v37, 1, 0, v68);

    id v39 = v68[0];
    if (!v38)
    {
      v40 = v39;
      v41 = (void *)sub_25DDE2C40();

      swift_willThrow();
      v42 = v61;
      v58(v61, v32, v35);
      MEMORY[0x2611C7720](v41);
      MEMORY[0x2611C7720](v41);
      v43 = sub_25DDE3020();
      os_log_type_t v44 = sub_25DDE3260();
      LODWORD(v64) = v44;
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        v62 = (char *)swift_slowAlloc();
        v68[0] = v62;
        *(_DWORD *)uint64_t v45 = 136315394;
        uint64_t v59 = v45 + 4;
        sub_25DDB7AE4(&qword_26B380848, MEMORY[0x263F06EA8]);
        os_log_t v60 = v43;
        uint64_t v46 = sub_25DDE3470();
        uint64_t v67 = sub_25DDCA0E4(v46, v47, (uint64_t *)v68);
        sub_25DDE32D0();
        swift_bridgeObjectRelease();
        v63(v42, v35);
        *(_WORD *)(v45 + 12) = 2080;
        uint64_t v67 = (uint64_t)v41;
        MEMORY[0x2611C7720](v41);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7A40);
        uint64_t v48 = sub_25DDE3110();
        uint64_t v67 = sub_25DDCA0E4(v48, v49, (uint64_t *)v68);
        sub_25DDE32D0();
        swift_bridgeObjectRelease();

        os_log_t v50 = v60;
        _os_log_impl(&dword_25DDB4000, v60, (os_log_type_t)v64, "SegmentStore.write(): Unable to create the store directory for path: %s, error: %s", (uint8_t *)v45, 0x16u);
        v51 = v62;
        swift_arrayDestroy();
        MEMORY[0x2611C78C0](v51, -1, -1);
        MEMORY[0x2611C78C0](v45, -1, -1);
      }
      else
      {

        v63(v42, v35);
      }
    }
    sub_25DDE2CD0();
    sub_25DDB7A48(v33, v34);
  }
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25DDB7A48(uint64_t a1, unint64_t a2)
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

uint64_t sub_25DDB7AE4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDB7B2C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B380720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25DDB7B8C()
{
  unint64_t result = qword_26A6C7AB8;
  if (!qword_26A6C7AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7AB8);
  }
  return result;
}

void type metadata accessor for SISchemaInvocationSource(uint64_t a1)
{
}

void type metadata accessor for ORCHSchemaORCHRequestCancellationReason(uint64_t a1)
{
}

void type metadata accessor for SISchemaUEIRequestStatus(uint64_t a1)
{
}

void sub_25DDB7C1C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

const char *SiriUserSegmentsFeatureFlag.domain.getter()
{
  return "SiriUserSegments";
}

const char *SiriUserSegmentsFeatureFlag.feature.getter()
{
  return "SegmentationTask";
}

uint64_t static SiriUserSegmentsFeatureFlag.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriUserSegmentsFeatureFlag.hash(into:)()
{
  return sub_25DDE34F0();
}

void *static SiriUserSegmentsFeatureFlag.allCases.getter()
{
  return &unk_270AC4E08;
}

uint64_t SiriUserSegmentsFeatureFlag.hashValue.getter()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDB7D30()
{
  return 1;
}

uint64_t sub_25DDB7D38()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDB7D7C()
{
  return sub_25DDE34F0();
}

uint64_t sub_25DDB7DA4()
{
  return sub_25DDE3500();
}

unint64_t sub_25DDB7DE8()
{
  unint64_t result = qword_26A6C7B40;
  if (!qword_26A6C7B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7B40);
  }
  return result;
}

const char *sub_25DDB7E3C()
{
  return "SiriUserSegments";
}

const char *sub_25DDB7E50()
{
  return "SegmentationTask";
}

unint64_t sub_25DDB7E68()
{
  unint64_t result = qword_26A6C7B48;
  if (!qword_26A6C7B48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C7B50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7B48);
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

void sub_25DDB7F0C(void *a1@<X8>)
{
  *a1 = &unk_270AC4E30;
}

uint64_t getEnumTagSinglePayload for SiriUserSegmentsFeatureFlag(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SiriUserSegmentsFeatureFlag(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25DDB8010);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25DDB8038()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriUserSegmentsFeatureFlag()
{
  return &type metadata for SiriUserSegmentsFeatureFlag;
}

uint64_t *sub_25DDB8058(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_25DDE2DC0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t sub_25DDB81C4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = sub_25DDE2DC0();
    int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(a1, v4);
  }
  return result;
}

void *sub_25DDB8278(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_25DDE2DC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *sub_25DDB83A8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_25DDE2DC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_25DDBA81C((uint64_t)a1, &qword_26A6C7B58);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_25DDE2DC0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *sub_25DDB8554(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v8 = sub_25DDE2DC0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *sub_25DDB8684(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 3, v6);
  int v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      uint64_t v13 = sub_25DDE2DC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_25DDBA81C((uint64_t)a1, &qword_26A6C7B58);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  uint64_t v11 = sub_25DDE2DC0();
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t sub_25DDB8830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDB8844);
}

uint64_t sub_25DDB8844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_25DDB88B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDB88C8);
}

uint64_t sub_25DDB88C8(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_25DDB8950(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 3, v2);
}

uint64_t sub_25DDB89C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 3, v4);
}

uint64_t type metadata accessor for SiriFirstEnablementStatus()
{
  uint64_t result = qword_26B380858;
  if (!qword_26B380858) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDB8A80()
{
  uint64_t result = sub_25DDE2DC0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_25DDB8AF8()
{
  uint64_t v1 = sub_25DDE2D60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25DDE2DC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x270FA5388](EnablementStatus - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25DDBA254(v0, (uint64_t)v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v13 = 0x6E776F6E6B6E75;
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 3, v12))
  {
    case 1u:
      return v13;
    case 2u:
      uint64_t v13 = 0x616E45726576656ELL;
      break;
    case 3u:
      uint64_t v13 = 0x6D726554676E6F6CLL;
      break;
    default:
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
      unint64_t v15 = 0;
      unint64_t v16 = 0xE000000000000000;
      sub_25DDE3330();
      swift_bridgeObjectRelease();
      unint64_t v15 = 0xD000000000000016;
      unint64_t v16 = 0x800000025DDE55D0;
      sub_25DDDC728((uint64_t)v4);
      sub_25DDE2D00();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      sub_25DDE3130();
      swift_bridgeObjectRelease();
      sub_25DDE3130();
      uint64_t v13 = v15;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      break;
  }
  return v13;
}

uint64_t sub_25DDB8E1C(char a1)
{
  return *(void *)&aUnknown_3[8 * a1];
}

BOOL sub_25DDB8E3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25DDB8E50()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDB8E98()
{
  return sub_25DDE34F0();
}

uint64_t sub_25DDB8EC4()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDB8F08()
{
  return sub_25DDB8E1C(*v0);
}

uint64_t sub_25DDB8F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DDBB00C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DDB8F38()
{
  return 0;
}

void sub_25DDB8F44(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_25DDB8F50(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA200();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DDB8F8C(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA200();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DDB8FC8(void *a1)
{
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B60);
  uint64_t v35 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v32 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B68);
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v34 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_25DDE2DC0();
  uint64_t v36 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v33 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B70);
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B78);
  uint64_t v28 = *(void *)(v9 - 8);
  uint64_t v29 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x270FA5388](EnablementStatus - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B80);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DDBA200();
  sub_25DDE3520();
  sub_25DDBA254(v41, (uint64_t)v14);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v14, 3, v19))
  {
    case 1u:
      char v42 = 0;
      sub_25DDBA3B4();
      sub_25DDE3440();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
      goto LABEL_6;
    case 2u:
      char v43 = 1;
      sub_25DDBA360();
      sub_25DDE3440();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v31);
      goto LABEL_6;
    case 3u:
      char v45 = 3;
      sub_25DDBA2B8();
      unint64_t v26 = v32;
      sub_25DDE3440();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v26, v37);
LABEL_6:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      break;
    default:
      uint64_t v20 = v36;
      int v21 = v33;
      uint64_t v22 = v38;
      (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v33, v14, v38);
      char v44 = 2;
      sub_25DDBA30C();
      uint64_t v23 = v34;
      sub_25DDE3440();
      sub_25DDBA4BC(&qword_26A6C7BA0);
      uint64_t v24 = v40;
      sub_25DDE3460();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v23, v24);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      break;
  }
  return result;
}

uint64_t sub_25DDB95D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BB8);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  os_log_t v55 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BC0);
  uint64_t v53 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  v56 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BC8);
  uint64_t v49 = *(void *)(v6 - 8);
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v6);
  int v54 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BD0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v47 = v8;
  uint64_t v48 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BD8);
  uint64_t v57 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  uint64_t v16 = MEMORY[0x270FA5388](EnablementStatus);
  v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v44 - v19;
  uint64_t v21 = a1[3];
  os_log_t v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  sub_25DDBA200();
  uint64_t v22 = (uint64_t)v61;
  sub_25DDE3510();
  if (v22) {
    goto LABEL_9;
  }
  char v45 = v18;
  uint64_t v46 = v11;
  uint64_t v23 = v57;
  uint64_t v24 = v58;
  v61 = v20;
  uint64_t v25 = v59;
  uint64_t v26 = sub_25DDE3430();
  if (*(void *)(v26 + 16) != 1)
  {
    uint64_t v30 = v12;
    uint64_t v31 = sub_25DDE3380();
    swift_allocError();
    uint64_t v33 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BE0);
    *uint64_t v33 = EnablementStatus;
    sub_25DDE3400();
    sub_25DDE3370();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v33, *MEMORY[0x263F8DCB0], v31);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v30);
LABEL_9:
    uint64_t v37 = (uint64_t)v60;
    return __swift_destroy_boxed_opaque_existential_1(v37);
  }
  switch(*(unsigned char *)(v26 + 32))
  {
    case 1:
      char v63 = 1;
      sub_25DDBA360();
      unint64_t v34 = v54;
      sub_25DDE33F0();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v34, v50);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
      uint64_t v29 = (uint64_t)v61;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v61, 2, 3, v35);
      goto LABEL_11;
    case 2:
      char v64 = 2;
      sub_25DDBA30C();
      uint64_t v36 = v56;
      sub_25DDE33F0();
      sub_25DDE2DC0();
      sub_25DDBA4BC(&qword_26A6C7BE8);
      sub_25DDE3420();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v36, v24);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      uint64_t v37 = (uint64_t)v60;
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
      uint64_t v39 = (uint64_t)v45;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v45, 0, 3, v38);
      uint64_t v40 = v39;
      uint64_t v29 = (uint64_t)v61;
      sub_25DDBA458(v40, (uint64_t)v61);
      goto LABEL_12;
    case 3:
      char v65 = 3;
      sub_25DDBA2B8();
      uint64_t v41 = v55;
      sub_25DDE33F0();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v41, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
      uint64_t v29 = (uint64_t)v61;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v61, 3, 3, v43);
      goto LABEL_11;
    default:
      char v62 = 0;
      sub_25DDBA3B4();
      uint64_t v27 = v46;
      sub_25DDE33F0();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v47);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
      uint64_t v29 = (uint64_t)v61;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v61, 1, 3, v28);
LABEL_11:
      uint64_t v37 = (uint64_t)v60;
LABEL_12:
      sub_25DDBA458(v29, v25);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v37);
}

uint64_t sub_25DDB9E0C()
{
  return 0;
}

uint64_t sub_25DDB9E18()
{
  return 0;
}

void sub_25DDB9E24(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25DDB9E30(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA2B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DDB9E6C(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA2B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DDB9EA8()
{
  return 0;
}

uint64_t sub_25DDB9EB4()
{
  return 0;
}

void sub_25DDB9EC0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25DDB9ECC(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA360();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DDB9F08(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA360();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DDB9F44()
{
  return 1;
}

uint64_t sub_25DDB9F4C()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDB9F90()
{
  return sub_25DDE34F0();
}

uint64_t sub_25DDB9FB8()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDB9FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DDBB1E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_25DDBA028()
{
  return 0;
}

void sub_25DDBA034(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25DDBA040(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA30C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DDBA07C(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA30C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DDBA0B8()
{
  return 0;
}

uint64_t sub_25DDBA0C4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_25DDBA0F4()
{
  return 0;
}

void sub_25DDBA100(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25DDBA10C(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA3B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DDBA148(uint64_t a1)
{
  unint64_t v2 = sub_25DDBA3B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_25DDBA188@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_25DDB95D0(a1, a2);
}

uint64_t sub_25DDBA1A0(void *a1)
{
  return sub_25DDB8FC8(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_25DDBA200()
{
  unint64_t result = qword_26A6C7B88;
  if (!qword_26A6C7B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7B88);
  }
  return result;
}

uint64_t sub_25DDBA254(uint64_t a1, uint64_t a2)
{
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 16))(a2, a1, EnablementStatus);
  return a2;
}

unint64_t sub_25DDBA2B8()
{
  unint64_t result = qword_26A6C7B90;
  if (!qword_26A6C7B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7B90);
  }
  return result;
}

unint64_t sub_25DDBA30C()
{
  unint64_t result = qword_26A6C7B98;
  if (!qword_26A6C7B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7B98);
  }
  return result;
}

unint64_t sub_25DDBA360()
{
  unint64_t result = qword_26A6C7BA8;
  if (!qword_26A6C7BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7BA8);
  }
  return result;
}

unint64_t sub_25DDBA3B4()
{
  unint64_t result = qword_26A6C7BB0;
  if (!qword_26A6C7BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7BB0);
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

uint64_t sub_25DDBA458(uint64_t a1, uint64_t a2)
{
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 32))(a2, a1, EnablementStatus);
  return a2;
}

uint64_t sub_25DDBA4BC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25DDE2DC0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25DDBA500(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25DDE2DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x270FA5388](EnablementStatus - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BF0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_25DDBA254(a1, (uint64_t)v14);
  sub_25DDBA254(a2, v15);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  switch(v17((uint64_t)v14, 3, v16))
  {
    case 1u:
      if (v17(v15, 3, v16) != 1) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2u:
      if (v17(v15, 3, v16) != 2) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 3u:
      if (v17(v15, 3, v16) != 3) {
        goto LABEL_9;
      }
LABEL_5:
      sub_25DDBA878((uint64_t)v14);
      char v18 = 1;
      break;
    default:
      sub_25DDBA254((uint64_t)v14, (uint64_t)v10);
      if (v17(v15, 3, v16))
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_9:
        sub_25DDBA81C((uint64_t)v14, &qword_26A6C7BF0);
        char v18 = 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
        char v18 = sub_25DDE2D90();
        uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
        v20(v7, v4);
        v20(v10, v4);
        sub_25DDBA878((uint64_t)v14);
      }
      break;
  }
  return v18 & 1;
}

uint64_t sub_25DDBA81C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDBA878(uint64_t a1)
{
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 8))(a1, EnablementStatus);
  return a1;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriFirstEnablementStatus.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriFirstEnablementStatus.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DDBAA3CLL);
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

uint64_t sub_25DDBAA64(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DDBAA70(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.CodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.UnknownCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.NeverEnabledCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.NeverEnabledCodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25DDBAB94);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25DDBABBC()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.LongTermEnabledCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.LongTermEnabledCodingKeys;
}

unint64_t sub_25DDBABF0()
{
  unint64_t result = qword_26A6C7BF8;
  if (!qword_26A6C7BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7BF8);
  }
  return result;
}

unint64_t sub_25DDBAC48()
{
  unint64_t result = qword_26A6C7C00;
  if (!qword_26A6C7C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C00);
  }
  return result;
}

unint64_t sub_25DDBACA0()
{
  unint64_t result = qword_26A6C7C08;
  if (!qword_26A6C7C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C08);
  }
  return result;
}

unint64_t sub_25DDBACF8()
{
  unint64_t result = qword_26A6C7C10;
  if (!qword_26A6C7C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C10);
  }
  return result;
}

unint64_t sub_25DDBAD50()
{
  unint64_t result = qword_26A6C7C18;
  if (!qword_26A6C7C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C18);
  }
  return result;
}

unint64_t sub_25DDBADA8()
{
  unint64_t result = qword_26A6C7C20;
  if (!qword_26A6C7C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C20);
  }
  return result;
}

unint64_t sub_25DDBAE00()
{
  unint64_t result = qword_26A6C7C28;
  if (!qword_26A6C7C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C28);
  }
  return result;
}

unint64_t sub_25DDBAE58()
{
  unint64_t result = qword_26A6C7C30;
  if (!qword_26A6C7C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C30);
  }
  return result;
}

unint64_t sub_25DDBAEB0()
{
  unint64_t result = qword_26A6C7C38;
  if (!qword_26A6C7C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C38);
  }
  return result;
}

unint64_t sub_25DDBAF08()
{
  unint64_t result = qword_26A6C7C40;
  if (!qword_26A6C7C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C40);
  }
  return result;
}

unint64_t sub_25DDBAF60()
{
  unint64_t result = qword_26A6C7C48;
  if (!qword_26A6C7C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7C48);
  }
  return result;
}

unint64_t sub_25DDBAFB8()
{
  unint64_t result = qword_26A6C7C50;
  if (!qword_26A6C7C50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26A6C7C50);
  }
  return result;
}

uint64_t sub_25DDBB00C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616E45726576656ELL && a2 == 0xEC00000064656C62 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x796C746E65636572 && a2 == 0xEF64656C62616E45 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D726554676E6F6CLL && a2 == 0xEF64656C62616E45)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_25DDE3480();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_25DDBB1E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 1716482913 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_25DDE3480();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_25DDBB260()
{
  return 1716482913;
}

uint64_t sub_25DDBB278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CB0);
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CB8);
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDBB3B0, 0, 0);
}

uint64_t sub_25DDBB3B0()
{
  sub_25DDE2F70();
  sub_25DDE2CF0();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  sub_25DDE2CF0();
  uint64_t v4 = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25DDBB4B8;
  uint64_t v6 = *(void *)(v0 + 64);
  return MEMORY[0x270F085A0](v0 + 16, v6, v2, 0, v4, 0, 0, 1);
}

uint64_t sub_25DDBB4B8()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25DDBC5A4;
  }
  else {
    uint64_t v2 = sub_25DDBB5CC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDBB5CC()
{
  uint64_t v1 = v0[16];
  uint64_t v9 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = v0[10];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_25DDE2F40();
  sub_25DDBC55C(&qword_26A6C7CC0, &qword_26A6C7CB0);
  sub_25DDE2EC0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v9, v1, v3);
  sub_25DDBC55C(&qword_26A6C7CC8, &qword_26A6C7CB8);
  sub_25DDE3230();
  sub_25DDE3010();
  sub_25DDE3220();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25DDBB7C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C60);
  v3[10] = v4;
  v3[11] = *(void *)(v4 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C68);
  v3[13] = v5;
  v3[14] = *(void *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDBB8FC, 0, 0);
}

uint64_t sub_25DDBB8FC()
{
  sub_25DDE2F70();
  sub_25DDE2CF0();
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  sub_25DDE2CF0();
  uint64_t v4 = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25DDBBA04;
  uint64_t v6 = *(void *)(v0 + 64);
  return MEMORY[0x270F085A0](v0 + 16, v6, v2, 0, v4, 0, 0, 1);
}

uint64_t sub_25DDBBA04()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25DDBBD0C;
  }
  else {
    uint64_t v2 = sub_25DDBBB18;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDBBB18()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[14];
  uint64_t v6 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v7 = v0[10];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_25DDE2F50();
  sub_25DDBC55C(&qword_26A6C7C78, &qword_26A6C7C60);
  sub_25DDE2EC0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  sub_25DDBC55C(&qword_26A6C7C80, &qword_26A6C7C68);
  sub_25DDE3230();
  sub_25DDE2F00();
  sub_25DDE3220();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_25DDBBD0C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25DDBBD84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DDBBDBC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return MEMORY[0x270FA2498](sub_25DDBBDDC, 0, 0);
}

uint64_t sub_25DDBBDDC()
{
  swift_beginAccess();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CE0);
  uint64_t v2 = sub_25DDBC55C((unint64_t *)&unk_26A6C7CE8, &qword_26A6C7CE0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25DDBBEE4;
  return MEMORY[0x270FA1E80](v0 + 40, v1, v2);
}

uint64_t sub_25DDBBEE4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25DDBC5A0, 0, 0);
  }
  else
  {
    swift_endAccess();
    **(void **)(v2 + 48) = *(void *)(v2 + 40);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25DDBC028(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return MEMORY[0x270FA2498](sub_25DDBC048, 0, 0);
}

uint64_t sub_25DDBC048()
{
  swift_beginAccess();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C98);
  uint64_t v2 = sub_25DDBC55C(&qword_26A6C7CA0, &qword_26A6C7C98);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_25DDBC150;
  return MEMORY[0x270FA1E80](v0 + 40, v1, v2);
}

uint64_t sub_25DDBC150()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25DDBC294, 0, 0);
  }
  else
  {
    swift_endAccess();
    **(void **)(v2 + 48) = *(void *)(v2 + 40);
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25DDBC294()
{
  uint64_t v1 = *(void **)(v0 + 72);
  swift_endAccess();

  **(void **)(v0 + 48) = 0;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25DDBC308(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25DDBC3B8;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A6C7C88 + dword_26A6C7C88);
  return v5(a1, v1);
}

uint64_t sub_25DDBC3B8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DDBC4AC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25DDBC5A8;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A6C7CD0 + dword_26A6C7CD0);
  return v5(a1, v1);
}

uint64_t sub_25DDBC55C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25DDBC5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25DDBC69C;
  return v7(a1, a2);
}

uint64_t sub_25DDBC69C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

ValueMetadata *type metadata accessor for ITunesCloudMusicSubscriptionStatusController()
{
  return &type metadata for ITunesCloudMusicSubscriptionStatusController;
}

uint64_t sub_25DDBC7A8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7A40);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return MEMORY[0x270FA2408](a1);
  }
}

uint64_t sub_25DDBC868()
{
  return MEMORY[0x270FA2498](sub_25DDBC884, 0, 0);
}

uint64_t sub_25DDBC884()
{
  id v1 = objc_msgSend(self, sel_sharedStatusController);
  v0[16] = v1;
  id v2 = objc_msgSend(self, sel_activeAccount);
  v0[17] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_25DDBC9E0;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_25DDBC7A8;
  v0[13] = &block_descriptor;
  v0[14] = v3;
  objc_msgSend(v1, sel_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler_, v2, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_25DDBC9E0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 144) = v1;
  if (v1) {
    id v2 = sub_25DDBCB60;
  }
  else {
    id v2 = sub_25DDBCAF0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDBCAF0()
{
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 120);

  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_25DDBCB60()
{
  uint64_t v1 = (void *)v0[17];
  uint64_t v2 = (void *)v0[16];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_25DDBCBD8()
{
  off_26A6C7D00 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

uint64_t sub_25DDBCBEC(char a1)
{
  return *(void *)&aUnknown_4[8 * a1];
}

BOOL sub_25DDBCC0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25DDBCC20()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDBCC68()
{
  return sub_25DDE34F0();
}

uint64_t sub_25DDBCC94()
{
  return sub_25DDE3500();
}

uint64_t *sub_25DDBCCD8@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_25DDBCCF0(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_25DDBCCFC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25DDE2B60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t sub_25DDBCDD0(uint64_t a1)
{
  uint64_t v2 = sub_25DDE2B60();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_25DDBCE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDE2B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_25DDBCEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDE2B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_25DDBCF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDE2B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_25DDBCFC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDE2B60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t sub_25DDBD048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDBD05C);
}

uint64_t sub_25DDBD05C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDE2B60();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 3) {
      return v10 - 2;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_25DDBD118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDBD12C);
}

uint64_t sub_25DDBD12C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25DDE2B60();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t type metadata accessor for SiriUsageMetrics()
{
  uint64_t result = qword_26A6C7D08;
  if (!qword_26A6C7D08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDBD234()
{
  uint64_t result = sub_25DDE2B60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DDBD2D8()
{
  return sub_25DDBCBEC(*v0);
}

BOOL sub_25DDBD2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_25DDE2B10() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20))
      && *(void *)(a1 + *(int *)(a3 + 24)) == *(void *)(a2 + *(int *)(a3 + 24));
}

uint64_t getEnumTagSinglePayload for ProductId(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ProductId(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25DDBD4A4);
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

uint64_t sub_25DDBD4CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DDBD4D8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProductId()
{
  return &type metadata for ProductId;
}

unint64_t sub_25DDBD4F4()
{
  unint64_t result = qword_26A6C7D18;
  if (!qword_26A6C7D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7D18);
  }
  return result;
}

uint64_t sub_25DDBD548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  int v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unsigned int v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_25DDE2DC0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v25 - v16;
  sub_25DDBF600(a2, (uint64_t)v10);
  char v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v18(v10, 1, v11) == 1)
  {
    sub_25DDBF5A0((uint64_t)v10);
    return sub_25DDBF600(v26, a3);
  }
  else
  {
    uint64_t v25 = a3;
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v20(v17, v10, v11);
    sub_25DDBF600(v26, (uint64_t)v8);
    if (v18(v8, 1, v11) == 1)
    {
      sub_25DDBF5A0((uint64_t)v8);
      uint64_t v21 = v25;
      v20((char *)v25, v17, v11);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v21, 0, 1, v11);
    }
    else
    {
      v20(v15, v8, v11);
      sub_25DDC10A4((unint64_t *)&qword_26A6C7D28, MEMORY[0x263F07490]);
      if (sub_25DDE30D0()) {
        uint64_t v22 = v17;
      }
      else {
        uint64_t v22 = v15;
      }
      uint64_t v23 = v25;
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v25, v22, v11);
      uint64_t v24 = *(void (**)(char *, uint64_t))(v12 + 8);
      v24(v15, v11);
      v24(v17, v11);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v23, 0, 1, v11);
    }
  }
}

uint64_t sub_25DDBD83C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v104 = a3;
  uint64_t v112 = a1;
  uint64_t v8 = sub_25DDE2BC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v107 = v8;
  uint64_t v108 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v106 = (char *)&v94 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v111 = (char *)&v94 - v12;
  uint64_t v13 = sub_25DDE2DE0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25DDE2E90();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v109 = v17;
  uint64_t v110 = v18;
  MEMORY[0x270FA5388](v17);
  v113 = (char *)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_25DDE2DC0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t result = MEMORY[0x270FA5388](v25);
  if (*(unsigned char *)(v5 + 16) != 1)
  {
    if (*(unsigned char *)(v5 + 17)) {
      char v29 = 2;
    }
    else {
      char v29 = 1;
    }
    *a4 = v29;
    return result;
  }
  uint64_t v102 = v28;
  v103 = a4;
  v105 = (char *)&v94 - v27;
  sub_25DDBF600(a2, (uint64_t)v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) == 1)
  {
    uint64_t result = sub_25DDBF5A0((uint64_t)v22);
    char *v103 = 0;
    return result;
  }
  uint64_t v100 = v23;
  uint64_t v101 = v24;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v105, v22, v23);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F07740], v13);
  sub_25DDE2DF0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D30);
  uint64_t v31 = sub_25DDE2E80();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(unsigned __int8 *)(v32 + 80);
  uint64_t v34 = (v33 + 32) & ~v33;
  uint64_t v98 = v34 + *(void *)(v32 + 72);
  uint64_t v99 = v30;
  uint64_t v97 = v33 | 7;
  uint64_t v35 = swift_allocObject();
  long long v96 = xmmword_25DDE46C0;
  *(_OWORD *)(v35 + 16) = xmmword_25DDE46C0;
  uint64_t v36 = *(void (**)(uint64_t, void, uint64_t))(v32 + 104);
  v36(v35 + v34, *MEMORY[0x263F078A8], v31);
  sub_25DDC04CC(v35);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v37 = v111;
  sub_25DDE2E20();
  swift_bridgeObjectRelease();
  uint64_t v38 = sub_25DDE2B90();
  if (v39)
  {
    v114[0] = 0;
    v114[1] = 0xE000000000000000;
    sub_25DDE3330();
    swift_bridgeObjectRelease();
    v114[0] = 0xD000000000000010;
    v114[1] = 0x800000025DDE5680;
    sub_25DDC10A4(&qword_26A6C7D38, MEMORY[0x263F063B0]);
    uint64_t v61 = v107;
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    uint64_t v62 = v114[0];
    uint64_t v63 = v114[1];
    sub_25DDC07E4();
    swift_allocError();
    *char v64 = v62;
    v64[1] = v63;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v108 + 8))(v37, v61);
LABEL_24:
    uint64_t v52 = v100;
    uint64_t v53 = v101;
    goto LABEL_25;
  }
  uint64_t v95 = v38;
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_25DDE3040();
  uint64_t v94 = __swift_project_value_buffer(v40, (uint64_t)qword_26B3808C0);
  uint64_t v41 = sub_25DDE3020();
  os_log_type_t v42 = sub_25DDE3250();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 134217984;
    v114[0] = v95;
    sub_25DDE32D0();
    _os_log_impl(&dword_25DDB4000, v41, v42, "ActivitySegmentMetrics: assistant last active: %ld months ago", v43, 0xCu);
    MEMORY[0x2611C78C0](v43, -1, -1);
  }

  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = v96;
  v36(v44 + v34, *MEMORY[0x263F07870], v31);
  sub_25DDC04CC(v44);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  char v45 = v106;
  sub_25DDE2E20();
  swift_bridgeObjectRelease();
  uint64_t v46 = sub_25DDE2B70();
  if (v47)
  {
    v114[0] = 0;
    v114[1] = 0xE000000000000000;
    sub_25DDE3330();
    swift_bridgeObjectRelease();
    strcpy((char *)v114, "day is nil in ");
    HIBYTE(v114[1]) = -18;
    sub_25DDC10A4(&qword_26A6C7D38, MEMORY[0x263F063B0]);
    uint64_t v65 = v107;
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    uint64_t v66 = v114[0];
    uint64_t v67 = v114[1];
    sub_25DDC07E4();
    swift_allocError();
    void *v68 = v66;
    v68[1] = v67;
    swift_willThrow();
    v69 = *(void (**)(char *, uint64_t))(v108 + 8);
    v69(v45, v65);
    v69(v37, v65);
    goto LABEL_24;
  }
  uint64_t v48 = v46;
  uint64_t v49 = sub_25DDE3020();
  os_log_type_t v50 = sub_25DDE3250();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 134217984;
    char v45 = v106;
    v114[0] = v48;
    sub_25DDE32D0();
    _os_log_impl(&dword_25DDB4000, v49, v50, "ActivitySegmentMetrics: assistant last active: %ld days ago", v51, 0xCu);
    MEMORY[0x2611C78C0](v51, -1, -1);
  }

  uint64_t v52 = v100;
  uint64_t v53 = v101;
  int v54 = v103;
  if (v95 >= 6)
  {
    uint64_t v70 = v107;
    v71 = *(void (**)(char *, uint64_t))(v108 + 8);
    v71(v45, v107);
    v71(v37, v70);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
    *int v54 = 3;
  }
  else if (v48 >= 28)
  {
    uint64_t v72 = v107;
    v73 = *(void (**)(char *, uint64_t))(v108 + 8);
    v73(v45, v107);
    v73(v37, v72);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
    *int v54 = 4;
  }
  else if (v48 >= 14)
  {
    uint64_t v74 = v107;
    v75 = *(void (**)(char *, uint64_t))(v108 + 8);
    v75(v45, v107);
    v75(v37, v74);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
    *int v54 = 5;
  }
  else if (v48 >= 7)
  {
    uint64_t v76 = v107;
    v77 = *(void (**)(char *, uint64_t))(v108 + 8);
    v77(v45, v107);
    v77(v37, v76);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
    *int v54 = 6;
  }
  else
  {
    uint64_t v55 = v102;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 16))(v102, v112, v100);
    uint64_t v56 = v104;
    swift_bridgeObjectRetain();
    uint64_t v57 = v56;
    uint64_t v58 = v114[4];
    uint64_t result = sub_25DDC0838(v55, v57);
    if (v58)
    {
      uint64_t v59 = v107;
      os_log_t v60 = *(void (**)(char *, uint64_t))(v108 + 8);
      v60(v45, v107);
      v60(v37, v59);
LABEL_25:
      (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
    }
    uint64_t v78 = *(void *)(result + 16);
    if (v78)
    {
      uint64_t v79 = 0;
      unint64_t v80 = 0;
      do
      {
        uint64_t v81 = *(void *)(result + 8 * v79 + 32);
        BOOL v82 = __CFADD__(v80, v81);
        v80 += v81;
        if (v82)
        {
          __break(1u);
          return result;
        }
        ++v79;
      }
      while (v78 != v79);
      if (v80 == 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v83 = v107;
        v84 = *(void (**)(char *, uint64_t))(v108 + 8);
        v84(v45, v107);
        v84(v37, v83);
        (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
        *int v54 = 7;
        return result;
      }
      if (v80 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
      {
        swift_bridgeObjectRelease();
        uint64_t v87 = v107;
        v88 = *(void (**)(char *, uint64_t))(v108 + 8);
        v88(v45, v107);
        v88(v37, v87);
        (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
        *int v54 = 8;
      }
      else
      {
        if (v80 < 4) {
          goto LABEL_38;
        }
        BOOL v89 = sub_25DDBE5F8(result);
        swift_bridgeObjectRelease();
        v90 = *(void (**)(char *, uint64_t))(v108 + 8);
        v91 = v45;
        uint64_t v92 = v107;
        v90(v91, v107);
        v90(v37, v92);
        (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
        if (v89) {
          char v93 = 10;
        }
        else {
          char v93 = 9;
        }
        *int v54 = v93;
      }
    }
    else
    {
LABEL_38:
      swift_bridgeObjectRelease();
      uint64_t v85 = v107;
      v86 = *(void (**)(char *, uint64_t))(v108 + 8);
      v86(v45, v107);
      v86(v37, v85);
      (*(void (**)(char *, uint64_t))(v110 + 8))(v113, v109);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v105, v52);
      *int v54 = 0;
    }
  }
  return result;
}

BOOL sub_25DDBE5F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unint64_t v5 = *(void *)(a1 + 8 * v3 + 32);
      if (v5 >= 2)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v4 = sub_25DDCCDD4(0, v4[2] + 1, 1, v4);
        }
        unint64_t v7 = v4[2];
        unint64_t v6 = v4[3];
        if (v7 >= v6 >> 1) {
          uint64_t v4 = sub_25DDCCDD4((void *)(v6 > 1), v7 + 1, 1, v4);
        }
        v4[2] = v7 + 1;
        v4[v7 + 4] = v5;
      }
      ++v3;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v8 = v4[2];
  swift_bridgeObjectRelease();
  return v8 > 2;
}

uint64_t sub_25DDBE6F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v130 = a1;
  uint64_t v129 = a3;
  uint64_t v156 = type metadata accessor for SiriUsageMetrics();
  uint64_t v4 = *(void *)(v156 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v156);
  uint64_t v151 = (uint64_t)&v127 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v150 = (uint64_t)&v127 - v8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v159 = (uint64_t)&v127 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v132 = (uint64_t)&v127 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v127 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v127 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v127 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D20);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v142 = (uint64_t)&v127 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v141 = (uint64_t)&v127 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v135 = (char *)&v127 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v137 = (uint64_t)&v127 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  v140 = (char *)&v127 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v134 = (char *)&v127 - v33;
  MEMORY[0x270FA5388](v32);
  v128 = (char *)&v127 - v34;
  uint64_t v35 = sub_25DDE2DC0();
  uint64_t v36 = MEMORY[0x270FA5388](v35);
  v149 = (char *)&v127 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v139 = (char *)&v127 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v146 = (char *)&v127 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v44 = (char *)&v127 - v43;
  uint64_t v45 = MEMORY[0x270FA5388](v42);
  v143 = (char *)&v127 - v46;
  MEMORY[0x270FA5388](v45);
  uint64_t v131 = v47;
  v154 = *(void (**)(void))(v47 + 16);
  v155 = (char *)&v127 - v48;
  uint64_t v158 = v49;
  uint64_t v148 = v47 + 16;
  v154();
  os_log_type_t v50 = *(void (***)(char *, uint64_t))(a2 + 16);
  uint64_t v147 = a2;
  swift_bridgeObjectRetain();
  v157 = v50;
  if (v50)
  {
    uint64_t v51 = 0;
    uint64_t v52 = v147 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v53 = *(void (**)(void, void, void, void))(v4 + 72);
    v153 = (void (**)(char *, uint64_t))(v131 + 8);
    v144 = v53;
    v145 = v20;
    while (1)
    {
      sub_25DDBF414(v52, (uint64_t)v20);
      uint64_t v54 = v156;
      int v55 = v20[*(int *)(v156 + 20)];
      sub_25DDBF414((uint64_t)v20, (uint64_t)v18);
      if (v55 != 1) {
        break;
      }
      uint64_t v56 = *(void *)&v18[*(int *)(v54 + 24)];
      sub_25DDBF478((uint64_t)v18);
      sub_25DDBF414((uint64_t)v20, (uint64_t)v15);
      ((void (*)(char *, char *, uint64_t))v154)(v44, v155, v158);
      if (!v56) {
        goto LABEL_4;
      }
      uint64_t v57 = v18;
      uint64_t v58 = v15;
      uint64_t v59 = v146;
      sub_25DDE2B20();
      sub_25DDC10A4((unint64_t *)&qword_26A6C7D28, MEMORY[0x263F07490]);
      os_log_t v60 = v44;
      uint64_t v61 = v158;
      LODWORD(v152) = sub_25DDE30C0();
      uint64_t v62 = *v153;
      uint64_t v63 = v59;
      uint64_t v15 = v58;
      uint64_t v18 = v57;
      uint64_t v20 = v145;
      (*v153)(v63, v61);
      sub_25DDBF478((uint64_t)v15);
      char v64 = v60;
      uint64_t v65 = v61;
      uint64_t v44 = v60;
      uint64_t v53 = v144;
      v62(v64, v65);
      if ((v152 & 1) == 0)
      {
        uint64_t v66 = v137;
        sub_25DDBF4D4((uint64_t)v20, v137);
        uint64_t v67 = v156;
        v138 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
        v138(v66, 0, 1, v156);
        unint64_t v68 = (unint64_t)v51 + 1;
        goto LABEL_11;
      }
LABEL_5:
      uint64_t v51 = (void (**)(char *, uint64_t))((char *)v51 + 1);
      sub_25DDBF478((uint64_t)v20);
      v52 += (uint64_t)v53;
      if (v157 == v51) {
        goto LABEL_10;
      }
    }
    sub_25DDBF478((uint64_t)v18);
    sub_25DDBF414((uint64_t)v20, (uint64_t)v15);
    ((void (*)(char *, char *, uint64_t))v154)(v44, v155, v158);
LABEL_4:
    sub_25DDBF478((uint64_t)v15);
    (*v153)(v44, v158);
    goto LABEL_5;
  }
LABEL_10:
  uint64_t v66 = v137;
  uint64_t v67 = v156;
  v138 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
  v138(v137, 1, 1, v156);
  unint64_t v68 = (unint64_t)v157;
LABEL_11:
  uint64_t v69 = v66;
  uint64_t v70 = (uint64_t)v135;
  sub_25DDBF538(v69, (uint64_t)v135);
  v71 = *(uint64_t (**)(void, void, void))(v4 + 48);
  uint64_t v137 = v4 + 48;
  v136 = v71;
  int v72 = v71(v70, 1, v67);
  uint64_t v73 = v131;
  if (v72 == 1)
  {
    uint64_t v74 = *(void (**)(void, void, void, void))(v131 + 56);
    uint64_t v75 = (uint64_t)v134;
    uint64_t v76 = v134;
    uint64_t v77 = 1;
  }
  else
  {
    uint64_t v78 = v70;
    uint64_t v79 = v132;
    sub_25DDBF4D4(v78, v132);
    uint64_t v75 = (uint64_t)v134;
    sub_25DDE2B20();
    sub_25DDBF478(v79);
    uint64_t v74 = *(void (**)(void, void, void, void))(v73 + 56);
    uint64_t v76 = (char *)v75;
    uint64_t v77 = 0;
  }
  v144 = v74;
  v74(v76, v77, 1, v158);
  uint64_t v80 = v147;
  uint64_t v81 = v73 + 48;
  BOOL v82 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48);
  if (v82(v75, 1, v158) == 1)
  {
    sub_25DDBF5A0(v75);
    uint64_t v83 = 1;
    uint64_t v84 = v130;
    uint64_t v85 = v129;
    uint64_t v86 = (uint64_t)v128;
LABEL_39:
    uint64_t v126 = v158;
    v144(v86, v83, 1, v158);
    sub_25DDBD548(v84, v86, v85);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v155, v126);
    return sub_25DDBF5A0(v86);
  }
  v88 = *(void (**)(void, void, void))(v73 + 32);
  uint64_t v87 = (char *)(v73 + 32);
  v133 = (void (*)(char *, char *, uint64_t))v88;
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v88)(v143, v75, v158);
  v90 = v87 - 24;
  v134 = (char *)(v4 + 56);
  v145 = v87;
  v135 = v87 + 24;
  uint64_t v91 = v81;
  uint64_t v92 = v82;
  v152 = v90;
  while ((void (**)(char *, uint64_t))v68 == v157)
  {
LABEL_20:
    uint64_t v93 = v141;
    v138(v141, 1, 1, v67);
    unint64_t v68 = (unint64_t)v157;
LABEL_21:
    uint64_t v94 = v93;
    uint64_t v95 = v142;
    sub_25DDBF538(v94, v142);
    int v96 = v136(v95, 1, v67);
    uint64_t v97 = (uint64_t)v140;
    if (v96 == 1)
    {
      uint64_t v98 = v140;
      uint64_t v99 = 1;
    }
    else
    {
      uint64_t v117 = v95;
      uint64_t v118 = v132;
      sub_25DDBF4D4(v117, v132);
      sub_25DDE2B20();
      sub_25DDBF478(v118);
      uint64_t v98 = (char *)v97;
      uint64_t v99 = 0;
    }
    v144(v98, v99, 1, v158);
    v119 = v139;
    v120 = v143;
    if (v92(v97, 1, v158) == 1)
    {
      sub_25DDBF5A0(v97);
      uint64_t v86 = (uint64_t)v128;
      v133(v128, v120, v158);
      uint64_t v83 = 0;
      uint64_t v84 = v130;
      uint64_t v85 = v129;
      uint64_t v73 = v131;
      goto LABEL_39;
    }
    v121 = (uint64_t (*)(char *, char *, uint64_t))v133;
    v133(v119, (char *)v97, v158);
    sub_25DDC10A4((unint64_t *)&qword_26A6C7D28, MEMORY[0x263F07490]);
    v122 = v120;
    char v123 = sub_25DDE30C0();
    v90 = v152;
    v124 = *(void (**)(char *, uint64_t))v152;
    if (v123)
    {
      uint64_t v125 = v158;
      v124(v122, v158);
      uint64_t result = v121(v122, v119, v125);
    }
    else
    {
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v124)(v119, v158);
    }
    uint64_t v80 = v147;
  }
  uint64_t v100 = v157;
  if (v68 > (unint64_t)v157) {
    uint64_t v100 = (void (**)(char *, uint64_t))v68;
  }
  v153 = v100;
  while (v153 != (void (**)(char *, uint64_t))v68)
  {
    v103 = v92;
    uint64_t v104 = v91;
    uint64_t v105 = v4;
    uint64_t v106 = v159;
    sub_25DDBF414(v80+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v68, v159);
    uint64_t v107 = v67;
    int v108 = *(unsigned __int8 *)(v106 + *(int *)(v67 + 20));
    uint64_t v109 = v106;
    uint64_t v110 = v150;
    sub_25DDBF414(v109, v150);
    if (v108 != 1)
    {
      sub_25DDBF478(v110);
      uint64_t v101 = v151;
      sub_25DDBF414(v159, v151);
      uint64_t v102 = v149;
      ((void (*)(char *, char *, uint64_t))v154)(v149, v155, v158);
LABEL_27:
      sub_25DDBF478(v101);
      (*(void (**)(char *, uint64_t))v90)(v102, v158);
      uint64_t v4 = v105;
      goto LABEL_28;
    }
    uint64_t v111 = *(void *)(v110 + *(int *)(v107 + 24));
    sub_25DDBF478(v110);
    uint64_t v101 = v151;
    sub_25DDBF414(v159, v151);
    uint64_t v102 = v149;
    ((void (*)(char *, char *, uint64_t))v154)(v149, v155, v158);
    if (!v111) {
      goto LABEL_27;
    }
    uint64_t v112 = v158;
    v113 = v146;
    sub_25DDE2B20();
    sub_25DDC10A4((unint64_t *)&qword_26A6C7D28, MEMORY[0x263F07490]);
    char v114 = sub_25DDE30C0();
    v115 = *(void (**)(char *, uint64_t))v152;
    (*(void (**)(char *, uint64_t))v152)(v113, v112);
    sub_25DDBF478(v101);
    uint64_t v116 = v112;
    v90 = v152;
    v115(v102, v116);
    uint64_t v80 = v147;
    uint64_t v4 = v105;
    if ((v114 & 1) == 0)
    {
      uint64_t v93 = v141;
      sub_25DDBF4D4(v159, v141);
      uint64_t v67 = v156;
      v138(v93, 0, 1, v156);
      ++v68;
      uint64_t v91 = v104;
      uint64_t v92 = v103;
      goto LABEL_21;
    }
LABEL_28:
    ++v68;
    uint64_t result = sub_25DDBF478(v159);
    uint64_t v67 = v156;
    uint64_t v91 = v104;
    uint64_t v92 = v103;
    if (v157 == (void (**)(char *, uint64_t))v68) {
      goto LABEL_20;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDBF3E0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivitySegmentCalculator()
{
  return self;
}

uint64_t sub_25DDBF414(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriUsageMetrics();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDBF478(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriUsageMetrics();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DDBF4D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriUsageMetrics();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDBF538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDBF5A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DDBF600(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_25DDBF678(unsigned char *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, void *a4@<X8>, double a5@<D0>)
{
  uint64_t v93 = a4;
  uint64_t v83 = a3;
  uint64_t v92 = a2;
  uint64_t v91 = type metadata accessor for SiriUsageMetrics();
  uint64_t v7 = MEMORY[0x270FA5388](v91);
  uint64_t v9 = &v80[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  v90 = &v80[-v11];
  MEMORY[0x270FA5388](v10);
  uint64_t v85 = &v80[-v12];
  uint64_t v13 = sub_25DDE2BC0();
  uint64_t v86 = *(void *)(v13 - 8);
  uint64_t v87 = v13;
  MEMORY[0x270FA5388](v13);
  BOOL v89 = &v80[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_25DDE2DC0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v80[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v84 = &v80[-v21];
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = &v80[-v22];
  sub_25DDE2B50();
  if (v24 != a5)
  {
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_25DDE3040();
    __swift_project_value_buffer(v53, (uint64_t)qword_26B3808C0);
    sub_25DDBF414((uint64_t)a1, (uint64_t)v9);
    uint64_t v54 = sub_25DDE3020();
    os_log_type_t v55 = sub_25DDE3250();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      v94[0] = v57;
      *(_DWORD *)uint64_t v56 = 136315138;
      sub_25DDE2B60();
      sub_25DDC10A4(&qword_26A6C7D50, MEMORY[0x263F062D0]);
      uint64_t v58 = sub_25DDE3470();
      uint64_t v95 = sub_25DDCA0E4(v58, v59, v94);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      sub_25DDBF478((uint64_t)v9);
      _os_log_impl(&dword_25DDB4000, v54, v55, "SiriActivityWeek.init(): metrics time interval: %s is not equal to one day", v56, 0xCu);
      char v60 = 1;
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v57, -1, -1);
      MEMORY[0x2611C78C0](v56, -1, -1);

      uint64_t v61 = 0;
LABEL_21:
      uint64_t v75 = v93;
      *uint64_t v93 = v61;
      *((unsigned char *)v75 + 8) = v60;
      return;
    }
    sub_25DDBF478((uint64_t)v9);

    goto LABEL_20;
  }
  sub_25DDE2B40();
  char v25 = sub_25DDE2E50();
  v88 = *(void (**)(unsigned char *, uint64_t))(v16 + 8);
  v88(v23, v15);
  if ((v25 & 1) == 0)
  {
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_25DDE3040();
    __swift_project_value_buffer(v62, (uint64_t)qword_26B3808C0);
    uint64_t v63 = v90;
    sub_25DDBF414((uint64_t)a1, (uint64_t)v90);
    char v64 = v19;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16))(v19, v92, v15);
    uint64_t v65 = v15;
    uint64_t v66 = sub_25DDE3020();
    os_log_type_t v67 = sub_25DDE3250();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint64_t)v63;
      uint64_t v69 = swift_slowAlloc();
      uint64_t v92 = swift_slowAlloc();
      v94[0] = v92;
      *(_DWORD *)uint64_t v69 = 136315394;
      uint64_t v91 = v69 + 4;
      sub_25DDE2B60();
      sub_25DDC10A4(&qword_26A6C7D50, MEMORY[0x263F062D0]);
      uint64_t v70 = sub_25DDE3470();
      uint64_t v95 = sub_25DDCA0E4(v70, v71, v94);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      sub_25DDBF478(v68);
      *(_WORD *)(v69 + 12) = 2080;
      sub_25DDC10A4((unint64_t *)&qword_26A6C7D48, MEMORY[0x263F07490]);
      uint64_t v72 = sub_25DDE3470();
      uint64_t v95 = sub_25DDCA0E4(v72, v73, v94);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      v88(v64, v65);
      _os_log_impl(&dword_25DDB4000, v66, v67, "SiriActivityWeek.init(): metrics time interval: %s is not aligned with weekEnding date: %s", (uint8_t *)v69, 0x16u);
      uint64_t v74 = v92;
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v74, -1, -1);
      MEMORY[0x2611C78C0](v69, -1, -1);
    }
    else
    {
      sub_25DDBF478((uint64_t)v63);
      v88(v19, v65);
    }

    goto LABEL_20;
  }
  if (a1[*(int *)(v91 + 20)] != 1)
  {
LABEL_20:
    uint64_t v61 = 0;
    char v60 = 1;
    goto LABEL_21;
  }
  uint64_t v82 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D30);
  uint64_t v26 = sub_25DDE2E80();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  v90 = a1;
  uint64_t v29 = v15;
  uint64_t v30 = (v28 + 32) & ~v28;
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_25DDE46C0;
  (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v31 + v30, *MEMORY[0x263F07870], v26);
  sub_25DDC04CC(v31);
  swift_setDeallocating();
  uint64_t v32 = v90;
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_25DDE2B20();
  uint64_t v33 = v89;
  uint64_t v34 = v92;
  sub_25DDE2E20();
  swift_bridgeObjectRelease();
  uint64_t v35 = v23;
  uint64_t v36 = v29;
  v88(v35, v29);
  uint64_t v37 = sub_25DDE2B70();
  if ((v38 & 1) == 0)
  {
    uint64_t v39 = v37;
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_25DDE3040();
    __swift_project_value_buffer(v40, (uint64_t)qword_26B3808C0);
    uint64_t v41 = v84;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v82 + 16))(v84, v34, v36);
    uint64_t v42 = v85;
    sub_25DDBF414((uint64_t)v32, (uint64_t)v85);
    uint64_t v43 = sub_25DDE3020();
    os_log_type_t v44 = sub_25DDE3250();
    int v45 = v44;
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v92 = v39;
      uint64_t v47 = v46;
      uint64_t v82 = swift_slowAlloc();
      v94[0] = v82;
      *(_DWORD *)uint64_t v47 = 134218498;
      uint64_t v95 = v92;
      sub_25DDE32D0();
      *(_WORD *)(v47 + 12) = 2080;
      sub_25DDC10A4((unint64_t *)&qword_26A6C7D48, MEMORY[0x263F07490]);
      int v81 = v45;
      uint64_t v48 = sub_25DDE3470();
      uint64_t v95 = sub_25DDCA0E4(v48, v49, v94);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      v88(v41, v36);
      *(_WORD *)(v47 + 22) = 2048;
      uint64_t v50 = *(void *)&v42[*(int *)(v91 + 24)];
      sub_25DDBF478((uint64_t)v42);
      uint64_t v95 = v50;
      sub_25DDE32D0();
      _os_log_impl(&dword_25DDB4000, v43, (os_log_type_t)v81, "SiriActivityWeek: assistant valid turn count from %ld days before %s is %lu", (uint8_t *)v47, 0x20u);
      uint64_t v51 = v82;
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v51, -1, -1);
      uint64_t v52 = v47;
      uint64_t v39 = v92;
      MEMORY[0x2611C78C0](v52, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v89, v87);
    }
    else
    {
      sub_25DDBF478((uint64_t)v42);

      v88(v41, v36);
      (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v33, v87);
    }
    uint64_t v61 = 0;
    char v60 = 1;
    if ((v39 & 0x8000000000000000) == 0 && v39 < v83)
    {
      char v60 = 0;
      uint64_t v61 = *(void *)&v90[*(int *)(v91 + 24)];
    }
    goto LABEL_21;
  }
  v94[0] = 0;
  v94[1] = 0xE000000000000000;
  sub_25DDE3330();
  swift_bridgeObjectRelease();
  strcpy((char *)v94, "day is nil in ");
  HIBYTE(v94[1]) = -18;
  sub_25DDC10A4(&qword_26A6C7D38, MEMORY[0x263F063B0]);
  uint64_t v76 = v87;
  sub_25DDE3470();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  uint64_t v77 = v94[0];
  uint64_t v78 = v94[1];
  sub_25DDC07E4();
  swift_allocError();
  *uint64_t v79 = v77;
  v79[1] = v78;
  swift_willThrow();
  (*(void (**)(unsigned char *, uint64_t))(v86 + 8))(v33, v76);
}

void *sub_25DDC0258(void (*a1)(void *__return_ptr, void), uint64_t a2, uint64_t a3)
{
  void (*v17)(void *__return_ptr, void);

  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v7 = *(void *)(type metadata accessor for SiriUsageMetrics() - 8);
  uint64_t v8 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v9 = *(void *)(v7 + 72);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  uint64_t v17 = a1;
  do
  {
    a1(&v15, v8);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    if ((v16 & 1) == 0)
    {
      uint64_t v11 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v10 = sub_25DDCCDD4(0, v10[2] + 1, 1, v10);
      }
      unint64_t v13 = v10[2];
      unint64_t v12 = v10[3];
      if (v13 >= v12 >> 1) {
        uint64_t v10 = sub_25DDCCDD4((void *)(v12 > 1), v13 + 1, 1, v10);
      }
      v10[2] = v13 + 1;
      v10[v13 + 4] = v11;
      a1 = v17;
    }
    v8 += v9;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_25DDC03F8(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_25DDE33D0();
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

uint64_t sub_25DDC049C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_25DDC04CC(uint64_t a1)
{
  uint64_t v2 = sub_25DDE2E80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D58);
    uint64_t v9 = sub_25DDE3320();
    uint64_t v10 = 0;
    unint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_25DDC10A4(&qword_26A6C7D60, MEMORY[0x263F07908]);
      uint64_t v16 = sub_25DDE30A0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_25DDC10A4(&qword_26A6C7D68, MEMORY[0x263F07908]);
          char v23 = sub_25DDE30F0();
          double v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        char v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

unint64_t sub_25DDC07E4()
{
  unint64_t result = qword_26A6C7D40;
  if (!qword_26A6C7D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7D40);
  }
  return result;
}

uint64_t sub_25DDC0838(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = a2;
  uint64_t v3 = sub_25DDE2BC0();
  uint64_t v54 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v61 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25DDE2DE0();
  uint64_t v56 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v55 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25DDE2E90();
  uint64_t v52 = *(void *)(v7 - 8);
  uint64_t v53 = v7;
  MEMORY[0x270FA5388](v7);
  unint64_t v59 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_25DDE3040();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B3808C0);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v60 = a1;
  v14(v12, a1, v9);
  uint64_t v15 = sub_25DDE3020();
  os_log_type_t v16 = sub_25DDE3250();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v57 = v9;
  uint64_t v51 = v10;
  if (v17)
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v48 = v3;
    uint64_t v20 = v19;
    uint64_t v62 = v19;
    uint64_t v47 = v5;
    *(_DWORD *)unint64_t v18 = 136315138;
    uint64_t v50 = (void (*)(char *, uint64_t))(v18 + 4);
    sub_25DDC10A4((unint64_t *)&qword_26A6C7D48, MEMORY[0x263F07490]);
    uint64_t v21 = sub_25DDE3470();
    uint64_t v64 = sub_25DDCA0E4(v21, v22, &v62);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    uint64_t v5 = v47;
    uint64_t v50 = *(void (**)(char *, uint64_t))(v10 + 8);
    v50(v12, v9);
    _os_log_impl(&dword_25DDB4000, v15, v16, "SiriActivityWeek.init() week ending: %s", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v20;
    uint64_t v3 = v48;
    MEMORY[0x2611C78C0](v23, -1, -1);
    MEMORY[0x2611C78C0](v18, -1, -1);
  }
  else
  {
    uint64_t v50 = *(void (**)(char *, uint64_t))(v10 + 8);
    v50(v12, v9);
  }

  char v25 = v55;
  uint64_t v24 = v56;
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v55, *MEMORY[0x263F07740], v5);
  uint64_t v26 = v59;
  sub_25DDE2DF0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D30);
  uint64_t v27 = sub_25DDE2E80();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(void *)(v28 + 72);
  unint64_t v30 = (*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_25DDE46D0;
  unint64_t v32 = v31 + v30;
  uint64_t v33 = *(void (**)(unint64_t, void, uint64_t))(v28 + 104);
  v33(v32, *MEMORY[0x263F07890], v27);
  v33(v32 + v29, *MEMORY[0x263F078C0], v27);
  v33(v32 + 2 * v29, *MEMORY[0x263F078C8], v27);
  sub_25DDC04CC(v31);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v35 = v60;
  uint64_t v34 = v61;
  sub_25DDE2E30();
  swift_bridgeObjectRelease();
  sub_25DDE2B80();
  if ((v36 & 1) != 0
    || (sub_25DDE2BA0(), (v37 & 1) != 0)
    || (uint64_t v38 = (uint64_t)v34, v39 = sub_25DDE2BB0(), (v40 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v62 = 0;
    unint64_t v63 = 0xE000000000000000;
    sub_25DDE3330();
    sub_25DDE3130();
    sub_25DDC10A4(&qword_26A6C7D38, MEMORY[0x263F063B0]);
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    uint64_t v38 = v62;
    unint64_t v43 = v63;
    sub_25DDC07E4();
    swift_allocError();
    *os_log_type_t v44 = v38;
    v44[1] = v43;
    swift_willThrow();
    v50((char *)v35, v57);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v34, v3);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v26, v53);
  }
  else
  {
    MEMORY[0x270FA5388](v39);
    *(&v46 - 6) = 0x40F5180000000000;
    *(&v46 - 5) = (uint64_t)v26;
    *(&v46 - 4) = (uint64_t)v34;
    *(&v46 - 3) = v35;
    *(&v46 - 2) = 7;
    uint64_t v41 = v49;
    uint64_t v42 = sub_25DDC0258((void (*)(void *__return_ptr, void))sub_25DDC1080, (uint64_t)(&v46 - 8), v58);
    if (!v41) {
      uint64_t v38 = (uint64_t)v42;
    }
    v50((char *)v35, v57);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v34, v3);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v26, v53);
    swift_bridgeObjectRelease();
  }
  return v38;
}

void sub_25DDC1080(unsigned char *a1@<X0>, void *a2@<X8>)
{
  sub_25DDBF678(a1, *(void *)(v2 + 40), *(void *)(v2 + 48), a2, *(double *)(v2 + 16));
}

uint64_t sub_25DDC10A4(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for ActivitySegmentMetricsError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ActivitySegmentMetricsError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ActivitySegmentMetricsError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ActivitySegmentMetricsError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivitySegmentMetricsError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ActivitySegmentMetricsError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ActivitySegmentMetricsError()
{
  return &type metadata for ActivitySegmentMetricsError;
}

uint64_t sub_25DDC1234()
{
  return 0;
}

uint64_t sub_25DDC142C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = a4;
  *(unsigned char *)(v4 + 284) = a3;
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 96) = type metadata accessor for NewCustomerSegment.Result();
  *(void *)(v4 + 104) = swift_task_alloc();
  *(void *)(v4 + 112) = swift_task_alloc();
  *(void *)(v4 + 120) = swift_task_alloc();
  *(void *)(v4 + 128) = swift_task_alloc();
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  *(void *)(v4 + 136) = EnablementStatus;
  *(void *)(v4 + 144) = *(void *)(EnablementStatus - 8);
  *(void *)(v4 + 152) = swift_task_alloc();
  uint64_t v6 = sub_25DDE2D60();
  *(void *)(v4 + 160) = v6;
  *(void *)(v4 + 168) = *(void *)(v6 - 8);
  *(void *)(v4 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D78);
  *(void *)(v4 + 184) = swift_task_alloc();
  *(void *)(v4 + 192) = swift_task_alloc();
  *(void *)(v4 + 200) = swift_task_alloc();
  uint64_t v7 = sub_25DDE2DC0();
  *(void *)(v4 + 208) = v7;
  *(void *)(v4 + 216) = *(void *)(v7 - 8);
  *(void *)(v4 + 224) = swift_task_alloc();
  uint64_t v8 = sub_25DDE3040();
  *(void *)(v4 + 232) = v8;
  *(void *)(v4 + 240) = *(void *)(v8 - 8);
  *(void *)(v4 + 248) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDC16AC, 0, 0);
}

uint64_t sub_25DDC16AC()
{
  uint64_t v58 = v0;
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v6 = *(void *)(v0 + 216);
  uint64_t v7 = *(void *)(v0 + 200);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v10 = __swift_project_value_buffer(v3, (uint64_t)qword_26B3808C0);
  *(void *)(v0 + 256) = v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v10, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v9, v5);
  sub_25DDC30AC(v8, v7);
  uint64_t v11 = sub_25DDE3020();
  os_log_type_t v12 = sub_25DDE3250();
  if (os_log_type_enabled(v11, v12))
  {
    os_log_type_t v55 = v12;
    uint64_t v56 = v11;
    uint64_t v13 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 224);
    uint64_t v51 = *(void *)(v0 + 192);
    uint64_t v16 = *(void *)(v0 + 168);
    uint64_t v15 = *(void *)(v0 + 176);
    uint64_t v48 = *(void *)(v0 + 160);
    uint64_t v17 = *(void *)(v0 + 144);
    uint64_t v52 = *(void *)(v0 + 200);
    uint64_t v53 = *(void *)(v0 + 136);
    uint64_t v50 = *(void *)(v0 + 208);
    int v49 = *(unsigned __int8 *)(v0 + 284);
    uint64_t v18 = swift_slowAlloc();
    uint64_t v54 = swift_slowAlloc();
    uint64_t v57 = v54;
    *(_DWORD *)uint64_t v18 = 136315650;
    sub_25DDDC728(v15);
    uint64_t v19 = sub_25DDE2D00();
    unint64_t v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v48);
    *(void *)(v0 + 56) = sub_25DDCA0E4(v19, v21, &v57);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v50);
    *(_WORD *)(v18 + 12) = 1024;
    *(_DWORD *)(v0 + 280) = v49;
    sub_25DDE32D0();
    *(_WORD *)(v18 + 18) = 2080;
    sub_25DDC30AC(v52, v51);
    int v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v51, 1, v53);
    uint64_t v23 = *(void *)(v0 + 192);
    if (v22 == 1)
    {
      sub_25DDC5278(*(void *)(v0 + 192), &qword_26A6C7D78);
      unint64_t v24 = 0xE300000000000000;
      uint64_t v25 = 7104878;
    }
    else
    {
      uint64_t v25 = sub_25DDB8AF8();
      unint64_t v24 = v30;
      sub_25DDC317C(v23, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
    }
    uint64_t v31 = *(void *)(v0 + 240);
    uint64_t v32 = *(void *)(v0 + 248);
    uint64_t v33 = *(void *)(v0 + 232);
    uint64_t v34 = *(void *)(v0 + 200);
    *(void *)(v0 + 64) = sub_25DDCA0E4(v25, v24, &v57);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDC5278(v34, &qword_26A6C7D78);
    _os_log_impl(&dword_25DDB4000, v56, v55, "Starting NewCustomerSegment.calculate(now: %s, currentAssistantEnabled: %{BOOL}d, lastKnown: %s", (uint8_t *)v18, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v54, -1, -1);
    MEMORY[0x2611C78C0](v18, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v32, v33);
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 240);
    uint64_t v27 = *(void *)(v0 + 248);
    uint64_t v28 = *(void *)(v0 + 232);
    uint64_t v29 = *(void *)(v0 + 200);
    (*(void (**)(void, void))(*(void *)(v0 + 216) + 8))(*(void *)(v0 + 224), *(void *)(v0 + 208));
    sub_25DDC5278(v29, &qword_26A6C7D78);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
  }
  uint64_t v35 = *(void *)(v0 + 184);
  uint64_t v36 = *(void *)(v0 + 136);
  uint64_t v37 = *(void *)(v0 + 144);
  sub_25DDC30AC(*(void *)(v0 + 88), v35);
  int v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36);
  uint64_t v39 = *(void *)(v0 + 184);
  uint64_t v40 = *(void *)(v0 + 152);
  if (v38 == 1)
  {
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 1, 3, v41);
    sub_25DDC5278(v39, &qword_26A6C7D78);
  }
  else
  {
    sub_25DDC31DC(*(void *)(v0 + 184), *(void *)(v0 + 152), (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  }
  uint64_t v42 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v42;
  void *v42 = v0;
  v42[1] = sub_25DDC1B9C;
  uint64_t v43 = *(void *)(v0 + 152);
  uint64_t v44 = *(void *)(v0 + 128);
  char v45 = *(unsigned char *)(v0 + 284);
  uint64_t v46 = *(void *)(v0 + 80);
  return sub_25DDC238C(v44, v46, v45, v43);
}

uint64_t sub_25DDC1B9C()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25DDC1F90;
  }
  else {
    uint64_t v2 = sub_25DDC1CB0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDC1CB0()
{
  uint64_t v15 = v0;
  sub_25DDC3114(v0[16], v0[15], (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
  uint64_t v1 = sub_25DDE3020();
  os_log_type_t v2 = sub_25DDE3250();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v13 = v0[19];
    uint64_t v3 = v0[15];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v14 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[5] = sub_25DDCA0E4(0xD000000000000031, 0x800000025DDE5760, &v14);
    sub_25DDE32D0();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v6 = sub_25DDC1234();
    v0[6] = sub_25DDCA0E4(v6, v7, &v14);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDC317C(v3, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
    _os_log_impl(&dword_25DDB4000, v1, v2, "Ended NewCustomerSegment.%s -> %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v5, -1, -1);
    MEMORY[0x2611C78C0](v4, -1, -1);

    uint64_t v8 = v13;
  }
  else
  {
    uint64_t v9 = v0[19];
    uint64_t v10 = v0[15];

    sub_25DDC317C(v10, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
    uint64_t v8 = v9;
  }
  sub_25DDC317C(v8, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  sub_25DDC31DC(v0[16], v0[9], (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
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
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_25DDC1F90()
{
  int v22 = v0;
  uint64_t v1 = v0[34];
  uint64_t v3 = v0[13];
  os_log_type_t v2 = (unsigned char *)v0[14];
  sub_25DDC3114(v0[19], (uint64_t)&v2[*(int *)(v0[12] + 20)], (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  unsigned char *v2 = 7;
  sub_25DDC3114((uint64_t)v2, v3, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
  MEMORY[0x2611C7720](v1);
  MEMORY[0x2611C7720](v1);
  uint64_t v4 = sub_25DDE3020();
  os_log_type_t v5 = sub_25DDE3250();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[34];
    uint64_t v20 = v0[19];
    uint64_t v18 = v0[13];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v7 = 136315650;
    v0[2] = sub_25DDCA0E4(0xD000000000000031, 0x800000025DDE5760, &v21);
    sub_25DDE32D0();
    *(_WORD *)(v7 + 12) = 2112;
    MEMORY[0x2611C7720](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v9;
    sub_25DDE32D0();
    *uint64_t v8 = v9;

    *(_WORD *)(v7 + 22) = 2080;
    uint64_t v10 = sub_25DDC1234();
    v0[4] = sub_25DDCA0E4(v10, v11, &v21);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDC317C(v18, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
    _os_log_impl(&dword_25DDB4000, v4, v5, "Ended NewCustomerSegment.%s with error: %@ -> %s", (uint8_t *)v7, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D88);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v19, -1, -1);
    MEMORY[0x2611C78C0](v7, -1, -1);

    uint64_t v12 = v20;
  }
  else
  {
    uint64_t v13 = (void *)v0[34];
    uint64_t v14 = v0[19];
    uint64_t v15 = v0[13];

    sub_25DDC317C(v15, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
    uint64_t v12 = v14;
  }
  sub_25DDC317C(v12, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  sub_25DDC31DC(v0[14], v0[9], (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
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
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_25DDC238C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a4;
  *(unsigned char *)(v4 + 128) = a3;
  *(void *)(v4 + 24) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EB0);
  *(void *)(v4 + 48) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D90);
  *(void *)(v4 + 56) = swift_task_alloc();
  uint64_t v5 = sub_25DDE2DC0();
  *(void *)(v4 + 64) = v5;
  *(void *)(v4 + 72) = *(void *)(v5 - 8);
  *(void *)(v4 + 80) = swift_task_alloc();
  *(void *)(v4 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D98);
  *(void *)(v4 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDC24E8, 0, 0);
}

uint64_t sub_25DDC24E8()
{
  uint64_t v1 = *(void *)(v0 + 96);
  char v2 = *(unsigned char *)(v0 + 128);
  uint64_t v3 = *(int *)(*(void *)(v0 + 88) + 48);
  sub_25DDC3114(*(void *)(v0 + 40), v1, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  *(unsigned char *)(v1 + v3) = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  *(void *)(v0 + 104) = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)(v0 + 112) = v5;
  switch((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v1, 3, v4))
  {
    case 1u:
      if ((*(unsigned char *)(v0 + 128) & 1) == 0)
      {
        if (qword_26B380880 != -1) {
          swift_once();
        }
        uint64_t v31 = sub_25DDE3040();
        __swift_project_value_buffer(v31, (uint64_t)qword_26B3808C0);
        uint64_t v32 = sub_25DDE3020();
        os_log_type_t v33 = sub_25DDE3250();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v34 = 0;
          uint64_t v35 = "NewCustomerSegment 0 never checked before, assume current disabled state is the long term status quo.";
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_25DDC2CB8;
      uint64_t v14 = *(void *)(v0 + 32);
      return sub_25DDC4398(v14);
    case 2u:
      if (*(unsigned char *)(v0 + 128))
      {
        if (qword_26B380880 != -1) {
          swift_once();
        }
        uint64_t v16 = sub_25DDE3040();
        __swift_project_value_buffer(v16, (uint64_t)qword_26B3808C0);
        uint64_t v17 = sub_25DDE3020();
        os_log_type_t v18 = sub_25DDE3250();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_25DDB4000, v17, v18, "NewCustomerSegment - transitioned from disabled to enabled, new customer", v19, 2u);
          MEMORY[0x2611C78C0](v19, -1, -1);
        }
        uint64_t v20 = *(void *)(v0 + 64);
        uint64_t v21 = *(void *)(v0 + 72);
        uint64_t v23 = *(void *)(v0 + 24);
        uint64_t v22 = *(void *)(v0 + 32);

        uint64_t v24 = v23 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v24, v22, v20);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v24, 0, 3, v4);
        goto LABEL_37;
      }
      if (qword_26B380880 != -1) {
        swift_once();
      }
      uint64_t v36 = sub_25DDE3040();
      __swift_project_value_buffer(v36, (uint64_t)qword_26B3808C0);
      uint64_t v32 = sub_25DDE3020();
      os_log_type_t v33 = sub_25DDE3250();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        uint64_t v35 = "NewCustomerSegment - always was and still is disabled, not a Siri user.";
LABEL_27:
        _os_log_impl(&dword_25DDB4000, v32, v33, v35, v34, 2u);
        MEMORY[0x2611C78C0](v34, -1, -1);
      }
LABEL_28:
      uint64_t v37 = *(void *)(v0 + 24);

      uint64_t v38 = v37 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v38, 2, 3, v4);
      goto LABEL_29;
    case 3u:
      if (qword_26B380880 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_25DDE3040();
      __swift_project_value_buffer(v25, (uint64_t)qword_26B3808C0);
      uint64_t v26 = sub_25DDE3020();
      os_log_type_t v27 = sub_25DDE3250();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v28 = 0;
        _os_log_impl(&dword_25DDB4000, v26, v27, "NewCustomerSegment - previously determined not a new customer", v28, 2u);
        MEMORY[0x2611C78C0](v28, -1, -1);
      }
      uint64_t v29 = *(void *)(v0 + 24);

      goto LABEL_18;
    default:
      uint64_t v6 = *(void *)(v0 + 56);
      uint64_t v7 = *(void *)(v0 + 48);
      uint64_t v8 = *(void *)(v0 + 32);
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 72) + 32);
      v9(*(void *)(v0 + 80), *(void *)(v0 + 96), *(void *)(v0 + 64));
      uint64_t v10 = sub_25DDE2DE0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
      uint64_t v11 = sub_25DDE2EB0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
      uint64_t v12 = sub_25DDDB1A8(v8, v6, v7);
      sub_25DDC5278(v7, (uint64_t *)&unk_26A6C7EB0);
      sub_25DDC5278(v6, &qword_26A6C7D90);
      uint64_t v40 = (uint64_t)v12;
      if (qword_26B380880 != -1) {
        swift_once();
      }
      uint64_t v41 = sub_25DDE3040();
      __swift_project_value_buffer(v41, (uint64_t)qword_26B3808C0);
      uint64_t v42 = sub_25DDE3020();
      os_log_type_t v43 = sub_25DDE3250();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 134217984;
        *(void *)(v0 + 16) = v40;
        sub_25DDE32D0();
        _os_log_impl(&dword_25DDB4000, v42, v43, "NewCustomerSegment - was recently enabled at previous check, %ld days ago", v44, 0xCu);
        MEMORY[0x2611C78C0](v44, -1, -1);
      }

      uint64_t v45 = *(void *)(v0 + 80);
      if (v40 <= 28)
      {
        uint64_t v46 = *(void *)(v0 + 64);
        uint64_t v47 = *(void *)(v0 + 24);
        uint64_t v48 = v47 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
        v9(v48, v45, v46);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v48, 0, 3, v4);
LABEL_37:
        char v39 = 0;
      }
      else
      {
        uint64_t v29 = *(void *)(v0 + 24);
        (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
LABEL_18:
        uint64_t v30 = v29 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v30, 3, 3, v4);
LABEL_29:
        char v39 = 7;
      }
      **(unsigned char **)(v0 + 24) = v39;
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      int v49 = *(uint64_t (**)(void))(v0 + 8);
      return v49();
  }
}

uint64_t sub_25DDC2CB8(char a1)
{
  *(unsigned char *)(*(void *)v1 + 129) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDC2DB8, 0, 0);
}

uint64_t sub_25DDC2DB8()
{
  if (*(unsigned char *)(v0 + 129) == 1)
  {
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_25DDE3040();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B3808C0);
    char v2 = sub_25DDE3020();
    os_log_type_t v3 = sub_25DDE3250();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_25DDB4000, v2, v3, "NewCustomerSegment - never checked before, has evidence of recent onboarding.", v4, 2u);
      MEMORY[0x2611C78C0](v4, -1, -1);
    }
    uint64_t v5 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v7 = *(void *)(v0 + 64);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v10 = *(void *)(v0 + 24);
    uint64_t v9 = *(void *)(v0 + 32);

    uint64_t v11 = v10 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v9, v7);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v11, 0, 3, v5);
    char v12 = 0;
  }
  else
  {
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_25DDE3040();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B3808C0);
    uint64_t v14 = sub_25DDE3020();
    os_log_type_t v15 = sub_25DDE3250();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_25DDB4000, v14, v15, "NewCustomerSegment - never checked before, assume current enabled state is the long term status quo.", v16, 2u);
      MEMORY[0x2611C78C0](v16, -1, -1);
    }
    uint64_t v17 = *(void *)(v0 + 104);
    uint64_t v18 = *(void *)(v0 + 112);
    uint64_t v19 = *(void *)(v0 + 24);

    uint64_t v20 = type metadata accessor for NewCustomerSegment.Result();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v19 + *(int *)(v20 + 20), 3, 3, v17);
    char v12 = 7;
  }
  **(unsigned char **)(v0 + 24) = v12;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t type metadata accessor for NewCustomerSegment.Result()
{
  uint64_t result = qword_26A6C7DC8;
  if (!qword_26A6C7DC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25DDC30AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDC3114(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDC317C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDC31DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDC3244(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4 = sub_25DDE2DC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x270FA5388](EnablementStatus - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7BF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v14 = *a1;
  int v15 = *a2;
  if (v14 == 7)
  {
    if (v15 == 7) {
      goto LABEL_6;
    }
    return 0;
  }
  if (v15 == 7 || (sub_25DDD1E4C(v14, v15) & 1) == 0) {
    return 0;
  }
LABEL_6:
  uint64_t v16 = *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
  uint64_t v17 = (uint64_t)&a1[v16];
  uint64_t v18 = (uint64_t)&a2[v16];
  uint64_t v19 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_25DDC3114(v17, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  sub_25DDC3114(v18, v19, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48);
  switch(v21((uint64_t)v13, 3, v20))
  {
    case 1u:
      if (v21(v19, 3, v20) != 1) {
        goto LABEL_15;
      }
      goto LABEL_17;
    case 2u:
      if (v21(v19, 3, v20) == 2) {
        goto LABEL_17;
      }
      goto LABEL_15;
    case 3u:
      if (v21(v19, 3, v20) != 3) {
        goto LABEL_15;
      }
      goto LABEL_17;
    default:
      sub_25DDC3114((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
      if (v21(v19, 3, v20))
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_15:
        sub_25DDC5278((uint64_t)v13, &qword_26A6C7BF0);
        uint64_t result = 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v19, v4);
        char v23 = sub_25DDE2D90();
        uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
        v24(v7, v4);
        v24(v10, v4);
        if (v23)
        {
LABEL_17:
          sub_25DDC317C((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
          uint64_t result = 1;
        }
        else
        {
          sub_25DDC317C((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
          uint64_t result = 0;
        }
      }
      break;
  }
  return result;
}

uint64_t sub_25DDC360C(uint64_t a1)
{
  v1[8] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7DB0);
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7DB8);
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7EF0);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  uint64_t v4 = sub_25DDE2E80();
  v1[18] = v4;
  v1[19] = *(void *)(v4 - 8);
  v1[20] = swift_task_alloc();
  uint64_t v5 = sub_25DDE2DC0();
  v1[21] = v5;
  v1[22] = *(void *)(v5 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDC3870, 0, 0);
}

uint64_t sub_25DDC3870()
{
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[18];
  sub_25DDE2FE0();
  sub_25DDC4770();
  uint64_t v5 = sub_25DDE2FC0();
  v0[27] = v5;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, *MEMORY[0x263F07870], v4);
  sub_25DDDBB84(-28, v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_25DDC47B0();
  uint64_t result = sub_25DDE30E0();
  if (result)
  {
    uint64_t v24 = v0[24];
    uint64_t v25 = v0[26];
    uint64_t v7 = v0[21];
    uint64_t v8 = (void *)v0[22];
    uint64_t v9 = v0[16];
    uint64_t v10 = v0[15];
    uint64_t v20 = v0[8];
    uint64_t v22 = v10;
    uint64_t v23 = v0[25];
    uint64_t v27 = v0[17];
    uint64_t v11 = v27 + *(int *)(v10 + 48);
    uint64_t v12 = (void (*)(void))v8[4];
    v12();
    uint64_t v26 = v5;
    uint64_t v13 = (void (*)(uint64_t, uint64_t, uint64_t))v8[2];
    uint64_t v21 = v11;
    v13(v11, v20, v7);
    uint64_t v14 = v9 + *(int *)(v10 + 48);
    v13(v9, v27, v7);
    v13(v14, v11, v7);
    ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v23, v9, v7);
    int v15 = (void (*)(uint64_t, uint64_t))v8[1];
    v15(v14, v7);
    uint64_t v16 = v9 + *(int *)(v22 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v9, v27, v7);
    ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v16, v21, v7);
    ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v23 + *(int *)(v24 + 36), v16, v7);
    v15(v9, v7);
    sub_25DDC4808(v23, v25);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[28] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_25DDC3BE4;
    uint64_t v18 = v0[26];
    uint64_t v19 = v0[14];
    return sub_25DDBB7C4(v19, v26, v18);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25DDC3BE4()
{
  *(void *)(*(void *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25DDC42B4;
  }
  else {
    uint64_t v2 = sub_25DDC3CF8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDC3CF8()
{
  *(unsigned char *)(v0 + 260) = 0;
  sub_25DDE3200();
  *(void *)(v0 + 240) = 0;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_25DDC3DB8;
  uint64_t v2 = *(void *)(v0 + 72);
  return MEMORY[0x270FA1F68](v0 + 40, 0, 0, v2);
}

uint64_t sub_25DDC3DB8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDC3EB4, 0, 0);
}

uint64_t sub_25DDC3EB4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = v4;
  uint64_t v5 = *(void **)(v4 + 40);
  uint64_t v6 = (BOOL *)(v4 + 260);
  uint64_t v7 = *(void *)(v4 + 240);
  if (!v5) {
    goto LABEL_6;
  }
  if (__OFADD__(v7++, 1))
  {
    __break(1u);
    goto LABEL_18;
  }
  a1 = (void *)sub_25DDE2EE0();
  if (!a1)
  {
LABEL_18:
    __break(1u);
    return MEMORY[0x270FA1F68](a1, a2, a3, a4);
  }
  uint64_t v9 = a1;
  unsigned int v10 = objc_msgSend(a1, sel_getAnyEventType);

  BOOL *v6 = v10 == 47;
  if (v10 != 47)
  {
    *(void *)(v4 + 240) = v7;
    uint64_t v25 = (void *)swift_task_alloc();
    *(void *)(v4 + 248) = v25;
    *uint64_t v25 = v4;
    v25[1] = sub_25DDC3DB8;
    a4 = *(void *)(v4 + 72);
    a1 = (void *)(v4 + 40);
    a2 = 0;
    a3 = 0;
    return MEMORY[0x270FA1F68](a1, a2, a3, a4);
  }
LABEL_6:
  (*(void (**)(void, void))(*(void *)(v4 + 80) + 8))(*(void *)(v4 + 88), *(void *)(v4 + 72));
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_25DDE3040();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B3808C0);
  BOOL v29 = *v6;
  uint64_t v12 = sub_25DDE3020();
  os_log_type_t v13 = sub_25DDE3250();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v15 = *(void *)(v4 + 208);
  uint64_t v16 = *(void *)(v4 + 104);
  uint64_t v17 = *(void *)(v4 + 112);
  uint64_t v18 = *(void *)(v4 + 96);
  if (v14)
  {
    uint64_t v28 = *(void *)(v4 + 208);
    uint64_t v26 = *(void **)(v4 + 216);
    uint64_t v19 = swift_slowAlloc();
    uint64_t v27 = v18;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v30 = v20;
    *(_DWORD *)uint64_t v19 = 136315650;
    *(void *)(v4 + 48) = sub_25DDCA0E4(0xD000000000000026, 0x800000025DDE57F0, &v30);
    sub_25DDE32D0();
    *(_WORD *)(v19 + 12) = 1024;
    *(_DWORD *)(v4 + 256) = v29;
    sub_25DDE32D0();
    *(_WORD *)(v19 + 18) = 2048;
    *(void *)(v4 + 56) = v7;
    sub_25DDE32D0();
    _os_log_impl(&dword_25DDB4000, v12, v13, "NewCustomerSegment.%s result: %{BOOL}d from %ld events", (uint8_t *)v19, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v20, -1, -1);
    MEMORY[0x2611C78C0](v19, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v27);
    uint64_t v21 = v28;
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    uint64_t v21 = v15;
  }
  sub_25DDC5278(v21, &qword_26A6C7C70);
  swift_beginAccess();
  BOOL v22 = *v6;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = *(uint64_t (**)(BOOL))(v4 + 8);
  return v23(v22);
}

uint64_t sub_25DDC42B4()
{
  uint64_t v1 = *(void *)(v0 + 208);

  sub_25DDC5278(v1, &qword_26A6C7C70);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(0);
}

uint64_t sub_25DDC4398(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25DDC442C;
  return sub_25DDC360C(a1);
}

uint64_t sub_25DDC442C(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_25DDC4568, 0, 0);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5(a1 & 1);
  }
}

uint64_t sub_25DDC4568()
{
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = sub_25DDE3040();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3808C0);
  MEMORY[0x2611C7720](v1);
  MEMORY[0x2611C7720](v1);
  uint64_t v3 = sub_25DDE3020();
  os_log_type_t v4 = sub_25DDE3260();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[4];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x2611C7720](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v9;
    sub_25DDE32D0();
    *uint64_t v8 = v9;

    _os_log_impl(&dword_25DDB4000, v3, v4, "Failed to check SELF events for Siri grading opt-in: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D88);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v8, -1, -1);
    MEMORY[0x2611C78C0](v7, -1, -1);
  }
  else
  {
  }
  unsigned int v10 = (uint64_t (*)(void))v0[1];
  return v10(0);
}

unint64_t sub_25DDC4770()
{
  unint64_t result = qword_26A6C7DC0;
  if (!qword_26A6C7DC0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A6C7DC0);
  }
  return result;
}

unint64_t sub_25DDC47B0()
{
  unint64_t result = qword_26A6C7D28;
  if (!qword_26A6C7D28)
  {
    sub_25DDE2DC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7D28);
  }
  return result;
}

uint64_t sub_25DDC4808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_25DDC4870(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 3, v8))
    {
      uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
      memcpy(v6, v7, *(void *)(*(void *)(EnablementStatus - 8) + 64));
    }
    else
    {
      uint64_t v12 = sub_25DDE2DC0();
      (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v6, v7, v12);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 3, v8);
    }
  }
  return v3;
}

uint64_t sub_25DDC49F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48))(v2, 3, v3);
  if (!result)
  {
    uint64_t v5 = sub_25DDE2DC0();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v2, v5);
  }
  return result;
}

unsigned char *sub_25DDC4AA8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 3, v7))
  {
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(void *)(*(void *)(EnablementStatus - 8) + 64));
  }
  else
  {
    uint64_t v10 = sub_25DDE2DC0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 16))(v5, v6, v10);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  }
  return a1;
}

unsigned char *sub_25DDC4BD8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 3, v7);
  int v11 = v9(v6, 3, v7);
  if (!v10)
  {
    if (!v11)
    {
      uint64_t v15 = sub_25DDE2DC0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 24))(v5, v6, v15);
      return a1;
    }
    sub_25DDC5278((uint64_t)v5, &qword_26A6C7B58);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(void *)(*(void *)(EnablementStatus - 8) + 64));
    return a1;
  }
  uint64_t v12 = sub_25DDE2DC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v12 - 8) + 16))(v5, v6, v12);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  return a1;
}

unsigned char *sub_25DDC4D84(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 3, v7))
  {
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(void *)(*(void *)(EnablementStatus - 8) + 64));
  }
  else
  {
    uint64_t v10 = sub_25DDE2DC0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 32))(v5, v6, v10);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  }
  return a1;
}

unsigned char *sub_25DDC4EB4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 3, v7);
  int v11 = v9(v6, 3, v7);
  if (!v10)
  {
    if (!v11)
    {
      uint64_t v15 = sub_25DDE2DC0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 40))(v5, v6, v15);
      return a1;
    }
    sub_25DDC5278((uint64_t)v5, &qword_26A6C7B58);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(void *)(*(void *)(EnablementStatus - 8) + 64));
    return a1;
  }
  uint64_t v12 = sub_25DDE2DC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v12 - 8) + 32))(v5, v6, v12);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  return a1;
}

uint64_t sub_25DDC5060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDC5074);
}

uint64_t sub_25DDC5074(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 248)
  {
    if (*a1 <= 7u) {
      int v4 = 7;
    }
    else {
      int v4 = *a1;
    }
    unsigned int v5 = v4 - 7;
    if (*a1 >= 7u) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    int v10 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 48);
    uint64_t v11 = EnablementStatus;
    uint64_t v12 = &a1[*(int *)(a3 + 20)];
    return v10(v12, a2, v11);
  }
}

uint64_t sub_25DDC5128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDC513C);
}

unsigned char *sub_25DDC513C(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v5 = result;
  if (a3 == 248)
  {
    *uint64_t result = a2 + 7;
  }
  else
  {
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 56);
    uint64_t v9 = EnablementStatus;
    int v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25DDC51E0()
{
  uint64_t result = type metadata accessor for SiriFirstEnablementStatus();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DDC5278(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDC52D4()
{
  uint64_t v0 = sub_25DDE3040();
  __swift_allocate_value_buffer(v0, qword_26B3808C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B3808C0);
  return sub_25DDE3030();
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

uint64_t sub_25DDC53BC@<X0>(NSObject *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint8_t *a4@<X8>)
{
  uint64_t v54 = a2;
  os_log_type_t v55 = a1;
  uint64_t v48 = a4;
  uint64_t v5 = sub_25DDE3050();
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  int v49 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v47 - v8;
  uint64_t v9 = sub_25DDE3090();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  os_log_type_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v47 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E38);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E40);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_25DDE4870;
  uint64_t v21 = sub_25DDE31F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  BOOL v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v54;
  v22[5] = a3;
  v22[6] = sub_25DDCC334;
  v22[7] = v20;
  v22[8] = v19;
  swift_retain_n();
  swift_retain();
  uint64_t v23 = v19;
  uint64_t v24 = (uint64_t)v18;
  uint64_t v25 = v55;
  sub_25DDC5C14(v24, (uint64_t)&unk_26A6C7E50, (uint64_t)v22);
  swift_release();
  sub_25DDE3070();
  sub_25DDE3080();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26(v13, v9);
  sub_25DDE3290();
  v26(v15, v9);
  if (sub_25DDE3060())
  {
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_25DDE3040();
    __swift_project_value_buffer(v27, (uint64_t)qword_26B3808C0);
    BOOL v29 = v51;
    uint64_t v28 = v52;
    uint64_t v30 = *(void (**)(char *, NSObject *, uint64_t))(v52 + 16);
    uint64_t v31 = v53;
    v30(v51, v25, v53);
    uint64_t v32 = sub_25DDE3020();
    os_log_type_t v33 = sub_25DDE3270();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      os_log_t v50 = v32;
      uint64_t v35 = v29;
      uint64_t v36 = (uint8_t *)v34;
      uint64_t v54 = swift_slowAlloc();
      uint64_t v57 = v54;
      os_log_type_t v55 = v23;
      *(_DWORD *)uint64_t v36 = 136315138;
      uint64_t v47 = v36 + 4;
      uint64_t v48 = v36;
      v30(v49, v35, v31);
      uint64_t v37 = sub_25DDE3110();
      uint64_t v56 = sub_25DDCA0E4(v37, v38, &v57);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      uint64_t v23 = v55;
      (*(void (**)(char *, uint64_t))(v28 + 8))(v35, v31);
      uint64_t v32 = v50;
      char v39 = v48;
      _os_log_impl(&dword_25DDB4000, v50, v33, "a thread was blocked by a semaphore awaiting a Task and timed out after %s seconds", v48, 0xCu);
      uint64_t v40 = v54;
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v40, -1, -1);
      MEMORY[0x2611C78C0](v39, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v31);
    }

    sub_25DDCC520();
    swift_allocError();
    void *v42 = 0xD00000000000002FLL;
    os_log_type_t v43 = "timed out waiting for an async task to complete";
    goto LABEL_10;
  }
  uint64_t v41 = *(void *)(v20 + 24);
  if (v41 == 2)
  {
    sub_25DDCC520();
    swift_allocError();
    void *v42 = 0xD000000000000028;
    os_log_type_t v43 = "unable to extract result from async Task";
LABEL_10:
    v42[1] = (unint64_t)(v43 - 32) | 0x8000000000000000;
    swift_willThrow();

    return swift_release_n();
  }
  uint64_t v45 = *(void *)(v20 + 16);
  sub_25DDCA0BC(v45, *(void *)(v20 + 24));

  uint64_t result = swift_release_n();
  uint64_t v46 = v48;
  *(void *)uint64_t v48 = v45;
  *((void *)v46 + 1) = v41;
  return result;
}

uint64_t sub_25DDC5990(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a1;
  v8[3] = a6;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v10 = (void *)swift_task_alloc();
  v8[6] = v10;
  *uint64_t v10 = v8;
  v10[1] = sub_25DDC5A74;
  return v12(a1);
}

uint64_t sub_25DDC5A74()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDC5B70, 0, 0);
}

uint64_t sub_25DDC5B70()
{
  uint64_t v8 = v0;
  uint64_t v1 = (uint64_t *)v0[2];
  uint64_t v2 = (void (*)(void *))v0[3];
  uint64_t v3 = *v1;
  unint64_t v4 = v1[1];
  v7[0] = v3;
  v7[1] = v4;
  sub_25DDCA0BC(v3, v4);
  v2(v7);
  sub_25DDCA0D0(v3, v4);
  sub_25DDE32A0();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25DDC5C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25DDE31F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25DDE31E0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25DDCC574(a1, &qword_26A6C7E38);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25DDE31C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t static SegmentationTask.perform()@<X0>(uint64_t *a1@<X8>)
{
  BOOL v29 = a1;
  uint64_t v3 = sub_25DDE3040();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25DDE3050();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = ((char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10->isa = (Class)60;
  (*(void (**)(NSObject *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F018], v7);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  sub_25DDC53BC(v10, (uint64_t)&unk_26A6C7DE0, v11, (uint8_t *)&v30);
  if (v2)
  {
    (*(void (**)(NSObject *, uint64_t))(v8 + 8))(v10, v7);
    return swift_release();
  }
  else
  {
    v27[1] = 0;
    uint64_t v28 = v3;
    (*(void (**)(NSObject *, uint64_t))(v8 + 8))(v10, v7);
    swift_release();
    uint64_t v14 = v30;
    unint64_t v13 = v31;
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v15 = v28;
    uint64_t v16 = __swift_project_value_buffer(v28, (uint64_t)qword_26B3808C0);
    uint64_t v17 = v4;
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    dispatch_semaphore_t v19 = v6;
    v18(v6, v16, v15);
    sub_25DDCA0BC(v14, v13);
    sub_25DDCA0BC(v14, v13);
    uint64_t v20 = sub_25DDE3020();
    os_log_type_t v21 = sub_25DDE3250();
    if (os_log_type_enabled(v20, v21))
    {
      BOOL v22 = (uint8_t *)swift_slowAlloc();
      v27[0] = swift_slowAlloc();
      uint64_t v32 = v27[0];
      *(_DWORD *)BOOL v22 = 136315138;
      if (v13)
      {
        if (v13 == 1)
        {
          unint64_t v23 = 0xE700000000000000;
          uint64_t v24 = 0x64657070696B73;
        }
        else
        {
          uint64_t v30 = 0x3A6572756C696166;
          unint64_t v31 = 0xE900000000000020;
          sub_25DDCA0BC(v14, v13);
          sub_25DDE3130();
          sub_25DDCA0D0(v14, v13);
          uint64_t v24 = v30;
          unint64_t v23 = v31;
        }
      }
      else
      {
        unint64_t v23 = 0xE700000000000000;
        uint64_t v24 = 0x73736563637573;
      }
      uint64_t v30 = sub_25DDCA0E4(v24, v23, &v32);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      sub_25DDCA0D0(v14, v13);
      sub_25DDCA0D0(v14, v13);
      _os_log_impl(&dword_25DDB4000, v20, v21, "SegmentationTask.perform() result: %s", v22, 0xCu);
      uint64_t v25 = v27[0];
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v25, -1, -1);
      MEMORY[0x2611C78C0](v22, -1, -1);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v28);
    }
    else
    {
      sub_25DDCA0D0(v14, v13);
      sub_25DDCA0D0(v14, v13);

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v15);
    }
    uint64_t v26 = v29;
    uint64_t *v29 = v14;
    v26[1] = v13;
  }
  return result;
}

uint64_t sub_25DDC6220(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 48) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25DDC62C0;
  return static SegmentationTask.performAsync()(a1);
}

uint64_t sub_25DDC62C0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25DDC63F4, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25DDC63F4()
{
  uint64_t v1 = (void *)v0[7];
  uint64_t v2 = (void *)v0[5];
  sub_25DDE3330();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  sub_25DDE3130();
  v0[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7A40);
  sub_25DDE33A0();

  uint64_t v3 = v0[3];
  void *v2 = v0[2];
  v2[1] = v3;
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t static SegmentationTask.performAsync()(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = sub_25DDE2C90();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v4 = sub_25DDE2DC0();
  v2[17] = v4;
  v2[18] = *(void *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDC6620, 0, 0);
}

uint64_t sub_25DDC6620()
{
  if (_s16SiriUserSegments16SegmentationTaskC9isEnabledSbyFZ_0())
  {
    uint64_t v1 = v0[19];
    uint64_t v2 = v0[20];
    sub_25DDE2DA0();
    sub_25DDC9648(v1, v2);
    uint64_t v4 = v0[18];
    uint64_t v3 = v0[19];
    uint64_t v5 = v0[17];
    uint64_t v7 = v0[16];
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v0[21] = v8;
    v0[22] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v8(v3, v5);
    type metadata accessor for SegmentStore();
    sub_25DDB6818(v7);
    uint64_t v10 = self;
    id v11 = objc_msgSend(v10, sel_sharedPreferences);
    unsigned __int16 v12 = (unsigned __int16)objc_msgSend(v11, sel_assistantIsEnabled);

    id v13 = objc_msgSend(v10, sel_sharedPreferences);
    unsigned int v14 = objc_msgSend(v13, sel_dictationIsEnabled);

    v0[5] = &type metadata for AIMLInstrumentationStreamSource;
    v0[6] = &off_270AC5978;
    v0[10] = &type metadata for ITunesCloudMusicSubscriptionStatusController;
    v0[11] = &off_270AC53F8;
    uint64_t v15 = (void *)swift_task_alloc();
    v0[23] = v15;
    if (v14) {
      __int16 v16 = 256;
    }
    else {
      __int16 v16 = 0;
    }
    __int16 v17 = v16 | v12;
    void *v15 = v0;
    v15[1] = sub_25DDC68B0;
    uint64_t v18 = v0[20];
    uint64_t v19 = v0[16];
    return sub_25DDC6B64(v18, v19, 7, v17, (uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  }
  else
  {
    *(_OWORD *)v0[12] = xmmword_25DDE4880;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_25DDC68B0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = (void (*)(uint64_t, uint64_t))v2[21];
    uint64_t v4 = v2[20];
    uint64_t v5 = v2[17];
    (*(void (**)(void, void))(v2[15] + 8))(v2[16], v2[14]);
    v3(v4, v5);
    uint64_t v6 = sub_25DDC6ACC;
  }
  else
  {
    uint64_t v7 = (void (*)(uint64_t, uint64_t))v2[21];
    uint64_t v8 = v2[20];
    uint64_t v9 = v2[17];
    (*(void (**)(void, void))(v2[15] + 8))(v2[16], v2[14]);
    v7(v8, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v2 + 7));
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v2 + 2));
    uint64_t v6 = sub_25DDC6A4C;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_25DDC6A4C()
{
  uint64_t v1 = *(void **)(v0 + 96);
  *uint64_t v1 = 0;
  v1[1] = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25DDC6ACC()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25DDC6B64(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v7 + 232) = a6;
  *(void *)(v7 + 240) = v6;
  *(_WORD *)(v7 + 54) = a4;
  *(void *)(v7 + 216) = a3;
  *(void *)(v7 + 224) = a5;
  *(void *)(v7 + 200) = a1;
  *(void *)(v7 + 208) = a2;
  uint64_t v8 = type metadata accessor for SegmentsSummary();
  *(void *)(v7 + 248) = v8;
  *(void *)(v7 + 256) = *(void *)(v8 - 8);
  *(void *)(v7 + 264) = swift_task_alloc();
  *(void *)(v7 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D78);
  *(void *)(v7 + 280) = swift_task_alloc();
  *(void *)(v7 + 288) = swift_task_alloc();
  *(void *)(v7 + 296) = type metadata accessor for NewCustomerSegment.Result();
  *(void *)(v7 + 304) = swift_task_alloc();
  *(void *)(v7 + 312) = type metadata accessor for SegmentFlagLastSeenResult();
  *(void *)(v7 + 320) = swift_task_alloc();
  *(void *)(v7 + 328) = swift_task_alloc();
  *(void *)(v7 + 336) = swift_task_alloc();
  *(void *)(v7 + 344) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7EF0);
  *(void *)(v7 + 352) = swift_task_alloc();
  *(void *)(v7 + 360) = swift_task_alloc();
  *(void *)(v7 + 368) = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  *(void *)(v7 + 376) = swift_task_alloc();
  *(void *)(v7 + 384) = swift_task_alloc();
  uint64_t v9 = sub_25DDE3040();
  *(void *)(v7 + 392) = v9;
  *(void *)(v7 + 400) = *(void *)(v9 - 8);
  *(void *)(v7 + 408) = swift_task_alloc();
  *(void *)(v7 + 416) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  *(void *)(v7 + 424) = swift_task_alloc();
  *(void *)(v7 + 432) = swift_task_alloc();
  *(void *)(v7 + 440) = swift_task_alloc();
  *(void *)(v7 + 448) = swift_task_alloc();
  *(void *)(v7 + 456) = swift_task_alloc();
  *(void *)(v7 + 464) = swift_task_alloc();
  *(void *)(v7 + 472) = swift_task_alloc();
  *(void *)(v7 + 480) = swift_task_alloc();
  *(void *)(v7 + 488) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7DF8);
  *(void *)(v7 + 496) = swift_task_alloc();
  *(void *)(v7 + 504) = swift_task_alloc();
  uint64_t v10 = sub_25DDE2DC0();
  *(void *)(v7 + 512) = v10;
  *(void *)(v7 + 520) = *(void *)(v10 - 8);
  *(void *)(v7 + 528) = swift_task_alloc();
  *(void *)(v7 + 536) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDC6F24, 0, 0);
}

uint64_t sub_25DDC6F24()
{
  uint64_t v41 = v0;
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[67];
  uint64_t v4 = v0[64];
  uint64_t v3 = v0[65];
  v0[68] = __swift_project_value_buffer(v0[49], (uint64_t)qword_26B3808C0);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[69] = v5;
  v0[70] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v2, v1, v4);
  uint64_t v6 = sub_25DDE3020();
  os_log_type_t v7 = sub_25DDE3250();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[67];
  uint64_t v10 = v0[64];
  uint64_t v11 = v0[65];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v40[0] = v38;
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_25DDCC144((unint64_t *)&qword_26A6C7D48);
    uint64_t v13 = sub_25DDE3470();
    v0[24] = sub_25DDCA0E4(v13, v14, v40);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v9, v10);
    _os_log_impl(&dword_25DDB4000, v6, v7, "SegmentationTask.perform() calculationDate: %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v38, -1, -1);
    MEMORY[0x2611C78C0](v12, -1, -1);
  }
  else
  {
    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v15(v0[67], v0[64]);
  }

  v0[71] = v15;
  uint64_t v16 = v0[62];
  uint64_t v17 = v0[26];
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[32] + 56);
  v18(v0[63], 1, 1, v0[31]);
  type metadata accessor for SegmentStore();
  sub_25DDB6C80(v17, v16);
  uint64_t v19 = v0[62];
  uint64_t v20 = v0[63];
  v18(v19, 0, 1, v0[31]);
  sub_25DDCC0E0(v19, v20, &qword_26A6C7DF8);
  uint64_t v21 = v0[63];
  uint64_t v23 = v0[31];
  uint64_t v22 = v0[32];
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  v0[72] = v24;
  v0[73] = (v22 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  if (v24(v21, 1, v23)) {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[65] + 56))(v0[61], 1, 1, v0[64]);
  }
  else {
    sub_25DDBF600(v21 + *(int *)(v23 + 28), v0[61]);
  }
  uint64_t v25 = sub_25DDE3020();
  os_log_type_t v26 = sub_25DDE3250();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v28 = v0[60];
    uint64_t v27 = v0[61];
    BOOL v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    v40[0] = v30;
    *(_DWORD *)BOOL v29 = 136315138;
    swift_beginAccess();
    sub_25DDBF600(v27, v28);
    uint64_t v31 = sub_25DDE3110();
    v0[22] = sub_25DDCA0E4(v31, v32, v40);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DDB4000, v25, v26, "SegmentationTask: initial assistantLastActive: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v30, -1, -1);
    MEMORY[0x2611C78C0](v29, -1, -1);
  }

  char v39 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_26A6C7FA0 + dword_26A6C7FA0);
  os_log_type_t v33 = (void *)swift_task_alloc();
  v0[74] = v33;
  *os_log_type_t v33 = v0;
  v33[1] = sub_25DDC7530;
  uint64_t v34 = v0[27];
  uint64_t v35 = v0[28];
  uint64_t v36 = v0[25];
  return v39(v36, v34, v35);
}

uint64_t sub_25DDC7530(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 600) = a1;
  *(void *)(v3 + 608) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_25DDC7F98;
  }
  else {
    uint64_t v4 = sub_25DDC7648;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_25DDC7648()
{
  uint64_t v62 = v0;
  uint64_t v1 = *(void *)(v0 + 600);
  uint64_t v3 = *(void *)(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 488);
  __int16 v4 = *(_WORD *)(v0 + 54);
  type metadata accessor for ActivitySegmentCalculator();
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 616) = inited;
  *(unsigned char *)(inited + 16) = v4 & 1;
  *(unsigned char *)(inited + 17) = HIBYTE(v4) & 1;
  swift_beginAccess();
  sub_25DDBE6F8(v2, v1, v3);
  swift_beginAccess();
  sub_25DDCC0E0(v3, v2, (uint64_t *)&unk_26A6C7EC0);
  uint64_t v6 = sub_25DDE3020();
  os_log_type_t v7 = sub_25DDE3250();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = *(void *)(v0 + 480);
    uint64_t v8 = *(void *)(v0 + 488);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v61[0] = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    sub_25DDBF600(v8, v9);
    uint64_t v12 = sub_25DDE3110();
    *(void *)(v0 + 168) = sub_25DDCA0E4(v12, v13, v61);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DDB4000, v6, v7, "SegmentationTask: updated assistantLastActive: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v11, -1, -1);
    MEMORY[0x2611C78C0](v10, -1, -1);
  }

  uint64_t v14 = *(void *)(v0 + 608);
  uint64_t v15 = *(void *)(v0 + 600);
  uint64_t v16 = *(void *)(v0 + 472);
  uint64_t v17 = *(void *)(v0 + 200);
  sub_25DDBF600(*(void *)(v0 + 488), v16);
  sub_25DDBD83C(v17, v16, v15, (char *)v61);
  *(void *)(v0 + 624) = v14;
  if (v14)
  {
    uint64_t v18 = *(void *)(v0 + 488);
    sub_25DDCC574(*(void *)(v0 + 472), (uint64_t *)&unk_26A6C7EC0);
    swift_bridgeObjectRelease();
    swift_release();
    sub_25DDCC574(v18, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDCC574(*(void *)(v0 + 504), &qword_26A6C7DF8);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 544);
    uint64_t v23 = *(void *)(v0 + 400);
    uint64_t v22 = *(void *)(v0 + 408);
    uint64_t v24 = *(void *)(v0 + 392);
    sub_25DDCC574(*(void *)(v0 + 472), (uint64_t *)&unk_26A6C7EC0);
    uint64_t v25 = LOBYTE(v61[0]);
    *(unsigned char *)(v0 + 146) = v61[0];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v22, v21, v24);
    os_log_type_t v26 = sub_25DDE3020();
    os_log_type_t v27 = sub_25DDE3250();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = 0xD000000000000016;
      BOOL v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v60 = swift_slowAlloc();
      v61[0] = v60;
      *(_DWORD *)BOOL v29 = 136315138;
      unint64_t v30 = 0x800000025DDE5390;
      switch(v25)
      {
        case 1:
          unint64_t v30 = 0xE800000000000000;
          uint64_t v28 = 0x64656C6261736964;
          break;
        case 2:
          unint64_t v30 = 0xED0000796C6E4F6ELL;
          uint64_t v28 = 0x6F69746174636964;
          break;
        case 3:
          break;
        case 4:
          uint64_t v28 = 0xD000000000000018;
          uint64_t v34 = "active28DaysTo6MonthsAgo";
          goto LABEL_20;
        case 5:
          uint64_t v28 = 0xD000000000000013;
          uint64_t v34 = "active14To27DaysAgo";
          goto LABEL_20;
        case 6:
          uint64_t v28 = 0xD000000000000012;
          uint64_t v34 = "active7To13DaysAgo";
          goto LABEL_20;
        case 7:
          uint64_t v34 = "activeWithin7Days1Turn";
          goto LABEL_20;
        case 8:
          uint64_t v28 = 0xD00000000000001ALL;
          uint64_t v34 = "activeWithin7Days2To3Turns";
          goto LABEL_20;
        case 9:
          uint64_t v28 = 0xD00000000000001BLL;
          uint64_t v34 = "activeWithin7Days4PlusTurns";
          goto LABEL_20;
        case 10:
          uint64_t v28 = 0xD000000000000014;
          uint64_t v34 = "activeWithin7Days2x3";
LABEL_20:
          unint64_t v30 = (unint64_t)(v34 - 32) | 0x8000000000000000;
          break;
        default:
          unint64_t v30 = 0xE700000000000000;
          uint64_t v28 = 0x6E776F6E6B6E75;
          break;
      }
      uint64_t v35 = *(void *)(v0 + 400);
      uint64_t v36 = *(void *)(v0 + 408);
      uint64_t v37 = *(void *)(v0 + 392);
      *(void *)(v0 + 160) = sub_25DDCA0E4(v28, v30, v61);
      sub_25DDE32D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DDB4000, v26, v27, "SegmentationTask: activitySegment calculated: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v60, -1, -1);
      MEMORY[0x2611C78C0](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v37);
    }
    else
    {
      uint64_t v32 = *(void *)(v0 + 400);
      uint64_t v31 = *(void *)(v0 + 408);
      uint64_t v33 = *(void *)(v0 + 392);

      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    }
    sub_25DDE2D70();
    sub_25DDCC144((unint64_t *)&qword_26A6C7D28);
    if ((sub_25DDE30E0() & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x25DDC7F6CLL);
    }
    uint64_t v59 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
    uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
    uint64_t v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
    uint64_t v39 = *(void *)(v0 + 512);
    uint64_t v58 = *(void *)(v0 + 504);
    uint64_t v53 = *(void *)(v0 + 376);
    uint64_t v40 = *(void *)(v0 + 360);
    uint64_t v55 = *(void *)(v0 + 368);
    uint64_t v56 = *(void *)(v0 + 384);
    uint64_t v41 = *(void *)(v0 + 352);
    uint64_t v57 = *(void *)(v0 + 248);
    uint64_t v50 = *(void *)(v0 + 200);
    uint64_t v51 = *(void *)(v0 + 344);
    uint64_t v42 = v40 + *(int *)(v51 + 48);
    os_log_type_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 520) + 32);
    v43(v40, *(void *)(v0 + 528), v39);
    uint64_t v52 = v42;
    v38(v42, v50, v39);
    uint64_t v44 = v41 + *(int *)(v51 + 48);
    v38(v41, v40, v39);
    v38(v44, v42, v39);
    v43(v53, v41, v39);
    v54(v44, v39);
    uint64_t v45 = v41 + *(int *)(v51 + 48);
    v43(v41, v40, v39);
    v43(v45, v52, v39);
    v43(v53 + *(int *)(v55 + 36), v45, v39);
    v54(v41, v39);
    sub_25DDC4808(v53, v56);
    if (v59(v58, 1, v57)) {
      (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 520) + 56))(*(void *)(v0 + 464), 1, 1, *(void *)(v0 + 512));
    }
    else {
      sub_25DDBF600(*(void *)(v0 + 504) + *(int *)(*(void *)(v0 + 248) + 32), *(void *)(v0 + 464));
    }
    uint64_t v46 = (void *)swift_task_alloc();
    *(void *)(v0 + 632) = v46;
    *uint64_t v46 = v0;
    v46[1] = sub_25DDC8188;
    uint64_t v47 = *(void *)(v0 + 464);
    uint64_t v48 = *(void *)(v0 + 384);
    uint64_t v49 = *(void *)(v0 + 336);
    return sub_25DDD8AAC(v49, v48, v47);
  }
}

uint64_t sub_25DDC7F98()
{
  sub_25DDCC574(v0[61], (uint64_t *)&unk_26A6C7EC0);
  sub_25DDCC574(v0[63], &qword_26A6C7DF8);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_25DDC8188()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0 + 53;
  uint64_t v3 = *(void *)(*v0 + 464);
  uint64_t v8 = *v0;
  swift_task_dealloc();
  sub_25DDCC574(v3, (uint64_t *)&unk_26A6C7EC0);
  __int16 v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 640) = v4;
  *__int16 v4 = v8;
  v4[1] = sub_25DDC833C;
  v4[3] = v2;
  os_log_type_t v7 = (uint64_t (__cdecl *)())((char *)&dword_26A6C7CF8 + dword_26A6C7CF8);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[4] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_25DDC9054;
  return v7();
}

uint64_t sub_25DDC833C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDC8438, 0, 0);
}

uint64_t sub_25DDC8438()
{
  uint64_t v1 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 504);
  uint64_t v3 = *(void *)(v0 + 248);
  *(unsigned char *)(v0 + 147) = *(unsigned char *)(v0 + 53);
  if (v1(v2, 1, v3)) {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 520) + 56))(*(void *)(v0 + 456), 1, 1, *(void *)(v0 + 512));
  }
  else {
    sub_25DDBF600(v2 + *(int *)(v3 + 36), *(void *)(v0 + 456));
  }
  __int16 v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
  uint64_t v5 = *(void *)(v0 + 504);
  uint64_t v6 = *(void *)(v0 + 456);
  uint64_t v7 = *(void *)(v0 + 248);
  sub_25DDCF4AC(*(void *)(v0 + 384), v6, *(char **)(v0 + 328));
  sub_25DDCC574(v6, (uint64_t *)&unk_26A6C7EC0);
  if (v4(v5, 1, v7)) {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 520) + 56))(*(void *)(v0 + 448), 1, 1, *(void *)(v0 + 512));
  }
  else {
    sub_25DDBF600(*(void *)(v0 + 504) + *(int *)(*(void *)(v0 + 248) + 40), *(void *)(v0 + 448));
  }
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 576);
  uint64_t v9 = *(void *)(v0 + 504);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(v0 + 448);
  uint64_t v11 = *(void *)(v0 + 248);
  sub_25DDC941C(*(void *)(v0 + 200), v10, *(void *)(v0 + 600), *(unsigned char **)(v0 + 320));
  swift_bridgeObjectRelease();
  sub_25DDCC574((uint64_t)v10, (uint64_t *)&unk_26A6C7EC0);
  if (v8(v9, 1, v11))
  {
    uint64_t v12 = *(void *)(v0 + 288);
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 56))(v12, 1, 1, EnablementStatus);
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 288);
    sub_25DDCC018(*(void *)(v0 + 504) + *(int *)(*(void *)(v0 + 248) + 44), v14, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
    uint64_t v15 = type metadata accessor for SiriFirstEnablementStatus();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  __int16 v16 = *(_WORD *)(v0 + 54);
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 648) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_25DDC86D8;
  uint64_t v18 = *(void *)(v0 + 304);
  uint64_t v19 = *(void *)(v0 + 288);
  uint64_t v20 = *(void *)(v0 + 200);
  return sub_25DDC142C(v18, v20, v16 & 1, v19);
}

uint64_t sub_25DDC86D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 288);
  swift_task_dealloc();
  sub_25DDCC574(v1, &qword_26A6C7D78);
  return MEMORY[0x270FA2498](sub_25DDC87F8, 0, 0);
}

uint64_t sub_25DDC87F8()
{
  uint64_t v50 = v0;
  char v1 = *(unsigned char *)(v0 + 147);
  char v38 = *(unsigned char *)(v0 + 146);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
  uint64_t v36 = *(void *)(v0 + 528);
  uint64_t v37 = *(void *)(v0 + 512);
  uint64_t v39 = *(void *)(v0 + 480);
  uint64_t v40 = *(void *)(v0 + 488);
  uint64_t v42 = *(void *)(v0 + 440);
  uint64_t v43 = *(void *)(v0 + 432);
  uint64_t v46 = *(void *)(v0 + 424);
  uint64_t v3 = *(unsigned char **)(v0 + 328);
  uint64_t v2 = *(unsigned char **)(v0 + 336);
  uint64_t v5 = *(void *)(v0 + 312);
  __int16 v4 = *(unsigned char **)(v0 + 320);
  uint64_t v6 = *(unsigned char **)(v0 + 304);
  uint64_t v44 = *(void *)(v0 + 296);
  uint64_t v7 = *(void *)(v0 + 280);
  uint64_t v47 = *(void *)(v0 + 272);
  uint64_t v48 = *(void *)(v0 + 264);
  uint64_t v8 = *(void *)(v0 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DDE4890;
  *(unsigned char *)(inited + 32) = *v2;
  *(unsigned char *)(inited + 33) = v1;
  *(unsigned char *)(inited + 34) = *v3;
  *(unsigned char *)(inited + 35) = *v4;
  *(unsigned char *)(inited + 36) = *v6;
  uint64_t v45 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_25DDCBF14(inited);
  swift_setDeallocating();
  LOBYTE(v49[0]) = v38;
  v41(v36, v8, v37);
  sub_25DDBF600(v40, v39);
  sub_25DDBF600((uint64_t)&v2[*(int *)(v5 + 20)], v42);
  sub_25DDBF600((uint64_t)&v3[*(int *)(v5 + 20)], v43);
  sub_25DDBF600((uint64_t)&v4[*(int *)(v5 + 20)], v46);
  sub_25DDCC018((uint64_t)&v6[*(int *)(v44 + 20)], v7, (uint64_t (*)(void))type metadata accessor for SiriFirstEnablementStatus);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 56))(v7, 0, 1, EnablementStatus);
  sub_25DDDCB28(v49, v45, v36, v39, v42, v43, v46, v7, v47);
  sub_25DDCC018(v47, v48, (uint64_t (*)(void))type metadata accessor for SegmentsSummary);
  uint64_t v11 = sub_25DDE3020();
  os_log_type_t v12 = sub_25DDE3250();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void *)(v0 + 264);
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    v49[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v16 = SegmentsSummary.description.getter();
    *(void *)(v0 + 152) = sub_25DDCA0E4(v16, v17, v49);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDCC080(v13, (uint64_t (*)(void))type metadata accessor for SegmentsSummary);
    _os_log_impl(&dword_25DDB4000, v11, v12, "SegmentationTask ended: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v15, -1, -1);
    MEMORY[0x2611C78C0](v14, -1, -1);
  }
  else
  {
    sub_25DDCC080(*(void *)(v0 + 264), (uint64_t (*)(void))type metadata accessor for SegmentsSummary);
  }

  uint64_t v18 = *(void *)(v0 + 624);
  sub_25DDB7218(*(void *)(v0 + 272), *(void *)(v0 + 208));
  if (v18)
  {
    uint64_t v19 = *(void *)(v0 + 488);
    uint64_t v20 = *(void *)(v0 + 384);
    uint64_t v22 = *(void *)(v0 + 328);
    uint64_t v21 = *(void *)(v0 + 336);
    uint64_t v23 = *(void *)(v0 + 320);
    uint64_t v24 = *(void *)(v0 + 304);
    uint64_t v25 = *(void *)(v0 + 272);
    swift_release();
    sub_25DDCC080(v25, (uint64_t (*)(void))type metadata accessor for SegmentsSummary);
    sub_25DDCC080(v24, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
    sub_25DDCC080(v23, (uint64_t (*)(void))type metadata accessor for SegmentFlagLastSeenResult);
    sub_25DDCC080(v22, (uint64_t (*)(void))type metadata accessor for SegmentFlagLastSeenResult);
    sub_25DDCC080(v21, (uint64_t (*)(void))type metadata accessor for SegmentFlagLastSeenResult);
    sub_25DDCC574(v20, &qword_26A6C7C70);
    sub_25DDCC574(v19, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDCC574(*(void *)(v0 + 504), &qword_26A6C7DF8);
  }
  else
  {
    uint64_t v27 = *(void *)(v0 + 504);
    uint64_t v28 = *(void *)(v0 + 488);
    uint64_t v29 = *(void *)(v0 + 384);
    uint64_t v30 = *(void *)(v0 + 328);
    uint64_t v31 = *(void *)(v0 + 336);
    uint64_t v32 = *(void *)(v0 + 320);
    uint64_t v33 = *(void *)(v0 + 304);
    uint64_t v34 = *(void *)(v0 + 272);
    swift_release();
    sub_25DDCC080(v34, (uint64_t (*)(void))type metadata accessor for SegmentsSummary);
    sub_25DDCC080(v33, (uint64_t (*)(void))type metadata accessor for NewCustomerSegment.Result);
    sub_25DDCC080(v32, (uint64_t (*)(void))type metadata accessor for SegmentFlagLastSeenResult);
    sub_25DDCC080(v30, (uint64_t (*)(void))type metadata accessor for SegmentFlagLastSeenResult);
    sub_25DDCC080(v31, (uint64_t (*)(void))type metadata accessor for SegmentFlagLastSeenResult);
    sub_25DDCC574(v29, &qword_26A6C7C70);
    sub_25DDCC574(v28, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDCC574(v27, &qword_26A6C7DF8);
  }
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_25DDC8FB0(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  __int16 v4 = (uint64_t (__cdecl *)())((char *)&dword_26A6C7CF8 + dword_26A6C7CF8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v2;
  void *v2 = v1;
  v2[1] = sub_25DDC9054;
  return v4();
}

uint64_t sub_25DDC9054(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_25DDC920C;
  }
  else
  {
    *(void *)(v4 + 48) = a1;
    uint64_t v5 = sub_25DDC917C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25DDC917C()
{
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = objc_msgSend(v1, sel_statusType);

  if ((((unint64_t)v2 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    char v3 = 7;
  }
  else {
    char v3 = 3;
  }
  **(unsigned char **)(v0 + 24) = v3;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25DDC920C()
{
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = sub_25DDE3040();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3808C0);
  MEMORY[0x2611C7720](v1);
  MEMORY[0x2611C7720](v1);
  char v3 = sub_25DDE3020();
  os_log_type_t v4 = sub_25DDE3260();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = *(void **)(v0 + 40);
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x2611C7720](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v9;
    sub_25DDE32D0();
    *uint64_t v8 = v9;

    _os_log_impl(&dword_25DDB4000, v3, v4, "Unable to calculate music segment: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D88);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v8, -1, -1);
    MEMORY[0x2611C78C0](v7, -1, -1);
  }
  else
  {
  }
  **(unsigned char **)(v0 + 24) = 7;
  uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
  return v10();
}

uint64_t sub_25DDC941C@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_25DDD75BC(a1, a2, a3, a4);
}

uint64_t sub_25DDC9648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v31 = a1;
  uint64_t v30 = sub_25DDE2DC0();
  uint64_t v32 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v28 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25DDE2E80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v27 - v11;
  uint64_t v13 = sub_25DDE2DE0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_25DDE2E90();
  uint64_t v33 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F07740], v13);
  sub_25DDE2DF0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v19 = v30;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07870], v3);
  sub_25DDE2E40();
  uint64_t v20 = v6;
  uint64_t v21 = v32;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v20, v3);
  sub_25DDBF600((uint64_t)v12, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v19) == 1)
  {
    sub_25DDCC574((uint64_t)v10, (uint64_t *)&unk_26A6C7EC0);
    unint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    sub_25DDE3330();
    swift_bridgeObjectRelease();
    unint64_t v34 = 0xD000000000000026;
    unint64_t v35 = 0x800000025DDE58A0;
    sub_25DDCC144((unint64_t *)&qword_26A6C7D48);
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    unint64_t v22 = v34;
    unint64_t v23 = v35;
    sub_25DDCC1DC();
    swift_allocError();
    *uint64_t v24 = v22;
    v24[1] = v23;
    swift_willThrow();
  }
  else
  {
    os_log_type_t v26 = v28;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v28, v10, v19);
    sub_25DDE2E10();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v19);
  }
  sub_25DDCC574((uint64_t)v12, (uint64_t *)&unk_26A6C7EC0);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v36);
}

uint64_t SegmentationTask.deinit()
{
  return v0;
}

uint64_t SegmentationTask.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SegmentationTaskResult.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (!v1) {
    return 0x73736563637573;
  }
  if (v1 == 1) {
    return 0x64657070696B73;
  }
  sub_25DDE3130();
  return 0x3A6572756C696166;
}

uint64_t sub_25DDC9BF8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25DDC9C08(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25DDC9C44(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25DDC9D20;
  return v6(a1);
}

uint64_t sub_25DDC9D20()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DDC9E18(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_25DDC9E50(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DDC9E78(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_25DDC9EA0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_25DDCA0E4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_25DDE32D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_25DDC9F18()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DDC9F28(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_25DDC9FC8;
  return sub_25DDC6220(a1);
}

uint64_t sub_25DDC9FC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DDCA0BC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25DDCA0D0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25DDCA0E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25DDCA1B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25DDCC2D4((uint64_t)v12, *a3);
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
      sub_25DDCC2D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_25DDCA1B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25DDE32E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25DDCA374(a5, a6);
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
  uint64_t v8 = sub_25DDE3390();
  if (!v8)
  {
    sub_25DDE33B0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25DDE33D0();
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

uint64_t sub_25DDCA374(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25DDCA40C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25DDCA5EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25DDCA5EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25DDCA40C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25DDCA584(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25DDE3340();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25DDE33B0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25DDE3140();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25DDE33D0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25DDE33B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25DDCA584(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E30);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25DDCA5EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E30);
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
  uint64_t result = sub_25DDE33D0();
  __break(1u);
  return result;
}

unsigned char **sub_25DDCA73C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_25DDCA74C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_25DDE32D0();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_25DDCA804(uint64_t a1, uint64_t a2)
{
  sub_25DDE34E0();
  sub_25DDE3120();
  uint64_t v4 = sub_25DDE3500();
  return sub_25DDCA87C(a1, a2, v4);
}

unint64_t sub_25DDCA87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_25DDE3480() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_25DDE3480() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_25DDCA960(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_25DDD17D0();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    char v16 = a2;
    sub_25DDCB0DC(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v19;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_30;
  }
  uint64_t v9 = ~v7;
  while (2)
  {
    unint64_t v10 = 0x800000025DDE5320;
    unint64_t v11 = 0xD000000000000011;
    switch(*(unsigned char *)(*(void *)(v5 + 48) + v8))
    {
      case 1:
        unint64_t v11 = 0x6F69746174636964;
        unint64_t v10 = 0xE90000000000006ELL;
        break;
      case 2:
        unint64_t v10 = 0xE300000000000000;
        unint64_t v11 = 7496035;
        break;
      case 3:
        break;
      case 4:
        unint64_t v10 = 0xE700000000000000;
        unint64_t v11 = 0x73646F50726961;
        break;
      case 5:
        unint64_t v11 = 0x6D6F44736D6D6F63;
        unint64_t v10 = 0xED0000746E616E69;
        break;
      case 6:
        unint64_t v11 = 0xD00000000000001ALL;
        unint64_t v10 = 0x800000025DDE5350;
        break;
      default:
        unint64_t v11 = 0x6F7473754377656ELL;
        unint64_t v10 = 0xEB0000000072656DLL;
        break;
    }
    unint64_t v12 = 0x800000025DDE5320;
    unint64_t v13 = 0xD000000000000011;
    switch((char)a2)
    {
      case 1:
        unint64_t v12 = 0xE90000000000006ELL;
        if (v11 == 0x6F69746174636964) {
          goto LABEL_21;
        }
        goto LABEL_22;
      case 2:
        unint64_t v12 = 0xE300000000000000;
        if (v11 != 7496035) {
          goto LABEL_22;
        }
        goto LABEL_21;
      case 3:
        goto LABEL_20;
      case 4:
        unint64_t v12 = 0xE700000000000000;
        if (v11 != 0x73646F50726961) {
          goto LABEL_22;
        }
        goto LABEL_21;
      case 5:
        unint64_t v13 = 0x6D6F44736D6D6F63;
        unint64_t v12 = 0xED0000746E616E69;
LABEL_20:
        if (v11 == v13) {
          goto LABEL_21;
        }
        goto LABEL_22;
      case 6:
        unint64_t v12 = 0x800000025DDE5350;
        if (v11 != 0xD00000000000001ALL) {
          goto LABEL_22;
        }
        goto LABEL_21;
      default:
        unint64_t v12 = 0xEB0000000072656DLL;
        if (v11 != 0x6F7473754377656ELL) {
          goto LABEL_22;
        }
LABEL_21:
        if (v10 != v12)
        {
LABEL_22:
          char v14 = sub_25DDE3480();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v14) {
            goto LABEL_29;
          }
          unint64_t v8 = (v8 + 1) & v9;
          if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
            goto LABEL_27;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_29:
        swift_bridgeObjectRelease();
        uint64_t result = 0;
        char v16 = *(unsigned char *)(*(void *)(*v3 + 48) + v8);
LABEL_30:
        *a1 = v16;
        return result;
    }
  }
}

uint64_t sub_25DDCACF8()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E18);
  uint64_t v2 = sub_25DDE3310();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16)) {
    goto LABEL_38;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v27 = (void *)(v1 + 56);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v15 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_33;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_39;
    }
    if (v17 >= v7) {
      break;
    }
    unint64_t v18 = v27[v17];
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v7) {
        break;
      }
      unint64_t v18 = v27[v9];
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v7) {
          break;
        }
        unint64_t v18 = v27[v9];
        if (!v18)
        {
          int64_t v19 = v17 + 3;
          if (v19 >= v7) {
            break;
          }
          unint64_t v18 = v27[v19];
          if (!v18)
          {
            while (1)
            {
              int64_t v9 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_40;
              }
              if (v9 >= v7) {
                goto LABEL_34;
              }
              unint64_t v18 = v27[v9];
              ++v19;
              if (v18) {
                goto LABEL_32;
              }
            }
          }
          int64_t v9 = v19;
        }
      }
    }
LABEL_32:
    unint64_t v6 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_33:
    char v24 = *(unsigned char *)(*(void *)(v1 + 48) + v16);
    sub_25DDE34E0();
    sub_25DDE3120();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_25DDE3500();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    if (((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v20 = 0;
    unint64_t v21 = (unint64_t)(63 - v11) >> 6;
    do
    {
      if (++v13 == v21 && (v20 & 1) != 0)
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        JUMPOUT(0x25DDCB0C0);
      }
      BOOL v22 = v13 == v21;
      if (v13 == v21) {
        unint64_t v13 = 0;
      }
      v20 |= v22;
      uint64_t v23 = *(void *)(v8 + 8 * v13);
    }
    while (v23 == -1);
    unint64_t v14 = __clz(__rbit64(~v23)) + (v13 << 6);
LABEL_8:
    *(void *)(v8 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(unsigned char *)(*(void *)(v3 + 48) + v14) = v24;
    ++*(void *)(v3 + 16);
  }
LABEL_34:
  swift_release();
  uint64_t v25 = 1 << *(unsigned char *)(v1 + 32);
  if (v25 > 63) {
    bzero(v27, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v27 = -1 << v25;
  }
  *(void *)(v1 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v0 = v3;
  return result;
}

uint64_t sub_25DDCB0DC(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  char v20 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_25DDCACF8();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_25DDCB470();
        goto LABEL_34;
      }
      sub_25DDCB604();
    }
    uint64_t v8 = *v3;
    uint64_t result = sub_25DDD17D0();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      while (2)
      {
        unint64_t v11 = 0x800000025DDE5320;
        unint64_t v12 = 0xD000000000000011;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            unint64_t v12 = 0x6F69746174636964;
            unint64_t v11 = 0xE90000000000006ELL;
            break;
          case 2:
            unint64_t v11 = 0xE300000000000000;
            unint64_t v12 = 7496035;
            break;
          case 3:
            break;
          case 4:
            unint64_t v11 = 0xE700000000000000;
            unint64_t v12 = 0x73646F50726961;
            break;
          case 5:
            unint64_t v12 = 0x6D6F44736D6D6F63;
            unint64_t v11 = 0xED0000746E616E69;
            break;
          case 6:
            unint64_t v12 = 0xD00000000000001ALL;
            unint64_t v11 = 0x800000025DDE5350;
            break;
          default:
            unint64_t v12 = 0x6F7473754377656ELL;
            unint64_t v11 = 0xEB0000000072656DLL;
            break;
        }
        unint64_t v13 = 0x800000025DDE5320;
        unint64_t v14 = 0xD000000000000011;
        switch(v5)
        {
          case 1:
            unint64_t v13 = 0xE90000000000006ELL;
            if (v12 != 0x6F69746174636964) {
              goto LABEL_29;
            }
            goto LABEL_28;
          case 2:
            unint64_t v13 = 0xE300000000000000;
            if (v12 != 7496035) {
              goto LABEL_29;
            }
            goto LABEL_28;
          case 3:
            goto LABEL_27;
          case 4:
            unint64_t v13 = 0xE700000000000000;
            if (v12 != 0x73646F50726961) {
              goto LABEL_29;
            }
            goto LABEL_28;
          case 5:
            unint64_t v14 = 0x6D6F44736D6D6F63;
            unint64_t v13 = 0xED0000746E616E69;
LABEL_27:
            if (v12 == v14) {
              goto LABEL_28;
            }
            goto LABEL_29;
          case 6:
            unint64_t v13 = 0x800000025DDE5350;
            if (v12 != 0xD00000000000001ALL) {
              goto LABEL_29;
            }
            goto LABEL_28;
          default:
            unint64_t v13 = 0xEB0000000072656DLL;
            if (v12 != 0x6F7473754377656ELL) {
              goto LABEL_29;
            }
LABEL_28:
            if (v11 == v13) {
              goto LABEL_37;
            }
LABEL_29:
            char v15 = sub_25DDE3480();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v15) {
              goto LABEL_38;
            }
            a2 = (a2 + 1) & v10;
            if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
LABEL_34:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v16 + 48) + a2) = v20;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18)
  {
    __break(1u);
LABEL_37:
    swift_bridgeObjectRelease_n();
LABEL_38:
    sub_25DDE3490();
    __break(1u);
    JUMPOUT(0x25DDCB438);
  }
  *(void *)(v16 + 16) = v19;
  return result;
}

void *sub_25DDCB470()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25DDE3300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25DDCB604()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E18);
  uint64_t v2 = sub_25DDE3310();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_36;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v5 = v1 + 56;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v1 + 56);
  int64_t v26 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v15 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v16 = v15 | (v9 << 6);
      goto LABEL_33;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_37;
    }
    if (v17 >= v26) {
      break;
    }
    unint64_t v18 = *(void *)(v5 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v26) {
        break;
      }
      unint64_t v18 = *(void *)(v5 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v26) {
          break;
        }
        unint64_t v18 = *(void *)(v5 + 8 * v9);
        if (!v18)
        {
          int64_t v19 = v17 + 3;
          if (v19 >= v26) {
            break;
          }
          unint64_t v18 = *(void *)(v5 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v9 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_38;
              }
              if (v9 >= v26) {
                goto LABEL_34;
              }
              unint64_t v18 = *(void *)(v5 + 8 * v9);
              ++v19;
              if (v18) {
                goto LABEL_32;
              }
            }
          }
          int64_t v9 = v19;
        }
      }
    }
LABEL_32:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_33:
    char v24 = *(unsigned char *)(*(void *)(v1 + 48) + v16);
    sub_25DDE34E0();
    sub_25DDE3120();
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_25DDE3500();
    uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    if (((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v8 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v20 = 0;
    unint64_t v21 = (unint64_t)(63 - v11) >> 6;
    do
    {
      if (++v13 == v21 && (v20 & 1) != 0)
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        JUMPOUT(0x25DDCB994);
      }
      BOOL v22 = v13 == v21;
      if (v13 == v21) {
        unint64_t v13 = 0;
      }
      v20 |= v22;
      uint64_t v23 = *(void *)(v8 + 8 * v13);
    }
    while (v23 == -1);
    unint64_t v14 = __clz(__rbit64(~v23)) + (v13 << 6);
LABEL_8:
    *(void *)(v8 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(unsigned char *)(*(void *)(v3 + 48) + v14) = v24;
    ++*(void *)(v3 + 16);
  }
LABEL_34:
  uint64_t result = swift_release_n();
LABEL_36:
  *uint64_t v0 = v3;
  return result;
}

uint64_t _s16SiriUserSegments16SegmentationTaskC9isEnabledSbyFZ_0()
{
  uint64_t v10 = &type metadata for SiriUserSegmentsFeatureFlag;
  unint64_t v11 = sub_25DDCC230();
  if (qword_26A6C7A28 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (*((void *)off_26A6C7D00 + 2))
  {
    uint64_t v7 = sub_25DDE3350();
    uint64_t v8 = v0;
    sub_25DDE3130();
    sub_25DDE3350();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t v1 = off_26A6C7D00;
    if (*((void *)off_26A6C7D00 + 2))
    {
      unint64_t v2 = sub_25DDCA804(v7, v8);
      if (v3)
      {
        int v4 = *(unsigned __int8 *)(v1[7] + v2);
        if (v4 != 2)
        {
          char v5 = v4 & 1;
          swift_endAccess();
          swift_bridgeObjectRelease();
          goto LABEL_9;
        }
      }
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  char v5 = sub_25DDE2ED0();
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  return v5 & 1;
}

uint64_t _s16SiriUserSegments22SegmentationTaskResultO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      unint64_t v3 = 0;
      char v6 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
    if (v5 >= 2)
    {
      if (v2 == v4 && v3 == v5) {
        char v6 = 1;
      }
      else {
        char v6 = sub_25DDE3480();
      }
      goto LABEL_9;
    }
LABEL_8:
    char v6 = 0;
LABEL_9:
    sub_25DDCA0BC(v4, v5);
    sub_25DDCA0BC(v2, v3);
    goto LABEL_10;
  }
  if (v5 != 1) {
    goto LABEL_8;
  }
  unint64_t v3 = 1;
  char v6 = 1;
LABEL_10:
  sub_25DDCA0D0(v2, v3);
  sub_25DDCA0D0(v4, v5);
  return v6 & 1;
}

uint64_t type metadata accessor for SegmentationTask()
{
  return self;
}

uint64_t method lookup function for SegmentationTask(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SegmentationTask);
}

unint64_t destroy for SegmentationTaskResult(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16SiriUserSegments22SegmentationTaskResultOwCP_0(uint64_t a1, uint64_t a2)
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

void *assignWithCopy for SegmentationTaskResult(void *a1, void *a2)
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

uint64_t assignWithTake for SegmentationTaskResult(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for SegmentationTaskResult(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SegmentationTaskResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_25DDCBE54(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_25DDCBE70(void *result, int a2)
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

ValueMetadata *type metadata accessor for SegmentationTaskResult()
{
  return &type metadata for SegmentationTaskResult;
}

uint64_t sub_25DDCBEA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_25DDCC188();
  uint64_t result = sub_25DDE3240();
  uint64_t v7 = result;
  if (v2)
  {
    unsigned int v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_25DDCA960(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_25DDCBF14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    unsigned int v4 = (char *)MEMORY[0x263F8EE78];
    do
    {
      int v5 = *(unsigned __int8 *)(a1 + v3 + 32);
      if (v5 != 7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unsigned int v4 = sub_25DDCD14C(0, *((void *)v4 + 2) + 1, 1, v4);
        }
        unint64_t v7 = *((void *)v4 + 2);
        unint64_t v6 = *((void *)v4 + 3);
        if (v7 >= v6 >> 1) {
          unsigned int v4 = sub_25DDCD14C((char *)(v6 > 1), v7 + 1, 1, v4);
        }
        *((void *)v4 + 2) = v7 + 1;
        v4[v7 + 32] = v5;
      }
      ++v3;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    unsigned int v4 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v8 = sub_25DDCBEA0((uint64_t)v4);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_25DDCC018(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDCC080(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDCC0E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDCC144(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_25DDE2DC0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25DDCC188()
{
  unint64_t result = qword_26A6C7E10;
  if (!qword_26A6C7E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7E10);
  }
  return result;
}

unint64_t sub_25DDCC1DC()
{
  unint64_t result = qword_26A6C7E20;
  if (!qword_26A6C7E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7E20);
  }
  return result;
}

unint64_t sub_25DDCC230()
{
  unint64_t result = qword_26A6C7E28;
  if (!qword_26A6C7E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7E28);
  }
  return result;
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

uint64_t sub_25DDCC2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25DDCC334(uint64_t *a1)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = *(void *)(v1 + 24);
  *(void *)(v1 + 16) = *a1;
  *(void *)(v1 + 24) = v2;
  sub_25DDCC7B4(v3, v2);
  return sub_25DDCC7C4(v4, v5);
}

uint64_t sub_25DDCC384()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25DDCC3D4(uint64_t a1)
{
  uint64_t v3 = v2;
  unint64_t v5 = *(int **)(v1 + 32);
  uint64_t v6 = *(void *)(v1 + 64);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v1 + 48);
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_25DDCC91C;
  *(void *)(v7 + 40) = v6;
  *(_OWORD *)(v7 + 24) = v8;
  *(void *)(v7 + 16) = a1;
  unint64_t v11 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v7 + 48) = v9;
  void *v9 = v7;
  v9[1] = sub_25DDC5A74;
  return v11(a1);
}

unint64_t sub_25DDCC520()
{
  unint64_t result = qword_26A6C7E58;
  if (!qword_26A6C7E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7E58);
  }
  return result;
}

uint64_t sub_25DDCC574(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDCC5D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25DDCC608(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_25DDCC6C0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A6C7E60 + dword_26A6C7E60);
  return v6(a1, v4);
}

uint64_t sub_25DDCC6C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DDCC7B4(uint64_t a1, unint64_t a2)
{
  if (a2 != 2) {
    return sub_25DDCA0BC(a1, a2);
  }
  return a1;
}

uint64_t sub_25DDCC7C4(uint64_t a1, unint64_t a2)
{
  if (a2 != 2) {
    return sub_25DDCA0D0(a1, a2);
  }
  return a1;
}

void *initializeBufferWithCopyOfBuffer for SegmentationTaskError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SegmentationTaskError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SegmentationTaskError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for SegmentationTaskError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentationTaskError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SegmentationTaskError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SegmentationTaskError()
{
  return &type metadata for SegmentationTaskError;
}

uint64_t sub_25DDCC920(unint64_t a1, SEL *a2)
{
  uint64_t v11 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_25DDE33C0())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2611C7190](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v7 = v6;
      uint64_t v8 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      id v9 = [v6 *a2];

      if (v9)
      {
        MEMORY[0x2611C6FA0]();
        if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25DDE31A0();
        }
        sub_25DDE31B0();
        sub_25DDE3190();
      }
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25DDCCAA0()
{
  uint64_t result = v0;
  *(_DWORD *)(v0 + 24) = 0;
  *(void *)(v0 + 16) = 0;
  return result;
}

uint64_t sub_25DDCCAB0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return v2 & 1;
  }
  if (*(unsigned char *)(a2 + 32) == (result & 1)) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  uint64_t v3 = 33;
  while (1)
  {
    uint64_t v4 = v3 - 31;
    if (__OFADD__(v3 - 32, 1)) {
      break;
    }
    char v5 = *(unsigned char *)(a2 + v3) ^ result;
    if (v5)
    {
      ++v3;
      if (v4 != v2) {
        continue;
      }
    }
    LOBYTE(v2) = v5 ^ 1;
    return v2 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDCCB20(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 9; ; ++i)
  {
    uint64_t v4 = i - 7;
    if (__OFADD__(i - 8, 1)) {
      break;
    }
    BOOL v6 = *(_DWORD *)(a2 + 4 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDCCB84(unint64_t *a1)
{
  unint64_t v3 = a1[1];
  v1[22] = sub_25DDCD53C(v3);
  unint64_t v4 = sub_25DDCC920(v3, (SEL *)&selRef_punchOut);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v1[26] = v5 != 0;
  unint64_t v6 = a1[2];
  v1[23] = sub_25DDCDF1C(v6, (SEL *)&selRef_ended) & 1;
  v1[24] = sub_25DDCD788(v3) & 1;
  v1[21] = sub_25DDCDA9C(v3) & 1;
  char v7 = sub_25DDCDD48(v6);
  unint64_t v8 = sub_25DDCC920(v6, (SEL *)&selRef_requestMitigated);
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v1[27] = v7 & 1 | (v9 != 0);
  unint64_t v10 = *a1;
  v1[20] = sub_25DDCDF1C(*a1, (SEL *)&selRef_cancelled) & 1;
  char v11 = sub_25DDCE100(v3);
  v1[25] = v11 & 1;
  int v12 = v1[21];
  int v13 = v1[27];
  if ((v1[22] & 1) != 0 || (v1[26] & 1) != 0 || v1[23])
  {
    if ((v12 | v13) != 1) {
      goto LABEL_9;
    }
LABEL_11:
    char v14 = 0;
    goto LABEL_12;
  }
  if (v12 & 1 | ((v1[24] & 1) == 0) | v13 & 1) {
    goto LABEL_11;
  }
LABEL_9:
  char v14 = (v1[20] | v11) ^ 1;
LABEL_12:
  v1[16] = v14 & 1;
  v1[17] = sub_25DDCE368(v3) & 1;
  uint64_t result = sub_25DDCE5D8(v10, v3);
  v1[18] = result & 1;
  v1[19] = result & 1 & v1[17];
  return result;
}

uint64_t sub_25DDCCDA0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ValidTurnFeatureExtractor()
{
  return self;
}

void *sub_25DDCCDD4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E98);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size_0(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      int v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      int v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25DDCD450(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDCCEE4(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7EA8);
  uint64_t v10 = *(void *)(type metadata accessor for SiriUsageMetrics() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size_0(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_25DDE33B0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for SiriUsageMetrics() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_25DDCEB30(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_25DDCD14C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7EA0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size_0(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      unint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25DDCEC88(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25DDCD248(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7E80);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size_0(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      unint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25DDCD6A0(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25DDCD344(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = *((void *)a4 + 3);
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = *((void *)a4 + 2);
    if (v8 <= v9) {
      uint64_t v10 = *((void *)a4 + 2);
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      size_t v11 = (char *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size_0(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 29;
      }
      *((void *)v11 + 2) = v9;
      *((void *)v11 + 3) = 2 * (v13 >> 2);
      size_t v14 = v11 + 32;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      size_t v11 = (char *)MEMORY[0x263F8EE78];
      size_t v14 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[4 * v9 + 32]) {
          memmove(v14, a4 + 32, 4 * v9);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25DDCDC5C(0, v9, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_25DDCD450(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25DDE33D0();
  __break(1u);
  return result;
}

BOOL sub_25DDCD53C(unint64_t a1)
{
  unint64_t v2 = sub_25DDCC920(a1, (SEL *)&selRef_uufrSaid);
  unint64_t v3 = sub_25DDCC920(a1, (SEL *)&selRef_uufrShown);
  unint64_t v4 = sub_25DDCC920(a1, (SEL *)&selRef_uufrPresented);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6) {
    goto LABEL_8;
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v8 != 0;
}

char *sub_25DDCD6A0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25DDE33D0();
  __break(1u);
  return result;
}

uint64_t sub_25DDCD788(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25DDE33C0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_18;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x2611C7190](v4, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v4 + 32);
    }
    unint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_invocation);
    if (v8
      && (uint64_t v9 = v8,
          id v10 = objc_msgSend(v8, sel_keyboardInvocationContext),
          v9,
          v10))
    {
      unsigned __int8 v11 = objc_msgSend(v10, sel_keyboardPresented);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_25DDCD248(0, *((void *)v5 + 2) + 1, 1, v5);
      }
      unint64_t v13 = *((void *)v5 + 2);
      unint64_t v12 = *((void *)v5 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v5 = sub_25DDCD248((char *)(v12 > 1), v13 + 1, 1, v5);
      }
      *((void *)v5 + 2) = v13 + 1;
      v5[v13 + 32] = v11;
    }
    else
    {
    }
    ++v4;
  }
  while (v2 != v4);
LABEL_19:
  swift_bridgeObjectRelease();
  int v14 = sub_25DDCCAB0(1, (uint64_t)v5);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v16 = (char *)MEMORY[0x263F8EE78];
LABEL_35:
    int v24 = sub_25DDCCB20(11, (uint64_t)v16);
    swift_bridgeObjectRelease();
    return v14 & v24 & 1;
  }
  if (v2 >= 1)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = 0;
    uint64_t v16 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v17 = (id)MEMORY[0x2611C7190](v15, a1);
      }
      else {
        id v17 = *(id *)(a1 + 8 * v15 + 32);
      }
      unint64_t v18 = v17;
      id v19 = objc_msgSend(v17, sel_invocation);
      if (v19)
      {
        char v20 = v19;
        unsigned int v21 = objc_msgSend(v19, sel_invocationSource);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v16 = sub_25DDCD344(0, *((void *)v16 + 2) + 1, 1, v16, &qword_26A6C7E90);
        }
        unint64_t v23 = *((void *)v16 + 2);
        unint64_t v22 = *((void *)v16 + 3);
        if (v23 >= v22 >> 1) {
          uint64_t v16 = sub_25DDCD344((char *)(v22 > 1), v23 + 1, 1, v16, &qword_26A6C7E90);
        }
        *((void *)v16 + 2) = v23 + 1;
        *(_DWORD *)&v16[4 * v23 + 32] = v21;
      }
      else
      {
      }
      ++v15;
    }
    while (v2 != v15);
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25DDCDA9C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25DDE33C0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_17;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x2611C7190](v4, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v4 + 32);
    }
    unint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_ueiRequestCategorization);
    if (v8)
    {
      uint64_t v9 = v8;
      unsigned int v10 = objc_msgSend(v8, sel_requestStatus);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_25DDCD344(0, *((void *)v5 + 2) + 1, 1, v5, &qword_26A6C7E70);
      }
      unint64_t v12 = *((void *)v5 + 2);
      unint64_t v11 = *((void *)v5 + 3);
      if (v12 >= v11 >> 1) {
        uint64_t v5 = sub_25DDCD344((char *)(v11 > 1), v12 + 1, 1, v5, &qword_26A6C7E70);
      }
      *((void *)v5 + 2) = v12 + 1;
      *(_DWORD *)&v5[4 * v12 + 32] = v10;
    }
    else
    {
    }
    ++v4;
  }
  while (v2 != v4);
LABEL_18:
  swift_bridgeObjectRelease();
  if (*((void *)v5 + 2)) {
    char v13 = sub_25DDCCB20(2, (uint64_t)v5);
  }
  else {
    char v13 = 1;
  }
  swift_bridgeObjectRelease();
  return v13 & 1;
}

char *sub_25DDCDC5C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25DDE33D0();
  __break(1u);
  return result;
}

uint64_t sub_25DDCDD48(unint64_t a1)
{
  if (!(a1 >> 62))
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_18:
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
LABEL_19:
    swift_bridgeObjectRelease();
    char v14 = sub_25DDCCB20(1, (uint64_t)v5);
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25DDE33C0();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x2611C7190](v4, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v4 + 32);
      }
      unint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_requestContext);
      if (v8
        && (v9 = v8, id v10 = objc_msgSend(v8, sel_cancelled), v9, v10))
      {
        unsigned int v11 = objc_msgSend(v10, sel_reason);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v5 = sub_25DDCD344(0, *((void *)v5 + 2) + 1, 1, v5, &qword_26A6C7E88);
        }
        unint64_t v13 = *((void *)v5 + 2);
        unint64_t v12 = *((void *)v5 + 3);
        if (v13 >= v12 >> 1) {
          uint64_t v5 = sub_25DDCD344((char *)(v12 > 1), v13 + 1, 1, v5, &qword_26A6C7E88);
        }
        *((void *)v5 + 2) = v13 + 1;
        *(_DWORD *)&v5[4 * v13 + 32] = v11;
      }
      else
      {
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDCDF1C(unint64_t a1, SEL *a2)
{
  unint64_t v14 = MEMORY[0x263F8EE78];
  if (!(a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    unint64_t v12 = MEMORY[0x263F8EE78];
    if (!(MEMORY[0x263F8EE78] >> 62))
    {
LABEL_16:
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
      swift_bridgeObjectRelease();
      return v13 != 0;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_25DDE33C0();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_25DDE33C0();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_19;
  }
LABEL_3:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2611C7190](i, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * i + 32);
      }
      id v8 = v7;
      id v9 = objc_msgSend(v7, sel_requestContext);
      if (v9)
      {
        id v10 = v9;
        id v11 = [v9 *a2];

        if (v11)
        {
          MEMORY[0x2611C6FA0]();
          if (*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_25DDE31A0();
          }
          sub_25DDE31B0();
          sub_25DDE3190();
        }
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v12 = v14;
    if (!(v14 >> 62)) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDCE100(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25DDE33C0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    uint64_t v14 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v14) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_19;
  }
LABEL_3:
  if (v2 < 1) {
    goto LABEL_31;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x2611C7190](v4, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v4 + 32);
    }
    id v7 = v6;
    id v8 = objc_msgSend(v6, sel_invocation, v18, v19, v20, v21);
    if (v8)
    {
      id v9 = v8;
      objc_msgSend(v8, sel_invocationSource);

      uint64_t v20 = sub_25DDE32B0();
      uint64_t v21 = v10;
      uint64_t v18 = 0x434E554F4E4E415FLL;
      unint64_t v19 = 0xE900000000000045;
      sub_25DDCEADC();
      char v11 = sub_25DDE32F0();

      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_25DDCD248(0, *((void *)v5 + 2) + 1, 1, v5);
      }
      unint64_t v13 = *((void *)v5 + 2);
      unint64_t v12 = *((void *)v5 + 3);
      if (v13 >= v12 >> 1) {
        uint64_t v5 = sub_25DDCD248((char *)(v12 > 1), v13 + 1, 1, v5);
      }
      *((void *)v5 + 2) = v13 + 1;
      v5[v13 + 32] = v11 & 1;
    }
    else
    {
    }
    ++v4;
  }
  while (v2 != v4);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v14 = *((void *)v5 + 2);
  if (!v14) {
    goto LABEL_23;
  }
LABEL_20:
  if (v5[32] == 1)
  {
    uint64_t v15 = 1;
LABEL_24:
    swift_bridgeObjectRelease();
    return v15;
  }
  if (v14 == 1)
  {
LABEL_23:
    uint64_t v15 = 0;
    goto LABEL_24;
  }
  uint64_t v16 = 33;
  while (1)
  {
    uint64_t v17 = v16 - 31;
    if (__OFADD__(v16 - 32, 1)) {
      break;
    }
    uint64_t v15 = v5[v16];
    if ((v15 & 1) == 0)
    {
      ++v16;
      if (v17 != v14) {
        continue;
      }
    }
    goto LABEL_24;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_25DDCE368(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25DDE33C0();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v5 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_18;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)MEMORY[0x2611C7190](v4, a1);
    }
    else {
      id v6 = *(id *)(a1 + 8 * v4 + 32);
    }
    id v7 = v6;
    id v8 = objc_msgSend(v6, sel_invocation);
    if (v8)
    {
      id v9 = v8;
      objc_msgSend(v8, sel_invocationSource);

      sub_25DDE32B0();
      sub_25DDCEADC();
      char v10 = sub_25DDE32F0();

      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_25DDCD248(0, *((void *)v5 + 2) + 1, 1, v5);
      }
      unint64_t v12 = *((void *)v5 + 2);
      unint64_t v11 = *((void *)v5 + 3);
      if (v12 >= v11 >> 1) {
        uint64_t v5 = sub_25DDCD248((char *)(v11 > 1), v12 + 1, 1, v5);
      }
      *((void *)v5 + 2) = v12 + 1;
      v5[v12 + 32] = v10 & 1;
    }
    else
    {
    }
    ++v4;
  }
  while (v2 != v4);
  swift_bridgeObjectRelease();
LABEL_19:
  char v13 = sub_25DDCCAB0(1, (uint64_t)v5);
  swift_bridgeObjectRelease();
  unint64_t v14 = sub_25DDCC920(a1, (SEL *)&selRef_dictationContext);
  if (v14 >> 62) {
    uint64_t v15 = sub_25DDE33C0();
  }
  else {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v13 & 1 | (v15 != 0);
}

uint64_t sub_25DDCE5D8(unint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25DDE33C0();
    uint64_t v4 = result;
  }
  else
  {
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  unint64_t v40 = a1;
  unint64_t v6 = MEMORY[0x263F8EE78];
  if (v4)
  {
    if (v4 < 1)
    {
      __break(1u);
      goto LABEL_60;
    }
    uint64_t v7 = 0;
    id v8 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x2611C7190](v7, a2);
      }
      else {
        id v9 = *(id *)(a2 + 8 * v7 + 32);
      }
      char v10 = v9;
      id v11 = objc_msgSend(v9, sel_ueiRequestCategorization);
      if (v11)
      {
        unint64_t v12 = v11;
        unsigned int v13 = objc_msgSend(v11, sel_requestStatus);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v8 = sub_25DDCD344(0, *((void *)v8 + 2) + 1, 1, v8, &qword_26A6C7E70);
        }
        unint64_t v15 = *((void *)v8 + 2);
        unint64_t v14 = *((void *)v8 + 3);
        if (v15 >= v14 >> 1) {
          id v8 = sub_25DDCD344((char *)(v14 > 1), v15 + 1, 1, v8, &qword_26A6C7E70);
        }
        *((void *)v8 + 2) = v15 + 1;
        *(_DWORD *)&v8[4 * v15 + 32] = v13;
      }
      else
      {
      }
      ++v7;
    }
    while (v4 != v7);
  }
  else
  {
    id v8 = (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  char v39 = sub_25DDCCB20(3, (uint64_t)v8);
  swift_bridgeObjectRelease();
  unint64_t v16 = v40;
  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_25DDE33C0();
    uint64_t v17 = result;
    if (result)
    {
LABEL_20:
      if (v17 >= 1)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if ((v40 & 0xC000000000000001) != 0) {
            id v19 = (id)MEMORY[0x2611C7190](i, v40);
          }
          else {
            id v19 = *(id *)(v40 + 8 * i + 32);
          }
          uint64_t v20 = v19;
          id v21 = objc_msgSend(v19, sel_requestContext);
          if (v21)
          {
            unint64_t v22 = v21;
            id v23 = objc_msgSend(v21, sel_ended);

            if (v23)
            {
              MEMORY[0x2611C6FA0]();
              if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_25DDE31A0();
              }
              sub_25DDE31B0();
              sub_25DDE3190();
            }
          }
          else
          {
          }
        }
        unint64_t v16 = v40;
        swift_bridgeObjectRelease();
        unint64_t v24 = v6;
        if (!(v6 >> 62)) {
          goto LABEL_33;
        }
LABEL_57:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_25DDE33C0();
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
LABEL_60:
      __break(1u);
      __break(1u);
      return result;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v17) {
      goto LABEL_20;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v24 = MEMORY[0x263F8EE78];
  if (MEMORY[0x263F8EE78] >> 62) {
    goto LABEL_57;
  }
LABEL_33:
  uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_34:
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = 0;
    uint64_t v27 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((a2 & 0xC000000000000001) != 0) {
        id v28 = (id)MEMORY[0x2611C7190](v26, a2);
      }
      else {
        id v28 = *(id *)(a2 + 8 * v26 + 32);
      }
      uint64_t v29 = v28;
      id v30 = objc_msgSend(v28, sel_ueiRequestCategorization);
      if (v30)
      {
        uint64_t v31 = v30;
        unsigned int v32 = objc_msgSend(v30, sel_requestStatus);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v27 = sub_25DDCD344(0, *((void *)v27 + 2) + 1, 1, v27, &qword_26A6C7E70);
        }
        unint64_t v34 = *((void *)v27 + 2);
        unint64_t v33 = *((void *)v27 + 3);
        if (v34 >= v33 >> 1) {
          uint64_t v27 = sub_25DDCD344((char *)(v33 > 1), v34 + 1, 1, v27, &qword_26A6C7E70);
        }
        *((void *)v27 + 2) = v34 + 1;
        *(_DWORD *)&v27[4 * v34 + 32] = v32;
      }
      else
      {
      }
      ++v26;
    }
    while (v4 != v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = (char *)MEMORY[0x263F8EE78];
  }
  char v35 = sub_25DDCCB20(1, (uint64_t)v27);
  swift_bridgeObjectRelease();
  unint64_t v36 = sub_25DDCC920(v16, (SEL *)&selRef_partialResultGenerated);
  if (v36 >> 62) {
    uint64_t v37 = sub_25DDE33C0();
  }
  else {
    uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  BOOL v38 = v39;
  if (!(v39 & 1 | ((v35 & 1) == 0))) {
    return (v25 | v37) != 0;
  }
  return v38;
}

unint64_t sub_25DDCEADC()
{
  unint64_t result = qword_26A6C7E78;
  if (!qword_26A6C7E78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7E78);
  }
  return result;
}

uint64_t sub_25DDCEB30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for SiriUsageMetrics() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_25DDE33D0();
  __break(1u);
  return result;
}

char *sub_25DDCEC88(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25DDE33D0();
  __break(1u);
  return result;
}

uint64_t sub_25DDCED70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v90 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7EF0);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v72 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v88 = (uint64_t)v72 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  MEMORY[0x270FA5388](v14 - 8);
  unint64_t v16 = (char *)v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25DDE2DC0();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v87 = (char *)v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v86 = (char *)v72 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  BOOL v89 = (char *)v72 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)v72 - v24;
  uint64_t v26 = a1;
  uint64_t v28 = v27;
  sub_25DDD1048(v26, (uint64_t)v16, (uint64_t *)&unk_26A6C7EC0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v16, 1, v17) == 1)
  {
    sub_25DDD0DDC((uint64_t)v16, (uint64_t *)&unk_26A6C7EC0);
    return sub_25DDD1048((uint64_t)v91, v90, &qword_26A6C7C70);
  }
  else
  {
    int v81 = v6;
    uint64_t v82 = v8;
    uint64_t v83 = v12;
    uint64_t v84 = v3;
    uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v80(v25, v16, v17);
    id v30 = &v91[*(int *)(v9 + 36)];
    unint64_t v85 = sub_25DDC47B0();
    char v31 = sub_25DDE30C0();
    unsigned int v32 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
    unint64_t v33 = v25;
    uint64_t v78 = v30;
    unint64_t v34 = v89;
    if (v31)
    {
      char v35 = v89;
      unint64_t v36 = v30;
    }
    else
    {
      char v35 = v89;
      unint64_t v36 = v25;
    }
    v32(v35, v36, v17);
    uint64_t result = sub_25DDE30E0();
    if (result)
    {
      uint64_t v79 = v9;
      uint64_t v37 = v84;
      BOOL v38 = v82;
      char v39 = &v82[*(int *)(v84 + 48)];
      uint64_t v76 = v33;
      v32(v82, v33, v17);
      uint64_t v77 = v39;
      v32(v39, v34, v17);
      unint64_t v40 = v81;
      uint64_t v41 = &v81[*(int *)(v37 + 48)];
      v32(v81, v38, v17);
      unint64_t v73 = (void (*)(char *, uint64_t, uint64_t))v32;
      v32(v41, v39, v17);
      uint64_t v42 = (uint64_t)v83;
      uint64_t v74 = v28 + 32;
      v72[1] = v28 + 16;
      uint64_t v43 = v80;
      v80(v83, v40, v17);
      uint64_t v44 = *(void (**)(char *, uint64_t))(v28 + 8);
      v44(v41, v17);
      uint64_t v45 = *(int *)(v37 + 48);
      uint64_t v46 = v79;
      uint64_t v47 = &v40[v45];
      uint64_t v48 = v38;
      uint64_t v49 = (uint64_t)v91;
      v43(v40, v48, v17);
      v43(v47, v77, v17);
      v43((char *)(v42 + *(int *)(v46 + 36)), v47, v17);
      uint64_t v77 = (char *)(v28 + 8);
      uint64_t v75 = v44;
      v44(v40, v17);
      uint64_t v50 = v88;
      sub_25DDC4808(v42, v88);
      if (sub_25DDE30B0())
      {
        uint64_t v51 = v86;
        uint64_t v52 = v73;
        v73(v86, v50, v17);
        uint64_t v53 = v87;
      }
      else
      {
        uint64_t v52 = v73;
        uint64_t v54 = v50 + *(int *)(v46 + 36);
        char v55 = sub_25DDE30C0();
        uint64_t v51 = v86;
        uint64_t v53 = v87;
        if (v55)
        {
          uint64_t v56 = v86;
          uint64_t v57 = v54;
        }
        else
        {
          uint64_t v56 = v86;
          uint64_t v57 = v49;
        }
        v52(v56, v57, v17);
      }
      uint64_t v58 = v50 + *(int *)(v46 + 36);
      uint64_t v59 = (uint64_t)v78;
      if (sub_25DDE30C0())
      {
        uint64_t v60 = v53;
        uint64_t v61 = v58;
      }
      else if (sub_25DDE30B0())
      {
        uint64_t v60 = v53;
        uint64_t v61 = v50;
      }
      else
      {
        uint64_t v60 = v53;
        uint64_t v61 = v59;
      }
      v52(v60, v61, v17);
      uint64_t v62 = v84;
      uint64_t v63 = v82;
      uint64_t v64 = (uint64_t)&v82[*(int *)(v84 + 48)];
      uint64_t v65 = (void (*)(uint64_t, char *, uint64_t))v80;
      v80(v82, v51, v17);
      uint64_t v66 = v64;
      uint64_t v91 = (char *)v64;
      v65(v64, v53, v17);
      os_log_type_t v67 = v81;
      uint64_t v68 = &v81[*(int *)(v62 + 48)];
      v52(v81, (uint64_t)v63, v17);
      v52(v68, v66, v17);
      uint64_t v69 = (uint64_t)v83;
      v65((uint64_t)v83, v67, v17);
      uint64_t v70 = v75;
      v75(v68, v17);
      unint64_t v71 = &v67[*(int *)(v62 + 48)];
      v65((uint64_t)v67, v63, v17);
      v65((uint64_t)v71, v91, v17);
      v65(v69 + *(int *)(v79 + 36), v71, v17);
      v70(v67, v17);
      sub_25DDC4808(v69, v90);
      sub_25DDD0DDC(v88, &qword_26A6C7C70);
      v70(v89, v17);
      return ((uint64_t (*)(char *, uint64_t))v70)(v76, v17);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_25DDCF4AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EB0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v51 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D90);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v53 = (uint64_t)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v56 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v50 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v50 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = a1;
  sub_25DDCED70(a2, (uint64_t)v23);
  id v24 = objc_msgSend((id)BiomeLibrary(), sel_Device);
  swift_unknownObjectRelease();
  id v25 = objc_msgSend(v24, sel_Wireless);
  swift_unknownObjectRelease();
  id v26 = objc_msgSend(v25, sel_Bluetooth);
  swift_unknownObjectRelease();
  sub_25DDD0454(v26, (uint64_t)v23, (uint64_t)sub_25DDCFAAC, 0, (uint64_t)v20);

  uint64_t v52 = a2;
  uint64_t v27 = v9;
  uint64_t v28 = v56;
  sub_25DDBD548((uint64_t)v20, a2, (uint64_t)v18);
  sub_25DDD1048((uint64_t)v18, (uint64_t)v15, (uint64_t *)&unk_26A6C7EC0);
  uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  uint64_t v55 = v27;
  if (v29(v15, 1, v27) == 1)
  {
    sub_25DDD0DDC((uint64_t)v18, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD0DDC((uint64_t)v20, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD0DDC((uint64_t)v23, &qword_26A6C7C70);
    sub_25DDD0DDC((uint64_t)v15, (uint64_t *)&unk_26A6C7EC0);
    char v39 = v54;
    uint64_t v40 = v52;
    uint64_t SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
    uint64_t result = sub_25DDD1048(v40, (uint64_t)&v39[*(int *)(SeenResult + 20)], (uint64_t *)&unk_26A6C7EC0);
  }
  else
  {
    id v30 = v11;
    char v31 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v31(v30, v15, v55);
    uint64_t v32 = v50 + *(int *)(v21 + 36);
    uint64_t v33 = sub_25DDE2DE0();
    uint64_t v34 = v53;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v53, 1, 1, v33);
    uint64_t v35 = sub_25DDE2EB0();
    uint64_t v36 = (uint64_t)v51;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v51, 1, 1, v35);
    uint64_t v37 = sub_25DDDB1A8(v32, v34, v36);
    BOOL v38 = v30;
    uint64_t v44 = (uint64_t)v37;
    sub_25DDD0DDC(v36, (uint64_t *)&unk_26A6C7EB0);
    sub_25DDD0DDC(v53, &qword_26A6C7D90);
    sub_25DDD0DDC((uint64_t)v18, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD0DDC((uint64_t)v20, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD0DDC((uint64_t)v23, &qword_26A6C7C70);
    BOOL v45 = v44 <= 27;
    char v39 = v54;
    if (v45)
    {
      uint64_t v46 = &v39[*(int *)(type metadata accessor for SegmentFlagLastSeenResult() + 20)];
      uint64_t v47 = v55;
      v31(v46, v38, v55);
      uint64_t result = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v46, 0, 1, v47);
      char v43 = 4;
      goto LABEL_5;
    }
    uint64_t v48 = v55;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v38, v55);
    uint64_t v49 = type metadata accessor for SegmentFlagLastSeenResult();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(&v39[*(int *)(v49 + 20)], 1, 1, v48);
  }
  char v43 = 7;
LABEL_5:
  *char v39 = v43;
  return result;
}

id sub_25DDCFAAC(void *a1)
{
  return objc_msgSend(a1, sel_appleAudioDevice);
}

uint64_t sub_25DDCFACC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v65 = a4;
  uint64_t v64 = a3;
  id v59 = a1;
  uint64_t v67 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  uint64_t v7 = v6 - 8;
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v62 = *(void *)(v63 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v61 = (uint64_t)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v54 - v13;
  uint64_t v15 = swift_allocObject();
  uint64_t v68 = v15;
  *(void *)(v15 + 16) = 0;
  v54[1] = v15 + 16;
  uint64_t v16 = swift_allocObject();
  uint64_t v60 = v16;
  *(void *)(v16 + 16) = 0;
  v54[3] = v16 + 16;
  uint64_t v17 = swift_allocObject();
  uint64_t v58 = v17;
  *(void *)(v17 + 16) = 0;
  v54[2] = v17 + 16;
  uint64_t v56 = v9;
  uint64_t v57 = swift_allocBox();
  uint64_t v19 = v18;
  uint64_t v20 = sub_25DDE2DC0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v66 = v19;
  v22(v19, 1, 1, v20);
  uint64_t v23 = (void *)sub_25DDE3100();
  sub_25DDD177C(0, &qword_26A6C7ED0);
  uint64_t v24 = a2 + *(int *)(v7 + 44);
  id v25 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v25(v14, v24, v20);
  v22((uint64_t)v14, 0, 1, v20);
  v25(v12, a2, v20);
  v22((uint64_t)v12, 0, 1, v20);
  uint64_t v55 = v14;
  id v26 = sub_25DDD0E48((uint64_t)v14, (uint64_t)v12, 0, 0, 1);
  id v59 = objc_msgSend(v59, sel_publisherWithUseCase_options_, v23, v26);

  uint64_t v78 = sub_25DDDC468;
  uint64_t v79 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v75 = 1107296256;
  uint64_t v76 = sub_25DDD0FC8;
  uint64_t v77 = &block_descriptor_14;
  uint64_t v27 = _Block_copy(&aBlock);
  uint64_t v28 = v61;
  sub_25DDD1048(a2, v61, &qword_26A6C7C70);
  unint64_t v29 = (*(unsigned __int8 *)(v63 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  unint64_t v30 = (v62 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v68;
  sub_25DDC4808(v28, v33 + v29);
  uint64_t v34 = (void *)(v33 + v30);
  uint64_t v35 = v58;
  uint64_t v36 = v65;
  *uint64_t v34 = v64;
  v34[1] = v36;
  *(void *)(v33 + v31) = v57;
  *(void *)(v33 + v32) = v35;
  uint64_t v37 = v60;
  *(void *)(v33 + ((v32 + 15) & 0xFFFFFFFFFFFFFFF8)) = v60;
  uint64_t v78 = (void (*)(void *))sub_25DDD16B4;
  uint64_t v79 = v33;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v75 = 1107296256;
  uint64_t v76 = sub_25DDD1484;
  uint64_t v77 = &block_descriptor_20;
  BOOL v38 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  id v39 = v59;
  id v40 = objc_msgSend(v59, sel_sinkWithCompletion_shouldContinue_, v27, v38);
  _Block_release(v38);
  _Block_release(v27);

  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_25DDE3040();
  __swift_project_value_buffer(v41, (uint64_t)qword_26B3808C0);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  uint64_t v42 = sub_25DDE3020();
  os_log_type_t v43 = sub_25DDE3250();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t aBlock = v65;
    *(_DWORD *)uint64_t v44 = 136316418;
    uint64_t v73 = sub_25DDCA0E4(0xD000000000000027, 0x800000025DDE5DB0, &aBlock);
    sub_25DDE32D0();
    *(_WORD *)(v44 + 12) = 2048;
    swift_beginAccess();
    uint64_t v72 = *(void *)(v68 + 16);
    sub_25DDE32D0();
    swift_release();
    *(_WORD *)(v44 + 22) = 2080;
    uint64_t v72 = sub_25DDD177C(0, &qword_26A6C7EF8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7F00);
    uint64_t v45 = sub_25DDE3110();
    uint64_t v72 = sub_25DDCA0E4(v45, v46, &aBlock);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 32) = 2048;
    swift_beginAccess();
    uint64_t v47 = *(void *)(v35 + 16);
    swift_release();
    uint64_t v71 = v47;
    sub_25DDE32D0();
    swift_release();
    *(_WORD *)(v44 + 42) = 2048;
    swift_beginAccess();
    uint64_t v48 = *(void *)(v37 + 16);
    swift_release();
    uint64_t v70 = v48;
    sub_25DDE32D0();
    swift_release();
    *(_WORD *)(v44 + 52) = 2080;
    uint64_t v49 = v66;
    swift_beginAccess();
    sub_25DDD1048(v49, (uint64_t)v55, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v50 = sub_25DDE3110();
    uint64_t v69 = sub_25DDCA0E4(v50, v51, &aBlock);
    sub_25DDE32D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DDB4000, v42, v43, "%s Scanned %ld %s events; %ld more recent, non-matching events; %ld date out of range; result %s",
      (uint8_t *)v44,
      0x3Eu);
    uint64_t v52 = v65;
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v52, -1, -1);
    MEMORY[0x2611C78C0](v44, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_release();
    swift_release_n();
    swift_release_n();
    uint64_t v49 = v66;
  }
  swift_beginAccess();
  sub_25DDD1048(v49, v67, (uint64_t *)&unk_26A6C7EC0);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25DDD0454@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v65 = a4;
  uint64_t v64 = a3;
  id v59 = a1;
  uint64_t v67 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  uint64_t v7 = v6 - 8;
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v62 = *(void *)(v63 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v61 = (uint64_t)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v54 - v13;
  uint64_t v15 = swift_allocObject();
  uint64_t v68 = v15;
  *(void *)(v15 + 16) = 0;
  v54[1] = v15 + 16;
  uint64_t v16 = swift_allocObject();
  uint64_t v60 = v16;
  *(void *)(v16 + 16) = 0;
  v54[3] = v16 + 16;
  uint64_t v17 = swift_allocObject();
  uint64_t v58 = v17;
  *(void *)(v17 + 16) = 0;
  v54[2] = v17 + 16;
  uint64_t v56 = v9;
  uint64_t v57 = swift_allocBox();
  uint64_t v19 = v18;
  uint64_t v20 = sub_25DDE2DC0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
  uint64_t v66 = v19;
  v22(v19, 1, 1, v20);
  uint64_t v23 = (void *)sub_25DDE3100();
  sub_25DDD177C(0, &qword_26A6C7ED0);
  uint64_t v24 = a2 + *(int *)(v7 + 44);
  id v25 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v25(v14, v24, v20);
  v22((uint64_t)v14, 0, 1, v20);
  v25(v12, a2, v20);
  v22((uint64_t)v12, 0, 1, v20);
  uint64_t v55 = v14;
  id v26 = sub_25DDD0E48((uint64_t)v14, (uint64_t)v12, 0, 0, 1);
  id v59 = objc_msgSend(v59, sel_publisherWithUseCase_options_, v23, v26);

  uint64_t v78 = sub_25DDDC468;
  uint64_t v79 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v75 = 1107296256;
  uint64_t v76 = sub_25DDD0FC8;
  uint64_t v77 = &block_descriptor_0;
  uint64_t v27 = _Block_copy(&aBlock);
  uint64_t v28 = v61;
  sub_25DDD1048(a2, v61, &qword_26A6C7C70);
  unint64_t v29 = (*(unsigned __int8 *)(v63 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  unint64_t v30 = (v62 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v31 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v68;
  sub_25DDC4808(v28, v33 + v29);
  uint64_t v34 = (void *)(v33 + v30);
  uint64_t v35 = v58;
  uint64_t v36 = v65;
  *uint64_t v34 = v64;
  v34[1] = v36;
  *(void *)(v33 + v31) = v57;
  *(void *)(v33 + v32) = v35;
  uint64_t v37 = v60;
  *(void *)(v33 + ((v32 + 15) & 0xFFFFFFFFFFFFFFF8)) = v60;
  uint64_t v78 = (void (*)(void *))sub_25DDD1480;
  uint64_t v79 = v33;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v75 = 1107296256;
  uint64_t v76 = sub_25DDD1484;
  uint64_t v77 = &block_descriptor_8;
  BOOL v38 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  id v39 = v59;
  id v40 = objc_msgSend(v59, sel_sinkWithCompletion_shouldContinue_, v27, v38);
  _Block_release(v38);
  _Block_release(v27);

  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v41 = sub_25DDE3040();
  __swift_project_value_buffer(v41, (uint64_t)qword_26B3808C0);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  uint64_t v42 = sub_25DDE3020();
  os_log_type_t v43 = sub_25DDE3250();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t aBlock = v65;
    *(_DWORD *)uint64_t v44 = 136316418;
    uint64_t v73 = sub_25DDCA0E4(0xD000000000000027, 0x800000025DDE5DB0, &aBlock);
    sub_25DDE32D0();
    *(_WORD *)(v44 + 12) = 2048;
    swift_beginAccess();
    uint64_t v72 = *(void *)(v68 + 16);
    sub_25DDE32D0();
    swift_release();
    *(_WORD *)(v44 + 22) = 2080;
    uint64_t v72 = sub_25DDD177C(0, &qword_26A6C7ED8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EE0);
    uint64_t v45 = sub_25DDE3110();
    uint64_t v72 = sub_25DDCA0E4(v45, v46, &aBlock);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 32) = 2048;
    swift_beginAccess();
    uint64_t v47 = *(void *)(v35 + 16);
    swift_release();
    uint64_t v71 = v47;
    sub_25DDE32D0();
    swift_release();
    *(_WORD *)(v44 + 42) = 2048;
    swift_beginAccess();
    uint64_t v48 = *(void *)(v37 + 16);
    swift_release();
    uint64_t v70 = v48;
    sub_25DDE32D0();
    swift_release();
    *(_WORD *)(v44 + 52) = 2080;
    uint64_t v49 = v66;
    swift_beginAccess();
    sub_25DDD1048(v49, (uint64_t)v55, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v50 = sub_25DDE3110();
    uint64_t v69 = sub_25DDCA0E4(v50, v51, &aBlock);
    sub_25DDE32D0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DDB4000, v42, v43, "%s Scanned %ld %s events; %ld more recent, non-matching events; %ld date out of range; result %s",
      (uint8_t *)v44,
      0x3Eu);
    uint64_t v52 = v65;
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v52, -1, -1);
    MEMORY[0x2611C78C0](v44, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_release();
    swift_release_n();
    swift_release_n();
    uint64_t v49 = v66;
  }
  swift_beginAccess();
  sub_25DDD1048(v49, v67, (uint64_t *)&unk_26A6C7EC0);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_25DDD0DDC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDD0E38()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_25DDD0E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v12 = 0;
  if (v11(a1, 1, v9) != 1)
  {
    uint64_t v12 = (void *)sub_25DDE2D80();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (void *)sub_25DDE2D80();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v12, v13, a3, a4, a5 & 1);

  return v14;
}

void sub_25DDD0FC8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
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

uint64_t sub_25DDD1048(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDD10AC(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v42 = a8;
  id v39 = a4;
  uint64_t v40 = a7;
  uint64_t v38 = a5;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v37 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  MEMORY[0x270FA5388](v41);
  id v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25DDE2DC0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v36 - v20;
  uint64_t v36 = swift_projectBox();
  uint64_t result = swift_beginAccess();
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(a2 + 16) = v25;
  id v43 = a1;
  objc_msgSend(a1, sel_timestamp);
  sub_25DDE2CE0();
  sub_25DDC47B0();
  char v26 = sub_25DDE30E0();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  sub_25DDD1048(a3, (uint64_t)v14, &qword_26A6C7C70);
  if (v26) {
    char v27 = sub_25DDE30C0();
  }
  else {
    char v27 = 0;
  }
  sub_25DDD0DDC((uint64_t)v14, &qword_26A6C7C70);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v16 + 8);
  v28(v19, v15);
  if (v27)
  {
    id v29 = objc_msgSend(v43, sel_eventBody);
    if (v29)
    {
      unint64_t v30 = v29;
      char v31 = v39();

      if (v31)
      {
        uint64_t v32 = (uint64_t)v37;
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v37, v21, v15);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v32, 0, 1, v15);
        uint64_t v33 = v36;
        swift_beginAccess();
        sub_25DDD14DC(v32, v33);
        return 0;
      }
    }
  }
  else
  {
    uint64_t v34 = (uint64_t *)(v42 + 16);
    v28(v21, v15);
    swift_beginAccess();
    uint64_t v35 = *v34 + 1;
    if (!__OFADD__(*v34, 1)) {
      goto LABEL_13;
    }
    __break(1u);
  }
  uint64_t v34 = (uint64_t *)(v40 + 16);
  v28(v21, v15);
  uint64_t result = swift_beginAccess();
  uint64_t v35 = *v34 + 1;
  if (__OFADD__(*v34, 1))
  {
LABEL_16:
    __break(1u);
    return result;
  }
LABEL_13:
  *uint64_t v34 = v35;
  return 1;
}

uint64_t sub_25DDD1484(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_25DDD14DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  unint64_t v8 = ((((((((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 15) & 0xFFFFFFFFFFFFFFF8)
     + 8;
  uint64_t v9 = v2 | 7;
  swift_release();
  uint64_t v4 = v0 + v3;
  uint64_t v5 = sub_25DDE2DC0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v4 + v1[11], v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t sub_25DDD16B8(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_25DDD10AC(a1, *(void *)(v1 + 16), v1 + v4, *(uint64_t (**)(void))(v1 + v5), *(void *)(v1 + v5 + 8), *(void *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1 + ((((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v1+ ((((((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8))) & 1;
}

uint64_t sub_25DDD177C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25DDD17D0()
{
  return sub_25DDE3500();
}

unint64_t SegmentFlags.rawValue.getter()
{
  unint64_t result = 0xD000000000000011;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6F69746174636964;
      break;
    case 2:
      unint64_t result = 7496035;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x73646F50726961;
      break;
    case 5:
      unint64_t result = 0x6D6F44736D6D6F63;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      unint64_t result = 0x6F7473754377656ELL;
      break;
  }
  return result;
}

SiriUserSegments::SegmentFlags_optional __swiftcall SegmentFlags.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_25DDE33E0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static SegmentFlags.allCases.getter()
{
  return &unk_270AC4F20;
}

uint64_t sub_25DDD1A7C(unsigned __int8 *a1, char *a2)
{
  return sub_25DDD1E4C(*a1, *a2);
}

unint64_t sub_25DDD1A8C()
{
  unint64_t result = qword_26A6C7F10;
  if (!qword_26A6C7F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F10);
  }
  return result;
}

uint64_t sub_25DDD1AE0()
{
  return sub_25DDD17D0();
}

uint64_t sub_25DDD1AEC()
{
  return sub_25DDD24D0();
}

uint64_t sub_25DDD1AF4()
{
  return sub_25DDD17D0();
}

SiriUserSegments::SegmentFlags_optional sub_25DDD1AFC(Swift::String *a1)
{
  return SegmentFlags.init(rawValue:)(*a1);
}

unint64_t sub_25DDD1B08@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SegmentFlags.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25DDD1B30()
{
  return sub_25DDE3160();
}

uint64_t sub_25DDD1B90()
{
  return sub_25DDE3150();
}

unint64_t sub_25DDD1BE4()
{
  unint64_t result = qword_26A6C7F18;
  if (!qword_26A6C7F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C7F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F18);
  }
  return result;
}

void sub_25DDD1C40(void *a1@<X8>)
{
  *a1 = &unk_270AC4F20;
}

uint64_t getEnumTagSinglePayload for SegmentFlags(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SegmentFlags(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x25DDD1DACLL);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_25DDD1DD4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DDD1DE0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SegmentFlags()
{
  return &type metadata for SegmentFlags;
}

unint64_t sub_25DDD1DF8()
{
  unint64_t result = qword_26A6C7F28;
  if (!qword_26A6C7F28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F28);
  }
  return result;
}

uint64_t sub_25DDD1E4C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000011;
  unint64_t v3 = 0x800000025DDE5320;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000011;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x6F69746174636964;
      unint64_t v3 = 0xE90000000000006ELL;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v5 = 7496035;
      break;
    case 3:
      break;
    case 4:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x73646F50726961;
      break;
    case 5:
      unint64_t v5 = 0x6D6F44736D6D6F63;
      unint64_t v3 = 0xED0000746E616E69;
      break;
    case 6:
      unint64_t v5 = 0xD00000000000001ALL;
      unint64_t v3 = 0x800000025DDE5350;
      break;
    default:
      unint64_t v5 = 0x6F7473754377656ELL;
      unint64_t v3 = 0xEB0000000072656DLL;
      break;
  }
  unint64_t v6 = 0x800000025DDE5320;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE90000000000006ELL;
      if (v5 == 0x6F69746174636964) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      if (v5 != 7496035) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      goto LABEL_18;
    case 4:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x73646F50726961) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v2 = 0x6D6F44736D6D6F63;
      unint64_t v6 = 0xED0000746E616E69;
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0x800000025DDE5350;
      if (v5 != 0xD00000000000001ALL) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xEB0000000072656DLL;
      if (v5 != 0x6F7473754377656ELL) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_25DDE3480();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_25DDD20B4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000016;
  unint64_t v3 = 0x800000025DDE5390;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000016;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x64656C6261736964;
      break;
    case 2:
      unint64_t v5 = 0x6F69746174636964;
      unint64_t v3 = 0xED0000796C6E4F6ELL;
      break;
    case 3:
      break;
    case 4:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v6 = "active28DaysTo6MonthsAgo";
      goto LABEL_12;
    case 5:
      unint64_t v5 = 0xD000000000000013;
      unint64_t v6 = "active14To27DaysAgo";
      goto LABEL_12;
    case 6:
      unint64_t v5 = 0xD000000000000012;
      unint64_t v6 = "active7To13DaysAgo";
      goto LABEL_12;
    case 7:
      unint64_t v6 = "activeWithin7Days1Turn";
      goto LABEL_12;
    case 8:
      unint64_t v5 = 0xD00000000000001ALL;
      unint64_t v6 = "activeWithin7Days2To3Turns";
      goto LABEL_12;
    case 9:
      unint64_t v5 = 0xD00000000000001BLL;
      unint64_t v6 = "activeWithin7Days4PlusTurns";
      goto LABEL_12;
    case 10:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v6 = "activeWithin7Days2x3";
LABEL_12:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6E776F6E6B6E75;
      break;
  }
  unint64_t v7 = 0x800000025DDE5390;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE800000000000000;
      unint64_t v2 = 0x64656C6261736964;
      break;
    case 2:
      unint64_t v2 = 0x6F69746174636964;
      unint64_t v7 = 0xED0000796C6E4F6ELL;
      break;
    case 3:
      break;
    case 4:
      unint64_t v2 = 0xD000000000000018;
      int v8 = "active28DaysTo6MonthsAgo";
      goto LABEL_24;
    case 5:
      unint64_t v2 = 0xD000000000000013;
      int v8 = "active14To27DaysAgo";
      goto LABEL_24;
    case 6:
      unint64_t v2 = 0xD000000000000012;
      int v8 = "active7To13DaysAgo";
      goto LABEL_24;
    case 7:
      int v8 = "activeWithin7Days1Turn";
      goto LABEL_24;
    case 8:
      unint64_t v2 = 0xD00000000000001ALL;
      int v8 = "activeWithin7Days2To3Turns";
      goto LABEL_24;
    case 9:
      unint64_t v2 = 0xD00000000000001BLL;
      int v8 = "activeWithin7Days4PlusTurns";
      goto LABEL_24;
    case 10:
      unint64_t v2 = 0xD000000000000014;
      int v8 = "activeWithin7Days2x3";
LABEL_24:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v2 = 0x6E776F6E6B6E75;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_25DDE3480();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_25DDD2368()
{
  sub_25DDE3120();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25DDD24D0()
{
  sub_25DDE3120();
  return swift_bridgeObjectRelease();
}

unint64_t ActivitySegment.rawValue.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x64656C6261736964;
      break;
    case 2:
      unint64_t result = 0x6F69746174636964;
      break;
    case 3:
    case 7:
      return result;
    case 4:
      unint64_t result = 0xD000000000000018;
      break;
    case 5:
      unint64_t result = 0xD000000000000013;
      break;
    case 6:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0xA:
      unint64_t result = 0xD000000000000014;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

SiriUserSegments::ActivitySegment_optional __swiftcall ActivitySegment.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_25DDE33E0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 11;
  if (v3 < 0xB) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static ActivitySegment.allCases.getter()
{
  return &unk_270AC5070;
}

uint64_t sub_25DDD2798(unsigned __int8 *a1, char *a2)
{
  return sub_25DDD20B4(*a1, *a2);
}

unint64_t sub_25DDD27A8()
{
  unint64_t result = qword_26A6C7F30;
  if (!qword_26A6C7F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F30);
  }
  return result;
}

uint64_t sub_25DDD27FC()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDD2844()
{
  return sub_25DDD2368();
}

uint64_t sub_25DDD284C()
{
  return sub_25DDE3500();
}

SiriUserSegments::ActivitySegment_optional sub_25DDD2890(Swift::String *a1)
{
  return ActivitySegment.init(rawValue:)(*a1);
}

unint64_t sub_25DDD289C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ActivitySegment.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25DDD28C4()
{
  return sub_25DDE3160();
}

uint64_t sub_25DDD2924()
{
  return sub_25DDE3150();
}

unint64_t sub_25DDD2978()
{
  unint64_t result = qword_26A6C7F38;
  if (!qword_26A6C7F38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C7F40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F38);
  }
  return result;
}

void sub_25DDD29D4(void *a1@<X8>)
{
  *a1 = &unk_270AC5070;
}

uint64_t getEnumTagSinglePayload for ActivitySegment(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ActivitySegment(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *unint64_t result = a2 + 10;
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
        JUMPOUT(0x25DDD2B40);
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
          *unint64_t result = a2 + 10;
        break;
    }
  }
  return result;
}

uint64_t sub_25DDD2B68(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DDD2B74(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivitySegment()
{
  return &type metadata for ActivitySegment;
}

unint64_t sub_25DDD2B8C()
{
  unint64_t result = qword_26A6C7F48;
  if (!qword_26A6C7F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F48);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriEnablementState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriEnablementState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25DDD2D5CLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriEnablementState()
{
  return &type metadata for SiriEnablementState;
}

uint64_t sub_25DDD2D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_25DDD2DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  char v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_25DDD2EB4;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_25DDD2EB4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25DDD2FA8()
{
  sub_25DDE3330();
  sub_25DDE3130();
  type metadata accessor for ConversationTurn();
  sub_25DDE2DD0();
  sub_25DDD325C();
  sub_25DDE3470();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  if (*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  sub_25DDE3470();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  if (v0[1] >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  sub_25DDE3470();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  if (v0[2] >> 62)
  {
    swift_bridgeObjectRetain();
    sub_25DDE33C0();
    swift_bridgeObjectRelease();
  }
  sub_25DDE3470();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for ConversationTurn()
{
  uint64_t result = qword_26A6C7F60;
  if (!qword_26A6C7F60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_25DDD325C()
{
  unint64_t result = qword_26A6C7F58;
  if (!qword_26A6C7F58)
  {
    sub_25DDE2DD0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7F58);
  }
  return result;
}

uint64_t *sub_25DDD32B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    int v8 = (char *)a1 + v7;
    char v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25DDE2DD0();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_25DDD33B8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_25DDE2DD0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *sub_25DDD3440(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25DDE2DD0();
  char v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_25DDD34F8(void *a1, void *a2, uint64_t a3)
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
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25DDE2DD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_25DDD35BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_25DDE2DD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_25DDD3640(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25DDE2DD0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_25DDD36EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDD3700);
}

uint64_t sub_25DDD3700(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_25DDE2DD0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_25DDD37B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDD37C4);
}

void *sub_25DDD37C4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25DDE2DD0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25DDD386C()
{
  uint64_t result = sub_25DDE2DD0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25DDD390C()
{
  uint64_t v1 = sub_25DDE2D60();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = 0;
  v12[1] = 0xE000000000000000;
  sub_25DDE3330();
  sub_25DDE3130();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  uint64_t SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
  sub_25DDBF600(v0 + *(int *)(SeenResult + 20), (uint64_t)v7);
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) == 1)
  {
    sub_25DDBF5A0((uint64_t)v7);
  }
  else
  {
    sub_25DDDC728((uint64_t)v4);
    sub_25DDE2D00();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  return v12[0];
}

uint64_t type metadata accessor for SegmentFlagLastSeenResult()
{
  uint64_t result = qword_26A6C7F70;
  if (!qword_26A6C7F70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t *sub_25DDD3CD8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_25DDE2DC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
      memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_25DDD3E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_25DDE2DC0();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *sub_25DDD3F10(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_25DDE2DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_25DDD4024(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_25DDE2DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

unsigned char *sub_25DDD419C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_25DDE2DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_25DDD42B0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_25DDE2DC0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t sub_25DDD4428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDD443C);
}

uint64_t sub_25DDD443C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 248)
  {
    if (*a1 <= 7u) {
      int v4 = 7;
    }
    else {
      int v4 = *a1;
    }
    unsigned int v5 = v4 - 7;
    if (*a1 >= 7u) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    int v10 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = &a1[*(int *)(a3 + 20)];
    return v10(v12, a2, v11);
  }
}

uint64_t sub_25DDD44F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDD4508);
}

unsigned char *sub_25DDD4508(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v5 = result;
  if (a3 == 248)
  {
    *uint64_t result = a2 + 7;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    int v10 = &v5[*(int *)(a4 + 20)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_25DDD45B0()
{
  sub_25DDD4648();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_25DDD4648()
{
  if (!qword_26B380850)
  {
    sub_25DDE2DC0();
    unint64_t v0 = sub_25DDE32C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B380850);
    }
  }
}

ValueMetadata *type metadata accessor for AIMLInstrumentationStreamSource()
{
  return &type metadata for AIMLInstrumentationStreamSource;
}

uint64_t sub_25DDD46B0(uint64_t a1, uint64_t a2)
{
  v2[15] = a1;
  v2[16] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CB0);
  v2[17] = v3;
  v2[18] = *(void *)(v3 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CB8);
  v2[20] = v4;
  v2[21] = *(void *)(v4 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v5 = sub_25DDE2DC0();
  v2[23] = v5;
  v2[24] = *(void *)(v5 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDD4840, 0, 0);
}

uint64_t sub_25DDD4840()
{
  uint64_t v1 = v0;
  uint64_t v19 = v0 + 2;
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[26];
  uint64_t v5 = v0[23];
  uint64_t v4 = v0[24];
  sub_25DDE2F70();
  sub_25DDE2FE0();
  sub_25DDD5330(0, &qword_26A6C7F88);
  uint64_t v6 = (void *)sub_25DDE2FC0();
  sub_25DDD5330(0, &qword_26A6C7F90);
  uint64_t v7 = (void *)sub_25DDE2FC0();
  uint64_t v8 = (void *)MEMORY[0x2611C6DE0](v6, v7);

  sub_25DDD5330(0, &qword_26A6C7F98);
  uint64_t v9 = (void *)sub_25DDE2FC0();
  uint64_t v10 = MEMORY[0x2611C6DE0](v8, v9);
  v1[27] = v10;

  sub_25DDE2B40();
  sub_25DDE2CF0();
  uint64_t v12 = v11;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v13(v3, v5);
  uint64_t v14 = v12;
  sub_25DDE2B20();
  sub_25DDE2CF0();
  uint64_t v16 = v15;
  v13(v2, v5);
  uint64_t v17 = (void *)swift_task_alloc();
  v1[28] = v17;
  *uint64_t v17 = v1;
  v17[1] = sub_25DDD4A50;
  return MEMORY[0x270F085A0](v19, v10, v14, 0, v16, 0, 0, 1);
}

uint64_t sub_25DDD4A50()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();

  if (v0) {
    uint64_t v3 = sub_25DDD52A4;
  }
  else {
    uint64_t v3 = sub_25DDD4B84;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25DDD4B84()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  uint64_t v14 = v0 + 11;
  uint64_t v4 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v6 = v0[19];
  uint64_t v5 = v0[20];
  uint64_t v7 = v0[18];
  uint64_t v8 = v1[17];
  v1[13] = 0;
  __swift_project_boxed_opaque_existential_1(v2, v1[5]);
  sub_25DDE2F40();
  sub_25DDD536C(&qword_26A6C7CC0, &qword_26A6C7CB0);
  sub_25DDE2EC0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  uint64_t v9 = sub_25DDE2FF0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v1[10] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CE0);
  uint64_t v11 = sub_25DDD536C((unint64_t *)&unk_26A6C7CE8, &qword_26A6C7CE0);
  uint64_t v12 = (void *)swift_task_alloc();
  v1[30] = (uint64_t)v12;
  void *v12 = v1;
  v12[1] = sub_25DDD4D48;
  return MEMORY[0x270FA1E80](v14, v10, v11);
}

uint64_t sub_25DDD4D48()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25DDD5178;
  }
  else {
    uint64_t v2 = sub_25DDD4E5C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDD4E5C()
{
  *(void *)(v0 + 256) = *(void *)(v0 + 88);
  return MEMORY[0x270FA2498](sub_25DDD4E80, 0, 0);
}

void sub_25DDD4E80()
{
  uint64_t v1 = (void *)v0[32];
  if (v1)
  {
    uint64_t v2 = v0[31];
    uint64_t v3 = (void *)v0[16];
    uint64_t v4 = (void *)MEMORY[0x2611C73D0]();
    sub_25DDD53B0((uint64_t)v1, v3, v0 + 13);
    if (v2)
    {
    }
    else
    {

      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7CE0);
      uint64_t v11 = sub_25DDD536C((unint64_t *)&unk_26A6C7CE8, &qword_26A6C7CE0);
      uint64_t v12 = (void *)swift_task_alloc();
      v0[30] = v12;
      void *v12 = v0;
      v12[1] = sub_25DDD4D48;
      MEMORY[0x270FA1E80](v0 + 11, v10, v11);
    }
  }
  else
  {
    swift_release();
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_25DDE3040();
    __swift_project_value_buffer(v5, (uint64_t)qword_26B3808C0);
    uint64_t v6 = sub_25DDE3020();
    os_log_type_t v7 = sub_25DDE3250();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134217984;
      swift_beginAccess();
      v0[14] = v0[13];
      sub_25DDE32D0();
      _os_log_impl(&dword_25DDB4000, v6, v7, "AIMLInstrumentationStreamSource turn count: %ld", v8, 0xCu);
      MEMORY[0x2611C78C0](v8, -1, -1);
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (void (*)(void))v0[1];
    v9();
  }
}

uint64_t sub_25DDD5178()
{
  *(void *)(v0 + 96) = *(void *)(v0 + 248);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7A40);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_25DDD5204, 0, 0);
}

uint64_t sub_25DDD5204()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25DDD52A4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25DDD5330(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25DDD536C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_25DDD53B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for ConversationTurn();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (unint64_t *)((char *)&v29 - v10);
  sub_25DDD565C((void **)((char *)&v29 - v10));
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_25DDE3040();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B3808C0);
  sub_25DDD5FF4((uint64_t)v11, (uint64_t)v9);
  uint64_t v13 = sub_25DDE3020();
  os_log_type_t v14 = sub_25DDE3250();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v31 = v3;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v33 = v17;
    id v29 = a2;
    unint64_t v30 = a3;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v18 = sub_25DDD2FA8();
    uint64_t v32 = sub_25DDCA0E4(v18, v19, &v33);
    a2 = v29;
    a3 = v30;
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDD6058((uint64_t)v9);
    _os_log_impl(&dword_25DDB4000, v13, v14, "AIMLInstrumentationStreamSource turn: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v17, -1, -1);
    MEMORY[0x2611C78C0](v16, -1, -1);
  }
  else
  {
    sub_25DDD6058((uint64_t)v9);
  }

  uint64_t v20 = __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  uint64_t v21 = *v20;
  uint64_t v22 = *(void *)(*v20 + 32);
  uint64_t result = sub_25DDCCB84(v11);
  if (*(unsigned char *)(v22 + 16) == 1)
  {
    uint64_t v24 = *(void *)(v21 + 16);
    BOOL v25 = __CFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    *(void *)(v21 + 16) = v26;
  }
  if (*(unsigned char *)(v22 + 19) != 1)
  {
LABEL_12:
    uint64_t result = sub_25DDD6058((uint64_t)v11);
    if (!__OFADD__(*a3, 1))
    {
      ++*a3;
      return result;
    }
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v27 = *(void *)(v21 + 24);
  BOOL v25 = __CFADD__(v27, 1);
  uint64_t v28 = v27 + 1;
  if (!v25)
  {
    *(void *)(v21 + 24) = v28;
    goto LABEL_12;
  }
LABEL_16:
  __break(1u);
  return result;
}

void *sub_25DDD565C@<X0>(void *a1@<X8>)
{
  unint64_t v1 = sub_25DDE2FA0();
  unint64_t v2 = v1;
  unint64_t v90 = MEMORY[0x263F8EE78];
  if (v1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_25DDE33C0())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2611C7190](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      uint64_t result = (void *)sub_25DDE2EE0();
      if (!result) {
        goto LABEL_95;
      }
      uint64_t v9 = result;
      id v10 = objc_msgSend(result, sel_wrapAsAnyEvent);

      if (v10)
      {
        MEMORY[0x2611C6FA0]();
        if (*(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25DDE31A0();
        }
        sub_25DDE31B0();
        sub_25DDE3190();
      }
      ++v4;
      if (v7 == v3)
      {
        swift_bridgeObjectRelease();
        unint64_t v11 = v90;
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  unint64_t v11 = MEMORY[0x263F8EE78];
LABEL_18:
  swift_bridgeObjectRelease();
  uint64_t v91 = MEMORY[0x263F8EE78];
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_25DDE33C0();
    uint64_t v12 = (uint64_t)result;
    if (result) {
      goto LABEL_20;
    }
LABEL_92:
    swift_bridgeObjectRelease();
    uint64_t v83 = MEMORY[0x263F8EE78];
    uint64_t v85 = MEMORY[0x263F8EE78];
    uint64_t v84 = MEMORY[0x263F8EE78];
LABEL_93:
    swift_bridgeObjectRelease();
    type metadata accessor for ConversationTurn();
    uint64_t result = (void *)sub_25DDE3000();
    *a1 = v84;
    a1[1] = v85;
    a1[2] = v83;
    return result;
  }
  uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = (void *)swift_bridgeObjectRetain();
  if (!v12) {
    goto LABEL_92;
  }
LABEL_20:
  if (v12 >= 1)
  {
    uint64_t v13 = 0;
    unint64_t v14 = v11 & 0xC000000000000001;
    unint64_t v15 = 0x265518000uLL;
    uint64_t v16 = (unint64_t *)&unk_26A6C7F88;
    unint64_t v89 = v11;
    while (1)
    {
      id v17 = v14 ? (id)MEMORY[0x2611C7190](v13, v11) : *(id *)(v11 + 8 * v13 + 32);
      uint64_t v18 = v17;
      if ([v17 *(SEL *)(v15 + 2712)] != 6) {
        break;
      }
      id v19 = objc_msgSend(v18, sel_payload);
      if (v19)
      {
        uint64_t v20 = sub_25DDE2CC0();
        unint64_t v22 = v21;

        id v19 = (id)sub_25DDE2CB0();
        sub_25DDB7A48(v20, v22);
      }
      id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, v19);

      id v24 = objc_msgSend(v23, sel_event);
      if (v24) {
        goto LABEL_33;
      }

LABEL_23:
      if (v12 == ++v13)
      {
        swift_bridgeObjectRelease();
        uint64_t v87 = v91;
        uint64_t v92 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        uint64_t v41 = 0;
        while (1)
        {
          id v42 = v14 ? (id)MEMORY[0x2611C7190](v41, v11) : *(id *)(v11 + 8 * v41 + 32);
          id v43 = v42;
          if ([v42 *(SEL *)(v15 + 2712)] != 6) {
            break;
          }
          id v44 = objc_msgSend(v43, sel_payload);
          if (v44)
          {
            uint64_t v45 = sub_25DDE2CC0();
            unint64_t v47 = v46;

            id v44 = (id)sub_25DDE2CB0();
            sub_25DDB7A48(v45, v47);
          }
          id v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, v44);

          id v49 = objc_msgSend(v48, sel_event);
          if (v49) {
            goto LABEL_56;
          }

LABEL_46:
          if (v12 == ++v41)
          {
            swift_bridgeObjectRelease();
            uint64_t v86 = v92;
            uint64_t v93 = MEMORY[0x263F8EE78];
            swift_bridgeObjectRetain();
            uint64_t v62 = 0;
            while (1)
            {
              id v63 = v14 ? (id)MEMORY[0x2611C7190](v62, v11) : *(id *)(v11 + 8 * v62 + 32);
              uint64_t v64 = v63;
              if (objc_msgSend(v63, *(SEL *)(v15 + 2712), v86) != 6) {
                break;
              }
              id v65 = objc_msgSend(v64, sel_payload);
              if (v65)
              {
                uint64_t v66 = sub_25DDE2CC0();
                unint64_t v68 = v67;

                id v65 = (id)sub_25DDE2CB0();
                sub_25DDB7A48(v66, v68);
              }
              id v69 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F6ED88]), sel_initWithData_, v65);

              id v70 = objc_msgSend(v69, sel_event);
              if (v70) {
                goto LABEL_79;
              }

LABEL_69:
              if (v12 == ++v62)
              {
                swift_bridgeObjectRelease();
                uint64_t v83 = v93;
                uint64_t v85 = v86;
                uint64_t v84 = v87;
                goto LABEL_93;
              }
            }
            id v70 = v64;
LABEL_79:
            uint64_t v71 = sub_25DDD5330(0, &qword_26A6C7F98);
            [v70 *(SEL *)(v15 + 2712)];
            uint64_t v72 = sub_25DDE3280();
            if (!v72 || v71 != v72) {
              goto LABEL_68;
            }
            id v73 = objc_msgSend(v70, sel_payload);
            if (v73)
            {
              uint64_t v74 = v73;
              uint64_t v75 = sub_25DDE2CC0();
              unint64_t v77 = v76;

              id v78 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
              uint64_t v79 = (void *)sub_25DDE2CB0();
              unint64_t v80 = v77;
              unint64_t v15 = 0x265518000;
              sub_25DDB7A48(v75, v80);
            }
            else
            {
              id v78 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
              uint64_t v79 = 0;
            }
            id v81 = objc_msgSend(v78, sel_initWithData_, v79);

            if (v81)
            {
              self;
              uint64_t v82 = swift_dynamicCastObjCClass();

              if (v82)
              {
                MEMORY[0x2611C6FA0]();
                if (*(void *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_25DDE31A0();
                }
                sub_25DDE31B0();
                sub_25DDE3190();
              }
              else
              {
              }
            }
            else
            {
LABEL_68:
            }
            goto LABEL_69;
          }
        }
        id v49 = v43;
LABEL_56:
        uint64_t v50 = sub_25DDD5330(0, &qword_26A6C7F90);
        [v49 *(SEL *)(v15 + 2712)];
        uint64_t v51 = sub_25DDE3280();
        if (!v51 || v50 != v51) {
          goto LABEL_45;
        }
        id v52 = objc_msgSend(v49, sel_payload);
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = sub_25DDE2CC0();
          unint64_t v56 = v55;

          id v57 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          uint64_t v58 = (void *)sub_25DDE2CB0();
          unint64_t v59 = v56;
          unint64_t v15 = 0x265518000;
          sub_25DDB7A48(v54, v59);
        }
        else
        {
          id v57 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          uint64_t v58 = 0;
        }
        id v60 = objc_msgSend(v57, sel_initWithData_, v58);

        if (v60)
        {
          self;
          uint64_t v61 = swift_dynamicCastObjCClass();

          if (v61)
          {
            MEMORY[0x2611C6FA0]();
            if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_25DDE31A0();
            }
            sub_25DDE31B0();
            sub_25DDE3190();
          }
          else
          {
          }
        }
        else
        {
LABEL_45:
        }
        goto LABEL_46;
      }
    }
    id v24 = v18;
LABEL_33:
    uint64_t v25 = sub_25DDD5330(0, v16);
    [v24 *(SEL *)(v15 + 2712)];
    uint64_t v26 = sub_25DDE3280();
    if (!v26 || v25 != v26) {
      goto LABEL_22;
    }
    id v27 = objc_msgSend(v24, sel_payload);
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = v12;
      unint64_t v30 = v14;
      uint64_t v31 = v16;
      uint64_t v32 = sub_25DDE2CC0();
      unint64_t v34 = v33;

      id v35 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v36 = (void *)sub_25DDE2CB0();
      uint64_t v37 = v32;
      uint64_t v16 = v31;
      unint64_t v14 = v30;
      uint64_t v12 = v29;
      unint64_t v11 = v89;
      unint64_t v38 = v34;
      unint64_t v15 = 0x265518000;
      sub_25DDB7A48(v37, v38);
    }
    else
    {
      id v35 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v36 = 0;
    }
    id v39 = objc_msgSend(v35, sel_initWithData_, v36);

    if (v39)
    {
      self;
      uint64_t v40 = swift_dynamicCastObjCClass();

      if (v40)
      {
        MEMORY[0x2611C6FA0]();
        if (*(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_25DDE31A0();
        }
        sub_25DDE31B0();
        sub_25DDE3190();
      }
      else
      {
      }
    }
    else
    {
LABEL_22:
    }
    goto LABEL_23;
  }
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_25DDD5FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConversationTurn();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDD6058(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ConversationTurn();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DDD60B4()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriUsageMetricsTurnSink()
{
  return self;
}

uint64_t sub_25DDD6110(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_25DDCCEE4(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for SiriUsageMetrics() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *unint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_25DDE33D0();
  __break(1u);
  return result;
}

uint64_t sub_25DDD62C0(uint64_t a1, uint64_t a2)
{
  v2[9] = a1;
  v2[10] = a2;
  uint64_t v3 = sub_25DDE2B60();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDD6390, 0, 0);
}

uint64_t sub_25DDD6390()
{
  uint64_t v25 = v0;
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = sub_25DDE3040();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B3808C0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[15] = v6;
  v0[16] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v1, v3);
  uint64_t v7 = sub_25DDE3020();
  os_log_type_t v8 = sub_25DDE3250();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[14];
  uint64_t v12 = v0[11];
  uint64_t v11 = v0[12];
  if (v9)
  {
    os_log_type_t type = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = v23;
    *(_DWORD *)uint64_t v13 = 136315394;
    v0[7] = sub_25DDCA0E4(0xD000000000000026, 0x800000025DDE5F40, &v24);
    sub_25DDE32D0();
    *(_WORD *)(v13 + 12) = 2080;
    sub_25DDD741C(&qword_26A6C7D50, MEMORY[0x263F062D0]);
    uint64_t v14 = sub_25DDE3470();
    v0[8] = sub_25DDCA0E4(v14, v15, &v24);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    _os_log_impl(&dword_25DDB4000, v7, type, "SiriMetricsCalculator.%s calculationInterval: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v23, -1, -1);
    MEMORY[0x2611C78C0](v13, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[14], v0[11]);
  }

  uint64_t v16 = (void *)v0[10];
  uint64_t v17 = type metadata accessor for SiriUsageMetricsTurnSink();
  unint64_t v18 = (void *)swift_allocObject();
  v0[17] = v18;
  type metadata accessor for ValidTurnFeatureExtractor();
  v18[2] = 0;
  v18[3] = 0;
  swift_allocObject();
  v18[4] = sub_25DDCCAA0();
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  v0[5] = v17;
  v0[6] = &off_270AC5988;
  v0[2] = v18;
  swift_retain();
  id v19 = (void *)swift_task_alloc();
  v0[18] = v19;
  *id v19 = v0;
  v19[1] = sub_25DDD66E8;
  uint64_t v20 = v0[9];
  return sub_25DDD46B0(v20, (uint64_t)(v0 + 2));
}

uint64_t sub_25DDD66E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_25DDD69DC;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    uint64_t v3 = sub_25DDD6804;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25DDD6804()
{
  uint64_t v17 = v0[17];
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[15];
  uint64_t v3 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[9];
  uint64_t v15 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7EA8);
  uint64_t v6 = (int *)(type metadata accessor for SiriUsageMetrics() - 8);
  uint64_t v16 = *(void *)(*(void *)v6 + 72);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_25DDE4F10;
  unint64_t v8 = v18 + v7;
  v1(v2, v5, v4);
  uint64_t v9 = *(void *)(v17 + 16);
  uint64_t v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32);
  v10(v8, v2, v4);
  *(void *)(v8 + v6[8]) = v9;
  *(unsigned char *)(v8 + v6[7]) = 1;
  unint64_t v11 = v8 + v16;
  v1(v2, v15, v4);
  uint64_t v12 = *(void *)(v17 + 24);
  v10(v11, v2, v4);
  *(void *)(v11 + v6[8]) = v12;
  *(unsigned char *)(v11 + v6[7]) = 2;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v18);
}

uint64_t sub_25DDD69DC()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25DDD6A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  uint64_t v4 = sub_25DDE2B60();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = sub_25DDE2DC0();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDD6BB0, 0, 0);
}

uint64_t sub_25DDD6BB0()
{
  uint64_t v32 = v0;
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = sub_25DDE3040();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B3808C0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[17] = v6;
  v0[18] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v2, v1, v3);
  uint64_t v7 = sub_25DDE3020();
  os_log_type_t v8 = sub_25DDE3250();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[16];
  uint64_t v12 = v0[11];
  uint64_t v11 = v0[12];
  if (v9)
  {
    os_log_type_t type = v8;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v31 = v29;
    *(_DWORD *)uint64_t v13 = 136315394;
    v0[3] = sub_25DDCA0E4(0xD000000000000020, 0x800000025DDE5F10, &v31);
    sub_25DDE32D0();
    *(_WORD *)(v13 + 12) = 2080;
    sub_25DDD741C((unint64_t *)&qword_26A6C7D48, MEMORY[0x263F07490]);
    uint64_t v14 = sub_25DDE3470();
    v0[4] = sub_25DDCA0E4(v14, v15, &v31);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v10, v12);
    _os_log_impl(&dword_25DDB4000, v7, type, "SiriMetricsCalculator.%s calculationDate: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v29, -1, -1);
    MEMORY[0x2611C78C0](v13, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v10, v12);
  }

  v0[19] = v16;
  uint64_t v17 = v0[6];
  sub_25DDE2D70();
  v0[2] = MEMORY[0x263F8EE78];
  if (v17)
  {
    v0[20] = 0;
    uint64_t v18 = (void (*)(uint64_t, uint64_t, uint64_t))v0[17];
    uint64_t v19 = v0[14];
    uint64_t v20 = v0[13];
    uint64_t v21 = v0[11];
    sub_25DDE2D70();
    v18(v20, v19, v21);
    sub_25DDE2B30();
    unint64_t v30 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A6C7FA8 + dword_26A6C7FA8);
    uint64_t v22 = (void *)swift_task_alloc();
    v0[21] = v22;
    void *v22 = v0;
    v22[1] = sub_25DDD6FC4;
    uint64_t v23 = v0[10];
    uint64_t v24 = v0[7];
    return v30(v23, v24);
  }
  else
  {
    ((void (*)(void, void))v0[19])(v0[15], v0[11]);
    uint64_t v26 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v27 = (uint64_t (*)(uint64_t))v0[1];
    return v27(v26);
  }
}

uint64_t sub_25DDD6FC4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_25DDD7328;
  }
  else
  {
    *(void *)(v4 + 184) = a1;
    uint64_t v5 = sub_25DDD70F4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_25DDD70F4()
{
  uint64_t v18 = (void (*)(uint64_t, uint64_t))v0[19];
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[11];
  uint64_t v4 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v5 = v0[8];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[20] + 1;
  sub_25DDD6110(v0[23]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v18(v1, v2);
  if (v7 == v6)
  {
    ((void (*)(void, void))v0[19])(v0[15], v0[11]);
    uint64_t v8 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v9 = (uint64_t (*)(uint64_t))v0[1];
    return v9(v8);
  }
  else
  {
    ++v0[20];
    uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))v0[17];
    uint64_t v12 = v0[14];
    uint64_t v13 = v0[13];
    uint64_t v14 = v0[11];
    sub_25DDE2D70();
    v11(v13, v12, v14);
    sub_25DDE2B30();
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_26A6C7FA8 + dword_26A6C7FA8);
    unint64_t v15 = (void *)swift_task_alloc();
    v0[21] = v15;
    void *v15 = v0;
    v15[1] = sub_25DDD6FC4;
    uint64_t v16 = v0[10];
    uint64_t v17 = v0[7];
    return v19(v16, v17);
  }
}

uint64_t sub_25DDD7328()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[19];
  uint64_t v2 = v0[15];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[11];
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  v1(v3, v4);
  v1(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25DDD741C(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for ConcurrencyError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ConcurrencyError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ConcurrencyError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ConcurrencyError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConcurrencyError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConcurrencyError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for ConcurrencyError()
{
  return &type metadata for ConcurrencyError;
}

uint64_t sub_25DDD75BC@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  uint64_t v36 = a3;
  uint64_t v37 = a2;
  id v35 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EB0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D90);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_25DDE2DC0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v34 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v34 - v22;
  uint64_t v34 = a1;
  sub_25DDD7A4C(v36, (uint64_t)&v34 - v22);
  sub_25DDBD548((uint64_t)v23, (uint64_t)v37, (uint64_t)v21);
  sub_25DDBF600((uint64_t)v21, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, v11) == 1)
  {
    sub_25DDD8624((uint64_t)v21, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD8624((uint64_t)v23, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD8624((uint64_t)v18, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v24 = v35;
LABEL_3:
    uint64_t SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
    uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(&v24[*(int *)(SeenResult + 20)], 1, 1, v11);
    *uint64_t v24 = 7;
    return result;
  }
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v37(v14, v18, v11);
  uint64_t v27 = sub_25DDE2DE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v10, 1, 1, v27);
  uint64_t v28 = sub_25DDE2EB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v7, 1, 1, v28);
  uint64_t v29 = v38;
  unint64_t v30 = sub_25DDDB1A8(v34, (uint64_t)v10, (uint64_t)v7);
  if (!v29)
  {
    uint64_t v31 = (uint64_t)v30;
    uint64_t v38 = 0;
    sub_25DDD8624((uint64_t)v7, (uint64_t *)&unk_26A6C7EB0);
    sub_25DDD8624((uint64_t)v10, &qword_26A6C7D90);
    sub_25DDD8624((uint64_t)v21, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDD8624((uint64_t)v23, (uint64_t *)&unk_26A6C7EC0);
    BOOL v32 = v31 <= 27;
    uint64_t v24 = v35;
    if (v32)
    {
      uint64_t v33 = &v24[*(int *)(type metadata accessor for SegmentFlagLastSeenResult() + 20)];
      v37(v33, v14, v11);
      uint64_t result = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v33, 0, 1, v11);
      *uint64_t v24 = 1;
      return result;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_3;
  }
  sub_25DDD8624((uint64_t)v7, (uint64_t *)&unk_26A6C7EB0);
  sub_25DDD8624((uint64_t)v10, &qword_26A6C7D90);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_25DDD8624((uint64_t)v21, (uint64_t *)&unk_26A6C7EC0);
  return sub_25DDD8624((uint64_t)v23, (uint64_t *)&unk_26A6C7EC0);
}

uint64_t sub_25DDD7A4C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v3 = type metadata accessor for SiriUsageMetrics();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v127 = (uint64_t)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v104 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v104 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v107 = (uint64_t)&v104 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v129 = (uint64_t)&v104 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v130 = (void (**)(char *, uint64_t))((char *)&v104 - v18);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v104 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D20);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v116 = (uint64_t)&v104 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v115 = (uint64_t)&v104 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v118 = (uint64_t *)((char *)&v104 - v27);
  MEMORY[0x270FA5388](v26);
  uint64_t v111 = (uint64_t)&v104 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v30 = MEMORY[0x270FA5388](v29 - 8);
  char v114 = (char *)&v104 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v109 = (char *)&v104 - v32;
  uint64_t v33 = sub_25DDE2DC0();
  uint64_t v34 = MEMORY[0x270FA5388](v33);
  uint64_t v126 = (char *)&v104 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  v113 = (char *)&v104 - v37;
  uint64_t v38 = MEMORY[0x270FA5388](v36);
  v121 = (char *)&v104 - v39;
  uint64_t v40 = MEMORY[0x270FA5388](v38);
  v128 = (char *)&v104 - v41;
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  uint64_t v117 = (char *)&v104 - v43;
  MEMORY[0x270FA5388](v42);
  uint64_t v106 = v44;
  uint64_t v131 = *(void (**)(void))(v44 + 16);
  uint64_t v132 = (char *)&v104 - v45;
  uint64_t v123 = v44 + 16;
  v131();
  unint64_t v46 = *(void *)(a1 + 16);
  uint64_t v122 = a1;
  swift_bridgeObjectRetain();
  uint64_t v47 = v3;
  uint64_t v133 = v3;
  unint64_t v134 = v46;
  if (v46)
  {
    uint64_t v48 = 0;
    uint64_t v49 = v122 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v120 = *(void *)(v4 + 72);
    v124 = v20;
    uint64_t v125 = (char *)(v106 + 8);
    while (1)
    {
      sub_25DDBF414(v49, (uint64_t)v20);
      int v51 = v20[*(int *)(v47 + 20)];
      sub_25DDBF414((uint64_t)v20, (uint64_t)v130);
      if (v51 != 2) {
        break;
      }
      uint64_t v52 = *(uint64_t *)((char *)v130 + *(int *)(v47 + 24));
      sub_25DDBF478((uint64_t)v130);
      sub_25DDBF414((uint64_t)v20, v129);
      uint64_t v50 = v128;
      ((void (*)(char *, char *, uint64_t))v131)(v128, v132, v33);
      if (!v52) {
        goto LABEL_4;
      }
      uint64_t v53 = v129;
      uint64_t v54 = v121;
      sub_25DDE2B20();
      sub_25DDC47B0();
      LODWORD(v119) = sub_25DDE30C0();
      unint64_t v55 = *(void (**)(char *, uint64_t))v125;
      (*(void (**)(char *, uint64_t))v125)(v54, v33);
      sub_25DDBF478(v53);
      v55(v128, v33);
      uint64_t v47 = v133;
      if ((v119 & 1) == 0)
      {
        uint64_t v56 = v111;
        sub_25DDBF4D4((uint64_t)v124, v111);
        uint64_t v57 = v47;
        uint64_t v112 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
        v112(v56, 0, 1, v47);
        unint64_t v58 = v48 + 1;
        goto LABEL_11;
      }
LABEL_5:
      ++v48;
      uint64_t v20 = v124;
      sub_25DDBF478((uint64_t)v124);
      v49 += v120;
      if (v134 == v48) {
        goto LABEL_10;
      }
    }
    sub_25DDBF478((uint64_t)v130);
    sub_25DDBF414((uint64_t)v20, v129);
    uint64_t v50 = v128;
    ((void (*)(char *, char *, uint64_t))v131)(v128, v132, v33);
LABEL_4:
    sub_25DDBF478(v129);
    (*(void (**)(char *, uint64_t))v125)(v50, v33);
    goto LABEL_5;
  }
LABEL_10:
  uint64_t v56 = v111;
  uint64_t v57 = v47;
  uint64_t v112 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v112(v111, 1, 1, v47);
  unint64_t v58 = v134;
LABEL_11:
  unint64_t v59 = (void (*)(void, void, void, void))v118;
  sub_25DDBF538(v56, (uint64_t)v118);
  id v60 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  uint64_t v111 = v4 + 48;
  uint64_t v110 = v60;
  int v61 = v60((uint64_t)v59, 1, v57);
  uint64_t v62 = v106;
  uint64_t v63 = (uint64_t)v109;
  if (v61 == 1)
  {
    uint64_t v64 = *(void **)(v106 + 56);
    id v65 = v109;
    uint64_t v66 = 1;
  }
  else
  {
    uint64_t v67 = (uint64_t)v59;
    uint64_t v68 = v107;
    sub_25DDBF4D4(v67, v107);
    sub_25DDE2B20();
    sub_25DDBF478(v68);
    uint64_t v64 = *(void **)(v62 + 56);
    id v65 = (char *)v63;
    uint64_t v66 = 0;
  }
  uint64_t v118 = v64;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v64)(v65, v66, 1, v33);
  uint64_t v69 = v122;
  uint64_t v70 = v62 + 48;
  v128 = *(char **)(v62 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v128)(v63, 1, v33) == 1)
  {
    sub_25DDD8624(v63, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v71 = 1;
    uint64_t v72 = v105;
LABEL_39:
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v118)(v72, v71, 1, v33);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v132, v33);
  }
  uint64_t v74 = *(void (**)(uint64_t, char *, uint64_t))(v62 + 32);
  uint64_t v73 = v62 + 32;
  v119 = v74;
  uint64_t v120 = v73;
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v74)(v117, v63, v33);
  uint64_t v130 = (void (**)(char *, uint64_t))(v73 - 24);
  uint64_t v108 = v4 + 56;
  uint64_t v109 = (char *)(v73 + 24);
  v124 = (char *)v70;
  uint64_t v125 = v9;
  unint64_t v76 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v128;
  while (v58 == v134)
  {
LABEL_20:
    uint64_t v77 = v115;
    uint64_t v78 = v133;
    v112(v115, 1, 1, v133);
    unint64_t v58 = v134;
LABEL_21:
    uint64_t v79 = v77;
    uint64_t v80 = v116;
    sub_25DDBF538(v79, v116);
    int v81 = v110(v80, 1, v78);
    uint64_t v82 = (uint64_t)v114;
    if (v81 == 1)
    {
      uint64_t v83 = v114;
      uint64_t v84 = 1;
    }
    else
    {
      uint64_t v98 = v80;
      uint64_t v99 = v107;
      sub_25DDBF4D4(v98, v107);
      sub_25DDE2B20();
      sub_25DDBF478(v99);
      uint64_t v83 = (char *)v82;
      uint64_t v84 = 0;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v118)(v83, v84, 1, v33);
    uint64_t v100 = v113;
    uint64_t v101 = v117;
    if (v76(v82, 1, v33) == 1)
    {
      sub_25DDD8624(v82, (uint64_t *)&unk_26A6C7EC0);
      uint64_t v72 = v105;
      v119(v105, v101, v33);
      uint64_t v71 = 0;
      uint64_t v62 = v106;
      goto LABEL_39;
    }
    v119((uint64_t)v100, (char *)v82, v33);
    sub_25DDC47B0();
    char v102 = sub_25DDE30C0();
    v103 = *v130;
    if (v102)
    {
      v103(v101, v33);
      uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v119)(v101, v100, v33);
    }
    else
    {
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v103)(v100, v33);
    }
    uint64_t v69 = v122;
  }
  uint64_t v85 = v134;
  if (v58 > v134) {
    uint64_t v85 = v58;
  }
  uint64_t v129 = v85;
  while (v129 != v58)
  {
    uint64_t v88 = v4;
    sub_25DDBF414(v69+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v58, (uint64_t)v12);
    uint64_t v89 = v133;
    int v90 = v12[*(int *)(v133 + 20)];
    sub_25DDBF414((uint64_t)v12, (uint64_t)v9);
    if (v90 != 2)
    {
      sub_25DDBF478((uint64_t)v9);
      uint64_t v86 = v127;
      sub_25DDBF414((uint64_t)v12, v127);
      uint64_t v87 = v126;
      ((void (*)(char *, char *, uint64_t))v131)(v126, v132, v33);
LABEL_27:
      sub_25DDBF478(v86);
      (*v130)(v87, v33);
      uint64_t v4 = v88;
      goto LABEL_28;
    }
    uint64_t v91 = *(void *)&v9[*(int *)(v89 + 24)];
    sub_25DDBF478((uint64_t)v9);
    uint64_t v86 = v127;
    sub_25DDBF414((uint64_t)v12, v127);
    uint64_t v87 = v126;
    ((void (*)(char *, char *, uint64_t))v131)(v126, v132, v33);
    if (!v91) {
      goto LABEL_27;
    }
    uint64_t v92 = (uint64_t)v12;
    uint64_t v93 = v33;
    uint64_t v94 = v121;
    sub_25DDE2B20();
    sub_25DDC47B0();
    char v95 = sub_25DDE30C0();
    int v96 = *v130;
    uint64_t v97 = v94;
    uint64_t v33 = v93;
    uint64_t v12 = (char *)v92;
    (*v130)(v97, v33);
    sub_25DDBF478(v86);
    v96(v87, v33);
    uint64_t v69 = v122;
    uint64_t v4 = v88;
    if ((v95 & 1) == 0)
    {
      uint64_t v77 = v115;
      sub_25DDBF4D4(v92, v115);
      uint64_t v78 = v133;
      v112(v77, 0, 1, v133);
      ++v58;
      uint64_t v9 = v125;
      unint64_t v76 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v128;
      goto LABEL_21;
    }
LABEL_28:
    ++v58;
    uint64_t result = sub_25DDBF478((uint64_t)v12);
    uint64_t v9 = v125;
    unint64_t v76 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v128;
    if (v134 == v58) {
      goto LABEL_20;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_25DDD8624(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDD8680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_25DDE2DC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v43 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v40 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v50 = (uint64_t)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v40 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)v40 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v52 = (uint64_t)v40 - v22;
  uint64_t result = sub_25DDDAD88(a1, a3, (uint64_t *)&unk_26A6C7EC0);
  uint64_t v24 = *(void *)(a2 + 16);
  if (v24)
  {
    uint64_t v49 = v11;
    uint64_t v25 = a2 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    uint64_t v26 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    uint64_t v51 = *(void *)(v13 + 72);
    uint64_t v27 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    uint64_t v41 = (void (**)(char *, uint64_t))(v7 + 8);
    uint64_t v42 = (void (**)(char *, char *, uint64_t))(v7 + 16);
    uint64_t v44 = (void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    v40[1] = a2;
    swift_bridgeObjectRetain();
    uint64_t v28 = v52;
    uint64_t v47 = v21;
    uint64_t v48 = a3;
    uint64_t v45 = v18;
    unint64_t v46 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    do
    {
      sub_25DDDAD88(v25, v28, (uint64_t *)&unk_26A6C7EC0);
      sub_25DDDAD88(v28, (uint64_t)v18, (uint64_t *)&unk_26A6C7EC0);
      uint64_t v29 = *v26;
      if ((*v26)(v18, 1, v6) == 1)
      {
        sub_25DDDAEAC((uint64_t)v18, (uint64_t *)&unk_26A6C7EC0);
        sub_25DDDAD88(a3, (uint64_t)v21, (uint64_t *)&unk_26A6C7EC0);
      }
      else
      {
        uint64_t v30 = *v27;
        uint64_t v31 = v18;
        uint64_t v32 = v49;
        (*v27)(v49, v31, v6);
        uint64_t v33 = a3;
        uint64_t v34 = v50;
        sub_25DDDAD88(v33, v50, (uint64_t *)&unk_26A6C7EC0);
        if (v29((char *)v34, 1, v6) == 1)
        {
          sub_25DDDAEAC(v34, (uint64_t *)&unk_26A6C7EC0);
          uint64_t v35 = v47;
          v30(v47, v32, v6);
          uint64_t v21 = v35;
          (*v44)(v35, 0, 1, v6);
        }
        else
        {
          uint64_t v36 = v34;
          uint64_t v37 = v43;
          v30(v43, (char *)v36, v6);
          sub_25DDC47B0();
          if (sub_25DDE30D0()) {
            uint64_t v38 = v32;
          }
          else {
            uint64_t v38 = v37;
          }
          uint64_t v21 = v47;
          (*v42)(v47, v38, v6);
          uint64_t v39 = *v41;
          (*v41)(v37, v6);
          v39(v32, v6);
          (*v44)(v21, 0, 1, v6);
        }
        a3 = v48;
        uint64_t v18 = v45;
        uint64_t v26 = v46;
      }
      uint64_t v28 = v52;
      sub_25DDDAEAC(v52, (uint64_t *)&unk_26A6C7EC0);
      sub_25DDDAEAC(a3, (uint64_t *)&unk_26A6C7EC0);
      sub_25DDDAF08((uint64_t)v21, a3);
      v25 += v51;
      --v24;
    }
    while (v24);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25DDD8AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  type metadata accessor for SegmentFlagLastSeenResult();
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_25DDE2D60();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  v3[18] = swift_task_alloc();
  uint64_t v5 = sub_25DDE3040();
  v3[19] = v5;
  v3[20] = *(void *)(v5 - 8);
  v3[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDD8C6C, 0, 0);
}

uint64_t sub_25DDD8C6C()
{
  uint64_t v42 = v0;
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v7 = v0[9];
  uint64_t v6 = v0[10];
  uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26B3808C0);
  v0[22] = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  sub_25DDDAD88(v7, v4, &qword_26A6C7C70);
  sub_25DDDAD88(v6, v5, (uint64_t *)&unk_26A6C7EC0);
  uint64_t v9 = sub_25DDE3020();
  os_log_type_t v10 = sub_25DDE3250();
  if (os_log_type_enabled(v9, v10))
  {
    log = v9;
    uint64_t v11 = v0[18];
    uint64_t v37 = v0[16];
    uint64_t v36 = v0[15];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    uint64_t v41 = v39;
    *(_DWORD *)uint64_t v12 = 136315394;
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    uint64_t v13 = sub_25DDE2DC0();
    sub_25DDE33A0();
    sub_25DDE3130();
    sub_25DDE33A0();
    v0[6] = sub_25DDCA0E4(v0[2], v0[3], &v41);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDDAEAC(v11, &qword_26A6C7C70);
    *(_WORD *)(v12 + 12) = 2080;
    sub_25DDDAD88(v37, v36, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v14 = *(void *)(v13 - 8);
    int v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v36, 1, v13);
    uint64_t v16 = v0[15];
    if (v15 == 1)
    {
      sub_25DDDAEAC(v0[15], (uint64_t *)&unk_26A6C7EC0);
      unint64_t v17 = 0xE300000000000000;
      uint64_t v18 = 7104878;
    }
    else
    {
      os_log_type_t v38 = v10;
      uint64_t v23 = v0[13];
      uint64_t v24 = v0[14];
      uint64_t v25 = v0[12];
      sub_25DDDC728(v24);
      uint64_t v18 = sub_25DDE2D00();
      unint64_t v17 = v26;
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
      os_log_type_t v10 = v38;
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
    }
    uint64_t v28 = v0[20];
    uint64_t v27 = v0[21];
    uint64_t v29 = v0[19];
    uint64_t v30 = v0[16];
    v0[7] = sub_25DDCA0E4(v18, v17, &v41);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDDAEAC(v30, (uint64_t *)&unk_26A6C7EC0);
    _os_log_impl(&dword_25DDB4000, log, v10, "Starting CarPlaySegment.calculate(in dateRange: %s, lastSeen: %s)", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v39, -1, -1);
    MEMORY[0x2611C78C0](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  }
  else
  {
    uint64_t v19 = v0[20];
    uint64_t v20 = v0[21];
    uint64_t v21 = v0[19];
    uint64_t v22 = v0[16];
    sub_25DDDAEAC(v0[18], &qword_26A6C7C70);
    sub_25DDDAEAC(v22, (uint64_t *)&unk_26A6C7EC0);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
  }
  uint64_t v31 = (void *)swift_task_alloc();
  v0[23] = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_25DDD90E8;
  uint64_t v32 = v0[9];
  uint64_t v33 = v0[10];
  uint64_t v34 = v0[8];
  return sub_25DDD93F0(v34, v32, v33);
}

uint64_t sub_25DDD90E8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDD91E4, 0, 0);
}

uint64_t sub_25DDD91E4()
{
  uint64_t v11 = v0;
  sub_25DDDADEC(v0[8], v0[11]);
  uint64_t v1 = sub_25DDE3020();
  os_log_type_t v2 = sub_25DDE3250();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[11];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)uint64_t v4 = 136315394;
    v0[4] = sub_25DDCA0E4(0xD000000000000017, 0x800000025DDE5F70, &v10);
    sub_25DDE32D0();
    *(_WORD *)(v4 + 12) = 2080;
    uint64_t v6 = sub_25DDD390C();
    v0[5] = sub_25DDCA0E4(v6, v7, &v10);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    sub_25DDDAE50(v3);
    _os_log_impl(&dword_25DDB4000, v1, v2, "Ended CarPlaySegment.%s -> %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v5, -1, -1);
    MEMORY[0x2611C78C0](v4, -1, -1);
  }
  else
  {
    sub_25DDDAE50(v0[11]);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_25DDD93F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EB0);
  v3[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D90);
  v3[6] = swift_task_alloc();
  uint64_t v4 = sub_25DDE2DC0();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7C70);
  v3[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDD95D0, 0, 0);
}

uint64_t sub_25DDD95D0()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[15];
  sub_25DDCED70(v0[4], v1);
  id v3 = objc_msgSend((id)BiomeLibrary(), sel_CarPlay);
  swift_unknownObjectRelease();
  id v4 = objc_msgSend(v3, sel_Connected);
  swift_unknownObjectRelease();
  sub_25DDCFACC(v4, v1, (uint64_t)sub_25DDDAD20, 0, v2);

  uint64_t v5 = (void *)swift_task_alloc();
  v0[18] = (uint64_t)v5;
  *uint64_t v5 = v0;
  v5[1] = sub_25DDD9704;
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[14];
  return sub_25DDD9CAC(v7, v6);
}

uint64_t sub_25DDD9704()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDD9800, 0, 0);
}

uint64_t sub_25DDD9800()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[11];
  uint64_t v40 = v0[15];
  uint64_t v5 = v0[8];
  uint64_t v41 = v0[7];
  uint64_t v6 = v0[4];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7FC8);
  uint64_t v7 = *(void *)(v4 + 72);
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25DDE4F10;
  sub_25DDDAD88(v6, v9 + v8, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDDAD88(v1, v9 + v8 + v7, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDD8680(v40, v9, v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_25DDDAD88(v3, v2, (uint64_t *)&unk_26A6C7EC0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v2, 1, v41) == 1)
  {
    uint64_t v10 = v0[17];
    uint64_t v12 = v0[14];
    uint64_t v11 = v0[15];
    uint64_t v13 = v0[12];
    sub_25DDDAEAC(v0[13], (uint64_t *)&unk_26A6C7EC0);
    sub_25DDDAEAC(v12, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDDAEAC(v11, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDDAEAC(v10, &qword_26A6C7C70);
    sub_25DDDAEAC(v13, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v27 = v0[4];
    uint64_t v28 = v0[2];
    uint64_t SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
    sub_25DDDAD88(v27, v28 + *(int *)(SeenResult + 20), (uint64_t *)&unk_26A6C7EC0);
LABEL_4:
    char v30 = 7;
    goto LABEL_5;
  }
  uint64_t v14 = v0[16];
  uint64_t v15 = v0[6];
  uint64_t v16 = v0[5];
  uint64_t v17 = v0[3];
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[8] + 32);
  v18(v0[9], v0[12], v0[7]);
  uint64_t v19 = v17 + *(int *)(v14 + 36);
  uint64_t v20 = sub_25DDE2DE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 1, 1, v20);
  uint64_t v21 = sub_25DDE2EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 1, 1, v21);
  uint64_t v22 = sub_25DDDB1A8(v19, v15, v16);
  uint64_t v23 = v0[17];
  uint64_t v25 = v0[14];
  uint64_t v24 = v0[15];
  uint64_t v26 = v0[13];
  uint64_t v33 = v0[6];
  sub_25DDDAEAC(v0[5], (uint64_t *)&unk_26A6C7EB0);
  sub_25DDDAEAC(v33, &qword_26A6C7D90);
  sub_25DDDAEAC(v26, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDDAEAC(v25, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDDAEAC(v24, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDDAEAC(v23, &qword_26A6C7C70);
  uint64_t v35 = v0[8];
  uint64_t v34 = v0[9];
  uint64_t v36 = v0[7];
  uint64_t v37 = v0[2];
  if ((uint64_t)v22 > 29)
  {
    (*(void (**)(void, void))(v35 + 8))(v0[9], v0[7]);
    uint64_t v39 = type metadata accessor for SegmentFlagLastSeenResult();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v37 + *(int *)(v39 + 20), 1, 1, v36);
    goto LABEL_4;
  }
  uint64_t v38 = v37 + *(int *)(type metadata accessor for SegmentFlagLastSeenResult() + 20);
  v18(v38, v34, v36);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v38, 0, 1, v36);
  char v30 = 2;
LABEL_5:
  *(unsigned char *)v0[2] = v30;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = (uint64_t (*)(void))v0[1];
  return v31();
}

uint64_t sub_25DDD9CAC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25DDD9D50;
  return sub_25DDDA0CC(a1, a2);
}

uint64_t sub_25DDD9D50()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25DDD9E84, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25DDD9E84()
{
  if (qword_26B380880 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = sub_25DDE3040();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B3808C0);
  MEMORY[0x2611C7720](v1);
  MEMORY[0x2611C7720](v1);
  uint64_t v3 = sub_25DDE3020();
  os_log_type_t v4 = sub_25DDE3260();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = (void *)v0[5];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x2611C7720](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v9;
    sub_25DDE32D0();
    *unint64_t v8 = v9;

    _os_log_impl(&dword_25DDB4000, v3, v4, "Failed to check SELF events for Siri in car use: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D88);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v8, -1, -1);
    MEMORY[0x2611C78C0](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = v0[3];
  uint64_t v11 = sub_25DDE2DC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_25DDDA0CC(uint64_t a1, uint64_t a2)
{
  v2[13] = a1;
  v2[14] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7FD8);
  v2[15] = v3;
  v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7FE0);
  v2[21] = v4;
  v2[22] = *(void *)(v4 - 8);
  v2[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25DDDA234, 0, 0);
}

uint64_t sub_25DDDA234()
{
  sub_25DDE2FE0();
  uint64_t v1 = sub_25DDDAF70(0, &qword_26A6C7FE8);
  sub_25DDDAD28();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_25DDE46C0;
  uint64_t v3 = sub_25DDDAF70(0, &qword_26A6C7FF0);
  v0[24] = v3;
  *(void *)(v2 + 32) = v3;
  uint64_t v4 = MEMORY[0x2611C6E00](v1, v2);
  v0[25] = v4;
  swift_bridgeObjectRelease();
  BOOL v5 = (void *)swift_task_alloc();
  v0[26] = v5;
  *BOOL v5 = v0;
  v5[1] = sub_25DDDA36C;
  uint64_t v6 = v0[23];
  uint64_t v7 = v0[14];
  return sub_25DDBB278(v6, v4, v7);
}

uint64_t sub_25DDDA36C()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25DDDAC88;
  }
  else {
    uint64_t v2 = sub_25DDDA480;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25DDDA480()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = sub_25DDE2DC0();
  v0[28] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v0[29] = v4;
  v0[30] = (v3 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v4(v1, 1, 1, v2);
  sub_25DDE3200();
  v0[31] = 0;
  v0[32] = 0;
  BOOL v5 = (void *)swift_task_alloc();
  v0[33] = v5;
  *BOOL v5 = v0;
  v5[1] = sub_25DDDA5AC;
  uint64_t v6 = v0[15];
  return MEMORY[0x270FA1F68](v0 + 11, 0, 0, v6);
}

uint64_t sub_25DDDA5AC()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25DDDA6A8, 0, 0);
}

uint64_t sub_25DDDA6A8()
{
  uint64_t v54 = v1;
  uint64_t v3 = *(void **)(v1 + 88);
  if (v3)
  {
    uint64_t v4 = *(void *)(v1 + 256);
    uint64_t v5 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_26;
    }
    unint64_t v6 = sub_25DDE2F90();
    unint64_t v2 = v6;
    uint64_t v0 = *(char **)(v1 + 248);
    uint64_t v49 = (void *)v1;
    uint64_t v50 = v5;
    uint64_t v52 = v1 + 88;
    uint64_t v47 = v3;
    if (v6 >> 62)
    {
LABEL_27:
      uint64_t v37 = sub_25DDE33C0();
      if (__OFADD__(v0, v37))
      {
        __break(1u);
        return MEMORY[0x270FA1F68](v37, v38, v39, v40);
      }
      uint64_t v45 = &v0[v37];
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25DDE33C0();
      if (v7) {
        goto LABEL_6;
      }
LABEL_29:

      swift_bridgeObjectRelease_n();
      uint64_t v15 = v49;
LABEL_30:
      v15[31] = v45;
      v15[32] = v50;
      uint64_t v41 = (void *)swift_task_alloc();
      v15[33] = v41;
      void *v41 = v15;
      v41[1] = sub_25DDDA5AC;
      uint64_t v40 = v15[15];
      uint64_t v37 = v52;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      return MEMORY[0x270FA1F68](v37, v38, v39, v40);
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!__OFADD__(v0, v7))
    {
      uint64_t v45 = &v0[v7];
      swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_6:
        uint64_t v8 = 0;
        while (1)
        {
          if ((v2 & 0xC000000000000001) != 0) {
            id v9 = (id)MEMORY[0x2611C7190](v8, v2);
          }
          else {
            id v9 = *(id *)(v2 + 8 * v8 + 32);
          }
          uint64_t v10 = v9;
          uint64_t v11 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
          sub_25DDDAF70(0, &qword_26A6C7FF8);
          uint64_t v12 = sub_25DDE2EF0();
          if (!v12) {
            goto LABEL_8;
          }
          uint64_t v13 = (void *)v12;
          self;
          uint64_t v14 = (void *)swift_dynamicCastObjCClass();
          if (!v14) {
            break;
          }
          uint64_t v0 = (char *)objc_msgSend(v14, sel_bluetoothAudioDeviceCategory);

          if (v0 == 2)
          {
            uint64_t v15 = v49;
            uint64_t v16 = (void (*)(uint64_t, void, uint64_t, uint64_t))v49[29];
            uint64_t v17 = v49[28];
            uint64_t v19 = v49[19];
            uint64_t v18 = v49[20];
            swift_bridgeObjectRelease_n();
            id v20 = v47;
            sub_25DDE2F80();

            v16(v19, 0, 1, v17);
            sub_25DDD14DC(v19, v18);
            goto LABEL_30;
          }
LABEL_9:
          ++v8;
          if (v11 == v7) {
            goto LABEL_29;
          }
        }

LABEL_8:
        goto LABEL_9;
      }
      goto LABEL_29;
    }
    __break(1u);
    goto LABEL_34;
  }
  (*(void (**)(void, void))(*(void *)(v1 + 128) + 8))(*(void *)(v1 + 136), *(void *)(v1 + 120));
  if (qword_26B380880 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v21 = sub_25DDE3040();
  __swift_project_value_buffer(v21, (uint64_t)qword_26B3808C0);
  uint64_t v22 = sub_25DDE3020();
  os_log_type_t v23 = sub_25DDE3250();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v42 = *(void *)(v1 + 256);
    uint64_t v51 = *(void *)(v1 + 184);
    uint64_t v44 = *(void **)(v1 + 200);
    uint64_t v46 = *(void *)(v1 + 176);
    uint64_t v24 = *(void *)(v1 + 160);
    uint64_t v48 = *(void *)(v1 + 168);
    uint64_t v25 = *(void *)(v1 + 152);
    uint64_t v43 = *(void *)(v1 + 248);
    uint64_t v26 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v53 = v27;
    *(_DWORD *)uint64_t v26 = 136315906;
    *(void *)(v1 + 64) = sub_25DDCA0E4(0xD00000000000001ELL, 0x800000025DDE5F90, &v53);
    sub_25DDE32D0();
    *(_WORD *)(v26 + 12) = 2048;
    *(void *)(v1 + 72) = v42;
    sub_25DDE32D0();
    *(_WORD *)(v26 + 22) = 2048;
    *(void *)(v1 + 80) = v43;
    sub_25DDE32D0();
    *(_WORD *)(v26 + 32) = 2080;
    swift_beginAccess();
    sub_25DDDAD88(v24, v25, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v28 = sub_25DDE3110();
    *(void *)(v1 + 96) = sub_25DDCA0E4(v28, v29, &v53);
    sub_25DDE32D0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DDB4000, v22, v23, "%s Scanned %ld turns; %ld MHAssistantDaemonAudioBluetoothInfo events; result %s",
      (uint8_t *)v26,
      0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2611C78C0](v27, -1, -1);
    MEMORY[0x2611C78C0](v26, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v51, v48);
  }
  else
  {
    uint64_t v31 = *(void *)(v1 + 176);
    uint64_t v30 = *(void *)(v1 + 184);
    uint64_t v32 = *(void *)(v1 + 168);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  }
  uint64_t v33 = *(void *)(v1 + 160);
  uint64_t v34 = *(void *)(v1 + 104);
  swift_beginAccess();
  sub_25DDDAD88(v33, v34, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDDAEAC(v33, (uint64_t *)&unk_26A6C7EC0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v1 + 8);
  return v35();
}

uint64_t sub_25DDDAC88()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25DDDAD20()
{
  return 1;
}

uint64_t sub_25DDDAD28()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C8000);
  if (swift_isClassType()) {
    uint64_t v1 = v0;
  }
  else {
    uint64_t v1 = 0;
  }
  if (v1) {
    unint64_t v2 = (uint64_t *)&unk_26A6C8010;
  }
  else {
    unint64_t v2 = (uint64_t *)&unk_26A6C8008;
  }
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t sub_25DDDAD88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDDADEC(uint64_t a1, uint64_t a2)
{
  uint64_t SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(SeenResult - 8) + 16))(a2, a1, SeenResult);
  return a2;
}

uint64_t sub_25DDDAE50(uint64_t a1)
{
  uint64_t SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(SeenResult - 8) + 8))(a1, SeenResult);
  return a1;
}

uint64_t sub_25DDDAEAC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDDAF08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDDAF70(uint64_t a1, unint64_t *a2)
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

uint64_t sub_25DDDAFB0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_25DDDB044()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return v0;
}

uint64_t sub_25DDDB0B4()
{
  (*(void (**)(uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Reference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void (*sub_25DDDB1A8(uint64_t a1, uint64_t a2, uint64_t a3))(char *, uint64_t)
{
  uint64_t v62 = a3;
  uint64_t v65 = a2;
  uint64_t v66 = a1;
  uint64_t v3 = sub_25DDE2BC0();
  uint64_t v67 = *(void *)(v3 - 8);
  uint64_t v68 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v69 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EB0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDE2EB0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int v61 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  id v60 = (char *)&v59 - v12;
  uint64_t v13 = sub_25DDE2DE0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v63 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D90);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C80A0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_25DDE2E90();
  uint64_t v22 = *(void *)(v72 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v72);
  uint64_t v70 = (char *)&v59 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v71 = (char *)&v59 - v25;
  sub_25DDDC208(v65, (uint64_t)v18, &qword_26A6C7D90);
  uint64_t v64 = v14;
  uint64_t v65 = v13;
  uint64_t v26 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13) != 1)
  {
    uint64_t v28 = v63;
    uint64_t v27 = v64;
    unint64_t v29 = v18;
    uint64_t v30 = v65;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v63, v29, v65);
    sub_25DDE2DF0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v30);
    uint64_t v26 = 0;
  }
  uint64_t v31 = v72;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v21, v26, 1, v72);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v21, 1, v31) == 1)
  {
    uint64_t v32 = v71;
    sub_25DDE2E60();
    sub_25DDDC26C((uint64_t)v21, &qword_26A6C80A0);
  }
  else
  {
    uint64_t v32 = v71;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v71, v21, v31);
  }
  uint64_t v33 = v70;
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v70, v32, v31);
  sub_25DDDC208(v62, (uint64_t)v7, (uint64_t *)&unk_26A6C7EB0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_25DDDC26C((uint64_t)v7, (uint64_t *)&unk_26A6C7EB0);
  }
  else
  {
    uint64_t v34 = v60;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v60, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v61, v34, v8);
    sub_25DDE2E70();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v34, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D30);
  uint64_t v35 = sub_25DDE2E80();
  uint64_t v36 = *(void *)(v35 - 8);
  unint64_t v37 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  uint64_t v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_25DDE46C0;
  (*(void (**)(unint64_t, void, uint64_t))(v36 + 104))(v38 + v37, *MEMORY[0x263F07870], v35);
  sub_25DDC04CC(v38);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  uint64_t v39 = v69;
  sub_25DDE2E20();
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_25DDE2B70();
  if (v41)
  {
    uint64_t v73 = 0;
    unint64_t v74 = 0xE000000000000000;
    sub_25DDE3330();
    sub_25DDE3130();
    sub_25DDE2DC0();
    sub_25DDDC2C8();
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    sub_25DDE3130();
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    sub_25DDE3130();
    uint64_t v45 = v63;
    sub_25DDE2E00();
    uint64_t v46 = v65;
    sub_25DDE33A0();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v45, v46);
    uint64_t v47 = v73;
    unint64_t v48 = v74;
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_25DDE3040();
    __swift_project_value_buffer(v49, (uint64_t)qword_26B3808C0);
    swift_bridgeObjectRetain_n();
    uint64_t v50 = sub_25DDE3020();
    os_log_type_t v51 = sub_25DDE3260();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v73 = v53;
      *(_DWORD *)uint64_t v52 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_25DDCA0E4(v47, v48, &v73);
      sub_25DDE32D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25DDB4000, v50, v51, "%s", v52, 0xCu);
      swift_arrayDestroy();
      uint64_t v54 = v53;
      uint64_t v39 = v69;
      MEMORY[0x2611C78C0](v54, -1, -1);
      MEMORY[0x2611C78C0](v52, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v55 = v71;
    sub_25DDDC174();
    swift_allocError();
    uint64_t *v56 = v47;
    v56[1] = v48;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v39, v68);
    uint64_t v42 = *(void (**)(char *, uint64_t))(v22 + 8);
    uint64_t v57 = v72;
    v42(v70, v72);
    v42(v55, v57);
  }
  else
  {
    uint64_t v42 = (void (*)(char *, uint64_t))v40;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v39, v68);
    uint64_t v43 = *(void (**)(char *, uint64_t))(v22 + 8);
    uint64_t v44 = v72;
    v43(v33, v72);
    v43(v71, v44);
  }
  return v42;
}

uint64_t sub_25DDDBB84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = sub_25DDE2D60();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v32 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDE2DE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25DDE2E90();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F07740], v8);
  sub_25DDE2DF0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_25DDE2E40();
  uint64_t v16 = sub_25DDE2DC0();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1, v16) == 1)
  {
    uint64_t v30 = v13;
    uint64_t v31 = v12;
    sub_25DDDC26C((uint64_t)v7, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v35 = 0;
    unint64_t v36 = 0xE000000000000000;
    sub_25DDE3330();
    sub_25DDE3130();
    sub_25DDE2E80();
    sub_25DDE33A0();
    sub_25DDE3130();
    uint64_t v37 = a1;
    sub_25DDE3470();
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    sub_25DDE3130();
    uint64_t v18 = v32;
    sub_25DDDC728(v32);
    sub_25DDE2D00();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v18, v34);
    sub_25DDE3130();
    swift_bridgeObjectRelease();
    sub_25DDE3130();
    uint64_t v19 = v35;
    unint64_t v20 = v36;
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_25DDE3040();
    __swift_project_value_buffer(v21, (uint64_t)qword_26B3808C0);
    swift_bridgeObjectRetain_n();
    uint64_t v22 = sub_25DDE3020();
    os_log_type_t v23 = sub_25DDE3260();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      uint64_t v35 = v25;
      *(_DWORD *)uint64_t v24 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_25DDCA0E4(v19, v20, &v35);
      sub_25DDE32D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25DDB4000, v22, v23, "%s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v25, -1, -1);
      MEMORY[0x2611C78C0](v24, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v28 = v30;
    uint64_t v27 = v31;
    sub_25DDDC174();
    swift_allocError();
    uint64_t *v29 = v19;
    v29[1] = v20;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v27);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v30, v7, v16);
  }
}

unint64_t sub_25DDDC174()
{
  unint64_t result = qword_26A6C8098;
  if (!qword_26A6C8098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C8098);
  }
  return result;
}

uint64_t sub_25DDDC1D8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25DDDC208(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25DDDC26C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_25DDDC2C8()
{
  unint64_t result = qword_26A6C7D48;
  if (!qword_26A6C7D48)
  {
    sub_25DDE2DC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C7D48);
  }
  return result;
}

void *_s17CalendarDateErrorVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17CalendarDateErrorVwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s17CalendarDateErrorVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s17CalendarDateErrorVwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17CalendarDateErrorVwet(uint64_t a1, int a2)
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

uint64_t _s17CalendarDateErrorVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *_s17CalendarDateErrorVMa()
{
  return &_s17CalendarDateErrorVN;
}

void sub_25DDDC468(void *a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    if (qword_26B380880 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_25DDE3040();
    __swift_project_value_buffer(v2, (uint64_t)qword_26B3808C0);
    id v9 = a1;
    uint64_t v3 = sub_25DDE3020();
    os_log_type_t v4 = sub_25DDE3260();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v10[0] = v7;
      *(_DWORD *)uint64_t v5 = 136315394;
      sub_25DDCA0E4(0xD000000000000027, 0x800000025DDE5DB0, v10);
      sub_25DDE32D0();
      *(_WORD *)(v5 + 12) = 2112;
      if (objc_msgSend(v9, sel_error))
      {
        uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
        sub_25DDE32D0();
      }
      else
      {
        sub_25DDE32D0();
        uint64_t v8 = 0;
      }
      void *v6 = v8;

      _os_log_impl(&dword_25DDB4000, v3, v4, "%s Failure during Biome sink: %@", (uint8_t *)v5, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D88);
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v6, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2611C78C0](v7, -1, -1);
      MEMORY[0x2611C78C0](v5, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_25DDDC728@<X0>(uint64_t a1@<X8>)
{
  uint64_t v26 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EB0);
  MEMORY[0x270FA5388](v1 - 8);
  unint64_t v29 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_25DDE2EB0();
  uint64_t v3 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_25DDE2D50();
  uint64_t v5 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25DDE2D30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25DDE2D10();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25DDE2D20();
  MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, void))(v18 + 104))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F072A0]);
  uint64_t v19 = v12;
  uint64_t v20 = v28;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F07288], v19);
  uint64_t v21 = v7;
  uint64_t v22 = v29;
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F072B8], v8);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v21, *MEMORY[0x263F072C8], v27);
  sub_25DDE2EA0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v22, 1, v20);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v25, v22, v20);
    return sub_25DDE2D40();
  }
  return result;
}

uint64_t sub_25DDDCB28@<X0>(unsigned char *a1@<X0>, void (*a2)(char *, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v62 = a8;
  uint64_t v64 = a7;
  uint64_t v65 = a6;
  uint64_t v66 = a5;
  uint64_t v67 = a4;
  uint64_t v69 = a2;
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  uint64_t v59 = *(void *)(EnablementStatus - 8);
  uint64_t v60 = EnablementStatus;
  MEMORY[0x270FA5388](EnablementStatus);
  uint64_t v61 = (uint64_t)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_25DDE2DC0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v56 = (uint64_t)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v57 = (char *)&v55 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v55 = (uint64_t)&v55 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v63 = (char *)&v55 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  unint64_t v29 = (char *)&v55 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = (char *)&v55 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)&v55 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v55 - v36;
  *(unsigned char *)a9 = *a1;
  uint64_t v70 = (int *)type metadata accessor for SegmentsSummary();
  uint64_t v58 = a3;
  sub_25DDE2CF0();
  sub_25DDE2CE0();
  uint64_t v68 = a9;
  *(void *)(a9 + 8) = v69;
  sub_25DDBF600(v67, (uint64_t)v35);
  uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v38(v35, 1, v14) == 1)
  {
    uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    uint64_t v40 = v37;
    uint64_t v41 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v35, v14);
    sub_25DDE2CF0();
    sub_25DDE2CE0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    uint64_t v40 = v37;
    uint64_t v41 = 0;
  }
  uint64_t v69 = v39;
  v39(v40, v41, 1, v14);
  sub_25DDDAF08((uint64_t)v37, v68 + v70[7]);
  sub_25DDBF600(v66, (uint64_t)v29);
  uint64_t v42 = 1;
  if (v38(v29, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v29, v14);
    sub_25DDE2CF0();
    sub_25DDE2CE0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v42 = 0;
  }
  uint64_t v43 = 1;
  v69(v32, v42, 1, v14);
  uint64_t v44 = v68;
  sub_25DDDAF08((uint64_t)v32, v68 + v70[8]);
  uint64_t v45 = v55;
  sub_25DDBF600(v65, v55);
  if (v38((char *)v45, 1, v14) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v17, v45, v14);
    sub_25DDE2CF0();
    sub_25DDE2CE0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v43 = 0;
  }
  uint64_t v46 = 1;
  uint64_t v47 = (uint64_t)v63;
  v69(v63, v43, 1, v14);
  sub_25DDDAF08(v47, v44 + v70[9]);
  uint64_t v48 = v56;
  sub_25DDBF600(v64, v56);
  unsigned int v49 = v38((char *)v48, 1, v14);
  uint64_t v50 = (uint64_t)v57;
  if (v49 != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v17, v48, v14);
    sub_25DDE2CF0();
    sub_25DDE2CE0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v46 = 0;
  }
  v69((char *)v50, v46, 1, v14);
  sub_25DDE2AB4(v64, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDE2AB4(v65, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDE2AB4(v66, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDE2AB4(v67, (uint64_t *)&unk_26A6C7EC0);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v58, v14);
  sub_25DDDAF08(v50, v44 + v70[10]);
  uint64_t v51 = v62;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48))(v62, 1, v60) == 1)
  {
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
    uint64_t v53 = v61;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v61, 1, 3, v52);
    sub_25DDE2AB4(v51, &qword_26A6C7D78);
  }
  else
  {
    uint64_t v53 = v61;
    sub_25DDBA458(v51, v61);
  }
  return sub_25DDBA458(v53, v44 + v70[11]);
}

void SegmentsSummary.activitySegment.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t SegmentsSummary.segmentFlags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SegmentsSummary.membershipCheckedAt.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for SegmentsSummary() + 24);
  uint64_t v4 = sub_25DDE2DC0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for SegmentsSummary()
{
  uint64_t result = qword_26B3808B0;
  if (!qword_26B3808B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SegmentsSummary.init(activitySegment:segmentFlags:at:)@<X0>(char *a1@<X0>, void (*a2)(char *, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7D78);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v28 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v28 - v19;
  uint64_t v21 = sub_25DDE2DC0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v28 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v31 = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, a3, v21);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v25(v20, 1, 1, v21);
  v25(v18, 1, 1, v21);
  v25(v15, 1, 1, v21);
  v25(v12, 1, 1, v21);
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 56))(v8, 1, 1, EnablementStatus);
  sub_25DDDCB28(&v31, v30, (uint64_t)v24, (uint64_t)v20, (uint64_t)v18, (uint64_t)v15, (uint64_t)v12, (uint64_t)v8, v29);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v28, v21);
}

uint64_t SegmentsSummary.description.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v32 = (uint64_t)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v31 = (char *)&v28 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v30 = (uint64_t)&v28 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v29 = (uint64_t)&v28 - v8;
  uint64_t v9 = sub_25DDE2D60();
  uint64_t v37 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = 0;
  unint64_t v39 = 0xE000000000000000;
  sub_25DDE3330();
  sub_25DDE3130();
  uint64_t v36 = v0;
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  uint64_t v12 = v36;
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_25DDDDD8C(v13);
  swift_bridgeObjectRelease();
  MEMORY[0x2611C6FB0](v14, MEMORY[0x263F8D310]);
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  uint64_t v15 = type metadata accessor for SegmentsSummary();
  sub_25DDDC728((uint64_t)v11);
  sub_25DDE2D00();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v37 + 8);
  v16(v11, v9);
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  uint64_t v37 = v15;
  uint64_t v17 = v29;
  sub_25DDBF600(v12 + *(int *)(v15 + 28), v29);
  uint64_t v18 = sub_25DDE2DC0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  unsigned int v20 = v28(v17, 1, v18);
  uint64_t v34 = v16;
  uint64_t v35 = v9;
  uint64_t v33 = v19;
  if (v20 == 1)
  {
    sub_25DDE2AB4(v17, (uint64_t *)&unk_26A6C7EC0);
  }
  else
  {
    sub_25DDDC728((uint64_t)v11);
    sub_25DDE2D00();
    v16(v11, v9);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  uint64_t v21 = v36;
  uint64_t v22 = v30;
  sub_25DDBF600(v36 + *(int *)(v37 + 32), v30);
  uint64_t v23 = v28;
  unsigned int v24 = v28(v22, 1, v18);
  uint64_t v25 = (uint64_t)v31;
  if (v24 == 1)
  {
    sub_25DDE2AB4(v22, (uint64_t *)&unk_26A6C7EC0);
  }
  else
  {
    sub_25DDDC728((uint64_t)v11);
    sub_25DDE2D00();
    v34(v11, v35);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v22, v18);
  }
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  sub_25DDBF600(v21 + *(int *)(v37 + 36), v25);
  if (v23(v25, 1, v18) == 1)
  {
    sub_25DDE2AB4(v25, (uint64_t *)&unk_26A6C7EC0);
  }
  else
  {
    sub_25DDDC728((uint64_t)v11);
    sub_25DDE2D00();
    v34(v11, v35);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v25, v18);
  }
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  uint64_t v26 = v32;
  sub_25DDBF600(v21 + *(int *)(v37 + 40), v32);
  if (v23(v26, 1, v18) == 1)
  {
    sub_25DDE2AB4(v26, (uint64_t *)&unk_26A6C7EC0);
  }
  else
  {
    sub_25DDDC728((uint64_t)v11);
    sub_25DDE2D00();
    v34(v11, v35);
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v26, v18);
  }
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  sub_25DDB8AF8();
  sub_25DDE3130();
  swift_bridgeObjectRelease();
  sub_25DDE3130();
  return v38;
}

uint64_t sub_25DDDDD8C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = a1;
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_25DDDF2E0(0, v1, 0);
    uint64_t v2 = v21;
    int64_t v4 = sub_25DDDF46C(v3);
    int v6 = v5;
    char v8 = v7 & 1;
    uint64_t v19 = v3;
    uint64_t v20 = v3 + 56;
    do
    {
      if (v4 < 0 || v4 >= 1 << *(unsigned char *)(v3 + 32))
      {
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x25DDDDFE0);
      }
      if (((*(void *)(v20 + (((unint64_t)v4 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
        goto LABEL_20;
      }
      if (*(_DWORD *)(v3 + 36) != v6) {
        goto LABEL_21;
      }
      uint64_t v9 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v4);
      unint64_t v10 = 0x800000025DDE5320;
      unint64_t v11 = 0xD000000000000011;
      switch(v9)
      {
        case 1:
          unint64_t v10 = 0xE90000000000006ELL;
          unint64_t v11 = 0x6F69746174636964;
          break;
        case 2:
          unint64_t v10 = 0xE300000000000000;
          unint64_t v11 = 7496035;
          break;
        case 3:
          break;
        case 4:
          unint64_t v10 = 0xE700000000000000;
          unint64_t v11 = 0x73646F50726961;
          break;
        case 5:
          unint64_t v10 = 0xED0000746E616E69;
          unint64_t v11 = 0x6D6F44736D6D6F63;
          break;
        case 6:
          unint64_t v11 = 0xD00000000000001ALL;
          unint64_t v10 = 0x800000025DDE5350;
          break;
        default:
          unint64_t v10 = 0xEB0000000072656DLL;
          unint64_t v11 = 0x6F7473754377656ELL;
          break;
      }
      unint64_t v13 = *(void *)(v21 + 16);
      unint64_t v12 = *(void *)(v21 + 24);
      if (v13 >= v12 >> 1) {
        sub_25DDDF2E0(v12 > 1, v13 + 1, 1);
      }
      *(void *)(v21 + 16) = v13 + 1;
      uint64_t v14 = v21 + 16 * v13;
      *(void *)(v14 + 32) = v11;
      *(void *)(v14 + 40) = v10;
      uint64_t v3 = v19;
      int64_t v15 = sub_25DDDF50C(v4, v6, v8 & 1, v19);
      int64_t v4 = v15;
      int v6 = v16;
      char v8 = v17 & 1;
      --v1;
    }
    while (v1);
    sub_25DDE2AA4(v15, v16, v17 & 1);
  }
  return v2;
}

uint64_t sub_25DDDE000(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v3 = a1;
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v26 = a1 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v5;
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = a2 + 56;
  if ((v7 & v5) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v11 = v10 | (v4 << 6);
LABEL_24:
  uint64_t v15 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v11);
  uint64_t v16 = sub_25DDD17D0();
  uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v18 = v16 & ~v17;
  if (((*(void *)(v9 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
    return 0;
  }
  int64_t v29 = v4;
  uint64_t v19 = ~v17;
  while (2)
  {
    unint64_t v20 = 0x800000025DDE5320;
    unint64_t v21 = 0xD000000000000011;
    switch(*(unsigned char *)(*(void *)(a2 + 48) + v18))
    {
      case 1:
        unint64_t v21 = 0x6F69746174636964;
        unint64_t v20 = 0xE90000000000006ELL;
        break;
      case 2:
        unint64_t v20 = 0xE300000000000000;
        unint64_t v21 = 7496035;
        break;
      case 3:
        break;
      case 4:
        unint64_t v20 = 0xE700000000000000;
        unint64_t v21 = 0x73646F50726961;
        break;
      case 5:
        unint64_t v21 = 0x6D6F44736D6D6F63;
        unint64_t v20 = 0xED0000746E616E69;
        break;
      case 6:
        unint64_t v21 = 0xD00000000000001ALL;
        unint64_t v20 = 0x800000025DDE5350;
        break;
      default:
        unint64_t v21 = 0x6F7473754377656ELL;
        unint64_t v20 = 0xEB0000000072656DLL;
        break;
    }
    unint64_t v22 = 0x800000025DDE5320;
    unint64_t v23 = 0xD000000000000011;
    switch(v15)
    {
      case 1:
        unint64_t v22 = 0xE90000000000006ELL;
        if (v21 != 0x6F69746174636964) {
          goto LABEL_45;
        }
        goto LABEL_44;
      case 2:
        unint64_t v22 = 0xE300000000000000;
        if (v21 != 7496035) {
          goto LABEL_45;
        }
        goto LABEL_44;
      case 3:
        goto LABEL_43;
      case 4:
        unint64_t v22 = 0xE700000000000000;
        if (v21 != 0x73646F50726961) {
          goto LABEL_45;
        }
        goto LABEL_44;
      case 5:
        unint64_t v23 = 0x6D6F44736D6D6F63;
        unint64_t v22 = 0xED0000746E616E69;
LABEL_43:
        if (v21 == v23) {
          goto LABEL_44;
        }
        goto LABEL_45;
      case 6:
        unint64_t v22 = 0x800000025DDE5350;
        if (v21 != 0xD00000000000001ALL) {
          goto LABEL_45;
        }
        goto LABEL_44;
      default:
        unint64_t v22 = 0xEB0000000072656DLL;
        if (v21 != 0x6F7473754377656ELL) {
          goto LABEL_45;
        }
LABEL_44:
        if (v20 != v22)
        {
LABEL_45:
          char v24 = sub_25DDE3480();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v24) {
            goto LABEL_51;
          }
          unint64_t v18 = (v18 + 1) & v19;
          if (((*(void *)(v9 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
            return 0;
          }
          continue;
        }
        swift_bridgeObjectRelease_n();
LABEL_51:
        uint64_t v3 = a1;
        int64_t v4 = v29;
        if (v8) {
          goto LABEL_7;
        }
LABEL_8:
        int64_t v12 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_56;
        }
        if (v12 < v27)
        {
          unint64_t v13 = *(void *)(v26 + 8 * v12);
          ++v4;
          if (v13) {
            goto LABEL_23;
          }
          int64_t v4 = v12 + 1;
          if (v12 + 1 < v27)
          {
            unint64_t v13 = *(void *)(v26 + 8 * v4);
            if (v13) {
              goto LABEL_23;
            }
            int64_t v4 = v12 + 2;
            if (v12 + 2 < v27)
            {
              unint64_t v13 = *(void *)(v26 + 8 * v4);
              if (v13) {
                goto LABEL_23;
              }
              int64_t v4 = v12 + 3;
              if (v12 + 3 < v27)
              {
                unint64_t v13 = *(void *)(v26 + 8 * v4);
                if (v13) {
                  goto LABEL_23;
                }
                int64_t v14 = v12 + 4;
                if (v14 < v27)
                {
                  unint64_t v13 = *(void *)(v26 + 8 * v14);
                  if (v13)
                  {
                    int64_t v4 = v14;
LABEL_23:
                    unint64_t v8 = (v13 - 1) & v13;
                    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
                    goto LABEL_24;
                  }
                  while (1)
                  {
                    int64_t v4 = v14 + 1;
                    if (__OFADD__(v14, 1)) {
                      break;
                    }
                    if (v4 >= v27) {
                      return 1;
                    }
                    unint64_t v13 = *(void *)(v26 + 8 * v4);
                    ++v14;
                    if (v13) {
                      goto LABEL_23;
                    }
                  }
LABEL_56:
                  __break(1u);
                  JUMPOUT(0x25DDDE438);
                }
              }
            }
          }
        }
        return 1;
    }
  }
}

unint64_t sub_25DDDE470(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x46746E656D676573;
      break;
    case 2:
    case 3:
    case 6:
      return result;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      unint64_t result = 0x7974697669746361;
      break;
  }
  return result;
}

BOOL sub_25DDDE564(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25DDDE578()
{
  return sub_25DDE3500();
}

uint64_t sub_25DDDE5C0()
{
  return sub_25DDE34F0();
}

uint64_t sub_25DDDE5EC()
{
  return sub_25DDE3500();
}

unint64_t sub_25DDDE630()
{
  return sub_25DDDE470(*v0);
}

uint64_t sub_25DDDE638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25DDE273C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25DDDE660()
{
  return 0;
}

void sub_25DDDE66C(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_25DDDE678(uint64_t a1)
{
  unint64_t v2 = sub_25DDE0280();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25DDDE6B4(uint64_t a1)
{
  unint64_t v2 = sub_25DDE0280();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SegmentsSummary.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C80A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_25DDE0280();
  sub_25DDE3520();
  LOBYTE(v11) = *(unsigned char *)v3;
  char v12 = 0;
  sub_25DDE02D4();
  sub_25DDE3460();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + 8);
    char v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C80C0);
    sub_25DDE03D0(&qword_26A6C80C8, (void (*)(void))sub_25DDE0328);
    sub_25DDE3460();
    type metadata accessor for SegmentsSummary();
    LOBYTE(v11) = 2;
    sub_25DDE2DC0();
    sub_25DDE2A5C(&qword_26A6C7BA0, MEMORY[0x263F07490]);
    sub_25DDE3460();
    LOBYTE(v11) = 3;
    sub_25DDE3450();
    LOBYTE(v11) = 4;
    sub_25DDE3450();
    LOBYTE(v11) = 5;
    sub_25DDE3450();
    LOBYTE(v11) = 6;
    sub_25DDE3450();
    LOBYTE(v11) = 7;
    type metadata accessor for SiriFirstEnablementStatus();
    sub_25DDE2A5C(&qword_26A6C80D8, (void (*)(uint64_t))type metadata accessor for SiriFirstEnablementStatus);
    sub_25DDE3460();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SegmentsSummary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x270FA5388](EnablementStatus);
  uint64_t v40 = (char *)v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v42 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v37 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  char v12 = (char *)v37 - v11;
  MEMORY[0x270FA5388](v10);
  int64_t v14 = (char *)v37 - v13;
  uint64_t v15 = sub_25DDE2DC0();
  uint64_t v45 = *(void *)(v15 - 8);
  uint64_t v46 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C80E0);
  uint64_t v43 = *(void *)(v18 - 8);
  uint64_t v44 = v18;
  MEMORY[0x270FA5388](v18);
  unint64_t v20 = (char *)v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for SegmentsSummary();
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[3];
  uint64_t v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  sub_25DDE0280();
  unint64_t v23 = v48;
  sub_25DDE3510();
  if (v23) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  }
  uint64_t v24 = (uint64_t)v14;
  uint64_t v48 = v12;
  uint64_t v38 = v9;
  uint64_t v25 = v43;
  char v52 = 0;
  sub_25DDE037C();
  sub_25DDE3420();
  uint64_t v26 = v50;
  *uint64_t v50 = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C80C0);
  char v52 = 1;
  sub_25DDE03D0(&qword_26A6C80F0, (void (*)(void))sub_25DDE0440);
  sub_25DDE3420();
  uint64_t v27 = (uint64_t)v47;
  *((void *)v26 + 1) = v51;
  LOBYTE(v51) = 2;
  uint64_t v28 = sub_25DDE2A5C(&qword_26A6C7BE8, MEMORY[0x263F07490]);
  uint64_t v29 = v46;
  v37[1] = v28;
  sub_25DDE3420();
  (*(void (**)(unsigned char *, char *, uint64_t))(v45 + 32))(&v26[*(int *)(v49 + 24)], v17, v29);
  LOBYTE(v51) = 3;
  sub_25DDE3410();
  uint64_t v30 = (int *)v49;
  sub_25DDDAF08(v24, (uint64_t)&v50[*(int *)(v49 + 28)]);
  LOBYTE(v51) = 4;
  uint64_t v31 = (uint64_t)v48;
  sub_25DDE3410();
  sub_25DDDAF08(v31, (uint64_t)&v50[v30[8]]);
  LOBYTE(v51) = 5;
  uint64_t v32 = (uint64_t)v38;
  sub_25DDE3410();
  sub_25DDDAF08(v32, (uint64_t)&v50[v30[9]]);
  LOBYTE(v51) = 6;
  uint64_t v33 = (uint64_t)v42;
  sub_25DDE3410();
  sub_25DDDAF08(v33, (uint64_t)&v50[v30[10]]);
  LOBYTE(v51) = 7;
  sub_25DDE2A5C(&qword_26A6C8100, (void (*)(uint64_t))type metadata accessor for SiriFirstEnablementStatus);
  uint64_t v34 = (uint64_t)v40;
  sub_25DDE3420();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v44);
  uint64_t v35 = (uint64_t)v50;
  sub_25DDBA458(v34, (uint64_t)&v50[v30[11]]);
  sub_25DDE0494(v35, v39);
  __swift_destroy_boxed_opaque_existential_1(v27);
  return sub_25DDE04F8(v35);
}

uint64_t sub_25DDDF2A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SegmentsSummary.init(from:)(a1, a2);
}

uint64_t sub_25DDDF2C0(void *a1)
{
  return SegmentsSummary.encode(to:)(a1);
}

uint64_t sub_25DDDF2E0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25DDDF300(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_25DDDF300(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C8130);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size_1(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25DDE33D0();
  __break(1u);
  return result;
}

uint64_t sub_25DDDF46C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_25DDDF50C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t _s16SiriUserSegments0C7SummaryV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, char *a2)
{
  uint64_t v122 = a1;
  uint64_t v117 = sub_25DDE2DC0();
  uint64_t v119 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  uint64_t v120 = &v99[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C8120);
  uint64_t v4 = MEMORY[0x270FA5388](v121);
  uint64_t v112 = &v99[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v115 = &v99[-v7];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v116 = &v99[-v9];
  MEMORY[0x270FA5388](v8);
  uint64_t v118 = &v99[-v10];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v110 = &v99[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v113 = &v99[-v15];
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v111 = &v99[-v17];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  char v114 = &v99[-v19];
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = &v99[-v21];
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = &v99[-v24];
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = &v99[-v27];
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v31 = &v99[-v30];
  uint64_t v32 = MEMORY[0x270FA5388](v29);
  uint64_t v34 = &v99[-v33];
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = &v99[-v36];
  uint64_t v38 = MEMORY[0x270FA5388](v35);
  uint64_t v40 = &v99[-v39];
  MEMORY[0x270FA5388](v38);
  uint64_t v42 = &v99[-v41];
  uint64_t v43 = a2;
  char v44 = *a2;
  uint64_t v45 = v122;
  if ((sub_25DDD20B4(*v122, v44) & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v108 = v42;
  uint64_t v109 = v40;
  uint64_t v104 = v37;
  uint64_t v105 = v31;
  uint64_t v106 = v34;
  uint64_t v107 = v22;
  char v102 = v28;
  v103 = v25;
  uint64_t v47 = v120;
  uint64_t v46 = v121;
  if ((sub_25DDDE000(*((void *)v45 + 1), *((void *)v43 + 1)) & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v48 = (int *)type metadata accessor for SegmentsSummary();
  if ((sub_25DDE2D90() & 1) == 0) {
    goto LABEL_24;
  }
  uint64_t v49 = (uint64_t)v108;
  sub_25DDBF600((uint64_t)&v45[v48[7]], (uint64_t)v108);
  uint64_t v50 = v48[7];
  uint64_t v101 = v43;
  uint64_t v51 = (uint64_t)v109;
  sub_25DDBF600((uint64_t)&v43[v50], (uint64_t)v109);
  uint64_t v52 = v117;
  uint64_t v53 = v118;
  uint64_t v54 = (uint64_t)&v118[*(int *)(v46 + 48)];
  sub_25DDBF600(v49, (uint64_t)v118);
  sub_25DDBF600(v51, v54);
  uint64_t v55 = v119 + 48;
  uint64_t v56 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v119 + 48);
  if (v56((uint64_t)v53, 1, v52) == 1)
  {
    sub_25DDE2AB4(v51, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDE2AB4(v49, (uint64_t *)&unk_26A6C7EC0);
    if (v56(v54, 1, v52) == 1)
    {
      uint64_t v57 = v52;
      sub_25DDE2AB4((uint64_t)v53, (uint64_t *)&unk_26A6C7EC0);
      uint64_t v58 = (uint64_t)v107;
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v61 = (uint64_t)v53;
LABEL_23:
    sub_25DDE2AB4(v61, &qword_26A6C8120);
    goto LABEL_24;
  }
  uint64_t v59 = (uint64_t)v104;
  sub_25DDBF600((uint64_t)v53, (uint64_t)v104);
  uint64_t v60 = v52;
  if (v56(v54, 1, v52) == 1)
  {
    sub_25DDE2AB4((uint64_t)v109, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDE2AB4(v49, (uint64_t *)&unk_26A6C7EC0);
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v59, v52);
    goto LABEL_9;
  }
  uint64_t v62 = v119;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v119 + 32))(v47, v54, v60);
  sub_25DDE2A5C(&qword_26A6C8128, MEMORY[0x263F07490]);
  int v100 = sub_25DDE30F0();
  uint64_t v63 = (uint64_t)v107;
  uint64_t v64 = *(void (**)(unsigned char *, uint64_t))(v62 + 8);
  v64(v47, v60);
  sub_25DDE2AB4((uint64_t)v109, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDE2AB4((uint64_t)v108, (uint64_t *)&unk_26A6C7EC0);
  v64((unsigned char *)v59, v60);
  uint64_t v58 = v63;
  sub_25DDE2AB4((uint64_t)v53, (uint64_t *)&unk_26A6C7EC0);
  uint64_t v57 = v60;
  if ((v100 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_11:
  uint64_t v65 = (uint64_t)v106;
  sub_25DDBF600((uint64_t)&v122[v48[8]], (uint64_t)v106);
  uint64_t v66 = (uint64_t)v105;
  sub_25DDBF600((uint64_t)&v101[v48[8]], (uint64_t)v105);
  uint64_t v67 = v55;
  uint64_t v68 = v116;
  uint64_t v69 = (uint64_t)&v116[*(int *)(v121 + 48)];
  sub_25DDBF600(v65, (uint64_t)v116);
  sub_25DDBF600(v66, v69);
  if (v56((uint64_t)v68, 1, v57) == 1)
  {
    sub_25DDE2AB4(v66, (uint64_t *)&unk_26A6C7EC0);
    uint64_t v70 = v65;
    uint64_t v71 = v57;
    sub_25DDE2AB4(v70, (uint64_t *)&unk_26A6C7EC0);
    if (v56(v69, 1, v57) != 1) {
      goto LABEL_22;
    }
    uint64_t v117 = v67;
    uint64_t v118 = v56;
    sub_25DDE2AB4((uint64_t)v68, (uint64_t *)&unk_26A6C7EC0);
  }
  else
  {
    uint64_t v72 = (uint64_t)v102;
    sub_25DDBF600((uint64_t)v68, (uint64_t)v102);
    if (v56(v69, 1, v57) == 1)
    {
      sub_25DDE2AB4((uint64_t)v105, (uint64_t *)&unk_26A6C7EC0);
      sub_25DDE2AB4((uint64_t)v106, (uint64_t *)&unk_26A6C7EC0);
      (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v72, v57);
      goto LABEL_22;
    }
    uint64_t v117 = v67;
    uint64_t v118 = v56;
    uint64_t v73 = v119;
    unint64_t v74 = v120;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v119 + 32))(v120, v69, v57);
    sub_25DDE2A5C(&qword_26A6C8128, MEMORY[0x263F07490]);
    char v75 = sub_25DDE30F0();
    uint64_t v76 = (uint64_t)v68;
    uint64_t v77 = v48;
    uint64_t v78 = *(void (**)(unsigned char *, uint64_t))(v73 + 8);
    v78(v74, v57);
    sub_25DDE2AB4((uint64_t)v105, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDE2AB4((uint64_t)v106, (uint64_t *)&unk_26A6C7EC0);
    v78((unsigned char *)v72, v57);
    uint64_t v58 = (uint64_t)v107;
    uint64_t v48 = v77;
    uint64_t v71 = v57;
    sub_25DDE2AB4(v76, (uint64_t *)&unk_26A6C7EC0);
    if ((v75 & 1) == 0) {
      goto LABEL_24;
    }
  }
  uint64_t v79 = (uint64_t)v103;
  sub_25DDBF600((uint64_t)&v122[v48[9]], (uint64_t)v103);
  sub_25DDBF600((uint64_t)&v101[v48[9]], v58);
  uint64_t v68 = v115;
  uint64_t v80 = (uint64_t)&v115[*(int *)(v121 + 48)];
  sub_25DDBF600(v79, (uint64_t)v115);
  sub_25DDBF600(v58, v80);
  int v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v118;
  if (((unsigned int (*)(unsigned char *, uint64_t, uint64_t))v118)(v68, 1, v71) != 1)
  {
    uint64_t v82 = v114;
    sub_25DDBF600((uint64_t)v68, (uint64_t)v114);
    int v83 = v81(v80, 1, v71);
    uint64_t v84 = v119;
    if (v83 != 1)
    {
      uint64_t v87 = v120;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v119 + 32))(v120, v80, v71);
      sub_25DDE2A5C(&qword_26A6C8128, MEMORY[0x263F07490]);
      char v88 = sub_25DDE30F0();
      uint64_t v89 = *(void (**)(unsigned char *, uint64_t))(v84 + 8);
      v89(v87, v71);
      sub_25DDE2AB4((uint64_t)v107, (uint64_t *)&unk_26A6C7EC0);
      sub_25DDE2AB4((uint64_t)v103, (uint64_t *)&unk_26A6C7EC0);
      v89(v114, v71);
      sub_25DDE2AB4((uint64_t)v68, (uint64_t *)&unk_26A6C7EC0);
      if ((v88 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_27;
    }
    sub_25DDE2AB4((uint64_t)v107, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDE2AB4((uint64_t)v103, (uint64_t *)&unk_26A6C7EC0);
    (*(void (**)(unsigned char *, uint64_t))(v84 + 8))(v82, v71);
LABEL_22:
    uint64_t v61 = (uint64_t)v68;
    goto LABEL_23;
  }
  sub_25DDE2AB4(v58, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDE2AB4(v79, (uint64_t *)&unk_26A6C7EC0);
  if (v81(v80, 1, v71) != 1) {
    goto LABEL_22;
  }
  sub_25DDE2AB4((uint64_t)v68, (uint64_t *)&unk_26A6C7EC0);
LABEL_27:
  int v90 = v111;
  sub_25DDBF600((uint64_t)&v122[v48[10]], (uint64_t)v111);
  uint64_t v118 = v48;
  uint64_t v91 = v113;
  sub_25DDBF600((uint64_t)&v101[v48[10]], (uint64_t)v113);
  uint64_t v53 = v112;
  uint64_t v92 = (uint64_t)&v112[*(int *)(v121 + 48)];
  sub_25DDBF600((uint64_t)v90, (uint64_t)v112);
  sub_25DDBF600((uint64_t)v91, v92);
  if (v81((uint64_t)v53, 1, v71) == 1)
  {
    sub_25DDE2AB4((uint64_t)v91, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDE2AB4((uint64_t)v90, (uint64_t *)&unk_26A6C7EC0);
    if (v81(v92, 1, v71) == 1)
    {
      sub_25DDE2AB4((uint64_t)v53, (uint64_t *)&unk_26A6C7EC0);
LABEL_33:
      char v85 = sub_25DDBA500((uint64_t)&v122[*((int *)v118 + 11)], (uint64_t)&v101[*((int *)v118 + 11)]);
      return v85 & 1;
    }
    goto LABEL_9;
  }
  uint64_t v93 = v110;
  sub_25DDBF600((uint64_t)v53, (uint64_t)v110);
  if (v81(v92, 1, v71) == 1)
  {
    sub_25DDE2AB4((uint64_t)v113, (uint64_t *)&unk_26A6C7EC0);
    sub_25DDE2AB4((uint64_t)v90, (uint64_t *)&unk_26A6C7EC0);
    (*(void (**)(unsigned char *, uint64_t))(v119 + 8))(v93, v71);
    goto LABEL_9;
  }
  uint64_t v94 = (uint64_t)v90;
  uint64_t v95 = v119;
  int v96 = v120;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v119 + 32))(v120, v92, v71);
  sub_25DDE2A5C(&qword_26A6C8128, MEMORY[0x263F07490]);
  char v97 = sub_25DDE30F0();
  uint64_t v98 = *(void (**)(unsigned char *, uint64_t))(v95 + 8);
  v98(v96, v71);
  sub_25DDE2AB4((uint64_t)v113, (uint64_t *)&unk_26A6C7EC0);
  sub_25DDE2AB4(v94, (uint64_t *)&unk_26A6C7EC0);
  v98(v93, v71);
  sub_25DDE2AB4((uint64_t)v53, (uint64_t *)&unk_26A6C7EC0);
  if (v97) {
    goto LABEL_33;
  }
LABEL_24:
  char v85 = 0;
  return v85 & 1;
}

unint64_t sub_25DDE0280()
{
  unint64_t result = qword_26A6C80B0;
  if (!qword_26A6C80B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C80B0);
  }
  return result;
}

unint64_t sub_25DDE02D4()
{
  unint64_t result = qword_26A6C80B8;
  if (!qword_26A6C80B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C80B8);
  }
  return result;
}

unint64_t sub_25DDE0328()
{
  unint64_t result = qword_26A6C80D0;
  if (!qword_26A6C80D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C80D0);
  }
  return result;
}

unint64_t sub_25DDE037C()
{
  unint64_t result = qword_26A6C80E8;
  if (!qword_26A6C80E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C80E8);
  }
  return result;
}

uint64_t sub_25DDE03D0(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A6C80C0);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25DDE0440()
{
  unint64_t result = qword_26A6C80F8;
  if (!qword_26A6C80F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C80F8);
  }
  return result;
}

uint64_t sub_25DDE0494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SegmentsSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25DDE04F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SegmentsSummary();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for SegmentsSummary(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v7 = a3[6];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25DDE2DC0();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    v12(v8, v9, v10);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v40 = v12;
    if (v39((char *)a2 + v13, 1, v10))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
    }
    uint64_t v18 = v11;
    uint64_t v19 = a3[8];
    uint64_t v20 = (char *)v4 + v19;
    uint64_t v21 = (char *)a2 + v19;
    if (v39((char *)a2 + v19, 1, v10))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      v40(v20, v21, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
    }
    uint64_t v23 = a3[9];
    uint64_t v24 = (char *)v4 + v23;
    uint64_t v25 = (char *)a2 + v23;
    if (v39((char *)a2 + v23, 1, v10))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
      memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      v40(v24, v25, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
    }
    uint64_t v27 = a3[10];
    uint64_t v28 = (char *)v4 + v27;
    uint64_t v29 = (char *)a2 + v27;
    if (v39((char *)a2 + v27, 1, v10))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
      uint64_t v31 = v40;
    }
    else
    {
      uint64_t v31 = v40;
      v40(v28, v29, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v28, 0, 1, v10);
    }
    uint64_t v32 = a3[11];
    uint64_t v33 = (char *)v4 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 3, v35))
    {
      uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
      memcpy(v33, v34, *(void *)(*(void *)(EnablementStatus - 8) + 64));
    }
    else
    {
      v31(v33, v34, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 3, v35);
    }
  }
  return v4;
}

uint64_t destroy for SegmentsSummary(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_25DDE2DC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v15(v4, v5);
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v8(v7, 1, v5)) {
    v15(v7, v5);
  }
  uint64_t v9 = a1 + a2[8];
  if (!v8(v9, 1, v5)) {
    v15(v9, v5);
  }
  uint64_t v10 = a1 + a2[9];
  if (!v8(v10, 1, v5)) {
    v15(v10, v5);
  }
  uint64_t v11 = a1 + a2[10];
  if (!v8(v11, 1, v5)) {
    v15(v11, v5);
  }
  uint64_t v12 = a1 + a2[11];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 3, v13);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v15)(v12, v5);
  }
  return result;
}

uint64_t initializeWithCopy for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  v11(v7, v8, v9);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  uint64_t v38 = v11;
  if (v15(a2 + v12, 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  uint64_t v17 = v10;
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v15(a2 + v18, 1, v9))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v38(v19, v20, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  uint64_t v22 = a3[9];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v15(a2 + v22, 1, v9))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    v38(v23, v24, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  uint64_t v26 = a3[10];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (const void *)(a2 + v26);
  if (v15(a2 + v26, 1, v9))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    uint64_t v30 = v38;
  }
  else
  {
    uint64_t v30 = v38;
    v38(v27, v28, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v27, 0, 1, v9);
  }
  uint64_t v31 = a3[11];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v35 + 48))(v33, 3, v34))
  {
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v32, v33, *(void *)(*(void *)(EnablementStatus - 8) + 64));
  }
  else
  {
    v30(v32, v33, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 3, v34);
  }
  return a1;
}

uint64_t assignWithCopy for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24);
  v46(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  int v15 = v14(a1 + v11, 1, v9);
  int v16 = v14((uint64_t)v13, 1, v9);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v12, v13, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v46((uint64_t)v12, (uint64_t)v13, v9);
LABEL_7:
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  int v21 = v14(a1 + v18, 1, v9);
  int v22 = v14((uint64_t)v20, 1, v9);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v19, v20, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v19, v9);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  v46((uint64_t)v19, (uint64_t)v20, v9);
LABEL_13:
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  int v27 = v14(a1 + v24, 1, v9);
  int v28 = v14((uint64_t)v26, 1, v9);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v25, v26, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v25, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v25, v9);
LABEL_18:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  v46((uint64_t)v25, (uint64_t)v26, v9);
LABEL_19:
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  int v33 = v14(a1 + v30, 1, v9);
  int v34 = v14((uint64_t)v32, 1, v9);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v31, v32, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v31, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v34)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v31, v9);
LABEL_24:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_25;
  }
  v46((uint64_t)v31, (uint64_t)v32, v9);
LABEL_25:
  uint64_t v36 = a3[11];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 3, v39);
  int v43 = v41(v38, 3, v39);
  if (!v42)
  {
    if (!v43)
    {
      v46((uint64_t)v37, (uint64_t)v38, v9);
      return a1;
    }
    sub_25DDE2AB4((uint64_t)v37, &qword_26A6C7B58);
    goto LABEL_30;
  }
  if (v43)
  {
LABEL_30:
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v37, v38, *(void *)(*(void *)(EnablementStatus - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v37, v38, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 3, v39);
  return a1;
}

uint64_t initializeWithTake for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  int v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v15(a2 + v12, 1, v9))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (const void *)(a2 + v17);
  if (v15(a2 + v17, 1, v9))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    v11(v18, v19, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  uint64_t v21 = a3[9];
  int v22 = (void *)(a1 + v21);
  uint64_t v23 = (const void *)(a2 + v21);
  if (v15(a2 + v21, 1, v9))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    v11(v22, v23, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  }
  uint64_t v25 = a3[10];
  uint64_t v26 = (void *)(a1 + v25);
  int v27 = (const void *)(a2 + v25);
  if (v15(a2 + v25, 1, v9))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    uint64_t v29 = v11;
  }
  else
  {
    uint64_t v29 = v11;
    v11(v26, v27, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
  }
  uint64_t v30 = a3[11];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v34 = *(void *)(v33 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v34 + 48))(v32, 3, v33))
  {
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v31, v32, *(void *)(*(void *)(EnablementStatus - 8) + 64));
  }
  else
  {
    v29(v31, v32, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 3, v33);
  }
  return a1;
}

uint64_t assignWithTake for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_25DDE2DC0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40);
  v46(v7, v8, v9);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  int v15 = v14(a1 + v11, 1, v9);
  int v16 = v14((uint64_t)v13, 1, v9);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v12, v13, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v46((uint64_t)v12, (uint64_t)v13, v9);
LABEL_7:
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  int v21 = v14(a1 + v18, 1, v9);
  int v22 = v14((uint64_t)v20, 1, v9);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v19, v9);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  v46((uint64_t)v19, (uint64_t)v20, v9);
LABEL_13:
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  int v27 = v14(a1 + v24, 1, v9);
  int v28 = v14((uint64_t)v26, 1, v9);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v25, v26, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v25, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v25, v9);
LABEL_18:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  v46((uint64_t)v25, (uint64_t)v26, v9);
LABEL_19:
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  int v33 = v14(a1 + v30, 1, v9);
  int v34 = v14((uint64_t)v32, 1, v9);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v31, v32, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v31, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v34)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v31, v9);
LABEL_24:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
    memcpy(v31, v32, *(void *)(*(void *)(v35 - 8) + 64));
    goto LABEL_25;
  }
  v46((uint64_t)v31, (uint64_t)v32, v9);
LABEL_25:
  uint64_t v36 = a3[11];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (void *)(a2 + v36);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6C7B58);
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 3, v39);
  int v43 = v41(v38, 3, v39);
  if (!v42)
  {
    if (!v43)
    {
      v46((uint64_t)v37, (uint64_t)v38, v9);
      return a1;
    }
    sub_25DDE2AB4((uint64_t)v37, &qword_26A6C7B58);
    goto LABEL_30;
  }
  if (v43)
  {
LABEL_30:
    uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v37, v38, *(void *)(*(void *)(EnablementStatus - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v37, v38, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 3, v39);
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentsSummary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25DDE2060);
}

uint64_t sub_25DDE2060(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = sub_25DDE2DC0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[6];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v13(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[7];
    goto LABEL_9;
  }
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 48);
  uint64_t v16 = EnablementStatus;
  uint64_t v17 = a1 + a3[11];
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for SegmentsSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25DDE21F0);
}

uint64_t sub_25DDE21F0(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = sub_25DDE2DC0();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
LABEL_7:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v13(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A6C7EC0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[7];
    goto LABEL_7;
  }
  uint64_t EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(EnablementStatus - 8) + 56);
  uint64_t v16 = EnablementStatus;
  uint64_t v17 = v5 + a4[11];
  return v15(v17, a2, a2, v16);
}

void sub_25DDE236C()
{
  sub_25DDE2DC0();
  if (v0 <= 0x3F)
  {
    sub_25DDD4648();
    if (v1 <= 0x3F)
    {
      type metadata accessor for SiriFirstEnablementStatus();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t getEnumTagSinglePayload for SegmentsSummary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SegmentsSummary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x25DDE25E8);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_25DDE2610(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25DDE261C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SegmentsSummary.CodingKeys()
{
  return &type metadata for SegmentsSummary.CodingKeys;
}

unint64_t sub_25DDE2638()
{
  unint64_t result = qword_26A6C8108;
  if (!qword_26A6C8108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C8108);
  }
  return result;
}

unint64_t sub_25DDE2690()
{
  unint64_t result = qword_26A6C8110;
  if (!qword_26A6C8110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C8110);
  }
  return result;
}

unint64_t sub_25DDE26E8()
{
  unint64_t result = qword_26A6C8118;
  if (!qword_26A6C8118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A6C8118);
  }
  return result;
}

uint64_t sub_25DDE273C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7974697669746361 && a2 == 0xEF746E656D676553;
  if (v3 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x46746E656D676573 && a2 == 0xEC0000007367616CLL || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025DDE6150 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025DDE6170 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000025DDE6190 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025DDE61B0 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025DDE61D0 || (sub_25DDE3480() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025DDE61F0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_25DDE3480();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_25DDE2A5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25DDE2AA4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25DDE2AB4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25DDE2B10()
{
  return MEMORY[0x270EEE2D8]();
}

uint64_t sub_25DDE2B20()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_25DDE2B30()
{
  return MEMORY[0x270EEE300]();
}

uint64_t sub_25DDE2B40()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_25DDE2B50()
{
  return MEMORY[0x270EEE328]();
}

uint64_t sub_25DDE2B60()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_25DDE2B70()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_25DDE2B80()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_25DDE2B90()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_25DDE2BA0()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_25DDE2BB0()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_25DDE2BC0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_25DDE2BD0()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_25DDE2BE0()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_25DDE2BF0()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_25DDE2C00()
{
  return MEMORY[0x270EEF278]();
}

uint64_t sub_25DDE2C10()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_25DDE2C20()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_25DDE2C30()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_25DDE2C40()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25DDE2C50()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25DDE2C60()
{
  return MEMORY[0x270FA1648]();
}

uint64_t sub_25DDE2C70()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25DDE2C80()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_25DDE2C90()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25DDE2CA0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_25DDE2CB0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_25DDE2CC0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_25DDE2CD0()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_25DDE2CE0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25DDE2CF0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_25DDE2D00()
{
  return MEMORY[0x270EF0790]();
}

uint64_t sub_25DDE2D10()
{
  return MEMORY[0x270EF07E8]();
}

uint64_t sub_25DDE2D20()
{
  return MEMORY[0x270EF07F8]();
}

uint64_t sub_25DDE2D30()
{
  return MEMORY[0x270EF0808]();
}

uint64_t sub_25DDE2D40()
{
  return MEMORY[0x270EF0820]();
}

uint64_t sub_25DDE2D50()
{
  return MEMORY[0x270EF0840]();
}

uint64_t sub_25DDE2D60()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_25DDE2D70()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_25DDE2D80()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25DDE2D90()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_25DDE2DA0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_25DDE2DB0()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_25DDE2DC0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25DDE2DD0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_25DDE2DE0()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_25DDE2DF0()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_25DDE2E00()
{
  return MEMORY[0x270EF10E0]();
}

uint64_t sub_25DDE2E10()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_25DDE2E20()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_25DDE2E30()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_25DDE2E40()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_25DDE2E50()
{
  return MEMORY[0x270EF1398]();
}

uint64_t sub_25DDE2E60()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25DDE2E70()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_25DDE2E80()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25DDE2E90()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25DDE2EA0()
{
  return MEMORY[0x270EF15A8]();
}

uint64_t sub_25DDE2EB0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25DDE2EC0()
{
  return MEMORY[0x270F08560]();
}

uint64_t sub_25DDE2ED0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_25DDE2EE0()
{
  return MEMORY[0x270F66120]();
}

uint64_t sub_25DDE2EF0()
{
  return MEMORY[0x270F66170]();
}

uint64_t sub_25DDE2F00()
{
  return MEMORY[0x270F66188]();
}

uint64_t sub_25DDE2F10()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_25DDE2F20()
{
  return MEMORY[0x270FA1908]();
}

uint64_t sub_25DDE2F30()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_25DDE2F40()
{
  return MEMORY[0x270F08588]();
}

uint64_t sub_25DDE2F50()
{
  return MEMORY[0x270F08598]();
}

uint64_t sub_25DDE2F70()
{
  return MEMORY[0x270F085B0]();
}

uint64_t sub_25DDE2F80()
{
  return MEMORY[0x270F085C8]();
}

uint64_t sub_25DDE2F90()
{
  return MEMORY[0x270F085D8]();
}

uint64_t sub_25DDE2FA0()
{
  return MEMORY[0x270F085E0]();
}

uint64_t sub_25DDE2FB0()
{
  return MEMORY[0x270F085F8]();
}

uint64_t sub_25DDE2FC0()
{
  return MEMORY[0x270F08600]();
}

uint64_t sub_25DDE2FD0()
{
  return MEMORY[0x270F08608]();
}

uint64_t sub_25DDE2FE0()
{
  return MEMORY[0x270F08618]();
}

uint64_t sub_25DDE2FF0()
{
  return MEMORY[0x270F08628]();
}

uint64_t sub_25DDE3000()
{
  return MEMORY[0x270F08640]();
}

uint64_t sub_25DDE3010()
{
  return MEMORY[0x270F08648]();
}

uint64_t sub_25DDE3020()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25DDE3030()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25DDE3040()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25DDE3050()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_25DDE3060()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_25DDE3070()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_25DDE3080()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_25DDE3090()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_25DDE30A0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25DDE30B0()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_25DDE30C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_25DDE30D0()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_25DDE30E0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_25DDE30F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25DDE3100()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25DDE3110()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25DDE3120()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25DDE3130()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25DDE3140()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25DDE3150()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_25DDE3160()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_25DDE3170()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25DDE3180()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_25DDE3190()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25DDE31A0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25DDE31B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25DDE31C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25DDE31E0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25DDE31F0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25DDE3200()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_25DDE3220()
{
  return MEMORY[0x270FA1F80]();
}

uint64_t sub_25DDE3230()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25DDE3240()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25DDE3250()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25DDE3260()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25DDE3270()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_25DDE3280()
{
  return MEMORY[0x270F66250]();
}

uint64_t sub_25DDE3290()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_25DDE32A0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_25DDE32B0()
{
  return MEMORY[0x270F66270]();
}

uint64_t sub_25DDE32C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25DDE32D0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25DDE32E0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25DDE32F0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_25DDE3300()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25DDE3310()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25DDE3320()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_25DDE3330()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25DDE3340()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25DDE3350()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25DDE3360()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_25DDE3370()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_25DDE3380()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_25DDE3390()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25DDE33A0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25DDE33B0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25DDE33C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25DDE33D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25DDE33E0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_25DDE33F0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_25DDE3400()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_25DDE3410()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_25DDE3420()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_25DDE3430()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_25DDE3440()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_25DDE3450()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_25DDE3460()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_25DDE3470()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25DDE3480()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25DDE3490()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25DDE34A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25DDE34B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25DDE34C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25DDE34D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25DDE34E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25DDE34F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25DDE3500()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_25DDE3510()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_25DDE3520()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x270F10AF0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}