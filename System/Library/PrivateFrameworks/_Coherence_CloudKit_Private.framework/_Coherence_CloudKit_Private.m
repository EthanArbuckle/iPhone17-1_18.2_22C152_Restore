uint64_t CRCKError.errorDescription.getter()
{
  return 0x20676E697373694DLL;
}

uint64_t CRCKError.rawValue.getter()
{
  return 0x20676E697373694DLL;
}

uint64_t CRCKError.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22D90A8D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22D908B88()
{
  return 1;
}

uint64_t sub_22D908B90()
{
  return sub_22D90A930();
}

uint64_t sub_22D908BEC()
{
  return sub_22D90A880();
}

uint64_t sub_22D908C0C()
{
  return sub_22D90A930();
}

uint64_t sub_22D908C64@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_22D90A8D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_22D908CB8(uint64_t a1@<X8>)
{
  *(unsigned char *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t sub_22D908CDC()
{
  return 0x20676E697373694DLL;
}

uint64_t CRCKMergeable.crdt.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22D90A8A0();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t CRCKMergeable.crdt.setter(uint64_t a1)
{
  uint64_t v3 = sub_22D90A8A0();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*CRCKMergeable.crdt.modify())()
{
  return nullsub_1;
}

uint64_t CRCKMergeable.init(crdt:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, 1, 1, a3);
  uint64_t v7 = sub_22D90A8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a4, a1, v7);
  uint64_t result = type metadata accessor for CRCKMergeable();
  *(void *)(a4 + *(int *)(result + 36)) = a2;
  return result;
}

uint64_t type metadata accessor for CRCKMergeable()
{
  return __swift_instantiateGenericMetadata();
}

char *CRCKMergeable.mergeableDeltas(for:)(void *a1, char *a2)
{
  id v34 = a1;
  uint64_t v3 = v2;
  uint64_t v5 = sub_22D90A870();
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *((void *)a2 + 2);
  uint64_t v9 = sub_22D90A8A0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v13 = (char *)&v33 - v12;
  uint64_t v14 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v11);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v3, v9);
  uint64_t v38 = v14;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v8) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    sub_22D9092E4();
    swift_allocError();
    swift_willThrow();
  }
  else
  {
    v17 = v16;
    (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v16, v13, v8);
    uint64_t v19 = v36;
    uint64_t v18 = v37;
    (*(void (**)(char *, void, uint64_t))(v36 + 104))(v7, *MEMORY[0x263F32EB8], v37);
    a2 = v17;
    uint64_t v20 = v35;
    uint64_t v21 = sub_22D90A840();
    if (v20)
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v18);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v8);
    }
    else
    {
      uint64_t v23 = v21;
      unint64_t v24 = v22;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v18);
      id v25 = objc_allocWithZone(MEMORY[0x263EFD718]);
      sub_22D909338(v23, v24);
      uint64_t v26 = v23;
      id v27 = v34;
      v28 = v17;
      v29 = (void *)sub_22D90A820();
      id v30 = objc_msgSend(v25, sel_initWithData_metadata_, v29, v27);

      sub_22D909390(v26, v24);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26858D598);
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_22D90AB40;
      *(void *)(v31 + 32) = v30;
      uint64_t v39 = v31;
      sub_22D90A890();
      a2 = (char *)v39;
      sub_22D909390(v26, v24);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v8);
    }
  }
  return a2;
}

unint64_t sub_22D9092E4()
{
  unint64_t result = qword_26858D590;
  if (!qword_26858D590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26858D590);
  }
  return result;
}

uint64_t sub_22D909338(uint64_t a1, unint64_t a2)
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

