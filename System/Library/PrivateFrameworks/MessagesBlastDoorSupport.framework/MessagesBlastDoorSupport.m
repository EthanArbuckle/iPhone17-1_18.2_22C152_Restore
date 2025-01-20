id IMMultiFrameImageLogHandle()
{
  void *v0;
  uint64_t vars8;

  if (IMMultiFrameImageLogHandle_onceToken != -1) {
    dispatch_once(&IMMultiFrameImageLogHandle_onceToken, &__block_literal_global);
  }
  v0 = (void *)IMMultiFrameImageLogHandle_log;

  return v0;
}

void sub_1C518C3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __IMMultiFrameImageLogHandle_block_invoke()
{
  IMMultiFrameImageLogHandle_log = (uint64_t)os_log_create("com.apple.Messages", "IMMultiFrameImage");

  return MEMORY[0x1F41817F8]();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void type metadata accessor for BlastDoorInstanceType(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1C518C840(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1C518C860(uint64_t result, int a2, int a3)
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

void sub_1C518C89C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

BOOL sub_1C518C8E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C518C8F8()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C518C940()
{
  return sub_1C51C6BE8();
}

uint64_t sub_1C518C96C()
{
  return sub_1C51C6C08();
}

char *sub_1C518C9C0()
{
  uint64_t v3 = sub_1C51C65E8();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = sub_1C51AF9DC(7);
  if (!v0)
  {
    unint64_t v8 = v6;
    if ((v6 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      if (!v6) {
        return 0;
      }
      uint64_t v2 = sub_1C51AF750(4);
      if ((v2 & 0x8000000000000000) == 0)
      {
        uint64_t v9 = sub_1C51AF530(v8);
        uint64_t v1 = v9;
        unint64_t v8 = v10;
        if (!v2)
        {
          sub_1C518D19C(v9, v10);
          uint64_t v11 = v1;
          unint64_t v13 = v8;
          goto LABEL_12;
        }
        if (qword_1EA3D1278 == -1)
        {
LABEL_8:
          v18[1] = qword_1EA3D52C0;
          swift_bridgeObjectRetain();
          uint64_t v11 = LiteMessageCompressor.decode(_:codecID:)(v1, v8, v2);
          unint64_t v13 = v12;
          swift_bridgeObjectRelease();
          if (v13 >> 60 == 15)
          {
            sub_1C518D0F0();
            swift_allocError();
            *uint64_t v14 = 1;
            swift_willThrow();
            goto LABEL_15;
          }
LABEL_12:
          sub_1C51C65D8();
          uint64_t v15 = sub_1C51C65C8();
          if (v16)
          {
            v5 = (char *)v15;
            sub_1C518D144(v11, v13);
            sub_1C518D144(v1, v8);
            return v5;
          }
          sub_1C518D0F0();
          swift_allocError();
          unsigned char *v17 = 0;
          swift_willThrow();
          sub_1C518D144(v11, v13);
LABEL_15:
          sub_1C518D144(v1, v8);
          return v5;
        }
LABEL_18:
        swift_once();
        goto LABEL_8;
      }
    }
    __break(1u);
    goto LABEL_18;
  }
  return v5;
}

uint64_t sub_1C518CC00(uint64_t a1, uint64_t a2)
{
  return sub_1C518CF24(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1C518CC18(uint64_t a1, id *a2)
{
  uint64_t result = sub_1C51C6598();
  *a2 = 0;
  return result;
}

uint64_t sub_1C518CC90(uint64_t a1, id *a2)
{
  char v3 = sub_1C51C65A8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1C518CD10@<X0>(uint64_t *a1@<X8>)
{
  sub_1C51C65B8();
  uint64_t v2 = sub_1C51C6588();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C518CD54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1C51C6588();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1C518CD9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1C51C65B8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C518CDC8(uint64_t a1)
{
  uint64_t v2 = sub_1C518CEC8(&qword_1EA3D12B0);
  uint64_t v3 = sub_1C518CEC8(&qword_1EA3D12B8);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1C518CE60()
{
  return sub_1C518CEC8(&qword_1EA3D1298);
}

uint64_t sub_1C518CE94()
{
  return sub_1C518CEC8(&qword_1EA3D12A0);
}

uint64_t sub_1C518CEC8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BlastDoorInstanceType(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C518CF0C(uint64_t a1, uint64_t a2)
{
  return sub_1C518CF24(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1C518CF24(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1C51C65B8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C518CF68()
{
  sub_1C51C65B8();
  sub_1C51C6608();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C518CFBC()
{
  sub_1C51C65B8();
  sub_1C51C6BD8();
  sub_1C51C6608();
  uint64_t v0 = sub_1C51C6C08();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C518D030()
{
  uint64_t v0 = sub_1C51C65B8();
  uint64_t v2 = v1;
  if (v0 == sub_1C51C65B8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1C51C6B28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C518D0BC()
{
  return sub_1C518CEC8(&qword_1EA3D12A8);
}

unint64_t sub_1C518D0F0()
{
  unint64_t result = qword_1EA3D12C0;
  if (!qword_1EA3D12C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D12C0);
  }
  return result;
}

uint64_t sub_1C518D144(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C518D19C(uint64_t a1, unint64_t a2)
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BitIteratorMessageContentError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BitIteratorMessageContentError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C518D35CLL);
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

uint64_t sub_1C518D384(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1C518D390(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BitIteratorMessageContentError()
{
  return &type metadata for BitIteratorMessageContentError;
}

unint64_t sub_1C518D3AC()
{
  unint64_t result = qword_1EA3D12C8;
  if (!qword_1EA3D12C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D12C8);
  }
  return result;
}

id MessagesBlastDoorInterface.__allocating_init(with:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_1C51A3DCC(a1);

  return v4;
}

id MessagesBlastDoorInterface.init(with:)(void *a1)
{
  id v2 = sub_1C51A3DCC(a1);

  return v2;
}

void sub_1C518D4A8(uint64_t a1, void (*a2)(void *, void *), uint64_t a3, uint64_t (*a4)(void), uint64_t *a5)
{
  uint64_t v8 = a4(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v11 = (char *)&v16 - v10;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1F4188790]();
  unint64_t v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C51AD1BC(a1, (uint64_t)v13, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = (void *)*v13;
    MEMORY[0x1C878C630](*v13);
    a2(0, v14);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v9 + 32))(v11, v13, v8);
    uint64_t v15 = (void *)sub_1C51C5C48();
    a2(v15, 0);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1C518D678(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v60 = sub_1C51C6008();
  uint64_t v3 = *(void *)(v60 - 8);
  MEMORY[0x1F4188790]();
  v59 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1C51C5D98();
  uint64_t v55 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  v58 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C51C5F88();
  uint64_t v57 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16)
    || (unint64_t v10 = sub_1C51A3B90(0xD00000000000001DLL, 0x80000001C51C99F0), (v11 & 1) == 0)
    || (sub_1C51A4248(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v64),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    v36 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v64 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0);
    uint64_t v38 = sub_1C51C6378();
    uint64_t v40 = v39;
    *(void *)(v37 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v37 + 64) = sub_1C51A41F4();
    *(void *)(v37 + 32) = v38;
    *(void *)(v37 + 40) = v40;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
LABEL_34:
    sub_1C51C6948();
    __break(1u);
    JUMPOUT(0x1C518E14CLL);
  }
  uint64_t v12 = v63;
  uint64_t v13 = *(void *)(v63 + 16);
  uint64_t v56 = v3;
  if (v13)
  {
    unint64_t v14 = sub_1C51A3B90(17263, 0xE200000000000000);
    if (v15)
    {
      sub_1C51A4248(*(void *)(v12 + 56) + 32 * v14, (uint64_t)&v64);
      if (swift_dynamicCast())
      {
        uint64_t v16 = v1;
        unsigned __int8 v17 = v62;
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(void *)(v12 + 16) && (unint64_t v18 = sub_1C51A3B90(99, 0xE100000000000000), (v19 & 1) != 0))
  {
    sub_1C51A4248(*(void *)(v12 + 56) + 32 * v18, (uint64_t)&v64);
  }
  else
  {
    long long v64 = 0u;
    long long v65 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v65 + 1))
  {
    sub_1C51ACC90((uint64_t)&v64, &qword_1EBBD04A8);
    goto LABEL_33;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_33:
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    v49 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v64 = a1;
    uint64_t v51 = sub_1C51C6378();
    uint64_t v53 = v52;
    *(void *)(v50 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v50 + 64) = sub_1C51A41F4();
    *(void *)(v50 + 32) = v51;
    *(void *)(v50 + 40) = v53;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v16 = v1;
  unsigned __int8 v17 = v63;
LABEL_15:
  uint64_t v20 = sub_1C51BAB20(v17);
  if ((v20 & 0x100) != 0)
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    v41 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1C51C7CA0;
    LOWORD(v64) = v17;
    uint64_t v43 = sub_1C51C6378();
    uint64_t v45 = v44;
    *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v42 + 64) = sub_1C51A41F4();
    *(void *)(v42 + 32) = v43;
    *(void *)(v42 + 40) = v45;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  uint64_t v21 = v20;
  v22 = self;
  v23 = (void *)sub_1C51C6558();
  *(void *)&long long v64 = 0;
  id v24 = objc_msgSend(v22, sel_dataWithPropertyList_format_options_error_, v23, 200, 0, &v64);

  id v25 = (id)v64;
  if (!v24)
  {
    v46 = v25;
    v47 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    v48 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    goto LABEL_34;
  }
  uint64_t v26 = sub_1C51C5998();
  unint64_t v28 = v27;

  id v29 = objc_msgSend(self, sel_standardUserDefaults);
  char v30 = NSUserDefaults.isMessagesLockdownModeEnabled.getter();

  if (v30)
  {
    switch((char)v21)
    {
      case 'd':
        uint64_t v31 = *(void *)(v61 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
        sub_1C51AD25C(&qword_1EA3D12E0, MEMORY[0x1E4F50788]);
        v33 = v59;
        uint64_t v32 = v60;
        sub_1C51C5C18();
        if (!v16)
        {
          uint64_t v31 = sub_1C51C5C48();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v32);
        }
        break;
      case 'e':
      case 'p':
        uint64_t v31 = *(void *)(v61 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
        sub_1C51AD25C(&qword_1EBBD03D8, MEMORY[0x1E4F50748]);
        sub_1C51C5C18();
        if (!v16)
        {
          uint64_t v31 = sub_1C51C5C48();
          (*(void (**)(char *, uint64_t))(v57 + 8))(v9, v7);
        }
        break;
      case 'f':
        uint64_t v31 = *(void *)(v61 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
        sub_1C51AD25C(&qword_1EA3D11B0, MEMORY[0x1E4F50610]);
        v34 = v58;
        sub_1C51C5C18();
        if (!v16)
        {
          uint64_t v31 = sub_1C51C5C48();
          (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v5);
        }
        break;
      default:
        *(void *)&long long v64 = 0;
        *((void *)&v64 + 1) = 0xE000000000000000;
        LOBYTE(v63) = v21;
        sub_1C51C6928();
        uint64_t v31 = *((void *)&v64 + 1);
        sub_1C51C6528();
        sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
        swift_allocError();
        sub_1C51C6518();
        swift_willThrow();
        break;
    }
    sub_1C518D144(v26, v28);
  }
  else
  {
    uint64_t v31 = sub_1C518E180(v21, v61, v26, v28);
    sub_1C518D144(v26, v28);
  }
  return v31;
}

uint64_t sub_1C518E180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v92 = a4;
  uint64_t v90 = a2;
  uint64_t v91 = a3;
  uint64_t v89 = sub_1C51C6388();
  uint64_t v66 = *(void *)(v89 - 8);
  MEMORY[0x1F4188790]();
  v88 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_1C51C61D8();
  uint64_t v65 = *(void *)(v87 - 8);
  MEMORY[0x1F4188790]();
  v86 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_1C51C6298();
  uint64_t v64 = *(void *)(v85 - 8);
  MEMORY[0x1F4188790]();
  v84 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_1C51C6348();
  uint64_t v63 = *(void *)(v83 - 8);
  MEMORY[0x1F4188790]();
  v82 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_1C51C6148();
  uint64_t v62 = *(void *)(v81 - 8);
  MEMORY[0x1F4188790]();
  v80 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_1C51C6088();
  uint64_t v61 = *(void *)(v79 - 8);
  MEMORY[0x1F4188790]();
  v78 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_1C51C5DA8();
  uint64_t v60 = *(void *)(v77 - 8);
  MEMORY[0x1F4188790]();
  v76 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_1C51C6108();
  uint64_t v59 = *(void *)(v75 - 8);
  MEMORY[0x1F4188790]();
  v74 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_1C51C61C8();
  uint64_t v58 = *(void *)(v73 - 8);
  MEMORY[0x1F4188790]();
  v72 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1C51C61E8();
  uint64_t v57 = *(void *)(v71 - 8);
  MEMORY[0x1F4188790]();
  v70 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1C51C6078();
  uint64_t v56 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790]();
  v68 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_1C51C5F38();
  uint64_t v55 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v16 = (char *)v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1C51C5D98();
  uint64_t v54 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790]();
  char v19 = (char *)v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C51C6018();
  uint64_t v53 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790]();
  v22 = (char *)v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1C51C5F88();
  v52[1] = *(void *)(v23 - 8);
  MEMORY[0x1F4188790]();
  id v25 = (char *)v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1C51C5DB8();
  MEMORY[0x1F4188790]();
  char v30 = (char *)v52 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(v27)
  {
    case 100:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1198, MEMORY[0x1E4F50628]);
      id v25 = v76;
      uint64_t v23 = v77;
      uint64_t v32 = v93;
      sub_1C51C5C18();
      if (!v32)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v92;
        goto LABEL_33;
      }
      break;
    case 101:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EBBD03D8, MEMORY[0x1E4F50748]);
      uint64_t v34 = v93;
      sub_1C51C5C18();
      if (!v34)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = (uint64_t *)&v84;
        goto LABEL_33;
      }
      break;
    case 102:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D11B0, MEMORY[0x1E4F50610]);
      uint64_t v35 = v93;
      sub_1C51C5C18();
      if (!v35)
      {
        uint64_t v31 = sub_1C51C5C48();
        (*(void (**)(char *, uint64_t))(v54 + 8))(v19, v17);
      }
      break;
    case 105:
      uint64_t v36 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1330, MEMORY[0x1E4F506E0]);
      id v25 = v16;
      uint64_t v23 = v67;
      uint64_t v31 = v36;
      uint64_t v37 = v93;
      sub_1C51C5C18();
      if (!v37)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v87;
        goto LABEL_33;
      }
      break;
    case 111:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1328, MEMORY[0x1E4F507D0]);
      id v25 = v68;
      uint64_t v23 = v69;
      uint64_t v38 = v93;
      sub_1C51C5C18();
      if (!v38)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = (uint64_t *)&v88;
        goto LABEL_33;
      }
      break;
    case 112:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1320, MEMORY[0x1E4F50920]);
      id v25 = v70;
      uint64_t v23 = v71;
      uint64_t v39 = v93;
      sub_1C51C5C18();
      if (!v39)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v89;
        goto LABEL_33;
      }
      break;
    case 113:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1318, MEMORY[0x1E4F508F0]);
      id v25 = v72;
      uint64_t v23 = v73;
      uint64_t v40 = v93;
      sub_1C51C5C18();
      if (!v40)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v90;
        goto LABEL_33;
      }
      break;
    case 116:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1308, MEMORY[0x1E4F507E8]);
      id v25 = v78;
      uint64_t v23 = v79;
      uint64_t v41 = v93;
      sub_1C51C5C18();
      if (!v41)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v93;
        goto LABEL_33;
      }
      break;
    case 118:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1310, MEMORY[0x1E4F50810]);
      id v25 = v74;
      uint64_t v23 = v75;
      uint64_t v42 = v93;
      sub_1C51C5C18();
      if (!v42)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v91;
        goto LABEL_33;
      }
      break;
    case 119:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1300, MEMORY[0x1E4F50858]);
      id v25 = v80;
      uint64_t v23 = v81;
      uint64_t v43 = v93;
      sub_1C51C5C18();
      if (!v43)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v94;
        goto LABEL_33;
      }
      break;
    case 120:
      uint64_t v44 = v28;
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1340, MEMORY[0x1E4F50640]);
      uint64_t v45 = v93;
      sub_1C51C5C18();
      if (!v45)
      {
        uint64_t v31 = sub_1C51C5C48();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v30, v26);
      }
      break;
    case 122:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1540, MEMORY[0x1E4F50988]);
      id v25 = v84;
      uint64_t v23 = v85;
      uint64_t v46 = v93;
      sub_1C51C5C18();
      if (!v46)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = (uint64_t *)&v96;
        goto LABEL_33;
      }
      break;
    case -122:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D12F0, MEMORY[0x1E4F50908]);
      id v25 = v86;
      uint64_t v23 = v87;
      uint64_t v47 = v93;
      sub_1C51C5C18();
      if (!v47)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = &v97;
        goto LABEL_33;
      }
      break;
    case -121:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D12E8, MEMORY[0x1E4F50A08]);
      id v25 = v88;
      uint64_t v23 = v89;
      uint64_t v48 = v93;
      sub_1C51C5C18();
      if (!v48)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = (uint64_t *)v98;
        goto LABEL_33;
      }
      break;
    case -117:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D12F8, MEMORY[0x1E4F509F0]);
      id v25 = v82;
      uint64_t v23 = v83;
      uint64_t v49 = v93;
      sub_1C51C5C18();
      if (!v49)
      {
        uint64_t v31 = sub_1C51C5C48();
        v33 = (uint64_t *)&v95;
LABEL_33:
        (*(void (**)(char *, uint64_t))(*(v33 - 32) + 8))(v25, v23);
      }
      break;
    case -86:
      uint64_t v31 = *(void *)(v90 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
      sub_1C51AD25C(&qword_1EA3D1338, MEMORY[0x1E4F507A0]);
      uint64_t v50 = v93;
      sub_1C51C5C18();
      if (!v50)
      {
        uint64_t v31 = sub_1C51C5C48();
        (*(void (**)(char *, uint64_t))(v53 + 8))(v22, v20);
      }
      break;
    default:
      uint64_t v94 = 0;
      unint64_t v95 = 0xE000000000000000;
      v98[7] = v27;
      sub_1C51C6928();
      uint64_t v31 = v95;
      sub_1C51C6528();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      swift_allocError();
      sub_1C51C6518();
      swift_willThrow();
      break;
  }
  return v31;
}

uint64_t sub_1C518F580(uint64_t a1, void (*a2)(uint64_t, void, void *), uint64_t a3)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C51C6528();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = &v78[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(void *)(a1 + 16)
    || (unint64_t v10 = sub_1C51A3B90(0xD00000000000001DLL, 0x80000001C51C99F0), (v11 & 1) == 0)
    || (sub_1C51A4248(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v80),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v60 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v61 = swift_allocObject();
    *(_OWORD *)(v61 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v80 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0);
    uint64_t v62 = sub_1C51C6378();
    uint64_t v64 = v63;
    *(void *)(v61 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v61 + 64) = sub_1C51A41F4();
    *(void *)(v61 + 32) = v62;
    *(void *)(v61 + 40) = v64;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
LABEL_41:
    sub_1C51C6948();
    __break(1u);
    JUMPOUT(0x1C51908E4);
  }
  uint64_t v12 = v79;
  if (*(void *)(v79 + 16))
  {
    unint64_t v13 = sub_1C51A3B90(17263, 0xE200000000000000);
    if (v14)
    {
      sub_1C51A4248(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v80);
      if (swift_dynamicCast())
      {
        unsigned __int8 v15 = v78[15];
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(void *)(v12 + 16) && (unint64_t v16 = sub_1C51A3B90(99, 0xE100000000000000), (v17 & 1) != 0))
  {
    sub_1C51A4248(*(void *)(v12 + 56) + 32 * v16, (uint64_t)&v80);
  }
  else
  {
    long long v80 = 0u;
    long long v81 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v81 + 1))
  {
    sub_1C51ACC90((uint64_t)&v80, &qword_1EBBD04A8);
    goto LABEL_40;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_40:
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v73 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v80 = a1;
    uint64_t v75 = sub_1C51C6378();
    uint64_t v77 = v76;
    *(void *)(v74 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v74 + 64) = sub_1C51A41F4();
    *(void *)(v74 + 32) = v75;
    *(void *)(v74 + 40) = v77;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  unsigned __int8 v15 = v79;
LABEL_15:
  uint64_t v18 = sub_1C51BAB20(v15);
  if ((v18 & 0x100) != 0)
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v65 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v66 = swift_allocObject();
    *(_OWORD *)(v66 + 16) = xmmword_1C51C7CA0;
    LOWORD(v80) = v15;
    uint64_t v67 = sub_1C51C6378();
    uint64_t v69 = v68;
    *(void *)(v66 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v66 + 64) = sub_1C51A41F4();
    *(void *)(v66 + 32) = v67;
    *(void *)(v66 + 40) = v69;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  uint64_t v19 = v18;
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_1C51C6558();
  *(void *)&long long v80 = 0;
  id v22 = objc_msgSend(v20, sel_dataWithPropertyList_format_options_error_, v21, 200, 0, &v80);

  id v23 = (id)v80;
  if (!v22)
  {
    v70 = v23;
    uint64_t v71 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    v72 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    goto LABEL_41;
  }
  uint64_t v24 = sub_1C51C5998();
  unint64_t v26 = v25;

  switch((char)v19)
  {
    case 100:
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = a2;
      *(void *)(v27 + 24) = a3;
      *(unsigned char *)(v27 + 32) = 100;
      sub_1C51C5DA8();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = sub_1C51A42DC;
      *(void *)(v28 + 24) = v27;
      sub_1C51AD25C(&qword_1EA3D1198, MEMORY[0x1E4F50628]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 101:
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = a2;
      *(void *)(v44 + 24) = a3;
      *(unsigned char *)(v44 + 32) = 101;
      sub_1C51C5F88();
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = sub_1C51A42DC;
      *(void *)(v45 + 24) = v44;
      sub_1C51AD25C(&qword_1EBBD03D8, MEMORY[0x1E4F50748]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 102:
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = a2;
      *(void *)(v33 + 24) = a3;
      *(unsigned char *)(v33 + 32) = 102;
      sub_1C51C5D98();
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = sub_1C51A42DC;
      *(void *)(v34 + 24) = v33;
      sub_1C51AD25C(&qword_1EA3D11B0, MEMORY[0x1E4F50610]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 105:
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = a2;
      *(void *)(v50 + 24) = a3;
      *(unsigned char *)(v50 + 32) = 105;
      sub_1C51C5F38();
      uint64_t v51 = swift_allocObject();
      *(void *)(v51 + 16) = sub_1C51A42DC;
      *(void *)(v51 + 24) = v50;
      sub_1C51AD25C(&qword_1EA3D1330, MEMORY[0x1E4F506E0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 111:
      uint64_t v52 = swift_allocObject();
      *(void *)(v52 + 16) = a2;
      *(void *)(v52 + 24) = a3;
      *(unsigned char *)(v52 + 32) = 111;
      sub_1C51C6078();
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = sub_1C51A42DC;
      *(void *)(v53 + 24) = v52;
      sub_1C51AD25C(&qword_1EA3D1328, MEMORY[0x1E4F507D0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 112:
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = a2;
      *(void *)(v35 + 24) = a3;
      *(unsigned char *)(v35 + 32) = 112;
      sub_1C51C61E8();
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = sub_1C51A42DC;
      *(void *)(v36 + 24) = v35;
      sub_1C51AD25C(&qword_1EA3D1320, MEMORY[0x1E4F50920]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 113:
      uint64_t v46 = swift_allocObject();
      *(void *)(v46 + 16) = a2;
      *(void *)(v46 + 24) = a3;
      *(unsigned char *)(v46 + 32) = 113;
      sub_1C51C61C8();
      uint64_t v47 = swift_allocObject();
      *(void *)(v47 + 16) = sub_1C51A42DC;
      *(void *)(v47 + 24) = v46;
      sub_1C51AD25C(&qword_1EA3D1318, MEMORY[0x1E4F508F0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 116:
      uint64_t v48 = swift_allocObject();
      *(void *)(v48 + 16) = a2;
      *(void *)(v48 + 24) = a3;
      *(unsigned char *)(v48 + 32) = 116;
      sub_1C51C6088();
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = sub_1C51A42DC;
      *(void *)(v49 + 24) = v48;
      sub_1C51AD25C(&qword_1EA3D1308, MEMORY[0x1E4F507E8]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 118:
      uint64_t v58 = swift_allocObject();
      *(void *)(v58 + 16) = a2;
      *(void *)(v58 + 24) = a3;
      *(unsigned char *)(v58 + 32) = 118;
      sub_1C51C6108();
      uint64_t v59 = swift_allocObject();
      *(void *)(v59 + 16) = sub_1C51A42DC;
      *(void *)(v59 + 24) = v58;
      sub_1C51AD25C(&qword_1EA3D1310, MEMORY[0x1E4F50810]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 119:
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = a2;
      *(void *)(v54 + 24) = a3;
      *(unsigned char *)(v54 + 32) = 119;
      sub_1C51C6148();
      uint64_t v55 = swift_allocObject();
      *(void *)(v55 + 16) = sub_1C51A42DC;
      *(void *)(v55 + 24) = v54;
      sub_1C51AD25C(&qword_1EA3D1300, MEMORY[0x1E4F50858]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 120:
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = a2;
      *(void *)(v31 + 24) = a3;
      *(unsigned char *)(v31 + 32) = 120;
      sub_1C51C5DB8();
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = sub_1C51A42DC;
      *(void *)(v32 + 24) = v31;
      sub_1C51AD25C(&qword_1EA3D1340, MEMORY[0x1E4F50640]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -122:
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = a2;
      *(void *)(v42 + 24) = a3;
      *(unsigned char *)(v42 + 32) = -122;
      sub_1C51C61D8();
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = sub_1C51A42DC;
      *(void *)(v43 + 24) = v42;
      sub_1C51AD25C(&qword_1EA3D12F0, MEMORY[0x1E4F50908]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -121:
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = a2;
      *(void *)(v37 + 24) = a3;
      *(unsigned char *)(v37 + 32) = -121;
      sub_1C51C6388();
      uint64_t v38 = swift_allocObject();
      *(void *)(v38 + 16) = sub_1C51A42DC;
      *(void *)(v38 + 24) = v37;
      sub_1C51AD25C(&qword_1EA3D12E8, MEMORY[0x1E4F50A08]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -117:
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = a2;
      *(void *)(v29 + 24) = a3;
      *(unsigned char *)(v29 + 32) = -117;
      sub_1C51C6348();
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = sub_1C51A42DC;
      *(void *)(v30 + 24) = v29;
      sub_1C51AD25C(&qword_1EA3D12F8, MEMORY[0x1E4F509F0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case -86:
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = a2;
      *(void *)(v56 + 24) = a3;
      *(unsigned char *)(v56 + 32) = -86;
      sub_1C51C6018();
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = sub_1C51A42DC;
      *(void *)(v57 + 24) = v56;
      sub_1C51AD25C(&qword_1EA3D1338, MEMORY[0x1E4F507A0]);
      swift_retain();
      swift_retain();
LABEL_34:
      sub_1C51C5C08();
      swift_release();
      sub_1C518D144(v24, v26);
      uint64_t result = swift_release();
      break;
    default:
      *(void *)&long long v80 = 0;
      *((void *)&v80 + 1) = 0xE000000000000000;
      LOBYTE(v79) = v19;
      sub_1C51C6928();
      sub_1C51C6518();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      uint64_t v39 = (void *)swift_allocError();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(v40, v9, v6);
      a2(v19, 0, v39);
      sub_1C518D144(v24, v26);

      uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
      break;
  }
  return result;
}

void sub_1C5190A18(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v7 = sub_1C51C58A8();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  (*(void (**)(uint64_t, void, uint64_t))(a4 + 16))(a4, a1, a2);
}

uint64_t sub_1C5190A98(uint64_t a1, void (*a2)(uint64_t, void, void *), uint64_t a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1C51C6528();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v9 = &v54[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!*(void *)(a1 + 16)
    || (unint64_t v10 = sub_1C51A3B90(0xD00000000000001DLL, 0x80000001C51C99F0), (v11 & 1) == 0)
    || (sub_1C51A4248(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v56),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0),
        (swift_dynamicCast() & 1) == 0))
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v36 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v56 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0);
    uint64_t v38 = sub_1C51C6378();
    uint64_t v40 = v39;
    *(void *)(v37 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v37 + 64) = sub_1C51A41F4();
    *(void *)(v37 + 32) = v38;
    *(void *)(v37 + 40) = v40;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
LABEL_29:
    sub_1C51C6948();
    __break(1u);
    JUMPOUT(0x1C51914C0);
  }
  uint64_t v12 = v55;
  if (*(void *)(v55 + 16))
  {
    unint64_t v13 = sub_1C51A3B90(17263, 0xE200000000000000);
    if (v14)
    {
      sub_1C51A4248(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v56);
      if (swift_dynamicCast())
      {
        unsigned __int8 v15 = v54[15];
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(void *)(v12 + 16) && (unint64_t v16 = sub_1C51A3B90(99, 0xE100000000000000), (v17 & 1) != 0))
  {
    sub_1C51A4248(*(void *)(v12 + 56) + 32 * v16, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v57 + 1))
  {
    sub_1C51ACC90((uint64_t)&v56, &qword_1EBBD04A8);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v49 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v56 = a1;
    uint64_t v51 = sub_1C51C6378();
    uint64_t v53 = v52;
    *(void *)(v50 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v50 + 64) = sub_1C51A41F4();
    *(void *)(v50 + 32) = v51;
    *(void *)(v50 + 40) = v53;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  unsigned __int8 v15 = v55;
LABEL_15:
  uint64_t v18 = sub_1C51BAB20(v15);
  if ((v18 & 0x100) != 0)
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v41 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_1C51C7CA0;
    LOWORD(v56) = v15;
    uint64_t v43 = sub_1C51C6378();
    uint64_t v45 = v44;
    *(void *)(v42 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v42 + 64) = sub_1C51A41F4();
    *(void *)(v42 + 32) = v43;
    *(void *)(v42 + 40) = v45;
    sub_1C51C5A48();

    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  uint64_t v19 = v18;
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_1C51C6558();
  *(void *)&long long v56 = 0;
  id v22 = objc_msgSend(v20, sel_dataWithPropertyList_format_options_error_, v21, 200, 0, &v56);

  id v23 = (id)v56;
  if (!v22)
  {
    uint64_t v46 = v23;
    uint64_t v47 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v48 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    goto LABEL_29;
  }
  uint64_t v24 = sub_1C51C5998();
  unint64_t v26 = v25;

  switch((char)v19)
  {
    case 'd':
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = a2;
      *(void *)(v29 + 24) = a3;
      *(unsigned char *)(v29 + 32) = 100;
      sub_1C51C6008();
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = sub_1C51A42DC;
      *(void *)(v30 + 24) = v29;
      sub_1C51AD25C(&qword_1EA3D12E0, MEMORY[0x1E4F50788]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'e':
    case 'p':
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = a2;
      *(void *)(v27 + 24) = a3;
      sub_1C51C5F88();
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = sub_1C51A4718;
      *(void *)(v28 + 24) = v27;
      sub_1C51AD25C(&qword_1EBBD03D8, MEMORY[0x1E4F50748]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'f':
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = a2;
      *(void *)(v31 + 24) = a3;
      *(unsigned char *)(v31 + 32) = 102;
      sub_1C51C5D98();
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = sub_1C51A42DC;
      *(void *)(v32 + 24) = v31;
      sub_1C51AD25C(&qword_1EA3D11B0, MEMORY[0x1E4F50610]);
      swift_retain();
      swift_retain();
LABEL_21:
      sub_1C51C5C08();
      swift_release();
      sub_1C518D144(v24, v26);
      uint64_t result = swift_release();
      break;
    default:
      *(void *)&long long v56 = 0;
      *((void *)&v56 + 1) = 0xE000000000000000;
      LOBYTE(v55) = v19;
      sub_1C51C6928();
      sub_1C51C6518();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      uint64_t v34 = (void *)swift_allocError();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v7 + 16))(v35, v9, v6);
      a2(v19, 0, v34);
      sub_1C518D144(v24, v26);

      uint64_t result = (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
      break;
  }
  return result;
}

uint64_t sub_1C519150C(void *a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, id, void *))
{
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = sub_1C51C6568();
  _Block_copy(v7);
  id v9 = a1;
  a5(v8, v9, v7);
  _Block_release(v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C51915BC()
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = sub_1C51C5CF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  uint64_t v7 = (void *)sub_1C51C6558();
  v18[0] = 0;
  id v8 = objc_msgSend(v6, sel_dataWithPropertyList_format_options_error_, v7, 200, 0, v18);

  id v9 = v18[0];
  if (v8)
  {
    uint64_t v10 = sub_1C51C5998();
    unint64_t v12 = v11;

    uint64_t v13 = *(void *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
    sub_1C51AD25C(&qword_1EA3D11C0, MEMORY[0x1E4F505B8]);
    sub_1C51C5C18();
    if (!v1)
    {
      uint64_t v13 = sub_1C51C5C48();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    sub_1C518D144(v10, v12);
    return v13;
  }
  else
  {
    unsigned __int8 v15 = v9;
    unint64_t v16 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    char v17 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    uint64_t result = sub_1C51C6948();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C51918D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_1C51C6558();
  v18[0] = 0;
  id v7 = objc_msgSend(v5, sel_dataWithPropertyList_format_options_error_, v6, 200, 0, v18);

  id v8 = v18[0];
  if (v7)
  {
    uint64_t v9 = sub_1C51C5998();
    unint64_t v11 = v10;

    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a3;
    sub_1C51C5CF8();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_1C51A474C;
    *(void *)(v13 + 24) = v12;
    sub_1C51AD25C(&qword_1EA3D11C0, MEMORY[0x1E4F505B8]);
    swift_retain();
    swift_retain();
    sub_1C51C5C08();
    swift_release();
    swift_release();
    return sub_1C518D144(v9, v11);
  }
  else
  {
    unsigned __int8 v15 = v8;
    unint64_t v16 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    char v17 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    uint64_t result = sub_1C51C6948();
    __break(1u);
  }
  return result;
}

uint64_t sub_1C5191BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v6 = sub_1C51C6248();
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  MEMORY[0x1F4188790]();
  id v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_1C51C6268();
  uint64_t v24 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v27 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C51C6738();
  sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
  unint64_t v11 = (void *)sub_1C51C67C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C51C7CA0;
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v13 = MEMORY[0x1E4FBB1A0];
  uint64_t v14 = sub_1C51C6378();
  uint64_t v16 = v15;
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = sub_1C51A41F4();
  *(void *)(v12 + 32) = v14;
  *(void *)(v12 + 40) = v16;
  sub_1C51C5A48();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v17 = v33;
  sub_1C51C6238();
  if (!v17)
  {
    uint64_t v19 = v24;
    uint64_t v18 = v25;
    uint64_t v20 = v26;
    sub_1C51AD25C(&qword_1EA3D1348, MEMORY[0x1E4F50960]);
    uint64_t v21 = v27;
    uint64_t v22 = v30;
    sub_1C51C5BE8();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v20);
    uint64_t v10 = sub_1C51C6258();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v22);
  }
  return v10;
}

uint64_t sub_1C5191FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  v20[1] = a1;
  v20[2] = a2;
  uint64_t v8 = sub_1C51C6248();
  uint64_t v21 = *(void *)(v8 - 8);
  uint64_t v22 = v8;
  MEMORY[0x1F4188790]();
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C6738();
  sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
  unint64_t v11 = (void *)sub_1C51C67C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1C51C7CA0;
  uint64_t v25 = a3;
  uint64_t v26 = a4;
  uint64_t v13 = MEMORY[0x1E4FBB1A0];
  uint64_t v14 = sub_1C51C6378();
  uint64_t v16 = v15;
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = sub_1C51A41F4();
  *(void *)(v12 + 32) = v14;
  *(void *)(v12 + 40) = v16;
  sub_1C51C5A48();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C51C6238();
  sub_1C51C6268();
  uint64_t v17 = swift_allocObject();
  uint64_t v18 = v24;
  *(void *)(v17 + 16) = v23;
  *(void *)(v17 + 24) = v18;
  sub_1C51AD25C(&qword_1EA3D1348, MEMORY[0x1E4F50960]);
  swift_retain();
  sub_1C51C5BC8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v10, v22);
}

uint64_t sub_1C5192358(uint64_t a1, uint64_t a2, char a3, void (*a4)(void, void *), uint64_t a5)
{
  uint64_t v8 = sub_1C51C6528();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790]();
  unint64_t v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a3 == 1)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a4;
    *(void *)(v14 + 24) = a5;
    sub_1C51C5F48();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_1C51AD34C;
    *(void *)(v15 + 24) = v14;
    sub_1C51AD25C(&qword_1EA3D1350, MEMORY[0x1E4F50710]);
    swift_retain();
    swift_retain();
  }
  else
  {
    if (a3)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      v19[15] = a3;
      sub_1C51C6928();
      sub_1C51C6518();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      uint64_t v17 = (void *)swift_allocError();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v9 + 16))(v18, v11, v8);
      a4(0, v17);

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    }
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a4;
    *(void *)(v12 + 24) = a5;
    sub_1C51C6178();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_1C51AD34C;
    *(void *)(v13 + 24) = v12;
    sub_1C51AD25C(&qword_1EA3D1358, MEMORY[0x1E4F508A0]);
    swift_retain();
    swift_retain();
  }
  sub_1C51C5C08();
  swift_release();

  return swift_release();
}

uint64_t sub_1C5192818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a3;
  uint64_t v4 = sub_1C51C5F18();
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C51C63F8();
  uint64_t v22 = *(void *)(v7 - 8);
  uint64_t v23 = v7;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0480);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C51C6468();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v21 - v17;
  sub_1C51C5918();
  sub_1C51C6428();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v11, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  sub_1C51C63E8();
  sub_1C51C5F08();
  sub_1C51C5F28();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = v26;
  sub_1C51AD25C(&qword_1EBBD0458, MEMORY[0x1E4F506C8]);
  swift_retain();
  sub_1C51C5BD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v25);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

void sub_1C5192D14(uint64_t a1, void (*a2)(void *, void *), uint64_t a3, uint64_t (*a4)(void), uint64_t *a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v10 = a4(0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v13 = (char *)&v19 - v12;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x1F4188790]();
  uint64_t v15 = (uint64_t *)((char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C51AD1BC(a1, (uint64_t)v15, a5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = (void *)*v15;
    MEMORY[0x1C878C630](*v15);
    a2(0, v16);
  }
  else
  {
    uint64_t v17 = (*(uint64_t (**)(char *, void *, uint64_t))(v11 + 32))(v13, v15, v10);
    uint64_t v18 = (void *)a6(v17);
    a2(v18, 0);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

void sub_1C5192FF8(uint64_t a1, void (*a2)(void, char *), uint64_t a3)
{
}

uint64_t sub_1C5193134(uint64_t a1)
{
  uint64_t v333 = sub_1C51C64A8();
  uint64_t v332 = *(void *)(v333 - 8);
  MEMORY[0x1F4188790](v333);
  v331 = (char *)&v298 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v345 = sub_1C51C5CE8();
  uint64_t v346 = *(void *)(v345 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v345);
  v324 = (char *)&v298 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  v329 = (char *)&v298 - v7;
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  v337 = (char *)&v298 - v9;
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  v328 = (char *)&v298 - v11;
  MEMORY[0x1F4188790](v10);
  v342 = (char *)&v298 - v12;
  uint64_t v335 = sub_1C51C5AB8();
  uint64_t v334 = *(void *)(v335 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v335);
  v323 = (char *)&v298 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v310 = (char *)&v298 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  v314 = (char *)&v298 - v18;
  MEMORY[0x1F4188790](v17);
  v325 = (char *)&v298 - v19;
  uint64_t v20 = sub_1C51C5CC8();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v352 = v20;
  uint64_t v353 = v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  v344 = (char *)&v298 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  v339 = (char *)&v298 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  v338 = (char *)&v298 - v27;
  MEMORY[0x1F4188790](v26);
  v357 = (char *)&v298 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0478);
  uint64_t v30 = MEMORY[0x1F4188790](v29 - 8);
  v311 = (char *)&v298 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  v317 = (char *)&v298 - v33;
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  v315 = (char *)&v298 - v35;
  uint64_t v36 = MEMORY[0x1F4188790](v34);
  v326 = (void (*)(char *, char *, uint64_t))((char *)&v298 - v37);
  MEMORY[0x1F4188790](v36);
  v336 = (char *)&v298 - v38;
  uint64_t v39 = sub_1C51C5A78();
  uint64_t v366 = *(void *)(v39 - 8);
  uint64_t v367 = v39;
  uint64_t v40 = MEMORY[0x1F4188790](v39);
  v341 = (char *)&v298 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = MEMORY[0x1F4188790](v40);
  v319 = (char *)&v298 - v43;
  uint64_t v44 = MEMORY[0x1F4188790](v42);
  v320 = (char *)&v298 - v45;
  uint64_t v46 = MEMORY[0x1F4188790](v44);
  v322 = (char *)&v298 - v47;
  uint64_t v48 = MEMORY[0x1F4188790](v46);
  v330 = (char *)&v298 - v49;
  uint64_t v50 = MEMORY[0x1F4188790](v48);
  v321 = (char *)&v298 - v51;
  uint64_t v52 = MEMORY[0x1F4188790](v50);
  v327 = (char *)&v298 - v53;
  uint64_t v54 = MEMORY[0x1F4188790](v52);
  long long v56 = (char *)&v298 - v55;
  uint64_t v57 = MEMORY[0x1F4188790](v54);
  v351 = (char *)&v298 - v58;
  uint64_t v59 = MEMORY[0x1F4188790](v57);
  v343 = (char *)&v298 - v60;
  uint64_t v61 = MEMORY[0x1F4188790](v59);
  v355 = (char *)&v298 - v62;
  uint64_t v63 = MEMORY[0x1F4188790](v61);
  v347 = (char *)&v298 - v64;
  MEMORY[0x1F4188790](v63);
  v356 = (char *)&v298 - v65;
  uint64_t v66 = sub_1C51C5AA8();
  uint64_t v349 = *(void *)(v66 - 8);
  uint64_t v350 = v66;
  MEMORY[0x1F4188790](v66);
  v365 = (char *)&v298 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1C51C5F28();
  uint64_t v364 = *(void *)(v68 - 8);
  uint64_t v69 = MEMORY[0x1F4188790](v68);
  v309 = (char *)&v298 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = MEMORY[0x1F4188790](v69);
  v316 = (char *)&v298 - v72;
  uint64_t v73 = MEMORY[0x1F4188790](v71);
  v313 = (char *)&v298 - v74;
  uint64_t v75 = MEMORY[0x1F4188790](v73);
  v340 = ((char *)&v298 - v76);
  uint64_t v77 = MEMORY[0x1F4188790](v75);
  v348 = (char *)&v298 - v78;
  uint64_t v79 = MEMORY[0x1F4188790](v77);
  long long v81 = (char *)&v298 - v80;
  MEMORY[0x1F4188790](v79);
  uint64_t v83 = (char *)&v298 - v82;
  uint64_t v84 = sub_1C51C5F18();
  uint64_t v361 = *(void *)(v84 - 8);
  uint64_t v362 = v84;
  MEMORY[0x1F4188790](v84);
  v86 = (char *)&v298 - ((v85 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_1C51C6468();
  MEMORY[0x1F4188790](v87 - 8);
  uint64_t v88 = sub_1C51C63F8();
  uint64_t v359 = *(void *)(v88 - 8);
  uint64_t v360 = v88;
  MEMORY[0x1F4188790](v88);
  uint64_t v90 = (char *)&v298 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v312 = a1;
  sub_1C51C5918();
  sub_1C51C6428();
  if (v1)
  {
    swift_unexpectedError();
    __break(1u);
    goto LABEL_63;
  }
  sub_1C51C63E8();
  sub_1C51C5F08();
  uint64_t v91 = *(void *)&v363[OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd];
  sub_1C51AD25C(&qword_1EBBD0458, MEMORY[0x1E4F506C8]);
  v363 = v90;
  sub_1C51C5BF8();
  uint64_t v92 = v86;
  uint64_t v303 = v91;
  uint64_t v358 = 0;
  v302 = "ize top-level dictionary.";
  sub_1C51C5A98();
  sub_1C51C5A88();
  uint64_t v93 = v356;
  sub_1C51C5A58();
  uint64_t v94 = v364;
  unint64_t v95 = *(void (**)(char *, char *, uint64_t))(v364 + 16);
  v318 = v83;
  uint64_t v307 = v364 + 16;
  v306 = v95;
  v95(v81, v83, v68);
  char v96 = sub_1C51C5A88();
  int v97 = sub_1C51C67A8();
  char v98 = sub_1C51C67B8();
  uint64_t v354 = v68;
  v305 = v92;
  v304 = v56;
  if (v98)
  {
    LODWORD(v301) = v97;
    unint64_t v99 = (v366 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v308 = *(void (**)(char *, char *, uint64_t))(v366 + 16);
    v308(v347, v93, v367);
    v100 = (uint8_t *)swift_slowAlloc();
    uint64_t v300 = swift_slowAlloc();
    uint64_t v369 = v300;
    *(_DWORD *)v100 = 136315138;
    v101 = v336;
    sub_1C51C5EF8();
    uint64_t v102 = sub_1C51C5EE8();
    uint64_t v103 = *(void *)(v102 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v103 + 48))(v101, 1, v102) == 1)
    {
      uint64_t v104 = (uint64_t)v101;
      uint64_t v105 = 7104878;
      sub_1C51ACC90(v104, &qword_1EBBD0478);
      unint64_t v106 = 0xE300000000000000;
    }
    else
    {
      uint64_t v110 = sub_1C51C5ED8();
      v111 = v101;
      uint64_t v105 = v110;
      unint64_t v106 = v112;
      (*(void (**)(char *, uint64_t))(v103 + 8))(v111, v102);
    }
    uint64_t v368 = sub_1C51A3538(v105, v106, &v369);
    sub_1C51C6818();
    swift_bridgeObjectRelease();
    v336 = *(char **)(v364 + 8);
    ((void (*)(char *, uint64_t))v336)(v81, v354);
    v113 = v347;
    os_signpost_id_t v114 = sub_1C51C5A68();
    _os_signpost_emit_with_name_impl(&dword_1C5188000, v96, (os_signpost_type_t)v301, v114, "LargeImage.Context.init", "largeImageContextualInfo: %s", v100, 0xCu);
    uint64_t v115 = v300;
    swift_arrayDestroy();
    MEMORY[0x1C878C780](v115, -1, -1);
    MEMORY[0x1C878C780](v100, -1, -1);

    uint64_t v107 = v367;
    (*(void (**)(char *, uint64_t))(v366 + 8))(v113, v367);
    uint64_t v93 = v356;
    v109 = v357;
    v108 = v308;
    v308(v355, v356, v107);
  }
  else
  {

    v336 = *(char **)(v94 + 8);
    ((void (*)(char *, uint64_t))v336)(v81, v68);
    uint64_t v107 = v367;
    v108 = *(void (**)(char *, char *, uint64_t))(v366 + 16);
    unint64_t v99 = (v366 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v109 = v357;
    v108(v355, v93, v367);
  }
  uint64_t v116 = sub_1C51C5AE8();
  swift_allocObject();
  uint64_t v117 = sub_1C51C5AD8();
  v118 = v318;
  v306(v348, v318, v354);
  uint64_t v119 = v358;
  sub_1C51C5CA8();
  uint64_t v120 = (uint64_t)v93;
  uint64_t v121 = v353;
  uint64_t v358 = v119;
  if (v119)
  {
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v366 + 8))(v120, v107);
    (*(void (**)(char *, uint64_t))(v349 + 8))(v365, v350);
    ((void (*)(char *, uint64_t))v336)(v118, v354);
    uint64_t v123 = v361;
    uint64_t v122 = v362;
    v124 = v305;
    v125 = v363;
LABEL_35:
    (*(void (**)(char *, uint64_t))(v123 + 8))(v124, v122);
    (*(void (**)(char *, uint64_t))(v359 + 8))(v125, v360);
    return v120;
  }
  uint64_t v301 = v116;
  v308 = v108;
  v348 = (char *)v99;
  v126 = *(void (**)(const char *, char *, uint64_t))(v353 + 16);
  v127 = v338;
  uint64_t v128 = v352;
  v126(v338, v109, v352);
  v129 = v339;
  v299 = (void (*)(char *))v126;
  uint64_t v298 = v121 + 16;
  v126(v339, v109, v128);
  v130 = sub_1C51C5A88();
  v131 = v343;
  sub_1C51C5AC8();
  LODWORD(v347) = sub_1C51C6798();
  char v132 = sub_1C51C67B8();
  uint64_t v300 = v117;
  if (v132)
  {
    swift_retain();
    v133 = v325;
    sub_1C51C5AF8();
    swift_release();
    uint64_t v134 = v334;
    uint64_t v135 = v335;
    if ((*(unsigned int (**)(const char *, uint64_t))(v334 + 88))(v133, v335) == *MEMORY[0x1E4FBD340])
    {
      char v136 = 0;
      v325 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(const char *, uint64_t))(v134 + 8))(v133, v135);
      v325 = "bufferSize: %ld, vmAddress: %lu";
      char v136 = 2;
    }
    v140 = v355;
    v141 = v338;
    v308(v355, v343, v367);
    uint64_t v142 = swift_slowAlloc();
    *(unsigned char *)uint64_t v142 = 0;
    *(unsigned char *)(v142 + 1) = v136;
    *(_WORD *)(v142 + 2) = 2048;
    uint64_t v143 = sub_1C51C5C88();
    v144 = *(void (**)(const char *, uint64_t))(v121 + 8);
    v144(v141, v352);
    uint64_t v369 = v143;
    sub_1C51C6818();
    *(_WORD *)(v142 + 12) = 2048;
    v145 = v339;
    uint64_t v146 = sub_1C51C5CB8();
    v339 = (char *)v144;
    v144(v145, v352);
    uint64_t v369 = v146;
    sub_1C51C6818();
    os_signpost_id_t v147 = sub_1C51C5A68();
    _os_signpost_emit_with_name_impl(&dword_1C5188000, v130, (os_signpost_type_t)v347, v147, "LargeImage.Context.init", v325, (uint8_t *)v142, 0x16u);
    uint64_t v148 = v367;
    MEMORY[0x1C878C780](v142, -1, -1);

    v138 = *(void (**)(char *, uint64_t))(v366 + 8);
    v138(v343, v148);
    v138(v140, v148);
    v139 = v340;
  }
  else
  {
    v137 = *(void (**)(char *, uint64_t))(v121 + 8);
    v137(v129, v128);
    v339 = (char *)v137;
    v137((char *)v127, v128);

    v138 = *(void (**)(char *, uint64_t))(v366 + 8);
    v138(v131, v367);
    v139 = v340;
  }
  v299(v344);
  sub_1C51C5A88();
  v149 = v351;
  sub_1C51C5A58();
  uint64_t v150 = v354;
  v306((char *)v139, v318, v354);
  v151 = sub_1C51C5A88();
  os_signpost_type_t v152 = sub_1C51C67A8();
  char v153 = sub_1C51C67B8();
  v347 = (char *)v138;
  if (v153)
  {
    v308(v304, v149, v367);
    v154 = (uint8_t *)swift_slowAlloc();
    uint64_t v155 = swift_slowAlloc();
    uint64_t v369 = v155;
    *(_DWORD *)v154 = 136315138;
    uint64_t v156 = (uint64_t)v326;
    sub_1C51C5EF8();
    uint64_t v157 = sub_1C51C5EE8();
    uint64_t v158 = *(void *)(v157 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v158 + 48))(v156, 1, v157) == 1)
    {
      uint64_t v159 = 7104878;
      sub_1C51ACC90(v156, &qword_1EBBD0478);
      unint64_t v160 = 0xE300000000000000;
    }
    else
    {
      uint64_t v159 = sub_1C51C5ED8();
      unint64_t v160 = v164;
      (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v156, v157);
    }
    uint64_t v161 = v345;
    uint64_t v368 = sub_1C51A3538(v159, v160, &v369);
    sub_1C51C6818();
    swift_bridgeObjectRelease();
    ((void (*)(NSObject *, uint64_t))v336)(v340, v354);
    v165 = v304;
    os_signpost_id_t v166 = sub_1C51C5A68();
    _os_signpost_emit_with_name_impl(&dword_1C5188000, v151, v152, v166, "Unpack LargeImage", "largeImageContextualInfo: %s", v154, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C878C780](v155, -1, -1);
    MEMORY[0x1C878C780](v154, -1, -1);

    uint64_t v167 = v367;
    ((void (*)(char *, uint64_t))v347)(v165, v367);
    v162 = v337;
    v163 = v308;
    v308(v355, v351, v167);
  }
  else
  {

    ((void (*)(NSObject *, uint64_t))v336)(v139, v150);
    uint64_t v161 = v345;
    v162 = v337;
    v163 = v308;
    v308(v355, v351, v367);
  }
  swift_allocObject();
  uint64_t v168 = sub_1C51C5AD8();
  sub_1C51AD25C(&qword_1EBBD0468, MEMORY[0x1E4F505A0]);
  v169 = v342;
  uint64_t v170 = v358;
  sub_1C51C5BF8();
  uint64_t v171 = v346;
  uint64_t v358 = v170;
  if (v170)
  {
    v172 = v341;
  }
  else
  {
    v181 = *(void (**)(char *, char *, uint64_t))(v346 + 16);
    v182 = v328;
    v338 = (const char *)(v346 + 16);
    v326 = v181;
    v181(v328, v169, v161);
    v183 = sub_1C51C5A88();
    v184 = v327;
    sub_1C51C5AC8();
    LODWORD(v325) = sub_1C51C6798();
    char v185 = sub_1C51C67B8();
    v172 = v341;
    v343 = (char *)v168;
    if (v185)
    {
      v340 = v183;
      swift_retain();
      v186 = v314;
      sub_1C51C5AF8();
      swift_release();
      uint64_t v187 = v334;
      uint64_t v188 = v335;
      if ((*(unsigned int (**)(const char *, uint64_t))(v334 + 88))(v186, v335) == *MEMORY[0x1E4FBD340])
      {
        char v189 = 0;
        char v190 = 0;
        v314 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(const char *, uint64_t))(v187 + 8))(v186, v188);
        v314 = "result.metadata.largeImageContextualInfo: %s";
        char v190 = 2;
        char v189 = 1;
      }
      uint64_t v212 = v354;
      v211 = v326;
      v308(v321, v327, v367);
      uint64_t v213 = swift_slowAlloc();
      uint64_t v214 = swift_slowAlloc();
      uint64_t v369 = v214;
      *(unsigned char *)uint64_t v213 = v190;
      *(unsigned char *)(v213 + 1) = v189;
      *(_WORD *)(v213 + 2) = 2080;
      v215 = v313;
      sub_1C51C5CD8();
      uint64_t v216 = (uint64_t)v315;
      sub_1C51C5EF8();
      ((void (*)(char *, uint64_t))v336)(v215, v212);
      uint64_t v217 = sub_1C51C5EE8();
      uint64_t v218 = *(void *)(v217 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v218 + 48))(v216, 1, v217) == 1)
      {
        uint64_t v219 = 7104878;
        sub_1C51ACC90(v216, &qword_1EBBD0478);
        unint64_t v220 = 0xE300000000000000;
      }
      else
      {
        uint64_t v219 = sub_1C51C5ED8();
        unint64_t v220 = v221;
        (*(void (**)(uint64_t, uint64_t))(v218 + 8))(v216, v217);
      }
      v222 = v340;
      uint64_t v368 = sub_1C51A3538(v219, v220, &v369);
      sub_1C51C6818();
      swift_bridgeObjectRelease();
      uint64_t v161 = v345;
      v340 = *(NSObject **)(v346 + 8);
      ((void (*)(char *, uint64_t))v340)(v328, v345);
      v223 = v321;
      os_signpost_id_t v224 = sub_1C51C5A68();
      _os_signpost_emit_with_name_impl(&dword_1C5188000, v222, (os_signpost_type_t)v325, v224, "Unpack LargeImage", v314, (uint8_t *)v213, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C878C780](v214, -1, -1);
      MEMORY[0x1C878C780](v213, -1, -1);

      uint64_t v225 = v367;
      v226 = (void (*)(char *, uint64_t))v347;
      ((void (*)(char *, uint64_t))v347)(v327, v367);
      v226(v223, v225);
      v162 = v337;
      v163 = v308;
      uint64_t v168 = (uint64_t)v343;
      v172 = v341;
      v210 = v330;
    }
    else
    {
      v340 = *(NSObject **)(v171 + 8);
      ((void (*)(char *, uint64_t))v340)(v182, v161);

      ((void (*)(char *, uint64_t))v347)(v184, v367);
      v210 = v330;
      v211 = v326;
      v163 = v308;
    }
    sub_1C51C5A88();
    sub_1C51C5A58();
    v211(v162, v342, v161);
    v227 = v210;
    v228 = sub_1C51C5A88();
    uint64_t v229 = v161;
    int v230 = sub_1C51C67A8();
    if (sub_1C51C67B8())
    {
      LODWORD(v328) = v230;
      v163(v322, v227, v367);
      v231 = (uint8_t *)swift_slowAlloc();
      uint64_t v232 = swift_slowAlloc();
      uint64_t v369 = v232;
      *(_DWORD *)v231 = 136315138;
      v233 = v316;
      sub_1C51C5CD8();
      v234 = v317;
      sub_1C51C5EF8();
      uint64_t v235 = (uint64_t)v234;
      ((void (*)(char *, uint64_t))v336)(v233, v354);
      uint64_t v236 = sub_1C51C5EE8();
      uint64_t v237 = *(void *)(v236 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v237 + 48))(v234, 1, v236) == 1)
      {
        uint64_t v238 = 7104878;
        sub_1C51ACC90(v235, &qword_1EBBD0478);
        unint64_t v239 = 0xE300000000000000;
      }
      else
      {
        v242 = v234;
        uint64_t v238 = sub_1C51C5ED8();
        unint64_t v239 = v243;
        (*(void (**)(char *, uint64_t))(v237 + 8))(v242, v236);
      }
      v244 = v341;
      uint64_t v168 = (uint64_t)v343;
      uint64_t v368 = sub_1C51A3538(v238, v239, &v369);
      sub_1C51C6818();
      swift_bridgeObjectRelease();
      uint64_t v240 = v345;
      ((void (*)(char *, uint64_t))v340)(v337, v345);
      v245 = v322;
      os_signpost_id_t v246 = sub_1C51C5A68();
      _os_signpost_emit_with_name_impl(&dword_1C5188000, v228, (os_signpost_type_t)v328, v246, "Copy MachImage", "result.metadata.largeImageContextualInfo: %s", v231, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C878C780](v232, -1, -1);
      MEMORY[0x1C878C780](v231, -1, -1);

      v247 = v245;
      uint64_t v241 = v367;
      ((void (*)(char *, uint64_t))v347)(v247, v367);
      v163 = v308;
      v172 = v244;
    }
    else
    {

      ((void (*)(char *, uint64_t))v340)(v162, v229);
      uint64_t v240 = v229;
      uint64_t v241 = v367;
    }
    v248 = v330;
    v163(v355, v330, v241);
    swift_allocObject();
    v337 = (char *)sub_1C51C5AD8();
    v249 = v342;
    v250 = v326;
    v326(v329, v342, v240);
    sub_1C51C5C68();
    uint64_t v251 = sub_1C51C6548();
    swift_release();
    if (v251)
    {
      v355 = (char *)v251;
      uint64_t v252 = v367;
      v253 = v324;
      uint64_t v254 = v345;
      v250(v324, v249, v345);
      v255 = sub_1C51C5A88();
      v256 = v320;
      sub_1C51C5AC8();
      int v257 = sub_1C51C6798();
      if (sub_1C51C67B8())
      {
        LODWORD(v341) = v257;
        swift_retain();
        v258 = v310;
        sub_1C51C5AF8();
        swift_release();
        uint64_t v259 = v334;
        uint64_t v260 = v335;
        int v261 = (*(uint64_t (**)(char *, uint64_t))(v334 + 88))(v258, v335);
        v262 = v329;
        if (v261 == *MEMORY[0x1E4FBD340])
        {
          char v263 = 0;
          char v264 = 0;
          v338 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v259 + 8))(v258, v260);
          v338 = "result.metadata.largeImageContextualInfo: %s";
          char v264 = 2;
          char v263 = 1;
        }
        uint64_t v267 = v354;
        v268 = v309;
        v308(v319, v256, v367);
        uint64_t v269 = swift_slowAlloc();
        uint64_t v270 = swift_slowAlloc();
        uint64_t v369 = v270;
        *(unsigned char *)uint64_t v269 = v264;
        *(unsigned char *)(v269 + 1) = v263;
        *(_WORD *)(v269 + 2) = 2080;
        sub_1C51C5CD8();
        v271 = v311;
        sub_1C51C5EF8();
        ((void (*)(char *, uint64_t))v336)(v268, v267);
        uint64_t v272 = sub_1C51C5EE8();
        uint64_t v273 = *(void *)(v272 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v273 + 48))(v271, 1, v272) == 1)
        {
          uint64_t v274 = (uint64_t)v271;
          uint64_t v275 = 7104878;
          sub_1C51ACC90(v274, &qword_1EBBD0478);
          unint64_t v276 = 0xE300000000000000;
        }
        else
        {
          uint64_t v277 = sub_1C51C5ED8();
          v278 = v271;
          uint64_t v275 = v277;
          unint64_t v276 = v279;
          (*(void (**)(char *, uint64_t))(v273 + 8))(v278, v272);
        }
        uint64_t v368 = sub_1C51A3538(v275, v276, &v369);
        sub_1C51C6818();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v340)(v324, v345);
        v280 = v319;
        os_signpost_id_t v281 = sub_1C51C5A68();
        _os_signpost_emit_with_name_impl(&dword_1C5188000, v255, (os_signpost_type_t)v341, v281, "Copy MachImage", v338, (uint8_t *)v269, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C878C780](v270, -1, -1);
        MEMORY[0x1C878C780](v269, -1, -1);

        uint64_t v282 = v367;
        v283 = (void (*)(char *, uint64_t))v347;
        ((void (*)(char *, uint64_t))v347)(v320, v367);
        v283(v280, v282);
      }
      else
      {
        ((void (*)(char *, uint64_t))v340)(v253, v254);

        ((void (*)(char *, uint64_t))v347)(v256, v252);
        v262 = v329;
      }
      swift_retain();
      sub_1C51C5C78();
      v284 = (ipc_space_t *)MEMORY[0x1E4F14960];
      uint64_t v285 = *MEMORY[0x1E4F14960];
      v286 = v344;
      uint64_t v287 = sub_1C51C5CB8();
      uint64_t v288 = sub_1C51C5C88();
      if ((v288 & 0x8000000000000000) == 0)
      {
        MEMORY[0x1C878C820](v285, v287, v288);
        ipc_space_t v289 = *v284;
        v290 = v331;
        sub_1C51C5C98();
        mach_port_name_t v291 = sub_1C51C6498();
        (*(void (**)(char *, uint64_t))(v332 + 8))(v290, v333);
        mach_port_deallocate(v289, v291);
        uint64_t v292 = v352;
        v353 += 8;
        v293 = (void (*)(char *, uint64_t))v339;
        ((void (*)(char *, uint64_t))v339)(v286, v352);
        uint64_t v120 = sub_1C51C5C58();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v294 = v345;
        v295 = v340;
        ((void (*)(char *, uint64_t))v340)(v262, v345);
        uint64_t v296 = v367;
        v297 = (void (*)(char *, uint64_t))v347;
        ((void (*)(char *, uint64_t))v347)(v330, v367);
        ((void (*)(char *, uint64_t))v295)(v342, v294);
        v297(v351, v296);
        v293(v357, v292);
        v297(v356, v296);
        (*(void (**)(char *, uint64_t))(v349 + 8))(v365, v350);
        ((void (*)(char *, uint64_t))v336)(v318, v354);
        (*(void (**)(char *, uint64_t))(v361 + 8))(v305, v362);
        (*(void (**)(char *, uint64_t))(v359 + 8))(v363, v360);
        return v120;
      }
      goto LABEL_63;
    }
    sub_1C51C5928();
    sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
    sub_1C51C6B18();
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    swift_allocError();
    sub_1C51C6518();
    swift_willThrow();
    swift_release();
    uint64_t v265 = v345;
    v266 = v340;
    ((void (*)(char *, uint64_t))v340)(v329, v345);
    ((void (*)(char *, uint64_t))v347)(v248, v367);
    ((void (*)(char *, uint64_t))v266)(v249, v265);
  }
  v173 = sub_1C51C5A88();
  sub_1C51C5AC8();
  os_signpost_type_t v174 = sub_1C51C6798();
  char v175 = sub_1C51C67B8();
  v125 = v363;
  if (v175)
  {
    swift_retain();
    v176 = (char *)v168;
    v177 = v323;
    sub_1C51C5AF8();
    v343 = v176;
    swift_release();
    uint64_t v178 = v334;
    uint64_t v179 = v335;
    if ((*(unsigned int (**)(char *, uint64_t))(v334 + 88))(v177, v335) == *MEMORY[0x1E4FBD340])
    {
      v180 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v178 + 8))(v177, v179);
      v180 = "error unpacking";
    }
    v191 = v355;
    v192 = v341;
    v163(v355, v341, v367);
    v193 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v193 = 0;
    os_signpost_id_t v194 = sub_1C51C5A68();
    _os_signpost_emit_with_name_impl(&dword_1C5188000, v173, v174, v194, "Unpack LargeImage", v180, v193, 2u);
    uint64_t v195 = v367;
    MEMORY[0x1C878C780](v193, -1, -1);

    v196 = (void (*)(char *, uint64_t))v347;
    ((void (*)(char *, uint64_t))v347)(v192, v195);
    v196(v191, v195);
  }
  else
  {

    ((void (*)(char *, uint64_t))v347)(v172, v367);
  }
  v197 = (ipc_space_t *)MEMORY[0x1E4F14960];
  uint64_t v198 = *MEMORY[0x1E4F14960];
  v199 = v344;
  uint64_t v200 = sub_1C51C5CB8();
  uint64_t v201 = sub_1C51C5C88();
  if ((v201 & 0x8000000000000000) == 0)
  {
    MEMORY[0x1C878C820](v198, v200, v201);
    ipc_space_t v202 = *v197;
    v203 = v331;
    sub_1C51C5C98();
    mach_port_name_t v204 = sub_1C51C6498();
    (*(void (**)(char *, uint64_t))(v332 + 8))(v203, v333);
    mach_port_deallocate(v202, v204);
    uint64_t v205 = v352;
    v206 = (void (*)(char *, uint64_t))v339;
    ((void (*)(char *, uint64_t))v339)(v199, v352);
    swift_willThrow();
    swift_release();
    swift_release();
    uint64_t v207 = v367;
    uint64_t v120 = v366 + 8;
    v208 = (void (*)(char *, uint64_t))v347;
    ((void (*)(char *, uint64_t))v347)(v351, v367);
    v206(v357, v205);
    v208(v356, v207);
    (*(void (**)(char *, uint64_t))(v349 + 8))(v365, v350);
    ((void (*)(char *, uint64_t))v336)(v318, v354);
    uint64_t v123 = v361;
    uint64_t v122 = v362;
    v124 = v305;
    goto LABEL_35;
  }
LABEL_63:
  uint64_t result = sub_1C51C6938();
  __break(1u);
  return result;
}

uint64_t sub_1C5195C38(uint64_t a1, float a2, float a3)
{
  v28[2] = a1;
  uint64_t v36 = sub_1C51C5E58();
  v28[0] = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v35 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C51C6468();
  MEMORY[0x1F4188790](v6 - 8);
  v28[1] = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C51C63F8();
  uint64_t v33 = *(void *)(v8 - 8);
  uint64_t v34 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v30 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C51C5E38();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v29 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C6738();
  sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
  uint64_t v12 = (void *)sub_1C51C67C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1C51C7CB0;
  float v39 = a2;
  char v40 = 0;
  uint64_t v14 = sub_1C51C6378();
  uint64_t v16 = v15;
  uint64_t v17 = MEMORY[0x1E4FBB1A0];
  *(void *)(v13 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v18 = sub_1C51A41F4();
  *(void *)(v13 + 64) = v18;
  *(void *)(v13 + 32) = v14;
  *(void *)(v13 + 40) = v16;
  float v37 = a3;
  char v38 = 0;
  uint64_t v19 = sub_1C51C6378();
  *(void *)(v13 + 96) = v17;
  *(void *)(v13 + 104) = v18;
  *(void *)(v13 + 72) = v19;
  *(void *)(v13 + 80) = v20;
  sub_1C51C5A48();

  swift_bridgeObjectRelease();
  if ((~LODWORD(a2) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a2 <= -9.2234e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (a2 >= 9.2234e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v21 = v29;
  sub_1C51C5E28();
  sub_1C51C5918();
  uint64_t v22 = v28[3];
  sub_1C51C6428();
  if (!v22)
  {
    uint64_t v23 = v30;
    sub_1C51C63E8();
    sub_1C51AD25C(&qword_1EBBD0430, MEMORY[0x1E4F50688]);
    uint64_t v25 = v35;
    uint64_t v24 = v36;
    sub_1C51C5BF8();
    uint64_t v26 = sub_1C51C5E48();
    (*(void (**)(char *, uint64_t))(v28[0] + 8))(v25, v24);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v34);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v21, v32);
    return v26;
  }
LABEL_9:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_1C5196268(uint64_t a1, void (*a2)(void, char *), uint64_t a3, float a4, float a5)
{
}

void sub_1C51963AC(uint64_t a1, int a2, void (*a3)(void, char *), uint64_t a4, float a5, float a6)
{
  v388 = a3;
  uint64_t v389 = a4;
  int v349 = a2;
  v392[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v307 = sub_1C51C5AB8();
  uint64_t v306 = *(void *)(v307 - 8);
  MEMORY[0x1F4188790](v307);
  v305 = (char *)&v304 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v324 = sub_1C51C5CC8();
  uint64_t v327 = *(void *)(v324 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v324);
  v314 = (char *)&v304 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  v320 = (char *)&v304 - v13;
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  v311 = (char *)&v304 - v15;
  uint64_t v313 = v16;
  MEMORY[0x1F4188790](v14);
  uint64_t v332 = (char *)&v304 - v17;
  uint64_t v323 = sub_1C51C5EE8();
  uint64_t v322 = *(void *)(v323 - 8);
  MEMORY[0x1F4188790](v323);
  v310 = (char *)&v304 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0478);
  uint64_t v20 = MEMORY[0x1F4188790](v19 - 8);
  v308 = (char *)&v304 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  v318 = (char *)&v304 - v22;
  uint64_t v344 = sub_1C51C5A78();
  uint64_t v345 = *(void *)(v344 - 8);
  uint64_t v23 = MEMORY[0x1F4188790](v344);
  v309 = (char *)&v304 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  v326 = (char *)&v304 - v26;
  uint64_t v27 = MEMORY[0x1F4188790](v25);
  v319 = (char *)&v304 - v28;
  uint64_t v29 = MEMORY[0x1F4188790](v27);
  v330 = (char *)&v304 - v30;
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  v321 = (char *)&v304 - v32;
  MEMORY[0x1F4188790](v31);
  uint64_t v333 = (char *)&v304 - v33;
  uint64_t v331 = sub_1C51C5AA8();
  uint64_t v328 = *(void *)(v331 - 8);
  uint64_t v34 = MEMORY[0x1F4188790](v331);
  v316 = (char *)&v304 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v315 = v35;
  MEMORY[0x1F4188790](v34);
  uint64_t v346 = (char *)&v304 - v36;
  uint64_t v350 = sub_1C51C5F28();
  uint64_t v334 = *(char **)(v350 - 8);
  uint64_t v37 = MEMORY[0x1F4188790](v350);
  v317 = (char *)&v304 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  v325 = (char *)&v304 - v40;
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  v329 = (char *)&v304 - v42;
  uint64_t v43 = MEMORY[0x1F4188790](v41);
  v340 = (char *)&v304 - v44;
  MEMORY[0x1F4188790](v43);
  v343 = (char *)&v304 - v45;
  uint64_t v342 = sub_1C51C5F18();
  uint64_t v341 = *(void *)(v342 - 8);
  MEMORY[0x1F4188790](v342);
  v348 = (char *)&v304 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v338 = sub_1C51C5E38();
  uint64_t v337 = *(void *)(v338 - 8);
  MEMORY[0x1F4188790](v338);
  v339 = (char *)&v304 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v353 = (void (*)(char *, uint64_t, uint64_t))sub_1C51C5F68();
  uint64_t v352 = *((void *)v353 - 1);
  MEMORY[0x1F4188790](v353);
  uint64_t v354 = (char *)&v304 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v360 = sub_1C51C5DD8();
  uint64_t v359 = *(void *)(v360 - 8);
  MEMORY[0x1F4188790](v360);
  uint64_t v358 = (char *)&v304 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v365 = sub_1C51C5D78();
  uint64_t v364 = *(void *)(v365 - 8);
  MEMORY[0x1F4188790](v365);
  uint64_t v369 = (char *)&v304 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0470);
  uint64_t v52 = MEMORY[0x1F4188790](v51 - 8);
  os_log_t v370 = (os_log_t)((char *)&v304 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v52);
  v377 = (char *)&v304 - v54;
  uint64_t v376 = sub_1C51C59F8();
  v375 = *(void (**)(char *, uint64_t))(v376 - 8);
  MEMORY[0x1F4188790](v376);
  v374 = (char *)&v304 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_1C51C5928();
  uint64_t v57 = *(void *)(v56 - 8);
  uint64_t v383 = v56;
  uint64_t v384 = v57;
  uint64_t v58 = MEMORY[0x1F4188790](v56);
  v357 = (char *)&v304 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = MEMORY[0x1F4188790](v58);
  uint64_t v368 = (char *)&v304 - v61;
  uint64_t v62 = MEMORY[0x1F4188790](v60);
  v378 = (void (*)(char *, char *, char *))((char *)&v304 - v63);
  uint64_t v312 = v64;
  MEMORY[0x1F4188790](v62);
  v380 = (char *)&v304 - v65;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0480);
  uint64_t v67 = MEMORY[0x1F4188790](v66 - 8);
  uint64_t v361 = (char *)&v304 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = MEMORY[0x1F4188790](v67);
  v371 = (void (*)(char *, char *, uint64_t))((char *)&v304 - v70);
  MEMORY[0x1F4188790](v69);
  uint64_t v72 = (char *)&v304 - v71;
  uint64_t v73 = sub_1C51C6468();
  uint64_t v74 = *(void *)(v73 - 8);
  uint64_t v381 = v73;
  uint64_t v382 = v74;
  uint64_t v75 = MEMORY[0x1F4188790](v73);
  uint64_t v77 = (char *)&v304 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = MEMORY[0x1F4188790](v75);
  v336 = (char *)&v304 - v79;
  uint64_t v80 = MEMORY[0x1F4188790](v78);
  v351 = (char *)&v304 - v81;
  uint64_t v82 = MEMORY[0x1F4188790](v80);
  v356 = (char *)&v304 - v83;
  uint64_t v84 = MEMORY[0x1F4188790](v82);
  v363 = (char *)&v304 - v85;
  uint64_t v86 = MEMORY[0x1F4188790](v84);
  uint64_t v367 = (char *)&v304 - v87;
  uint64_t v88 = MEMORY[0x1F4188790](v86);
  v373 = (void (*)(char *, uint64_t))((char *)&v304 - v89);
  uint64_t v90 = MEMORY[0x1F4188790](v88);
  v379 = (char *)&v304 - v91;
  MEMORY[0x1F4188790](v90);
  uint64_t v93 = (char *)&v304 - v92;
  uint64_t v94 = sub_1C51C63F8();
  uint64_t v386 = *(void *)(v94 - 8);
  uint64_t v387 = v94;
  uint64_t v95 = MEMORY[0x1F4188790](v94);
  v347 = (char *)&v304 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = MEMORY[0x1F4188790](v95);
  uint64_t v335 = (char *)&v304 - v98;
  uint64_t v99 = MEMORY[0x1F4188790](v97);
  v101 = (char *)&v304 - v100;
  uint64_t v102 = MEMORY[0x1F4188790](v99);
  v355 = (char *)&v304 - v103;
  uint64_t v104 = MEMORY[0x1F4188790](v102);
  uint64_t v362 = (char *)&v304 - v105;
  uint64_t v106 = MEMORY[0x1F4188790](v104);
  uint64_t v366 = (char *)&v304 - v107;
  uint64_t v108 = MEMORY[0x1F4188790](v106);
  v372 = (char *)&v304 - v109;
  MEMORY[0x1F4188790](v108);
  v111 = (char *)&v304 - v110;
  uint64_t v112 = sub_1C51C6058();
  uint64_t v113 = *(void *)(v112 - 8);
  MEMORY[0x1F4188790](v112);
  uint64_t v115 = (char *)&v304 - ((v114 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v390 = a1;
  uint64_t v117 = sub_1C51C58C8();
  uint64_t v118 = v116;
  if (v117 == 0x6361666863746177 && v116 == 0xE900000000000065 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1C51C6048();
          sub_1C51C6068();
          sub_1C51C5918();
          sub_1C51C6428();
          sub_1C51C63E8();
          uint64_t v119 = swift_allocObject();
          uint64_t v120 = v389;
          *(void *)(v119 + 16) = v388;
          *(void *)(v119 + 24) = v120;
          sub_1C51AD25C(&qword_1EA3D1420, MEMORY[0x1E4F507B8]);
          swift_retain();
          sub_1C51C5BD8();
          swift_release();
          (*(void (**)(char *, uint64_t))(v386 + 8))(v111, v387);
          (*(void (**)(char *, uint64_t))(v113 + 8))(v115, v112);
          return;
        }
        goto LABEL_54;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  if (v117 != 0x737361706B70 || v118 != 0xE600000000000000)
  {
    char v122 = sub_1C51C6B28();
    uint64_t v113 = v390;
    uint64_t v93 = v380;
    uint64_t v121 = v382;
    if ((v122 & 1) != 0
      || v117 == 0x726564726FLL && v118 == 0xE500000000000000
      || (sub_1C51C6B28() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    if (v117 == 0x74756F6B726F77 && v118 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v182 = sub_1C51C6B28();
      swift_bridgeObjectRelease();
      if ((v182 & 1) == 0)
      {
        if (v349)
        {
          sub_1C51C5918();
          uint64_t v72 = 0;
          sub_1C51C6428();
          sub_1C51C63E8();
          sub_1C51C5F08();
          uint64_t v187 = *(void *)((char *)v385 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
          sub_1C51AD25C(&qword_1EBBD0458, MEMORY[0x1E4F506C8]);
          uint64_t v188 = v340;
          v101 = (char *)v350;
          sub_1C51C5BF8();
          uint64_t v376 = v187;
          v111 = v334;
          mach_port_name_t v204 = v343;
          (*((void (**)(char *, char *, char *))v334 + 4))(v343, v188, v101);
          sub_1C51C5A98();
          sub_1C51C5A88();
          uint64_t v77 = v333;
          sub_1C51C5A58();
          uint64_t v112 = (uint64_t)v329;
          v378 = (void (*)(char *, char *, char *))*((void *)v111 + 2);
          v379 = v111 + 16;
          v378(v329, v204, v101);
          uint64_t v117 = sub_1C51C5A88();
          int v205 = sub_1C51C67A8();
          char v206 = sub_1C51C67B8();
          if (v206)
          {
            LODWORD(v381) = v205;
            uint64_t v207 = *(void (**)(char *, char *, uint64_t))(v345 + 16);
            v377 = (char *)((v345 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000);
            v208 = v321;
            uint64_t v382 = (uint64_t)v207;
            v207(v321, v77, v344);
            v209 = (uint8_t *)swift_slowAlloc();
            v210 = (void *)swift_slowAlloc();
            v392[0] = v210;
            *(_DWORD *)v209 = 136315138;
            uint64_t v211 = (uint64_t)v318;
            sub_1C51C5EF8();
            uint64_t v212 = v322;
            uint64_t v213 = v323;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v322 + 48))(v211, 1, v323))
            {
              uint64_t v214 = 7104878;
              sub_1C51ACC90(v211, &qword_1EBBD0478);
              unint64_t v215 = 0xE300000000000000;
            }
            else
            {
              uint64_t v219 = v310;
              (*(void (**)(char *, uint64_t, uint64_t))(v212 + 16))(v310, v211, v213);
              sub_1C51ACC90(v211, &qword_1EBBD0478);
              uint64_t v220 = v212;
              uint64_t v221 = sub_1C51C5ED8();
              uint64_t v222 = v213;
              uint64_t v214 = v221;
              unint64_t v215 = v223;
              os_signpost_id_t v224 = v219;
              v208 = v321;
              (*(void (**)(char *, uint64_t))(v220 + 8))(v224, v222);
            }
            uint64_t v391 = sub_1C51A3538(v214, v215, (uint64_t *)v392);
            sub_1C51C6818();
            swift_bridgeObjectRelease();
            v385 = (void (*)(char *, uint64_t))*((void *)v334 + 1);
            v385(v329, v350);
            os_signpost_id_t v225 = sub_1C51C5A68();
            _os_signpost_emit_with_name_impl(&dword_1C5188000, v117, (os_signpost_type_t)v381, v225, "LargeImage.Context.init", "largeImageContextualInfo: %s", v209, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C878C780](v210, -1, -1);
            MEMORY[0x1C878C780](v209, -1, -1);

            v226 = v208;
            uint64_t v218 = v344;
            (*(void (**)(char *, uint64_t))(v345 + 8))(v226, v344);
            uint64_t v93 = v380;
            uint64_t v77 = v333;
            unint64_t v217 = (unint64_t)v377;
            uint64_t v216 = (void (*)(char *, char *, uint64_t))v382;
            goto LABEL_58;
          }
LABEL_55:

          v385 = (void (*)(char *, uint64_t))*((void *)v111 + 1);
          v385((char *)v112, (uint64_t)v101);
          uint64_t v216 = *(void (**)(char *, char *, uint64_t))(v345 + 16);
          unint64_t v217 = (v345 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          uint64_t v218 = v344;
LABEL_58:
          uint64_t v382 = (uint64_t)v216;
          v216(v330, v77, v218);
          uint64_t v227 = sub_1C51C5AE8();
          swift_allocObject();
          uint64_t v381 = sub_1C51C5AD8();
          v228 = v343;
          v378(v325, v343, (char *)v350);
          uint64_t v229 = v332;
          sub_1C51C5CA8();
          if (v72)
          {
            swift_release();
            (*(void (**)(char *, uint64_t))(v345 + 8))(v77, v218);
            (*(void (**)(char *, uint64_t))(v328 + 8))(v346, v331);
            MEMORY[0x1C878C630](v72);
            v388(0, v72);

            v385(v228, v350);
            (*(void (**)(char *, uint64_t))(v341 + 8))(v348, v342);
            char v153 = *(void (**)(char *, uint64_t))(v386 + 8);
            v154 = v347;
          }
          else
          {
            v374 = (char *)v227;
            v377 = (char *)v217;
            int v230 = (char *)(v327 + 16);
            v231 = *(void (**)(char *, char *, uint64_t))(v327 + 16);
            uint64_t v232 = v311;
            uint64_t v233 = v324;
            v231(v311, v229, v324);
            v234 = v320;
            v372 = v230;
            v371 = v231;
            v231(v320, v229, v233);
            uint64_t v235 = sub_1C51C5A88();
            uint64_t v236 = v319;
            sub_1C51C5AC8();
            LODWORD(v375) = sub_1C51C6798();
            if (sub_1C51C67B8())
            {
              os_log_t v370 = v235;
              swift_retain();
              uint64_t v237 = v305;
              sub_1C51C5AF8();
              swift_release();
              uint64_t v238 = v306;
              uint64_t v239 = v307;
              if ((*(unsigned int (**)(char *, uint64_t))(v306 + 88))(v237, v307) == *MEMORY[0x1E4FBD340])
              {
                char v240 = 0;
                uint64_t v369 = "[Error] Interval already ended";
              }
              else
              {
                (*(void (**)(char *, uint64_t))(v238 + 8))(v237, v239);
                uint64_t v369 = "bufferSize: %ld, vmAddress: %lu";
                char v240 = 2;
              }
              v248 = v319;
              v249 = v232;
              ((void (*)(char *, char *, uint64_t))v382)(v330, v319, v344);
              uint64_t v250 = swift_slowAlloc();
              *(unsigned char *)uint64_t v250 = 0;
              *(unsigned char *)(v250 + 1) = v240;
              *(_WORD *)(v250 + 2) = 2048;
              uint64_t v251 = (void *)sub_1C51C5C88();
              uint64_t v244 = v327;
              uint64_t v252 = *(void (**)(char *, uint64_t))(v327 + 8);
              uint64_t v233 = v324;
              v252(v249, v324);
              v392[0] = v251;
              sub_1C51C6818();
              *(_WORD *)(v250 + 12) = 2048;
              v253 = v320;
              uint64_t v254 = v248;
              v255 = (void *)sub_1C51C5CB8();
              v373 = v252;
              v252(v253, v233);
              v392[0] = v255;
              sub_1C51C6818();
              v256 = v330;
              os_signpost_id_t v257 = sub_1C51C5A68();
              os_log_t v258 = v370;
              _os_signpost_emit_with_name_impl(&dword_1C5188000, v370, (os_signpost_type_t)v375, v257, "LargeImage.Context.init", v369, (uint8_t *)v250, 0x16u);
              MEMORY[0x1C878C780](v250, -1, -1);

              uint64_t v259 = *(void (**)(char *, uint64_t))(v345 + 8);
              uint64_t v260 = v254;
              uint64_t v261 = v344;
              v259(v260, v344);
              v375 = v259;
              v259(v256, v261);
              uint64_t v113 = v390;
              uint64_t v93 = v380;
              uint64_t v247 = v350;
              v245 = v343;
              os_signpost_id_t v246 = v317;
            }
            else
            {
              uint64_t v241 = v327;
              v242 = *(void (**)(char *, uint64_t))(v327 + 8);
              v242(v234, v233);
              unint64_t v243 = v232;
              uint64_t v244 = v241;
              v373 = v242;
              v242(v243, v233);

              v375 = *(void (**)(char *, uint64_t))(v345 + 8);
              v375(v236, v344);
              v245 = v343;
              os_signpost_id_t v246 = v317;
              uint64_t v247 = v350;
            }
            v262 = v314;
            v371(v314, v332, v233);
            unint64_t v263 = (*(unsigned __int8 *)(v244 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v244 + 80);
            v372 = (char *)swift_allocObject();
            (*(void (**)(char *, char *, uint64_t))(v244 + 32))(&v372[v263], v262, v233);
            sub_1C51C5A88();
            char v264 = v326;
            sub_1C51C5A58();
            v378(v246, v245, (char *)v247);
            uint64_t v265 = sub_1C51C5A88();
            int v266 = sub_1C51C67A8();
            uint64_t v267 = v246;
            if (sub_1C51C67B8())
            {
              LODWORD(v378) = v266;
              v268 = v309;
              ((void (*)(char *, char *, uint64_t))v382)(v309, v264, v344);
              uint64_t v269 = (uint8_t *)swift_slowAlloc();
              uint64_t v270 = (void *)swift_slowAlloc();
              v392[0] = v270;
              *(_DWORD *)uint64_t v269 = 136315138;
              uint64_t v271 = (uint64_t)v308;
              sub_1C51C5EF8();
              uint64_t v272 = v322;
              uint64_t v273 = v323;
              int v274 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v322 + 48))(v271, 1, v323);
              uint64_t v275 = v330;
              if (v274)
              {
                uint64_t v276 = 7104878;
                sub_1C51ACC90(v271, &qword_1EBBD0478);
                unint64_t v277 = 0xE300000000000000;
              }
              else
              {
                unint64_t v279 = v310;
                (*(void (**)(char *, uint64_t, uint64_t))(v272 + 16))(v310, v271, v273);
                sub_1C51ACC90(v271, &qword_1EBBD0478);
                uint64_t v280 = v272;
                uint64_t v276 = sub_1C51C5ED8();
                unint64_t v277 = v281;
                uint64_t v282 = v279;
                uint64_t v267 = v317;
                (*(void (**)(char *, uint64_t))(v280 + 8))(v282, v273);
              }
              uint64_t v391 = sub_1C51A3538(v276, v277, (uint64_t *)v392);
              sub_1C51C6818();
              swift_bridgeObjectRelease();
              v379 = (char *)((unint64_t)(v334 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
              v385(v267, v350);
              os_signpost_id_t v283 = sub_1C51C5A68();
              _os_signpost_emit_with_name_impl(&dword_1C5188000, v265, (os_signpost_type_t)v378, v283, "Unpack LargeImage", "largeImageContextualInfo: %s", v269, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1C878C780](v270, -1, -1);
              MEMORY[0x1C878C780](v269, -1, -1);

              uint64_t v278 = v344;
              v375(v268, v344);
              uint64_t v113 = v390;
              uint64_t v93 = v380;
            }
            else
            {

              v379 = (char *)((unint64_t)(v334 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
              v385(v246, v247);
              uint64_t v278 = v344;
              uint64_t v275 = v330;
            }
            uint64_t v284 = v315;
            ((void (*)(char *, char *, uint64_t))v382)(v275, v326, v278);
            swift_allocObject();
            uint64_t v382 = sub_1C51C5AD8();
            uint64_t v390 = sub_1C51C5CE8();
            uint64_t v285 = v328;
            v286 = v316;
            (*(void (**)(char *, char *, uint64_t))(v328 + 16))(v316, v346, v331);
            uint64_t v287 = v384;
            (*(void (**)(char *, uint64_t, uint64_t))(v384 + 16))(v93, v113, v383);
            unint64_t v288 = (*(unsigned __int8 *)(v285 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v285 + 80);
            unint64_t v289 = (v284 + v288 + 7) & 0xFFFFFFFFFFFFFFF8;
            v290 = v93;
            unint64_t v291 = (v289 + 15) & 0xFFFFFFFFFFFFFFF8;
            unint64_t v292 = (*(unsigned __int8 *)(v287 + 80) + v291 + 16) & ~(unint64_t)*(unsigned __int8 *)(v287 + 80);
            unint64_t v293 = (v312 + v292 + 7) & 0xFFFFFFFFFFFFFFF8;
            uint64_t v294 = swift_allocObject();
            (*(void (**)(unint64_t, char *, uint64_t))(v285 + 32))(v294 + v288, v286, v331);
            uint64_t v295 = v383;
            *(void *)(v294 + v289) = v382;
            uint64_t v296 = (void *)(v294 + v291);
            uint64_t v297 = v389;
            *uint64_t v296 = v388;
            v296[1] = v297;
            (*(void (**)(unint64_t, char *, uint64_t))(v287 + 32))(v294 + v292, v290, v295);
            uint64_t v298 = (void *)(v294 + v293);
            v299 = v372;
            *uint64_t v298 = sub_1C51ACB44;
            v298[1] = v299;
            sub_1C51AD25C(&qword_1EBBD0468, MEMORY[0x1E4F505A0]);
            swift_retain();
            swift_retain();
            swift_retain();
            uint64_t v300 = v347;
            uint64_t v301 = v332;
            sub_1C51C5BD8();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            uint64_t v302 = v344;
            uint64_t v303 = v375;
            v375(v326, v344);
            v373(v301, v324);
            v303(v333, v302);
            (*(void (**)(char *, uint64_t))(v328 + 8))(v346, v331);
            v385(v343, v350);
            (*(void (**)(char *, uint64_t))(v341 + 8))(v348, v342);
            char v153 = *(void (**)(char *, uint64_t))(v386 + 8);
            v154 = v300;
          }
          uint64_t v155 = v387;
          goto LABEL_25;
        }
        sub_1C51C6738();
        sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
        char v189 = (void *)sub_1C51C67C8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
        uint64_t v190 = swift_allocObject();
        *(_OWORD *)(v190 + 16) = xmmword_1C51C7CB0;
        *(float *)v392 = a5;
        BYTE4(v392[0]) = 0;
        uint64_t v191 = sub_1C51C6378();
        uint64_t v193 = v192;
        uint64_t v194 = MEMORY[0x1E4FBB1A0];
        *(void *)(v190 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v195 = sub_1C51A41F4();
        *(void *)(v190 + 64) = v195;
        *(void *)(v190 + 32) = v191;
        *(void *)(v190 + 40) = v193;
        *(float *)v392 = a6;
        BYTE4(v392[0]) = 0;
        uint64_t v196 = sub_1C51C6378();
        *(void *)(v190 + 96) = v194;
        *(void *)(v190 + 104) = v195;
        *(void *)(v190 + 72) = v196;
        *(void *)(v190 + 80) = v197;
        sub_1C51C5A48();

        swift_bridgeObjectRelease();
        if ((~LODWORD(a5) & 0x7F800000) != 0)
        {
          uint64_t v198 = v386;
          uint64_t v199 = v387;
          uint64_t v200 = v339;
          if (a5 > -9.2234e18)
          {
            if (a5 < 9.2234e18)
            {
              sub_1C51C5E28();
              sub_1C51C5E58();
              sub_1C51C5918();
              sub_1C51C6428();
              uint64_t v201 = v335;
              sub_1C51C63E8();
              uint64_t v202 = swift_allocObject();
              uint64_t v203 = v389;
              *(void *)(v202 + 16) = v388;
              *(void *)(v202 + 24) = v203;
              sub_1C51AD25C(&qword_1EBBD0430, MEMORY[0x1E4F50688]);
              swift_retain();
              sub_1C51C5BD8();
              swift_release();
              (*(void (**)(char *, uint64_t))(v198 + 8))(v201, v199);
              (*(void (**)(char *, uint64_t))(v337 + 8))(v200, v338);
              return;
            }
LABEL_79:
            __break(1u);
          }
LABEL_78:
          __break(1u);
          goto LABEL_79;
        }
LABEL_77:
        __break(1u);
        goto LABEL_78;
      }
    }
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      uint64_t v183 = v386;
      v184 = v354;
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1C51C5F58();
          sub_1C51C5F78();
          sub_1C51C5918();
          sub_1C51C6428();
          sub_1C51C63E8();
          uint64_t v185 = swift_allocObject();
          uint64_t v186 = v389;
          *(void *)(v185 + 16) = v388;
          *(void *)(v185 + 24) = v186;
          sub_1C51AD25C(&qword_1EA3D1370, MEMORY[0x1E4F50730]);
          swift_retain();
          sub_1C51C5BD8();
          swift_release();
          (*(void (**)(char *, uint64_t))(v183 + 8))(v101, v387);
          (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t)))(v352 + 8))(v184, v353);
          return;
        }
        goto LABEL_76;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  swift_bridgeObjectRelease();
  uint64_t v113 = v390;
  uint64_t v93 = v380;
  uint64_t v121 = v382;
LABEL_16:
  (*(void (**)(char *, uint64_t, uint64_t))(v384 + 16))(v93, v113, v383);
  sub_1C51C6448();
  uint64_t v123 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v121 + 48);
  uint64_t v124 = v381;
  if (v123(v72, 1, v381) == 1)
  {
    sub_1C51ACC90((uint64_t)v72, &qword_1EBBD0480);
    sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
    sub_1C51C6B18();
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    v125 = (char *)swift_allocError();
    sub_1C51C6518();
    v388(0, v125);

    return;
  }
  v126 = *(void (**)(char *, uint64_t, uint64_t))(v121 + 32);
  uint64_t v354 = (char *)(v121 + 32);
  uint64_t v353 = v126;
  v126(v379, (uint64_t)v72, v124);
  sub_1C51C6408();
  v127 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1408);
  uint64_t v128 = swift_allocObject();
  *(_OWORD *)(v128 + 16) = xmmword_1C51C7CC0;
  v129 = NSTemporaryDirectory();
  uint64_t v130 = sub_1C51C65B8();
  uint64_t v132 = v131;

  *(void *)(v128 + 32) = v130;
  *(void *)(v128 + 40) = v132;
  *(void *)(v128 + 48) = 0x7665725073736150;
  *(void *)(v128 + 56) = 0xEB00000000776569;
  v133 = v374;
  sub_1C51C59E8();
  uint64_t v134 = sub_1C51C59C8();
  uint64_t v136 = v135;
  (*((void (**)(char *, uint64_t))v375 + 1))(v133, v376);
  *(void *)(v128 + 64) = v134;
  *(void *)(v128 + 72) = v136;
  v137 = (void *)sub_1C51C66C8();
  swift_bridgeObjectRelease();
  id v138 = objc_msgSend(v127, sel_fileURLWithPathComponents_, v137);

  if (v138)
  {
    sub_1C51C58F8();

    uint64_t v140 = v383;
    uint64_t v139 = v384;
    v141 = *(void (**)(char *, char *, uint64_t))(v384 + 32);
    uint64_t v142 = v377;
    v141(v377, v93, v383);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v139 + 56))(v142, 0, 1, v140);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v139 + 48))(v142, 1, v140) != 1)
    {
      v141((char *)v378, v142, v140);
      id v143 = objc_msgSend(self, sel_defaultManager);
      v144 = (void *)sub_1C51C58D8();
      v392[0] = 0;
      unsigned int v145 = objc_msgSend(v143, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v144, 1, 0, v392);

      if (v145)
      {
        id v146 = v392[0];
      }
      else
      {
        id v147 = v392[0];
        uint64_t v148 = (char *)sub_1C51C58B8();

        swift_willThrow();
        MEMORY[0x1C878C630](v148);
        v388(0, v148);
      }
      v149 = (char *)v378;
      sub_1C51C58E8();
      uint64_t v150 = (uint64_t)v371;
      sub_1C51C6448();
      uint64_t v151 = v381;
      if (v123((char *)v150, 1, v381) == 1)
      {
        sub_1C51ACC90(v150, &qword_1EBBD0480);
        sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
        sub_1C51C6B18();
        sub_1C51C6528();
        sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
        os_signpost_type_t v152 = (char *)swift_allocError();
        sub_1C51C6518();
        v388(0, v152);

        (*(void (**)(char *, uint64_t))(v384 + 8))(v149, v140);
        char v153 = *(void (**)(char *, uint64_t))(v382 + 8);
        v154 = v379;
        uint64_t v155 = v151;
LABEL_25:
        v153(v154, v155);
        return;
      }
      uint64_t v156 = (char *)v373;
      v353((char *)v373, v150, v151);
      sub_1C51C6408();
      uint64_t v157 = v386;
      uint64_t v158 = v156;
      uint64_t v159 = v387;
      (*(void (**)(char *, char *, uint64_t))(v382 + 16))(v367, v158, v151);
      unint64_t v160 = v372;
      sub_1C51C63E8();
      uint64_t v161 = sub_1C51C58C8();
      if (v161 == 0x737361706B70 && v162 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        v163 = v369;
        unint64_t v164 = v368;
      }
      else
      {
        char v165 = sub_1C51C6B28();
        swift_bridgeObjectRelease();
        v163 = v369;
        unint64_t v164 = v368;
        if ((v165 & 1) == 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v157 + 16))(v366, v160, v159);
          char v175 = v358;
          sub_1C51C5DC8();
          v176 = v357;
          sub_1C51C6438();
          sub_1C51C5DE8();
          sub_1C51C5918();
          sub_1C51C6428();
          v177 = v355;
          sub_1C51C63E8();
          uint64_t v178 = swift_allocObject();
          uint64_t v179 = v389;
          *(void *)(v178 + 16) = v388;
          *(void *)(v178 + 24) = v179;
          sub_1C51AD25C(&qword_1EA3D1410, MEMORY[0x1E4F50658]);
          swift_retain();
          sub_1C51C5BD8();
          swift_release();
          uint64_t v170 = *(void (**)(char *, uint64_t))(v157 + 8);
          v170(v177, v159);
          uint64_t v171 = v383;
          v172 = *(void (**)(char *, uint64_t))(v384 + 8);
          v172(v176, v383);
          (*(void (**)(char *, uint64_t))(v359 + 8))(v175, v360);
          v173 = v372;
          uint64_t v174 = v159;
          goto LABEL_37;
        }
      }
      (*(void (**)(char *, char *, uint64_t))(v157 + 16))(v366, v160, v159);
      sub_1C51C5D68();
      sub_1C51C6438();
      sub_1C51C5D88();
      sub_1C51C5918();
      sub_1C51C6428();
      uint64_t v166 = v159;
      uint64_t v167 = v362;
      sub_1C51C63E8();
      uint64_t v168 = swift_allocObject();
      uint64_t v169 = v389;
      *(void *)(v168 + 16) = v388;
      *(void *)(v168 + 24) = v169;
      sub_1C51AD25C(&qword_1EA3D1418, MEMORY[0x1E4F505F8]);
      swift_retain();
      sub_1C51C5BD8();
      swift_release();
      uint64_t v170 = *(void (**)(char *, uint64_t))(v157 + 8);
      v170(v167, v166);
      uint64_t v171 = v383;
      v172 = *(void (**)(char *, uint64_t))(v384 + 8);
      v172(v164, v383);
      (*(void (**)(const char *, uint64_t))(v364 + 8))(v163, v365);
      v173 = v372;
      uint64_t v174 = v166;
LABEL_37:
      v170(v173, v174);
      uint64_t v180 = v381;
      v181 = *(void (**)(char *, uint64_t))(v382 + 8);
      v181((char *)v373, v381);
      v172((char *)v378, v171);
      v181(v379, v180);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v384 + 56))(v377, 1, 1, v383);
  }
  __break(1u);
  swift_unexpectedError();
  __break(1u);
  swift_unexpectedError();
  __break(1u);
}

uint64_t sub_1C51996F8()
{
  uint64_t v0 = sub_1C51C64A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (ipc_space_t *)MEMORY[0x1E4F14960];
  uint64_t v5 = *MEMORY[0x1E4F14960];
  uint64_t v6 = sub_1C51C5CB8();
  uint64_t v7 = sub_1C51C5C88();
  if (v7 < 0)
  {
    uint64_t result = sub_1C51C6938();
    __break(1u);
  }
  else
  {
    MEMORY[0x1C878C820](v5, v6, v7);
    ipc_space_t v8 = *v4;
    sub_1C51C5C98();
    mach_port_name_t v9 = sub_1C51C6498();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return mach_port_deallocate(v8, v9);
  }
  return result;
}

void sub_1C5199864(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), void (*a4)(void, void *), uint64_t a5, uint64_t a6, void (*a7)(uint64_t), uint64_t a8)
{
  uint64_t v203 = a7;
  uint64_t v204 = a8;
  uint64_t v182 = a6;
  uint64_t v206 = a5;
  uint64_t v207 = a4;
  v210 = a3;
  uint64_t v211 = a2;
  v208 = (char *)a1;
  uint64_t v8 = sub_1C51C5F28();
  uint64_t v198 = *(void *)(v8 - 8);
  uint64_t v199 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v180 = (char *)&v177 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v187 = (char *)&v177 - v12;
  MEMORY[0x1F4188790](v11);
  v184 = (char *)&v177 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0478);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  v181 = (char *)&v177 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v188 = (char *)&v177 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v186 = (char *)&v177 - v19;
  uint64_t v20 = (const char *)sub_1C51C5AB8();
  uint64_t v196 = *((void *)v20 - 1);
  uint64_t v197 = v20;
  uint64_t v21 = MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v177 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1F4188790](v21);
  uint64_t v179 = (char *)&v177 - v25;
  MEMORY[0x1F4188790](v24);
  uint64_t v185 = (char *)&v177 - v26;
  uint64_t v27 = sub_1C51C5A78();
  uint64_t v212 = *(void *)(v27 - 8);
  uint64_t v213 = v27;
  uint64_t v28 = MEMORY[0x1F4188790](v27);
  uint64_t v30 = (char *)&v177 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x1F4188790](v28);
  char v189 = (char *)&v177 - v32;
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  uint64_t v191 = (char *)&v177 - v34;
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  uint64_t v202 = (char *)&v177 - v36;
  uint64_t v37 = MEMORY[0x1F4188790](v35);
  uint64_t v193 = (char *)&v177 - v38;
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  v209 = (char *)&v177 - v40;
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  uint64_t v192 = (char *)&v177 - v42;
  MEMORY[0x1F4188790](v41);
  uint64_t v44 = (char *)&v177 - v43;
  uint64_t v45 = sub_1C51C5CE8();
  uint64_t v46 = *(void *)(v45 - 8);
  uint64_t v47 = MEMORY[0x1F4188790](v45);
  unint64_t v195 = (char *)&v177 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = MEMORY[0x1F4188790](v47);
  int v205 = (char *)&v177 - v50;
  uint64_t v51 = MEMORY[0x1F4188790](v49);
  uint64_t v201 = (char *)&v177 - v52;
  uint64_t v53 = MEMORY[0x1F4188790](v51);
  uint64_t v55 = (char *)&v177 - v54;
  MEMORY[0x1F4188790](v53);
  uint64_t v57 = (char *)&v177 - v56;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0460);
  MEMORY[0x1F4188790](v58);
  uint64_t v60 = (void **)((char *)&v177 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C51AD1BC((uint64_t)v208, (uint64_t)v60, &qword_1EBBD0460);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v61 = *v60;
    uint64_t v62 = sub_1C51C5A88();
    sub_1C51C5AC8();
    int v63 = sub_1C51C6798();
    if (sub_1C51C67B8())
    {
      swift_retain();
      sub_1C51C5AF8();
      swift_release();
      uint64_t v65 = v196;
      uint64_t v64 = v197;
      int v66 = (*(uint64_t (**)(char *, const char *))(v196 + 88))(v23, v197);
      int v67 = *MEMORY[0x1E4FBD340];
      LODWORD(v211) = v63;
      if (v66 == v67)
      {
        uint64_t v68 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, const char *))(v65 + 8))(v23, v64);
        uint64_t v68 = "error unpacking";
      }
      uint64_t v81 = v207;
      uint64_t v88 = v212;
      uint64_t v89 = v213;
      uint64_t v90 = v202;
      (*(void (**)(char *, char *, uint64_t))(v212 + 16))(v202, v30, v213);
      uint64_t v91 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v91 = 0;
      os_signpost_id_t v92 = sub_1C51C5A68();
      _os_signpost_emit_with_name_impl(&dword_1C5188000, v62, (os_signpost_type_t)v211, v92, "Unpack LargeImage", v68, v91, 2u);
      MEMORY[0x1C878C780](v91, -1, -1);

      uint64_t v93 = *(void (**)(char *, uint64_t))(v88 + 8);
      v93(v30, v89);
      uint64_t v80 = ((uint64_t (*)(char *, uint64_t))v93)(v90, v89);
    }
    else
    {

      uint64_t v80 = (*(uint64_t (**)(char *, uint64_t))(v212 + 8))(v30, v213);
      uint64_t v81 = v207;
    }
    v203(v80);
    MEMORY[0x1C878C630](v61);
    v81(0, v61);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v46 + 32))(v57, v60, v45);
    uint64_t v69 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
    v208 = v57;
    uint64_t v183 = v69;
    uint64_t v194 = v46 + 16;
    v69(v55, (uint64_t)v57, v45);
    uint64_t v70 = sub_1C51C5A88();
    sub_1C51C5AC8();
    int v71 = sub_1C51C6798();
    char v72 = sub_1C51C67B8();
    uint64_t v73 = v44;
    uint64_t v190 = v45;
    uint64_t v200 = v46;
    if (v72)
    {
      int v178 = v71;
      swift_retain();
      uint64_t v74 = v185;
      sub_1C51C5AF8();
      swift_release();
      uint64_t v76 = v196;
      uint64_t v75 = v197;
      if ((*(unsigned int (**)(char *, const char *))(v196 + 88))(v74, v197) == *MEMORY[0x1E4FBD340])
      {
        char v77 = 0;
        char v78 = 0;
        uint64_t v79 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, const char *))(v76 + 8))(v74, v75);
        uint64_t v79 = "result.metadata.largeImageContextualInfo: %s";
        char v78 = 2;
        char v77 = 1;
      }
      uint64_t v94 = v184;
      (*(void (**)(char *, char *, uint64_t))(v212 + 16))(v192, v44, v213);
      uint64_t v95 = swift_slowAlloc();
      uint64_t v96 = swift_slowAlloc();
      uint64_t v215 = v96;
      *(unsigned char *)uint64_t v95 = v78;
      *(unsigned char *)(v95 + 1) = v77;
      *(_WORD *)(v95 + 2) = 2080;
      sub_1C51C5CD8();
      uint64_t v97 = v186;
      sub_1C51C5EF8();
      (*(void (**)(char *, uint64_t))(v198 + 8))(v94, v199);
      uint64_t v98 = sub_1C51C5EE8();
      uint64_t v99 = *(void *)(v98 - 8);
      int v100 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v99 + 48))(v97, 1, v98);
      v177 = v73;
      if (v100 == 1)
      {
        uint64_t v101 = (uint64_t)v97;
        uint64_t v102 = 7104878;
        sub_1C51ACC90(v101, &qword_1EBBD0478);
        unint64_t v103 = 0xE300000000000000;
      }
      else
      {
        uint64_t v104 = sub_1C51C5ED8();
        uint64_t v105 = v97;
        uint64_t v102 = v104;
        unint64_t v103 = v106;
        (*(void (**)(char *, uint64_t))(v99 + 8))(v105, v98);
      }
      uint64_t v107 = v200;
      uint64_t v214 = sub_1C51A3538(v102, v103, &v215);
      sub_1C51C6818();
      swift_bridgeObjectRelease();
      uint64_t v82 = v190;
      v210 = *(void (**)(char *, uint64_t))(v107 + 8);
      v210(v55, v190);
      uint64_t v108 = v192;
      os_signpost_id_t v109 = sub_1C51C5A68();
      _os_signpost_emit_with_name_impl(&dword_1C5188000, v70, (os_signpost_type_t)v178, v109, "Unpack LargeImage", v79, (uint8_t *)v95, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C878C780](v96, -1, -1);
      MEMORY[0x1C878C780](v95, -1, -1);

      uint64_t v110 = v213;
      uint64_t v84 = v212;
      uint64_t v85 = *(void (**)(char *, uint64_t))(v212 + 8);
      v85(v177, v213);
      v85(v108, v110);
      uint64_t v86 = (uint64_t)v208;
      uint64_t v87 = v209;
    }
    else
    {
      v210 = *(void (**)(char *, uint64_t))(v46 + 8);
      v210(v55, v45);

      uint64_t v82 = v45;
      uint64_t v83 = v44;
      uint64_t v84 = v212;
      uint64_t v85 = *(void (**)(char *, uint64_t))(v212 + 8);
      v85(v83, v213);
      uint64_t v86 = (uint64_t)v208;
      uint64_t v87 = v209;
    }
    v111 = v183;
    uint64_t v112 = v201;
    sub_1C51C5A88();
    sub_1C51C5A58();
    v111(v112, v86, v82);
    uint64_t v113 = sub_1C51C5A88();
    int v114 = sub_1C51C67A8();
    char v115 = sub_1C51C67B8();
    uint64_t v192 = (char *)v85;
    if (v115)
    {
      LODWORD(v185) = v114;
      unint64_t v116 = (v84 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      uint64_t v186 = *(char **)(v84 + 16);
      ((void (*)(char *, char *, uint64_t))v186)(v193, v87, v213);
      uint64_t v117 = (uint8_t *)swift_slowAlloc();
      uint64_t v118 = swift_slowAlloc();
      uint64_t v215 = v118;
      *(_DWORD *)uint64_t v117 = 136315138;
      uint64_t v119 = v187;
      sub_1C51C5CD8();
      uint64_t v120 = v188;
      sub_1C51C5EF8();
      (*(void (**)(char *, uint64_t))(v198 + 8))(v119, v199);
      uint64_t v121 = sub_1C51C5EE8();
      uint64_t v122 = *(void *)(v121 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v122 + 48))(v120, 1, v121) == 1)
      {
        uint64_t v123 = (uint64_t)v120;
        uint64_t v124 = 7104878;
        sub_1C51ACC90(v123, &qword_1EBBD0478);
        unint64_t v125 = 0xE300000000000000;
      }
      else
      {
        uint64_t v131 = sub_1C51C5ED8();
        uint64_t v132 = v120;
        uint64_t v124 = v131;
        unint64_t v125 = v133;
        (*(void (**)(char *, uint64_t))(v122 + 8))(v132, v121);
      }
      uint64_t v134 = v213;
      v111 = v183;
      os_signpost_type_t v135 = v185;
      uint64_t v214 = sub_1C51A3538(v124, v125, &v215);
      sub_1C51C6818();
      swift_bridgeObjectRelease();
      uint64_t v82 = v190;
      v210(v201, v190);
      uint64_t v136 = v193;
      os_signpost_id_t v137 = sub_1C51C5A68();
      _os_signpost_emit_with_name_impl(&dword_1C5188000, v113, v135, v137, "Copy MachImage", "result.metadata.largeImageContextualInfo: %s", v117, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C878C780](v118, -1, -1);
      MEMORY[0x1C878C780](v117, -1, -1);

      ((void (*)(char *, uint64_t))v192)(v136, v134);
      uint64_t v128 = (uint64_t)v208;
      uint64_t v87 = v209;
      v127 = v205;
      v129 = v202;
      uint64_t v130 = v134;
      v126 = v186;
    }
    else
    {

      v210(v112, v82);
      v126 = *(char **)(v84 + 16);
      unint64_t v116 = (v84 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v127 = v205;
      uint64_t v128 = (uint64_t)v208;
      v129 = v202;
      uint64_t v130 = v213;
    }
    uint64_t v186 = v126;
    uint64_t v201 = (char *)v116;
    ((void (*)(char *, char *, uint64_t))v126)(v129, v87, v130);
    sub_1C51C5AE8();
    swift_allocObject();
    uint64_t v138 = sub_1C51C5AD8();
    v111(v127, v128, v82);
    sub_1C51C5C68();
    uint64_t v139 = sub_1C51C6548();
    swift_release();
    uint64_t v202 = (char *)v139;
    if (v139)
    {
      uint64_t v140 = v213;
      v141 = v195;
      v111(v195, v128, v82);
      uint64_t v142 = sub_1C51C5A88();
      id v143 = v191;
      sub_1C51C5AC8();
      int v144 = sub_1C51C6798();
      char v145 = sub_1C51C67B8();
      uint64_t v193 = (char *)v138;
      if (v145)
      {
        LODWORD(v211) = v144;
        swift_retain();
        id v146 = v179;
        sub_1C51C5AF8();
        swift_release();
        uint64_t v148 = v196;
        id v147 = v197;
        if ((*(unsigned int (**)(char *, const char *))(v196 + 88))(v146, v197) == *MEMORY[0x1E4FBD340])
        {
          char v149 = 0;
          char v150 = 0;
          uint64_t v151 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, const char *))(v148 + 8))(v146, v147);
          uint64_t v151 = "result.metadata.largeImageContextualInfo: %s";
          char v150 = 2;
          char v149 = 1;
        }
        uint64_t v197 = v151;
        ((void (*)(char *, char *, uint64_t))v186)(v189, v143, v140);
        uint64_t v158 = swift_slowAlloc();
        uint64_t v159 = swift_slowAlloc();
        uint64_t v215 = v159;
        *(unsigned char *)uint64_t v158 = v150;
        *(unsigned char *)(v158 + 1) = v149;
        *(_WORD *)(v158 + 2) = 2080;
        unint64_t v160 = v180;
        sub_1C51C5CD8();
        uint64_t v161 = (uint64_t)v181;
        sub_1C51C5EF8();
        (*(void (**)(char *, uint64_t))(v198 + 8))(v160, v199);
        uint64_t v162 = sub_1C51C5EE8();
        uint64_t v163 = *(void *)(v162 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v163 + 48))(v161, 1, v162) == 1)
        {
          uint64_t v164 = 7104878;
          sub_1C51ACC90(v161, &qword_1EBBD0478);
          unint64_t v165 = 0xE300000000000000;
        }
        else
        {
          uint64_t v164 = sub_1C51C5ED8();
          unint64_t v165 = v166;
          (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v161, v162);
        }
        uint64_t v214 = sub_1C51A3538(v164, v165, &v215);
        sub_1C51C6818();
        swift_bridgeObjectRelease();
        v210(v195, v190);
        uint64_t v167 = v189;
        os_signpost_id_t v168 = sub_1C51C5A68();
        _os_signpost_emit_with_name_impl(&dword_1C5188000, v142, (os_signpost_type_t)v211, v168, "Copy MachImage", v197, (uint8_t *)v158, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C878C780](v159, -1, -1);
        MEMORY[0x1C878C780](v158, -1, -1);

        uint64_t v156 = v213;
        uint64_t v157 = v192;
        ((void (*)(char *, uint64_t))v192)(v191, v213);
        ((void (*)(char *, uint64_t))v157)(v167, v156);
      }
      else
      {
        v210(v141, v82);

        uint64_t v155 = v143;
        uint64_t v156 = v140;
        uint64_t v157 = v192;
        ((void (*)(char *, uint64_t))v192)(v155, v140);
      }
      uint64_t v169 = (void (*)(void *, void))v207;
      uint64_t v170 = v203;
      swift_retain();
      uint64_t v171 = v205;
      uint64_t v172 = sub_1C51C5C78();
      v170(v172);
      v173 = (void *)sub_1C51C5C58();
      v169(v173, 0);
      swift_release();
      swift_release();

      uint64_t v174 = v171;
      uint64_t v175 = v190;
      v176 = v210;
      v210(v174, v190);
      ((void (*)(char *, uint64_t))v157)(v209, v156);
      v176(v208, v175);
    }
    else
    {
      sub_1C51C5928();
      sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
      sub_1C51C6B18();
      sub_1C51C6528();
      os_signpost_type_t v152 = v127;
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      char v153 = (void *)swift_allocError();
      sub_1C51C6518();
      v207(0, v153);

      swift_release();
      v154 = (void (*)(uint64_t, uint64_t))v210;
      v210(v152, v82);
      ((void (*)(char *, uint64_t))v192)(v87, v213);
      v154(v128, v82);
    }
  }
}

uint64_t sub_1C519ACF8(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a3;
  uint64_t v6 = sub_1C51C59F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C51C6468();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v25 = sub_1C51C63F8();
  uint64_t v11 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C51C5E88();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    uint64_t v22 = v16;
    uint64_t v23 = v7;
    uint64_t v24 = v6;
    sub_1C51C5E78();
    sub_1C51C5918();
    sub_1C51C6428();
    sub_1C51C63E8();
    sub_1C51C5EC8();
    sub_1C51C59E8();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v26;
    *(void *)(v19 + 24) = a4;
    sub_1C51AD25C(&qword_1EA3D1368, MEMORY[0x1E4F50698]);
    swift_retain();
    sub_1C51C5BB8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v22);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_1C519B0CC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, void *))
{
  uint64_t v6 = sub_1C51C5EC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D14B0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (uint64_t *)((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C51AD1BC(a1, (uint64_t)v12, &qword_1EA3D14B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = (void *)*v12;
    MEMORY[0x1C878C630](*v12);
    a4(0, v13);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v7 + 32))(v9, v12, v6);
    uint64_t v14 = (void *)sub_1C51C5E98();
    a4(v14, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_1C519B3F8(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  uint64_t v6 = sub_1C51C59F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1C51C6468();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v25 = sub_1C51C63F8();
  uint64_t v11 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1C51C5E88();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    uint64_t v22 = v16;
    uint64_t v23 = v7;
    uint64_t v24 = v6;
    sub_1C51C5E78();
    sub_1C51C5918();
    sub_1C51C6428();
    sub_1C51C63E8();
    sub_1C51C5EC8();
    sub_1C51C59E8();
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = v27;
    *(void *)(v19 + 16) = v26;
    *(void *)(v19 + 24) = v20;
    sub_1C51AD25C(&qword_1EA3D1368, MEMORY[0x1E4F50698]);
    swift_retain();
    sub_1C51C5BB8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v22);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

void sub_1C519B940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    uint64_t v6 = sub_1C51C58A8();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, a1);
}

uint64_t sub_1C519B9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v31 = a1;
  uint64_t v32 = a8;
  LODWORD(v33) = a7;
  uint64_t v30 = a6;
  int v29 = a5;
  uint64_t v28 = a4;
  uint64_t v9 = sub_1C51C59F8();
  uint64_t v38 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C51C6468();
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v13 = sub_1C51C63F8();
  uint64_t v36 = *(void *)(v13 - 8);
  uint64_t v37 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_1C51C5E88();
  uint64_t v34 = *(void *)(v35 - 8);
  MEMORY[0x1F4188790](v35);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C51C5EB8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v28 - v23;
  sub_1C51C5EA8();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  uint64_t v33 = v18;
  v25(v22, v24, v18);
  sub_1C51C5E68();
  sub_1C51C5918();
  sub_1C51C6428();
  sub_1C51C63E8();
  sub_1C51C5EC8();
  sub_1C51C59E8();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v32;
  *(void *)(v26 + 24) = a9;
  sub_1C51AD25C(&qword_1EA3D1368, MEMORY[0x1E4F50698]);
  swift_retain();
  sub_1C51C5BB8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v39);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v37);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v24, v33);
}

void sub_1C519BE20(uint64_t a1, uint64_t a2, char a3, void (*a4)(void *, void *, void))
{
  uint64_t v7 = sub_1C51C5EC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D14B0);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (uint64_t *)((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C51AD1BC(a1, (uint64_t)v13, &qword_1EA3D14B0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = (void *)*v13;
    MEMORY[0x1C878C630](*v13);
    a4(0, v14, a3 & 1);
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v8 + 32))(v10, v13, v7);
    uint64_t v15 = (void *)sub_1C51C5E98();
    a4(v15, 0, a3 & 1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_1C519C174(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = a3;
  uint64_t v6 = sub_1C51C6468();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v7 = sub_1C51C63F8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C51C5F68();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    uint64_t v18 = v7;
    sub_1C51C5F58();
    sub_1C51C5918();
    sub_1C51C6428();
    sub_1C51C63E8();
    sub_1C51C5F78();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v19;
    *(void *)(v15 + 24) = a4;
    sub_1C51AD25C(&qword_1EA3D1370, MEMORY[0x1E4F50730]);
    swift_retain();
    sub_1C51C5BD8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1C519C5D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = a3;
  uint64_t v14 = a2;
  uint64_t v3 = sub_1C51C6468();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v15 = sub_1C51C63F8();
  uint64_t v4 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C51C5E08();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C5DF8();
  sub_1C51C5E18();
  sub_1C51C5918();
  sub_1C51C6428();
  sub_1C51C63E8();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v16;
  *(void *)(v11 + 16) = v14;
  *(void *)(v11 + 24) = v12;
  sub_1C51AD25C(&qword_1EBBD03E0, MEMORY[0x1E4F50670]);
  swift_retain();
  sub_1C51C5BD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_1C519C9C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void, void *), uint64_t a7)
{
}

__n128 sub_1C519CB40(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, void (*a12)(void, void *), uint64_t a13)
{
  sub_1C519CD84(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 1u, a12, a13);
  return result;
}

void sub_1C519CD84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, unsigned __int8 a12, void (*a13)(void, void *), uint64_t a14)
{
  uint64_t v68 = a8;
  uint64_t v66 = a6;
  unint64_t v67 = a7;
  uint64_t v64 = a4;
  uint64_t v65 = a5;
  uint64_t v62 = a2;
  unint64_t v63 = a3;
  char v77 = a13;
  uint64_t v78 = a14;
  v79[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v14 = sub_1C51C63F8();
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v61 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C51C64F8();
  uint64_t v70 = *(void *)(v16 - 8);
  uint64_t v71 = v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v69 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C51C5928();
  uint64_t v73 = *(void *)(v18 - 8);
  uint64_t v74 = v18;
  MEMORY[0x1F4188790](v18);
  char v72 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C51C59F8();
  uint64_t v75 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1C51C6468();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)&v56 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x1F4188790](v25);
  uint64_t v30 = (char *)&v56 - v29;
  uint64_t v31 = MEMORY[0x1F4188790](v28);
  uint64_t v33 = (char *)&v56 - v32;
  MEMORY[0x1F4188790](v31);
  uint64_t v76 = (char *)&v56 - v34;
  uint64_t v35 = self;
  uint64_t v36 = (void *)sub_1C51C6558();
  v79[0] = 0;
  id v37 = objc_msgSend(v35, sel_dataWithPropertyList_format_options_error_, v36, 200, 0, v79);

  id v38 = v79[0];
  if (!v37)
  {
    uint64_t v42 = v38;
    uint64_t v43 = (void *)sub_1C51C58B8();

    swift_willThrow();
LABEL_4:
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    uint64_t v45 = (void *)swift_allocError();
    MEMORY[0x1C878C630](v43);
    sub_1C51C6538();
    v77(0, v45);

    return;
  }
  uint64_t v60 = v27;
  uint64_t v39 = sub_1C51C5998();
  unint64_t v41 = v40;

  sub_1C51C6418();
  sub_1C51C6458();
  uint64_t v57 = v39;
  unint64_t v58 = v41;
  uint64_t v59 = *(void (**)(char *, uint64_t))(v24 + 8);
  v59(v30, v23);
  sub_1C51C59E8();
  sub_1C51C59C8();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v22, v20);
  uint64_t v44 = v76;
  sub_1C51C6458();
  v59(v33, v23);
  swift_bridgeObjectRelease();
  id v46 = objc_msgSend(self, sel_defaultManager);
  uint64_t v47 = v72;
  sub_1C51C6438();
  uint64_t v48 = (void *)sub_1C51C58D8();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v47, v74);
  v79[0] = 0;
  LODWORD(v47) = objc_msgSend(v46, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v48, 1, 0, v79);

  id v49 = v79[0];
  if (!v47)
  {
    uint64_t v55 = v49;
    uint64_t v43 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C518D144(v57, v58);
    v59(v44, v23);
    goto LABEL_4;
  }
  LODWORD(v73) = a12;
  char v72 = (char *)a9;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v60, v44, v23);
  sub_1C518D19C(v62, v63);
  swift_bridgeObjectRetain();
  uint64_t v74 = v23;
  uint64_t v75 = v24 + 8;
  sub_1C51A75CC(v66, v67);
  sub_1C51A75CC(v68, a9);
  sub_1C51A75CC(a10, a11);
  sub_1C51C63E8();
  uint64_t v50 = v69;
  sub_1C51C64E8();
  sub_1C51C6508();
  uint64_t v51 = swift_allocObject();
  uint64_t v52 = v78;
  *(void *)(v51 + 16) = v77;
  *(void *)(v51 + 24) = v52;
  sub_1C51AD25C(&qword_1EA3D1378, MEMORY[0x1E4F50A20]);
  swift_retain();
  uint64_t v53 = v57;
  unint64_t v54 = v58;
  sub_1C51C5BC8();
  swift_release();
  sub_1C518D144(v53, v54);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v50, v71);
  v59(v76, v74);
}

uint64_t sub_1C519D814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = a4;
  uint64_t v15 = a3;
  uint64_t v4 = sub_1C51C6468();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v16 = sub_1C51C63F8();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C51C6128();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C6118();
  sub_1C51C6138();
  sub_1C51C5918();
  sub_1C51C6428();
  sub_1C51C63E8();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v17;
  *(void *)(v12 + 16) = v15;
  *(void *)(v12 + 24) = v13;
  sub_1C51AD25C(&qword_1EA3D1380, MEMORY[0x1E4F50828]);
  swift_retain();
  sub_1C51C5BD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1C519DB08(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a4;
  uint64_t v7 = sub_1C51C6468();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = sub_1C51C63F8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C51C5E38();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    uint64_t v18 = v8;
    sub_1C51C5E28();
    sub_1C51C5E58();
    sub_1C51C5918();
    sub_1C51C6428();
    sub_1C51C63E8();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v19;
    *(void *)(v16 + 24) = a5;
    sub_1C51AD25C(&qword_1EBBD0430, MEMORY[0x1E4F50688]);
    swift_retain();
    sub_1C51C5BD8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1C519DF7C(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t a6, float a7, float a8)
{
  uint64_t v81 = a6;
  uint64_t v83 = a5;
  int v82 = a4;
  unint64_t v72 = a3;
  unint64_t v74 = a2;
  uint64_t v11 = sub_1C51C5928();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v75 = v13;
  os_signpost_id_t v92 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1388);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v94 = (uint64_t)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_1C51C60B8();
  uint64_t v79 = *(void *)(v95 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v95);
  uint64_t v90 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v93 = (char *)&v67 - v18;
  uint64_t v19 = sub_1C51C6468();
  MEMORY[0x1F4188790](v19 - 8);
  uint64_t v85 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_1C51C63F8();
  uint64_t v78 = *(void *)(v91 - 8);
  uint64_t v21 = MEMORY[0x1F4188790](v91);
  uint64_t v87 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v24 = (char *)&v67 - v23;
  uint64_t v89 = sub_1C51C5B88();
  uint64_t v76 = *(void *)(v89 - 8);
  uint64_t v25 = MEMORY[0x1F4188790](v89);
  uint64_t v86 = (char *)&v67 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = v26;
  MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)&v67 - v27;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0470);
  MEMORY[0x1F4188790](v29 - 8);
  uint64_t v31 = (char *)&v67 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v84) = sub_1C51C6738();
  sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
  uint64_t v32 = (void *)sub_1C51C67D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_1C51C7CC0;
  uint64_t v69 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v69(v31, a1, v11);
  uint64_t v77 = v12;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v31, 0, 1, v11);
  uint64_t v88 = v11;
  uint64_t v34 = sub_1C51C6378();
  uint64_t v36 = v35;
  sub_1C51ACC90((uint64_t)v31, &qword_1EBBD0470);
  uint64_t v37 = MEMORY[0x1E4FBB1A0];
  *(void *)(v33 + 56) = MEMORY[0x1E4FBB1A0];
  unint64_t v38 = sub_1C51A41F4();
  *(void *)(v33 + 64) = v38;
  *(void *)(v33 + 32) = v34;
  *(void *)(v33 + 40) = v36;
  float v96 = a7;
  char v97 = 0;
  uint64_t v39 = sub_1C51C6378();
  *(void *)(v33 + 96) = v37;
  *(void *)(v33 + 104) = v38;
  *(void *)(v33 + 72) = v39;
  *(void *)(v33 + 80) = v40;
  float v96 = a8;
  char v97 = 0;
  uint64_t v41 = sub_1C51C6378();
  *(void *)(v33 + 136) = v37;
  *(void *)(v33 + 144) = v38;
  *(void *)(v33 + 112) = v41;
  *(void *)(v33 + 120) = v42;
  sub_1C51C5A48();

  swift_bridgeObjectRelease();
  uint64_t v43 = v28;
  sub_1C51C5B78();
  sub_1C51C5918();
  sub_1C51C6428();
  sub_1C51C63E8();
  if ((~LODWORD(a7) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a7 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a7 < 9.2234e18)
  {
    uint64_t v44 = v24;
    uint64_t v45 = v93;
    sub_1C51C60A8();
    uint64_t v46 = sub_1C51C66F8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v94, 1, 1, v46);
    v69(v92, v74, v88);
    uint64_t v47 = v78;
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v87, v24, v91);
    uint64_t v48 = v79;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v90, v45, v95);
    uint64_t v49 = v76;
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
    uint64_t v68 = v43;
    v50(v86, v43, v89);
    uint64_t v51 = v77;
    uint64_t v52 = *(unsigned __int8 *)(v77 + 80);
    uint64_t v85 = v44;
    uint64_t v53 = (v52 + 32) & ~v52;
    unint64_t v72 = (v75 + v53 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v54 = (v72 + 11) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v55 = (*(unsigned __int8 *)(v47 + 80) + v54 + 8) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    unint64_t v56 = (v71 + *(unsigned __int8 *)(v48 + 80) + v55) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    uint64_t v84 = v56 + v73;
    unint64_t v57 = (v56 + v73) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v74 = (*(unsigned __int8 *)(v49 + 80) + v57 + 8) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    unint64_t v75 = (v70 + v74 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v58 = swift_allocObject();
    *(void *)(v58 + 16) = 0;
    *(void *)(v58 + 24) = 0;
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v58 + v53, v92, v88);
    *(float *)(v58 + v72) = a8;
    uint64_t v59 = v80;
    *(void *)(v58 + v54) = v80;
    uint64_t v60 = v91;
    (*(void (**)(unint64_t, char *, uint64_t))(v47 + 32))(v58 + v55, v87, v91);
    uint64_t v61 = v95;
    (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v58 + v56, v90, v95);
    *(unsigned char *)(v58 + v84) = v82 & 1;
    *(float *)(v57 + v58 + 4) = a7;
    uint64_t v62 = v89;
    (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v58 + v74, v86, v89);
    unint64_t v63 = (void *)(v58 + v75);
    uint64_t v64 = v81;
    *unint64_t v63 = v83;
    v63[1] = v64;
    id v65 = v59;
    swift_retain();
    sub_1C519FB8C(v94, (uint64_t)&unk_1EA3D1398, v58);
    swift_release();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v93, v61);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v85, v60);
    return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v68, v62);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1C519E860(float a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 128) = v19;
  *(_OWORD *)(v10 + 112) = v18;
  *(float *)(v10 + 324) = a2;
  *(unsigned char *)(v10 + 328) = a10;
  *(void *)(v10 + 96) = a8;
  *(void *)(v10 + 104) = a9;
  *(float *)(v10 + 320) = a1;
  *(void *)(v10 + 80) = a6;
  *(void *)(v10 + 88) = a7;
  uint64_t v11 = sub_1C51C5B88();
  *(void *)(v10 + 136) = v11;
  *(void *)(v10 + 144) = *(void *)(v11 - 8);
  *(void *)(v10 + 152) = swift_task_alloc();
  *(void *)(v10 + 160) = swift_task_alloc();
  uint64_t v12 = sub_1C51C60F8();
  *(void *)(v10 + 168) = v12;
  *(void *)(v10 + 176) = *(void *)(v12 - 8);
  *(void *)(v10 + 184) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1478);
  *(void *)(v10 + 192) = swift_task_alloc();
  uint64_t v13 = sub_1C51C59F8();
  *(void *)(v10 + 200) = v13;
  *(void *)(v10 + 208) = *(void *)(v13 - 8);
  *(void *)(v10 + 216) = swift_task_alloc();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1480);
  *(void *)(v10 + 224) = v14;
  *(void *)(v10 + 232) = *(void *)(v14 - 8);
  *(void *)(v10 + 240) = swift_task_alloc();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1488);
  *(void *)(v10 + 248) = v15;
  *(void *)(v10 + 256) = *(void *)(v15 - 8);
  *(void *)(v10 + 264) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1C519EB28, 0, 0);
}

uint64_t sub_1C519EB28()
{
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v4 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v17 = *(void *)(v0 + 200);
  int v6 = *(_DWORD *)(v0 + 320);
  sub_1C51C6738();
  *(void *)(v0 + 272) = sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
  uint64_t v7 = (void *)sub_1C51C67D8();
  sub_1C51C5A48();

  id v8 = objc_allocWithZone((Class)IMMultiFrameImage);
  uint64_t v9 = (void *)sub_1C51C58D8();
  LODWORD(v10) = v6;
  *(void *)(v0 + 280) = objc_msgSend(v8, sel_initForWritingWithFileURL_scale_, v9, v10);

  uint64_t v11 = *MEMORY[0x1E4F1DB30];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  *(void *)(v0 + 288) = *MEMORY[0x1E4F1DB30];
  *(void *)(v0 + 296) = v12;
  *(void *)(v0 + 16) = v11;
  *(void *)(v0 + 24) = v12;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  sub_1C51C59E8();
  sub_1C51AD25C(&qword_1EA3D1490, MEMORY[0x1E4F507F8]);
  sub_1C51C5BA8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v17);
  sub_1C51C6708();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1C519EDB4;
  uint64_t v14 = *(void *)(v0 + 248);
  uint64_t v15 = *(void *)(v0 + 192);
  return MEMORY[0x1F4187ED8](v15, 0, 0, v14, v0 + 48);
}

uint64_t sub_1C519EDB4()
{
  *(void *)(*(void *)v1 + 312) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1C519F544;
  }
  else {
    uint64_t v2 = sub_1C519EEF4;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_1C519EEF4()
{
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 176);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = *(void **)(v0 + 280);
    (*(void (**)(void, void))(*(void *)(v0 + 256) + 8))(*(void *)(v0 + 264), *(void *)(v0 + 248));
    *(void *)(v0 + 72) = 0;
    unsigned __int8 v5 = objc_msgSend(v4, sel_finalizeOptimizedBitmapWithError_, v0 + 72);
    int v6 = *(void **)(v0 + 72);
    if (v5)
    {
      id v7 = v6;
      sub_1C51C5B78();
      unint64_t v8 = sub_1C51C5B68();
      unint64_t v9 = sub_1C51C5B68();
      unint64_t v10 = v8 - v9;
      if (v8 >= v9)
      {
        uint64_t v11 = *(void **)(v0 + 280);
        uint64_t v12 = *(void *)(v0 + 160);
        uint64_t v13 = *(void *)(v0 + 136);
        uint64_t v14 = *(void *)(v0 + 144);
        uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, void, double, double))(v0 + 120);
        double v16 = (double)v10 / 1000000000.0;
        sub_1C51C6758();
        uint64_t v17 = (void *)sub_1C51C67D8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
        uint64_t v18 = swift_allocObject();
        uint64_t v19 = MEMORY[0x1E4FBB3D0];
        *(_OWORD *)(v18 + 16) = xmmword_1C51C7CA0;
        uint64_t v20 = MEMORY[0x1E4FBB460];
        *(void *)(v18 + 56) = v19;
        *(void *)(v18 + 64) = v20;
        *(double *)(v18 + 32) = v16;
        sub_1C51C5A48();
        swift_bridgeObjectRelease();

        double v21 = *(double *)(v0 + 16);
        double v22 = *(double *)(v0 + 24);
        uint64_t v23 = *(void *)(v0 + 32);
        uint64_t v24 = *(void *)(v0 + 40);
        swift_bridgeObjectRetain();
        v15(1, v23, v24, 0, v21, v22);

        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
        swift_bridgeObjectRelease();
LABEL_13:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v59 = *(uint64_t (**)(void))(v0 + 8);
        return v59();
      }
      goto LABEL_19;
    }
    id v41 = v6;
    uint64_t v34 = (void *)sub_1C51C58B8();

    swift_willThrow();
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1C51C5B78();
    unint64_t v42 = sub_1C51C5B68();
    unint64_t v43 = sub_1C51C5B68();
    BOOL v44 = v42 >= v43;
    unint64_t v45 = v42 - v43;
    if (v44)
    {
      os_log_type_t v46 = sub_1C51C6748();
      uint64_t v47 = sub_1C51C67D8();
      if (os_log_type_enabled(v47, v46))
      {
        double v48 = (double)v45 / 1000000000.0;
        MEMORY[0x1C878C630](v34);
        MEMORY[0x1C878C630](v34);
        uint64_t v49 = swift_slowAlloc();
        uint64_t v50 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = 138412546;
        MEMORY[0x1C878C630](v34);
        uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 56) = v51;
        sub_1C51C6818();
        *uint64_t v50 = v51;

        *(_WORD *)(v49 + 12) = 2048;
        *(double *)(v0 + 64) = v48;
        sub_1C51C6818();
        _os_log_impl(&dword_1C5188000, v47, v46, "Multi-frame image error: %@ (%f ", (uint8_t *)v49, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1498);
        swift_arrayDestroy();
        MEMORY[0x1C878C780](v50, -1, -1);
        MEMORY[0x1C878C780](v49, -1, -1);
      }
      double v53 = *(double *)(v0 + 288);
      double v52 = *(double *)(v0 + 296);
      unint64_t v54 = *(void **)(v0 + 280);
      uint64_t v56 = *(void *)(v0 + 144);
      uint64_t v55 = *(void *)(v0 + 152);
      uint64_t v57 = *(void *)(v0 + 136);
      uint64_t v58 = *(void (**)(void, void, void, void *, double, double))(v0 + 120);

      objc_msgSend(v54, sel_deleteStream);
      MEMORY[0x1C878C630](v34);
      v58(0, 0, 0, v34, v53, v52);

      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
      goto LABEL_13;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  uint64_t v25 = *(void **)(v0 + 312);
  uint64_t v26 = *(void **)(v0 + 280);
  uint64_t v27 = *(void *)(v0 + 184);
  float v28 = *(float *)(v0 + 324);
  char v29 = *(unsigned char *)(v0 + 328);
  uint64_t v30 = *(void *)(v0 + 88);
  float v31 = *(float *)(v0 + 320);
  uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v27, v1, v2);
  uint64_t v33 = (void *)MEMORY[0x1C878C100](v32);
  sub_1C519F840(v28, v31, v27, v30, v29, v26, (double *)(v0 + 16), (uint64_t *)(v0 + 32));
  if (v25)
  {
    uint64_t v34 = v25;
    uint64_t v36 = *(void *)(v0 + 256);
    uint64_t v35 = *(void *)(v0 + 264);
    uint64_t v37 = *(void *)(v0 + 248);
    uint64_t v39 = *(void *)(v0 + 176);
    uint64_t v38 = *(void *)(v0 + 184);
    uint64_t v40 = *(void *)(v0 + 168);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    goto LABEL_8;
  }
  uint64_t v62 = *(void *)(v0 + 176);
  uint64_t v61 = *(void *)(v0 + 184);
  uint64_t v63 = *(void *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v63);
  uint64_t v64 = (void *)swift_task_alloc();
  *(void *)(v0 + 304) = v64;
  *uint64_t v64 = v0;
  v64[1] = sub_1C519EDB4;
  uint64_t v65 = *(void *)(v0 + 248);
  uint64_t v66 = *(void *)(v0 + 192);
  return MEMORY[0x1F4187ED8](v66, 0, 0, v65, v0 + 48);
}

uint64_t sub_1C519F544()
{
  (*(void (**)(void, void))(*(void *)(v0 + 256) + 8))(*(void *)(v0 + 264), *(void *)(v0 + 248));
  uint64_t v1 = *(void **)(v0 + 48);
  swift_bridgeObjectRelease();
  sub_1C51C5B78();
  unint64_t v2 = sub_1C51C5B68();
  unint64_t v3 = sub_1C51C5B68();
  BOOL v4 = v2 >= v3;
  unint64_t v5 = v2 - v3;
  if (!v4) {
    __break(1u);
  }
  os_log_type_t v6 = sub_1C51C6748();
  id v7 = sub_1C51C67D8();
  if (os_log_type_enabled(v7, v6))
  {
    double v8 = (double)v5 / 1000000000.0;
    MEMORY[0x1C878C630](v1);
    MEMORY[0x1C878C630](v1);
    uint64_t v9 = swift_slowAlloc();
    unint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412546;
    MEMORY[0x1C878C630](v1);
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 56) = v11;
    sub_1C51C6818();
    *unint64_t v10 = v11;

    *(_WORD *)(v9 + 12) = 2048;
    *(double *)(v0 + 64) = v8;
    sub_1C51C6818();
    _os_log_impl(&dword_1C5188000, v7, v6, "Multi-frame image error: %@ (%f ", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1498);
    swift_arrayDestroy();
    MEMORY[0x1C878C780](v10, -1, -1);
    MEMORY[0x1C878C780](v9, -1, -1);
  }
  double v13 = *(double *)(v0 + 288);
  double v12 = *(double *)(v0 + 296);
  uint64_t v14 = *(void **)(v0 + 280);
  uint64_t v16 = *(void *)(v0 + 144);
  uint64_t v15 = *(void *)(v0 + 152);
  uint64_t v17 = *(void *)(v0 + 136);
  uint64_t v18 = *(void (**)(void, void, void, void *, double, double))(v0 + 120);

  objc_msgSend(v14, sel_deleteStream);
  MEMORY[0x1C878C630](v1);
  v18(0, 0, 0, v1, v13, v12);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
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

void sub_1C519F840(float a1, float a2, uint64_t a3, uint64_t a4, char a5, void *a6, double *a7, uint64_t *a8)
{
  v47[2] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v14 = (void *)sub_1C51C60E8();
  uint64_t v15 = (void *)sub_1C51C6398();

  uint64_t v16 = (void *)sub_1C51C6098();
  if (!v16)
  {
    v47[0] = 0;
    v47[1] = (id)0xE000000000000000;
    type metadata accessor for BlastDoorInstanceType(0);
    sub_1C51C6928();
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    swift_allocError();
    sub_1C51C6518();
    swift_willThrow();
    return;
  }
  if (a5)
  {
    uint64_t v17 = v16;
  }
  else
  {
    double Width = (double)(uint64_t)CGImageGetWidth((CGImageRef)v16);
    int64_t Height = CGImageGetHeight((CGImageRef)v16);
    double v20 = CGSizeMake(Width, (double)Height);
    double v22 = v20 / v21;
    double v23 = fmin(v22, 1.77777778);
    if (v22 < 0.75) {
      double v23 = 0.75;
    }
    double v24 = a1;
    double v25 = a1 / v23;
    double v26 = CGRound(v24);
    double v27 = CGRound(v25);
    double v28 = CGSizeMake(v26, v27);
    sub_1C51BC95C(v28, v29);
    if (v8)
    {

      return;
    }
  }
  uint64_t v30 = v17;
  double v31 = COERCE_DOUBLE(sub_1C51C60D8());
  if (v32) {
    double v31 = 0.1;
  }
  v47[0] = 0;
  if (objc_msgSend(a6, sel_writeAsOptimizedBitmapWithImage_duration_error_, v30, v47, v31))
  {
    if (*a7 == *MEMORY[0x1E4F1DB30])
    {
      double v33 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v34 = a7[1];
      id v35 = v47[0];
      if (v34 == v33)
      {
        double v36 = (double)(uint64_t)CGImageGetWidth(v30);
        int64_t v37 = CGImageGetHeight(v30);
        double v38 = CGSizeMake(v36, (double)v37);
        *a7 = CGSizeMake(v38 / a2, v39 / a2);
        *((void *)a7 + 1) = v40;
      }
    }
    else
    {
      id v42 = v47[0];
    }
    uint64_t v43 = sub_1C51C60C8();
    uint64_t v45 = v44;

    *a8 = v43;
    a8[1] = v45;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v41 = v47[0];
    sub_1C51C58B8();

    swift_willThrow();
  }
}

uint64_t sub_1C519FB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C66F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1C51C66E8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1C51ACC90(a1, &qword_1EA3D1388);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C51C66D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_1C519FEF0(char a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a5)
  {
    double v12 = (void *)sub_1C51C6588();
    if (a6)
    {
LABEL_3:
      uint64_t v13 = sub_1C51C58A8();
      goto LABEL_6;
    }
  }
  else
  {
    double v12 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  id v14 = (id)v13;
  (*(void (**)(uint64_t, void, void *, double, double))(a7 + 16))(a7, a1 & 1, v12, a2, a3);
}

uint64_t sub_1C519FFA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = a4;
  uint64_t v15 = a3;
  uint64_t v4 = sub_1C51C6468();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v16 = sub_1C51C63F8();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C51C61A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C6198();
  sub_1C51C61B8();
  sub_1C51C5918();
  sub_1C51C6428();
  sub_1C51C63E8();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v17;
  *(void *)(v12 + 16) = v15;
  *(void *)(v12 + 24) = v13;
  sub_1C51AD25C(&qword_1EA3D13A0, MEMORY[0x1E4F508C8]);
  swift_retain();
  sub_1C51C5BD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1C51A029C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5, uint64_t a6, uint64_t a7, void (*a8)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13 = sub_1C51C5928();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = _Block_copy(a5);
  sub_1C51C58F8();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  id v19 = a1;
  a8(v16, a4, a7, v18);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_1C51A03E8(float a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v20 = a6;
  uint64_t v18 = a5;
  uint64_t v7 = sub_1C51C6468();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v19 = sub_1C51C63F8();
  uint64_t v8 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C51C5E38();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~LODWORD(a1) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.2234e18)
  {
    sub_1C51C5E28();
    sub_1C51C5E58();
    sub_1C51C5918();
    sub_1C51C6428();
    sub_1C51C63E8();
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = v20;
    *(void *)(v15 + 16) = v18;
    *(void *)(v15 + 24) = v16;
    sub_1C51AD25C(&qword_1EBBD0430, MEMORY[0x1E4F50688]);
    swift_retain();
    sub_1C51C5BD8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
LABEL_7:
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1C51A0864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C51C6168();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  sub_1C51AD25C(&qword_1EA3D13A8, MEMORY[0x1E4F50888]);
  swift_retain();
  sub_1C51C5C08();

  return swift_release();
}

uint64_t sub_1C51A0AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_1C51C6558();
  v17[0] = 0;
  id v7 = objc_msgSend(v5, sel_dataWithPropertyList_format_options_error_, v6, 200, 0, v17);

  id v8 = v17[0];
  if (v7)
  {
    uint64_t v9 = sub_1C51C5998();
    unint64_t v11 = v10;

    sub_1C51C62E8();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a3;
    sub_1C51AD25C(&qword_1EA3D13B0, MEMORY[0x1E4F509A0]);
    swift_retain();
    sub_1C51C5C08();
    swift_release();
    return sub_1C518D144(v9, v11);
  }
  else
  {
    uint64_t v14 = v8;
    uint64_t v15 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v16 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    uint64_t result = sub_1C51C6948();
    __break(1u);
  }
  return result;
}

void sub_1C51A0D58(uint64_t a1, void (*a2)(uint64_t, uint64_t, void *), uint64_t a3)
{
  uint64_t v19 = a3;
  uint64_t v20 = a2;
  uint64_t v4 = sub_1C51C62B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1C51C62E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  unint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1450);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (void **)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1C51AD1BC(a1, (uint64_t)v14, &qword_1EA3D1450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = *v14;
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F50990], v4);
    uint64_t v16 = sub_1C51C62A8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    MEMORY[0x1C878C630](v15);
    v20(v16, 0, v15);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v9 + 32))(v11, v14, v8);
    sub_1C51C62D8();
    uint64_t v17 = sub_1C51C62A8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v18 = sub_1C51C62C8();
    v20(v17, v18, 0);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t sub_1C51A1058(void *a1, int a2, int a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = sub_1C51C6568();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  id v13 = a1;
  a7(v11, a6, v12);

  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_1C51A1124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = (void *)sub_1C51C66C8();
    if (a3)
    {
LABEL_3:
      uint64_t v8 = sub_1C51C58A8();
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  id v9 = (id)v8;
  (*(void (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, a1, v7);
}

uint64_t sub_1C51A11CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C51C6228();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  sub_1C51AD25C(&qword_1EA3D13B8, MEMORY[0x1E4F50948]);
  swift_retain();
  sub_1C51C5C08();

  return swift_release();
}

void sub_1C51A1440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_1C51C58A8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_1C51A14B0()
{
  return sub_1C51A1568();
}

uint64_t sub_1C51A150C()
{
  return sub_1C51A1568();
}

uint64_t sub_1C51A1568()
{
  v9[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  uint64_t v1 = (void *)sub_1C51C6558();
  v9[0] = 0;
  id v2 = objc_msgSend(v0, sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v9);

  id v3 = v9[0];
  if (v2)
  {
    uint64_t v4 = sub_1C51C5998();
    unint64_t v6 = v5;

    sub_1C51C6188();
    sub_1C51AD25C(&qword_1EA3D13C0, MEMORY[0x1E4F508B0]);
    sub_1C51C5C18();
    return sub_1C518D144(v4, v6);
  }
  else
  {
    uint64_t v8 = v3;
    sub_1C51C58B8();

    return swift_willThrow();
  }
}

uint64_t sub_1C51A1704()
{
  return sub_1C51C5C18();
}

uint64_t sub_1C51A17AC()
{
  uint64_t v2 = sub_1C51C5FF8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1C51AD25C((unint64_t *)&qword_1EA3D13C8, MEMORY[0x1E4F50770]);
  sub_1C51C5C18();
  if (!v1)
  {
    uint64_t v6 = sub_1C51C5FB8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6;
}

uint64_t sub_1C51A1AE4()
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = sub_1C51C6218();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  unint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  id v7 = (void *)sub_1C51C6558();
  v18[0] = 0;
  id v8 = objc_msgSend(v6, sel_dataWithPropertyList_format_options_error_, v7, 200, 0, v18);

  id v9 = v18[0];
  if (v8)
  {
    uint64_t v10 = sub_1C51C5998();
    unint64_t v12 = v11;

    uint64_t v13 = *(void *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
    sub_1C51AD25C(&qword_1EA3D13D0, MEMORY[0x1E4F50930]);
    sub_1C51C5C18();
    if (v1)
    {
      sub_1C518D144(v10, v12);
    }
    else
    {
      uint64_t v13 = sub_1C51C61F8();
      sub_1C518D144(v10, v12);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return v13;
  }
  else
  {
    uint64_t v15 = v9;
    uint64_t v16 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v17 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();

    uint64_t result = sub_1C51C6948();
    __break(1u);
  }
  return result;
}

id sub_1C51A1DF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v7 = sub_1C51C6568();
  id v8 = a1;
  id v9 = (void *)a5(v7);
  swift_bridgeObjectRelease();

  return v9;
}

uint64_t sub_1C51A1ED8()
{
  uint64_t v1 = sub_1C51C5D18();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51AD25C(&qword_1EA3D13D8, MEMORY[0x1E4F505C8]);
  uint64_t result = sub_1C51C5C28();
  if (!v0)
  {
    sub_1C51C5D08();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

uint64_t sub_1C51A2028(uint64_t a1)
{
  uint64_t v41 = sub_1C51C5D18();
  uint64_t v35 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v43 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1C51C63F8();
  uint64_t v38 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  double v39 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C51C5B38();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  MEMORY[0x1F4188790](v4);
  int64_t v37 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C51C5928();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0480);
  MEMORY[0x1F4188790](v10 - 8);
  unint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1C51C6468();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v31 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  sub_1C51C6448();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_1C51ACC90((uint64_t)v12, &qword_1EBBD0480);
    sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
    uint64_t v20 = sub_1C51C6B18();
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    swift_allocError();
    sub_1C51C6518();
    swift_willThrow();
  }
  else
  {
    double v22 = v37;
    uint64_t v21 = v38;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    uint64_t v32 = v14;
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    double v23 = v39;
    sub_1C51C63E8();
    uint64_t v20 = *(void *)(v40 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
    sub_1C51AD25C(&qword_1EA3D13D8, MEMORY[0x1E4F505C8]);
    uint64_t v25 = v41;
    uint64_t v24 = v42;
    sub_1C51C5C28();
    double v26 = v23;
    if (v24)
    {
      uint64_t v27 = v32;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v36);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v13);
    }
    else
    {
      sub_1C51C5D08();
      uint64_t v42 = v13;
      double v29 = v19;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v43, v25);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v36);
      sub_1C51C57F8();
      swift_allocObject();
      sub_1C51C57E8();
      sub_1C51AD25C(&qword_1EA3D13E0, MEMORY[0x1E4F727B0]);
      uint64_t v30 = v34;
      uint64_t v20 = sub_1C51C57D8();
      swift_release();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v22, v30);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v42);
    }
  }
  return v20;
}

uint64_t sub_1C51A28A8()
{
  uint64_t v2 = sub_1C51C6318();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1C51AD25C(&qword_1EA3D13E8, MEMORY[0x1E4F509B0]);
  sub_1C51C5C18();
  if (!v1)
  {
    uint64_t v6 = sub_1C51C62F8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6;
}

uint64_t sub_1C51A2BE0()
{
  uint64_t v2 = sub_1C51C6288();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1C51AD25C(&qword_1EA3D13F0, MEMORY[0x1E4F50970]);
  sub_1C51C5C18();
  if (!v1)
  {
    uint64_t v6 = sub_1C51C6278();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6;
}

uint64_t sub_1C51A2F18()
{
  uint64_t v2 = sub_1C51C6338();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd);
  sub_1C51AD25C(&qword_1EA3D13F8, MEMORY[0x1E4F509C0]);
  sub_1C51C5C18();
  if (!v1)
  {
    uint64_t v6 = sub_1C51C6328();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6;
}

id MessagesBlastDoorInterface.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void MessagesBlastDoorInterface.init()()
{
}

id MessagesBlastDoorInterface.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesBlastDoorInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C51A3364(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1C51A3440;
  return v6(a1);
}

uint64_t sub_1C51A3440()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1C51A3538(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1C51A360C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1C51A4248((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1C51A4248((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C51A360C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C51C6828();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1C51A37C8(a5, a6);
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
  uint64_t v8 = sub_1C51C68C8();
  if (!v8)
  {
    sub_1C51C6938();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1C51C6988();
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

uint64_t sub_1C51A37C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1C51A3860(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1C51A3A40(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1C51A3A40(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C51A3860(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1C51A39D8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1C51C6888();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1C51C6938();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1C51C6668();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1C51C6988();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1C51C6938();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1C51A39D8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D14B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C51A3A40(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D14B8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
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
  uint64_t result = sub_1C51C6988();
  __break(1u);
  return result;
}

unint64_t sub_1C51A3B90(uint64_t a1, uint64_t a2)
{
  sub_1C51C6BD8();
  sub_1C51C6608();
  uint64_t v4 = sub_1C51C6C08();

  return sub_1C51A3C4C(a1, a2, v4);
}

unint64_t sub_1C51A3C08(uint64_t a1)
{
  uint64_t v2 = sub_1C51C6BC8();

  return sub_1C51A3D30(a1, v2);
}

unint64_t sub_1C51A3C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C51C6B28() & 1) == 0)
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
      while (!v14 && (sub_1C51C6B28() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C51A3D30(uint64_t a1, uint64_t a2)
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

id sub_1C51A3DCC(void *a1)
{
  uint64_t v14 = sub_1C51C6778();
  uint64_t v3 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51C6768();
  MEMORY[0x1F4188790]();
  sub_1C51C5B58();
  MEMORY[0x1F4188790]();
  *(void *)&v1[OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_type] = a1;
  unint64_t v6 = self;
  uint64_t v7 = v1;
  id v8 = a1;
  id v9 = objc_msgSend(v6, sel_standardUserDefaults);
  NSUserDefaults.isMessagesLockdownModeEnabled.getter();

  v13[1] = sub_1C51C5C38();
  sub_1C51AD220(0, &qword_1EBBD0488);
  id v10 = v8;
  sub_1C51C5B48();
  uint64_t v16 = MEMORY[0x1E4FBC860];
  sub_1C51AD25C(&qword_1EBBD0490, MEMORY[0x1E4FBCC10]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0498);
  sub_1C51AD2A4();
  sub_1C51C6858();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FBCC58], v14);
  sub_1C51C6788();
  *(void *)&v7[OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd] = sub_1C51C5B98();

  BOOL v11 = (objc_class *)type metadata accessor for MessagesBlastDoorInterface();
  v15.receiver = v7;
  v15.super_class = v11;
  return objc_msgSendSuper2(&v15, sel_init);
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

unint64_t sub_1C51A41F4()
{
  unint64_t result = qword_1EBBD0438;
  if (!qword_1EBBD0438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBD0438);
  }
  return result;
}

uint64_t sub_1C51A4248(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C51A42A4()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 33, 7);
}

void sub_1C51A42E0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50A08], &qword_1EA3D1538);
}

void sub_1C51A4320(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50908], &qword_1EA3D1530);
}

void sub_1C51A4360(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F509F0], &qword_1EA3D1528);
}

void sub_1C51A43A0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50858], &qword_1EA3D1520);
}

void sub_1C51A43E0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F507E8], &qword_1EA3D1518);
}

void sub_1C51A4420(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50628], &qword_1EA3D11A8);
}

void sub_1C51A4460(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50810], &qword_1EA3D1510);
}

void sub_1C51A44A0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F508F0], &qword_1EA3D1508);
}

void sub_1C51A44E0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50920], &qword_1EA3D1500);
}

void sub_1C51A4520(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F507D0], &qword_1EA3D14F8);
}

void sub_1C51A4560(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F506E0], &qword_1EA3D14F0);
}

void sub_1C51A45A0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50610], &qword_1EA3D11B8);
}

void sub_1C51A45E0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F507A0], &qword_1EA3D14E8);
}

void sub_1C51A4620(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50748], &qword_1EA3D11A0);
}

void sub_1C51A4660(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50640], &qword_1EA3D14E0);
}

void sub_1C51A46A0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50788], &qword_1EA3D14D8);
}

uint64_t sub_1C51A46E0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C51A4718(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(101, a1, a2);
}

uint64_t sub_1C51A474C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1C51A4774(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F505B8], &qword_1EA3D11C8);
}

void sub_1C51A47B4(uint64_t a1)
{
  sub_1C5192D14(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50960], &qword_1EA3D14D0, MEMORY[0x1E4F50950]);
}

void sub_1C51A4800(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50710], &qword_1EA3D14C8);
}

void sub_1C51A4840(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F508A0], &qword_1EA3D14C0);
}

uint64_t sub_1C51A4880(uint64_t a1, uint64_t a2, void (**a3)(void, void, void, void))
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C51C6528();
  uint64_t v81 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  uint64_t v9 = *(void *)(a1 + 16);
  _Block_copy(a3);
  if (!v9
    || (unint64_t v10 = sub_1C51A3B90(0xD00000000000001DLL, 0x80000001C51C99F0), (v11 & 1) == 0)
    || (sub_1C51A4248(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v84),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0),
        !swift_dynamicCast()))
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v63 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v64 = swift_allocObject();
    *(_OWORD *)(v64 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v84 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0);
    uint64_t v65 = sub_1C51C6378();
    uint64_t v67 = v66;
    *(void *)(v64 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v64 + 64) = sub_1C51A41F4();
    *(void *)(v64 + 32) = v65;
    *(void *)(v64 + 40) = v67;
    sub_1C51C5A48();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
LABEL_41:
    sub_1C51C6948();
    __break(1u);
    JUMPOUT(0x1C51A5D5CLL);
  }
  uint64_t v12 = v83;
  if (*(void *)(v83 + 16))
  {
    unint64_t v13 = sub_1C51A3B90(17263, 0xE200000000000000);
    if (v14)
    {
      sub_1C51A4248(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v84);
      if (swift_dynamicCast())
      {
        unsigned __int8 v15 = v82;
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(void *)(v12 + 16) && (unint64_t v16 = sub_1C51A3B90(99, 0xE100000000000000), (v17 & 1) != 0))
  {
    sub_1C51A4248(*(void *)(v12 + 56) + 32 * v16, (uint64_t)&v84);
  }
  else
  {
    long long v84 = 0u;
    long long v85 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v85 + 1))
  {
    sub_1C51ACC90((uint64_t)&v84, &qword_1EBBD04A8);
    goto LABEL_40;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_40:
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v76 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v84 = a1;
    uint64_t v78 = sub_1C51C6378();
    uint64_t v80 = v79;
    *(void *)(v77 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v77 + 64) = sub_1C51A41F4();
    *(void *)(v77 + 32) = v78;
    *(void *)(v77 + 40) = v80;
    sub_1C51C5A48();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_41;
  }
  unsigned __int8 v15 = v83;
LABEL_15:
  __int16 v18 = sub_1C51BAB20(v15);
  if ((v18 & 0x100) != 0)
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v68 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_1C51C7CA0;
    LOWORD(v84) = v15;
    uint64_t v70 = sub_1C51C6378();
    uint64_t v72 = v71;
    *(void *)(v69 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v69 + 64) = sub_1C51A41F4();
    *(void *)(v69 + 32) = v70;
    *(void *)(v69 + 40) = v72;
    sub_1C51C5A48();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_41;
  }
  unsigned __int8 v19 = v18;
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_1C51C6558();
  *(void *)&long long v84 = 0;
  id v22 = objc_msgSend(v20, sel_dataWithPropertyList_format_options_error_, v21, 200, 0, &v84);

  id v23 = (id)v84;
  if (!v22)
  {
    uint64_t v73 = v23;
    unint64_t v74 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    unint64_t v75 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();
    swift_release();

    _Block_release(a3);
    goto LABEL_41;
  }
  uint64_t v24 = sub_1C51C5998();
  unint64_t v26 = v25;

  uint64_t v27 = v19;
  switch(v19)
  {
    case 0x64u:
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = sub_1C51AD5D8;
      *(void *)(v28 + 24) = v8;
      *(unsigned char *)(v28 + 32) = 100;
      sub_1C51C5DA8();
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = sub_1C51A42DC;
      *(void *)(v29 + 24) = v28;
      sub_1C51AD25C(&qword_1EA3D1198, MEMORY[0x1E4F50628]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x65u:
      uint64_t v46 = swift_allocObject();
      *(void *)(v46 + 16) = sub_1C51AD5D8;
      *(void *)(v46 + 24) = v8;
      *(unsigned char *)(v46 + 32) = 101;
      sub_1C51C5F88();
      uint64_t v47 = swift_allocObject();
      *(void *)(v47 + 16) = sub_1C51A42DC;
      *(void *)(v47 + 24) = v46;
      sub_1C51AD25C(&qword_1EBBD03D8, MEMORY[0x1E4F50748]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x66u:
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = sub_1C51AD5D8;
      *(void *)(v36 + 24) = v8;
      *(unsigned char *)(v36 + 32) = 102;
      sub_1C51C5D98();
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = sub_1C51A42DC;
      *(void *)(v37 + 24) = v36;
      sub_1C51AD25C(&qword_1EA3D11B0, MEMORY[0x1E4F50610]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x69u:
      uint64_t v52 = swift_allocObject();
      *(void *)(v52 + 16) = sub_1C51AD5D8;
      *(void *)(v52 + 24) = v8;
      *(unsigned char *)(v52 + 32) = 105;
      sub_1C51C5F38();
      uint64_t v53 = swift_allocObject();
      *(void *)(v53 + 16) = sub_1C51A42DC;
      *(void *)(v53 + 24) = v52;
      sub_1C51AD25C(&qword_1EA3D1330, MEMORY[0x1E4F506E0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x6Fu:
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = sub_1C51AD5D8;
      *(void *)(v54 + 24) = v8;
      *(unsigned char *)(v54 + 32) = 111;
      sub_1C51C6078();
      uint64_t v55 = swift_allocObject();
      *(void *)(v55 + 16) = sub_1C51A42DC;
      *(void *)(v55 + 24) = v54;
      sub_1C51AD25C(&qword_1EA3D1328, MEMORY[0x1E4F507D0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x70u:
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = sub_1C51AD5D8;
      *(void *)(v42 + 24) = v8;
      *(unsigned char *)(v42 + 32) = 112;
      sub_1C51C61E8();
      uint64_t v43 = swift_allocObject();
      *(void *)(v43 + 16) = sub_1C51A42DC;
      *(void *)(v43 + 24) = v42;
      sub_1C51AD25C(&qword_1EA3D1320, MEMORY[0x1E4F50920]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x71u:
      uint64_t v48 = swift_allocObject();
      *(void *)(v48 + 16) = sub_1C51AD5D8;
      *(void *)(v48 + 24) = v8;
      *(unsigned char *)(v48 + 32) = 113;
      sub_1C51C61C8();
      uint64_t v49 = swift_allocObject();
      *(void *)(v49 + 16) = sub_1C51A42DC;
      *(void *)(v49 + 24) = v48;
      sub_1C51AD25C(&qword_1EA3D1318, MEMORY[0x1E4F508F0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x74u:
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = sub_1C51AD5D8;
      *(void *)(v50 + 24) = v8;
      *(unsigned char *)(v50 + 32) = 116;
      sub_1C51C6088();
      uint64_t v51 = swift_allocObject();
      *(void *)(v51 + 16) = sub_1C51A42DC;
      *(void *)(v51 + 24) = v50;
      sub_1C51AD25C(&qword_1EA3D1308, MEMORY[0x1E4F507E8]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x76u:
      uint64_t v58 = swift_allocObject();
      *(void *)(v58 + 16) = sub_1C51AD5D8;
      *(void *)(v58 + 24) = v8;
      *(unsigned char *)(v58 + 32) = 118;
      sub_1C51C6108();
      uint64_t v59 = swift_allocObject();
      *(void *)(v59 + 16) = sub_1C51A42DC;
      *(void *)(v59 + 24) = v58;
      sub_1C51AD25C(&qword_1EA3D1310, MEMORY[0x1E4F50810]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x77u:
      uint64_t v60 = swift_allocObject();
      *(void *)(v60 + 16) = sub_1C51AD5D8;
      *(void *)(v60 + 24) = v8;
      *(unsigned char *)(v60 + 32) = 119;
      sub_1C51C6148();
      uint64_t v61 = swift_allocObject();
      *(void *)(v61 + 16) = sub_1C51A42DC;
      *(void *)(v61 + 24) = v60;
      sub_1C51AD25C(&qword_1EA3D1300, MEMORY[0x1E4F50858]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x78u:
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = sub_1C51AD5D8;
      *(void *)(v32 + 24) = v8;
      *(unsigned char *)(v32 + 32) = 120;
      sub_1C51C5DB8();
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = sub_1C51A42DC;
      *(void *)(v33 + 24) = v32;
      sub_1C51AD25C(&qword_1EA3D1340, MEMORY[0x1E4F50640]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x86u:
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = sub_1C51AD5D8;
      *(void *)(v44 + 24) = v8;
      *(unsigned char *)(v44 + 32) = -122;
      sub_1C51C61D8();
      uint64_t v45 = swift_allocObject();
      *(void *)(v45 + 16) = sub_1C51A42DC;
      *(void *)(v45 + 24) = v44;
      sub_1C51AD25C(&qword_1EA3D12F0, MEMORY[0x1E4F50908]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x87u:
      uint64_t v34 = swift_allocObject();
      *(void *)(v34 + 16) = sub_1C51AD5D8;
      *(void *)(v34 + 24) = v8;
      *(unsigned char *)(v34 + 32) = -121;
      sub_1C51C6388();
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = sub_1C51A42DC;
      *(void *)(v35 + 24) = v34;
      sub_1C51AD25C(&qword_1EA3D12E8, MEMORY[0x1E4F50A08]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0x8Bu:
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = sub_1C51AD5D8;
      *(void *)(v30 + 24) = v8;
      *(unsigned char *)(v30 + 32) = -117;
      sub_1C51C6348();
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = sub_1C51A42DC;
      *(void *)(v31 + 24) = v30;
      sub_1C51AD25C(&qword_1EA3D12F8, MEMORY[0x1E4F509F0]);
      swift_retain();
      swift_retain();
      goto LABEL_34;
    case 0xAAu:
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = sub_1C51AD5D8;
      *(void *)(v56 + 24) = v8;
      *(unsigned char *)(v56 + 32) = -86;
      sub_1C51C6018();
      uint64_t v57 = swift_allocObject();
      *(void *)(v57 + 16) = sub_1C51A42DC;
      *(void *)(v57 + 24) = v56;
      sub_1C51AD25C(&qword_1EA3D1338, MEMORY[0x1E4F507A0]);
      swift_retain();
      swift_retain();
LABEL_34:
      sub_1C51C5C08();
      swift_release();
      sub_1C518D144(v24, v26);
      swift_release();
      break;
    default:
      *(void *)&long long v84 = 0;
      *((void *)&v84 + 1) = 0xE000000000000000;
      LOBYTE(v83) = v19;
      sub_1C51C6928();
      sub_1C51C6518();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      uint64_t v38 = (void *)swift_allocError();
      uint64_t v39 = v81;
      (*(void (**)(uint64_t, char *, uint64_t))(v81 + 16))(v40, v7, v5);
      uint64_t v41 = (void *)sub_1C51C58A8();
      ((void (**)(void, uint64_t, void, void *))a3)[2](a3, v27, 0, v41);

      sub_1C518D144(v24, v26);
      (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v5);
      break;
  }
  return swift_release();
}

uint64_t sub_1C51A5E78(uint64_t a1, uint64_t a2, void (**a3)(void, void, void, void))
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1C51C6528();
  uint64_t v57 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  uint64_t v9 = *(void *)(a1 + 16);
  _Block_copy(a3);
  if (!v9
    || (unint64_t v10 = sub_1C51A3B90(0xD00000000000001DLL, 0x80000001C51C99F0), (v11 & 1) == 0)
    || (sub_1C51A4248(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v60),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0),
        !swift_dynamicCast()))
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v39 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v60 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD03D0);
    uint64_t v41 = sub_1C51C6378();
    uint64_t v43 = v42;
    *(void *)(v40 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v40 + 64) = sub_1C51A41F4();
    *(void *)(v40 + 32) = v41;
    *(void *)(v40 + 40) = v43;
    sub_1C51C5A48();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
LABEL_29:
    sub_1C51C6948();
    __break(1u);
    JUMPOUT(0x1C51A694CLL);
  }
  uint64_t v12 = v59;
  if (*(void *)(v59 + 16))
  {
    unint64_t v13 = sub_1C51A3B90(17263, 0xE200000000000000);
    if (v14)
    {
      sub_1C51A4248(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v60);
      if (swift_dynamicCast())
      {
        unsigned __int8 v15 = v58;
        swift_bridgeObjectRelease();
        goto LABEL_15;
      }
    }
  }
  if (*(void *)(v12 + 16) && (unint64_t v16 = sub_1C51A3B90(99, 0xE100000000000000), (v17 & 1) != 0))
  {
    sub_1C51A4248(*(void *)(v12 + 56) + 32 * v16, (uint64_t)&v60);
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v61 + 1))
  {
    sub_1C51ACC90((uint64_t)&v60, &qword_1EBBD04A8);
    goto LABEL_28;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v52 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_1C51C7CA0;
    *(void *)&long long v60 = a1;
    uint64_t v54 = sub_1C51C6378();
    uint64_t v56 = v55;
    *(void *)(v53 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v53 + 64) = sub_1C51A41F4();
    *(void *)(v53 + 32) = v54;
    *(void *)(v53 + 40) = v56;
    sub_1C51C5A48();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_29;
  }
  unsigned __int8 v15 = v59;
LABEL_15:
  __int16 v18 = sub_1C51BAB20(v15);
  if ((v18 & 0x100) != 0)
  {
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v44 = (void *)sub_1C51C67C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_1C51C7CA0;
    LOWORD(v60) = v15;
    uint64_t v46 = sub_1C51C6378();
    uint64_t v48 = v47;
    *(void *)(v45 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v45 + 64) = sub_1C51A41F4();
    *(void *)(v45 + 32) = v46;
    *(void *)(v45 + 40) = v48;
    sub_1C51C5A48();
    swift_release();

    swift_bridgeObjectRelease();
    _Block_release(a3);
    goto LABEL_29;
  }
  unsigned __int8 v19 = v18;
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_1C51C6558();
  *(void *)&long long v60 = 0;
  id v22 = objc_msgSend(v20, sel_dataWithPropertyList_format_options_error_, v21, 200, 0, &v60);

  id v23 = (id)v60;
  if (!v22)
  {
    uint64_t v49 = v23;
    uint64_t v50 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C51C6748();
    sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
    uint64_t v51 = (void *)sub_1C51C67C8();
    sub_1C51C5A48();
    swift_release();

    _Block_release(a3);
    goto LABEL_29;
  }
  uint64_t v24 = sub_1C51C5998();
  unint64_t v26 = v25;

  uint64_t v27 = v19;
  switch(v19)
  {
    case 'd':
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = sub_1C51ACC50;
      *(void *)(v30 + 24) = v8;
      *(unsigned char *)(v30 + 32) = 100;
      sub_1C51C6008();
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = sub_1C51A42DC;
      *(void *)(v31 + 24) = v30;
      sub_1C51AD25C(&qword_1EA3D12E0, MEMORY[0x1E4F50788]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'e':
    case 'p':
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = sub_1C51ACC50;
      *(void *)(v28 + 24) = v8;
      sub_1C51C5F88();
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = sub_1C51AD350;
      *(void *)(v29 + 24) = v28;
      sub_1C51AD25C(&qword_1EBBD03D8, MEMORY[0x1E4F50748]);
      swift_retain();
      swift_retain();
      goto LABEL_21;
    case 'f':
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = sub_1C51ACC50;
      *(void *)(v32 + 24) = v8;
      *(unsigned char *)(v32 + 32) = 102;
      sub_1C51C5D98();
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = sub_1C51A42DC;
      *(void *)(v33 + 24) = v32;
      sub_1C51AD25C(&qword_1EA3D11B0, MEMORY[0x1E4F50610]);
      swift_retain();
      swift_retain();
LABEL_21:
      sub_1C51C5C08();
      swift_release();
      sub_1C518D144(v24, v26);
      swift_release();
      break;
    default:
      *(void *)&long long v60 = 0;
      *((void *)&v60 + 1) = 0xE000000000000000;
      LOBYTE(v59) = v19;
      sub_1C51C6928();
      sub_1C51C6518();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      uint64_t v35 = (void *)swift_allocError();
      uint64_t v36 = v57;
      (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v37, v7, v5);
      uint64_t v38 = (void *)sub_1C51C58A8();
      ((void (**)(void, uint64_t, void, void *))a3)[2](a3, v27, 0, v38);

      sub_1C518D144(v24, v26);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v5);
      break;
  }
  return swift_release();
}

uint64_t sub_1C51A6980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6)
{
  uint64_t v24 = a5;
  v21[1] = a1;
  v21[2] = a2;
  uint64_t v9 = sub_1C51C6248();
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v23 = v9;
  MEMORY[0x1F4188790]();
  char v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a6;
  _Block_copy(a6);
  sub_1C51C6738();
  sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
  uint64_t v12 = (void *)sub_1C51C67C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1C51C7CA0;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v14 = MEMORY[0x1E4FBB1A0];
  uint64_t v15 = sub_1C51C6378();
  uint64_t v17 = v16;
  *(void *)(v13 + 56) = v14;
  *(void *)(v13 + 64) = sub_1C51A41F4();
  *(void *)(v13 + 32) = v15;
  *(void *)(v13 + 40) = v17;
  sub_1C51C5A48();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C51C6238();
  sub_1C51C6268();
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = v25;
  *(void *)(v18 + 16) = sub_1C51AD348;
  *(void *)(v18 + 24) = v19;
  sub_1C51AD25C(&qword_1EA3D1348, MEMORY[0x1E4F50960]);
  swift_retain();
  sub_1C51C5BC8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
  return swift_release();
}

uint64_t sub_1C51A6C74(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (**a5)(void, void, void))
{
  uint64_t v7 = sub_1C51C6528();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a5;
  if (a3 == 1)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_1C51AD348;
    *(void *)(v14 + 24) = v11;
    sub_1C51C5F48();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = sub_1C51AD34C;
    *(void *)(v15 + 24) = v14;
    _Block_copy(a5);
    sub_1C51AD25C(&qword_1EA3D1350, MEMORY[0x1E4F50710]);
    swift_retain();
    swift_retain();
  }
  else
  {
    if (a3)
    {
      uint64_t v21 = 0;
      unint64_t v22 = 0xE000000000000000;
      v20[15] = a3;
      _Block_copy(a5);
      sub_1C51C6928();
      sub_1C51C6518();
      sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
      uint64_t v17 = (void *)swift_allocError();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 16))(v18, v10, v7);
      uint64_t v19 = (void *)sub_1C51C58A8();
      ((void (**)(void, void, void *))a5)[2](a5, 0, v19);

      (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
      return swift_release();
    }
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_1C51AD348;
    *(void *)(v12 + 24) = v11;
    sub_1C51C6178();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = sub_1C51AD34C;
    *(void *)(v13 + 24) = v12;
    _Block_copy(a5);
    sub_1C51AD25C(&qword_1EA3D1358, MEMORY[0x1E4F508A0]);
    swift_retain();
    swift_retain();
  }
  sub_1C51C5C08();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_1C51A70AC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x736567617373656DLL && a2 == 0xEE0063697274654DLL;
  if (v2 || (sub_1C51C6B28() & 1) != 0 || a1 == 0xD000000000000012 && a2 == 0x80000001C51CA6D0) {
    return 1;
  }
  if ((sub_1C51C6B28() & 1) != 0 || a1 == 0x697665725070616DLL && a2 == 0xEB00000000737765) {
    return 1;
  }
  if ((sub_1C51C6B28() & 1) != 0 || a1 == 0x6572506567616D69 && a2 == 0xED00007377656976) {
    return 1;
  }
  if ((sub_1C51C6B28() & 1) != 0 || a1 == 0xD000000000000011 && a2 == 0x80000001C51CA6F0) {
    return 1;
  }
  if ((sub_1C51C6B28() & 1) != 0 || a1 == 0xD000000000000021 && a2 == 0x80000001C51CA710) {
    return 1;
  }
  if ((sub_1C51C6B28() & 1) != 0 || a1 == 0x736472616376 && a2 == 0xE600000000000000) {
    return 1;
  }
  char v5 = sub_1C51C6B28();
  BOOL v6 = a1 == 0x6572506F65646976 && a2 == 0xED00007377656976;
  BOOL v7 = v6;
  if ((v5 & 1) != 0 || v7) {
    return 1;
  }
  char v8 = sub_1C51C6B28();
  BOOL v9 = a1 == 0x6572506F69647561 && a2 == 0xED00007377656976;
  BOOL v10 = v9;
  if ((v8 & 1) != 0 || v10) {
    return 1;
  }
  char v11 = sub_1C51C6B28();
  BOOL v12 = a1 == 0xD000000000000012 && a2 == 0x80000001C51CA740;
  BOOL v13 = v12;
  if ((v11 & 1) != 0
    || v13
    || (sub_1C51C6B28() & 1) != 0
    || a1 == 0x656D616E6B63696ELL && a2 == 0xE900000000000073
    || (sub_1C51C6B28() & 1) != 0
    || a1 == 0x636174744163616DLL && a2 == 0xEE0073746E656D68)
  {
    return 1;
  }

  return sub_1C51C6B28();
}

void sub_1C51A74D0(uint64_t a1)
{
  sub_1C5192D14(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F506C8], &qword_1EBBD0428, MEMORY[0x1E4F506B8]);
}

void sub_1C51A751C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C519B0CC(a1, a2, a3, *(void (**)(void *, void *))(v3 + 16));
}

void sub_1C51A7524(uint64_t a1, uint64_t a2, char a3)
{
  sub_1C519BE20(a1, a2, a3, *(void (**)(void *, void *, void))(v3 + 16));
}

void sub_1C51A7540(uint64_t a1)
{
  sub_1C5192D14(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50730], &qword_1EA3D1440, MEMORY[0x1E4F50718]);
}

void sub_1C51A758C(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50670], qword_1EBBD03E8);
}

uint64_t sub_1C51A75CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C518D19C(a1, a2);
  }
  return a1;
}

void sub_1C51A75E0(uint64_t a1)
{
  sub_1C5192D14(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50A20], &qword_1EA3D14A8, MEMORY[0x1E4F50A10]);
}

void sub_1C51A762C(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50828], &qword_1EA3D14A0);
}

void sub_1C51A766C(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50688], &qword_1EBBD0450);
}

uint64_t sub_1C51A76AC()
{
  uint64_t v22 = sub_1C51C5928();
  uint64_t v1 = *(void *)(v22 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v20 = (v2 + 32) & ~v2;
  unint64_t v18 = (((*(void *)(v1 + 64) + v20 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 11) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = sub_1C51C63F8();
  uint64_t v3 = *(void *)(v21 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v16 = (v18 + v4 + 8) & ~v4;
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v19 = sub_1C51C60B8();
  uint64_t v6 = *(void *)(v19 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v16 + v5 + v7) & ~v7;
  unint64_t v9 = (v8 + *(void *)(v6 + 64)) & 0xFFFFFFFFFFFFFFFCLL;
  uint64_t v17 = sub_1C51C5B88();
  uint64_t v10 = *(void *)(v17 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v9 + v11 + 8) & ~v11;
  uint64_t v13 = v2 | v4 | v7 | v11 | 7;
  unint64_t v14 = ((*(void *)(v10 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + v20, v22);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v16, v21);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v8, v19);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0 + v12, v17);
  swift_release();

  return MEMORY[0x1F4186498](v0, v14, v13);
}

uint64_t sub_1C51A7958(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_1C51C5928() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v5 = (v4 + 11) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(sub_1C51C63F8() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(void *)(sub_1C51C60B8() - 8);
  unint64_t v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v11 = v10 + *(void *)(v9 + 64);
  sub_1C51C5B88();
  uint64_t v12 = *(void *)(v1 + 16);
  uint64_t v13 = *(void *)(v1 + 24);
  float v14 = *(float *)(v1 + v4);
  uint64_t v15 = *(void *)(v1 + v5);
  uint64_t v16 = v1 + v7;
  uint64_t v17 = v1 + v10;
  char v18 = *(unsigned char *)(v1 + v11);
  float v19 = *(float *)((v11 & 0xFFFFFFFFFFFFFFFCLL) + v1 + 4);
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v22 + 16) = v20;
  *uint64_t v20 = v22;
  v20[1] = sub_1C51A7C00;
  return sub_1C519E860(v14, v19, a1, v12, v13, v1 + v3, v15, v16, v17, v18);
}

uint64_t sub_1C51A7C00()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_1C51A7CF4(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F508C8], &qword_1EA3D1460);
}

void sub_1C51A7D34(uint64_t a1)
{
  sub_1C5192D14(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50888], &qword_1EA3D1458, MEMORY[0x1E4F50878]);
}

void sub_1C51A7D80(uint64_t a1)
{
  sub_1C51A0D58(a1, *(void (**)(uint64_t, uint64_t, void *))(v1 + 16), *(void *)(v1 + 24));
}

void sub_1C51A7D88(uint64_t a1)
{
  sub_1C5192D14(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50948], &qword_1EA3D1448, MEMORY[0x1E4F50938]);
}

uint64_t type metadata accessor for MessagesBlastDoorInterface()
{
  return self;
}

uint64_t method lookup function for MessagesBlastDoorInterface(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for MessagesBlastDoorInterface);
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.__allocating_init(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(topLevelDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(topLevelDictionary:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.decontaminate(topLevelDictionary:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(smsDictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(smsDictionary:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(balloonPluginPayload:with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(balloonPluginPayload:with:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(data:for:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of static MessagesBlastDoorInterface.supports(feature:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMetadata(forAttachmentWith:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateImagePreview(for:maxPixelDimension:scale:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAttachmentWith:maxPixelDimension:scale:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMoviePreview(forAttachmentWith:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMoviePreview(forAttachmentWith:maxPixelDimension:minThumbnailPxSize:scale:frameInterval:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateMovieFrames(forAttachmentWith:targetPixelWidth:targetPixelHeight:frameLimit:uniformSampling:framesPerSync:appliesPreferredTrackTransform:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generateWorkoutPreview(forAttachmentWith:maxPixelDimension:scale:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAudioMessageWith:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(nicknameDictionary:with:recordTag:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(nicknameDictionary:with:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(nicknameDictionary:with:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:processImageFields:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.getMetadata(forEmojiImageWith:maxStrikeCount:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forEmojiImageWith:frameIndex:maxPixelDimension:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreviewForMultiFrameImage(withFileURL:destinationFileURL:maxPixelDimension:scale:maxFrameCount:isSticker:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.getMetadata(forAnimatedImageWith:maxCount:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.generatePreview(forAnimatedImageWith:maxPixelDimension:index:maxCount:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(collaborationNoticePayload:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuse(actionDictionary:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseCollaborationClearNotice(payload:resultHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseVideoMessageMetadata(dictionary:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseLiteTextMessage(payload:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseSatelliteSMSTextMessageDictionary(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseChatBotCSS(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseRelayGroupMutationPayload(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseRelayReachabilityRequestPayload(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of MessagesBlastDoorInterface.defuseRelayReachabilityResponsePayload(for:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t sub_1C51A8858()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1C51A8890(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C51A1124(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_1C51A8898(char a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  sub_1C519FEF0(a1, a5, a6, a2, a3, a4, *(void *)(v6 + 16));
}

uint64_t sub_1C51A88A0(uint64_t a1, uint64_t a2, const void *a3)
{
  v22[1] = a2;
  uint64_t v4 = sub_1C51C5F18();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  MEMORY[0x1F4188790](v4);
  uint64_t v24 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1C51C63F8();
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  unint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0480);
  MEMORY[0x1F4188790](v8 - 8);
  unint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1C51C6468();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)v22 - v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a3;
  _Block_copy(a3);
  sub_1C51C5918();
  sub_1C51C6428();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  sub_1C51C63E8();
  float v19 = v24;
  sub_1C51C5F08();
  sub_1C51C5F28();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = sub_1C51AD348;
  *(void *)(v20 + 24) = v18;
  sub_1C51AD25C(&qword_1EBBD0458, MEMORY[0x1E4F506C8]);
  swift_retain();
  sub_1C51C5BD8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v19, v27);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v25);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  return swift_release();
}

uint64_t sub_1C51A8DF0(uint64_t a1, int a2, char *a3, void (*a4)(char *, uint64_t), float a5, float a6)
{
  uint64_t v383 = a3;
  int v347 = a2;
  v389[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v304 = sub_1C51C5AB8();
  uint64_t v303 = *(void *)(v304 - 8);
  MEMORY[0x1F4188790](v304);
  uint64_t v302 = (char *)&v301 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v323 = sub_1C51C5CC8();
  uint64_t v322 = *(void *)(v323 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v323);
  v309 = (char *)&v301 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  v316 = (char *)&v301 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v320 = (char *)&v301 - v16;
  uint64_t v308 = v17;
  MEMORY[0x1F4188790](v15);
  v329 = (char *)&v301 - v18;
  uint64_t v318 = sub_1C51C5EE8();
  uint64_t v317 = *(void *)(v318 - 8);
  MEMORY[0x1F4188790](v318);
  uint64_t v306 = (char *)&v301 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0478);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  v305 = (char *)&v301 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  v314 = (char *)&v301 - v23;
  uint64_t v341 = sub_1C51C5A78();
  uint64_t v342 = *(void *)(v341 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v341);
  v310 = (char *)&v301 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  v321 = (char *)&v301 - v27;
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  v319 = (char *)&v301 - v29;
  uint64_t v30 = MEMORY[0x1F4188790](v28);
  uint64_t v328 = (char *)&v301 - v31;
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  uint64_t v315 = (char *)&v301 - v33;
  MEMORY[0x1F4188790](v32);
  uint64_t v331 = (char *)&v301 - v34;
  uint64_t v326 = sub_1C51C5AA8();
  uint64_t v325 = *(void *)(v326 - 8);
  uint64_t v35 = MEMORY[0x1F4188790](v326);
  uint64_t v312 = (char *)&v301 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v311 = v36;
  MEMORY[0x1F4188790](v35);
  v343 = (char *)&v301 - v37;
  uint64_t v346 = sub_1C51C5F28();
  v330 = *(void (***)(char *, char *, uint64_t))(v346 - 8);
  uint64_t v38 = MEMORY[0x1F4188790](v346);
  uint64_t v313 = (char *)&v301 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x1F4188790](v38);
  uint64_t v324 = (char *)&v301 - v41;
  uint64_t v42 = MEMORY[0x1F4188790](v40);
  uint64_t v327 = (char *)&v301 - v43;
  uint64_t v44 = MEMORY[0x1F4188790](v42);
  uint64_t v337 = (char *)&v301 - v45;
  MEMORY[0x1F4188790](v44);
  v340 = (char *)&v301 - v46;
  uint64_t v339 = sub_1C51C5F18();
  uint64_t v338 = *(void *)(v339 - 8);
  MEMORY[0x1F4188790](v339);
  uint64_t v345 = (char *)&v301 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v335 = sub_1C51C5E38();
  uint64_t v334 = *(void *)(v335 - 8);
  MEMORY[0x1F4188790](v335);
  v336 = (char *)&v301 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v350 = (void *)sub_1C51C5F68();
  uint64_t v349 = *(v350 - 1);
  MEMORY[0x1F4188790](v350);
  v357 = (char *)&v301 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v356 = sub_1C51C5DD8();
  uint64_t v355 = *(void *)(v356 - 8);
  MEMORY[0x1F4188790](v356);
  uint64_t v354 = (char *)&v301 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v362 = sub_1C51C5D78();
  uint64_t v361 = *(void *)(v362 - 8);
  MEMORY[0x1F4188790](v362);
  uint64_t v366 = (char *)&v301 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v373 = sub_1C51C59F8();
  uint64_t v372 = *(void *)(v373 - 8);
  MEMORY[0x1F4188790](v373);
  v371 = (void (*)(char *, uint64_t))((char *)&v301 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0470);
  uint64_t v54 = MEMORY[0x1F4188790](v53 - 8);
  v374 = (char *)&v301 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v54);
  uint64_t v367 = (char *)&v301 - v56;
  uint64_t v57 = sub_1C51C5928();
  uint64_t v58 = *(void *)(v57 - 8);
  uint64_t v380 = v57;
  uint64_t v381 = v58;
  uint64_t v59 = MEMORY[0x1F4188790](v57);
  uint64_t v353 = (char *)&v301 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = MEMORY[0x1F4188790](v59);
  uint64_t v365 = (char *)&v301 - v62;
  uint64_t v63 = MEMORY[0x1F4188790](v61);
  uint64_t v376 = (char *)&v301 - v64;
  uint64_t v307 = v65;
  MEMORY[0x1F4188790](v63);
  v379 = (char *)&v301 - v66;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0480);
  uint64_t v68 = MEMORY[0x1F4188790](v67 - 8);
  uint64_t v358 = (char *)&v301 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = MEMORY[0x1F4188790](v68);
  os_log_t v368 = (os_log_t)((char *)&v301 - v71);
  MEMORY[0x1F4188790](v70);
  uint64_t v73 = (char *)&v301 - v72;
  uint64_t v382 = (void (*)(char *, char *, uint64_t))sub_1C51C6468();
  uint64_t v378 = *((void *)v382 - 1);
  uint64_t v74 = MEMORY[0x1F4188790](v382);
  uint64_t v333 = (char *)&v301 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = MEMORY[0x1F4188790](v74);
  uint64_t v78 = ((char *)&v301 - v77);
  uint64_t v79 = MEMORY[0x1F4188790](v76);
  v348 = (char *)&v301 - v80;
  uint64_t v81 = MEMORY[0x1F4188790](v79);
  uint64_t v352 = (char *)&v301 - v82;
  uint64_t v83 = MEMORY[0x1F4188790](v81);
  uint64_t v360 = (char *)&v301 - v84;
  uint64_t v85 = MEMORY[0x1F4188790](v83);
  uint64_t v364 = (char *)&v301 - v86;
  uint64_t v87 = MEMORY[0x1F4188790](v85);
  os_log_t v370 = (char *)&v301 - v88;
  uint64_t v89 = MEMORY[0x1F4188790](v87);
  v377 = (char *)&v301 - v90;
  MEMORY[0x1F4188790](v89);
  os_signpost_id_t v92 = (void (**)(char *, char *, uint64_t))((char *)&v301 - v91);
  uint64_t v93 = sub_1C51C63F8();
  uint64_t v94 = *(void *)(v93 - 8);
  uint64_t v384 = v93;
  uint64_t v385 = v94;
  uint64_t v95 = MEMORY[0x1F4188790](v93);
  uint64_t v332 = (char *)&v301 - ((v96 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = MEMORY[0x1F4188790](v95);
  uint64_t v344 = (char *)&v301 - v98;
  uint64_t v99 = MEMORY[0x1F4188790](v97);
  uint64_t v101 = (char *)&v301 - v100;
  uint64_t v102 = MEMORY[0x1F4188790](v99);
  v351 = (char *)&v301 - v103;
  uint64_t v104 = MEMORY[0x1F4188790](v102);
  uint64_t v359 = (char *)&v301 - v105;
  uint64_t v106 = MEMORY[0x1F4188790](v104);
  v363 = (char *)&v301 - v107;
  uint64_t v108 = MEMORY[0x1F4188790](v106);
  uint64_t v369 = (void (*)(char *, char *, uint64_t))((char *)&v301 - v109);
  MEMORY[0x1F4188790](v108);
  v111 = (char *)&v301 - v110;
  uint64_t v112 = sub_1C51C6058();
  uint64_t v113 = *(void *)(v112 - 8);
  MEMORY[0x1F4188790](v112);
  char v115 = (char *)&v301 - ((v114 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v386 = swift_allocObject();
  *(void *)(v386 + 16) = a4;
  v375 = a4;
  _Block_copy(a4);
  uint64_t v387 = a1;
  uint64_t v117 = sub_1C51C58C8();
  uint64_t v118 = v116;
  if (v117 == 0x6361666863746177 && v116 == 0xE900000000000065 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v120 = v385;
    uint64_t v119 = v386;
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1C51C6048();
          sub_1C51C6068();
          sub_1C51C5918();
          sub_1C51C6428();
          sub_1C51C63E8();
          uint64_t v121 = swift_allocObject();
          *(void *)(v121 + 16) = sub_1C51AD348;
          *(void *)(v121 + 24) = v119;
          sub_1C51AD25C(&qword_1EA3D1420, MEMORY[0x1E4F507B8]);
          swift_retain();
          sub_1C51C5BD8();
          swift_release();
          (*(void (**)(char *, uint64_t))(v120 + 8))(v111, v384);
          (*(void (**)(char *, uint64_t))(v113 + 8))(v115, v112);
          return swift_release();
        }
        goto LABEL_54;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  if (v117 == 0x737361706B70 && v118 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v115 = (char *)v387;
    uint64_t v123 = v382;
    goto LABEL_17;
  }
  char v124 = sub_1C51C6B28();
  char v115 = (char *)v387;
  uint64_t v123 = v382;
  if ((v124 & 1) == 0 && (v117 != 0x726564726FLL || v118 != 0xE500000000000000) && (sub_1C51C6B28() & 1) == 0)
  {
    if (v117 == 0x74756F6B726F77 && v118 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      uint64_t v162 = v386;
      uint64_t v163 = v357;
    }
    else
    {
      char v185 = sub_1C51C6B28();
      swift_bridgeObjectRelease();
      uint64_t v162 = v386;
      uint64_t v163 = v357;
      if ((v185 & 1) == 0)
      {
        if (v347)
        {
          sub_1C51C5918();
          sub_1C51C6428();
          sub_1C51C63E8();
          sub_1C51C5F08();
          uint64_t v187 = *(void *)&v383[OBJC_IVAR___IMMessagesBlastDoorInterfaceInternal_bd];
          sub_1C51AD25C(&qword_1EBBD0458, MEMORY[0x1E4F506C8]);
          uint64_t v188 = v337;
          uint64_t v113 = v346;
          sub_1C51C5BF8();
          uint64_t v373 = v187;
          v374 = 0;
          os_signpost_id_t v92 = v330;
          uint64_t v204 = v340;
          v330[4](v340, v188, v113);
          sub_1C51C5A98();
          sub_1C51C5A88();
          v111 = v331;
          sub_1C51C5A58();
          uint64_t v112 = (uint64_t)v327;
          v377 = (char *)v92[2];
          uint64_t v378 = (uint64_t)(v92 + 2);
          ((void (*)(char *, char *, uint64_t))v377)(v327, v204, v113);
          uint64_t v78 = sub_1C51C5A88();
          uint64_t v205 = sub_1C51C67A8();
          char v206 = sub_1C51C67B8();
          if (v206)
          {
            uint64_t v207 = *(char **)(v342 + 16);
            uint64_t v376 = (char *)((v342 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000);
            v208 = v315;
            uint64_t v383 = v207;
            ((void (*)(char *, char *, uint64_t))v207)(v315, v111, v341);
            v209 = (uint8_t *)swift_slowAlloc();
            v210 = (void *)swift_slowAlloc();
            v389[0] = v210;
            *(_DWORD *)v209 = 136315138;
            uint64_t v211 = (uint64_t)v314;
            sub_1C51C5EF8();
            uint64_t v212 = v317;
            uint64_t v213 = v318;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v317 + 48))(v211, 1, v318))
            {
              uint64_t v214 = 7104878;
              sub_1C51ACC90(v211, &qword_1EBBD0478);
              unint64_t v215 = 0xE300000000000000;
            }
            else
            {
              uint64_t v219 = v306;
              (*(void (**)(char *, uint64_t, uint64_t))(v212 + 16))(v306, v211, v213);
              sub_1C51ACC90(v211, &qword_1EBBD0478);
              uint64_t v220 = v212;
              uint64_t v221 = sub_1C51C5ED8();
              uint64_t v222 = v213;
              uint64_t v214 = v221;
              unint64_t v215 = v223;
              os_signpost_id_t v224 = v219;
              os_signpost_id_t v92 = v330;
              (*(void (**)(char *, uint64_t))(v220 + 8))(v224, v222);
            }
            uint64_t v388 = sub_1C51A3538(v214, v215, (uint64_t *)v389);
            sub_1C51C6818();
            swift_bridgeObjectRelease();
            uint64_t v113 = v346;
            uint64_t v382 = v92[1];
            ((void (*)(char *, uint64_t))v382)(v327, v346);
            os_signpost_id_t v225 = sub_1C51C5A68();
            _os_signpost_emit_with_name_impl(&dword_1C5188000, v78, (os_signpost_type_t)v205, v225, "LargeImage.Context.init", "largeImageContextualInfo: %s", v209, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1C878C780](v210, -1, -1);
            MEMORY[0x1C878C780](v209, -1, -1);

            uint64_t v218 = v341;
            (*(void (**)(char *, uint64_t))(v342 + 8))(v208, v341);
            v111 = v331;
            unint64_t v217 = (unint64_t)v376;
            uint64_t v216 = v383;
LABEL_58:
            uint64_t v383 = v216;
            ((void (*)(char *, char *, uint64_t))v216)(v328, v111, v218);
            uint64_t v226 = sub_1C51C5AE8();
            swift_allocObject();
            uint64_t v227 = sub_1C51C5AD8();
            v228 = v340;
            ((void (*)(char *, char *, uint64_t))v377)(v324, v340, v113);
            uint64_t v229 = v329;
            int v230 = v374;
            sub_1C51C5CA8();
            if (v230)
            {
              swift_release();
              (*(void (**)(char *, uint64_t))(v342 + 8))(v331, v218);
              (*(void (**)(char *, uint64_t))(v325 + 8))(v343, v326);
              MEMORY[0x1C878C630](v230);
              v231 = (void *)sub_1C51C58A8();
              (*((void (**)(void (*)(char *, uint64_t), void, void *))v375 + 2))(v375, 0, v231);

              ((void (*)(char *, uint64_t))v382)(v228, v113);
              (*(void (**)(char *, uint64_t))(v338 + 8))(v345, v339);
              (*(void (**)(char *, uint64_t))(v385 + 8))(v344, v384);
            }
            else
            {
              v374 = (char *)v226;
              uint64_t v376 = (char *)v217;
              uint64_t v232 = v322;
              v234 = (char *)(v322 + 16);
              uint64_t v233 = *(void (**)(char *, char *, uint64_t))(v322 + 16);
              uint64_t v235 = v323;
              v233(v320, v229, v323);
              uint64_t v236 = v316;
              uint64_t v369 = v233;
              v233(v316, v229, v235);
              uint64_t v237 = sub_1C51C5A88();
              uint64_t v238 = v319;
              sub_1C51C5AC8();
              LODWORD(v375) = sub_1C51C6798();
              char v239 = sub_1C51C67B8();
              uint64_t v372 = v227;
              os_log_t v370 = v234;
              if (v239)
              {
                os_log_t v368 = v237;
                swift_retain();
                char v240 = v302;
                sub_1C51C5AF8();
                swift_release();
                uint64_t v241 = v303;
                uint64_t v242 = v304;
                if ((*(unsigned int (**)(char *, uint64_t))(v303 + 88))(v240, v304) == *MEMORY[0x1E4FBD340])
                {
                  char v243 = 0;
                  uint64_t v367 = "[Error] Interval already ended";
                }
                else
                {
                  (*(void (**)(char *, uint64_t))(v241 + 8))(v240, v242);
                  uint64_t v367 = "bufferSize: %ld, vmAddress: %lu";
                  char v243 = 2;
                }
                v248 = v320;
                v249 = v328;
                ((void (*)(char *, char *, uint64_t))v383)(v328, v319, v341);
                uint64_t v250 = swift_slowAlloc();
                *(unsigned char *)uint64_t v250 = 0;
                *(unsigned char *)(v250 + 1) = v243;
                *(_WORD *)(v250 + 2) = 2048;
                uint64_t v251 = (void *)sub_1C51C5C88();
                uint64_t v252 = *(void (**)(char *, uint64_t))(v232 + 8);
                uint64_t v253 = v323;
                v252(v248, v323);
                v389[0] = v251;
                sub_1C51C6818();
                *(_WORD *)(v250 + 12) = 2048;
                uint64_t v254 = v316;
                v255 = (void *)sub_1C51C5CB8();
                v371 = v252;
                v252(v254, v253);
                v389[0] = v255;
                sub_1C51C6818();
                os_signpost_id_t v256 = sub_1C51C5A68();
                os_log_t v257 = v368;
                _os_signpost_emit_with_name_impl(&dword_1C5188000, v368, (os_signpost_type_t)v375, v256, "LargeImage.Context.init", v367, (uint8_t *)v250, 0x16u);
                uint64_t v258 = v250;
                uint64_t v235 = v253;
                uint64_t v232 = v322;
                MEMORY[0x1C878C780](v258, -1, -1);

                v245 = *(void (**)(char *, uint64_t))(v342 + 8);
                uint64_t v259 = v341;
                v245(v319, v341);
                v245(v249, v259);
                char v115 = (char *)v387;
                uint64_t v229 = v329;
                uint64_t v247 = v346;
                os_signpost_id_t v246 = v309;
              }
              else
              {
                uint64_t v244 = *(void (**)(char *, uint64_t))(v232 + 8);
                v244(v236, v235);
                v371 = v244;
                v244(v320, v235);

                v245 = *(void (**)(char *, uint64_t))(v342 + 8);
                v245(v238, v341);
                os_signpost_id_t v246 = v309;
                uint64_t v247 = v346;
              }
              v369(v246, v229, v235);
              unint64_t v260 = (*(unsigned __int8 *)(v232 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v232 + 80);
              os_log_t v370 = (char *)swift_allocObject();
              (*(void (**)(char *, char *, uint64_t))(v232 + 32))(&v370[v260], v246, v235);
              sub_1C51C5A88();
              uint64_t v261 = v321;
              sub_1C51C5A58();
              v262 = v313;
              ((void (*)(char *, char *, uint64_t))v377)(v313, v340, v247);
              unint64_t v263 = sub_1C51C5A88();
              int v264 = sub_1C51C67A8();
              char v265 = sub_1C51C67B8();
              v375 = v245;
              if (v265)
              {
                LODWORD(v377) = v264;
                ((void (*)(char *, char *, uint64_t))v383)(v310, v261, v341);
                int v266 = (uint8_t *)swift_slowAlloc();
                uint64_t v267 = (void *)swift_slowAlloc();
                v389[0] = v267;
                *(_DWORD *)int v266 = 136315138;
                uint64_t v268 = (uint64_t)v305;
                sub_1C51C5EF8();
                uint64_t v269 = v317;
                uint64_t v270 = v318;
                int v271 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v317 + 48))(v268, 1, v318);
                uint64_t v272 = v328;
                if (v271)
                {
                  uint64_t v273 = 7104878;
                  sub_1C51ACC90(v268, &qword_1EBBD0478);
                  unint64_t v274 = 0xE300000000000000;
                }
                else
                {
                  uint64_t v276 = v306;
                  (*(void (**)(char *, uint64_t, uint64_t))(v269 + 16))(v306, v268, v270);
                  sub_1C51ACC90(v268, &qword_1EBBD0478);
                  uint64_t v277 = v269;
                  uint64_t v273 = sub_1C51C5ED8();
                  unint64_t v274 = v278;
                  unint64_t v279 = v276;
                  v262 = v313;
                  (*(void (**)(char *, uint64_t))(v277 + 8))(v279, v270);
                }
                uint64_t v388 = sub_1C51A3538(v273, v274, (uint64_t *)v389);
                sub_1C51C6818();
                swift_bridgeObjectRelease();
                uint64_t v378 = (unint64_t)(v330 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
                ((void (*)(char *, uint64_t))v382)(v262, v346);
                uint64_t v280 = v310;
                os_signpost_id_t v281 = sub_1C51C5A68();
                _os_signpost_emit_with_name_impl(&dword_1C5188000, v263, (os_signpost_type_t)v377, v281, "Unpack LargeImage", "largeImageContextualInfo: %s", v266, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x1C878C780](v267, -1, -1);
                MEMORY[0x1C878C780](v266, -1, -1);

                uint64_t v275 = v341;
                v375(v280, v341);
                char v115 = (char *)v387;
              }
              else
              {

                uint64_t v378 = (unint64_t)(v330 + 1) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
                ((void (*)(char *, uint64_t))v382)(v262, v247);
                uint64_t v275 = v341;
                uint64_t v272 = v328;
              }
              uint64_t v282 = v311;
              ((void (*)(char *, char *, uint64_t))v383)(v272, v261, v275);
              swift_allocObject();
              uint64_t v383 = (char *)sub_1C51C5AD8();
              uint64_t v387 = sub_1C51C5CE8();
              uint64_t v283 = v325;
              uint64_t v284 = v312;
              uint64_t v285 = v326;
              (*(void (**)(char *, char *, uint64_t))(v325 + 16))(v312, v343, v326);
              uint64_t v286 = v381;
              (*(void (**)(char *, char *, uint64_t))(v381 + 16))(v379, v115, v380);
              unint64_t v287 = (*(unsigned __int8 *)(v283 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v283 + 80);
              unint64_t v288 = (v282 + v287 + 7) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v289 = (v288 + 15) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v290 = (*(unsigned __int8 *)(v286 + 80) + v289 + 16) & ~(unint64_t)*(unsigned __int8 *)(v286 + 80);
              unint64_t v291 = (v307 + v290 + 7) & 0xFFFFFFFFFFFFFFF8;
              uint64_t v292 = swift_allocObject();
              (*(void (**)(unint64_t, char *, uint64_t))(v283 + 32))(v292 + v287, v284, v285);
              *(void *)(v292 + v288) = v383;
              unint64_t v293 = (void *)(v292 + v289);
              uint64_t v294 = v386;
              *unint64_t v293 = sub_1C51AD348;
              v293[1] = v294;
              (*(void (**)(unint64_t, char *, uint64_t))(v286 + 32))(v292 + v290, v379, v380);
              uint64_t v295 = (void *)(v292 + v291);
              uint64_t v296 = v370;
              void *v295 = sub_1C51ACB44;
              v295[1] = v296;
              sub_1C51AD25C(&qword_1EBBD0468, MEMORY[0x1E4F505A0]);
              swift_retain();
              swift_retain();
              swift_retain();
              uint64_t v297 = v344;
              uint64_t v298 = v329;
              sub_1C51C5BD8();
              swift_release();
              swift_release();
              swift_release();
              swift_release();
              uint64_t v299 = v341;
              uint64_t v300 = v375;
              v375(v321, v341);
              v371(v298, v323);
              v300(v331, v299);
              (*(void (**)(char *, uint64_t))(v283 + 8))(v343, v326);
              ((void (*)(char *, uint64_t))v382)(v340, v346);
              (*(void (**)(char *, uint64_t))(v338 + 8))(v345, v339);
              (*(void (**)(char *, uint64_t))(v385 + 8))(v297, v384);
            }
            return swift_release();
          }
LABEL_55:

          uint64_t v382 = v92[1];
          ((void (*)(uint64_t, uint64_t))v382)(v112, v113);
          uint64_t v216 = *(char **)(v342 + 16);
          unint64_t v217 = (v342 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          uint64_t v218 = v341;
          goto LABEL_58;
        }
        sub_1C51C6738();
        sub_1C51AD220(0, (unint64_t *)&qword_1EBBD0440);
        char v189 = (void *)sub_1C51C67C8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
        uint64_t v190 = swift_allocObject();
        *(_OWORD *)(v190 + 16) = xmmword_1C51C7CB0;
        *(float *)uint64_t v389 = a5;
        BYTE4(v389[0]) = 0;
        uint64_t v191 = sub_1C51C6378();
        uint64_t v193 = v192;
        uint64_t v194 = MEMORY[0x1E4FBB1A0];
        *(void *)(v190 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v195 = sub_1C51A41F4();
        *(void *)(v190 + 64) = v195;
        *(void *)(v190 + 32) = v191;
        *(void *)(v190 + 40) = v193;
        *(float *)uint64_t v389 = a6;
        BYTE4(v389[0]) = 0;
        uint64_t v196 = sub_1C51C6378();
        *(void *)(v190 + 96) = v194;
        *(void *)(v190 + 104) = v195;
        *(void *)(v190 + 72) = v196;
        *(void *)(v190 + 80) = v197;
        sub_1C51C5A48();

        swift_bridgeObjectRelease();
        if ((~LODWORD(a5) & 0x7F800000) != 0)
        {
          uint64_t v198 = v385;
          uint64_t v199 = v386;
          uint64_t v200 = v384;
          uint64_t v201 = v336;
          if (a5 > -9.2234e18)
          {
            if (a5 < 9.2234e18)
            {
              sub_1C51C5E28();
              sub_1C51C5E58();
              sub_1C51C5918();
              sub_1C51C6428();
              uint64_t v202 = v332;
              sub_1C51C63E8();
              uint64_t v203 = swift_allocObject();
              *(void *)(v203 + 16) = sub_1C51AD348;
              *(void *)(v203 + 24) = v199;
              sub_1C51AD25C(&qword_1EBBD0430, MEMORY[0x1E4F50688]);
              swift_retain();
              sub_1C51C5BD8();
              swift_release();
              (*(void (**)(char *, uint64_t))(v198 + 8))(v202, v200);
              (*(void (**)(char *, uint64_t))(v334 + 8))(v201, v335);
              return swift_release();
            }
LABEL_78:
            __break(1u);
          }
LABEL_77:
          __break(1u);
          goto LABEL_78;
        }
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
    }
    if ((~LODWORD(a5) & 0x7F800000) != 0)
    {
      if (a5 > -9.2234e18)
      {
        if (a5 < 9.2234e18)
        {
          sub_1C51C5F58();
          sub_1C51C5F78();
          sub_1C51C5918();
          sub_1C51C6428();
          sub_1C51C63E8();
          uint64_t v186 = swift_allocObject();
          *(void *)(v186 + 16) = sub_1C51AD348;
          *(void *)(v186 + 24) = v162;
          sub_1C51AD25C(&qword_1EA3D1370, MEMORY[0x1E4F50730]);
          swift_retain();
          sub_1C51C5BD8();
          swift_release();
          (*(void (**)(char *, uint64_t))(v385 + 8))(v101, v384);
          (*(void (**)(char *, void *))(v349 + 8))(v163, v350);
          return swift_release();
        }
        goto LABEL_75;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  swift_bridgeObjectRelease();
LABEL_17:
  (*(void (**)(char *, char *, uint64_t))(v381 + 16))(v379, v115, v380);
  sub_1C51C6448();
  uint64_t v125 = v378;
  v126 = *(unsigned int (**)(char *, uint64_t, void))(v378 + 48);
  if (v126(v73, 1, v123) == 1)
  {
    sub_1C51ACC90((uint64_t)v73, &qword_1EBBD0480);
    sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
    sub_1C51C6B18();
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    v127 = (void *)swift_allocError();
    sub_1C51C6518();
    uint64_t v128 = (void *)sub_1C51C58A8();
    (*((void (**)(void (*)(char *, uint64_t), void, void *))v375 + 2))(v375, 0, v128);

    return swift_release();
  }
  v129 = *(void **)(v125 + 32);
  v357 = (char *)(v125 + 32);
  uint64_t v350 = v129;
  ((void (*)(char *, char *, void))v129)(v377, v73, v123);
  sub_1C51C6408();
  uint64_t v130 = v375;
  uint64_t v131 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1408);
  uint64_t v132 = swift_allocObject();
  *(_OWORD *)(v132 + 16) = xmmword_1C51C7CC0;
  unint64_t v133 = NSTemporaryDirectory();
  uint64_t v134 = sub_1C51C65B8();
  uint64_t v136 = v135;

  *(void *)(v132 + 32) = v134;
  *(void *)(v132 + 40) = v136;
  *(void *)(v132 + 48) = 0x7665725073736150;
  *(void *)(v132 + 56) = 0xEB00000000776569;
  os_signpost_id_t v137 = (char *)v371;
  sub_1C51C59E8();
  uint64_t v138 = sub_1C51C59C8();
  uint64_t v140 = v139;
  (*(void (**)(char *, uint64_t))(v372 + 8))(v137, v373);
  *(void *)(v132 + 64) = v138;
  *(void *)(v132 + 72) = v140;
  v141 = (void *)sub_1C51C66C8();
  swift_bridgeObjectRelease();
  id v142 = objc_msgSend(v131, sel_fileURLWithPathComponents_, v141);

  if (v142)
  {
    id v143 = v379;
    sub_1C51C58F8();

    uint64_t v144 = v381;
    char v145 = *(void (**)(char *, char *, uint64_t))(v381 + 32);
    id v146 = v374;
    id v147 = v143;
    uint64_t v148 = v380;
    v145(v374, v147, v380);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v144 + 56))(v146, 0, 1, v148);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v144 + 48))(v146, 1, v148) != 1)
    {
      v145(v376, v146, v148);
      id v149 = objc_msgSend(self, sel_defaultManager);
      char v150 = (void *)sub_1C51C58D8();
      v389[0] = 0;
      unsigned __int8 v151 = objc_msgSend(v149, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v150, 1, 0, v389);

      if (v151)
      {
        id v152 = v389[0];
      }
      else
      {
        id v153 = v389[0];
        v154 = (void *)sub_1C51C58B8();

        swift_willThrow();
        MEMORY[0x1C878C630](v154);
        uint64_t v155 = (void *)sub_1C51C58A8();
        (*((void (**)(void, void, void *))v130 + 2))(v130, 0, v155);
      }
      uint64_t v156 = v376;
      sub_1C51C58E8();
      os_log_t v157 = v368;
      sub_1C51C6448();
      uint64_t v158 = v382;
      if (v126((char *)v157, 1, v382) == 1)
      {
        sub_1C51ACC90((uint64_t)v157, &qword_1EBBD0480);
        sub_1C51AD25C(&qword_1EA3D1360, MEMORY[0x1E4F276F0]);
        sub_1C51C6B18();
        sub_1C51C6528();
        sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
        uint64_t v159 = (void *)swift_allocError();
        sub_1C51C6518();
        unint64_t v160 = (void *)sub_1C51C58A8();
        (*((void (**)(void, void, void *))v130 + 2))(v130, 0, v160);

        (*(void (**)(char *, uint64_t))(v381 + 8))(v156, v148);
        (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v378 + 8))(v377, v158);
        return swift_release();
      }
      uint64_t v161 = v370;
      ((void (*)(char *, os_log_t, void))v350)(v370, v157, v158);
      sub_1C51C6408();
      uint64_t v164 = v161;
      uint64_t v165 = v386;
      (*(void (**)(char *, char *, void *))(v378 + 16))(v364, v164, v158);
      unint64_t v166 = (char *)v369;
      sub_1C51C63E8();
      uint64_t v167 = sub_1C51C58C8();
      if (v167 == 0x737361706B70 && v168 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        uint64_t v170 = v384;
        uint64_t v169 = v385;
        uint64_t v171 = v366;
        uint64_t v172 = v365;
      }
      else
      {
        char v173 = sub_1C51C6B28();
        swift_bridgeObjectRelease();
        uint64_t v170 = v384;
        uint64_t v169 = v385;
        uint64_t v171 = v366;
        uint64_t v172 = v365;
        if ((v173 & 1) == 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v385 + 16))(v363, v166, v384);
          uint64_t v179 = v354;
          sub_1C51C5DC8();
          uint64_t v180 = v353;
          sub_1C51C6438();
          sub_1C51C5DE8();
          sub_1C51C5918();
          sub_1C51C6428();
          v181 = v351;
          sub_1C51C63E8();
          uint64_t v182 = swift_allocObject();
          *(void *)(v182 + 16) = sub_1C51AD348;
          *(void *)(v182 + 24) = v165;
          sub_1C51AD25C(&qword_1EA3D1410, MEMORY[0x1E4F50658]);
          swift_retain();
          sub_1C51C5BD8();
          swift_release();
          v176 = *(void (**)(char *, uint64_t))(v169 + 8);
          v176(v181, v170);
          uint64_t v177 = v380;
          int v178 = *(void (**)(char *, uint64_t))(v381 + 8);
          v178(v180, v380);
          (*(void (**)(char *, uint64_t))(v355 + 8))(v179, v356);
          goto LABEL_37;
        }
      }
      (*(void (**)(char *, char *, uint64_t))(v169 + 16))(v363, v166, v170);
      sub_1C51C5D68();
      sub_1C51C6438();
      sub_1C51C5D88();
      sub_1C51C5918();
      sub_1C51C6428();
      uint64_t v174 = v359;
      sub_1C51C63E8();
      uint64_t v175 = swift_allocObject();
      *(void *)(v175 + 16) = sub_1C51AD348;
      *(void *)(v175 + 24) = v165;
      sub_1C51AD25C(&qword_1EA3D1418, MEMORY[0x1E4F505F8]);
      swift_retain();
      sub_1C51C5BD8();
      swift_release();
      v176 = *(void (**)(char *, uint64_t))(v169 + 8);
      v176(v174, v170);
      uint64_t v177 = v380;
      int v178 = *(void (**)(char *, uint64_t))(v381 + 8);
      v178(v172, v380);
      (*(void (**)(char *, uint64_t))(v361 + 8))(v171, v362);
LABEL_37:
      v176((char *)v369, v170);
      uint64_t v183 = *(void (**)(char *, void (*)(char *, char *, uint64_t)))(v378 + 8);
      v184 = v382;
      v183(v370, v382);
      v178(v376, v177);
      v183(v377, v184);
      return swift_release();
    }
  }
  else
  {
    _Block_release(v130);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v381 + 56))(v374, 1, 1, v380);
    __break(1u);
  }
  _Block_release(v130);
  __break(1u);
  _Block_release(v375);
  swift_unexpectedError();
  __break(1u);
  _Block_release(v375);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1C51AC214(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, unsigned __int8 a12, uint64_t a13, void (**a14)(void, void, void))
{
  unint64_t v73 = a7;
  uint64_t v74 = a8;
  uint64_t v71 = a5;
  uint64_t v72 = a6;
  unint64_t v69 = a3;
  uint64_t v70 = a4;
  uint64_t v68 = a2;
  v85[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v14 = sub_1C51C63F8();
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v67 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1C51C64F8();
  uint64_t v76 = *(void *)(v16 - 8);
  uint64_t v77 = v16;
  MEMORY[0x1F4188790](v16);
  uint64_t v75 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1C51C5928();
  unint64_t v79 = *(void *)(v18 - 8);
  uint64_t v80 = v18;
  MEMORY[0x1F4188790](v18);
  uint64_t v78 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_1C51C59F8();
  uint64_t v81 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_1C51C6468();
  uint64_t v23 = *(void *)(v83 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v83);
  uint64_t v26 = (char *)&v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x1F4188790](v24);
  uint64_t v29 = (char *)&v61 - v28;
  uint64_t v30 = MEMORY[0x1F4188790](v27);
  uint64_t v32 = (char *)&v61 - v31;
  MEMORY[0x1F4188790](v30);
  uint64_t v82 = (char *)&v61 - v33;
  uint64_t v84 = swift_allocObject();
  *(void *)(v84 + 16) = a14;
  uint64_t v34 = self;
  _Block_copy(a14);
  uint64_t v35 = (void *)sub_1C51C6558();
  v85[0] = 0;
  id v36 = objc_msgSend(v34, sel_dataWithPropertyList_format_options_error_, v35, 200, 0, v85);

  id v37 = v85[0];
  if (!v36)
  {
    uint64_t v41 = v37;
    uint64_t v42 = (void *)sub_1C51C58B8();

    swift_willThrow();
LABEL_7:
    sub_1C51C6528();
    sub_1C51AD25C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    uint64_t v58 = (void *)swift_allocError();
    MEMORY[0x1C878C630](v42);
    sub_1C51C6538();
    uint64_t v59 = (void *)sub_1C51C58A8();
    ((void (**)(void, void, void *))a14)[2](a14, 0, v59);

    return swift_release();
  }
  uint64_t v66 = v26;
  uint64_t v38 = sub_1C51C5998();
  unint64_t v40 = v39;

  sub_1C51C6418();
  sub_1C51C6458();
  uint64_t v62 = v38;
  unint64_t v63 = v40;
  uint64_t v43 = v23;
  uint64_t v44 = v23 + 8;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v46 = v83;
  uint64_t v65 = v44;
  uint64_t v64 = v45;
  v45(v29, v83);
  sub_1C51C59E8();
  sub_1C51C59C8();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v22, v20);
  uint64_t v47 = v82;
  sub_1C51C6458();
  v64(v32, v46);
  swift_bridgeObjectRelease();
  id v48 = objc_msgSend(self, sel_defaultManager);
  uint64_t v49 = v78;
  sub_1C51C6438();
  uint64_t v50 = (void *)sub_1C51C58D8();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v49, v80);
  v85[0] = 0;
  LOBYTE(v49) = objc_msgSend(v48, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v50, 1, 0, v85);

  id v51 = v85[0];
  if ((v49 & 1) == 0)
  {
    uint64_t v57 = v51;
    uint64_t v42 = (void *)sub_1C51C58B8();

    swift_willThrow();
    sub_1C518D144(v62, v63);
    v64(v47, v46);
    goto LABEL_7;
  }
  uint64_t v81 = a13;
  LODWORD(v80) = a12;
  uint64_t v78 = (char *)a9;
  unint64_t v79 = a11;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v66, v47, v46);
  sub_1C518D19C(v68, v69);
  swift_bridgeObjectRetain();
  sub_1C51A75CC(v72, v73);
  sub_1C51A75CC(v74, a9);
  sub_1C51A75CC(a10, v79);
  sub_1C51C63E8();
  uint64_t v52 = v75;
  sub_1C51C64E8();
  sub_1C51C6508();
  uint64_t v53 = swift_allocObject();
  uint64_t v54 = v84;
  *(void *)(v53 + 16) = sub_1C51ACB1C;
  *(void *)(v53 + 24) = v54;
  sub_1C51AD25C(&qword_1EA3D1378, MEMORY[0x1E4F50A20]);
  swift_retain();
  uint64_t v55 = v62;
  unint64_t v56 = v63;
  sub_1C51C5BC8();
  swift_release();
  sub_1C518D144(v55, v56);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v52, v77);
  v64(v82, v83);
  return swift_release();
}

uint64_t sub_1C51ACB08(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1C518D144(a1, a2);
  }
  return a1;
}

void sub_1C51ACB1C(uint64_t a1, uint64_t a2)
{
  sub_1C51A1440(a1, a2, *(void *)(v2 + 16));
}

void sub_1C51ACB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1C519B940(a1, a2, a3, *(void *)(v3 + 16));
}

void sub_1C51ACB50(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50730], &qword_1EA3D1440);
}

void sub_1C51ACB90(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F50658], &qword_1EA3D1438);
}

void sub_1C51ACBD0(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F505F8], &qword_1EA3D1430);
}

void sub_1C51ACC10(uint64_t a1)
{
  sub_1C518D4A8(a1, *(void (**)(void *, void *))(v1 + 16), *(void *)(v1 + 24), MEMORY[0x1E4F507B8], &qword_1EA3D1428);
}

void sub_1C51ACC50(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  sub_1C5190A18(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_1C51ACC58(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v2 + 16))(*(unsigned __int8 *)(v2 + 32), a1, a2);
}

uint64_t sub_1C51ACC90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C51ACCEC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1C51A7C00;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA3D1468 + dword_1EA3D1468);
  return v6(a1, v4);
}

double CGRound(double a1)
{
  return round(a1);
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

uint64_t objectdestroy_250Tm()
{
  uint64_t v1 = sub_1C51C5CC8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1C51ACE94()
{
  sub_1C51C5CC8();

  return sub_1C51996F8();
}

uint64_t objectdestroy_253Tm()
{
  uint64_t v1 = sub_1C51C5AA8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_1C51C5928();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  unint64_t v11 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v12 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release();

  return MEMORY[0x1F4186498](v0, v11, v12);
}

void sub_1C51AD090(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_1C51C5AA8() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(sub_1C51C5928() - 8);
  unint64_t v8 = (v6 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + v5);
  uint64_t v10 = *(void (**)(void, void *))(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = v1 + v8;
  uint64_t v13 = v1 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = *(void (**)(uint64_t))v13;
  uint64_t v15 = *(void *)(v13 + 8);

  sub_1C5199864(a1, v1 + v4, v9, v10, v11, v12, v14, v15);
}

uint64_t sub_1C51AD1BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C51AD220(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C51AD25C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1C51AD2A4()
{
  unint64_t result = qword_1EBBD04A0;
  if (!qword_1EBBD04A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBBD0498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBBD04A0);
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

uint64_t RelayGroupMutationMessageUnpacker.unpack(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v126 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1548);
  MEMORY[0x1F4188790](v1 - 8);
  v141 = (char *)&v118 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1C51C6528();
  int64_t v143 = *(void *)(v3 - 8);
  uint64_t v144 = v3;
  MEMORY[0x1F4188790](v3);
  id v142 = (char *)&v118 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = sub_1C51C6488();
  uint64_t v138 = *(void *)(v136 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v136);
  v129 = (char *)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v128 = (char *)&v118 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  char v145 = (char *)&v118 - v10;
  MEMORY[0x1F4188790](v9);
  os_signpost_id_t v137 = (char *)&v118 - v11;
  uint64_t v124 = sub_1C51C6368();
  uint64_t v140 = *(void *)(v124 - 8);
  MEMORY[0x1F4188790](v124);
  id v146 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1550);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v132 = (char *)&v118 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1C51C63B8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v134 = v15;
  uint64_t v135 = v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v139 = (char *)&v118 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  v127 = (char *)&v118 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1558);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  uint64_t v131 = (uint64_t)&v118 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v21);
  unint64_t v133 = (char *)&v118 - v23;
  uint64_t v150 = sub_1C51C6158();
  uint64_t v148 = *(void *)(v150 - 8);
  uint64_t v24 = MEMORY[0x1F4188790](v150);
  uint64_t v125 = (char *)&v118 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  uint64_t v123 = (char *)&v118 - v27;
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  uint64_t v130 = (char *)&v118 - v29;
  MEMORY[0x1F4188790](v28);
  id v149 = (char *)&v118 - v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D11E8);
  MEMORY[0x1F4188790](v31 - 8);
  id v147 = (void (*)(char *, uint64_t, uint64_t))((char *)&v118 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v33 = sub_1C51C59F8();
  uint64_t v151 = *(void *)(v33 - 8);
  uint64_t v34 = MEMORY[0x1F4188790](v33);
  id v36 = (char *)&v118 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v34);
  uint64_t v38 = (char *)&v118 - v37;
  sub_1C51C5898();
  swift_allocObject();
  uint64_t v39 = sub_1C51C5888();
  unint64_t v40 = (void *)sub_1C51C5988();
  id v41 = objc_msgSend(v40, sel__imOptionallyDecompressData);

  uint64_t v42 = sub_1C51C5998();
  unint64_t v44 = v43;

  sub_1C51AE8B4();
  uint64_t v45 = v169;
  sub_1C51C5878();
  if (v45)
  {
    swift_release();
    return sub_1C518D144(v42, v44);
  }
  uint64_t v120 = v36;
  uint64_t v121 = v39;
  uint64_t v122 = v38;
  sub_1C518D144(v42, v44);
  long long v155 = v165;
  long long v156 = v166;
  long long v157 = v167;
  char v158 = v168;
  v152[2] = v161;
  v152[3] = v162;
  long long v153 = v163;
  long long v154 = v164;
  v152[0] = v159;
  v152[1] = v160;
  uint64_t v47 = (uint64_t)v147;
  sub_1C51C59B8();
  uint64_t v48 = v151;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v151 + 48))(v47, 1, v33) == 1)
  {
    sub_1C51AE908((uint64_t)v152);
    sub_1C51ACC90(v47, &qword_1EA3D11E8);
    uint64_t v49 = v142;
    sub_1C51C6518();
    sub_1C51AE9A0();
    uint64_t v151 = sub_1C51C67E8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_1C51C7CA0;
    int64_t v51 = v143;
    uint64_t v169 = *(void (**)(void, void, void))(v143 + 16);
    uint64_t v52 = (uint64_t)v141;
    uint64_t v53 = v144;
    v169(v141, v49, v144);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56))(v52, 0, 1, v53);
    uint64_t v54 = sub_1C51C6378();
    uint64_t v56 = v55;
    sub_1C51ACC90(v52, &qword_1EA3D1548);
    *(void *)(v50 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v50 + 64) = sub_1C51A41F4();
    *(void *)(v50 + 32) = v54;
    *(void *)(v50 + 40) = v56;
    sub_1C51C6758();
    uint64_t v57 = (void *)v151;
    sub_1C51C5A38();

    swift_bridgeObjectRelease();
    sub_1C51AF28C(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    swift_allocError();
    v169(v58, v49, v53);
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v49, v53);
  }
  uint64_t v169 = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v122, v47, v33);
  uint64_t v59 = *MEMORY[0x1E4F50870];
  uint64_t v60 = v148;
  uint64_t v61 = v149;
  uint64_t v62 = (char *)(v148 + 104);
  unint64_t v63 = *(void (**)(char *, uint64_t, uint64_t))(v148 + 104);
  v63(v149, v59, v150);
  uint64_t v119 = v33;
  if (*(void *)&v152[0] != 1)
  {
    if (*(void *)&v152[0])
    {
      uint64_t v75 = v137;
      uint64_t v76 = v138;
      uint64_t v77 = v150;
      uint64_t v78 = v145;
      goto LABEL_23;
    }
    id v147 = v63;
    unint64_t v64 = v156;
    uint64_t v65 = v150;
    if (!(void)v156) {
      goto LABEL_14;
    }
    uint64_t v66 = *((void *)&v155 + 1);
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_1C51AF1A8(1024, v66, v64, v67);
    MEMORY[0x1C878B950](v68);
    uint64_t v70 = v69;
    swift_bridgeObjectRelease();
    uint64_t v60 = v148;
    swift_bridgeObjectRelease();
    if (v70)
    {
      swift_bridgeObjectRetain();
      uint64_t v71 = v133;
      uint64_t v72 = v169;
      sub_1C51C6028();
      unint64_t v73 = v72;
      if (v72)
      {
        sub_1C51AE908((uint64_t)v152);
        swift_release();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v149, v65);
        (*(void (**)(char *, uint64_t))(v151 + 8))(v122, v119);
        return swift_bridgeObjectRelease();
      }
      uint64_t v110 = sub_1C51C6038();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v71, 0, 1, v110);
      swift_bridgeObjectRelease();
      uint64_t v78 = v145;
      uint64_t v80 = (uint64_t)v71;
    }
    else
    {
LABEL_14:
      uint64_t v79 = sub_1C51C6038();
      uint64_t v80 = (uint64_t)v133;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v133, 1, 1, v79);
      uint64_t v78 = v145;
      unint64_t v73 = v169;
    }
    sub_1C51AEE54(v80, v131);
    uint64_t v81 = v130;
    uint64_t v82 = v73;
    sub_1C51C63C8();
    uint64_t v75 = v137;
    uint64_t v76 = v138;
    uint64_t v169 = v82;
    if (!v82)
    {
      sub_1C51ACC90(v80, &qword_1EA3D1558);
      uint64_t v85 = v149;
      uint64_t v86 = v150;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v149, v150);
      v147(v81, *MEMORY[0x1E4F50860], v86);
      uint64_t v87 = v81;
      uint64_t v77 = v86;
      (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v85, v87, v86);
      goto LABEL_23;
    }
    swift_release();
    sub_1C51AE908((uint64_t)v152);
    sub_1C51ACC90(v80, &qword_1EA3D1558);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v149, v150);
    return (*(uint64_t (**)(char *, uint64_t))(v151 + 8))(v122, v119);
  }
  id v147 = v63;
  v141 = v62;
  if (v157)
  {
    uint64_t v74 = (uint64_t)v132;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v135 + 56))(v132, 1, 1, v134);
LABEL_19:
    uint64_t v77 = v150;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v150);
    sub_1C51ACC90(v74, &qword_1EA3D1550);
LABEL_20:
    uint64_t v78 = v145;
    v147(v61, v59, v77);
    goto LABEL_21;
  }
  uint64_t v74 = (uint64_t)v132;
  sub_1C51C63A8();
  uint64_t v83 = v134;
  uint64_t v84 = v135;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v135 + 48))(v74, 1, v134) == 1) {
    goto LABEL_19;
  }
  uint64_t v95 = v127;
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v127, v74, v83);
  if (!*((void *)&v157 + 1))
  {
    (*(void (**)(char *, uint64_t))(v84 + 8))(v95, v83);
    uint64_t v77 = v150;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v150);
    goto LABEL_20;
  }
  uint64_t v96 = *(void *)(*((void *)&v157 + 1) + 64);
  id v142 = (char *)(*((void *)&v157 + 1) + 64);
  uint64_t v97 = 1 << *(unsigned char *)(*((void *)&v157 + 1) + 32);
  uint64_t v98 = -1;
  if (v97 < 64) {
    uint64_t v98 = ~(-1 << v97);
  }
  uint64_t v99 = v98 & v96;
  int64_t v143 = (unint64_t)(v97 + 63) >> 6;
  uint64_t v144 = v140 + 32;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v100 = 0;
  unint64_t v101 = MEMORY[0x1E4FBC860];
  uint64_t v102 = v139;
  if (!v99) {
    goto LABEL_31;
  }
LABEL_30:
  for (v99 &= v99 - 1; ; uint64_t v99 = (v104 - 1) & v104)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v106 = v169;
    sub_1C51C6358();
    uint64_t v169 = v106;
    if (v106)
    {
      swift_release();
      sub_1C51AE908((uint64_t)v152);
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(char *, uint64_t))(v135 + 8))(v127, v134);
      (*(void (**)(char *, uint64_t))(v148 + 8))(v149, v150);
      return (*(uint64_t (**)(char *, uint64_t))(v151 + 8))(v122, v119);
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v101 = sub_1C51AEBEC(0, *(void *)(v101 + 16) + 1, 1, v101);
    }
    uint64_t v107 = v140;
    unint64_t v109 = *(void *)(v101 + 16);
    unint64_t v108 = *(void *)(v101 + 24);
    if (v109 >= v108 >> 1) {
      unint64_t v101 = sub_1C51AEBEC(v108 > 1, v109 + 1, 1, v101);
    }
    *(void *)(v101 + 16) = v109 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t))(v107 + 32))(v101+ ((*(unsigned __int8 *)(v107 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80))+ *(void *)(v107 + 72) * v109);
    uint64_t v60 = v148;
    uint64_t v102 = v139;
    if (v99) {
      goto LABEL_30;
    }
LABEL_31:
    BOOL v103 = __OFADD__(v100++, 1);
    uint64_t v78 = v145;
    if (v103)
    {
      __break(1u);
LABEL_60:
      __break(1u);
      return result;
    }
    if (v100 >= v143) {
      goto LABEL_56;
    }
    uint64_t v104 = *(void *)&v142[8 * v100];
    if (!v104) {
      break;
    }
LABEL_41:
    ;
  }
  int64_t v105 = v100 + 1;
  if (v100 + 1 >= v143) {
    goto LABEL_56;
  }
  uint64_t v104 = *(void *)&v142[8 * v105];
  if (v104) {
    goto LABEL_40;
  }
  int64_t v105 = v100 + 2;
  if (v100 + 2 >= v143) {
    goto LABEL_56;
  }
  uint64_t v104 = *(void *)&v142[8 * v105];
  if (v104)
  {
LABEL_40:
    int64_t v100 = v105;
    goto LABEL_41;
  }
  int64_t v105 = v100 + 3;
  if (v100 + 3 < v143)
  {
    uint64_t v104 = *(void *)&v142[8 * v105];
    if (!v104)
    {
      while (1)
      {
        int64_t v100 = v105 + 1;
        if (__OFADD__(v105, 1)) {
          goto LABEL_60;
        }
        if (v100 >= v143) {
          goto LABEL_56;
        }
        uint64_t v104 = *(void *)&v142[8 * v100];
        ++v105;
        if (v104) {
          goto LABEL_41;
        }
      }
    }
    goto LABEL_40;
  }
LABEL_56:
  swift_release();
  uint64_t v111 = v135;
  uint64_t v112 = v102;
  uint64_t v113 = v127;
  uint64_t v114 = v134;
  (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v112, v127, v134);
  char v115 = v123;
  uint64_t v116 = v169;
  sub_1C51C63D8();
  uint64_t v77 = v150;
  if (v116)
  {
    swift_release();
    sub_1C51AE908((uint64_t)v152);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v113, v114);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v149, v77);
    return (*(uint64_t (**)(char *, uint64_t))(v151 + 8))(v122, v119);
  }
  uint64_t v169 = 0;
  (*(void (**)(char *, uint64_t))(v111 + 8))(v113, v114);
  uint64_t v117 = v149;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v149, v77);
  v147(v115, *MEMORY[0x1E4F50868], v77);
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v117, v115, v77);
LABEL_21:
  uint64_t v75 = v137;
  uint64_t v76 = v138;
LABEL_23:
  swift_bridgeObjectRetain();
  uint64_t v88 = v169;
  sub_1C51C6478();
  uint64_t v89 = v136;
  if (!v88)
  {
    swift_bridgeObjectRetain();
    sub_1C51C6478();
    uint64_t v90 = v75;
    uint64_t v91 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
    v91(v128, v90, v89);
    v91(v129, v78, v89);
    (*(void (**)(char *, char *, uint64_t))(v151 + 16))(v120, v122, v119);
    id v147 = (void (*)(char *, uint64_t, uint64_t))*((void *)&v152[0] + 1);
    uint64_t v148 = *((void *)&v154 + 1);
    uint64_t v92 = v60;
    uint64_t v169 = (void (*)(void, void, void))*((void *)&v153 + 1);
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v125, v149, v77);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C51C6308();
    swift_release();
    sub_1C51AE908((uint64_t)v152);
    uint64_t v93 = *(void (**)(char *, uint64_t))(v138 + 8);
    uint64_t v94 = v136;
    v93(v145, v136);
    v93(v137, v94);
    (*(void (**)(char *, uint64_t))(v92 + 8))(v149, v150);
    return (*(uint64_t (**)(char *, uint64_t))(v151 + 8))(v122, v119);
  }
  swift_release();
  sub_1C51AE908((uint64_t)v152);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v149, v77);
  return (*(uint64_t (**)(char *, uint64_t))(v151 + 8))(v122, v119);
}

uint64_t sub_1C51AE89C@<X0>(uint64_t a1@<X8>)
{
  return RelayGroupMutationMessageUnpacker.unpack(from:)(a1);
}

unint64_t sub_1C51AE8B4()
{
  unint64_t result = qword_1EA3D1560;
  if (!qword_1EA3D1560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1560);
  }
  return result;
}

uint64_t sub_1C51AE908(uint64_t a1)
{
  return a1;
}

unint64_t sub_1C51AE9A0()
{
  unint64_t result = qword_1EBBD0440;
  if (!qword_1EBBD0440)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBBD0440);
  }
  return result;
}

char *sub_1C51AE9E0(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D14B8);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
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
      uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (char *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1C51AEFCC(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1C51AEADC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1570);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_1C51AF0B4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C51AEBEC(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1568);
  uint64_t v10 = *(void *)(sub_1C51C6368() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1C51C6938();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1C51C6368() - 8);
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
    sub_1C51AF2E4(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1C51AEE54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_1C51AEEBC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1408);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C51AF43C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1C51AEFCC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_1C51C6988();
  __break(1u);
  return result;
}

uint64_t sub_1C51AF0B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C51C6988();
  __break(1u);
  return result;
}

uint64_t sub_1C51AF1A8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_1C51C6628();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return MEMORY[0x1F4183BA0](a1, a2, a3, a4);
}

uint64_t sub_1C51AF244()
{
  return sub_1C51AF28C(&qword_1EA3D13E8, MEMORY[0x1E4F509B0]);
}

uint64_t sub_1C51AF28C(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for RelayGroupMutationMessageUnpacker()
{
  return &type metadata for RelayGroupMutationMessageUnpacker;
}

uint64_t sub_1C51AF2E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1C51C6368() - 8);
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
  uint64_t result = sub_1C51C6988();
  __break(1u);
  return result;
}

uint64_t sub_1C51AF43C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1C51C6988();
  __break(1u);
  return result;
}

uint64_t sub_1C51AF530(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v2 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v3 = a1;
    if (!a1)
    {
LABEL_11:
      uint64_t v8 = sub_1C51BE0E4((uint64_t)v2);
      swift_bridgeObjectRelease();
      return v8;
    }
    while (v3)
    {
      unint64_t v4 = sub_1C51AF750(8);
      if (v1) {
        return swift_bridgeObjectRelease();
      }
      char v5 = v4;
      if (v4 > 0xFF) {
        goto LABEL_15;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v2 = sub_1C51AE9E0(0, *((void *)v2 + 2) + 1, 1, v2);
      }
      unint64_t v7 = *((void *)v2 + 2);
      unint64_t v6 = *((void *)v2 + 3);
      if (v7 >= v6 >> 1) {
        uint64_t v2 = sub_1C51AE9E0((char *)(v6 > 1), v7 + 1, 1, v2);
      }
      *((void *)v2 + 2) = v7 + 1;
      v2[v7 + 32] = v5;
      if (!--v3) {
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_1C51C6938();
  __break(1u);
  return result;
}

uint64_t sub_1C51AF69C()
{
  return 1;
}

uint64_t _s24MessagesBlastDoorSupport17LiteTextAttributeO9hashValueSivg_0()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51AF6E8()
{
  return sub_1C51C6BE8();
}

uint64_t sub_1C51AF710()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51AF750(uint64_t a1)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  unint64_t v4 = *(void *)(*v1 + 16);
  unint64_t v5 = v4 - v3;
  if (__OFSUB__(v4, v3))
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if ((v5 - 0x1000000000000000) >> 61 != 7)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v6 = v1[2];
  uint64_t v7 = 8 * v5;
  BOOL v8 = __OFSUB__(v7, v6);
  uint64_t v9 = v7 - v6;
  if (v8)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v9 < a1)
  {
    sub_1C51AFA84();
    swift_allocError();
    swift_willThrow();
    return v10;
  }
  if (v6 < 1)
  {
    if (a1 <= 7)
    {
      if (a1 <= 0) {
        return 0;
      }
      if ((v3 & 0x8000000000000000) != 0) {
        goto LABEL_51;
      }
      unint64_t v15 = 0;
LABEL_39:
      if (v3 < v4)
      {
        unint64_t v20 = (unint64_t)*(unsigned __int8 *)(v2 + v3 + 32) >> (8 - a1);
        BOOL v21 = __CFADD__(v15, v20);
        unint64_t v10 = v15 + v20;
        if (!v21)
        {
          v1[2] = a1;
          return v10;
        }
        goto LABEL_50;
      }
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    if ((v3 & 0x8000000000000000) != 0)
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    unint64_t v17 = 0;
LABEL_30:
    unint64_t v18 = *(void *)(v2 + 16);
    if (v3 < v18)
    {
      unint64_t v10 = v17 | *(unsigned __int8 *)(v2 + 32 + v3);
      if ((unint64_t)(a1 - 8) < 8)
      {
        ++v3;
        a1 -= 8;
LABEL_36:
        v1[1] = v3;
LABEL_37:
        if (a1 < 1) {
          return v10;
        }
        unint64_t v15 = v10 << a1;
        unint64_t v4 = *(void *)(v2 + 16);
        goto LABEL_39;
      }
      while (1)
      {
        unint64_t v19 = v3 + 1;
        if (v3 + 1 >= v18) {
          break;
        }
        unint64_t v10 = *(unsigned __int8 *)(v2 + 33 + v3) | (v10 << 8);
        a1 -= 8;
        ++v3;
        if (a1 <= 15)
        {
          a1 -= 8;
          unint64_t v3 = v19 + 1;
          goto LABEL_36;
        }
      }
    }
    __break(1u);
    goto LABEL_45;
  }
  uint64_t v11 = v6 + a1;
  if (__OFADD__(v6, a1))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (v11 > 7)
  {
    if (v3 >= v4)
    {
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    BOOL v8 = __OFSUB__(a1, 8 - v6);
    a1 -= 8 - v6;
    if (v8)
    {
LABEL_56:
      __break(1u);
      goto LABEL_57;
    }
    if ((unint64_t)v6 >= 0x40) {
      LOBYTE(v16) = 0;
    }
    else {
      unint64_t v16 = 0xFFuLL >> v6;
    }
    unint64_t v10 = v16 & *(unsigned char *)(v2 + v3++ + 32);
    v1[1] = v3;
    v1[2] = 0;
    if (a1 < 8) {
      goto LABEL_37;
    }
    unint64_t v17 = v10 << 8;
    goto LABEL_30;
  }
  if (v3 >= v4)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  unint64_t v12 = 0xFFuLL >> v6;
  if ((unint64_t)v6 >= 0x40) {
    LOBYTE(v12) = 0;
  }
  uint64_t v13 = 8 - v6;
  BOOL v8 = __OFSUB__(v13, a1);
  unint64_t v14 = v13 - a1;
  if (v8) {
    goto LABEL_55;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    unint64_t v10 = (v12 & *(unsigned char *)(v2 + v3 + 32)) >> v14;
    if (v14 >= 0x40) {
      unint64_t v10 = 0;
    }
    v1[2] = v11;
    return v10;
  }
LABEL_57:
  uint64_t result = sub_1C51C6938();
  __break(1u);
  return result;
}

unint64_t sub_1C51AF9DC(uint64_t a1)
{
  char v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = sub_1C51AF750(1);
    if (v1) {
      return v5;
    }
    uint64_t v7 = v6;
    unint64_t result = sub_1C51AF750(a1);
    unint64_t v9 = result << v4;
    if ((unint64_t)v4 >= 0x40) {
      unint64_t v9 = 0;
    }
    unint64_t v10 = result >> v3;
    if ((unint64_t)v4 <= 0xFFFFFFFFFFFFFFC0) {
      unint64_t v10 = 0;
    }
    if (v4 < 0) {
      unint64_t v9 = v10;
    }
    unint64_t v11 = (unint64_t)(v4 - 65) >= 0xFFFFFFFFFFFFFF7FLL ? v9 : 0;
    if (__OFADD__(v4, a1)) {
      break;
    }
    v5 |= v11;
    v4 += a1;
    v3 -= a1;
    if (!v7) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_1C51AFA84()
{
  unint64_t result = qword_1EA3D1578;
  if (!qword_1EA3D1578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1578);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BitIteratorError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BitIteratorError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C51AFBC8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C51AFBF0()
{
  return 0;
}

ValueMetadata *type metadata accessor for BitIteratorError()
{
  return &type metadata for BitIteratorError;
}

unint64_t sub_1C51AFC0C()
{
  unint64_t result = qword_1EA3D1580;
  if (!qword_1EA3D1580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1580);
  }
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::StorageContext __swiftcall IncomingPushPayload.StorageContext.init(rawValue:)(MessagesBlastDoorSupport::IncomingPushPayload::StorageContext rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t IncomingPushPayload.StorageContext.rawValue.getter()
{
  return *(void *)v0;
}

void static IncomingPushPayload.StorageContext.isFromStorage.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static IncomingPushPayload.StorageContext.isLastFromStorage.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void *sub_1C51AFC88@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1C51AFC94()
{
  return sub_1C51C66B8();
}

uint64_t sub_1C51AFCF4()
{
  return sub_1C51C66A8();
}

void sub_1C51AFD44(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1C51AFD4C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_1C51AFD60@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_1C51AFD74@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1C51AFD88(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_1C51AFDB8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1C51AFDE4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1C51AFE08(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1C51AFE1C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1C51AFE30(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1C51AFE44@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1C51AFE58(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_1C51AFE6C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_1C51AFE80(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_1C51AFE94()
{
  return *v0 == 0;
}

uint64_t sub_1C51AFEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

void *sub_1C51AFEBC(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1C51AFED0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1C51AFEE0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1C51AFEEC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C51AFF04@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t IncomingPushPayload.messageGUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUIDData();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51B0E64(v1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for UUIDData);
  uint64_t v6 = sub_1C51C59F8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, v5, v6);
}

uint64_t sub_1C51B0028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for UUIDData();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C51B0E64(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for UUIDData);
  uint64_t v7 = sub_1C51C59F8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a2, v6, v7);
}

uint64_t sub_1C51B00F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2, v7, v4);
}

uint64_t IncomingPushPayload.messageGUID.setter(uint64_t a1)
{
  uint64_t v3 = sub_1C51C59F8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*IncomingPushPayload.messageGUID.modify())()
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.timestamp.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 20));
}

uint64_t type metadata accessor for IncomingPushPayload()
{
  uint64_t result = qword_1EA3D1230;
  if (!qword_1EA3D1230) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t IncomingPushPayload.timestamp.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  uint64_t v6 = v2 + *(int *)(result + 20);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

double (*IncomingPushPayload.timestamp.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.command.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 24));
}

uint64_t IncomingPushPayload.command.setter(char a1)
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

double (*IncomingPushPayload.command.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.wantsDeliveryReceipt.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 28));
}

uint64_t IncomingPushPayload.wantsDeliveryReceipt.setter(char a1)
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  *(unsigned char *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

double (*IncomingPushPayload.wantsDeliveryReceipt.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.wantsCheckpointing.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for IncomingPushPayload() + 32));
}

uint64_t IncomingPushPayload.wantsCheckpointing.setter(char a1)
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

double (*IncomingPushPayload.wantsCheckpointing.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.storageContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(result + 36));
  uint64_t v5 = *v4;
  LOBYTE(v4) = *((unsigned char *)v4 + 8);
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t IncomingPushPayload.storageContext.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t result = type metadata accessor for IncomingPushPayload();
  uint64_t v5 = v1 + *(int *)(result + 36);
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 8) = v3;
  return result;
}

double (*IncomingPushPayload.storageContext.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t IncomingPushPayload.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1588);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B08D8();
  sub_1C51C6C48();
  char v20 = 0;
  type metadata accessor for UUIDData();
  sub_1C51B0D68(&qword_1EA3D1590);
  sub_1C51C6AF8();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for IncomingPushPayload();
    char v19 = 1;
    sub_1C51C6B08();
    char v18 = 2;
    sub_1C51C6AC8();
    char v17 = 3;
    sub_1C51C6A98();
    char v16 = 4;
    sub_1C51C6A98();
    unint64_t v10 = (uint64_t *)(v3 + *(int *)(v9 + 36));
    uint64_t v11 = *v10;
    LOBYTE(v10) = *((unsigned char *)v10 + 8);
    uint64_t v14 = v11;
    char v15 = (char)v10;
    v13[15] = 5;
    sub_1C51B092C();
    sub_1C51C6AB8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C51B08D8()
{
  unint64_t result = qword_1EA3D1208;
  if (!qword_1EA3D1208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1208);
  }
  return result;
}

unint64_t sub_1C51B092C()
{
  unint64_t result = qword_1EA3D1598;
  if (!qword_1EA3D1598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1598);
  }
  return result;
}

uint64_t IncomingPushPayload.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v27 = type metadata accessor for UUIDData();
  MEMORY[0x1F4188790](v27);
  uint64_t v29 = (uint64_t)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1260);
  uint64_t v26 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for IncomingPushPayload();
  uint64_t v7 = (int *)MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = &v9[v7[5]];
  *(void *)unint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v25 = v7[7];
  v9[v25] = 2;
  uint64_t v11 = v7[8];
  v9[v11] = 2;
  unint64_t v12 = &v9[v7[9]];
  *(void *)unint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = a1[3];
  uint64_t v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_1C51B08D8();
  uint64_t v28 = v5;
  uint64_t v14 = v32;
  sub_1C51C6C28();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  }
  char v15 = v10;
  uint64_t v17 = v25;
  uint64_t v16 = v26;
  char v40 = 0;
  sub_1C51B0D68(&qword_1EA3D1240);
  char v18 = v28;
  sub_1C51C6A48();
  sub_1C51B0DAC(v29, (uint64_t)v9);
  char v39 = 1;
  v9[*(int *)(v6 + 24)] = sub_1C51C6A58();
  char v38 = 2;
  *(void *)char v15 = sub_1C51C6A18();
  v15[8] = v19 & 1;
  char v37 = 3;
  v9[v17] = sub_1C51C69E8();
  char v36 = 4;
  v9[v11] = sub_1C51C69E8();
  char v35 = 5;
  sub_1C51B0E10();
  uint64_t v21 = v30;
  sub_1C51C6A08();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v21);
  char v22 = v34;
  *(void *)unint64_t v12 = v33;
  v12[8] = v22;
  sub_1C51B0E64((uint64_t)v9, v24, (uint64_t (*)(void))type metadata accessor for IncomingPushPayload);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  return sub_1C51B0ECC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for IncomingPushPayload);
}

uint64_t sub_1C51B0D68(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for UUIDData();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C51B0DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUIDData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C51B0E10()
{
  unint64_t result = qword_1EA3D1220;
  if (!qword_1EA3D1220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1220);
  }
  return result;
}

uint64_t sub_1C51B0E64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C51B0ECC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C51B0F2C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return IncomingPushPayload.init(from:)(a1, a2);
}

uint64_t sub_1C51B0F44(void *a1)
{
  return IncomingPushPayload.encode(to:)(a1);
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional __swiftcall IncomingPushPayload.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C51C69A8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional __swiftcall IncomingPushPayload.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v2 = v1;
  result.value = IncomingPushPayload.CodingKeys.init(rawValue:)(stringValue).value;
  *uint64_t v2 = v4;
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional __swiftcall IncomingPushPayload.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 6;
  return (MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional)intValue;
}

uint64_t IncomingPushPayload.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t IncomingPushPayload.CodingKeys.rawValue.getter()
{
  uint64_t result = 85;
  switch(*v0)
  {
    case 1:
      uint64_t result = 99;
      break;
    case 2:
      uint64_t result = 101;
      break;
    case 3:
      uint64_t result = 68;
      break;
    case 4:
      uint64_t result = 25453;
      break;
    case 5:
      uint64_t result = 72;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t IncomingPushPayload.CodingKeys.stringValue.getter()
{
  uint64_t result = 85;
  switch(*v0)
  {
    case 1:
      uint64_t result = 99;
      break;
    case 2:
      uint64_t result = 101;
      break;
    case 3:
      uint64_t result = 68;
      break;
    case 4:
      uint64_t result = 25453;
      break;
    case 5:
      uint64_t result = 72;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_1C51B10EC()
{
  unint64_t result = qword_1EA3D15A0;
  if (!qword_1EA3D15A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D15A0);
  }
  return result;
}

unint64_t sub_1C51B1144()
{
  unint64_t result = qword_1EA3D15A8;
  if (!qword_1EA3D15A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D15A8);
  }
  return result;
}

unint64_t sub_1C51B119C()
{
  unint64_t result = qword_1EA3D15B0;
  if (!qword_1EA3D15B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D15B0);
  }
  return result;
}

unint64_t sub_1C51B11F4()
{
  unint64_t result = qword_1EA3D15B8;
  if (!qword_1EA3D15B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D15B8);
  }
  return result;
}

uint64_t sub_1C51B1248(char *a1, char *a2)
{
  return sub_1C51C32EC(*a1, *a2);
}

unint64_t sub_1C51B1258()
{
  unint64_t result = qword_1EA3D15C0;
  if (!qword_1EA3D15C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D15C0);
  }
  return result;
}

uint64_t sub_1C51B12AC()
{
  return sub_1C51C1E30();
}

uint64_t sub_1C51B12B4()
{
  sub_1C51C6608();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C51B1358()
{
  return sub_1C51C2128();
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional sub_1C51B1360(Swift::String *a1)
{
  return IncomingPushPayload.CodingKeys.init(rawValue:)(*a1);
}

void sub_1C51B136C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 85;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 99;
      goto LABEL_3;
    case 2:
      *a1 = 101;
      a1[1] = 0xE100000000000000;
      break;
    case 3:
      *a1 = 68;
      a1[1] = 0xE100000000000000;
      break;
    case 4:
      *a1 = 25453;
      a1[1] = 0xE200000000000000;
      break;
    case 5:
      *a1 = 72;
      a1[1] = 0xE100000000000000;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE100000000000000;
      break;
  }
}

unint64_t sub_1C51B13F4()
{
  unint64_t result = qword_1EA3D1218;
  if (!qword_1EA3D1218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1218);
  }
  return result;
}

unint64_t sub_1C51B144C()
{
  unint64_t result = qword_1EA3D1210;
  if (!qword_1EA3D1210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1210);
  }
  return result;
}

uint64_t sub_1C51B14A0()
{
  uint64_t result = 85;
  switch(*v0)
  {
    case 1:
      uint64_t result = 99;
      break;
    case 2:
      uint64_t result = 101;
      break;
    case 3:
      uint64_t result = 68;
      break;
    case 4:
      uint64_t result = 25453;
      break;
    case 5:
      uint64_t result = 72;
      break;
    default:
      return result;
  }
  return result;
}

MessagesBlastDoorSupport::IncomingPushPayload::CodingKeys_optional sub_1C51B1510@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  result.value = IncomingPushPayload.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

uint64_t sub_1C51B1548()
{
  return 0;
}

void sub_1C51B1554(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1C51B1560(uint64_t a1)
{
  unint64_t v2 = sub_1C51B08D8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B159C(uint64_t a1)
{
  unint64_t v2 = sub_1C51B08D8();

  return MEMORY[0x1F41862B0](a1, v2);
}

void *initializeBufferWithCopyOfBuffer for IncomingPushPayload(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C51C59F8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *(void *)unint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v12 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    uint64_t v13 = a3[9];
    uint64_t v14 = (char *)a1 + v13;
    char v15 = (char *)a2 + v13;
    *(void *)uint64_t v14 = *(void *)v15;
    v14[8] = v15[8];
  }
  return a1;
}

uint64_t destroy for UUIDData(uint64_t a1)
{
  uint64_t v2 = sub_1C51C59F8();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  return a1;
}

uint64_t assignWithCopy for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  *(unsigned char *)(v8 + 8) = *((unsigned char *)v9 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  LOBYTE(v10) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = v10;
  return a1;
}

uint64_t initializeWithTake for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  return a1;
}

uint64_t assignWithTake for IncomingPushPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v11 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = *(unsigned char *)(v14 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingPushPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C51B1A84);
}

uint64_t sub_1C51B1A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUIDData();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 2) {
      int v11 = ((v10 + 2147483646) & 0x7FFFFFFF) - 1;
    }
    else {
      int v11 = -2;
    }
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for IncomingPushPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C51B1B74);
}

uint64_t sub_1C51B1B74(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUIDData();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 28)) = a2 + 2;
  }
  return result;
}

uint64_t sub_1C51B1C30()
{
  uint64_t result = sub_1C51C59F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingPushPayload.StorageContext()
{
  return &type metadata for IncomingPushPayload.StorageContext;
}

uint64_t getEnumTagSinglePayload for IncomingPushPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IncomingPushPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1C51B1E4CLL);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingPushPayload.CodingKeys()
{
  return &type metadata for IncomingPushPayload.CodingKeys;
}

unint64_t LiteTextMessageUnpacker.unpack(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v99 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15C8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v90 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C51C59F8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v101 = v7;
  uint64_t v102 = v8;
  MEMORY[0x1F4188790](v7);
  uint64_t v89 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_1C51C5D58();
  uint64_t v100 = *(void *)(v98 - 8);
  MEMORY[0x1F4188790](v98);
  uint64_t v91 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for LiteAcknowledgmentMessageContent(0);
  MEMORY[0x1F4188790](v88);
  uint64_t v95 = (uint64_t)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = type metadata accessor for LiteReplyMessageContent(0);
  MEMORY[0x1F4188790](v93);
  uint64_t v104 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D0);
  uint64_t v14 = MEMORY[0x1F4188790](v13 - 8);
  uint64_t v87 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v14);
  uint64_t v84 = (char *)&v80 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v94 = (char *)&v80 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v97 = (char *)&v80 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D11E8);
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  uint64_t v85 = (char *)&v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v83 = (char *)&v80 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  uint64_t v92 = (char *)&v80 - v27;
  MEMORY[0x1F4188790](v26);
  uint64_t v96 = (char *)&v80 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
  uint64_t v30 = MEMORY[0x1F4188790](v29 - 8);
  uint64_t v86 = (char *)&v80 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = MEMORY[0x1F4188790](v30);
  uint64_t v82 = (char *)&v80 - v33;
  uint64_t v34 = MEMORY[0x1F4188790](v32);
  BOOL v103 = (char *)&v80 - v35;
  MEMORY[0x1F4188790](v34);
  char v37 = (char *)&v80 - v36;
  uint64_t v38 = type metadata accessor for LiteTextMessageContent(0);
  MEMORY[0x1F4188790](v38);
  char v40 = (uint64_t *)((char *)&v80 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v41 = sub_1C51C5FA8();
  uint64_t v105 = *(void *)(v41 - 8);
  uint64_t v42 = MEMORY[0x1F4188790](v41);
  unint64_t v44 = (char *)&v80 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v42);
  uint64_t v46 = (char *)&v80 - v45;
  sub_1C518D19C(a1, a2);
  uint64_t v47 = sub_1C51B2B90(a1, a2);
  sub_1C518D144(a1, a2);
  v107[1] = 0;
  v107[2] = 0;
  v107[0] = v47;
  uint64_t v48 = v108;
  unint64_t result = sub_1C51AF9DC(3);
  if (v48) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v80 = v38;
  uint64_t v81 = v37;
  uint64_t v51 = (uint64_t)v103;
  uint64_t v50 = v104;
  unint64_t v108 = v46;
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v52 = v44;
    uint64_t v53 = v108;
    sub_1C51C5F98();
    uint64_t v54 = v105;
    (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v52, v53, v41);
    int v55 = (*(uint64_t (**)(char *, uint64_t))(v54 + 88))(v52, v41);
    if (v55 == *MEMORY[0x1E4F50758])
    {
      sub_1C51C0700(v40);
      swift_bridgeObjectRelease();
      sub_1C51B2D4C((uint64_t)v40 + *(int *)(v80 + 20), (uint64_t)v81);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v102 + 56))(v96, 1, 1, v101);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v100 + 56))(v97, 1, 1, v98);
      swift_bridgeObjectRetain();
      sub_1C51C5FC8();
      sub_1C51B2DB4((uint64_t)v40, type metadata accessor for LiteTextMessageContent);
      return (*(uint64_t (**)(char *, uint64_t))(v105 + 8))(v108, v41);
    }
    else if (v55 == *MEMORY[0x1E4F50760])
    {
      sub_1C51C0854(v50);
      uint64_t v56 = v101;
      uint64_t v57 = v102;
      swift_bridgeObjectRelease();
      uint64_t v66 = *(int *)(v93 + 24);
      uint64_t v97 = *(char **)&v50[*(int *)(v93 + 20)];
      sub_1C51B2D4C((uint64_t)&v50[v66], v51);
      unint64_t v67 = v92;
      (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v92, v50, v56);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v57 + 56))(v67, 0, 1, v56);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v100 + 56))(v94, 1, 1, v98);
      swift_bridgeObjectRetain();
      sub_1C51C5FC8();
      uint64_t v68 = v108;
      sub_1C51B2DB4((uint64_t)v50, type metadata accessor for LiteReplyMessageContent);
      return (*(uint64_t (**)(char *, uint64_t))(v105 + 8))(v68, v41);
    }
    else
    {
      uint64_t v59 = v101;
      uint64_t v58 = v102;
      if (v55 == *MEMORY[0x1E4F50750])
      {
        uint64_t v60 = v95;
        sub_1C51C0BA0((uint64_t)v107, v95);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v89, v60 + *(int *)(v88 + 20), v59);
        uint64_t v61 = sub_1C51C5D38();
        uint64_t v62 = *(void *)(v61 - 8);
        unint64_t v63 = v90;
        (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v90, v60, v61);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v63, 0, 1, v61);
        swift_bridgeObjectRetain();
        unint64_t v64 = v91;
        sub_1C51C5D48();
        uint64_t v74 = sub_1C51C5FE8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v82, 1, 1, v74);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v102 + 56))(v83, 1, 1, v59);
        uint64_t v75 = v64;
        uint64_t v76 = v100;
        uint64_t v77 = v84;
        uint64_t v78 = v98;
        (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v84, v75, v98);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v76 + 56))(v77, 0, 1, v78);
        sub_1C51C5FC8();
        uint64_t v79 = v105;
        (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v78);
        sub_1C51B2DB4(v95, type metadata accessor for LiteAcknowledgmentMessageContent);
        return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v108, v41);
      }
      else
      {
        uint64_t v65 = sub_1C518C9C0();
        uint64_t v70 = HIBYTE(v69) & 0xF;
        v106[0] = v65;
        v106[1] = v69;
        if ((v69 & 0x2000000000000000) == 0) {
          uint64_t v70 = (unint64_t)v65 & 0xFFFFFFFFFFFFLL;
        }
        v106[2] = 0;
        v106[3] = v70;
        swift_bridgeObjectRetain();
        uint64_t v71 = sub_1C51B8690((uint64_t)v106);
        uint64_t v104 = 0;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        Array<A>.spansAsPlainText.getter(v71);
        swift_bridgeObjectRelease();
        uint64_t v72 = sub_1C51C5FE8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v86, 1, 1, v72);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v58 + 56))(v85, 1, 1, v59);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v100 + 56))(v87, 1, 1, v98);
        sub_1C51C5FC8();
        unint64_t v73 = *(void (**)(char *, uint64_t))(v105 + 8);
        v73(v108, v41);
        return ((uint64_t (*)(char *, uint64_t))v73)(v52, v41);
      }
    }
  }
  return result;
}

unint64_t sub_1C51B2B78@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return LiteTextMessageUnpacker.unpack(from:)(a1, a2, a3);
}

void *sub_1C51B2B90(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_1C51C59A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D14B8);
          uint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_1C518D19C(a1, a2);
        uint64_t v13 = sub_1C51C5958();
        sub_1C518D144(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x1C51B2D3CLL);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1C51B2D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C51B2DB4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1C51B2E18()
{
  unint64_t result = qword_1EA3D13C8;
  if (!qword_1EA3D13C8)
  {
    sub_1C51C5FF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D13C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteTextMessageUnpacker()
{
  return &type metadata for LiteTextMessageUnpacker;
}

uint64_t Data._imOptionallyDecompress()()
{
  uint64_t v0 = (void *)sub_1C51C5988();
  id v1 = objc_msgSend(v0, sel__imOptionallyDecompressData);

  uint64_t v2 = sub_1C51C5998();
  return v2;
}

uint64_t LiteMessageCompressor.decode(_:codecID:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = *v3;
  if (v8 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C51C6958();
    if (v9) {
      goto LABEL_3;
    }
LABEL_47:
    swift_bridgeObjectRelease();
    return v9;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_47;
  }
LABEL_3:
  unint64_t v10 = v8 & 0xC000000000000001;
  if ((v8 & 0xC000000000000001) != 0) {
    goto LABEL_50;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_52:
    swift_once();
    goto LABEL_26;
  }
  uint64_t v11 = *(void *)(v8 + 32);
  swift_retain();
LABEL_6:
  if (cosl_codec_get_id() != a3)
  {
    swift_release();
    if (v9 == 1)
    {
LABEL_19:
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v13 = 5;
    while (1)
    {
      unint64_t v14 = v13 - 4;
      if (v10)
      {
        uint64_t v11 = MEMORY[0x1C878BBF0](v13 - 4, v8);
        BOOL v15 = __OFADD__(v14, 1);
        unint64_t v4 = v13 - 3;
        if (v15) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v14 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_50:
          uint64_t v11 = MEMORY[0x1C878BBF0](0, v8);
          goto LABEL_6;
        }
        uint64_t v11 = *(void *)(v8 + 8 * v13);
        swift_retain();
        BOOL v15 = __OFADD__(v14, 1);
        unint64_t v4 = v13 - 3;
        if (v15)
        {
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
      }
      if (cosl_codec_get_id() == a3) {
        break;
      }
      swift_release();
      ++v13;
      if (v4 == v9) {
        goto LABEL_19;
      }
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v10 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
      }
      swift_retain_n();
      sub_1C518D19C(a1, a2);
      sub_1C51B57CC((int)a1, a1 >> 32, v11, &v31);
      sub_1C518D144(a1, a2);
      break;
    case 2uLL:
      uint64_t v16 = *(void *)(a1 + 16);
      uint64_t v17 = *(void *)(a1 + 24);
      swift_retain_n();
      swift_retain();
      swift_retain();
      sub_1C51B57CC(v16, v17, v11, &v31);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v30, 0, 14);
      swift_retain();
      size_t v12 = (char *)v30;
      goto LABEL_22;
    default:
      v30[0] = a1;
      LOWORD(v30[1]) = a2;
      BYTE2(v30[1]) = BYTE2(a2);
      BYTE3(v30[1]) = BYTE3(a2);
      BYTE4(v30[1]) = BYTE4(a2);
      BYTE5(v30[1]) = BYTE5(a2);
      swift_retain();
      size_t v12 = (char *)v30 + BYTE6(a2);
LABEL_22:
      sub_1C51B3620((uint64_t)v30, (uint64_t)v12, v11, &v31);
      break;
  }
  swift_release();
  unint64_t v4 = *((void *)&v31 + 1);
  uint64_t v9 = v31;
  if (qword_1EA3D1268 != -1) {
    goto LABEL_52;
  }
LABEL_26:
  uint64_t v18 = sub_1C51C5B28();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EA3D15E0);
  sub_1C51A75CC(v9, v4);
  sub_1C518D19C(a1, a2);
  sub_1C51A75CC(v9, v4);
  uint64_t v19 = sub_1C51C5B08();
  os_log_type_t v20 = sub_1C51C6738();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (_DWORD *)swift_slowAlloc();
    *uint64_t v21 = 134218496;
    uint64_t v22 = v21;
    uint64_t v23 = 0;
    switch((int)v10)
    {
      case 1:
        LODWORD(v23) = HIDWORD(a1) - a1;
        if (__OFSUB__(HIDWORD(a1), a1)) {
          goto LABEL_54;
        }
        uint64_t v23 = (int)v23;
LABEL_33:
        *(void *)&long long v31 = v23;
        sub_1C51C6818();
        sub_1C518D144(a1, a2);
        *((_WORD *)v22 + 6) = 2048;
        if (v4 >> 60 != 15)
        {
          switch(v4 >> 62)
          {
            case 1uLL:
              sub_1C51ACB08(v9, v4);
              LODWORD(v26) = HIDWORD(v9) - v9;
              if (__OFSUB__(HIDWORD(v9), v9)) {
                goto LABEL_56;
              }
              uint64_t v26 = (int)v26;
              goto LABEL_35;
            case 2uLL:
              uint64_t v27 = *(void *)(v9 + 16);
              uint64_t v29 = *(void *)(v9 + 24);
              sub_1C51ACB08(v9, v4);
              uint64_t v26 = v29 - v27;
              if (!__OFSUB__(v29, v27)) {
                goto LABEL_35;
              }
              __break(1u);
LABEL_42:
              sub_1C51ACB08(v9, v4);
              break;
            case 3uLL:
              goto LABEL_42;
            default:
              sub_1C51ACB08(v9, v4);
              uint64_t v26 = BYTE6(v4);
              goto LABEL_35;
          }
        }
        uint64_t v26 = 0;
LABEL_35:
        *(void *)&long long v31 = v26;
        sub_1C51C6818();
        sub_1C51ACB08(v9, v4);
        *((_WORD *)v22 + 11) = 2048;
        *(void *)&long long v31 = a3;
        sub_1C51C6818();
        _os_log_impl(&dword_1C5188000, v19, v20, "Decompressed %ld bytes to %ld using codec %ld", (uint8_t *)v22, 0x20u);
        MEMORY[0x1C878C780](v22, -1, -1);
        break;
      case 2:
        uint64_t v25 = *(void *)(a1 + 16);
        uint64_t v24 = *(void *)(a1 + 24);
        BOOL v15 = __OFSUB__(v24, v25);
        uint64_t v23 = v24 - v25;
        if (!v15) {
          goto LABEL_33;
        }
        goto LABEL_55;
      case 3:
        goto LABEL_33;
      default:
        uint64_t v23 = BYTE6(a2);
        goto LABEL_33;
    }
  }
  else
  {
    sub_1C51ACB08(v9, v4);
    sub_1C518D144(a1, a2);
    sub_1C51ACB08(v9, v4);
  }

  swift_release();
  return v9;
}

uint64_t sub_1C51B3534()
{
  uint64_t v0 = sub_1C51C5B28();
  __swift_allocate_value_buffer(v0, qword_1EA3D15E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA3D15E0);
  return sub_1C51C5B18();
}

uint64_t sub_1C51B35B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = cosl_codec_map();
  *a1 = result;
  return result;
}

uint64_t sub_1C51B35E8()
{
  cosl_codec_unmap();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1C51B3620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, long long *a4@<X8>)
{
  uint64_t result = cosl_codec_get_decoded_size();
  if (result <= 100000)
  {
    uint64_t v10 = sub_1C51B6170(result);
    unint64_t v11 = v9;
    sub_1C51B58F8(&v10, 0);
    swift_retain();
    sub_1C51B5440(&v10, a3, a1, a2, MEMORY[0x1E4FBA5A8], a4);
    return sub_1C518D144(v10, v11);
  }
  else
  {
    *a4 = xmmword_1C51C82F0;
  }
  return result;
}

uint64_t sub_1C51B3704@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, long long *a7@<X8>)
{
  uint64_t v10 = *(void *)(a3 + 16);
  if (a1) {
    uint64_t v11 = a2 - a1;
  }
  else {
    uint64_t v11 = 0;
  }
  if (a4) {
    uint64_t v12 = a5 - a4;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t result = a6(v10, a1, v11, a4, v12);
  if (!result)
  {
    long long v17 = xmmword_1C51C82F0;
    goto LABEL_11;
  }
  uint64_t v14 = result;
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1608);
    v19[3] = v15;
    v19[4] = sub_1C51B5FEC();
    uint64_t v16 = (void *)swift_allocObject();
    v19[0] = v16;
    v16[2] = 0;
    v16[3] = v14;
    v16[4] = a1;
    v16[5] = a2;
    __swift_project_boxed_opaque_existential_1(v19, v15);
    sub_1C51C6BB8();
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    long long v17 = v18;
LABEL_11:
    *a7 = v17;
    return result;
  }
  __break(1u);
  return result;
}

void sub_1C51B3838()
{
  off_1EA3D15F8 = &unk_1F20AEEE0;
}

MessagesBlastDoorSupport::LiteMessageCompressor __swiftcall LiteMessageCompressor.init()()
{
  id v1 = v0;
  if (qword_1EA3D1270 != -1) {
    result.codecs._rawValue = (void *)swift_once();
  }
  uint64_t v2 = (char *)off_1EA3D15F8;
  uint64_t v3 = *((void *)off_1EA3D15F8 + 2);
  uint64_t v4 = MEMORY[0x1E4FBC860];
  if (v3)
  {
    uint64_t v10 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRetain();
    sub_1C51C68F8();
    uint64_t v5 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v6 = *v5;
      v8[0] = *(v5 - 1);
      v8[1] = v6;
      swift_bridgeObjectRetain();
      sub_1C51B397C(v8, &v9);
      swift_bridgeObjectRelease();
      v5 += 2;
      sub_1C51C68D8();
      sub_1C51C6908();
      sub_1C51C6918();
      sub_1C51C68E8();
      --v3;
    }
    while (v3);
    uint64_t v4 = v10;
    result.codecs._rawValue = (void *)swift_bridgeObjectRelease();
  }
  *id v1 = v4;
  return result;
}

uint64_t sub_1C51B397C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0470);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C51C5928();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  char v37 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v34 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v36 = (char *)v34 - v13;
  uint64_t v14 = *a1;
  uint64_t v15 = a1[1];
  type metadata accessor for LiteMessageCompressor.Codec();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v17 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v34[0] = v15;
  v34[1] = v14;
  long long v18 = (void *)sub_1C51C6588();
  uint64_t v19 = (void *)sub_1C51C6588();
  id v20 = objc_msgSend(v17, sel_URLForResource_withExtension_, v18, v19);

  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_14;
  }
  sub_1C51C58F8();

  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v21(v5, v12, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_14:
    sub_1C51B6068((uint64_t)v5);
    unint64_t v38 = 0;
    uint64_t v39 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1C51C6878();
    swift_bridgeObjectRelease();
    unint64_t v38 = 0xD000000000000015;
    uint64_t v39 = 0x80000001C51CA9C0;
    sub_1C51C6648();
    uint64_t result = sub_1C51C6948();
    __break(1u);
    return result;
  }
  uint64_t v22 = v36;
  v21(v36, v5, v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v37, v22, v6);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = sub_1C51C5908();
  unint64_t v26 = v24;
  uint64_t v27 = v25;
  if ((v25 & 0x1000000000000000) != 0 || !(v25 & 0x2000000000000000 | v24 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1618);
    sub_1C51C6868();
    swift_bridgeObjectRelease();
    uint64_t v28 = v35;
  }
  else
  {
    MEMORY[0x1F4188790](v24);
    uint64_t v28 = v35;
    if ((v27 & 0x2000000000000000) != 0)
    {
      unint64_t v38 = v26;
      uint64_t v39 = v27 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v40 = cosl_codec_map();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v26 & 0x1000000000000000) != 0)
      {
        uint64_t v29 = (v27 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v30 = v26 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v29 = sub_1C51C68C8();
      }
      uint64_t v40 = sub_1C51B58B8(v29, v30, (uint64_t (*)(void))sub_1C51B60C8);
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v31 = v40;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v7 + 8);
  v32(v37, v6);
  *(void *)(v23 + 16) = v31;
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v32)(v36, v6);
  *uint64_t v28 = v23;
  return result;
}

uint64_t LiteMessageCompressor.encode(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v194 = *MEMORY[0x1E4F143B8];
  unint64_t isUniquelyReferenced_nonNull_native = *v2;
  unint64_t v190 = MEMORY[0x1E4FBC868];
  if (isUniquelyReferenced_nonNull_native >> 62) {
    goto LABEL_208;
  }
  uint64_t v6 = *(void *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v6)
  {
    uint64_t v173 = 0;
    uint64_t v172 = 0;
    unint64_t v184 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
    uint64_t v170 = (int)a1;
    uint64_t v168 = a1 >> 32;
    uint64_t v163 = (a1 >> 32) - (int)a1;
    long long v164 = (char *)v189 + BYTE6(a2);
    size_t v169 = BYTE6(a2);
    unint64_t v162 = (unint64_t)BYTE6(a2) << 32;
    unint64_t v7 = 0xF000000000000000;
    uint64_t v8 = 4;
    unint64_t v166 = HIDWORD(a2);
    unint64_t v167 = a2 >> 40;
    unint64_t v165 = a2 >> 24;
    unint64_t v185 = a2 >> 62;
    uint64_t v186 = a1;
    unint64_t v171 = a2;
    unint64_t v182 = isUniquelyReferenced_nonNull_native;
    uint64_t v183 = v6;
    while (1)
    {
      uint64_t v9 = v8 - 4;
      uint64_t v187 = v8;
      if (v184)
      {
        unint64_t isUniquelyReferenced_nonNull_native = MEMORY[0x1C878BBF0](v8 - 4, isUniquelyReferenced_nonNull_native);
        uint64_t v10 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          break;
        }
        goto LABEL_12;
      }
      unint64_t isUniquelyReferenced_nonNull_native = *(void *)(isUniquelyReferenced_nonNull_native + 8 * v8);
      swift_retain();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
LABEL_12:
      switch(v185)
      {
        case 1uLL:
          if (v168 < v170) {
            goto LABEL_195;
          }
          sub_1C518D19C(a1, a2);
          uint64_t v22 = sub_1C51C5828();
          uint64_t v175 = isUniquelyReferenced_nonNull_native;
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = sub_1C51C5858();
            if (__OFSUB__(v170, v24)) {
              goto LABEL_200;
            }
            uint64_t v25 = v23 + v170 - v24;
          }
          else
          {
            uint64_t v25 = 0;
          }
          uint64_t v34 = sub_1C51C5848();
          uint64_t v35 = v163;
          if (v34 < v163) {
            uint64_t v35 = v34;
          }
          uint64_t v36 = v25 + v35;
          if (v25) {
            uint64_t v37 = v36;
          }
          else {
            uint64_t v37 = 0;
          }
          if (v25 && (uint64_t v38 = v36 - v25, v36 != v25))
          {
            if (v38 < 15)
            {
              *(void *)((char *)&v191 + 6) = 0;
              *(void *)&long long v191 = 0;
              BYTE14(v191) = v36 - v25;
              bzero(&v191, (v36 - v25));
              a1 = v191;
              unint64_t v39 = DWORD2(v191) | ((unint64_t)BYTE12(v191) << 32) | ((unint64_t)BYTE13(v191) << 40) | ((unint64_t)BYTE14(v191) << 48);
            }
            else
            {
              sub_1C51C5868();
              swift_allocObject();
              a1 = sub_1C51C5838();
              if ((unint64_t)v38 > 0x7FFFFFFE)
              {
                sub_1C51C5978();
                uint64_t v41 = a1;
                a1 = swift_allocObject();
                *(void *)(a1 + 16) = 0;
                *(void *)(a1 + 24) = v38;
                if (swift_isUniquelyReferenced_nonNull_native())
                {
                  uint64_t v178 = v41;
                }
                else
                {
                  uint64_t v50 = *(void *)(a1 + 16);
                  uint64_t v180 = *(void *)(a1 + 24);
                  if (sub_1C51C5828() && __OFSUB__(v50, sub_1C51C5858())) {
                    goto LABEL_227;
                  }
                  if (__OFSUB__(v180, v50)) {
                    goto LABEL_224;
                  }
                  swift_allocObject();
                  uint64_t v120 = sub_1C51C5808();
                  swift_release();
                  uint64_t v178 = v120;
                }
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  uint64_t v121 = *(void *)(a1 + 16);
                  uint64_t v122 = *(void *)(a1 + 24);
                  uint64_t v123 = swift_allocObject();
                  *(void *)(v123 + 16) = v121;
                  *(void *)(v123 + 24) = v122;
                  swift_release();
                  a1 = v123;
                }
                uint64_t v124 = *(void *)(a1 + 16);
                uint64_t v125 = *(void *)(a1 + 24);
                uint64_t v126 = sub_1C51C5828();
                if (!v126) {
                  goto LABEL_236;
                }
                uint64_t v127 = v126;
                uint64_t v128 = sub_1C51C5858();
                a2 = v124 - v128;
                if (__OFSUB__(v124, v128)) {
                  goto LABEL_219;
                }
                BOOL v76 = __OFSUB__(v125, v124);
                int64_t v129 = v125 - v124;
                if (v76) {
                  goto LABEL_221;
                }
                uint64_t v130 = sub_1C51C5848();
                if (v130 >= v129) {
                  size_t v131 = v129;
                }
                else {
                  size_t v131 = v130;
                }
                bzero((void *)(v127 + a2), v131);
                unint64_t v39 = v178 | 0x8000000000000000;
                a2 = v171;
              }
              else
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  if (sub_1C51C5828() && __OFSUB__(0, sub_1C51C5858())) {
                    goto LABEL_228;
                  }
                  swift_allocObject();
                  uint64_t v59 = sub_1C51C5808();
                  swift_release();
                  a1 = v59;
                }
                uint64_t v60 = sub_1C51C5828();
                if (!v60) {
                  goto LABEL_234;
                }
                uint64_t v61 = v60;
                uint64_t v62 = sub_1C51C5858();
                uint64_t v63 = -v62;
                if (__OFSUB__(0, v62)) {
                  goto LABEL_217;
                }
                uint64_t v64 = sub_1C51C5848();
                if (v64 >= v38) {
                  size_t v65 = v38;
                }
                else {
                  size_t v65 = v64;
                }
                bzero((void *)(v61 + v63), v65);
                uint64_t v66 = a1;
                a1 = v38 << 32;
                unint64_t v39 = v66 | 0x4000000000000000;
              }
            }
          }
          else
          {
            a1 = 0;
            unint64_t v39 = 0xC000000000000000;
          }
          uint64_t v192 = a1;
          unint64_t v193 = v39;
          unint64_t isUniquelyReferenced_nonNull_native = v175;
          swift_retain();
          sub_1C51B5440(&v192, v175, v25, v37, MEMORY[0x1E4FBA5B0], &v191);
          sub_1C518D144(v192, v193);
          sub_1C518D144(v186, a2);
          goto LABEL_112;
        case 2uLL:
          uint64_t v12 = *(void *)(a1 + 16);
          uint64_t v13 = *(void *)(a1 + 24);
          swift_retain();
          swift_retain();
          uint64_t v14 = sub_1C51C5828();
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = sub_1C51C5858();
            if (__OFSUB__(v12, v16)) {
              goto LABEL_199;
            }
            uint64_t v17 = v15 + v12 - v16;
            uint64_t v18 = v13 - v12;
            if (__OFSUB__(v13, v12)) {
              goto LABEL_196;
            }
          }
          else
          {
            uint64_t v17 = 0;
            uint64_t v18 = v13 - v12;
            if (__OFSUB__(v13, v12)) {
              goto LABEL_196;
            }
          }
          uint64_t v26 = sub_1C51C5848();
          if (v26 >= v18) {
            uint64_t v27 = v18;
          }
          else {
            uint64_t v27 = v26;
          }
          uint64_t v28 = v17 + v27;
          if (v17) {
            uint64_t v29 = v28;
          }
          else {
            uint64_t v29 = 0;
          }
          if (v17)
          {
            unint64_t v176 = isUniquelyReferenced_nonNull_native;
            uint64_t v30 = v28 - v17;
            if (v28 == v17)
            {
              a1 = 0;
              unint64_t v31 = 0xC000000000000000;
            }
            else if (v30 < 15)
            {
              *(void *)((char *)&v191 + 6) = 0;
              *(void *)&long long v191 = 0;
              BYTE14(v191) = v28 - v17;
              bzero(&v191, (v28 - v17));
              a1 = v191;
              unint64_t v31 = DWORD2(v191) | ((unint64_t)BYTE12(v191) << 32) | ((unint64_t)BYTE13(v191) << 40) | ((unint64_t)BYTE14(v191) << 48);
            }
            else
            {
              sub_1C51C5868();
              swift_allocObject();
              a1 = sub_1C51C5838();
              if ((unint64_t)v30 > 0x7FFFFFFE)
              {
                sub_1C51C5978();
                uint64_t v40 = a1;
                a1 = swift_allocObject();
                *(void *)(a1 + 16) = 0;
                *(void *)(a1 + 24) = v30;
                if (swift_isUniquelyReferenced_nonNull_native())
                {
                  uint64_t v177 = v40;
                }
                else
                {
                  uint64_t v49 = *(void *)(a1 + 16);
                  uint64_t v179 = *(void *)(a1 + 24);
                  if (sub_1C51C5828() && __OFSUB__(v49, sub_1C51C5858())) {
                    goto LABEL_226;
                  }
                  if (__OFSUB__(v179, v49))
                  {
                    __break(1u);
LABEL_224:
                    __break(1u);
LABEL_225:
                    __break(1u);
LABEL_226:
                    __break(1u);
LABEL_227:
                    __break(1u);
LABEL_228:
                    __break(1u);
LABEL_229:
                    __break(1u);
LABEL_230:
                    __break(1u);
LABEL_231:
                    __break(1u);
LABEL_232:
                    __break(1u);
                  }
                  swift_allocObject();
                  uint64_t v67 = sub_1C51C5808();
                  swift_release();
                  uint64_t v177 = v67;
                }
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  uint64_t v68 = *(void *)(a1 + 16);
                  uint64_t v69 = *(void *)(a1 + 24);
                  uint64_t v70 = swift_allocObject();
                  *(void *)(v70 + 16) = v68;
                  *(void *)(v70 + 24) = v69;
                  swift_release();
                  a1 = v70;
                }
                uint64_t v71 = *(void *)(a1 + 16);
                uint64_t v72 = *(void *)(a1 + 24);
                uint64_t v73 = sub_1C51C5828();
                if (!v73) {
                  goto LABEL_235;
                }
                uint64_t v74 = v73;
                uint64_t v75 = sub_1C51C5858();
                a2 = v71 - v75;
                if (__OFSUB__(v71, v75)) {
                  goto LABEL_218;
                }
                BOOL v76 = __OFSUB__(v72, v71);
                int64_t v77 = v72 - v71;
                if (v76) {
                  goto LABEL_220;
                }
                uint64_t v78 = sub_1C51C5848();
                if (v78 >= v77) {
                  size_t v79 = v77;
                }
                else {
                  size_t v79 = v78;
                }
                bzero((void *)(v74 + a2), v79);
                unint64_t v31 = v177 | 0x8000000000000000;
                a2 = v171;
              }
              else
              {
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  if (sub_1C51C5828() && __OFSUB__(0, sub_1C51C5858())) {
                    goto LABEL_225;
                  }
                  swift_allocObject();
                  uint64_t v51 = sub_1C51C5808();
                  swift_release();
                  a1 = v51;
                }
                uint64_t v52 = sub_1C51C5828();
                if (!v52)
                {
                  __break(1u);
LABEL_234:
                  __break(1u);
LABEL_235:
                  __break(1u);
LABEL_236:
                  __break(1u);
LABEL_237:
                  sub_1C51C6B68();
                  __break(1u);
                  JUMPOUT(0x1C51B53D4);
                }
                uint64_t v53 = v52;
                uint64_t v54 = sub_1C51C5858();
                uint64_t v55 = -v54;
                if (__OFSUB__(0, v54)) {
                  goto LABEL_216;
                }
                uint64_t v56 = sub_1C51C5848();
                if (v56 >= v30) {
                  size_t v57 = v30;
                }
                else {
                  size_t v57 = v56;
                }
                bzero((void *)(v53 + v55), v57);
                uint64_t v58 = a1;
                a1 = v30 << 32;
                unint64_t v31 = v58 | 0x4000000000000000;
              }
            }
            unint64_t isUniquelyReferenced_nonNull_native = v176;
          }
          else
          {
            a1 = 0;
            unint64_t v31 = 0xC000000000000000;
          }
          uint64_t v192 = a1;
          unint64_t v193 = v31;
          swift_retain();
          sub_1C51B5440(&v192, isUniquelyReferenced_nonNull_native, v17, v29, MEMORY[0x1E4FBA5B0], &v191);
          sub_1C518D144(v192, v193);
          swift_release();
          swift_release();
          goto LABEL_112;
        case 3uLL:
          memset(v189, 0, 14);
          uint64_t v192 = a1;
          unint64_t v193 = a2;
          swift_retain();
          uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E4FBA5B0];
          id v20 = v189;
          uint64_t v21 = isUniquelyReferenced_nonNull_native;
          goto LABEL_78;
        default:
          v189[0] = a1;
          LOWORD(v189[1]) = a2;
          BYTE2(v189[1]) = BYTE2(a2);
          BYTE3(v189[1]) = v165;
          BYTE4(v189[1]) = v166;
          BYTE5(v189[1]) = v167;
          if (v169)
          {
            if (v169 < 0xF)
            {
              *(void *)((char *)&v191 + 6) = 0;
              *(void *)&long long v191 = 0;
              BYTE14(v191) = BYTE6(a2);
              bzero(&v191, v169);
              uint64_t v32 = v191;
              unint64_t v33 = DWORD2(v191) | ((unint64_t)BYTE12(v191) << 32) | ((unint64_t)BYTE13(v191) << 40) | ((unint64_t)BYTE14(v191) << 48);
            }
            else
            {
              sub_1C51C5868();
              swift_allocObject();
              uint64_t v11 = sub_1C51C5838();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                if (sub_1C51C5828() && __OFSUB__(0, sub_1C51C5858()))
                {
                  __break(1u);
LABEL_216:
                  __break(1u);
LABEL_217:
                  __break(1u);
LABEL_218:
                  __break(1u);
LABEL_219:
                  __break(1u);
LABEL_220:
                  __break(1u);
LABEL_221:
                  __break(1u);
                  goto LABEL_222;
                }
                swift_allocObject();
                uint64_t v42 = sub_1C51C5808();
                swift_release();
                uint64_t v11 = v42;
              }
              uint64_t v43 = sub_1C51C5828();
              if (!v43) {
                goto LABEL_232;
              }
              uint64_t v44 = v43;
              uint64_t v45 = sub_1C51C5858();
              uint64_t v46 = -v45;
              if (__OFSUB__(0, v45)) {
                goto LABEL_205;
              }
              uint64_t v47 = sub_1C51C5848();
              if (v47 >= (uint64_t)v169) {
                size_t v48 = v169;
              }
              else {
                size_t v48 = v47;
              }
              bzero((void *)(v44 + v46), v48);
              unint64_t v33 = v11 | 0x4000000000000000;
              uint64_t v32 = v162;
            }
          }
          else
          {
            uint64_t v32 = 0;
            unint64_t v33 = 0xC000000000000000;
          }
          uint64_t v192 = v32;
          unint64_t v193 = v33;
          swift_retain();
          uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E4FBA5B0];
          uint64_t v21 = isUniquelyReferenced_nonNull_native;
          id v20 = v164;
LABEL_78:
          sub_1C51B5440(&v192, v21, (uint64_t)v189, (uint64_t)v20, v19, &v191);
          sub_1C518D144(v192, v193);
LABEL_112:
          unint64_t v80 = *((void *)&v191 + 1);
          uint64_t v81 = v191;
          unsigned int id = cosl_codec_get_id();
          if (v80 >> 60 == 15)
          {
            a1 = a2;
            a2 = v7;
            uint64_t v83 = id;
            unint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t v84 = v190;
            unint64_t v190 = 0x8000000000000000;
            *(void *)&long long v191 = v84;
            unint64_t v86 = sub_1C51A3C08(v83);
            uint64_t v87 = *(void *)(v84 + 16);
            BOOL v88 = (v85 & 1) == 0;
            uint64_t v89 = v87 + v88;
            uint64_t v90 = v183;
            if (__OFADD__(v87, v88)) {
              goto LABEL_193;
            }
            char v91 = v85;
            if (*(void *)(v84 + 24) >= v89)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                sub_1C51B5E28();
              }
              unint64_t isUniquelyReferenced_nonNull_native = v182;
            }
            else
            {
              sub_1C51B5B80(v89, isUniquelyReferenced_nonNull_native);
              unint64_t v92 = sub_1C51A3C08(v83);
              unint64_t isUniquelyReferenced_nonNull_native = v182;
              if ((v91 & 1) != (v93 & 1)) {
                goto LABEL_237;
              }
              unint64_t v86 = v92;
            }
            uint64_t v95 = (void *)v191;
            if (v91)
            {
              *(void *)(*(void *)(v191 + 56) + 8 * v86) = -1;
              a2 = a1;
            }
            else
            {
              *(void *)(v191 + 8 * (v86 >> 6) + 64) |= 1 << v86;
              uint64_t v96 = 8 * v86;
              *(void *)(v95[6] + v96) = v83;
              *(void *)(v95[7] + v96) = -1;
              uint64_t v97 = v95[2];
              BOOL v76 = __OFADD__(v97, 1);
              uint64_t v98 = v97 + 1;
              if (v76) {
                goto LABEL_197;
              }
              a2 = a1;
              v95[2] = v98;
            }
            unint64_t v190 = (unint64_t)v95;
            swift_release();
            swift_bridgeObjectRelease();
            a1 = v186;
          }
          else
          {
            unint64_t v181 = v7;
            uint64_t v94 = 0;
            switch(v80 >> 62)
            {
              case 1uLL:
                if (__OFSUB__(HIDWORD(v81), v81)) {
                  goto LABEL_201;
                }
                uint64_t v94 = HIDWORD(v81) - (int)v81;
LABEL_128:
                unint64_t isUniquelyReferenced_nonNull_native = id;
                a2 = swift_isUniquelyReferenced_nonNull_native();
                unint64_t v101 = v190;
                unint64_t v190 = 0x8000000000000000;
                *(void *)&long long v191 = v101;
                a1 = sub_1C51A3C08(isUniquelyReferenced_nonNull_native);
                uint64_t v103 = *(void *)(v101 + 16);
                BOOL v104 = (v102 & 1) == 0;
                uint64_t v105 = v103 + v104;
                if (__OFADD__(v103, v104)) {
                  goto LABEL_194;
                }
                char v106 = v102;
                if (*(void *)(v101 + 24) >= v105)
                {
                  if ((a2 & 1) == 0) {
                    sub_1C51B5E28();
                  }
                }
                else
                {
                  sub_1C51B5B80(v105, a2);
                  unint64_t v107 = sub_1C51A3C08(isUniquelyReferenced_nonNull_native);
                  if ((v106 & 1) != (v108 & 1)) {
                    goto LABEL_237;
                  }
                  a1 = v107;
                }
                a2 = v171;
                unint64_t v109 = (void *)v191;
                if (v106)
                {
                  *(void *)(*(void *)(v191 + 56) + 8 * a1) = v94;
                }
                else
                {
                  *(void *)(v191 + 8 * ((unint64_t)a1 >> 6) + 64) |= 1 << a1;
                  uint64_t v110 = 8 * a1;
                  *(void *)(v109[6] + v110) = isUniquelyReferenced_nonNull_native;
                  *(void *)(v109[7] + v110) = v94;
                  uint64_t v111 = v109[2];
                  BOOL v76 = __OFADD__(v111, 1);
                  uint64_t v112 = v111 + 1;
                  if (v76) {
                    goto LABEL_198;
                  }
                  v109[2] = v112;
                }
                unint64_t v190 = (unint64_t)v109;
                swift_bridgeObjectRelease();
                unint64_t v7 = v181;
                a1 = v186;
                if (v181 >> 60 == 15)
                {
                  uint64_t v113 = 0x7FFFFFFFFFFFFFFFLL;
                  unint64_t isUniquelyReferenced_nonNull_native = v182;
                }
                else
                {
                  unint64_t isUniquelyReferenced_nonNull_native = v182;
                  uint64_t v113 = 0;
                  switch(v181 >> 62)
                  {
                    case 1uLL:
                      LODWORD(v113) = HIDWORD(v173) - v173;
                      if (__OFSUB__(HIDWORD(v173), v173)) {
                        goto LABEL_206;
                      }
                      uint64_t v113 = (int)v113;
                      break;
                    case 2uLL:
                      uint64_t v119 = *(void *)(v173 + 16);
                      uint64_t v118 = *(void *)(v173 + 24);
                      BOOL v76 = __OFSUB__(v118, v119);
                      uint64_t v113 = v118 - v119;
                      if (!v76) {
                        break;
                      }
                      goto LABEL_207;
                    case 3uLL:
                      break;
                    default:
                      uint64_t v113 = BYTE6(v181);
                      break;
                  }
                }
                switch(v80 >> 62)
                {
                  case 1uLL:
                    if (__OFSUB__(HIDWORD(v81), v81)) {
                      goto LABEL_204;
                    }
                    if (HIDWORD(v81) - (int)v81 < v113) {
                      goto LABEL_149;
                    }
                    goto LABEL_147;
                  case 2uLL:
                    uint64_t v115 = *(void *)(v81 + 16);
                    uint64_t v114 = *(void *)(v81 + 24);
                    BOOL v76 = __OFSUB__(v114, v115);
                    uint64_t v116 = v114 - v115;
                    if (v76) {
                      goto LABEL_203;
                    }
                    if (v116 < v113)
                    {
LABEL_149:
                      unsigned int v117 = cosl_codec_get_id();
                      swift_release();
                      sub_1C51ACB08(v173, v181);
                      uint64_t v173 = v81;
                      unint64_t v7 = v80;
                      uint64_t v172 = v117;
                    }
                    else
                    {
LABEL_147:
                      sub_1C51ACB08(v81, v80);
                      swift_release();
                    }
                    uint64_t v90 = v183;
                    break;
                  case 3uLL:
                    if (v113 > 0) {
                      goto LABEL_149;
                    }
                    goto LABEL_147;
                  default:
                    if (BYTE6(v80) < v113) {
                      goto LABEL_149;
                    }
                    goto LABEL_147;
                }
                break;
              case 2uLL:
                uint64_t v100 = *(void *)(v81 + 16);
                uint64_t v99 = *(void *)(v81 + 24);
                uint64_t v94 = v99 - v100;
                if (!__OFSUB__(v99, v100)) {
                  goto LABEL_128;
                }
                goto LABEL_202;
              case 3uLL:
                goto LABEL_128;
              default:
                uint64_t v94 = BYTE6(v80);
                goto LABEL_128;
            }
          }
          uint64_t v8 = v187 + 1;
          if (v10 == v90)
          {
            swift_bridgeObjectRelease();
            if (v7 >> 60 == 15)
            {
              uint64_t v132 = v173;
              goto LABEL_210;
            }
            uint64_t v10 = v173;
            sub_1C518D19C(v173, v7);
            if (qword_1EA3D1268 == -1)
            {
LABEL_173:
              uint64_t v133 = sub_1C51C5B28();
              __swift_project_value_buffer(v133, (uint64_t)qword_1EA3D15E0);
              sub_1C51A75CC(v10, v7);
              sub_1C51A75CC(v10, v7);
              sub_1C518D19C(a1, a2);
              sub_1C51A75CC(v10, v7);
              sub_1C518D19C(a1, a2);
              sub_1C51A75CC(v10, v7);
              uint64_t v134 = sub_1C51C5B08();
              uint64_t v135 = v10;
              os_log_type_t v136 = sub_1C51C6738();
              if (os_log_type_enabled(v134, v136))
              {
                uint64_t v137 = swift_slowAlloc();
                uint64_t v138 = swift_slowAlloc();
                uint64_t v192 = v138;
                *(_DWORD *)uint64_t v137 = 134218754;
                uint64_t v139 = v138;
                switch(v185)
                {
                  case 1uLL:
                    sub_1C518D144(a1, a2);
                    LODWORD(v140) = HIDWORD(a1) - a1;
                    if (__OFSUB__(HIDWORD(a1), a1)) {
                      goto LABEL_229;
                    }
                    size_t v140 = (int)v140;
                    break;
                  case 2uLL:
                    unint64_t v142 = a2;
                    uint64_t v144 = *(void *)(a1 + 16);
                    uint64_t v143 = *(void *)(a1 + 24);
                    sub_1C518D144(a1, v142);
                    size_t v140 = v143 - v144;
                    if (__OFSUB__(v143, v144)) {
                      goto LABEL_230;
                    }
                    a2 = v171;
                    break;
                  case 3uLL:
                    sub_1C518D144(a1, a2);
                    size_t v140 = 0;
                    break;
                  default:
                    sub_1C518D144(a1, a2);
                    size_t v140 = v169;
                    break;
                }
                *(void *)&long long v191 = v140;
                sub_1C51C6818();
                sub_1C518D144(a1, a2);
                *(_WORD *)(v137 + 12) = 2048;
                uint64_t v188 = v139;
                switch(v7 >> 62)
                {
                  case 1uLL:
                    goto LABEL_187;
                  case 2uLL:
                    uint64_t v149 = *(void *)(v173 + 16);
                    uint64_t v148 = *(void *)(v173 + 24);
                    sub_1C51ACB08(v173, v7);
                    uint64_t v147 = v148 - v149;
                    if (!__OFSUB__(v148, v149)) {
                      goto LABEL_189;
                    }
                    __break(1u);
LABEL_187:
                    sub_1C51ACB08(v173, v7);
                    LODWORD(v147) = HIDWORD(v173) - v173;
                    if (__OFSUB__(HIDWORD(v173), v173)) {
                      goto LABEL_231;
                    }
                    uint64_t v147 = (int)v147;
LABEL_189:
                    uint64_t v146 = v172;
                    uint64_t v145 = v173;
LABEL_191:
                    *(void *)&long long v191 = v147;
                    sub_1C51C6818();
                    sub_1C51ACB08(v145, v7);
                    *(_WORD *)(v137 + 22) = 2048;
                    sub_1C51ACB08(v145, v7);
                    *(void *)&long long v191 = v146;
                    sub_1C51C6818();
                    sub_1C51ACB08(v145, v7);
                    *(_WORD *)(v137 + 32) = 2080;
                    swift_beginAccess();
                    swift_bridgeObjectRetain();
                    uint64_t v150 = sub_1C51C6578();
                    unint64_t v151 = v7;
                    unint64_t v153 = v152;
                    swift_bridgeObjectRelease();
                    v189[0] = sub_1C51A3538(v150, v153, &v192);
                    sub_1C51C6818();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_1C5188000, v134, v136, "Compressed %ld bytes to %ld (codec: %ld) (all results: %s)", (uint8_t *)v137, 0x2Au);
                    swift_arrayDestroy();
                    MEMORY[0x1C878C780](v188, -1, -1);
                    MEMORY[0x1C878C780](v137, -1, -1);

                    sub_1C51ACB08(v145, v151);
                    swift_bridgeObjectRelease();
                    uint64_t result = v145;
                    break;
                  case 3uLL:
                    uint64_t v145 = v173;
                    uint64_t v146 = v172;
                    sub_1C51ACB08(v173, v7);
                    uint64_t v147 = 0;
                    goto LABEL_191;
                  default:
                    uint64_t v145 = v173;
                    uint64_t v146 = v172;
                    sub_1C51ACB08(v173, v7);
                    uint64_t v147 = BYTE6(v7);
                    goto LABEL_191;
                }
              }
              else
              {
                sub_1C51ACB08(v135, v7);
                sub_1C51ACB08(v135, v7);
                sub_1C518D144(a1, a2);
                sub_1C51ACB08(v135, v7);
                sub_1C518D144(a1, a2);
                sub_1C51ACB08(v135, v7);
                sub_1C51ACB08(v135, v7);

                swift_bridgeObjectRelease();
                return v135;
              }
              return result;
            }
LABEL_222:
            swift_once();
            goto LABEL_173;
          }
          break;
      }
    }
    __break(1u);
LABEL_193:
    __break(1u);
LABEL_194:
    __break(1u);
LABEL_195:
    __break(1u);
LABEL_196:
    __break(1u);
LABEL_197:
    __break(1u);
LABEL_198:
    __break(1u);
LABEL_199:
    __break(1u);
LABEL_200:
    __break(1u);
LABEL_201:
    __break(1u);
LABEL_202:
    __break(1u);
LABEL_203:
    __break(1u);
LABEL_204:
    __break(1u);
LABEL_205:
    __break(1u);
LABEL_206:
    __break(1u);
LABEL_207:
    __break(1u);
LABEL_208:
    swift_bridgeObjectRetain_n();
    uint64_t v6 = sub_1C51C6958();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v132 = 0;
LABEL_210:
  uint64_t v174 = v132;
  if (qword_1EA3D1268 != -1) {
    swift_once();
  }
  uint64_t v154 = sub_1C51C5B28();
  __swift_project_value_buffer(v154, (uint64_t)qword_1EA3D15E0);
  long long v155 = sub_1C51C5B08();
  os_log_type_t v156 = sub_1C51C6738();
  if (os_log_type_enabled(v155, v156))
  {
    long long v157 = (uint8_t *)swift_slowAlloc();
    uint64_t v158 = swift_slowAlloc();
    uint64_t v192 = v158;
    *(_DWORD *)long long v157 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v159 = sub_1C51C6578();
    unint64_t v161 = v160;
    swift_bridgeObjectRelease();
    v189[0] = sub_1C51A3538(v159, v161, &v192);
    sub_1C51C6818();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C5188000, v155, v156, "Did not compress data, no results were better than original size (all results: %s)", v157, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C878C780](v158, -1, -1);
    MEMORY[0x1C878C780](v157, -1, -1);
  }

  swift_bridgeObjectRelease();
  return v174;
}

MessagesBlastDoorSupport::LiteMessageCompressor sub_1C51B5434()
{
  return LiteMessageCompressor.init()();
}

uint64_t sub_1C51B5440@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, long long *a6@<X8>)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = a1[1];
  switch(v7 >> 62)
  {
    case 1uLL:
      *(void *)&long long v33 = *a1;
      *((void *)&v33 + 1) = v7 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain();
      sub_1C51B56E8((int *)&v33, a2, a3, a4, a5, a6);
      uint64_t result = swift_release();
      uint64_t v19 = *((void *)&v33 + 1) | 0x4000000000000000;
      *a1 = v33;
      a1[1] = v19;
      return result;
    case 2uLL:
      *(void *)&long long v33 = *a1;
      *((void *)&v33 + 1) = v7 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1C51C5938();
      uint64_t v20 = *((void *)&v33 + 1);
      uint64_t v21 = *(void *)(v33 + 16);
      uint64_t v32 = *(void *)(v33 + 24);
      uint64_t v22 = sub_1C51C5828();
      if (!v22)
      {
        __break(1u);
        JUMPOUT(0x1C51B56D8);
      }
      uint64_t v23 = v22;
      uint64_t v24 = sub_1C51C5858();
      uint64_t v25 = v21 - v24;
      if (__OFSUB__(v21, v24))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v26 = __OFSUB__(v32, v21);
      uint64_t v27 = v32 - v21;
      if (v26) {
        goto LABEL_14;
      }
      uint64_t v28 = sub_1C51C5848();
      if (v28 >= v27) {
        uint64_t v29 = v27;
      }
      else {
        uint64_t v29 = v28;
      }
      sub_1C51B3704(v23 + v25, v23 + v25 + v29, a2, a3, a4, a5, a6);
      uint64_t result = swift_release();
      *a1 = v33;
      a1[1] = v20 | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&v33 + 7) = 0;
      *(void *)&long long v33 = 0;
      sub_1C51B3704((uint64_t)&v33, (uint64_t)&v33, a2, a3, a4, a5, a6);
      return swift_release();
    default:
      *(void *)&long long v33 = *a1;
      WORD4(v33) = v7;
      BYTE10(v33) = BYTE2(v7);
      BYTE11(v33) = BYTE3(v7);
      BYTE12(v33) = BYTE4(v7);
      BYTE13(v33) = BYTE5(v7);
      BYTE14(v33) = BYTE6(v7);
      sub_1C51B3704((uint64_t)&v33, (uint64_t)&v33 + BYTE6(v7), a2, a3, a4, a5, a6);
      uint64_t v13 = v33;
      uint64_t v14 = DWORD2(v33);
      uint64_t v15 = BYTE12(v33);
      uint64_t v16 = BYTE13(v33);
      uint64_t v17 = BYTE14(v33);
      uint64_t result = swift_release();
      *a1 = v13;
      a1[1] = v14 | (v15 << 32) | (v16 << 40) | (v17 << 48);
      return result;
  }
}

uint64_t sub_1C51B56E8@<X0>(int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X4>, long long *a6@<X8>)
{
  uint64_t result = sub_1C51C5948();
  uint64_t v14 = *a1;
  uint64_t v13 = a1[1];
  if ((int)v13 < (int)v14)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v20 = a6;
  uint64_t v21 = a3;
  uint64_t result = sub_1C51C5828();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v15 = result;
  uint64_t result = sub_1C51C5858();
  uint64_t v16 = v14 - result;
  if (__OFSUB__(v14, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v17 = v13 - v14;
  uint64_t v18 = sub_1C51C5848();
  if (v18 >= v17) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  sub_1C51B3704(v15 + v16, v15 + v16 + v19, a2, v21, a4, a5, v20);
  return swift_release();
}

uint64_t sub_1C51B57CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, long long *a4@<X8>)
{
  uint64_t result = sub_1C51C5828();
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = sub_1C51C5858();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v12 = sub_1C51C5848();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v14 = v9 + v13;
  if (v9) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  sub_1C51B3620(v9, v15, a3, a4);
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1C51B58B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *sub_1C51B58F8(void *result, int __c)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = result[1];
  uint64_t v4 = result;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_1C51B5AEC((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1C51C5938();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_1C51C5828();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x1C51B5ADCLL);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_1C51C5858();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_1C51C5848();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = memset((void *)(v11 + v13), __c, v17);
      *uint64_t v4 = __b;
      v4[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      return result;
    default:
      uint64_t __b = *result;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      uint64_t result = memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *uint64_t v4 = v5;
      v4[1] = v6;
      return result;
  }
}

char *sub_1C51B5AEC(int *a1, int a2)
{
  uint64_t result = (char *)sub_1C51C5948();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)sub_1C51C5828();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = (char *)sub_1C51C5858();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_1C51C5848();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }

  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_1C51B5B80(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1600);
  uint64_t result = sub_1C51C6978();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    uint64_t v34 = v3;
    int64_t v8 = 0;
    int64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    uint64_t v33 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *int64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      uint64_t result = sub_1C51C6BC8();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

void *sub_1C51B5E28()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1600);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1C51C6968();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for LiteMessageCompressor()
{
  return &type metadata for LiteMessageCompressor;
}

uint64_t type metadata accessor for LiteMessageCompressor.Codec()
{
  return self;
}

unint64_t sub_1C51B5FEC()
{
  unint64_t result = qword_1EA3D1610;
  if (!qword_1EA3D1610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA3D1608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1610);
  }
  return result;
}

uint64_t sub_1C51B6058()
{
  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1C51B6068(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0470);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1C51B60C8@<X0>(void *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
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

uint64_t sub_1C51B6170(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1C51C5868();
      swift_allocObject();
      sub_1C51C5838();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1C51C5978();
        unint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t LiteTextParser.parse(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  v5[0] = a1;
  v5[1] = a2;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v5[2] = 0;
  v5[3] = v2;
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_1C51B8690((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t Array<A>.spansAsPlainText.getter(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  swift_bridgeObjectRetain();
  for (uint64_t i = 0; i != v1; ++i)
  {
    unint64_t v4 = *(void *)(a1 + 8 * i + 32);
    if (v4 >> 62)
    {
      if (v4 >> 62 != 1)
      {
        uint64_t v5 = *(void *)((v4 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
        swift_retain();
        Array<A>.spansAsPlainText.getter(v5);
        sub_1C51C6648();
        swift_release();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_retain();
      sub_1C51C6648();
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static LiteTextMarker.== infix(_:_:)()
{
  return 1;
}

uint64_t static LiteTextAttribute.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_1C51B6374(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (unint64_t *)(a1 + 32);
    unint64_t v4 = (unint64_t *)(a2 + 32);
    do
    {
      unint64_t v6 = *v3++;
      unint64_t v5 = v6;
      unint64_t v8 = *v4++;
      unint64_t v7 = v8;
      unint64_t v9 = v8 >> 62;
      if (v5 >> 62)
      {
        if (v5 >> 62 == 1)
        {
          if (v9 != 1) {
            return 0;
          }
        }
        else
        {
          if (v9 != 2) {
            return 0;
          }
          uint64_t v10 = *(void *)((v5 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
          uint64_t v11 = *(void *)((v7 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
          swift_retain_n();
          swift_retain_n();
          LOBYTE(v10) = sub_1C51B6374(v10, v11);
          swift_release_n();
          swift_release_n();
          if ((v10 & 1) == 0) {
            return 0;
          }
        }
      }
      else
      {
        if (v9) {
          return 0;
        }
        BOOL v12 = *(void *)(v5 + 16) == *(void *)(v7 + 16) && *(void *)(v5 + 24) == *(void *)(v7 + 24);
        if (!v12 && (sub_1C51C6B28() & 1) == 0) {
          return 0;
        }
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

BOOL sub_1C51B648C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1C51B64A4()
{
  if (*v0) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_1C51B64C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C51BA6C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C51B64E8(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1C51B64F4(uint64_t a1)
{
  unint64_t v2 = sub_1C51B93A0();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B6530(uint64_t a1)
{
  unint64_t v2 = sub_1C51B93A0();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C51B656C()
{
  uint64_t v1 = 0x72656B72616DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x7475626972747461;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7865546E69616C70;
  }
}

uint64_t sub_1C51B65D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1C51BA78C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C51B65FC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C51B6608(uint64_t a1)
{
  unint64_t v2 = sub_1C51B934C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B6644(uint64_t a1)
{
  unint64_t v2 = sub_1C51B934C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C51B6688()
{
  return 12383;
}

void sub_1C51B6698(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C51B66A4(uint64_t a1)
{
  unint64_t v2 = sub_1C51B949C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B66E0(uint64_t a1)
{
  unint64_t v2 = sub_1C51B949C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C51B671C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1C51C6B28();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C51B679C(uint64_t a1)
{
  unint64_t v2 = sub_1C51B9544();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B67D8(uint64_t a1)
{
  unint64_t v2 = sub_1C51B9544();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t LiteTextSpan.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1628);
  uint64_t v25 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  BOOL v30 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1630);
  uint64_t v28 = *(void *)(v5 - 8);
  uint64_t v29 = v5;
  MEMORY[0x1F4188790](v5);
  char v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1638);
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1640);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B934C();
  sub_1C51C6C48();
  if (v15 >> 62)
  {
    uint64_t v16 = v32;
    if (v15 >> 62 == 1)
    {
      char v35 = 1;
      sub_1C51B949C();
      sub_1C51C6A78();
      sub_1C51B94F0();
      uint64_t v17 = v29;
      sub_1C51C6AF8();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v17);
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    else
    {
      uint64_t v20 = *(void *)((v15 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      char v38 = 2;
      sub_1C51B93A0();
      unint64_t v21 = v30;
      uint64_t v22 = v11;
      sub_1C51C6A78();
      char v37 = 0;
      sub_1C51B93F4();
      uint64_t v23 = v31;
      sub_1C51C6AF8();
      if (!v16)
      {
        uint64_t v33 = v20;
        char v36 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1660);
        sub_1C51B9624(&qword_1EA3D1668, (void (*)(void))sub_1C51B9448);
        sub_1C51C6AF8();
      }
      (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v23);
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v22);
    }
  }
  else
  {
    char v34 = 0;
    sub_1C51B9544();
    sub_1C51C6A78();
    uint64_t v19 = v27;
    sub_1C51C6AD8();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t LiteTextSpan.init(from:)@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  char v37 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1690);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  uint64_t v41 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v42 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1698);
  uint64_t v38 = *(void *)(v43 - 8);
  MEMORY[0x1F4188790](v43);
  char v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16A0);
  uint64_t v39 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16A8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  unint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  uint64_t v44 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_1C51B934C();
  uint64_t v16 = v45;
  sub_1C51C6C28();
  if (!v16)
  {
    uint64_t v17 = v43;
    uint64_t v45 = v12;
    uint64_t v18 = sub_1C51C6A68();
    if (*(void *)(v18 + 16) == 1)
    {
      if (*(unsigned char *)(v18 + 32))
      {
        if (*(unsigned char *)(v18 + 32) == 1)
        {
          char v47 = 1;
          sub_1C51B949C();
          uint64_t v19 = v7;
          sub_1C51C69B8();
          uint64_t v20 = swift_allocEmptyBox();
          sub_1C51B96E8();
          sub_1C51C6A48();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v19, v17);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v11);
          uint64_t v21 = (uint64_t)v44;
          unint64_t v22 = v20 | 0x4000000000000000;
LABEL_12:
          *char v37 = v22;
          return __swift_destroy_boxed_opaque_existential_0(v21);
        }
        char v50 = 2;
        sub_1C51B93A0();
        sub_1C51C69B8();
        uint64_t v29 = swift_allocObject();
        char v49 = 0;
        sub_1C51B95D0();
        uint64_t v30 = v40;
        sub_1C51C6A48();
        uint64_t v43 = v29;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1660);
        char v48 = 1;
        sub_1C51B9624(&qword_1EA3D16C0, (void (*)(void))sub_1C51B9694);
        char v34 = v42;
        sub_1C51C6A48();
        uint64_t v35 = v45;
        (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v30);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v11);
        unint64_t v22 = v43 | 0x8000000000000000;
      }
      else
      {
        char v46 = 0;
        sub_1C51B9544();
        uint64_t v26 = v10;
        sub_1C51C69B8();
        unint64_t v22 = swift_allocObject();
        uint64_t v27 = v8;
        uint64_t v31 = sub_1C51C6A28();
        uint64_t v33 = v32;
        (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v27);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v11);
        *(void *)(v22 + 16) = v31;
        *(void *)(v22 + 24) = v33;
      }
      uint64_t v21 = (uint64_t)v44;
      goto LABEL_12;
    }
    uint64_t v23 = sub_1C51C68B8();
    swift_allocError();
    uint64_t v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16B0);
    *uint64_t v25 = &type metadata for LiteTextSpan;
    sub_1C51C69C8();
    sub_1C51C68A8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x1E4FBBA70], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v11);
  }
  uint64_t v21 = (uint64_t)v44;
  return __swift_destroy_boxed_opaque_existential_0(v21);
}

uint64_t sub_1C51B7458@<X0>(void *a1@<X0>, unint64_t *a2@<X8>)
{
  return LiteTextSpan.init(from:)(a1, a2);
}

uint64_t sub_1C51B7470(void *a1)
{
  return LiteTextSpan.encode(to:)(a1);
}

uint64_t sub_1C51B7488()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_1C51B74A4(uint64_t a1)
{
  unint64_t v2 = sub_1C51B9774();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B74E0(uint64_t a1)
{
  unint64_t v2 = sub_1C51B9774();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C51B751C()
{
  return 0;
}

uint64_t sub_1C51B7528(uint64_t a1)
{
  unint64_t v2 = sub_1C51B97C8();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B7564(uint64_t a1)
{
  unint64_t v2 = sub_1C51B97C8();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t LiteTextAttribute.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16E0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B9774();
  sub_1C51C6C48();
  sub_1C51B97C8();
  sub_1C51C6A78();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LiteTextAttribute.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16F8);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1700);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B9774();
  sub_1C51C6C28();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_1C51C6A68() + 16) == 1)
    {
      sub_1C51B97C8();
      sub_1C51C69B8();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_1C51C68B8();
      swift_allocError();
      uint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16B0);
      *uint64_t v13 = &type metadata for LiteTextAttribute;
      sub_1C51C69C8();
      sub_1C51C68A8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x1E4FBBA70], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1C51B7A5C(void *a1)
{
  return LiteTextAttribute.init(from:)(a1);
}

uint64_t sub_1C51B7A74(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16D8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16E0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B9774();
  sub_1C51C6C48();
  sub_1C51B97C8();
  sub_1C51C6A78();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LiteTextMarker.hash(into:)()
{
  return sub_1C51C6BE8();
}

uint64_t sub_1C51B7C6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_1C51C6B28();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1C51B7D04(uint64_t a1)
{
  unint64_t v2 = sub_1C51B981C();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B7D40(uint64_t a1)
{
  unint64_t v2 = sub_1C51B981C();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1C51B7D7C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1C51B7DAC(uint64_t a1)
{
  unint64_t v2 = sub_1C51B9870();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51B7DE8(uint64_t a1)
{
  unint64_t v2 = sub_1C51B9870();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t LiteTextMarker.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1708);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1710);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B981C();
  sub_1C51C6C48();
  sub_1C51B9870();
  sub_1C51C6A78();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t LiteTextMarker.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1728);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1730);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B981C();
  sub_1C51C6C28();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_1C51C6A68() + 16) == 1)
    {
      sub_1C51B9870();
      sub_1C51C69B8();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_1C51C68B8();
      swift_allocError();
      uint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D16B0);
      *uint64_t v13 = &type metadata for LiteTextMarker;
      sub_1C51C69C8();
      sub_1C51C68A8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x1E4FBBA70], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_1C51B82E0(void *a1)
{
  return LiteTextMarker.init(from:)(a1);
}

uint64_t sub_1C51B82F8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1708);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1710);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51B981C();
  sub_1C51C6C48();
  sub_1C51B9870();
  sub_1C51C6A78();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t static LiteControlCharacters.controlSequenceStart.getter()
{
  return 1;
}

uint64_t static LiteControlCharacters.controlSequenceSpanStart.getter()
{
  return 2;
}

uint64_t static LiteControlCharacters.controlSequenceEnd.getter()
{
  return 3;
}

uint64_t static LiteControlCharacters.messageSeparator.getter()
{
  return 25;
}

void sub_1C51B84F8()
{
  off_1EA3D1620 = &unk_1F20AED90;
}

uint64_t static LiteControlCharacters.all.getter()
{
  if (qword_1EA3D1280 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static LiteControlCharacters.all.setter(void *a1)
{
  if (qword_1EA3D1280 != -1) {
    swift_once();
  }
  swift_beginAccess();
  off_1EA3D1620 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static LiteControlCharacters.all.modify())()
{
  if (qword_1EA3D1280 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1C51B8690(uint64_t a1)
{
  uint64_t v55 = 0;
  unint64_t v56 = 0xE000000000000000;
  uint64_t v54 = (void *)MEMORY[0x1E4FBC860];
  swift_beginAccess();
  uint64_t v2 = sub_1C51C6658();
  if (!v3)
  {
LABEL_93:
    unint64_t v51 = 0xF000000000000007;
    sub_1C51B8E40((uint64_t *)&v51, &v55, &v54);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    return (uint64_t)v54;
  }
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  while (v4 == 1 && v5 == 0xE100000000000000 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    unint64_t v8 = *(void *)(a1 + 8);
    unint64_t v51 = *(void *)a1;
    unint64_t v52 = v8;
    long long v53 = *(_OWORD *)(a1 + 16);
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1C51C6658();
    uint64_t v5 = v9;
    swift_bridgeObjectRelease();
    if (v5)
    {
      if (qword_1EA3D1280 != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v10 = off_1EA3D1620;
      uint64_t v11 = *((void *)off_1EA3D1620 + 2);
      if (v11)
      {
        BOOL v12 = *((void *)off_1EA3D1620 + 4) == v4 && v5 == *((void *)off_1EA3D1620 + 5);
        if (v12 || (sub_1C51C6B28() & 1) != 0)
        {
LABEL_19:
          sub_1C51C6658();
          swift_bridgeObjectRelease();
          goto LABEL_20;
        }
        if (v11 != 1)
        {
          if (v10[6] == v4 && v5 == v10[7]) {
            goto LABEL_19;
          }
          uint64_t result = sub_1C51C6B28();
          if (result) {
            goto LABEL_19;
          }
          if (v11 != 2)
          {
            uint64_t v23 = v10 + 9;
            uint64_t v24 = 2;
            while (1)
            {
              uint64_t v25 = v24 + 1;
              if (__OFADD__(v24, 1)) {
                break;
              }
              if (*(v23 - 1) == v4 && v5 == *v23) {
                goto LABEL_19;
              }
              uint64_t result = sub_1C51C6B28();
              if (result) {
                goto LABEL_19;
              }
              v23 += 2;
              ++v24;
              if (v25 == v11) {
                goto LABEL_3;
              }
            }
            __break(1u);
            goto LABEL_95;
          }
        }
      }
LABEL_3:
      swift_bridgeObjectRelease();
    }
    sub_1C51B9038(a1, &v51);
    unint64_t v6 = v51;
    unint64_t v50 = v51;
    sub_1C51B8E40((uint64_t *)&v50, &v55, &v54);
LABEL_5:
    sub_1C51BA90C(v6);
LABEL_6:
    uint64_t v4 = sub_1C51C6658();
    uint64_t v5 = v7;
    if (!v7) {
      goto LABEL_93;
    }
  }
  if (v4 == 2 && v5 == 0xE100000000000000 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_1C51C6658();
    if (v14)
    {
      uint64_t v15 = v13;
      uint64_t v16 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D17F8);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_1C51C7CA0;
      *(void *)(v17 + 32) = v15;
      *(void *)(v17 + 40) = v16;
      unint64_t v51 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1800);
      sub_1C51BA924();
      uint64_t v18 = sub_1C51C6678();
      uint64_t v20 = HIBYTE(v19) & 0xF;
      unint64_t v51 = v18;
      unint64_t v52 = v19;
      if ((v19 & 0x2000000000000000) == 0) {
        uint64_t v20 = v18 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)&long long v53 = 0;
      *((void *)&v53 + 1) = v20;
      swift_bridgeObjectRetain();
      sub_1C51C6658();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = sub_1C51B8690(a1);
      unint64_t v6 = v21 | 0x8000000000000000;
    }
    else
    {
      unint64_t v6 = 0xF000000000000007;
    }
    uint64_t v28 = v55;
    unint64_t v27 = v56;
    uint64_t v29 = HIBYTE(v56) & 0xF;
    if ((v56 & 0x2000000000000000) == 0) {
      uint64_t v29 = v55 & 0xFFFFFFFFFFFFLL;
    }
    if (v29)
    {
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v28;
      *(void *)(v30 + 24) = v27;
      swift_beginAccess();
      uint64_t v31 = v54;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v31 = sub_1C51AEADC(0, v31[2] + 1, 1, v31);
      }
      unint64_t v33 = v31[2];
      unint64_t v32 = v31[3];
      if (v33 >= v32 >> 1) {
        uint64_t v31 = sub_1C51AEADC((void *)(v32 > 1), v33 + 1, 1, v31);
      }
      v31[2] = v33 + 1;
      v31[v33 + 4] = v30;
      uint64_t v54 = v31;
      swift_endAccess();
      uint64_t v55 = 0;
      unint64_t v56 = 0xE000000000000000;
      swift_bridgeObjectRelease();
    }
    if ((~v6 & 0xF000000000000007) == 0) {
      goto LABEL_6;
    }
    swift_beginAccess();
    char v34 = v54;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v34 = sub_1C51AEADC(0, v34[2] + 1, 1, v34);
    }
    unint64_t v36 = v34[2];
    unint64_t v35 = v34[3];
    if (v36 >= v35 >> 1) {
      char v34 = sub_1C51AEADC((void *)(v35 > 1), v36 + 1, 1, v34);
    }
    void v34[2] = v36 + 1;
    v34[v36 + 4] = v6;
    uint64_t v54 = v34;
    swift_endAccess();
    goto LABEL_5;
  }
  if (v4 == 3 && v5 == 0xE100000000000000 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_93;
  }
  if (v4 == 25 && v5 == 0xE100000000000000 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_1C51C6648();
    swift_endAccess();
    uint64_t v37 = v55;
    unint64_t v38 = v56;
    uint64_t v39 = HIBYTE(v56) & 0xF;
    if ((v56 & 0x2000000000000000) == 0) {
      uint64_t v39 = v55 & 0xFFFFFFFFFFFFLL;
    }
    if (!v39) {
      goto LABEL_6;
    }
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v37;
    *(void *)(v40 + 24) = v38;
    swift_beginAccess();
    uint64_t v41 = v54;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v41 = sub_1C51AEADC(0, v41[2] + 1, 1, v41);
    }
    unint64_t v43 = v41[2];
    unint64_t v42 = v41[3];
    if (v43 >= v42 >> 1) {
      uint64_t v41 = sub_1C51AEADC((void *)(v42 > 1), v43 + 1, 1, v41);
    }
    v41[2] = v43 + 1;
    v41[v43 + 4] = v40;
    uint64_t v54 = v41;
    swift_endAccess();
    uint64_t v55 = 0;
    unint64_t v56 = 0xE000000000000000;
    goto LABEL_21;
  }
  if (qword_1EA3D1280 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v44 = off_1EA3D1620;
  uint64_t v45 = *((void *)off_1EA3D1620 + 2);
  if (!v45) {
    goto LABEL_20;
  }
  if (*((void *)off_1EA3D1620 + 4) == v4 && v5 == *((void *)off_1EA3D1620 + 5) || (sub_1C51C6B28() & 1) != 0) {
    goto LABEL_21;
  }
  if (v45 == 1) {
    goto LABEL_20;
  }
  if (v44[6] == v4 && v5 == v44[7]) {
    goto LABEL_21;
  }
  uint64_t result = sub_1C51C6B28();
  if (result) {
    goto LABEL_21;
  }
  if (v45 == 2)
  {
LABEL_20:
    swift_beginAccess();
    MEMORY[0x1C878B990](v4, v5);
    swift_endAccess();
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  char v46 = v44 + 9;
  uint64_t v47 = 2;
  while (1)
  {
    uint64_t v48 = v47 + 1;
    if (__OFADD__(v47, 1)) {
      break;
    }
    if (*(v46 - 1) == v4 && v5 == *v46) {
      goto LABEL_21;
    }
    uint64_t result = sub_1C51C6B28();
    if (result) {
      goto LABEL_21;
    }
    v46 += 2;
    ++v47;
    if (v48 == v45) {
      goto LABEL_20;
    }
  }
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_1C51B8E40(uint64_t *a1, uint64_t *a2, void **a3)
{
  uint64_t v5 = *a1;
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *a2;
  unint64_t v8 = a2[1];
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = *a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v7;
    *(void *)(v10 + 24) = v8;
    swift_beginAccess();
    uint64_t v11 = *a3;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v11 = sub_1C51AEADC(0, v11[2] + 1, 1, v11);
      *a3 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      uint64_t v11 = sub_1C51AEADC((void *)(v13 > 1), v14 + 1, 1, v11);
      *a3 = v11;
    }
    v11[2] = v14 + 1;
    v11[v14 + 4] = v10;
    swift_endAccess();
    swift_beginAccess();
    *a2 = 0;
    a2[1] = 0xE000000000000000;
    uint64_t result = swift_bridgeObjectRelease();
  }
  if ((~v5 & 0xF000000000000007) != 0)
  {
    swift_beginAccess();
    uint64_t v15 = *a3;
    swift_retain();
    char v16 = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v15;
    if ((v16 & 1) == 0)
    {
      uint64_t v15 = sub_1C51AEADC(0, v15[2] + 1, 1, v15);
      *a3 = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      uint64_t v15 = sub_1C51AEADC((void *)(v17 > 1), v18 + 1, 1, v15);
      *a3 = v15;
    }
    v15[2] = v18 + 1;
    v15[v18 + 4] = v5;
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1C51B9038@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1C51C6658();
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    uint64_t v8 = 0;
    do
    {
      if (v6 == 1 && v7 == 0xE100000000000000 || (sub_1C51C6B28() & 1) != 0)
      {
        BOOL v11 = __OFADD__(v8++, 1);
        if (v11)
        {
          __break(1u);
          break;
        }
      }
      else if (v6 == 2 && v7 == 0xE100000000000000 || (uint64_t result = sub_1C51C6B28(), (result & 1) != 0))
      {
        if (!v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1C51C6658();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v13 = swift_allocObject();
          uint64_t result = sub_1C51B8690(a1);
          *(void *)(v13 + 16) = result;
          unint64_t v12 = v13 | 0x8000000000000000;
          goto LABEL_23;
        }
      }
      else if (v6 == 3 && v7 == 0xE100000000000000 || (uint64_t result = sub_1C51C6B28(), (result & 1) != 0))
      {
        if (!v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1C51C6658();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_allocEmptyBox();
          unint64_t v12 = result | 0x4000000000000000;
          goto LABEL_23;
        }
        BOOL v11 = __OFSUB__(v8--, 1);
        if (v11)
        {
          __break(1u);
          return result;
        }
      }
      MEMORY[0x1C878B990](v6, v7);
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_1C51C6658();
      uint64_t v7 = v9;
    }
    while (v9);
  }
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v12 = 0xF000000000000007;
LABEL_23:
  *a2 = v12;
  return result;
}

uint64_t _s24MessagesBlastDoorSupport12LiteTextSpanO2eeoiySbAC_ACtFZ_0(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *a2;
  unint64_t v4 = (unint64_t)*a1 >> 62;
  if (v4)
  {
    if (v4 == 1)
    {
      if (v3 >> 62 == 1) {
        return 1;
      }
    }
    else if (v3 >> 62 == 2)
    {
      uint64_t v7 = *(void *)((v2 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v8 = *(void *)((v3 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      swift_retain();
      swift_retain();
      LOBYTE(v7) = sub_1C51B6374(v7, v8);
      swift_release();
      swift_release();
      return v7 & 1;
    }
    return 0;
  }
  if (v3 >> 62) {
    return 0;
  }
  if (*(void *)(v2 + 16) == *(void *)(v3 + 16) && *(void *)(v2 + 24) == *(void *)(v3 + 24)) {
    return 1;
  }

  return sub_1C51C6B28();
}

unint64_t sub_1C51B934C()
{
  unint64_t result = qword_1EA3D1648;
  if (!qword_1EA3D1648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1648);
  }
  return result;
}

unint64_t sub_1C51B93A0()
{
  unint64_t result = qword_1EA3D1650;
  if (!qword_1EA3D1650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1650);
  }
  return result;
}

unint64_t sub_1C51B93F4()
{
  unint64_t result = qword_1EA3D1658;
  if (!qword_1EA3D1658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1658);
  }
  return result;
}

unint64_t sub_1C51B9448()
{
  unint64_t result = qword_1EA3D1670;
  if (!qword_1EA3D1670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1670);
  }
  return result;
}

unint64_t sub_1C51B949C()
{
  unint64_t result = qword_1EA3D1678;
  if (!qword_1EA3D1678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1678);
  }
  return result;
}

unint64_t sub_1C51B94F0()
{
  unint64_t result = qword_1EA3D1680;
  if (!qword_1EA3D1680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1680);
  }
  return result;
}

unint64_t sub_1C51B9544()
{
  unint64_t result = qword_1EA3D1688;
  if (!qword_1EA3D1688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1688);
  }
  return result;
}

uint64_t sub_1C51B9598()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

unint64_t sub_1C51B95D0()
{
  unint64_t result = qword_1EA3D16B8;
  if (!qword_1EA3D16B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D16B8);
  }
  return result;
}

uint64_t sub_1C51B9624(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA3D1660);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C51B9694()
{
  unint64_t result = qword_1EA3D16C8;
  if (!qword_1EA3D16C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D16C8);
  }
  return result;
}

unint64_t sub_1C51B96E8()
{
  unint64_t result = qword_1EA3D16D0;
  if (!qword_1EA3D16D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D16D0);
  }
  return result;
}

uint64_t sub_1C51B973C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_1C51B9774()
{
  unint64_t result = qword_1EA3D16E8;
  if (!qword_1EA3D16E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D16E8);
  }
  return result;
}

unint64_t sub_1C51B97C8()
{
  unint64_t result = qword_1EA3D16F0;
  if (!qword_1EA3D16F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D16F0);
  }
  return result;
}

unint64_t sub_1C51B981C()
{
  unint64_t result = qword_1EA3D1718;
  if (!qword_1EA3D1718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1718);
  }
  return result;
}

unint64_t sub_1C51B9870()
{
  unint64_t result = qword_1EA3D1720;
  if (!qword_1EA3D1720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1720);
  }
  return result;
}

unint64_t sub_1C51B98C8()
{
  unint64_t result = qword_1EA3D1738;
  if (!qword_1EA3D1738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1738);
  }
  return result;
}

unint64_t sub_1C51B9920()
{
  unint64_t result = qword_1EA3D1740;
  if (!qword_1EA3D1740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1740);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for LiteTextSpan(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for LiteTextSpan()
{
  return swift_release();
}

void *assignWithCopy for LiteTextSpan(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for LiteTextSpan(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LiteTextSpan(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for LiteTextSpan(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1C51B9AE8(void *a1)
{
  return *a1 >> 62;
}

void *sub_1C51B9AF4(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t *sub_1C51B9B04(uint64_t *result, uint64_t a2)
{
  *unint64_t result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan()
{
  return &type metadata for LiteTextSpan;
}

ValueMetadata *type metadata accessor for LiteTextAttribute()
{
  return &type metadata for LiteTextAttribute;
}

ValueMetadata *type metadata accessor for LiteTextMarker()
{
  return &type metadata for LiteTextMarker;
}

ValueMetadata *type metadata accessor for LiteControlCharacters()
{
  return &type metadata for LiteControlCharacters;
}

ValueMetadata *type metadata accessor for LiteTextParser()
{
  return &type metadata for LiteTextParser;
}

ValueMetadata *type metadata accessor for LiteTextMarker.CodingKeys()
{
  return &type metadata for LiteTextMarker.CodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextMarker.UnknownCodingKeys()
{
  return &type metadata for LiteTextMarker.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextAttribute.CodingKeys()
{
  return &type metadata for LiteTextAttribute.CodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextAttribute.UnknownCodingKeys()
{
  return &type metadata for LiteTextAttribute.UnknownCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for LiteTextSpan.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1C51B9C7CLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan.CodingKeys()
{
  return &type metadata for LiteTextSpan.CodingKeys;
}

ValueMetadata *type metadata accessor for LiteTextSpan.PlainTextCodingKeys()
{
  return &type metadata for LiteTextSpan.PlainTextCodingKeys;
}

unsigned char *_s24MessagesBlastDoorSupport14LiteTextMarkerOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1C51B9D60);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan.MarkerCodingKeys()
{
  return &type metadata for LiteTextSpan.MarkerCodingKeys;
}

uint64_t getEnumTagSinglePayload for LiteTextSpan.AttributedSpansCodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LiteTextSpan.AttributedSpansCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C51B9EF4);
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

unsigned char *sub_1C51B9F1C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LiteTextSpan.AttributedSpansCodingKeys()
{
  return &type metadata for LiteTextSpan.AttributedSpansCodingKeys;
}

unint64_t sub_1C51B9F3C()
{
  unint64_t result = qword_1EA3D1748;
  if (!qword_1EA3D1748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1748);
  }
  return result;
}

unint64_t sub_1C51B9F94()
{
  unint64_t result = qword_1EA3D1750;
  if (!qword_1EA3D1750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1750);
  }
  return result;
}

unint64_t sub_1C51B9FEC()
{
  unint64_t result = qword_1EA3D1758;
  if (!qword_1EA3D1758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1758);
  }
  return result;
}

unint64_t sub_1C51BA044()
{
  unint64_t result = qword_1EA3D1760;
  if (!qword_1EA3D1760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1760);
  }
  return result;
}

unint64_t sub_1C51BA09C()
{
  unint64_t result = qword_1EA3D1768;
  if (!qword_1EA3D1768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1768);
  }
  return result;
}

unint64_t sub_1C51BA0F4()
{
  unint64_t result = qword_1EA3D1770;
  if (!qword_1EA3D1770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1770);
  }
  return result;
}

unint64_t sub_1C51BA14C()
{
  unint64_t result = qword_1EA3D1778;
  if (!qword_1EA3D1778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1778);
  }
  return result;
}

unint64_t sub_1C51BA1A4()
{
  unint64_t result = qword_1EA3D1780;
  if (!qword_1EA3D1780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1780);
  }
  return result;
}

unint64_t sub_1C51BA1FC()
{
  unint64_t result = qword_1EA3D1788;
  if (!qword_1EA3D1788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1788);
  }
  return result;
}

unint64_t sub_1C51BA254()
{
  unint64_t result = qword_1EA3D1790;
  if (!qword_1EA3D1790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1790);
  }
  return result;
}

unint64_t sub_1C51BA2AC()
{
  unint64_t result = qword_1EA3D1798;
  if (!qword_1EA3D1798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1798);
  }
  return result;
}

unint64_t sub_1C51BA304()
{
  unint64_t result = qword_1EA3D17A0;
  if (!qword_1EA3D17A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17A0);
  }
  return result;
}

unint64_t sub_1C51BA35C()
{
  unint64_t result = qword_1EA3D17A8;
  if (!qword_1EA3D17A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17A8);
  }
  return result;
}

unint64_t sub_1C51BA3B4()
{
  unint64_t result = qword_1EA3D17B0;
  if (!qword_1EA3D17B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17B0);
  }
  return result;
}

unint64_t sub_1C51BA40C()
{
  unint64_t result = qword_1EA3D17B8;
  if (!qword_1EA3D17B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17B8);
  }
  return result;
}

unint64_t sub_1C51BA464()
{
  unint64_t result = qword_1EA3D17C0;
  if (!qword_1EA3D17C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17C0);
  }
  return result;
}

unint64_t sub_1C51BA4BC()
{
  unint64_t result = qword_1EA3D17C8;
  if (!qword_1EA3D17C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17C8);
  }
  return result;
}

unint64_t sub_1C51BA514()
{
  unint64_t result = qword_1EA3D17D0;
  if (!qword_1EA3D17D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17D0);
  }
  return result;
}

unint64_t sub_1C51BA56C()
{
  unint64_t result = qword_1EA3D17D8;
  if (!qword_1EA3D17D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17D8);
  }
  return result;
}

unint64_t sub_1C51BA5C4()
{
  unint64_t result = qword_1EA3D17E0;
  if (!qword_1EA3D17E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17E0);
  }
  return result;
}

unint64_t sub_1C51BA61C()
{
  unint64_t result = qword_1EA3D17E8;
  if (!qword_1EA3D17E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17E8);
  }
  return result;
}

unint64_t sub_1C51BA674()
{
  unint64_t result = qword_1EA3D17F0;
  if (!qword_1EA3D17F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D17F0);
  }
  return result;
}

uint64_t sub_1C51BA6C8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_1C51C6B28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1C51BA78C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7865546E69616C70 && a2 == 0xE900000000000074;
  if (v2 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x72656B72616DLL && a2 == 0xE600000000000000 || (sub_1C51C6B28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEF736E6170536465)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_1C51C6B28();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_1C51BA90C(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0) {
    return swift_release();
  }
  return result;
}

unint64_t sub_1C51BA924()
{
  unint64_t result = qword_1EA3D1808;
  if (!qword_1EA3D1808)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA3D1800);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1808);
  }
  return result;
}

uint64_t MessageType.init(rawValue:)(unsigned __int8 a1)
{
  return sub_1C51BAB20(a1) & 0x1FF;
}

uint64_t sub_1C51BA9BC()
{
  return sub_1C51C6BF8();
}

uint64_t sub_1C51BA9EC@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1C51BAB20(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

void sub_1C51BAA20(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t PreviewType.init(rawValue:)(unsigned __int8 a1)
{
  unsigned __int8 v1 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unsigned __int8 v1 = a1;
    }
    else {
      unsigned __int8 v1 = 0;
    }
    int v2 = a1 != 1;
  }
  else
  {
    int v2 = 0;
  }
  return v1 | (v2 << 8);
}

uint64_t sub_1C51BAA64()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51BAAAC()
{
  return sub_1C51C6C08();
}

char *sub_1C51BAAF0@<X0>(char *result@<X0>, char *a2@<X8>)
{
  int v2 = *result;
  if (*result) {
    char v3 = 0;
  }
  else {
    char v3 = *result;
  }
  BOOL v4 = v2 != 0;
  BOOL v5 = v2 == 1;
  if (v2 == 1) {
    char v6 = 1;
  }
  else {
    char v6 = v3;
  }
  BOOL v7 = !v5 && v4;
  *a2 = v6;
  a2[1] = v7;
  return result;
}

uint64_t sub_1C51BAB20(unsigned __int8 a1)
{
  int v1 = 0;
  switch(a1)
  {
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Fu:
    case 0x70u:
    case 0x71u:
    case 0x74u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x83u:
    case 0x86u:
    case 0x87u:
    case 0x8Bu:
    case 0xAAu:
    case 0xB4u:
    case 0xB5u:
    case 0xBEu:
    case 0xC3u:
    case 0xC4u:
      return a1 | (v1 << 8);
    default:
      a1 = 0;
      int v1 = 1;
      break;
  }
  return a1 | (v1 << 8);
}

unint64_t sub_1C51BACFC()
{
  unint64_t result = qword_1EA3D1810;
  if (!qword_1EA3D1810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1810);
  }
  return result;
}

unint64_t sub_1C51BAD54()
{
  unint64_t result = qword_1EA3D1818;
  if (!qword_1EA3D1818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1818);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

ValueMetadata *type metadata accessor for PreviewType()
{
  return &type metadata for PreviewType;
}

uint64_t TopLevelDictionary.incomingPushPayload.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C51BB8AC(v1, a1, (uint64_t (*)(void))type metadata accessor for IncomingPushPayload);
}

uint64_t TopLevelDictionary.incomingPushPayload.setter(uint64_t a1)
{
  return sub_1C51BAE10(a1, v1);
}

uint64_t sub_1C51BAE10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IncomingPushPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TopLevelDictionary.incomingPushPayload.modify())()
{
  return CGSizeMake;
}

uint64_t TopLevelDictionary.decryptedData.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 20);
  uint64_t v2 = *(void *)v1;
  sub_1C51A75CC(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for TopLevelDictionary()
{
  uint64_t result = qword_1EA3D11D0;
  if (!qword_1EA3D11D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t TopLevelDictionary.decryptedData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for TopLevelDictionary() + 20);
  uint64_t result = sub_1C51ACB08(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

double (*TopLevelDictionary.decryptedData.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t TopLevelDictionary.shouldShowPeerErrors.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 24));
}

uint64_t TopLevelDictionary.shouldShowPeerErrors.setter(char a1)
{
  uint64_t result = type metadata accessor for TopLevelDictionary();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

double (*TopLevelDictionary.shouldShowPeerErrors.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t TopLevelDictionary.encryptionTypeString.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TopLevelDictionary.encryptionTypeString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TopLevelDictionary() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

double (*TopLevelDictionary.encryptionTypeString.modify())(double, double)
{
  return CGSizeMake;
}

uint64_t TopLevelDictionary.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1820);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51BB338();
  sub_1C51C6C48();
  LOBYTE(v11) = 0;
  type metadata accessor for IncomingPushPayload();
  sub_1C51BB7B0(&qword_1EA3D1828);
  sub_1C51C6AF8();
  if (!v2)
  {
    long long v11 = *(_OWORD *)(v3 + *(int *)(type metadata accessor for TopLevelDictionary() + 20));
    v10[15] = 1;
    sub_1C51BB38C();
    sub_1C51C6AB8();
    LOBYTE(v11) = 2;
    sub_1C51C6A98();
    LOBYTE(v11) = 3;
    sub_1C51C6A88();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_1C51BB338()
{
  unint64_t result = qword_1EA3D11F0;
  if (!qword_1EA3D11F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D11F0);
  }
  return result;
}

unint64_t sub_1C51BB38C()
{
  unint64_t result = qword_1EA3D1830;
  if (!qword_1EA3D1830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1830);
  }
  return result;
}

uint64_t TopLevelDictionary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v4 = type metadata accessor for IncomingPushPayload();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1258);
  uint64_t v25 = *(void *)(v7 - 8);
  uint64_t v26 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TopLevelDictionary();
  long long v11 = (int *)MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = &v13[v11[7]];
  uint64_t v28 = a1;
  uint64_t v29 = v14;
  *(_OWORD *)unint64_t v14 = xmmword_1C51C82F0;
  uint64_t v15 = v11[8];
  v13[v15] = 2;
  char v16 = &v13[v11[9]];
  *(void *)char v16 = 0;
  *((void *)v16 + 1) = 0;
  unint64_t v27 = v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51BB338();
  sub_1C51C6C28();
  if (v2)
  {
    unint64_t v18 = v29;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
    sub_1C51ACB08(*(void *)v18, *((void *)v18 + 1));
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = v25;
    LOBYTE(v30) = 0;
    sub_1C51BB7B0(&qword_1EA3D1228);
    sub_1C51C6A48();
    sub_1C51BB7F4((uint64_t)v6, (uint64_t)v13);
    char v31 = 1;
    sub_1C51BB858();
    sub_1C51C6A08();
    *(_OWORD *)uint64_t v29 = v30;
    LOBYTE(v30) = 2;
    v13[v15] = sub_1C51C69E8();
    LOBYTE(v30) = 3;
    uint64_t v19 = sub_1C51C69D8();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v26);
    unint64_t v22 = (uint64_t *)v27;
    swift_bridgeObjectRelease();
    uint64_t *v22 = v19;
    v22[1] = v21;
    sub_1C51BB8AC((uint64_t)v13, v24, (uint64_t (*)(void))type metadata accessor for TopLevelDictionary);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
    return sub_1C51BB914((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for TopLevelDictionary);
  }
}

uint64_t sub_1C51BB7B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for IncomingPushPayload();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C51BB7F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for IncomingPushPayload();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C51BB858()
{
  unint64_t result = qword_1EA3D11E0;
  if (!qword_1EA3D11E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D11E0);
  }
  return result;
}

uint64_t sub_1C51BB8AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1C51BB914(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C51BB974@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TopLevelDictionary.init(from:)(a1, a2);
}

uint64_t sub_1C51BB98C(void *a1)
{
  return TopLevelDictionary.encode(to:)(a1);
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional __swiftcall TopLevelDictionary.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C51C69A8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional __swiftcall TopLevelDictionary.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v2 = v1;
  result.value = TopLevelDictionary.CodingKeys.init(rawValue:)(stringValue).value;
  *uint64_t v2 = v4;
  return result;
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional __swiftcall TopLevelDictionary.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 4;
  return (MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional)intValue;
}

uint64_t TopLevelDictionary.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t TopLevelDictionary.CodingKeys.rawValue.getter()
{
  unint64_t result = 0xD00000000000001DLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000026;
      break;
    case 3:
      unint64_t result = 0xD000000000000028;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t TopLevelDictionary.CodingKeys.stringValue.getter()
{
  unint64_t result = 0xD00000000000001DLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000026;
      break;
    case 3:
      unint64_t result = 0xD000000000000028;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1C51BBB58(unsigned __int8 *a1, char *a2)
{
  return sub_1C51C344C(*a1, *a2);
}

uint64_t sub_1C51BBB64()
{
  return sub_1C51C1EEC();
}

uint64_t sub_1C51BBB6C()
{
  return sub_1C51C35E8();
}

uint64_t sub_1C51BBB74()
{
  return sub_1C51C2050();
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional sub_1C51BBB7C(Swift::String *a1)
{
  return TopLevelDictionary.CodingKeys.init(rawValue:)(*a1);
}

unint64_t sub_1C51BBB88@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = TopLevelDictionary.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

MessagesBlastDoorSupport::TopLevelDictionary::CodingKeys_optional sub_1C51BBBB4@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  result.value = TopLevelDictionary.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_1C51BBBEC(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1C51BBBF8(uint64_t a1)
{
  unint64_t v2 = sub_1C51BB338();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51BBC34(uint64_t a1)
{
  unint64_t v2 = sub_1C51BB338();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TopLevelDictionary.encrypted.getter()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for TopLevelDictionary() + 28));
  uint64_t v2 = v1[1];
  if (!v2 || (*v1 == 1701736302 ? (BOOL v3 = v2 == 0xE400000000000000) : (BOOL v3 = 0), v3)) {
    char v4 = 0;
  }
  else {
    char v4 = sub_1C51C6B28() ^ 1;
  }
  return v4 & 1;
}

unint64_t sub_1C51BBCE0()
{
  unint64_t result = qword_1EA3D1838;
  if (!qword_1EA3D1838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1838);
  }
  return result;
}

unint64_t sub_1C51BBD38()
{
  unint64_t result = qword_1EA3D1200;
  if (!qword_1EA3D1200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1200);
  }
  return result;
}

unint64_t sub_1C51BBD90()
{
  unint64_t result = qword_1EA3D11F8;
  if (!qword_1EA3D11F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D11F8);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for TopLevelDictionary(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C51C59F8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = (int *)type metadata accessor for IncomingPushPayload();
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)a1 + v9;
    long long v11 = (char *)a2 + v9;
    *(void *)uint64_t v10 = *(void *)v11;
    v10[8] = v11[8];
    *((unsigned char *)a1 + v8[6]) = *((unsigned char *)a2 + v8[6]);
    *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
    *((unsigned char *)a1 + v8[8]) = *((unsigned char *)a2 + v8[8]);
    uint64_t v12 = v8[9];
    uint64_t v13 = (char *)a1 + v12;
    unint64_t v14 = (char *)a2 + v12;
    v13[8] = v14[8];
    *(void *)uint64_t v13 = *(void *)v14;
    uint64_t v15 = a3[5];
    char v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    unint64_t v18 = *((void *)v17 + 1);
    if (v18 >> 60 == 15)
    {
      *(_OWORD *)char v16 = *(_OWORD *)v17;
    }
    else
    {
      uint64_t v20 = *(void *)v17;
      sub_1C518D19C(*(void *)v17, *((void *)v17 + 1));
      *(void *)char v16 = v20;
      *((void *)v16 + 1) = v18;
    }
    uint64_t v21 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    unint64_t v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TopLevelDictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (uint64_t *)(a1 + *(int *)(a2 + 20));
  unint64_t v6 = v5[1];
  if (v6 >> 60 != 15) {
    sub_1C518D144(*v5, v6);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for IncomingPushPayload();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(unsigned char *)(a1 + v7[6]) = *(unsigned char *)(a2 + v7[6]);
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v11 = v7[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  uint64_t v14 = a3[5];
  uint64_t v15 = a1 + v14;
  char v16 = (uint64_t *)(a2 + v14);
  unint64_t v17 = v16[1];
  if (v17 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  }
  else
  {
    uint64_t v18 = *v16;
    sub_1C518D19C(*v16, v16[1]);
    *(void *)uint64_t v15 = v18;
    *(void *)(v15 + 8) = v17;
  }
  uint64_t v19 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for IncomingPushPayload();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  char v11 = *(unsigned char *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = v11;
  *(unsigned char *)(a1 + v7[6]) = *(unsigned char *)(a2 + v7[6]);
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v12 = v7[9];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(unsigned char *)(v14 + 8);
  *(void *)uint64_t v13 = *(void *)v14;
  *(unsigned char *)(v13 + 8) = v15;
  uint64_t v16 = a3[5];
  unint64_t v17 = (uint64_t *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  unint64_t v19 = *(void *)(a2 + v16 + 8);
  if (*(void *)(a1 + v16 + 8) >> 60 != 15)
  {
    if (v19 >> 60 != 15)
    {
      uint64_t v21 = *v18;
      sub_1C518D19C(v21, v19);
      uint64_t v22 = *v17;
      unint64_t v23 = v17[1];
      uint64_t *v17 = v21;
      v17[1] = v19;
      sub_1C518D144(v22, v23);
      goto LABEL_8;
    }
    sub_1C51BC2D0((uint64_t)v17);
    goto LABEL_6;
  }
  if (v19 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)unint64_t v17 = *(_OWORD *)v18;
    goto LABEL_8;
  }
  uint64_t v20 = *v18;
  sub_1C518D19C(v20, v19);
  uint64_t *v17 = v20;
  v17[1] = v19;
LABEL_8:
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v24 = a3[7];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C51BC2D0(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for IncomingPushPayload();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(unsigned char *)(a1 + v7[6]) = *(unsigned char *)(a2 + v7[6]);
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v11 = v7[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for TopLevelDictionary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for IncomingPushPayload();
  uint64_t v8 = v7[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(unsigned char *)(a1 + v7[6]) = *(unsigned char *)(a2 + v7[6]);
  *(unsigned char *)(a1 + v7[7]) = *(unsigned char *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v11 = v7[9];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[5];
  char v15 = (uint64_t *)(a1 + v14);
  uint64_t v16 = (uint64_t *)(a2 + v14);
  unint64_t v17 = *(void *)(a1 + v14 + 8);
  if (v17 >> 60 != 15)
  {
    unint64_t v18 = v16[1];
    if (v18 >> 60 != 15)
    {
      uint64_t v19 = *v15;
      *char v15 = *v16;
      v15[1] = v18;
      sub_1C518D144(v19, v17);
      goto LABEL_6;
    }
    sub_1C51BC2D0((uint64_t)v15);
  }
  *(_OWORD *)char v15 = *(_OWORD *)v16;
LABEL_6:
  uint64_t v20 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (uint64_t *)(a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TopLevelDictionary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C51BC57C);
}

uint64_t sub_1C51BC57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for IncomingPushPayload();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TopLevelDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C51BC660);
}

uint64_t sub_1C51BC660(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = a2;
  }
  return result;
}

uint64_t sub_1C51BC720()
{
  uint64_t result = type metadata accessor for IncomingPushPayload();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TopLevelDictionary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TopLevelDictionary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C51BC924);
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

ValueMetadata *type metadata accessor for TopLevelDictionary.CodingKeys()
{
  return &type metadata for TopLevelDictionary.CodingKeys;
}

void sub_1C51BC95C(double a1, double a2)
{
  if (a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((*(void *)&a1 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_16;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_18:
    __break(1u);
    return;
  }
  DeviceRGB = CGImageGetColorSpace(v2);
  if (!DeviceRGB) {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  uint32_t BitmapInfo = CGImageGetBitmapInfo(v2);
  BOOL v7 = CGBitmapContextCreate(0, (uint64_t)a1, (uint64_t)a2, 8uLL, 0, DeviceRGB, BitmapInfo);

  if (v7)
  {
    CGContextSetInterpolationQuality(v7, kCGInterpolationHigh);
    sub_1C51C6728();
    if (!CGBitmapContextCreateImage(v7))
    {
      sub_1C51BCB28();
      swift_allocError();
      *uint64_t v9 = 1;
      swift_willThrow();
    }
  }
  else
  {
    sub_1C51BCB28();
    swift_allocError();
    *int v8 = 0;
    swift_willThrow();
  }
}

unint64_t sub_1C51BCB28()
{
  unint64_t result = qword_1EA3D1840;
  if (!qword_1EA3D1840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1840);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MessagesAttachmentScalingError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C51BCC48);
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

ValueMetadata *type metadata accessor for MessagesAttachmentScalingError()
{
  return &type metadata for MessagesAttachmentScalingError;
}

unint64_t sub_1C51BCC84()
{
  unint64_t result = qword_1EA3D1848;
  if (!qword_1EA3D1848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1848);
  }
  return result;
}

uint64_t sub_1C51BCCD8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (v7 != 16)
      {
LABEL_13:
        sub_1C518D144(a1, a2);
        uint64_t v11 = sub_1C51C59F8();
        uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
        uint64_t v13 = v11;
        uint64_t v14 = a3;
        uint64_t v15 = 1;
        goto LABEL_19;
      }
      if (v4)
      {
        if (v4 != 1)
        {
          uint64_t v16 = *(void *)(a1 + 16);
          swift_retain();
          swift_retain();
          if (!sub_1C51C5828())
          {
LABEL_28:
            sub_1C51C5848();
            __break(1u);
            JUMPOUT(0x1C51BCFECLL);
          }
          if (!__OFSUB__(v16, sub_1C51C5858()))
          {
            sub_1C51C5848();
            swift_release();
            swift_release();
            goto LABEL_18;
          }
          goto LABEL_25;
        }
        if ((int)a1 <= a1 >> 32)
        {
          if (!sub_1C51C5828())
          {
LABEL_27:
            sub_1C51C5848();
            __break(1u);
            goto LABEL_28;
          }
          if (!__OFSUB__((int)a1, sub_1C51C5858()))
          {
            sub_1C51C5848();
            goto LABEL_18;
          }
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
LABEL_18:
      sub_1C51C59D8();
      sub_1C518D144(a1, a2);
      uint64_t v17 = sub_1C51C59F8();
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
      uint64_t v13 = v17;
      uint64_t v14 = a3;
      uint64_t v15 = 0;
LABEL_19:
      return v12(v14, v15, 1, v13);
    case 2uLL:
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v8 = *(void *)(a1 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_23;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v7 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1C51BCFFC(uint64_t a1, uint64_t a2)
{
  v8[3] = MEMORY[0x1E4FBB2B8];
  v8[4] = MEMORY[0x1E4F27EF0];
  v8[0] = a1;
  v8[1] = a2;
  int v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E4FBB2B8]);
  int v3 = (unsigned char *)*v2;
  if (*v2 && (unint64_t v4 = (unsigned char *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_1C51BDF20(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_1C51BDFE4((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      uint64_t v6 = sub_1C51BE060((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v6;
}

uint64_t UUIDData.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1C51C59F8();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t UUIDData.wrappedValue.setter(uint64_t a1)
{
  uint64_t v3 = sub_1C51C59F8();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*UUIDData.wrappedValue.modify())()
{
  return CGSizeMake;
}

uint64_t UUIDData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D11E8);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  unint64_t v43 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v44 = (char *)v39 - v7;
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v39 - v8;
  uint64_t v10 = sub_1C51C59F8();
  uint64_t v46 = *(void *)(v10 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)v39 - v14;
  uint64_t v16 = type metadata accessor for UUIDData();
  MEMORY[0x1F4188790](v16 - 8);
  unint64_t v18 = (char *)v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v19 = v47;
  sub_1C51C6C18();
  if (!v19)
  {
    v39[2] = v13;
    uint64_t v40 = v15;
    uint64_t v41 = v18;
    uint64_t v42 = v10;
    uint64_t v47 = a1;
    __swift_project_boxed_opaque_existential_1(v50, v50[3]);
    sub_1C51BB858();
    sub_1C51C6B48();
    v39[1] = 0;
    uint64_t v20 = v48;
    unint64_t v21 = v49;
    sub_1C518D19C(v48, v49);
    uint64_t v22 = v9;
    sub_1C51BCCD8(v20, v21, (uint64_t)v9);
    uint64_t v23 = v46;
    uint64_t v24 = v42;
    int v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48))(v9, 1, v42);
    uint64_t v26 = v45;
    if (v25 != 1)
    {
      sub_1C518D144(v20, v21);
      char v31 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
      unint64_t v32 = v40;
      v31(v40, v22, v24);
      uint64_t v33 = (uint64_t)v41;
      v31(v41, v32, v24);
      uint64_t v34 = (uint64_t)v47;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
      sub_1C51B0DAC(v33, v26);
      return __swift_destroy_boxed_opaque_existential_0(v34);
    }
    sub_1C51BD94C((uint64_t)v9);
    uint64_t v27 = sub_1C51C68B8();
    swift_allocError();
    uint64_t v29 = v28;
    uint64_t v48 = 0;
    unint64_t v49 = 0xE000000000000000;
    sub_1C51C6878();
    sub_1C51C6648();
    uint64_t v30 = 0;
    switch(v21 >> 62)
    {
      case 1uLL:
        LODWORD(v30) = HIDWORD(v20) - v20;
        if (__OFSUB__(HIDWORD(v20), v20))
        {
          __break(1u);
LABEL_12:
          __break(1u);
          JUMPOUT(0x1C51BD8F0);
        }
        uint64_t v30 = (int)v30;
LABEL_9:
        v50[6] = v30;
        sub_1C51C6B18();
        sub_1C51C6648();
        swift_bridgeObjectRelease();
        sub_1C51C6648();
        sub_1C51C68A8();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x1E4FBBA78], v27);
        swift_willThrow();
        sub_1C518D144(v20, v21);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v50);
        a1 = v47;
        break;
      case 2uLL:
        uint64_t v37 = *(void *)(v20 + 16);
        uint64_t v36 = *(void *)(v20 + 24);
        BOOL v38 = __OFSUB__(v36, v37);
        uint64_t v30 = v36 - v37;
        if (!v38) {
          goto LABEL_9;
        }
        goto LABEL_12;
      case 3uLL:
        goto LABEL_9;
      default:
        uint64_t v30 = BYTE6(v21);
        goto LABEL_9;
    }
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t type metadata accessor for UUIDData()
{
  uint64_t result = qword_1EA3D1248;
  if (!qword_1EA3D1248) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C51BD94C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D11E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t UUIDData.encode(to:)(void *a1)
{
  uint64_t v3 = sub_1C51C59F8();
  uint64_t v4 = sub_1C51BCFFC(v1, v1 + *(void *)(*(void *)(v3 - 8) + 64));
  unint64_t v6 = v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51C6C38();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v8, v9);
  sub_1C51BB38C();
  sub_1C51C6B58();
  sub_1C518D144(v4, v6);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
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

uint64_t sub_1C51BDAEC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return UUIDData.init(from:)(a1, a2);
}

uint64_t sub_1C51BDB04(void *a1)
{
  return UUIDData.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  unint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t initializeWithCopy for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for UUIDData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for UUIDData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C51BDD2C);
}

uint64_t sub_1C51BDD2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for UUIDData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C51BDDAC);
}

uint64_t sub_1C51BDDAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_1C51BDE1C()
{
  uint64_t result = sub_1C51C59F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *sub_1C51BDEA8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_1C51BDF20(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_1C51BDFE4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1C51BE060((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1C51BDF20(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1C51BDFE4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1C51C5868();
  swift_allocObject();
  uint64_t result = sub_1C51C5818();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1C51C5978();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1C51BE060(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1C51C5868();
  swift_allocObject();
  uint64_t result = sub_1C51C5818();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1C51BE0E4(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1850);
  unint64_t v10 = sub_1C51BE180();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_1C51BDEA8(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

unint64_t sub_1C51BE180()
{
  unint64_t result = qword_1EA3D1858;
  if (!qword_1EA3D1858)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA3D1850);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1858);
  }
  return result;
}

uint64_t TopLevelDictionary.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  v11[0] = a1;
  uint64_t v2 = sub_1C51C64C8();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v3 = type metadata accessor for UUIDData();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1C51C59F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IncomingPushPayload();
  sub_1C51BE408(v1, (uint64_t)v5);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  sub_1C51C64B8();
  return sub_1C51C64D8();
}

uint64_t sub_1C51BE408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUIDData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C51BE46C(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = a1;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_1C51C5998();
  unint64_t v6 = v5;
  uint64_t v7 = LiteMessageCompressor.encode(_:)(v4, v5);
  unint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_1C518D144(v4, v6);
  swift_bridgeObjectRelease();
  if (v9 >> 60 == 15)
  {

    return 0;
  }
  if (a2) {
    *a2 = v11;
  }
  sub_1C518D19C(v7, v9);
  uint64_t v12 = sub_1C51C5988();
  sub_1C51ACB08(v7, v9);
  sub_1C51ACB08(v7, v9);

  return v12;
}

id BlastDoorLiteMessageCompressor.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id BlastDoorLiteMessageCompressor.init()()
{
  LiteMessageCompressor.init()();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlastDoorLiteMessageCompressor();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for BlastDoorLiteMessageCompressor()
{
  return self;
}

id BlastDoorLiteMessageCompressor.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlastDoorLiteMessageCompressor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for BlastDoorLiteMessageCompressor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BlastDoorLiteMessageCompressor);
}

uint64_t *sub_1C51BE728(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  id v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *id v3 = *a2;
    id v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    unint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_1C51C5FE8();
    uint64_t v10 = *(void *)(v9 - 8);
    uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_1C51BE89C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_1C51C5FE8();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_1C51BE96C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_1C51C5FE8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_1C51BEA90(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1C51C5FE8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_1C51BEC28(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_1C51C5FE8();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

void *sub_1C51BED3C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1C51C5FE8();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1C51BEEC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C51BEED8);
}

uint64_t sub_1C51BEED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1C51BEF8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C51BEFA0);
}

uint64_t sub_1C51BEFA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LiteTextMessageContent(uint64_t a1)
{
  return sub_1C51C05F8(a1, (uint64_t *)&unk_1EA3D1868);
}

void sub_1C51BF06C()
{
  sub_1C51BF104();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1C51BF104()
{
  if (!qword_1EA3D1878)
  {
    sub_1C51C5FE8();
    unint64_t v0 = sub_1C51C6808();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EA3D1878);
    }
  }
}

uint64_t *sub_1C51BF15C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C51C59F8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    int v13 = (char *)a1 + v9;
    int v14 = (char *)a2 + v9;
    uint64_t v15 = sub_1C51C5FE8();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
      memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return a1;
}

uint64_t sub_1C51BF31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_1C51C5FE8();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t sub_1C51BF42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  int v13 = (const void *)(a2 + v8);
  uint64_t v14 = sub_1C51C5FE8();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_1C51BF59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_1C51C5FE8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_1C51BF77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_1C51C5FE8();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1C51BF8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_1C51C5FE8();
  uint64_t v16 = *(void *)(v15 - 8);
  int v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_1C51BFAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C51BFAB8);
}

uint64_t sub_1C51BFAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C59F8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1C51BFBEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C51BFC00);
}

uint64_t sub_1C51BFC00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1C51C59F8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for LiteReplyMessageContent(uint64_t a1)
{
  return sub_1C51C05F8(a1, (uint64_t *)&unk_1EA3D1880);
}

void sub_1C51BFD54()
{
  sub_1C51C59F8();
  if (v0 <= 0x3F)
  {
    sub_1C51BF104();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_1C51BFE24(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1C51C5D38();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1C51C59F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)a1 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1C51BFF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1C51C5D38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C51C000C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C5D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1C51C00E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C5D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C51C01D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C5D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1C51C029C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C5D38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_1C51C59F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1C51C0378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C51C038C);
}

uint64_t sub_1C51C038C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1C51C5D38();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_1C51C59F8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  int v15 = v14 - 1;
  if (v15 < 0) {
    int v15 = -1;
  }
  return (v15 + 1);
}

uint64_t sub_1C51C04B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C51C04C4);
}

uint64_t sub_1C51C04C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_1C51C5D38();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_1C51C59F8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for LiteAcknowledgmentMessageContent(uint64_t a1)
{
  return sub_1C51C05F8(a1, (uint64_t *)&unk_1EA3D1890);
}

uint64_t sub_1C51C05F8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1C51C0630()
{
  uint64_t result = sub_1C51C5D38();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_1C51C59F8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1C51C0700@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)sub_1C518C9C0();
  if (!v1)
  {
    uint64_t v8 = HIBYTE(v7) & 0xF;
    v14[0] = result;
    v14[1] = v7;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v8 = result & 0xFFFFFFFFFFFFLL;
    }
    v14[2] = 0;
    v14[3] = v8;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1C51B8690((uint64_t)v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = Array<A>.spansAsPlainText.getter(v9);
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *a1 = v10;
    a1[1] = v12;
    uint64_t result = sub_1C51AF9DC(3);
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      sub_1C51C5FD8();
      uint64_t v13 = type metadata accessor for LiteTextMessageContent(0);
      return sub_1C51C1150((uint64_t)v5, (uint64_t)a1 + *(int *)(v13 + 20));
    }
  }
  return result;
}

unint64_t sub_1C51C0854@<X0>(char *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D11E8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C51C59F8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = (unint64_t)sub_1C518C9C0();
  if (!v1)
  {
    uint64_t v39 = v10;
    uint64_t v36 = v5;
    uint64_t v15 = HIBYTE(v14) & 0xF;
    v38[0] = result;
    v38[1] = v14;
    if ((v14 & 0x2000000000000000) == 0) {
      uint64_t v15 = result & 0xFFFFFFFFFFFFLL;
    }
    v38[2] = 0;
    v38[3] = v15;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1C51B8690((uint64_t)v38);
    int v17 = a1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = Array<A>.spansAsPlainText.getter(v16);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = type metadata accessor for LiteReplyMessageContent(0);
    uint64_t v22 = *(int *)(v21 + 20);
    uint64_t v37 = v17;
    uint64_t v23 = (uint64_t *)&v17[v22];
    uint64_t *v23 = v18;
    v23[1] = v20;
    uint64_t v24 = sub_1C51AF530(16);
    v35[0] = v21;
    v35[1] = v23;
    int v25 = v37;
    unint64_t v27 = v26;
    sub_1C518D19C(v24, v26);
    unint64_t v28 = v27;
    sub_1C51BCCD8(v24, v27, (uint64_t)v8);
    uint64_t v29 = v39;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v8, 1, v9) == 1)
    {
      sub_1C51BD94C((uint64_t)v8);
      sub_1C518D0F0();
      swift_allocError();
      *uint64_t v30 = 2;
      swift_willThrow();
      sub_1C518D144(v24, v28);
      return swift_bridgeObjectRelease();
    }
    else
    {
      sub_1C518D144(v24, v28);
      char v31 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
      v31(v12, v8, v9);
      unint64_t v32 = v25;
      v31(v25, v12, v9);
      unint64_t result = sub_1C51AF9DC(3);
      uint64_t v33 = (uint64_t)v36;
      uint64_t v34 = v35[0];
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else
      {
        sub_1C51C5FD8();
        return sub_1C51C1150(v33, (uint64_t)&v32[*(int *)(v34 + 24)]);
      }
    }
  }
  return result;
}

uint64_t sub_1C51C0BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v3 = sub_1C51C65E8();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D11E8);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1C51C59F8();
  uint64_t v65 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1C51C5D38();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v57 - v17;
  uint64_t v19 = v67;
  uint64_t result = sub_1C51AF750(4);
  if (!v19)
  {
    uint64_t v60 = v11;
    uint64_t v61 = v16;
    uint64_t v62 = a1;
    uint64_t v63 = v9;
    uint64_t v59 = v5;
    uint64_t v64 = v13;
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      sub_1C51C5D28();
      uint64_t v21 = v12;
      (*(void (**)(uint64_t, char *, uint64_t))(v64 + 32))(v66, v18, v12);
      uint64_t v22 = sub_1C51AF530(16);
      uint64_t v67 = 0;
      uint64_t v23 = v22;
      unint64_t v25 = v24;
      sub_1C518D19C(v22, v24);
      unint64_t v26 = v8;
      sub_1C51BCCD8(v23, v25, (uint64_t)v8);
      uint64_t v27 = v65;
      uint64_t v28 = v63;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48))(v8, 1, v63) == 1)
      {
        sub_1C51BD94C((uint64_t)v8);
        sub_1C518D0F0();
        uint64_t v29 = swift_allocError();
        *uint64_t v30 = 2;
        uint64_t v67 = v29;
        swift_willThrow();
        sub_1C518D144(v23, v25);
        int v31 = 0;
        uint64_t v32 = v27;
LABEL_5:
        uint64_t v33 = v64;
        goto LABEL_6;
      }
      sub_1C518D144(v23, v25);
      uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
      uint64_t v37 = v60;
      v36(v60, v26, v28);
      uint64_t v57 = type metadata accessor for LiteAcknowledgmentMessageContent(0);
      v36((char *)(v66 + *(int *)(v57 + 20)), v37, v28);
      uint64_t v38 = *MEMORY[0x1E4F505D8];
      uint64_t v33 = v64;
      uint64_t v39 = v61;
      uint64_t v60 = *(char **)(v64 + 104);
      ((void (*)(char *, uint64_t, uint64_t))v60)(v61, v38, v12);
      sub_1C51C11B8();
      sub_1C51C6698();
      sub_1C51C6698();
      uint64_t v40 = v69;
      uint64_t v41 = v68;
      uint64_t v58 = *(void (**)(char *, uint64_t))(v33 + 8);
      v58(v39, v12);
      if (v40 != v41)
      {
        ((void (*)(char *, void, uint64_t))v60)(v39, *MEMORY[0x1E4F505D0], v12);
        sub_1C51C6698();
        sub_1C51C6698();
        uint64_t v42 = v69;
        uint64_t v43 = v68;
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v58)(v39, v12);
        if (v42 != v43)
        {
          uint64_t v47 = (void *)(v66 + *(int *)(v57 + 24));
          void *v47 = 0;
          v47[1] = 0;
          return result;
        }
      }
      uint64_t v44 = v67;
      uint64_t result = sub_1C51AF9DC(3);
      if (v44)
      {
        uint64_t v67 = v44;
        int v31 = 1;
        uint64_t v28 = v63;
        uint64_t v32 = v65;
LABEL_6:
        uint64_t v34 = v66;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v66, v21);
        if (v31)
        {
          uint64_t v35 = type metadata accessor for LiteAcknowledgmentMessageContent(0);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v34 + *(int *)(v35 + 20), v28);
        }
        return result;
      }
      uint64_t v28 = v63;
      uint64_t v32 = v65;
      if ((result & 0x8000000000000000) == 0)
      {
        uint64_t v45 = sub_1C51AF530(result);
        uint64_t v67 = 0;
        uint64_t v48 = v45;
        unint64_t v49 = v46;
        sub_1C51C65D8();
        uint64_t v50 = sub_1C51C65C8();
        if (v51)
        {
          uint64_t v52 = v50;
          uint64_t v53 = v51;
          uint64_t result = sub_1C518D144(v48, v49);
          uint64_t v54 = (uint64_t *)(v66 + *(int *)(v57 + 24));
          *uint64_t v54 = v52;
          v54[1] = v53;
          return result;
        }
        sub_1C518D0F0();
        uint64_t v55 = swift_allocError();
        *unint64_t v56 = 0;
        uint64_t v67 = v55;
        swift_willThrow();
        sub_1C518D144(v48, v49);
        int v31 = 1;
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1C51C1150(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D15D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C51C11B8()
{
  unint64_t result = qword_1EA3D18A0;
  if (!qword_1EA3D18A0)
  {
    sub_1C51C5D38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18A0);
  }
  return result;
}

uint64_t SatelliteSMSTextMessageUnpacker.unpack(from:)()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1548);
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1C51C6528();
  uint64_t v53 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1C51C65E8();
  MEMORY[0x1F4188790](v7 - 8);
  sub_1C51C5898();
  swift_allocObject();
  uint64_t v8 = sub_1C51C5888();
  sub_1C51C1A60();
  sub_1C51C5878();
  if (v0) {
    return swift_release();
  }
  uint64_t v46 = v8;
  uint64_t v11 = v49;
  unint64_t v10 = v50;
  if (v52) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v51;
  }
  uint64_t v47 = v49;
  unint64_t v48 = v50;
  if (v50 >> 60 != 15)
  {
    sub_1C51A75CC(v49, v50);
    if (v12)
    {
      if (qword_1EA3D1278 != -1) {
        swift_once();
      }
      uint64_t v49 = qword_1EA3D52C0;
      swift_bridgeObjectRetain();
      uint64_t v22 = LiteMessageCompressor.decode(_:codecID:)(v47, v48, v12);
      unint64_t v10 = v23;
      swift_bridgeObjectRelease();
      if (v10 >> 60 == 15)
      {
        sub_1C51C6518();
        sub_1C51AE9A0();
        unint64_t v24 = (void *)sub_1C51C67F8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
        uint64_t v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = xmmword_1C51C7CA0;
        uint64_t v15 = v53;
        uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
        v45(v3, v6, v4);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v3, 0, 1, v4);
        uint64_t v26 = sub_1C51C6378();
        uint64_t v28 = v27;
        sub_1C51C1D30((uint64_t)v3);
        *(void *)(v25 + 56) = MEMORY[0x1E4FBB1A0];
        *(void *)(v25 + 64) = sub_1C51A41F4();
        *(void *)(v25 + 32) = v26;
        *(void *)(v25 + 40) = v28;
        sub_1C51C6758();
        sub_1C51C5A38();

        swift_bridgeObjectRelease();
        sub_1C51C1DD8(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
        swift_allocError();
        v45(v29, v6, v4);
        swift_willThrow();
LABEL_17:
        swift_release();
        uint64_t v42 = v47;
        unint64_t v41 = v48;
        sub_1C51ACB08(v47, v48);
        uint64_t v20 = v42;
        unint64_t v21 = v41;
        goto LABEL_18;
      }
    }
    else
    {
      sub_1C518D19C(v11, v10);
      uint64_t v22 = v11;
    }
    sub_1C51C65D8();
    sub_1C51C65C8();
    uint64_t v30 = (void (*)(char *, char *, uint64_t))v10;
    if (v31)
    {
      sub_1C51C1AB4();
      swift_bridgeObjectRelease();
      sub_1C51C6208();
      sub_1C518D144(v22, v10);
      uint64_t v33 = v47;
      unint64_t v32 = v48;
      sub_1C51ACB08(v47, v48);
      sub_1C51ACB08(v33, v32);
      return swift_release();
    }
    sub_1C51C6518();
    sub_1C51AE9A0();
    uint64_t v34 = (void *)sub_1C51C67F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
    uint64_t v35 = swift_allocObject();
    uint64_t v45 = v30;
    uint64_t v36 = (void *)v35;
    *(_OWORD *)(v35 + 16) = xmmword_1C51C7CA0;
    uint64_t v15 = v53;
    uint64_t v44 = v22;
    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
    v43(v3, v6, v4);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v3, 0, 1, v4);
    uint64_t v37 = sub_1C51C6378();
    uint64_t v39 = v38;
    sub_1C51C1D30((uint64_t)v3);
    v36[7] = MEMORY[0x1E4FBB1A0];
    v36[8] = sub_1C51A41F4();
    v36[4] = v37;
    v36[5] = v39;
    sub_1C51C6758();
    sub_1C51C5A38();

    swift_bridgeObjectRelease();
    sub_1C51C1DD8(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
    swift_allocError();
    v43(v40, v6, v4);
    swift_willThrow();
    sub_1C518D144(v44, (unint64_t)v45);
    goto LABEL_17;
  }
  sub_1C51C6518();
  sub_1C51AE9A0();
  uint64_t v13 = (void *)sub_1C51C67F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD0448);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1C51C7CA0;
  uint64_t v15 = v53;
  uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  v45(v3, v6, v4);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v3, 0, 1, v4);
  uint64_t v16 = sub_1C51C6378();
  uint64_t v18 = v17;
  sub_1C51C1D30((uint64_t)v3);
  *(void *)(v14 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v14 + 64) = sub_1C51A41F4();
  *(void *)(v14 + 32) = v16;
  *(void *)(v14 + 40) = v18;
  sub_1C51C6758();
  sub_1C51C5A38();

  swift_bridgeObjectRelease();
  sub_1C51C1DD8(&qword_1EA3D12D0, MEMORY[0x1E4F50A28]);
  swift_allocError();
  v45(v19, v6, v4);
  swift_willThrow();
  swift_release();
  uint64_t v20 = v47;
  unint64_t v21 = v48;
LABEL_18:
  sub_1C51ACB08(v20, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v6, v4);
}

unint64_t sub_1C51C1A60()
{
  unint64_t result = qword_1EA3D18A8;
  if (!qword_1EA3D18A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18A8);
  }
  return result;
}

void *sub_1C51C1AB4()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1C51C6658();
  if (!v1)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_22;
  }
  uint64_t v2 = v0;
  uint64_t v3 = v1;
  uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
  do
  {
    char v5 = 0;
    while (1)
    {
      if ((v5 & 1) == 0)
      {
        if (v2 == 1 && v3 == 0xE100000000000000)
        {
          char v5 = 1;
          goto LABEL_6;
        }
        char v5 = 1;
        if (sub_1C51C6B28()) {
          goto LABEL_6;
        }
        if (v2 == 25 && v3 == 0xE100000000000000 || (sub_1C51C6B28() & 1) != 0) {
          break;
        }
      }
      MEMORY[0x1C878B990](v2, v3);
      char v5 = 0;
LABEL_6:
      swift_bridgeObjectRelease();
      uint64_t v2 = sub_1C51C6658();
      uint64_t v3 = v6;
      if (!v6) {
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_1C51AEEBC(0, v4[2] + 1, 1, v4);
    }
    unint64_t v8 = v4[2];
    unint64_t v7 = v4[3];
    if (v8 >= v7 >> 1) {
      uint64_t v4 = sub_1C51AEEBC((void *)(v7 > 1), v8 + 1, 1, v4);
    }
    v4[2] = v8 + 1;
    uint64_t v9 = &v4[2 * v8];
    v9[4] = 0;
    v9[5] = 0xE000000000000000;
    uint64_t v2 = sub_1C51C6658();
    uint64_t v3 = v10;
  }
  while (v10);
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1C51C1D18()
{
  return SatelliteSMSTextMessageUnpacker.unpack(from:)();
}

uint64_t sub_1C51C1D30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C51C1D90()
{
  return sub_1C51C1DD8(&qword_1EA3D13D0, MEMORY[0x1E4F50930]);
}

uint64_t sub_1C51C1DD8(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for SatelliteSMSTextMessageUnpacker()
{
  return &type metadata for SatelliteSMSTextMessageUnpacker;
}

uint64_t sub_1C51C1E30()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51C1EEC()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51C1FC8()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51C2050()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51C2128()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51C21E0()
{
  return sub_1C51C6C08();
}

unint64_t SatelliteSMSTextMessageDictionary.CodingKeys.stringValue.getter()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t SatelliteSMSTextMessageDictionary.compressedText.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1C51A75CC(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t SatelliteSMSTextMessageDictionary.compressedText.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1C51ACB08(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*SatelliteSMSTextMessageDictionary.compressedText.modify())()
{
  return CGSizeMake;
}

uint64_t SatelliteSMSTextMessageDictionary.codecID.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t SatelliteSMSTextMessageDictionary.codecID.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 16) = result;
  *(unsigned char *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SatelliteSMSTextMessageDictionary.codecID.modify())()
{
  return CGSizeMake;
}

uint64_t SatelliteSMSTextMessageDictionary.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D18B0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  v11[0] = v1[2];
  int v14 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51C2868();
  sub_1C51C6C48();
  uint64_t v12 = v8;
  uint64_t v13 = v7;
  char v15 = 0;
  sub_1C51BB38C();
  uint64_t v9 = v11[1];
  sub_1C51C6AB8();
  if (!v9)
  {
    LOBYTE(v12) = 1;
    sub_1C51C6AA8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SatelliteSMSTextMessageDictionary.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D18C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C51C2868();
  sub_1C51C6C28();
  if (v2)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  else
  {
    char v18 = 0;
    sub_1C51BB858();
    sub_1C51C6A08();
    uint64_t v10 = v16;
    unint64_t v11 = v17;
    LOBYTE(v16) = 1;
    sub_1C51A75CC(v10, v17);
    uint64_t v12 = sub_1C51C69F8();
    uint64_t v13 = v8;
    char v15 = v14;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v13, v5);
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v11;
    *(void *)(a2 + 16) = v12;
    *(unsigned char *)(a2 + 24) = v15 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_1C51ACB08(v10, v11);
}

uint64_t sub_1C51C270C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SatelliteSMSTextMessageDictionary.init(from:)(a1, a2);
}

uint64_t sub_1C51C2724(void *a1)
{
  return SatelliteSMSTextMessageDictionary.encode(to:)(a1);
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional __swiftcall SatelliteSMSTextMessageDictionary.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1C51C69A8();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional __swiftcall SatelliteSMSTextMessageDictionary.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_1C51C69A8();
  result.value = swift_bridgeObjectRelease();
  if (v3)
  {
    if (v3 == 1) {
      char v5 = 1;
    }
    else {
      char v5 = 2;
    }
  }
  else
  {
    char v5 = 0;
  }
  *uint64_t v2 = v5;
  return result;
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional __swiftcall SatelliteSMSTextMessageDictionary.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 2;
  return (MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional)intValue;
}

uint64_t SatelliteSMSTextMessageDictionary.CodingKeys.intValue.getter()
{
  return 0;
}

unint64_t SatelliteSMSTextMessageDictionary.CodingKeys.rawValue.getter()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

unint64_t sub_1C51C2868()
{
  unint64_t result = qword_1EA3D18B8;
  if (!qword_1EA3D18B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18B8);
  }
  return result;
}

uint64_t sub_1C51C28BC(char *a1, char *a2)
{
  return sub_1C51C31D8(*a1, *a2);
}

unint64_t sub_1C51C28CC()
{
  unint64_t result = qword_1EA3D18C8;
  if (!qword_1EA3D18C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18C8);
  }
  return result;
}

uint64_t sub_1C51C2920()
{
  return sub_1C51C1FC8();
}

uint64_t sub_1C51C2928()
{
  sub_1C51C6608();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C51C299C()
{
  return sub_1C51C21E0();
}

MessagesBlastDoorSupport::SatelliteSMSTextMessageDictionary::CodingKeys_optional sub_1C51C29A4(Swift::String *a1)
{
  return SatelliteSMSTextMessageDictionary.CodingKeys.init(rawValue:)(*a1);
}

void sub_1C51C29B0(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000013;
  }
  else {
    unint64_t v2 = 0xD00000000000001ALL;
  }
  unint64_t v3 = 0x80000001C51C9A90;
  if (*v1) {
    unint64_t v3 = 0x80000001C51C9AB0;
  }
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_1C51C29F8()
{
  unint64_t result = qword_1EA3D18D0;
  if (!qword_1EA3D18D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18D0);
  }
  return result;
}

unint64_t sub_1C51C2A50()
{
  unint64_t result = qword_1EA3D18D8;
  if (!qword_1EA3D18D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18D8);
  }
  return result;
}

unint64_t sub_1C51C2AA4()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t sub_1C51C2AE8(uint64_t a1)
{
  unint64_t v2 = sub_1C51C2868();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51C2B24(uint64_t a1)
{
  unint64_t v2 = sub_1C51C2868();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for SatelliteSMSTextMessageDictionary(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t *destroy for SatelliteSMSTextMessageDictionary(uint64_t *result)
{
  unint64_t v1 = result[1];
  if (v1 >> 60 != 15) {
    return (uint64_t *)sub_1C518D144(*result, v1);
  }
  return result;
}

uint64_t initializeWithCopy for SatelliteSMSTextMessageDictionary(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v5 = *a2;
    sub_1C518D19C(*a2, a2[1]);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v4;
  }
  *(void *)(a1 + 16) = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  return a1;
}

uint64_t assignWithCopy for SatelliteSMSTextMessageDictionary(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)(a1 + 8) >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a2;
      sub_1C518D19C(*(void *)a2, *(void *)(a2 + 8));
      uint64_t v7 = *(void *)a1;
      unint64_t v8 = *(void *)(a1 + 8);
      *(void *)a1 = v6;
      *(void *)(a1 + 8) = v4;
      sub_1C518D144(v7, v8);
      goto LABEL_8;
    }
    sub_1C51BC2D0(a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)a2;
  sub_1C518D19C(*(void *)a2, *(void *)(a2 + 8));
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
LABEL_8:
  uint64_t v9 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v9;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SatelliteSMSTextMessageDictionary(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 >> 60 != 15)
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *(void *)a1;
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      sub_1C518D144(v6, v4);
      goto LABEL_6;
    }
    sub_1C51BC2D0(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for SatelliteSMSTextMessageDictionary(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xC && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 12);
  }
  uint64_t v3 = *(void *)(a1 + 8) >> 60;
  if (((4 * v3) & 0xC) != 0) {
    int v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  }
  else {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SatelliteSMSTextMessageDictionary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 12;
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xC) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SatelliteSMSTextMessageDictionary()
{
  return &type metadata for SatelliteSMSTextMessageDictionary;
}

unsigned char *storeEnumTagSinglePayload for SatelliteSMSTextMessageDictionary.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x1C51C2EF0);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SatelliteSMSTextMessageDictionary.CodingKeys()
{
  return &type metadata for SatelliteSMSTextMessageDictionary.CodingKeys;
}

uint64_t NSUserDefaults.isMessagesLockdownModeEnabled.getter()
{
  unint64_t v1 = v0;
  sub_1C51C5A28();
  uint64_t v2 = (void *)sub_1C51C5A08();
  char v3 = MEMORY[0x1C878AD70]();

  if (v3) {
    return 1;
  }
  uint64_t v5 = (void *)sub_1C51C6588();
  id v6 = objc_msgSend(v1, sel_objectForKey_inDomain_, v5, *MEMORY[0x1E4F283E0]);

  if (v6)
  {
    sub_1C51C6838();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_1C51C3048((uint64_t)v8, (uint64_t)v9);
  if (v10)
  {
    if (swift_dynamicCast()) {
      return v7;
    }
  }
  else
  {
    sub_1C51C30B0((uint64_t)v9);
  }
  return 0;
}

uint64_t sub_1C51C3048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD04A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C51C30B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBD04A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RelayGroupMutationPayload.CodingKeys.stringValue.getter()
{
  return qword_1C51C98E8[*v0];
}

void RelayGroupMutationPayload.knownType.getter(unsigned char *a1@<X8>)
{
  uint64_t v2 = *v1;
  if ((unint64_t)*v1 >= 4) {
    LOBYTE(v2) = 4;
  }
  *a1 = v2;
}

uint64_t RelayGroupMutationPayload.knownParticipantChangeType.getter@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 128))
  {
    uint64_t v3 = sub_1C51C63B8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    return v4(a1, 1, 1, v3);
  }
  else
  {
    return sub_1C51C63A8();
  }
}

uint64_t sub_1C51C31D8(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000013;
  }
  else {
    unint64_t v3 = 0xD00000000000001ALL;
  }
  if (v2) {
    unint64_t v4 = 0x80000001C51C9A90;
  }
  else {
    unint64_t v4 = 0x80000001C51C9AB0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000013;
  }
  else {
    unint64_t v5 = 0xD00000000000001ALL;
  }
  if (a2) {
    unint64_t v6 = 0x80000001C51C9AB0;
  }
  else {
    unint64_t v6 = 0x80000001C51C9A90;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_1C51C6B28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1C51C3284(char a1, char a2)
{
  if (qword_1C51C98E8[a1] == qword_1C51C98E8[a2]) {
    char v2 = 1;
  }
  else {
    char v2 = sub_1C51C6B28();
  }
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_1C51C32EC(char a1, char a2)
{
  unint64_t v3 = 0xE100000000000000;
  uint64_t v4 = 85;
  switch(a1)
  {
    case 1:
      uint64_t v4 = 99;
      break;
    case 2:
      uint64_t v4 = 101;
      break;
    case 3:
      uint64_t v4 = 68;
      break;
    case 4:
      unint64_t v3 = 0xE200000000000000;
      uint64_t v4 = 25453;
      break;
    case 5:
      uint64_t v4 = 72;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE100000000000000;
  uint64_t v6 = 85;
  switch(a2)
  {
    case 1:
      if (v4 == 99) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      if (v4 != 101) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      if (v4 != 68) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v5 = 0xE200000000000000;
      uint64_t v6 = 25453;
      goto LABEL_15;
    case 5:
      if (v4 != 72) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v4 != v6) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_1C51C6B28();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_1C51C344C(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD00000000000001DLL;
  unint64_t v3 = 0x80000001C51C99F0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD00000000000001DLL;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001FLL;
      uint64_t v6 = "IDSIncomingMessageDecryptedData";
      goto LABEL_5;
    case 2:
      unint64_t v5 = 0xD000000000000026;
      uint64_t v6 = "IDSIncomingMessageShouldShowPeerErrors";
      goto LABEL_5;
    case 3:
      unint64_t v5 = 0xD000000000000028;
      uint64_t v6 = "IDSIncomingMessageOriginalEncryptionType";
LABEL_5:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x80000001C51C99F0;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD00000000000001FLL;
      unint64_t v8 = "IDSIncomingMessageDecryptedData";
      goto LABEL_10;
    case 2:
      unint64_t v2 = 0xD000000000000026;
      unint64_t v8 = "IDSIncomingMessageShouldShowPeerErrors";
      goto LABEL_10;
    case 3:
      unint64_t v2 = 0xD000000000000028;
      unint64_t v8 = "IDSIncomingMessageOriginalEncryptionType";
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
    char v9 = sub_1C51C6B28();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_1C51C35A8()
{
  sub_1C51C6608();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1C51C35E8()
{
  sub_1C51C6608();

  return swift_bridgeObjectRelease();
}

MessagesBlastDoorSupport::RelayGroupMutationType_optional __swiftcall RelayGroupMutationType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (MessagesBlastDoorSupport::RelayGroupMutationType_optional)rawValue;
}

uint64_t RelayGroupMutationType.rawValue.getter()
{
  return *v0;
}

MessagesBlastDoorSupport::RelayGroupMutationType_optional sub_1C51C36C0(Swift::Int *a1)
{
  return RelayGroupMutationType.init(rawValue:)(*a1);
}

void sub_1C51C36C8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t RelayGroupMutationPayload.type.getter()
{
  return *(void *)v0;
}

uint64_t RelayGroupMutationPayload.type.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*RelayGroupMutationPayload.type.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.service.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.service.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.service.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.groupID.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.groupID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.groupID.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.originalGroupID.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.originalGroupID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.originalGroupID.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.guid.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.guid.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.guid.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.destinationCallerID.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.destinationCallerID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.destinationCallerID.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.sender.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.sender.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.sender.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.updatedName.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RelayGroupMutationPayload.updatedName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = a2;
  return result;
}

uint64_t (*RelayGroupMutationPayload.updatedName.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.participantChangeType.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t RelayGroupMutationPayload.participantChangeType.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 120) = result;
  *(unsigned char *)(v2 + 128) = a2 & 1;
  return result;
}

uint64_t (*RelayGroupMutationPayload.participantChangeType.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.changedParticipants.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RelayGroupMutationPayload.changedParticipants.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 136) = a1;
  return result;
}

uint64_t (*RelayGroupMutationPayload.changedParticipants.modify())()
{
  return CGSizeMake;
}

uint64_t RelayGroupMutationPayload.fromMe.getter()
{
  return *(unsigned __int8 *)(v0 + 144);
}

uint64_t RelayGroupMutationPayload.fromMe.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 144) = result;
  return result;
}

uint64_t (*RelayGroupMutationPayload.fromMe.modify())()
{
  return CGSizeMake;
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional __swiftcall RelayGroupMutationPayload.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_1C51C69A8();
  result.value = swift_bridgeObjectRelease();
  char v5 = 11;
  if (v3 < 0xB) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional __swiftcall RelayGroupMutationPayload.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  uint64_t v2 = v1;
  result.value = RelayGroupMutationPayload.CodingKeys.init(rawValue:)(stringValue).value;
  *uint64_t v2 = v4;
  return result;
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional __swiftcall RelayGroupMutationPayload.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  *uint64_t v1 = 11;
  return (MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional)intValue;
}

uint64_t RelayGroupMutationPayload.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t RelayGroupMutationPayload.CodingKeys.rawValue.getter()
{
  return qword_1C51C98E8[*v0];
}

uint64_t sub_1C51C3C40(char *a1, char *a2)
{
  return sub_1C51C3284(*a1, *a2);
}

uint64_t sub_1C51C3C4C()
{
  return sub_1C51C6C08();
}

uint64_t sub_1C51C3C94()
{
  return sub_1C51C35A8();
}

uint64_t sub_1C51C3C9C()
{
  return sub_1C51C6C08();
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional sub_1C51C3CE0(Swift::String *a1)
{
  return RelayGroupMutationPayload.CodingKeys.init(rawValue:)(*a1);
}

uint64_t sub_1C51C3CEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RelayGroupMutationPayload.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE100000000000000;
  return result;
}

uint64_t sub_1C51C3D18()
{
  return RelayGroupMutationPayload.CodingKeys.stringValue.getter();
}

MessagesBlastDoorSupport::RelayGroupMutationPayload::CodingKeys_optional sub_1C51C3D34@<W0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  result.value = RelayGroupMutationPayload.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_1C51C3D6C(unsigned char *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_1C51C3D78(uint64_t a1)
{
  unint64_t v2 = sub_1C51C4180();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1C51C3DB4(uint64_t a1)
{
  unint64_t v2 = sub_1C51C4180();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t RelayGroupMutationPayload.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D18E0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + 8);
  uint64_t v35 = *(void *)(v1 + 16);
  uint64_t v36 = v7;
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v33 = *(void *)(v1 + 32);
  uint64_t v34 = v8;
  uint64_t v9 = *(void *)(v1 + 40);
  uint64_t v31 = *(void *)(v1 + 48);
  uint64_t v32 = v9;
  uint64_t v10 = *(void *)(v1 + 56);
  uint64_t v29 = *(void *)(v1 + 64);
  uint64_t v30 = v10;
  uint64_t v11 = *(void *)(v1 + 72);
  uint64_t v27 = *(void *)(v1 + 80);
  uint64_t v28 = v11;
  uint64_t v12 = *(void *)(v1 + 88);
  uint64_t v25 = *(void *)(v1 + 96);
  uint64_t v26 = v12;
  uint64_t v13 = *(void *)(v1 + 104);
  uint64_t v23 = *(void *)(v1 + 112);
  uint64_t v24 = v13;
  uint64_t v21 = *(void *)(v1 + 120);
  int v22 = *(unsigned __int8 *)(v1 + 128);
  uint64_t v14 = *(void *)(v1 + 136);
  uint64_t v15 = a1[3];
  uint64_t v16 = a1;
  uint64_t v18 = v17;
  __swift_project_boxed_opaque_existential_1(v16, v15);
  sub_1C51C4180();
  sub_1C51C6C48();
  LOBYTE(v39) = 0;
  uint64_t v19 = v37;
  sub_1C51C6AE8();
  if (!v19)
  {
    LOBYTE(v39) = 1;
    sub_1C51C6AD8();
    LOBYTE(v39) = 2;
    sub_1C51C6AD8();
    LOBYTE(v39) = 3;
    sub_1C51C6AD8();
    LOBYTE(v39) = 4;
    sub_1C51C6AD8();
    LOBYTE(v39) = 5;
    sub_1C51C6A88();
    LOBYTE(v39) = 6;
    sub_1C51C6A88();
    LOBYTE(v39) = 7;
    sub_1C51C6A88();
    LOBYTE(v39) = 8;
    sub_1C51C6AA8();
    uint64_t v39 = v14;
    char v38 = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D18F0);
    sub_1C51C4A84(&qword_1EA3D18F8);
    sub_1C51C6AB8();
    LOBYTE(v39) = 10;
    sub_1C51C6A98();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v18);
}

unint64_t sub_1C51C4180()
{
  unint64_t result = qword_1EA3D18E8;
  if (!qword_1EA3D18E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D18E8);
  }
  return result;
}

uint64_t RelayGroupMutationPayload.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D1900);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v75 = 1;
  uint64_t v9 = a1[3];
  BOOL v76 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_1C51C4180();
  sub_1C51C6C28();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v57 = v6;
    LOBYTE(v68[0]) = 0;
    uint64_t v10 = sub_1C51C6A38();
    LOBYTE(v68[0]) = 1;
    uint64_t v52 = sub_1C51C6A28();
    LOBYTE(v68[0]) = 2;
    uint64_t v12 = v11;
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1C51C6A28();
    uint64_t v56 = v12;
    uint64_t v51 = v13;
    LOBYTE(v68[0]) = 3;
    uint64_t v15 = v14;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_1C51C6A28();
    uint64_t v55 = v15;
    uint64_t v50 = v16;
    LOBYTE(v68[0]) = 4;
    uint64_t v18 = v17;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1C51C6A28();
    uint64_t v54 = v18;
    uint64_t v49 = v19;
    LOBYTE(v68[0]) = 5;
    uint64_t v21 = v20;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_1C51C69D8();
    uint64_t v53 = v21;
    uint64_t v24 = v23;
    uint64_t v48 = v22;
    LOBYTE(v68[0]) = 6;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_1C51C69D8();
    uint64_t v47 = v24;
    LOBYTE(v68[0]) = 7;
    uint64_t v26 = v25;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1C51C69D8();
    uint64_t v29 = v28;
    uint64_t v44 = v27;
    uint64_t v45 = v26;
    LOBYTE(v68[0]) = 8;
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_1C51C69F8();
    int v42 = v30;
    char v75 = v30 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3D18F0);
    LOBYTE(v58) = 9;
    sub_1C51C4A84(&qword_1EA3D1908);
    sub_1C51C6A08();
    uint64_t v31 = v68[0];
    char v73 = 10;
    swift_bridgeObjectRetain();
    int v41 = sub_1C51C69E8();
    (*(void (**)(char *, uint64_t))(v57 + 8))(v8, v5);
    uint64_t v32 = v53;
    *(void *)&long long v58 = v10;
    *((void *)&v58 + 1) = v52;
    *(void *)&long long v59 = v56;
    *((void *)&v59 + 1) = v51;
    *(void *)&long long v60 = v55;
    *((void *)&v60 + 1) = v50;
    *(void *)&long long v61 = v54;
    *((void *)&v61 + 1) = v49;
    *(void *)&long long v62 = v53;
    *((void *)&v62 + 1) = v48;
    *(void *)&long long v63 = v47;
    *((void *)&v63 + 1) = v46;
    *(void *)&long long v64 = v45;
    *((void *)&v64 + 1) = v44;
    *(void *)&long long v65 = v29;
    *((void *)&v65 + 1) = v43;
    LOBYTE(v66) = v42 & 1;
    *((void *)&v66 + 1) = v31;
    char v67 = v41;
    sub_1C51C4AE8((uint64_t)&v58);
    swift_bridgeObjectRelease();
    uint64_t v33 = v55;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v34 = v45;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v35 = v65;
    *(_OWORD *)(a2 + 96) = v64;
    *(_OWORD *)(a2 + 112) = v35;
    *(_OWORD *)(a2 + 128) = v66;
    *(unsigned char *)(a2 + 144) = v67;
    long long v36 = v61;
    *(_OWORD *)(a2 + 32) = v60;
    *(_OWORD *)(a2 + 48) = v36;
    long long v37 = v63;
    *(_OWORD *)(a2 + 64) = v62;
    *(_OWORD *)(a2 + 80) = v37;
    long long v38 = v59;
    *(_OWORD *)a2 = v58;
    *(_OWORD *)(a2 + 16) = v38;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v76);
    v68[0] = v10;
    v68[1] = v52;
    v68[2] = v56;
    v68[3] = v51;
    v68[4] = v33;
    v68[5] = v50;
    v68[6] = v54;
    v68[7] = v49;
    v68[8] = v32;
    v68[9] = v48;
    v68[10] = v47;
    v68[11] = v46;
    v68[12] = v34;
    v68[13] = v44;
    v68[14] = v29;
    v68[15] = v43;
    char v69 = v75;
    *(_DWORD *)&v70[3] = *(_DWORD *)&v74[3];
    *(_DWORD *)uint64_t v70 = *(_DWORD *)v74;
    uint64_t v71 = v31;
    char v72 = v41;
    return sub_1C51AE908((uint64_t)v68);
  }
}

uint64_t sub_1C51C4A84(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA3D18F0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1C51C4AE8(uint64_t a1)
{
  return a1;
}

unint64_t sub_1C51C4B84()
{
  unint64_t result = qword_1EA3D1910;
  if (!qword_1EA3D1910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1910);
  }
  return result;
}

unint64_t sub_1C51C4BDC()
{
  unint64_t result = qword_1EA3D1918;
  if (!qword_1EA3D1918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1918);
  }
  return result;
}

unint64_t sub_1C51C4C34()
{
  unint64_t result = qword_1EA3D1920;
  if (!qword_1EA3D1920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1920);
  }
  return result;
}

unint64_t sub_1C51C4C8C()
{
  unint64_t result = qword_1EA3D1928;
  if (!qword_1EA3D1928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA3D1928);
  }
  return result;
}

uint64_t sub_1C51C4CE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RelayGroupMutationPayload.init(from:)(a1, a2);
}

uint64_t sub_1C51C4CF8(void *a1)
{
  return RelayGroupMutationPayload.encode(to:)(a1);
}

unsigned char *storeEnumTagSinglePayload for RelayGroupMutationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1C51C4DDCLL);
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

ValueMetadata *type metadata accessor for RelayGroupMutationType()
{
  return &type metadata for RelayGroupMutationType;
}

uint64_t destroy for RelayGroupMutationPayload()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RelayGroupMutationPayload(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RelayGroupMutationPayload(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v4;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for RelayGroupMutationPayload(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for RelayGroupMutationPayload(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 145)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RelayGroupMutationPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 144) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 145) = 1;
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
    *(unsigned char *)(result + 145) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RelayGroupMutationPayload()
{
  return &type metadata for RelayGroupMutationPayload;
}

uint64_t getEnumTagSinglePayload for RelayGroupMutationPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RelayGroupMutationPayload.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x1C51C53B0);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RelayGroupMutationPayload.CodingKeys()
{
  return &type metadata for RelayGroupMutationPayload.CodingKeys;
}

uint64_t sub_1C51C57D8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1C51C57E8()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1C51C57F8()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1C51C5808()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1C51C5818()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1C51C5828()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1C51C5838()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1C51C5848()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1C51C5858()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1C51C5868()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1C51C5878()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1C51C5888()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1C51C5898()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1C51C58A8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1C51C58B8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1C51C58C8()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1C51C58D8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1C51C58E8()
{
  return MEMORY[0x1F40E4A10]();
}

uint64_t sub_1C51C58F8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1C51C5908()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1C51C5918()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1C51C5928()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1C51C5938()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1C51C5948()
{
  return MEMORY[0x1F40E4C08]();
}

uint64_t sub_1C51C5958()
{
  return MEMORY[0x1F40E4C58]();
}

uint64_t sub_1C51C5968()
{
  return MEMORY[0x1F40E4C78]();
}

uint64_t sub_1C51C5978()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1C51C5988()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1C51C5998()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1C51C59A8()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_1C51C59B8()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1C51C59C8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1C51C59D8()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t sub_1C51C59E8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1C51C59F8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1C51C5A08()
{
  return MEMORY[0x1F412AB38]();
}

uint64_t sub_1C51C5A18()
{
  return MEMORY[0x1F412AB40]();
}

uint64_t sub_1C51C5A28()
{
  return MEMORY[0x1F412AB48]();
}

uint64_t sub_1C51C5A38()
{
  return MEMORY[0x1F41884F0]();
}

uint64_t sub_1C51C5A48()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1C51C5A58()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_1C51C5A68()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1C51C5A78()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1C51C5A88()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1C51C5A98()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t sub_1C51C5AA8()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1C51C5AB8()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1C51C5AC8()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1C51C5AD8()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1C51C5AE8()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1C51C5AF8()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1C51C5B08()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1C51C5B18()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1C51C5B28()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1C51C5B38()
{
  return MEMORY[0x1F412A9D8]();
}

uint64_t sub_1C51C5B48()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1C51C5B58()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1C51C5B68()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1C51C5B78()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1C51C5B88()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1C51C5B98()
{
  return MEMORY[0x1F410CA50]();
}

uint64_t sub_1C51C5BA8()
{
  return MEMORY[0x1F410CA58]();
}

uint64_t sub_1C51C5BB8()
{
  return MEMORY[0x1F410CA60]();
}

uint64_t sub_1C51C5BC8()
{
  return MEMORY[0x1F410CA68]();
}

uint64_t sub_1C51C5BD8()
{
  return MEMORY[0x1F410CA70]();
}

uint64_t sub_1C51C5BE8()
{
  return MEMORY[0x1F410CA78]();
}

uint64_t sub_1C51C5BF8()
{
  return MEMORY[0x1F410CA80]();
}

uint64_t sub_1C51C5C08()
{
  return MEMORY[0x1F410CA88]();
}

uint64_t sub_1C51C5C18()
{
  return MEMORY[0x1F410CA90]();
}

uint64_t sub_1C51C5C28()
{
  return MEMORY[0x1F410CA98]();
}

uint64_t sub_1C51C5C38()
{
  return MEMORY[0x1F410CAA0]();
}

uint64_t sub_1C51C5C48()
{
  return MEMORY[0x1F410CAA8]();
}

uint64_t sub_1C51C5C58()
{
  return MEMORY[0x1F410CAB0]();
}

uint64_t sub_1C51C5C68()
{
  return MEMORY[0x1F410CAB8]();
}

uint64_t sub_1C51C5C78()
{
  return MEMORY[0x1F410CAC0]();
}

uint64_t sub_1C51C5C88()
{
  return MEMORY[0x1F410CAC8]();
}

uint64_t sub_1C51C5C98()
{
  return MEMORY[0x1F410CAD0]();
}

uint64_t sub_1C51C5CA8()
{
  return MEMORY[0x1F410CAD8]();
}

uint64_t sub_1C51C5CB8()
{
  return MEMORY[0x1F410CAE0]();
}

uint64_t sub_1C51C5CC8()
{
  return MEMORY[0x1F410CAE8]();
}

uint64_t sub_1C51C5CD8()
{
  return MEMORY[0x1F410CAF0]();
}

uint64_t sub_1C51C5CE8()
{
  return MEMORY[0x1F410CAF8]();
}

uint64_t sub_1C51C5CF8()
{
  return MEMORY[0x1F410CB00]();
}

uint64_t sub_1C51C5D08()
{
  return MEMORY[0x1F410CB08]();
}

uint64_t sub_1C51C5D18()
{
  return MEMORY[0x1F410CB10]();
}

uint64_t sub_1C51C5D28()
{
  return MEMORY[0x1F410CB20]();
}

uint64_t sub_1C51C5D38()
{
  return MEMORY[0x1F410CB28]();
}

uint64_t sub_1C51C5D48()
{
  return MEMORY[0x1F410CB30]();
}

uint64_t sub_1C51C5D58()
{
  return MEMORY[0x1F410CB38]();
}

uint64_t sub_1C51C5D68()
{
  return MEMORY[0x1F410CB40]();
}

uint64_t sub_1C51C5D78()
{
  return MEMORY[0x1F410CB48]();
}

uint64_t sub_1C51C5D88()
{
  return MEMORY[0x1F410CB50]();
}

uint64_t sub_1C51C5D98()
{
  return MEMORY[0x1F410CB58]();
}

uint64_t sub_1C51C5DA8()
{
  return MEMORY[0x1F410CB60]();
}

uint64_t sub_1C51C5DB8()
{
  return MEMORY[0x1F410CB68]();
}

uint64_t sub_1C51C5DC8()
{
  return MEMORY[0x1F410CB70]();
}

uint64_t sub_1C51C5DD8()
{
  return MEMORY[0x1F410CB78]();
}

uint64_t sub_1C51C5DE8()
{
  return MEMORY[0x1F410CB80]();
}

uint64_t sub_1C51C5DF8()
{
  return MEMORY[0x1F410CB88]();
}

uint64_t sub_1C51C5E08()
{
  return MEMORY[0x1F410CB90]();
}

uint64_t sub_1C51C5E18()
{
  return MEMORY[0x1F410CB98]();
}

uint64_t sub_1C51C5E28()
{
  return MEMORY[0x1F410CBA0]();
}

uint64_t sub_1C51C5E38()
{
  return MEMORY[0x1F410CBA8]();
}

uint64_t sub_1C51C5E48()
{
  return MEMORY[0x1F410CBB0]();
}

uint64_t sub_1C51C5E58()
{
  return MEMORY[0x1F410CBB8]();
}

uint64_t sub_1C51C5E68()
{
  return MEMORY[0x1F410CBC0]();
}

uint64_t sub_1C51C5E78()
{
  return MEMORY[0x1F410CBC8]();
}

uint64_t sub_1C51C5E88()
{
  return MEMORY[0x1F410CBD0]();
}

uint64_t sub_1C51C5E98()
{
  return MEMORY[0x1F410CBD8]();
}

uint64_t sub_1C51C5EA8()
{
  return MEMORY[0x1F410CBE0]();
}

uint64_t sub_1C51C5EB8()
{
  return MEMORY[0x1F410CBE8]();
}

uint64_t sub_1C51C5EC8()
{
  return MEMORY[0x1F410CBF0]();
}

uint64_t sub_1C51C5ED8()
{
  return MEMORY[0x1F410CC00]();
}

uint64_t sub_1C51C5EE8()
{
  return MEMORY[0x1F410CC08]();
}

uint64_t sub_1C51C5EF8()
{
  return MEMORY[0x1F410CC10]();
}

uint64_t sub_1C51C5F08()
{
  return MEMORY[0x1F410CC18]();
}

uint64_t sub_1C51C5F18()
{
  return MEMORY[0x1F410CC20]();
}

uint64_t sub_1C51C5F28()
{
  return MEMORY[0x1F410CC28]();
}

uint64_t sub_1C51C5F38()
{
  return MEMORY[0x1F410CC30]();
}

uint64_t sub_1C51C5F48()
{
  return MEMORY[0x1F410CC40]();
}

uint64_t sub_1C51C5F58()
{
  return MEMORY[0x1F410CC48]();
}

uint64_t sub_1C51C5F68()
{
  return MEMORY[0x1F410CC50]();
}

uint64_t sub_1C51C5F78()
{
  return MEMORY[0x1F410CC58]();
}

uint64_t sub_1C51C5F88()
{
  return MEMORY[0x1F410CC60]();
}

uint64_t sub_1C51C5F98()
{
  return MEMORY[0x1F410CC68]();
}

uint64_t sub_1C51C5FA8()
{
  return MEMORY[0x1F410CC70]();
}

uint64_t sub_1C51C5FB8()
{
  return MEMORY[0x1F410CC78]();
}

uint64_t sub_1C51C5FC8()
{
  return MEMORY[0x1F410CC80]();
}

uint64_t sub_1C51C5FD8()
{
  return MEMORY[0x1F410CC88]();
}

uint64_t sub_1C51C5FE8()
{
  return MEMORY[0x1F410CC90]();
}

uint64_t sub_1C51C5FF8()
{
  return MEMORY[0x1F410CC98]();
}

uint64_t sub_1C51C6008()
{
  return MEMORY[0x1F410CCA0]();
}

uint64_t sub_1C51C6018()
{
  return MEMORY[0x1F410CCA8]();
}

uint64_t sub_1C51C6028()
{
  return MEMORY[0x1F410CCB0]();
}

uint64_t sub_1C51C6038()
{
  return MEMORY[0x1F410CCB8]();
}

uint64_t sub_1C51C6048()
{
  return MEMORY[0x1F410CCC0]();
}

uint64_t sub_1C51C6058()
{
  return MEMORY[0x1F410CCC8]();
}

uint64_t sub_1C51C6068()
{
  return MEMORY[0x1F410CCD0]();
}

uint64_t sub_1C51C6078()
{
  return MEMORY[0x1F410CCD8]();
}

uint64_t sub_1C51C6088()
{
  return MEMORY[0x1F410CCE0]();
}

uint64_t sub_1C51C6098()
{
  return MEMORY[0x1F410CCE8]();
}

uint64_t sub_1C51C60A8()
{
  return MEMORY[0x1F410CCF0]();
}

uint64_t sub_1C51C60B8()
{
  return MEMORY[0x1F410CCF8]();
}

uint64_t sub_1C51C60C8()
{
  return MEMORY[0x1F410CD00]();
}

uint64_t sub_1C51C60D8()
{
  return MEMORY[0x1F410CD08]();
}

uint64_t sub_1C51C60E8()
{
  return MEMORY[0x1F410CD10]();
}

uint64_t sub_1C51C60F8()
{
  return MEMORY[0x1F410CD18]();
}

uint64_t sub_1C51C6108()
{
  return MEMORY[0x1F410CD20]();
}

uint64_t sub_1C51C6118()
{
  return MEMORY[0x1F410CD28]();
}

uint64_t sub_1C51C6128()
{
  return MEMORY[0x1F410CD30]();
}

uint64_t sub_1C51C6138()
{
  return MEMORY[0x1F410CD38]();
}

uint64_t sub_1C51C6148()
{
  return MEMORY[0x1F410CD48]();
}

uint64_t sub_1C51C6158()
{
  return MEMORY[0x1F410CD50]();
}

uint64_t sub_1C51C6168()
{
  return MEMORY[0x1F410CD58]();
}

uint64_t sub_1C51C6178()
{
  return MEMORY[0x1F410CD60]();
}

uint64_t sub_1C51C6188()
{
  return MEMORY[0x1F410CD68]();
}

uint64_t sub_1C51C6198()
{
  return MEMORY[0x1F410CD70]();
}

uint64_t sub_1C51C61A8()
{
  return MEMORY[0x1F410CD78]();
}

uint64_t sub_1C51C61B8()
{
  return MEMORY[0x1F410CD80]();
}

uint64_t sub_1C51C61C8()
{
  return MEMORY[0x1F410CD98]();
}

uint64_t sub_1C51C61D8()
{
  return MEMORY[0x1F410CDA0]();
}

uint64_t sub_1C51C61E8()
{
  return MEMORY[0x1F410CDA8]();
}

uint64_t sub_1C51C61F8()
{
  return MEMORY[0x1F410CDC0]();
}

uint64_t sub_1C51C6208()
{
  return MEMORY[0x1F410CDC8]();
}

uint64_t sub_1C51C6218()
{
  return MEMORY[0x1F410CDD0]();
}

uint64_t sub_1C51C6228()
{
  return MEMORY[0x1F410CDD8]();
}

uint64_t sub_1C51C6238()
{
  return MEMORY[0x1F410CDE0]();
}

uint64_t sub_1C51C6248()
{
  return MEMORY[0x1F410CDE8]();
}

uint64_t sub_1C51C6258()
{
  return MEMORY[0x1F410CDF0]();
}

uint64_t sub_1C51C6268()
{
  return MEMORY[0x1F410CDF8]();
}

uint64_t sub_1C51C6278()
{
  return MEMORY[0x1F410CE00]();
}

uint64_t sub_1C51C6288()
{
  return MEMORY[0x1F410CE08]();
}

uint64_t sub_1C51C6298()
{
  return MEMORY[0x1F410CE10]();
}

uint64_t sub_1C51C62A8()
{
  return MEMORY[0x1F410CE18]();
}

uint64_t sub_1C51C62B8()
{
  return MEMORY[0x1F410CE20]();
}

uint64_t sub_1C51C62C8()
{
  return MEMORY[0x1F410CE28]();
}

uint64_t sub_1C51C62D8()
{
  return MEMORY[0x1F410CE30]();
}

uint64_t sub_1C51C62E8()
{
  return MEMORY[0x1F410CE38]();
}

uint64_t sub_1C51C62F8()
{
  return MEMORY[0x1F410CE40]();
}

uint64_t sub_1C51C6308()
{
  return MEMORY[0x1F410CE48]();
}

uint64_t sub_1C51C6318()
{
  return MEMORY[0x1F410CE50]();
}

uint64_t sub_1C51C6328()
{
  return MEMORY[0x1F410CE58]();
}

uint64_t sub_1C51C6338()
{
  return MEMORY[0x1F410CE60]();
}

uint64_t sub_1C51C6348()
{
  return MEMORY[0x1F410CE70]();
}

uint64_t sub_1C51C6358()
{
  return MEMORY[0x1F410CE78]();
}

uint64_t sub_1C51C6368()
{
  return MEMORY[0x1F410CE80]();
}

uint64_t sub_1C51C6378()
{
  return MEMORY[0x1F410CE88]();
}

uint64_t sub_1C51C6388()
{
  return MEMORY[0x1F410CE90]();
}

uint64_t sub_1C51C6398()
{
  return MEMORY[0x1F410CE98]();
}

uint64_t sub_1C51C63A8()
{
  return MEMORY[0x1F410CEA0]();
}

uint64_t sub_1C51C63B8()
{
  return MEMORY[0x1F410CEA8]();
}

uint64_t sub_1C51C63C8()
{
  return MEMORY[0x1F410CEB0]();
}

uint64_t sub_1C51C63D8()
{
  return MEMORY[0x1F410CEB8]();
}

uint64_t sub_1C51C63E8()
{
  return MEMORY[0x1F410CEC8]();
}

uint64_t sub_1C51C63F8()
{
  return MEMORY[0x1F410CED0]();
}

uint64_t sub_1C51C6408()
{
  return MEMORY[0x1F410CED8]();
}

uint64_t sub_1C51C6418()
{
  return MEMORY[0x1F410CEE0]();
}

uint64_t sub_1C51C6428()
{
  return MEMORY[0x1F410CEE8]();
}

uint64_t sub_1C51C6438()
{
  return MEMORY[0x1F410CEF0]();
}

uint64_t sub_1C51C6448()
{
  return MEMORY[0x1F410CEF8]();
}

uint64_t sub_1C51C6458()
{
  return MEMORY[0x1F410CF00]();
}

uint64_t sub_1C51C6468()
{
  return MEMORY[0x1F410CF08]();
}

uint64_t sub_1C51C6478()
{
  return MEMORY[0x1F410CF10]();
}

uint64_t sub_1C51C6488()
{
  return MEMORY[0x1F410CF18]();
}

uint64_t sub_1C51C6498()
{
  return MEMORY[0x1F410CF20]();
}

uint64_t sub_1C51C64A8()
{
  return MEMORY[0x1F410CF28]();
}

uint64_t sub_1C51C64B8()
{
  return MEMORY[0x1F410CF30]();
}

uint64_t sub_1C51C64C8()
{
  return MEMORY[0x1F410CF38]();
}

uint64_t sub_1C51C64D8()
{
  return MEMORY[0x1F410CF40]();
}

uint64_t sub_1C51C64E8()
{
  return MEMORY[0x1F410CF48]();
}

uint64_t sub_1C51C64F8()
{
  return MEMORY[0x1F410CF50]();
}

uint64_t sub_1C51C6508()
{
  return MEMORY[0x1F410CF58]();
}

uint64_t sub_1C51C6518()
{
  return MEMORY[0x1F410CF60]();
}

uint64_t sub_1C51C6528()
{
  return MEMORY[0x1F410CF68]();
}

uint64_t sub_1C51C6538()
{
  return MEMORY[0x1F410CF70]();
}

uint64_t sub_1C51C6548()
{
  return MEMORY[0x1F410CF78]();
}

uint64_t sub_1C51C6558()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1C51C6568()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1C51C6578()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1C51C6588()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1C51C6598()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1C51C65A8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1C51C65B8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1C51C65C8()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1C51C65D8()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1C51C65E8()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1C51C65F8()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1C51C6608()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1C51C6618()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1C51C6628()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1C51C6638()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1C51C6648()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1C51C6658()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1C51C6668()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1C51C6678()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1C51C6698()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1C51C66A8()
{
  return MEMORY[0x1F4183DA0]();
}

uint64_t sub_1C51C66B8()
{
  return MEMORY[0x1F4183E18]();
}

uint64_t sub_1C51C66C8()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1C51C66D8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1C51C66E8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1C51C66F8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1C51C6708()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t sub_1C51C6728()
{
  return MEMORY[0x1F40D9688]();
}

uint64_t sub_1C51C6738()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1C51C6748()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1C51C6758()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1C51C6768()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1C51C6778()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1C51C6788()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1C51C6798()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1C51C67A8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1C51C67B8()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1C51C67C8()
{
  return MEMORY[0x1F410CF88]();
}

uint64_t sub_1C51C67D8()
{
  return MEMORY[0x1F410CF90]();
}

uint64_t sub_1C51C67E8()
{
  return MEMORY[0x1F410CF98]();
}

uint64_t sub_1C51C67F8()
{
  return MEMORY[0x1F410CFA0]();
}

uint64_t sub_1C51C6808()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1C51C6818()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1C51C6828()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1C51C6838()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1C51C6858()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1C51C6868()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t sub_1C51C6878()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1C51C6888()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1C51C6898()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1C51C68A8()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1C51C68B8()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1C51C68C8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1C51C68D8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1C51C68E8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1C51C68F8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1C51C6908()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1C51C6918()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1C51C6928()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1C51C6938()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1C51C6948()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1C51C6958()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1C51C6968()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1C51C6978()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1C51C6988()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1C51C69A8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1C51C69B8()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1C51C69C8()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1C51C69D8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1C51C69E8()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1C51C69F8()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1C51C6A08()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1C51C6A18()
{
  return MEMORY[0x1F4185560]();
}

uint64_t sub_1C51C6A28()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1C51C6A38()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1C51C6A48()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1C51C6A58()
{
  return MEMORY[0x1F41855C0]();
}

uint64_t sub_1C51C6A68()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1C51C6A78()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1C51C6A88()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1C51C6A98()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1C51C6AA8()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1C51C6AB8()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1C51C6AC8()
{
  return MEMORY[0x1F4185688]();
}

uint64_t sub_1C51C6AD8()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1C51C6AE8()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1C51C6AF8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1C51C6B08()
{
  return MEMORY[0x1F41856E8]();
}

uint64_t sub_1C51C6B18()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1C51C6B28()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1C51C6B38()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1C51C6B48()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_1C51C6B58()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1C51C6B68()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1C51C6B78()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1C51C6B88()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1C51C6B98()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1C51C6BA8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1C51C6BB8()
{
  return MEMORY[0x1F40E6E70]();
}

uint64_t sub_1C51C6BC8()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1C51C6BD8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1C51C6BE8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1C51C6BF8()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1C51C6C08()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1C51C6C18()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1C51C6C28()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1C51C6C38()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1C51C6C48()
{
  return MEMORY[0x1F4185FF0]();
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cosl_codec_get_decoded_size()
{
  return MEMORY[0x1F417F0F0]();
}

uint64_t cosl_codec_get_id()
{
  return MEMORY[0x1F417F0F8]();
}

uint64_t cosl_codec_map()
{
  return MEMORY[0x1F417F100]();
}

uint64_t cosl_codec_unmap()
{
  return MEMORY[0x1F417F108]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocEmptyBox()
{
  return MEMORY[0x1F41863D8]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}