uint64_t sub_22D909390(uint64_t a1, unint64_t a2)
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

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CRCKMergeable.merge(_:)(Swift::OpaquePointer a1)
{
  uint64_t v4 = v3;
  v49[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v43 = v1;
  uint64_t v6 = *(char **)(v1 + 16);
  uint64_t v7 = sub_22D90A8A0();
  uint64_t v8 = *(unsigned int (***)(char *, uint64_t, char *))(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - v10;
  unint64_t v12 = *((void *)v6 - 1);
  MEMORY[0x270FA5388](v9);
  v47 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1._rawValue >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_22D90A8C0();
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = *(void *)(((unint64_t)a1._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v14)
    {
LABEL_3:
      uint64_t v40 = v2;
      rawValue = a1._rawValue;
      uint64_t v48 = v4;
      unint64_t v42 = (unint64_t)a1._rawValue & 0xC000000000000001;
      uint64_t v37 = (void (**)(char *, uint64_t, uint64_t))(v8 + 2);
      uint64_t v38 = v14;
      uint64_t v15 = (void (**)(char *, uint64_t))(v8 + 1);
      uint64_t v8 = (unsigned int (**)(char *, uint64_t, char *))(v12 + 48);
      id v34 = (void (**)(uint64_t, char *, char *))(v12 + 32);
      uint64_t v35 = v15;
      v32 = (void (**)(char *, char *))(v12 + 8);
      uint64_t v33 = (void (**)(uint64_t, void, uint64_t, char *))(v12 + 56);
      uint64_t v4 = 4;
      uint64_t v39 = v11;
      uint64_t v36 = v7;
      do
      {
        uint64_t v2 = v4 - 4;
        if (v42)
        {
          id v17 = (id)MEMORY[0x230F8DC20](v4 - 4, a1._rawValue);
          uint64_t v18 = v4 - 3;
          if (__OFADD__(v2, 1)) {
            goto LABEL_22;
          }
        }
        else
        {
          id v17 = *((id *)a1._rawValue + v4);
          uint64_t v18 = v4 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }
        uint64_t v45 = v18;
        id v46 = v17;
        v49[0] = 0;
        id v19 = objc_msgSend(v17, sel_dataWithError_, v49);
        id v20 = v49[0];
        if (!v19)
        {
          id v30 = v20;
          swift_bridgeObjectRelease();
          sub_22D90A810();

          swift_willThrow();
LABEL_20:

          return;
        }
        uint64_t v21 = sub_22D90A830();
        unint64_t v12 = v22;

        sub_22D909338(v21, v12);
        uint64_t v23 = v48;
        sub_22D90A850();
        uint64_t v48 = v23;
        if (v23)
        {
          swift_bridgeObjectRelease();
          sub_22D909390(v21, v12);
          goto LABEL_20;
        }
        uint64_t v44 = v4;
        uint64_t v7 = v36;
        unint64_t v24 = v8;
        id v25 = v39;
        uint64_t v11 = v6;
        uint64_t v26 = v40;
        (*v37)(v39, v40, v36);
        id v27 = *v24;
        if ((*v24)(v25, 1, v11) == 1)
        {

          sub_22D909390(v21, v12);
          unint64_t v12 = (unint64_t)v35;
          v16 = *v35;
          (*v35)(v25, v7);
          v16((char *)v26, v7);
          (*v34)(v26, v47, v11);
          (*v33)(v26, 0, 1, v11);
          a1._rawValue = rawValue;
          uint64_t v6 = v11;
          uint64_t v8 = v24;
        }
        else
        {
          (*v35)(v25, v7);
          uint64_t v8 = v24;
          if (v27((char *)v26, 1, v11))
          {
            (*v32)(v47, v11);
            sub_22D909390(v21, v12);
          }
          else
          {
            uint64_t v7 = (uint64_t)v24;
            v28 = v47;
            sub_22D90A860();

            sub_22D909390(v21, v12);
            v29 = v28;
            uint64_t v8 = v24;
            (*v32)(v29, v11);
          }
          a1._rawValue = rawValue;
          uint64_t v6 = v11;
        }
        uint64_t v4 = v44 + 1;
      }
      while (v45 != v38);
    }
  }
  swift_bridgeObjectRelease();
}

unint64_t sub_22D909908()
{
  unint64_t result = qword_26858D5A0;
  if (!qword_26858D5A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26858D5A0);
  }
  return result;
}

char *sub_22D909960(void *a1, char *a2)
{
  return CRCKMergeable.mergeableDeltas(for:)(a1, a2);
}

void sub_22D909978(Swift::OpaquePointer a1)
{
}

uint64_t getEnumTagSinglePayload for CRCKError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for CRCKError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x22D909A84);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D909AAC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CRCKError()
{
  return &type metadata for CRCKError;
}

uint64_t sub_22D909AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_22D909ACC()
{
  uint64_t result = sub_22D90A8A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D909B68(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v7 = *(void *)(v6 + 64);
  }
  else {
    size_t v7 = *(void *)(v6 + 64) + 1;
  }
  int v8 = *(_DWORD *)(v6 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    uint64_t v11 = *(void **)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = v11;
    id v12 = v11;
  }
  return a1;
}

void sub_22D909CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  uint64_t v5 = a1 + *(void *)(v4 + 64);
  if (!*(_DWORD *)(v4 + 84)) {
    ++v5;
  }
  uint64_t v6 = *(void **)((v5 + 7) & 0xFFFFFFFFFFFFFFF8);
}

void *sub_22D909DB0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    uint64_t v11 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  size_t v13 = v12 + 7;
  uint64_t v14 = (void *)(((unint64_t)a1 + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = *(void **)(((unint64_t)a2 + v13) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = v15;
  id v16 = v15;
  return a1;
}

void *sub_22D909ED8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v14 = v13 + 7;
  uint64_t v15 = (void **)(((unint64_t)a1 + v14) & 0xFFFFFFFFFFFFFFF8);
  id v16 = *(void **)(((unint64_t)a2 + v14) & 0xFFFFFFFFFFFFFFF8);
  id v17 = *v15;
  *uint64_t v15 = v16;
  id v18 = v16;

  return a1;
}

void *sub_22D90A088(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7) {
      size_t v9 = v8;
    }
    else {
      size_t v9 = v8 + 1;
    }
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    size_t v11 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v10 = v6 + 56;
    v11(a1, 0, 1, v5);
    int v7 = *(_DWORD *)(v10 + 28);
    size_t v8 = *(void *)(v10 + 8);
  }
  if (v7) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v8 + 1;
  }
  *(void *)(((unint64_t)a1 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)a2 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_22D90A1AC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1, v5);
  int v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    int v10 = *(_DWORD *)(v6 + 84);
    size_t v11 = *(void *)(v6 + 64);
  }
  if (v10) {
    size_t v12 = v11;
  }
  else {
    size_t v12 = v11 + 1;
  }
  memcpy(a1, a2, v12);
LABEL_12:
  if (*(_DWORD *)(v6 + 84)) {
    uint64_t v13 = *(void *)(v6 + 64);
  }
  else {
    uint64_t v13 = *(void *)(v6 + 64) + 1;
  }
  uint64_t v14 = v13 + 7;
  uint64_t v15 = (void **)(((unint64_t)a1 + v14) & 0xFFFFFFFFFFFFFFF8);
  id v16 = *v15;
  *uint64_t v15 = *(void **)(((unint64_t)a2 + v14) & 0xFFFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_22D90A358(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  int v5 = *(_DWORD *)(v4 + 84);
  if (v5) {
    unsigned int v6 = v5 - 1;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (!v5) {
    ++v8;
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    unsigned int v10 = a2 - v7;
    uint64_t v11 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v12 = 2;
    }
    else {
      unsigned int v12 = v10 + 1;
    }
    if (v12 >= 0x10000) {
      unsigned int v13 = 4;
    }
    else {
      unsigned int v13 = 2;
    }
    if (v12 < 0x100) {
      unsigned int v13 = 1;
    }
    if (v12 >= 2) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    switch(v14)
    {
      case 1:
        int v15 = *((unsigned __int8 *)a1 + v9);
        if (!v15) {
          break;
        }
        goto LABEL_27;
      case 2:
        int v15 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v15) {
          goto LABEL_27;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22D90A4E0);
      case 4:
        int v15 = *(_DWORD *)((char *)a1 + v9);
        if (!v15) {
          break;
        }
LABEL_27:
        int v17 = v15 - 1;
        if (v11)
        {
          int v17 = 0;
          LODWORD(v11) = *a1;
        }
        return v7 + (v11 | v17) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFF)
  {
    unint64_t v19 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v19 >= 0xFFFFFFFF) {
      LODWORD(v19) = -1;
    }
    return (v19 + 1);
  }
  else
  {
    unsigned int v18 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v18 >= 2) {
      return v18 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_22D90A4F4(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (!v8) {
    unsigned int v9 = 0;
  }
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = v9;
  }
  size_t v11 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (!v8) {
    ++v11;
  }
  size_t v12 = ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v10 < a3)
  {
    unsigned int v13 = a3 - v10;
    if (((v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      unsigned int v14 = v13 + 1;
    }
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v6 = v15;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v10)
  {
    if (((v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8) {
      int v16 = a2 - v10;
    }
    else {
      int v16 = 1;
    }
    if (((v11 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v17 = ~v10 + a2;
      bzero(a1, v12);
      *(_DWORD *)a1 = v17;
    }
    switch(v6)
    {
      case 1:
        a1[v12] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v16;
        return;
      case 3:
        goto LABEL_59;
      case 4:
        *(_DWORD *)&a1[v12] = v16;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_35;
    case 3:
LABEL_59:
      __break(1u);
      JUMPOUT(0x22D90A778);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_34;
    default:
LABEL_34:
      if (a2)
      {
LABEL_35:
        if (v9 < 0x7FFFFFFF)
        {
          uint64_t v21 = (void *)((unint64_t)&a1[v11 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0) {
            uint64_t v22 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v22 = a2 - 1;
          }
          *uint64_t v21 = v22;
        }
        else if (v9 >= a2)
        {
          uint64_t v23 = *(void (**)(void))(v7 + 56);
          v23();
        }
        else
        {
          if (v11 <= 3) {
            int v18 = ~(-1 << (8 * v11));
          }
          else {
            int v18 = -1;
          }
          if (v11)
          {
            int v19 = v18 & (~v9 + a2);
            if (v11 <= 3) {
              int v20 = v11;
            }
            else {
              int v20 = 4;
            }
            bzero(a1, v11);
            switch(v20)
            {
              case 2:
                *(_WORD *)a1 = v19;
                break;
              case 3:
                *(_WORD *)a1 = v19;
                a1[2] = BYTE2(v19);
                break;
              case 4:
                *(_DWORD *)a1 = v19;
                break;
              default:
                *a1 = v19;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22D90A7E0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_22D90A7F0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_22D90A800()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_22D90A810()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22D90A820()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22D90A830()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22D90A840()
{
  return MEMORY[0x270F17408]();
}

uint64_t sub_22D90A850()
{
  return MEMORY[0x270F17410]();
}

uint64_t sub_22D90A860()
{
  return MEMORY[0x270F17418]();
}

uint64_t sub_22D90A870()
{
  return MEMORY[0x270F17930]();
}

uint64_t sub_22D90A880()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22D90A890()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22D90A8A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22D90A8B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22D90A8C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22D90A8D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22D90A8E0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22D90A8F0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22D90A900()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22D90A910()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22D90A920()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22D90A930()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}