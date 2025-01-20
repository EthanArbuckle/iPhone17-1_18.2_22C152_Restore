void *assignWithTake for CloudUploadedAudio.Attributes(void *a1, void *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  v15 = a3[6];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
  v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v18);
  v20 = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v21 = *(void *)(v18 - 8);
  if (v20)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v16, v18);
LABEL_12:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
    memcpy(v16, v17, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v16, v17, v18);
LABEL_13:
  v23 = a3[7];
  v24 = a3[8];
  v25 = (char *)a1 + v23;
  v26 = (char *)a2 + v23;
  *(void *)v25 = *(void *)v26;
  v25[8] = v26[8];
  *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
  swift_bridgeObjectRelease();
  v27 = a3[9];
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
  v31 = __swift_getEnumTagSinglePayload((uint64_t)v28, 1, v30);
  v32 = __swift_getEnumTagSinglePayload((uint64_t)v29, 1, v30);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
      __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v30);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v33 = *(void *)(v30 - 8);
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v30);
LABEL_18:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
    memcpy(v28, v29, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v28, v29, v30);
LABEL_19:
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRelease();
  v35 = a3[11];
  v36 = (void *)((char *)a1 + v35);
  v37 = (void *)((char *)a2 + v35);
  v39 = *v37;
  v38 = v37[1];
  *v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  v40 = a3[12];
  v41 = (char *)a1 + v40;
  v42 = (char *)a2 + v40;
  v43 = __swift_getEnumTagSinglePayload((uint64_t)a1 + v40, 1, v30);
  v44 = __swift_getEnumTagSinglePayload((uint64_t)v42, 1, v30);
  if (v43)
  {
    if (!v44)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v41, v42, v30);
      __swift_storeEnumTagSinglePayload((uint64_t)v41, 0, 1, v30);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  v45 = *(void *)(v30 - 8);
  if (v44)
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v41, v30);
LABEL_24:
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
    memcpy(v41, v42, *(void *)(*(void *)(v46 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v45 + 40))(v41, v42, v30);
LABEL_25:
  v47 = a3[13];
  v48 = (char *)a1 + v47;
  v49 = (char *)a2 + v47;
  v50 = sub_1E0996490();
  v51 = __swift_getEnumTagSinglePayload((uint64_t)v48, 1, v50);
  v52 = __swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50);
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
      __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  v53 = *(void *)(v50 - 8);
  if (v52)
  {
    (*(void (**)(char *, uint64_t))(v53 + 8))(v48, v50);
LABEL_30:
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0338);
    memcpy(v48, v49, *(void *)(*(void *)(v54 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v53 + 40))(v48, v49, v50);
LABEL_31:
  v55 = a3[14];
  v56 = (char *)a1 + v55;
  v57 = (char *)a2 + v55;
  v58 = sub_1E0992360();
  v59 = __swift_getEnumTagSinglePayload((uint64_t)v56, 1, v58);
  v60 = __swift_getEnumTagSinglePayload((uint64_t)v57, 1, v58);
  if (!v59)
  {
    v61 = *(void *)(v58 - 8);
    if (!v60)
    {
      (*(void (**)(char *, char *, uint64_t))(v61 + 40))(v56, v57, v58);
      goto LABEL_37;
    }
    (*(void (**)(char *, uint64_t))(v61 + 8))(v56, v58);
    goto LABEL_36;
  }
  if (v60)
  {
LABEL_36:
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v56, v57, *(void *)(*(void *)(v62 - 8) + 64));
    goto LABEL_37;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v58 - 8) + 32))(v56, v57, v58);
  __swift_storeEnumTagSinglePayload((uint64_t)v56, 0, 1, v58);
LABEL_37:
  v63 = a3[15];
  v64 = (void *)((char *)a1 + v63);
  v65 = (void *)((char *)a2 + v63);
  v67 = *v65;
  v66 = v65[1];
  *v64 = v67;
  v64[1] = v66;
  swift_bridgeObjectRelease();
  v68 = a3[16];
  v69 = (void *)((char *)a1 + v68);
  v70 = (void *)((char *)a2 + v68);
  v72 = *v70;
  v71 = v70[1];
  *v69 = v72;
  v69[1] = v71;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudUploadedAudio.Attributes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E095FA7C);
}

uint64_t sub_1E095FA7C(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 2147483646)
  {
    OUTLINED_FUNCTION_118();
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = a3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v14 + 84) == a2)
      {
        uint64_t v11 = v13;
        uint64_t v12 = a3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v16 + 84) == a2)
        {
          uint64_t v11 = v15;
          uint64_t v12 = a3[9];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0338);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v18 + 84) == a2)
          {
            uint64_t v11 = v17;
            uint64_t v12 = a3[13];
          }
          else
          {
            uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
            uint64_t v12 = a3[14];
          }
        }
      }
    }
    return __swift_getEnumTagSinglePayload(a1 + v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for CloudUploadedAudio.Attributes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E095FBBC);
}

void sub_1E095FBBC()
{
  OUTLINED_FUNCTION_117();
  if (v2 == 2147483646)
  {
    *(void *)(v1 + 8) = v0;
  }
  else
  {
    int v4 = v3;
    int v5 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v7 + 84) == v5)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v4[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v11 + 84) == v5)
      {
        uint64_t v8 = v10;
        uint64_t v9 = v4[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v13 + 84) == v5)
        {
          uint64_t v8 = v12;
          uint64_t v9 = v4[9];
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0338);
          OUTLINED_FUNCTION_0();
          if (*(_DWORD *)(v15 + 84) == v5)
          {
            uint64_t v8 = v14;
            uint64_t v9 = v4[13];
          }
          else
          {
            uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
            uint64_t v9 = v4[14];
          }
        }
      }
    }
    __swift_storeEnumTagSinglePayload(v1 + v9, v0, v0, v8);
  }
}

void sub_1E095FCE0()
{
  sub_1E02F0060(319, (unint64_t *)&qword_1EBEF0168, &qword_1EBEEFC50);
  if (v0 <= 0x3F)
  {
    sub_1E02F0060(319, &qword_1EBEF0128, &qword_1EBEF0120);
    if (v1 <= 0x3F)
    {
      sub_1E02F0060(319, (unint64_t *)&qword_1EBEF0148, &qword_1EBEF0140);
      if (v2 <= 0x3F)
      {
        sub_1E095FEF4(319, &qword_1EBEF1E98, MEMORY[0x1E4F36F78]);
        if (v3 <= 0x3F)
        {
          sub_1E095FEF4(319, (unint64_t *)&qword_1EBEFA5C8, MEMORY[0x1E4F276F0]);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_1E095FEF4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1E099A8E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for CloudUploadedAudio.Relationships(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E095FF5C);
}

uint64_t sub_1E095FF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_117();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6B88);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == v3)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v4;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF9680);
    uint64_t v9 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v9, v3, v8);
}

uint64_t storeEnumTagSinglePayload for CloudUploadedAudio.Relationships(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E095FFF0);
}

uint64_t sub_1E095FFF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  OUTLINED_FUNCTION_117();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6B88);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_87_12();
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF9680);
    uint64_t v9 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v9, v4, v4, v10);
}

unsigned char *storeEnumTagSinglePayload for CloudUploadedAudio.Relationships.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *result = a2 + 1;
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
        JUMPOUT(0x1E0960140);
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
          *result = a2 + 1;
        break;
    }
  }
  return result;
}

void type metadata accessor for CloudUploadedAudio.Relationships.CodingKeys()
{
}

void type metadata accessor for CloudUploadedAudio.Associations()
{
}

void type metadata accessor for CloudUploadedAudio.Metadata()
{
}

ValueMetadata *type metadata accessor for CloudUploadedAudio.Metadata.CodingKeys()
{
  return &type metadata for CloudUploadedAudio.Metadata.CodingKeys;
}

ValueMetadata *type metadata accessor for CloudUploadedAudio.Associations.CodingKeys()
{
  return &type metadata for CloudUploadedAudio.Associations.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CloudUploadedAudio.Attributes.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *result = a2 + 12;
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
        JUMPOUT(0x1E0960278);
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
          *result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudUploadedAudio.Attributes.CodingKeys()
{
  return &type metadata for CloudUploadedAudio.Attributes.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CloudUploadedAudio.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *result = a2 + 4;
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
        JUMPOUT(0x1E096037CLL);
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
          *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudUploadedAudio.CodingKeys()
{
  return &type metadata for CloudUploadedAudio.CodingKeys;
}

unint64_t sub_1E09603B8()
{
  unint64_t result = qword_1EACF3FA0;
  if (!qword_1EACF3FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FA0);
  }
  return result;
}

unint64_t sub_1E0960408()
{
  unint64_t result = qword_1EACF3FA8;
  if (!qword_1EACF3FA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FA8);
  }
  return result;
}

unint64_t sub_1E0960458()
{
  unint64_t result = qword_1EACF3FB0;
  if (!qword_1EACF3FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FB0);
  }
  return result;
}

unint64_t sub_1E09604A8()
{
  unint64_t result = qword_1EACF3FB8;
  if (!qword_1EACF3FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FB8);
  }
  return result;
}

unint64_t sub_1E09604F8()
{
  unint64_t result = qword_1EACF3FC0;
  if (!qword_1EACF3FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FC0);
  }
  return result;
}

unint64_t sub_1E0960548()
{
  unint64_t result = qword_1EACF3FC8;
  if (!qword_1EACF3FC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FC8);
  }
  return result;
}

unint64_t sub_1E0960598()
{
  unint64_t result = qword_1EACF3FD0;
  if (!qword_1EACF3FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FD0);
  }
  return result;
}

unint64_t sub_1E09605E8()
{
  unint64_t result = qword_1EACF3FD8;
  if (!qword_1EACF3FD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FD8);
  }
  return result;
}

unint64_t sub_1E0960638()
{
  unint64_t result = qword_1EACF3FE0;
  if (!qword_1EACF3FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FE0);
  }
  return result;
}

unint64_t sub_1E0960688()
{
  unint64_t result = qword_1EACF3FE8;
  if (!qword_1EACF3FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF3FE8);
  }
  return result;
}

_UNKNOWN **sub_1E09606D8()
{
  return &off_1F3B6D608;
}

uint64_t *sub_1E09606E4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v14 = a3[7];
    *(uint64_t *)((char *)a1 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)a1 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v15 = a3[9];
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = a3[11];
    *(uint64_t *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(uint64_t *)((char *)a1 + v19) = *(uint64_t *)((char *)a2 + v19);
    uint64_t v20 = a3[13];
    *(uint64_t *)((char *)a1 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    *(uint64_t *)((char *)a1 + v20) = *(uint64_t *)((char *)a2 + v20);
    uint64_t v21 = a3[14];
    uint64_t v22 = a3[15];
    v23 = (uint64_t *)((char *)a1 + v21);
    v24 = (uint64_t *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    void *v23 = *v24;
    v23[1] = v25;
    v26 = (uint64_t *)((char *)a1 + v22);
    v27 = (uint64_t *)((char *)a2 + v22);
    uint64_t v28 = v27[1];
    void *v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[16];
    uint64_t v30 = a3[17];
    v31 = (uint64_t *)((char *)a1 + v29);
    v32 = (uint64_t *)((char *)a2 + v29);
    uint64_t v33 = v32[1];
    void *v31 = *v32;
    v31[1] = v33;
    v34 = (char *)a1 + v30;
    v35 = (char *)a2 + v30;
    *(void *)v34 = *(void *)v35;
    uint64_t v36 = a3[18];
    __dst = (char *)a1 + v36;
    v37 = (char *)a2 + v36;
    v34[8] = v35[8];
    uint64_t v38 = sub_1E0992360();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
      memcpy(__dst, v37, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(__dst, v37, v38);
      __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v38);
    }
  }
  return a1;
}

uint64_t sub_1E09609F8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 72);
  uint64_t v7 = sub_1E0992360();
  uint64_t result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v9(v6, v7);
  }
  return result;
}

void *sub_1E0960B90(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  uint64_t v13 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  uint64_t v18 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  uint64_t v19 = a3[14];
  uint64_t v20 = a3[15];
  uint64_t v21 = (void *)((char *)a1 + v19);
  uint64_t v22 = (void *)((char *)a2 + v19);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  v24 = (void *)((char *)a1 + v20);
  uint64_t v25 = (void *)((char *)a2 + v20);
  uint64_t v26 = v25[1];
  void *v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = a3[16];
  uint64_t v28 = a3[17];
  uint64_t v29 = (void *)((char *)a1 + v27);
  uint64_t v30 = (void *)((char *)a2 + v27);
  uint64_t v31 = v30[1];
  *uint64_t v29 = *v30;
  v29[1] = v31;
  v32 = (char *)a1 + v28;
  uint64_t v33 = (char *)a2 + v28;
  *(void *)v32 = *(void *)v33;
  uint64_t v34 = a3[18];
  __dst = (char *)a1 + v34;
  v35 = (char *)a2 + v34;
  v32[8] = v33[8];
  uint64_t v36 = sub_1E0992360();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(__dst, v35, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(__dst, v35, v36);
    __swift_storeEnumTagSinglePayload((uint64_t)__dst, 0, 1, v36);
  }
  return a1;
}

void *sub_1E0960E54(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[14];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[15];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[16];
  v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (void *)((char *)a2 + v23);
  void *v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[17];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = *(void *)v28;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = v29;
  uint64_t v30 = a3[18];
  uint64_t v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  uint64_t v33 = sub_1E0992360();
  int v34 = __swift_getEnumTagSinglePayload((uint64_t)v31, 1, v33);
  int v35 = __swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33);
  if (!v34)
  {
    uint64_t v36 = *(void *)(v33 - 8);
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 24))(v31, v32, v33);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v36 + 8))(v31, v33);
    goto LABEL_12;
  }
  if (v35)
  {
LABEL_12:
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v31, v32, *(void *)(*(void *)(v37 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
  __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
  return a1;
}

_OWORD *sub_1E0961294(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  uint64_t v12 = a3[9];
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  uint64_t v13 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  uint64_t v14 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  uint64_t v15 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  *(_OWORD *)((char *)a1 + v15) = *(_OWORD *)((char *)a2 + v15);
  uint64_t v16 = a3[17];
  *(_OWORD *)((char *)a1 + a3[16]) = *(_OWORD *)((char *)a2 + a3[16]);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  uint64_t v19 = a3[18];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  v17[8] = v18[8];
  uint64_t v22 = sub_1E0992360();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v20, v21, v22);
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
  }
  return a1;
}

void *sub_1E09614AC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v8, v9, v10);
LABEL_7:
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[14];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  *uint64_t v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[15];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  void *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[16];
  uint64_t v31 = (void *)((char *)a1 + v30);
  v32 = (void *)((char *)a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  void *v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[17];
  uint64_t v36 = a3[18];
  uint64_t v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  *(void *)uint64_t v37 = *(void *)v38;
  v37[8] = v38[8];
  uint64_t v39 = (char *)a1 + v36;
  v40 = (char *)a2 + v36;
  uint64_t v41 = sub_1E0992360();
  int v42 = __swift_getEnumTagSinglePayload((uint64_t)v39, 1, v41);
  int v43 = __swift_getEnumTagSinglePayload((uint64_t)v40, 1, v41);
  if (!v42)
  {
    uint64_t v44 = *(void *)(v41 - 8);
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v44 + 40))(v39, v40, v41);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v44 + 8))(v39, v41);
    goto LABEL_12;
  }
  if (v43)
  {
LABEL_12:
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v39, v40, *(void *)(*(void *)(v45 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 32))(v39, v40, v41);
  __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v41);
  return a1;
}

uint64_t sub_1E0961860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0961874);
}

uint64_t sub_1E0961874(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[5];
LABEL_8:
    return __swift_getEnumTagSinglePayload(a1 + v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    uint64_t v9 = a3[18];
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + a3[14] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_1E0961930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0961944);
}

void sub_1E0961944(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a4[5];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[14] + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    uint64_t v11 = a4[18];
  }
  __swift_storeEnumTagSinglePayload(a1 + v11, a2, a2, v10);
}

uint64_t type metadata accessor for StorePlatformTVSeason()
{
  uint64_t result = qword_1EBEEFEB0;
  if (!qword_1EBEEFEB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E0961A44()
{
  sub_1E048DC5C();
  if (v0 <= 0x3F)
  {
    sub_1E03F7108();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_1E0961B48()
{
  return sub_1E09645C0((uint64_t)&unk_1EACF3FF0);
}

uint64_t sub_1E0961B90(void *a1, void *a2)
{
  uint64_t v4 = sub_1E0992360();
  OUTLINED_FUNCTION_2_4();
  uint64_t v108 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  uint64_t v107 = v7;
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE5F48);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_32();
  uint64_t v113 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  uint64_t v11 = OUTLINED_FUNCTION_13(v10);
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v110 = (uint64_t)&v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v111 = (uint64_t)&v105 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v112 = (uint64_t)&v105 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  OUTLINED_FUNCTION_2_4();
  uint64_t v114 = v18;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_22();
  uint64_t v22 = v21 - v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE7C10);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_22();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
  uint64_t v29 = OUTLINED_FUNCTION_13(v28);
  uint64_t v30 = MEMORY[0x1F4188790](v29);
  v32 = (char *)&v105 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x1F4188790](v30);
  uint64_t v35 = (char *)&v105 - v34;
  MEMORY[0x1F4188790](v33);
  uint64_t v37 = (char *)&v105 - v36;
  v115 = a1;
  v116 = a2;
  uint64_t v38 = a1[1];
  uint64_t v39 = a2[1];
  if (!v38)
  {
    v40 = v115;
    if (v39) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v39) {
    return 0;
  }
  v40 = v115;
  BOOL v41 = *v115 == *v116 && v38 == v39;
  if (v41 || (sub_1E099AF80(), uint64_t result = OUTLINED_FUNCTION_154_0(), (v43 & 1) != 0))
  {
LABEL_10:
    uint64_t v106 = v4;
    uint64_t v44 = (int *)type metadata accessor for StorePlatformTVSeason();
    uint64_t v45 = &qword_1EBEEFC58;
    sub_1E02B8160((uint64_t)v40 + v44[5], (uint64_t)v37, &qword_1EBEEFC58);
    sub_1E02B8160((uint64_t)v116 + v44[5], (uint64_t)v35, &qword_1EBEEFC58);
    uint64_t v46 = v27 + *(int *)(v23 + 48);
    sub_1E02B8160((uint64_t)v37, v27, &qword_1EBEEFC58);
    sub_1E02B8160((uint64_t)v35, v46, &qword_1EBEEFC58);
    OUTLINED_FUNCTION_13_0(v27, 1, v17);
    if (v41)
    {
      sub_1E02B81BC((uint64_t)v35, &qword_1EBEEFC58);
      sub_1E02B81BC((uint64_t)v37, &qword_1EBEEFC58);
      OUTLINED_FUNCTION_13_0(v46, 1, v17);
      if (v41)
      {
        sub_1E02B81BC(v27, &qword_1EBEEFC58);
LABEL_23:
        OUTLINED_FUNCTION_11_75();
        if (v27)
        {
          if (!v17) {
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1E02FD964();
          OUTLINED_FUNCTION_22_48();
          swift_bridgeObjectRelease();
          if ((v45 & 1) == 0) {
            return 0;
          }
        }
        else if (v17)
        {
          return 0;
        }
        uint64_t v53 = v44[7];
        uint64_t v54 = *(void *)((char *)v116 + v53);
        if (*(void *)((char *)v40 + v53))
        {
          if (!v54 || (sub_1E02D7160() & 1) == 0) {
            return 0;
          }
        }
        else if (v54)
        {
          return 0;
        }
        OUTLINED_FUNCTION_11_75();
        if (v27)
        {
          if (!v17) {
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1E02FCFE4();
          OUTLINED_FUNCTION_22_48();
          swift_bridgeObjectRelease();
          if ((v45 & 1) == 0) {
            return 0;
          }
        }
        else if (v17)
        {
          return 0;
        }
        OUTLINED_FUNCTION_15_62();
        if (v57)
        {
          if (!v55) {
            return 0;
          }
          OUTLINED_FUNCTION_19_0(v56);
          if (!v41 || v58 != v59)
          {
            sub_1E099AF80();
            uint64_t result = OUTLINED_FUNCTION_154_0();
            if ((v61 & 1) == 0) {
              return result;
            }
          }
        }
        else if (v55)
        {
          return 0;
        }
        OUTLINED_FUNCTION_11_75();
        if (v27)
        {
          if (!v17) {
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1E02FC48C();
          OUTLINED_FUNCTION_22_48();
          swift_bridgeObjectRelease();
          if ((v45 & 1) == 0) {
            return 0;
          }
        }
        else if (v17)
        {
          return 0;
        }
        OUTLINED_FUNCTION_11_75();
        if (v27)
        {
          if (!v17) {
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1E02FC4BC();
          OUTLINED_FUNCTION_22_48();
          swift_bridgeObjectRelease();
          if ((v45 & 1) == 0) {
            return 0;
          }
        }
        else if (v17)
        {
          return 0;
        }
        uint64_t v62 = v44[12];
        v63 = *(void **)((char *)v40 + v62);
        v64 = *(void **)((char *)v116 + v62);
        if (v63)
        {
          if (!v64) {
            return 0;
          }
          sub_1E02D579C(v63, v64);
          if ((v65 & 1) == 0) {
            return 0;
          }
        }
        else if (v64)
        {
          return 0;
        }
        OUTLINED_FUNCTION_11_75();
        if (v27)
        {
          if (!v17) {
            return 0;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1E02D60E8();
          OUTLINED_FUNCTION_22_48();
          swift_bridgeObjectRelease();
          if ((v45 & 1) == 0) {
            return 0;
          }
        }
        else if (v17)
        {
          return 0;
        }
        uint64_t v66 = v44[14];
        uint64_t v67 = *(void *)((char *)v115 + v66);
        uint64_t v68 = *(void *)((char *)v115 + v66 + 8);
        v69 = (void *)((char *)v116 + v66);
        if (v67 != *v69 || v68 != v69[1])
        {
          sub_1E099AF80();
          uint64_t result = OUTLINED_FUNCTION_154_0();
          if ((v71 & 1) == 0) {
            return result;
          }
        }
        OUTLINED_FUNCTION_15_62();
        if (v74)
        {
          if (!v72) {
            return 0;
          }
          OUTLINED_FUNCTION_19_0(v73);
          if (!v41 || v75 != v76)
          {
            sub_1E099AF80();
            uint64_t result = OUTLINED_FUNCTION_154_0();
            if ((v78 & 1) == 0) {
              return result;
            }
          }
        }
        else if (v72)
        {
          return 0;
        }
        OUTLINED_FUNCTION_15_62();
        if (v81)
        {
          if (!v79) {
            return 0;
          }
          OUTLINED_FUNCTION_19_0(v80);
          BOOL v84 = v41 && v82 == v83;
          v85 = v115;
          v86 = v44;
          if (!v84)
          {
            sub_1E099AF80();
            uint64_t result = OUTLINED_FUNCTION_154_0();
            if ((v87 & 1) == 0) {
              return result;
            }
          }
        }
        else
        {
          v85 = v115;
          v86 = v44;
          if (v79) {
            return 0;
          }
        }
        uint64_t v88 = v86[17];
        v89 = (void *)((char *)v85 + v88);
        char v90 = *((unsigned char *)v85 + v88 + 8);
        v91 = (void *)((char *)v116 + v88);
        int v92 = *((unsigned __int8 *)v116 + v88 + 8);
        if (v90)
        {
          if (!v92) {
            return 0;
          }
        }
        else
        {
          if (*v89 != *v91) {
            LOBYTE(v92) = 1;
          }
          if (v92) {
            return 0;
          }
        }
        uint64_t v93 = v112;
        sub_1E02B8160((uint64_t)v115 + v44[18], v112, &qword_1EBEFA5C0);
        uint64_t v94 = v111;
        sub_1E02B8160((uint64_t)v116 + v44[18], v111, &qword_1EBEFA5C0);
        uint64_t v95 = v113;
        uint64_t v96 = v113 + *(int *)(v109 + 48);
        sub_1E02B8160(v93, v113, &qword_1EBEFA5C0);
        sub_1E02B8160(v94, v96, &qword_1EBEFA5C0);
        OUTLINED_FUNCTION_13_0(v95, 1, v106);
        if (v41)
        {
          sub_1E02B81BC(v111, &qword_1EBEFA5C0);
          sub_1E02B81BC(v112, &qword_1EBEFA5C0);
          OUTLINED_FUNCTION_13_0(v96, 1, v106);
          if (v41)
          {
            sub_1E02B81BC(v113, &qword_1EBEFA5C0);
            return 1;
          }
        }
        else
        {
          sub_1E02B8160(v113, v110, &qword_1EBEFA5C0);
          OUTLINED_FUNCTION_13_0(v96, 1, v106);
          if (!v97)
          {
            uint64_t v99 = v107;
            uint64_t v98 = v108;
            uint64_t v100 = v106;
            OUTLINED_FUNCTION_35();
            v101();
            sub_1E09645C0((uint64_t)&qword_1EACE5F58);
            uint64_t v102 = v110;
            char v103 = sub_1E099A040();
            v104 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
            v104(v99, v100);
            sub_1E02B81BC(v111, &qword_1EBEFA5C0);
            sub_1E02B81BC(v112, &qword_1EBEFA5C0);
            v104(v102, v100);
            sub_1E02B81BC(v113, &qword_1EBEFA5C0);
            return (v103 & 1) != 0;
          }
          sub_1E02B81BC(v111, &qword_1EBEFA5C0);
          sub_1E02B81BC(v112, &qword_1EBEFA5C0);
          (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v110, v106);
        }
        v48 = &qword_1EACE5F48;
        uint64_t v49 = v113;
LABEL_19:
        sub_1E02B81BC(v49, v48);
        return 0;
      }
    }
    else
    {
      sub_1E02B8160(v27, (uint64_t)v32, &qword_1EBEEFC58);
      OUTLINED_FUNCTION_13_0(v46, 1, v17);
      if (!v47)
      {
        v105 = v44;
        uint64_t v50 = v114;
        OUTLINED_FUNCTION_35();
        v51();
        sub_1E09644F4((uint64_t)&qword_1EACE72A0);
        LOBYTE(v45) = sub_1E099A040();
        v52 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
        v52(v22, v17);
        sub_1E02B81BC((uint64_t)v35, &qword_1EBEEFC58);
        sub_1E02B81BC((uint64_t)v37, &qword_1EBEEFC58);
        v52((uint64_t)v32, v17);
        uint64_t v44 = v105;
        sub_1E02B81BC(v27, &qword_1EBEEFC58);
        if ((v45 & 1) == 0) {
          return 0;
        }
        goto LABEL_23;
      }
      sub_1E02B81BC((uint64_t)v35, &qword_1EBEEFC58);
      sub_1E02B81BC((uint64_t)v37, &qword_1EBEEFC58);
      (*(void (**)(char *, uint64_t))(v114 + 8))(v32, v17);
    }
    v48 = &qword_1EACE7C10;
    uint64_t v49 = v27;
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_1E096253C()
{
  uint64_t v2 = sub_1E0992360();
  OUTLINED_FUNCTION_2_4();
  uint64_t v25 = v3;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_106_0(v5, v23);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  uint64_t v7 = OUTLINED_FUNCTION_13(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_32();
  uint64_t v26 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  OUTLINED_FUNCTION_2_4();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_16_0();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
  uint64_t v14 = OUTLINED_FUNCTION_13(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_22();
  uint64_t v17 = v16 - v15;
  if (*(void *)(v0 + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E099A100();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  uint64_t v18 = (int *)type metadata accessor for StorePlatformTVSeason();
  sub_1E02B8160(v0 + v18[5], v17, &qword_1EBEEFC58);
  OUTLINED_FUNCTION_13_0(v17, 1, v9);
  if (v19)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v20();
    OUTLINED_FUNCTION_6();
    sub_1E09644F4((uint64_t)&qword_1EACE7258);
    sub_1E099A000();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v9);
  }
  if (*(void *)(v0 + v18[6]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E0303A94();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[7]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E02DF4C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[8]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E0302E30();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[9] + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_26_60();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[10]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E03022A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[11]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E0302278();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[12]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E02DF560();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[13]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_24_49();
    sub_1E02E07F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  swift_bridgeObjectRetain();
  sub_1E099A100();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v18[15] + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_26_60();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(void *)(v0 + v18[16] + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_26_60();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (*(unsigned char *)(v0 + v18[17] + 8) == 1)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_6();
    sub_1E099B0A0();
  }
  sub_1E02B8160(v0 + v18[18], v26, &qword_1EBEFA5C0);
  OUTLINED_FUNCTION_13_0(v26, 1, v2);
  if (v19) {
    return OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_35();
  v21();
  OUTLINED_FUNCTION_6();
  sub_1E09645C0((uint64_t)&unk_1EACE5F70);
  sub_1E099A000();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v2);
}

uint64_t sub_1E0962A84(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x614E747369747261 && a2 == 0xEA0000000000656DLL;
  if (v2 || (sub_1E099AF80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6B726F77747261 && a2 == 0xE700000000000000;
    if (v6 || (sub_1E099AF80() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6572646C696863 && a2 == 0xE800000000000000;
      if (v7 || (sub_1E099AF80() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6E6572646C696863 && a2 == 0xEB00000000736449;
        if (v8 || (sub_1E099AF80() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000016 && a2 == 0x80000001E09E4DA0 || (sub_1E099AF80() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x6867697279706F63 && a2 == 0xE900000000000074;
          if (v9 || (sub_1E099AF80() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x80000001E09E4840 || (sub_1E099AF80() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            BOOL v10 = a1 == 0x6169726F74696465 && a2 == 0xEE006F656469566CLL;
            if (v10 || (sub_1E099AF80() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              BOOL v11 = a1 == 0x6D614E65726E6567 && a2 == 0xEA00000000007365;
              if (v11 || (sub_1E099AF80() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 8;
              }
              else
              {
                BOOL v12 = a1 == 0x7365726E6567 && a2 == 0xE600000000000000;
                if (v12 || (sub_1E099AF80() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else
                {
                  BOOL v13 = a1 == 25705 && a2 == 0xE200000000000000;
                  if (v13 || (sub_1E099AF80() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 10;
                  }
                  else
                  {
                    BOOL v14 = a1 == 1701667182 && a2 == 0xE400000000000000;
                    if (v14 || (sub_1E099AF80() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 11;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x44657361656C6572 && a2 == 0xEB00000000657461;
                      if (v15 || (sub_1E099AF80() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 12;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x756F436B63617274 && a2 == 0xEA0000000000746ELL;
                        if (v16 || (sub_1E099AF80() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 13;
                        }
                        else if (a1 == 7107189 && a2 == 0xE300000000000000)
                        {
                          swift_bridgeObjectRelease();
                          return 14;
                        }
                        else
                        {
                          char v18 = sub_1E099AF80();
                          swift_bridgeObjectRelease();
                          if (v18) {
                            return 14;
                          }
                          else {
                            return 15;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

unint64_t sub_1E0963060(char a1)
{
  unint64_t result = 0x614E747369747261;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6B726F77747261;
      break;
    case 2:
    case 3:
      unint64_t result = 0x6E6572646C696863;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0x6867697279706F63;
      break;
    case 6:
      unint64_t result = 0xD000000000000010;
      break;
    case 7:
      unint64_t result = 0x6169726F74696465;
      break;
    case 8:
      unint64_t result = 0x6D614E65726E6567;
      break;
    case 9:
      unint64_t result = 0x7365726E6567;
      break;
    case 10:
      unint64_t result = 25705;
      break;
    case 11:
      unint64_t result = 1701667182;
      break;
    case 12:
      unint64_t result = 0x44657361656C6572;
      break;
    case 13:
      unint64_t result = 0x756F436B63617274;
      break;
    case 14:
      unint64_t result = 7107189;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0963228(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4020);
  OUTLINED_FUNCTION_2_4();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_22();
  uint64_t v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E09640E8();
  sub_1E099B180();
  OUTLINED_FUNCTION_9_72();
  if (!v1)
  {
    BOOL v10 = (int *)type metadata accessor for StorePlatformTVSeason();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
    sub_1E09642A0((uint64_t)&qword_1EACE7C68);
    OUTLINED_FUNCTION_28_50();
    sub_1E099AE80();
    OUTLINED_FUNCTION_35_2(v10[6]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4008);
    sub_1E096435C();
    OUTLINED_FUNCTION_8_65();
    OUTLINED_FUNCTION_35_2(v10[7]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB350);
    sub_1E0964408((uint64_t)&qword_1EACEB378);
    OUTLINED_FUNCTION_8_65();
    OUTLINED_FUNCTION_35_2(v10[8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE7C70);
    sub_1E0350C54();
    OUTLINED_FUNCTION_8_65();
    OUTLINED_FUNCTION_9_72();
    OUTLINED_FUNCTION_35_2(v10[10]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2388);
    sub_1E03A3084();
    OUTLINED_FUNCTION_8_65();
    OUTLINED_FUNCTION_35_2(v10[11]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2378);
    sub_1E03A3254();
    OUTLINED_FUNCTION_8_65();
    OUTLINED_FUNCTION_35_2(v10[12]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF9718);
    sub_1E0351640((uint64_t)&qword_1EACE7CD0);
    OUTLINED_FUNCTION_8_65();
    OUTLINED_FUNCTION_35_2(v10[13]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE9198);
    sub_1E0964474((uint64_t)&qword_1EACE91D0);
    OUTLINED_FUNCTION_8_65();
    sub_1E0351E98();
    sub_1E099AEE0();
    OUTLINED_FUNCTION_9_72();
    OUTLINED_FUNCTION_9_72();
    sub_1E099AE70();
    sub_1E0992360();
    sub_1E09645C0((uint64_t)&qword_1EACE7D00);
    OUTLINED_FUNCTION_28_50();
    sub_1E099AE80();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

uint64_t sub_1E09636AC()
{
  return sub_1E099B0E0();
}

uint64_t sub_1E09636EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  uint64_t v7 = OUTLINED_FUNCTION_13(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_22();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
  uint64_t v12 = OUTLINED_FUNCTION_13(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF3FF8);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_22();
  uint64_t v34 = (int *)type metadata accessor for StorePlatformTVSeason();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_106_0(v15, v33);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1E09640E8();
  sub_1E099B140();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t *v35 = sub_1E099AD50();
  v35[1] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
  LOBYTE(v36) = 1;
  sub_1E09642A0((uint64_t)&qword_1EBEF0160);
  sub_1E099AD90();
  sub_1E02F8890(v3, (uint64_t)v35 + v34[5], &qword_1EBEEFC58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4008);
  sub_1E0964134();
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[6]) = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB350);
  sub_1E0964408((uint64_t)&qword_1EACEB358);
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[7]) = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE7C70);
  sub_1E0351238();
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[8]) = v36;
  LOBYTE(v36) = 5;
  uint64_t v17 = sub_1E099AD50();
  char v18 = (uint64_t *)((char *)v35 + v34[9]);
  *char v18 = v17;
  v18[1] = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2388);
  sub_1E03A3634();
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[10]) = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2378);
  sub_1E03A3804();
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[11]) = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF9718);
  sub_1E0351640((uint64_t)&qword_1EBEF9720);
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[12]) = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE9198);
  sub_1E0964474((uint64_t)&qword_1EACE91A0);
  OUTLINED_FUNCTION_1_99();
  *(uint64_t *)((char *)v35 + v34[13]) = v36;
  sub_1E0351F7C();
  sub_1E099ADF0();
  uint64_t v20 = (uint64_t *)((char *)v35 + v34[14]);
  *uint64_t v20 = v36;
  v20[1] = v37;
  uint64_t v21 = OUTLINED_FUNCTION_30_41(11);
  uint64_t v22 = (uint64_t *)((char *)v35 + v34[15]);
  *uint64_t v22 = v21;
  v22[1] = v23;
  uint64_t v24 = OUTLINED_FUNCTION_30_41(12);
  uint64_t v25 = (uint64_t *)((char *)v35 + v34[16]);
  *uint64_t v25 = v24;
  v25[1] = v26;
  uint64_t v27 = sub_1E099AD80();
  uint64_t v28 = (char *)v35 + v34[17];
  *(void *)uint64_t v28 = v27;
  v28[8] = v29 & 1;
  sub_1E0992360();
  sub_1E09645C0((uint64_t)&qword_1EBEEFCE0);
  sub_1E099AD90();
  uint64_t v30 = OUTLINED_FUNCTION_15_2();
  v31(v30);
  sub_1E02F8890(v10, (uint64_t)v35 + v34[18], &qword_1EBEFA5C0);
  sub_1E09641E0((uint64_t)v35, a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_1E0964244((uint64_t)v35);
}

unint64_t sub_1E0963FC8()
{
  return sub_1E0963060(*v0);
}

uint64_t sub_1E0963FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E0962A84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E0963FF8(uint64_t a1)
{
  unint64_t v2 = sub_1E09640E8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0964034(uint64_t a1)
{
  unint64_t v2 = sub_1E09640E8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0964070@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E09636EC(a1, a2);
}

uint64_t sub_1E0964088(void *a1)
{
  return sub_1E0963228(a1);
}

uint64_t sub_1E09640AC()
{
  return sub_1E099B0E0();
}

unint64_t sub_1E09640E8()
{
  unint64_t result = qword_1EACF4000;
  if (!qword_1EACF4000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4000);
  }
  return result;
}

unint64_t sub_1E0964134()
{
  unint64_t result = qword_1EACF4010;
  if (!qword_1EACF4010)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EACF4008);
    sub_1E09645C0((uint64_t)&unk_1EACF4018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4010);
  }
  return result;
}

uint64_t sub_1E09641E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for StorePlatformTVSeason();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E0964244(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for StorePlatformTVSeason();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E09642A0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEEFC50);
    sub_1E09645C0((uint64_t)&qword_1EBEF00E0);
    sub_1E09645C0((uint64_t)&qword_1EBEF00D8);
    unint64_t result = OUTLINED_FUNCTION_49_10();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1E096435C()
{
  unint64_t result = qword_1EACF4028;
  if (!qword_1EACF4028)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EACF4008);
    sub_1E09645C0((uint64_t)&unk_1EACF4030);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4028);
  }
  return result;
}

unint64_t sub_1E0964408(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EACEB350);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1E0964474(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EACE9198);
    sub_1E09645C0(v4);
    unint64_t result = OUTLINED_FUNCTION_32_0();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1E09644F4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEEFC50);
    sub_1E09645C0(v4);
    unint64_t result = OUTLINED_FUNCTION_32_0();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_1E0964574()
{
  uint64_t v0 = sub_1E0995B70();
  __swift_allocate_value_buffer(v0, qword_1EAD612D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAD612D8);
  return sub_1E0995B50();
}

unint64_t sub_1E09645C0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for StorePlatformTVSeason.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x1E09646D0);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StorePlatformTVSeason.CodingKeys()
{
  return &type metadata for StorePlatformTVSeason.CodingKeys;
}

unint64_t sub_1E096470C()
{
  unint64_t result = qword_1EACF4038;
  if (!qword_1EACF4038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4038);
  }
  return result;
}

unint64_t sub_1E096475C()
{
  unint64_t result = qword_1EACF4040;
  if (!qword_1EACF4040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4040);
  }
  return result;
}

unint64_t sub_1E09647AC()
{
  unint64_t result = qword_1EACF4048;
  if (!qword_1EACF4048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4048);
  }
  return result;
}

uint64_t *sub_1E09647F8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1E0992430();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    uint64_t v10 = a3[5];
    uint64_t v11 = a3[6];
    uint64_t v12 = (uint64_t *)((char *)a1 + v10);
    uint64_t v13 = (uint64_t *)((char *)a2 + v10);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = (char *)a1 + v11;
    uint64_t v16 = (char *)a2 + v11;
    swift_bridgeObjectRetain();
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
    }
    uint64_t v19 = a3[7];
    uint64_t v20 = (char *)a1 + v19;
    uint64_t v21 = (char *)a2 + v19;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
      memcpy(v20, v21, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
    }
    uint64_t v24 = a3[9];
    *(uint64_t *)((char *)a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = sub_1E0993600();
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
    swift_bridgeObjectRetain();
    v28(v25, v26, v27);
    uint64_t v29 = a3[10];
    uint64_t v30 = (char *)a1 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = sub_1E0995B70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    uint64_t v33 = a3[11];
    uint64_t v34 = a3[12];
    uint64_t v35 = (uint64_t *)((char *)a1 + v33);
    uint64_t v36 = (uint64_t *)((char *)a2 + v33);
    uint64_t v37 = v36[1];
    void *v35 = *v36;
    v35[1] = v37;
    *(uint64_t *)((char *)a1 + v34) = *(uint64_t *)((char *)a2 + v34);
    uint64_t v38 = a3[14];
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)a1 + v38) = *(uint64_t *)((char *)a2 + v38);
    *(uint64_t *)((char *)a1 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1E0964B94(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_1E0992430();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[9];
  uint64_t v10 = sub_1E0993600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[10];
  uint64_t v12 = sub_1E0995B70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_1E0964DB0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1E0992430();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  uint64_t v12 = *((void *)v11 + 1);
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = v12;
  uint64_t v13 = &a1[v9];
  uint64_t v14 = &a2[v9];
  swift_bridgeObjectRetain();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  }
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
    memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  uint64_t v22 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = sub_1E0993600();
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
  swift_bridgeObjectRetain();
  v26(v23, v24, v25);
  uint64_t v27 = a3[10];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  uint64_t v30 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  uint64_t v31 = a3[11];
  uint64_t v32 = a3[12];
  uint64_t v33 = &a1[v31];
  uint64_t v34 = &a2[v31];
  uint64_t v35 = *((void *)v34 + 1);
  *(void *)uint64_t v33 = *(void *)v34;
  *((void *)v33 + 1) = v35;
  *(void *)&a1[v32] = *(void *)&a2[v32];
  uint64_t v36 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(void *)&a1[v36] = *(void *)&a2[v36];
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_1E09650FC(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1E0992430();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  int v18 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v17);
  int v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v20 = *(void *)(v17 - 8);
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v15, v16, v17);
LABEL_13:
  uint64_t v22 = a3[7];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  int v26 = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v25);
  int v27 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25);
  if (!v26)
  {
    uint64_t v28 = *(void *)(v25 - 8);
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v23, v24, v25);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v25);
    goto LABEL_18;
  }
  if (v27)
  {
LABEL_18:
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
    memcpy(v23, v24, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
LABEL_19:
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[9];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  uint64_t v33 = sub_1E0993600();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 24))(v31, v32, v33);
  uint64_t v34 = a3[10];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24))(v35, v36, v37);
  uint64_t v38 = a3[11];
  uint64_t v39 = &a1[v38];
  v40 = &a2[v38];
  *(void *)uint64_t v39 = *(void *)v40;
  *((void *)v39 + 1) = *((void *)v40 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1E096561C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1E0992430();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  uint64_t v18 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  int v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = sub_1E0993600();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  uint64_t v25 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v23, v24, v25);
  uint64_t v26 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(void *)&a1[v26] = *(void *)&a2[v26];
  uint64_t v27 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  *(void *)&a1[v27] = *(void *)&a2[v27];
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  return a1;
}

char *sub_1E0965914(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_1E0992430();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  int v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v11 = a3[5];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v15 = *(void *)v13;
  uint64_t v14 = *((void *)v13 + 1);
  *(void *)uint64_t v12 = v15;
  *((void *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[6];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  int v20 = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19);
  int v21 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v22 = *(void *)(v19 - 8);
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v19);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v17, v18, v19);
LABEL_13:
  uint64_t v24 = a3[7];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  int v28 = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v27);
  int v29 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27);
  if (!v28)
  {
    uint64_t v30 = *(void *)(v27 - 8);
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 40))(v25, v26, v27);
      goto LABEL_19;
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v27);
    goto LABEL_18;
  }
  if (v29)
  {
LABEL_18:
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
    memcpy(v25, v26, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
LABEL_19:
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[9];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  uint64_t v35 = sub_1E0993600();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 40))(v33, v34, v35);
  uint64_t v36 = a3[10];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  uint64_t v39 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 40))(v37, v38, v39);
  uint64_t v40 = a3[11];
  BOOL v41 = &a1[v40];
  int v42 = &a2[v40];
  uint64_t v44 = *(void *)v42;
  uint64_t v43 = *((void *)v42 + 1);
  *(void *)BOOL v41 = v44;
  *((void *)v41 + 1) = v43;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E0965DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E0965E00);
}

uint64_t sub_1E0965E00(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_15:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v12 = a3[6];
LABEL_14:
    uint64_t v9 = a1 + v12;
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v12 = a3[7];
    goto LABEL_14;
  }
  if (a2 != 0x7FFFFFFF)
  {
    sub_1E0993600();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v18 + 84) == a2)
    {
      uint64_t v8 = v17;
      uint64_t v12 = a3[9];
    }
    else
    {
      uint64_t v8 = sub_1E0995B70();
      uint64_t v12 = a3[10];
    }
    goto LABEL_14;
  }
  unint64_t v15 = *(void *)(a1 + a3[8]);
  if (v15 >= 0xFFFFFFFF) {
    LODWORD(v15) = -1;
  }
  return (v15 + 1);
}

uint64_t sub_1E0965F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E0965F3C);
}

void sub_1E0965F3C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v14 = a4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v16 + 84) == a3)
      {
        uint64_t v10 = v15;
        uint64_t v14 = a4[7];
      }
      else
      {
        if (a3 == 0x7FFFFFFF)
        {
          *(void *)(a1 + a4[8]) = (a2 - 1);
          return;
        }
        sub_1E0993600();
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v18 + 84) == a3)
        {
          uint64_t v10 = v17;
          uint64_t v14 = a4[9];
        }
        else
        {
          uint64_t v10 = sub_1E0995B70();
          uint64_t v14 = a4[10];
        }
      }
    }
    uint64_t v11 = a1 + v14;
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for PlaylistEntryReactionPropertyProvider()
{
  uint64_t result = qword_1EACF4050;
  if (!qword_1EACF4050) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E09660A8()
{
  sub_1E02E8D00();
  if (v0 <= 0x3F)
  {
    sub_1E02F0060(319, &qword_1EACF4060, &qword_1EBEF1A20);
    if (v1 <= 0x3F)
    {
      sub_1E02F0060(319, &qword_1EBEFC608, &qword_1EBEFC5F8);
      if (v2 <= 0x3F)
      {
        sub_1E0993600();
        if (v3 <= 0x3F)
        {
          sub_1E0995B70();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

unint64_t sub_1E096626C()
{
  return sub_1E0968A6C((uint64_t)&unk_1EACF4068);
}

void sub_1E09662B4()
{
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
  uint64_t v9 = OUTLINED_FUNCTION_13(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
  uint64_t v11 = OUTLINED_FUNCTION_13(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_22();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
  uint64_t v16 = OUTLINED_FUNCTION_13(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEA628);
  uint64_t v17 = swift_dynamicCastClass();
  if (!v17)
  {
    *(void *)&long long v38 = 0;
    *((void *)&v38 + 1) = 0xE000000000000000;
    sub_1E099AA20();
    sub_1E099A130();
    uint64_t v40 = v5;
    sub_1E0992C40();
    sub_1E099ABC0();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_25();
    uint64_t v37 = 25;
    goto LABEL_30;
  }
  uint64_t v18 = v17;
  uint64_t v19 = qword_1EACE4D20;
  swift_retain();
  if (v19 != -1) {
    swift_once();
  }
  *(void *)&long long v38 = qword_1EAD60AF0;
  uint64_t v40 = v18;
  sub_1E048BCD4((uint64_t)&unk_1EACF4080);
  if (sub_1E099A040())
  {
    sub_1E0968910(v0, v2, &qword_1EACE6148);
    uint64_t v20 = sub_1E0992430();
    OUTLINED_FUNCTION_5_0(v2);
    if (!v21)
    {
LABEL_26:
      *((void *)&v39 + 1) = v20;
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v38);
      OUTLINED_FUNCTION_2_0();
      (*(void (**)(uint64_t))(v35 + 32))(v36);
      swift_release();
      goto LABEL_15;
    }
    swift_release();
    uint64_t v22 = &qword_1EACE6148;
    uint64_t v23 = v2;
    goto LABEL_8;
  }
  uint64_t v24 = qword_1EACE4D28;
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  char v25 = OUTLINED_FUNCTION_3_9(qword_1EAD60AF8);
  swift_release();
  if ((v25 & 1) == 0)
  {
    uint64_t v29 = qword_1EACE4D30;
    swift_retain();
    if (v29 != -1) {
      swift_once();
    }
    char v30 = OUTLINED_FUNCTION_3_9(qword_1EACEA588);
    swift_release();
    if (v30)
    {
      uint64_t v31 = type metadata accessor for PlaylistEntryReactionPropertyProvider();
      sub_1E0968910(v0 + *(int *)(v31 + 24), v14, &qword_1EBEF1A28);
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
      OUTLINED_FUNCTION_5_0(v14);
      if (!v21) {
        goto LABEL_26;
      }
      swift_release();
      uint64_t v22 = &qword_1EBEF1A28;
      uint64_t v23 = v14;
    }
    else
    {
      uint64_t v32 = qword_1EACE4D38;
      swift_retain();
      if (v32 != -1) {
        swift_once();
      }
      char v33 = OUTLINED_FUNCTION_3_9(qword_1EACEA590);
      swift_release();
      if ((v33 & 1) == 0)
      {
        while (1)
        {
          *(void *)&long long v38 = 0;
          *((void *)&v38 + 1) = 0xE000000000000000;
          sub_1E099AA20();
          sub_1E099A130();
          uint64_t v40 = v5;
          sub_1E0992C40();
          sub_1E099ABC0();
          OUTLINED_FUNCTION_16_1();
          OUTLINED_FUNCTION_25();
          uint64_t v37 = 40;
LABEL_30:
          *(void *)&long long v38 = v37;
          OUTLINED_FUNCTION_19_27();
          __break(1u);
        }
      }
      uint64_t v34 = type metadata accessor for PlaylistEntryReactionPropertyProvider();
      sub_1E0968910(v3 + *(int *)(v34 + 28), v1, &qword_1EBEFC600);
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
      OUTLINED_FUNCTION_5_0(v1);
      if (!v21) {
        goto LABEL_26;
      }
      swift_release();
      uint64_t v22 = &qword_1EBEFC600;
      uint64_t v23 = v1;
    }
LABEL_8:
    sub_1E02F5758(v23, v22);
    goto LABEL_9;
  }
  uint64_t v26 = (uint64_t *)(v0 + *(int *)(type metadata accessor for PlaylistEntryReactionPropertyProvider() + 20));
  uint64_t v27 = v26[1];
  if (v27)
  {
    uint64_t v28 = *v26;
    *((void *)&v39 + 1) = MEMORY[0x1E4FBB1A0];
    swift_bridgeObjectRetain();
    swift_release();
    *(void *)&long long v38 = v28;
    *((void *)&v38 + 1) = v27;
    goto LABEL_15;
  }
  swift_release();
LABEL_9:
  long long v38 = 0u;
  long long v39 = 0u;
LABEL_15:
  sub_1E02B80F8((uint64_t)&v38, v7);
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1E0966828(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEA628);
  if (!swift_dynamicCastClass()) {
    goto LABEL_9;
  }
  uint64_t v2 = qword_1EACE4D30;
  swift_retain_n();
  if (v2 != -1) {
    swift_once();
  }
  sub_1E048BCD4((uint64_t)&unk_1EACF4080);
  char v3 = OUTLINED_FUNCTION_26();
  swift_release();
  if (v3) {
    goto LABEL_8;
  }
  uint64_t v4 = qword_1EACE4D38;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  char v5 = OUTLINED_FUNCTION_26();
  swift_release();
  if (v5)
  {
LABEL_8:
    swift_getKeyPath();
    sub_1E0968A6C((uint64_t)&unk_1EACF4078);
    sub_1E0997940();
    swift_release_n();
    swift_release();
    return sub_1E02F5758(a1, &qword_1EBEF9AC0);
  }
  else
  {
LABEL_9:
    sub_1E099AA20();
    sub_1E099A130();
    sub_1E0992C40();
    sub_1E099ABC0();
    OUTLINED_FUNCTION_16_1();
    uint64_t result = OUTLINED_FUNCTION_19_27();
    __break(1u);
  }
  return result;
}

void sub_1E0966B08()
{
  OUTLINED_FUNCTION_19();
  uint64_t v44 = v0;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
  uint64_t v8 = OUTLINED_FUNCTION_13(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_36();
  uint64_t v42 = v9;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v10);
  uint64_t v43 = (uint64_t)&v42 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
  uint64_t v13 = OUTLINED_FUNCTION_13(v12);
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v42 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEF0F8);
  uint64_t v20 = OUTLINED_FUNCTION_13(v19);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_2();
  uint64_t v21 = type metadata accessor for PlaylistEntryReactionPropertyProvider();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6D78);
  uint64_t v23 = swift_dynamicCastClass();
  if (!v23)
  {
    uint64_t v47 = 0;
    unint64_t v48 = 0xE000000000000000;
    uint64_t v41 = 63;
    sub_1E099AA20();
    sub_1E099A130();
    uint64_t v45 = v6;
    sub_1E0992F00();
    sub_1E099AF50();
    OUTLINED_FUNCTION_16_1();
LABEL_20:
    OUTLINED_FUNCTION_25();
    uint64_t v42 = v41;
    goto LABEL_22;
  }
  uint64_t v24 = v23;
  sub_1E02B7F84(v4, (uint64_t)&v47);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE5F20);
  if (!swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v21);
    sub_1E02F5758(v1, &qword_1EACEF0F8);
    sub_1E02B7F84(v4, (uint64_t)&v47);
    uint64_t v45 = 0;
    unint64_t v46 = 0xE000000000000000;
    uint64_t v41 = 66;
    sub_1E099AA20();
    sub_1E099A130();
    sub_1E099ABC0();
    OUTLINED_FUNCTION_16_1();
    goto LABEL_20;
  }
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v21);
  sub_1E0707B40(v1, v2);
  uint64_t v25 = qword_1EACE4D30;
  swift_retain();
  if (v25 != -1) {
    swift_once();
  }
  uint64_t v47 = qword_1EACEA588;
  uint64_t v45 = v24;
  sub_1E048BCD4((uint64_t)&qword_1EACE6D80);
  char v26 = OUTLINED_FUNCTION_28_8();
  swift_release();
  if (v26)
  {
    swift_release();
    sub_1E0968910(v2 + *(int *)(v21 + 24), (uint64_t)v16, &qword_1EBEF1A28);
    sub_1E0968858(v2);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
    OUTLINED_FUNCTION_13_0((uint64_t)v16, 1, v27);
    if (v28)
    {
      uint64_t v35 = v44;
      sub_1E0968910(v44 + *(int *)(v21 + 24), (uint64_t)v18, &qword_1EBEF1A28);
      sub_1E02F5758((uint64_t)v16, &qword_1EBEF1A28);
    }
    else
    {
      OUTLINED_FUNCTION_2_0();
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v18, v16, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v27);
      uint64_t v35 = v44;
    }
    uint64_t v36 = v35 + *(int *)(v21 + 24);
    uint64_t v37 = &qword_1EBEF1A28;
    uint64_t v38 = (uint64_t)v18;
LABEL_17:
    sub_1E09688B4(v38, v36, v37);
    OUTLINED_FUNCTION_18();
    return;
  }
  uint64_t v29 = qword_1EACE4D38;
  swift_retain();
  if (v29 != -1) {
    swift_once();
  }
  uint64_t v47 = qword_1EACEA590;
  uint64_t v45 = v24;
  char v30 = OUTLINED_FUNCTION_28_8();
  swift_release();
  if (v30)
  {
    swift_release();
    uint64_t v31 = v42;
    sub_1E0968910(v2 + *(int *)(v21 + 28), v42, &qword_1EBEFC600);
    sub_1E0968858(v2);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
    OUTLINED_FUNCTION_13_0(v31, 1, v32);
    uint64_t v33 = v43;
    if (v28)
    {
      uint64_t v40 = v44;
      sub_1E0968910(v44 + *(int *)(v21 + 28), v43, &qword_1EBEFC600);
      sub_1E02F5758(v31, &qword_1EBEFC600);
    }
    else
    {
      OUTLINED_FUNCTION_2_0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v33, v31, v32);
      __swift_storeEnumTagSinglePayload(v33, 0, 1, v32);
      uint64_t v40 = v44;
    }
    uint64_t v36 = v40 + *(int *)(v21 + 28);
    uint64_t v37 = &qword_1EBEFC600;
    uint64_t v38 = v33;
    goto LABEL_17;
  }
  uint64_t v47 = 0;
  unint64_t v48 = 0xE000000000000000;
  sub_1E099AA20();
  sub_1E099A130();
  uint64_t v45 = v24;
  sub_1E099ABC0();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_25();
  uint64_t v42 = 76;
LABEL_22:
  OUTLINED_FUNCTION_19_27();
  __break(1u);
}

uint64_t sub_1E0967154()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFD360);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1E09A33E0;
  if (qword_1EACE4D20 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_1EAD60AF0;
  uint64_t v1 = qword_1EACE4D28;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_1EAD60AF8;
  uint64_t v2 = qword_1EACE4D30;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_1EACEA588;
  uint64_t v3 = qword_1EACE4D38;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(v0 + 56) = qword_1EACEA590;
  sub_1E099A370();
  qword_1EAD612F0 = v0;
  return swift_retain();
}

void sub_1E09672D0()
{
  OUTLINED_FUNCTION_19();
  uint64_t v108 = v1;
  uint64_t v3 = v2;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  OUTLINED_FUNCTION_2_4();
  uint64_t v93 = v4;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_32();
  uint64_t v91 = v6;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF9560);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_32();
  uint64_t v98 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
  uint64_t v10 = OUTLINED_FUNCTION_13(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_36();
  uint64_t v92 = v11;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v12);
  v105 = &v89[-v13];
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v14);
  uint64_t v96 = &v89[-v15];
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  OUTLINED_FUNCTION_2_4();
  uint64_t v99 = v16;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_32();
  uint64_t v94 = v18;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4088);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_32();
  uint64_t v103 = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
  uint64_t v22 = OUTLINED_FUNCTION_13(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_36();
  uint64_t v102 = v23;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v24);
  uint64_t v107 = &v89[-v25];
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v26);
  uint64_t v106 = &v89[-v27];
  uint64_t v28 = sub_1E0992430();
  OUTLINED_FUNCTION_2_4();
  uint64_t v30 = v29;
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_16();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6B58);
  uint64_t v33 = v32 - 8;
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_16_0();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
  uint64_t v35 = OUTLINED_FUNCTION_13(v34);
  uint64_t v36 = MEMORY[0x1F4188790](v35);
  uint64_t v38 = &v89[-((v37 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v39 = MEMORY[0x1F4188790](v36);
  uint64_t v41 = &v89[-v40];
  MEMORY[0x1F4188790](v39);
  uint64_t v43 = &v89[-v42];
  uint64_t v104 = v3;
  sub_1E0968910(v3, (uint64_t)&v89[-v42], &qword_1EACE6148);
  uint64_t v44 = v108;
  sub_1E0968910(v108, (uint64_t)v41, &qword_1EACE6148);
  uint64_t v45 = v0 + *(int *)(v33 + 56);
  sub_1E0968910((uint64_t)v43, v0, &qword_1EACE6148);
  sub_1E0968910((uint64_t)v41, v45, &qword_1EACE6148);
  OUTLINED_FUNCTION_5_0(v0);
  if (v46)
  {
    sub_1E02F5758((uint64_t)v41, &qword_1EACE6148);
    sub_1E02F5758((uint64_t)v43, &qword_1EACE6148);
    OUTLINED_FUNCTION_5_0(v45);
    if (v46)
    {
      sub_1E02F5758(v0, &qword_1EACE6148);
      goto LABEL_14;
    }
LABEL_9:
    uint64_t v47 = &qword_1EACE6B58;
LABEL_10:
    uint64_t v48 = v0;
LABEL_11:
    sub_1E02F5758(v48, v47);
    goto LABEL_12;
  }
  sub_1E0968910(v0, (uint64_t)v38, &qword_1EACE6148);
  OUTLINED_FUNCTION_5_0(v45);
  if (v46)
  {
    sub_1E02F5758((uint64_t)v41, &qword_1EACE6148);
    sub_1E02F5758((uint64_t)v43, &qword_1EACE6148);
    (*(void (**)(unsigned char *, uint64_t))(v30 + 8))(v38, v28);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_35();
  v49();
  sub_1E0968A6C((uint64_t)&qword_1EACE6B70);
  int v90 = sub_1E099A040();
  uint64_t v50 = *(void (**)(void))(v30 + 8);
  OUTLINED_FUNCTION_1_13();
  v50();
  sub_1E02F5758((uint64_t)v41, &qword_1EACE6148);
  sub_1E02F5758((uint64_t)v43, &qword_1EACE6148);
  OUTLINED_FUNCTION_1_13();
  v50();
  sub_1E02F5758(v0, &qword_1EACE6148);
  if ((v90 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_14:
  v51 = (int *)type metadata accessor for PlaylistEntryReactionPropertyProvider();
  uint64_t v52 = v104;
  OUTLINED_FUNCTION_25_60();
  if (v53)
  {
    uint64_t v58 = v105;
    uint64_t v57 = v106;
    uint64_t v59 = v102;
    uint64_t v0 = v103;
    v60 = v107;
    if (!v54) {
      goto LABEL_12;
    }
    BOOL v61 = *v55 == *v56 && v53 == v54;
    if (!v61 && (sub_1E099AF80() & 1) == 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v58 = v105;
    uint64_t v57 = v106;
    uint64_t v59 = v102;
    uint64_t v0 = v103;
    v60 = v107;
    if (v54) {
      goto LABEL_12;
    }
  }
  sub_1E0968910(v52 + v51[6], (uint64_t)v57, &qword_1EBEF1A28);
  sub_1E0968910(v44 + v51[6], (uint64_t)v60, &qword_1EBEF1A28);
  uint64_t v62 = v0 + *(int *)(v100 + 48);
  sub_1E0968910((uint64_t)v57, v0, &qword_1EBEF1A28);
  sub_1E0968910((uint64_t)v60, v62, &qword_1EBEF1A28);
  uint64_t v63 = v101;
  OUTLINED_FUNCTION_13_0(v0, 1, v101);
  if (v46)
  {
    sub_1E02F5758((uint64_t)v60, &qword_1EBEF1A28);
    sub_1E02F5758((uint64_t)v57, &qword_1EBEF1A28);
    OUTLINED_FUNCTION_13_0(v62, 1, v63);
    if (v46)
    {
      sub_1E02F5758(v0, &qword_1EBEF1A28);
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  sub_1E0968910(v0, v59, &qword_1EBEF1A28);
  OUTLINED_FUNCTION_5_0(v62);
  if (v64)
  {
    sub_1E02F5758((uint64_t)v107, &qword_1EBEF1A28);
    sub_1E02F5758((uint64_t)v57, &qword_1EBEF1A28);
    OUTLINED_FUNCTION_94_0();
    v65();
LABEL_31:
    uint64_t v47 = &qword_1EACF4088;
    goto LABEL_10;
  }
  uint64_t v108 = (uint64_t)v51;
  uint64_t v66 = v99;
  uint64_t v67 = v94;
  OUTLINED_FUNCTION_35();
  v68();
  sub_1E096896C((uint64_t)&unk_1EACF4090);
  LODWORD(v103) = sub_1E099A040();
  uint64_t v69 = v59;
  v70 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
  v70(v67, v63);
  sub_1E02F5758((uint64_t)v107, &qword_1EBEF1A28);
  sub_1E02F5758((uint64_t)v106, &qword_1EBEF1A28);
  v70(v69, v63);
  v51 = (int *)v108;
  sub_1E02F5758(v0, &qword_1EBEF1A28);
  if ((v103 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_33:
  char v71 = v96;
  sub_1E0968910(v52 + v51[7], (uint64_t)v96, &qword_1EBEFC600);
  sub_1E0968910(v44 + v51[7], (uint64_t)v58, &qword_1EBEFC600);
  uint64_t v72 = v98;
  uint64_t v73 = v98 + *(int *)(v95 + 48);
  sub_1E0968910((uint64_t)v71, v98, &qword_1EBEFC600);
  sub_1E0968910((uint64_t)v58, v73, &qword_1EBEFC600);
  uint64_t v74 = v97;
  OUTLINED_FUNCTION_13_0(v72, 1, v97);
  if (!v46)
  {
    uint64_t v75 = v92;
    sub_1E0968910(v72, v92, &qword_1EBEFC600);
    OUTLINED_FUNCTION_5_0(v73);
    if (!v76)
    {
      uint64_t v78 = v93;
      OUTLINED_FUNCTION_35();
      v79();
      sub_1E09689EC((uint64_t)&qword_1EACE6C20);
      LODWORD(v108) = sub_1E099A040();
      uint64_t v80 = *(void (**)(void))(v78 + 8);
      OUTLINED_FUNCTION_1_13();
      v80();
      sub_1E02F5758((uint64_t)v105, &qword_1EBEFC600);
      sub_1E02F5758((uint64_t)v71, &qword_1EBEFC600);
      ((void (*)(uint64_t, uint64_t))v80)(v75, v74);
      sub_1E02F5758(v98, &qword_1EBEFC600);
      if ((v108 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_43;
    }
    sub_1E02F5758((uint64_t)v58, &qword_1EBEFC600);
    sub_1E02F5758((uint64_t)v71, &qword_1EBEFC600);
    OUTLINED_FUNCTION_94_0();
    v77();
    goto LABEL_41;
  }
  sub_1E02F5758((uint64_t)v58, &qword_1EBEFC600);
  sub_1E02F5758((uint64_t)v71, &qword_1EBEFC600);
  OUTLINED_FUNCTION_13_0(v73, 1, v74);
  if (!v46)
  {
LABEL_41:
    uint64_t v47 = &qword_1EBEF9560;
    uint64_t v48 = v72;
    goto LABEL_11;
  }
  sub_1E02F5758(v72, &qword_1EBEFC600);
LABEL_43:
  if ((sub_1E02D521C(*(void *)(v52 + v51[8]), *(void *)(v44 + v51[8])) & 1) == 0
    || (sub_1E09934D0() & 1) == 0
    || (sub_1E033A61C() & 1) == 0)
  {
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_25_60();
  if (!v81)
  {
    if (v82) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
  if (v82)
  {
    BOOL v85 = *v83 == *v84 && v81 == v82;
    if (v85 || (sub_1E099AF80() & 1) != 0)
    {
LABEL_55:
      OUTLINED_FUNCTION_24_65();
      if (v86)
      {
        OUTLINED_FUNCTION_24_65();
        if (v87)
        {
          OUTLINED_FUNCTION_24_65();
          if (v88) {
            OUTLINED_FUNCTION_24_65();
          }
        }
      }
    }
  }
LABEL_12:
  OUTLINED_FUNCTION_18();
}

void sub_1E0967D20()
{
  OUTLINED_FUNCTION_19();
  uint64_t v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC5F8);
  OUTLINED_FUNCTION_2_4();
  uint64_t v37 = v4;
  uint64_t v38 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_32();
  uint64_t v36 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFC600);
  uint64_t v7 = OUTLINED_FUNCTION_13(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_22();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A20);
  OUTLINED_FUNCTION_2_4();
  uint64_t v35 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_32();
  uint64_t v34 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A28);
  uint64_t v16 = OUTLINED_FUNCTION_13(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_16();
  uint64_t v17 = sub_1E0992430();
  OUTLINED_FUNCTION_2_4();
  uint64_t v19 = v18;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_22();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6148);
  uint64_t v25 = OUTLINED_FUNCTION_13(v24);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_22();
  uint64_t v28 = v27 - v26;
  sub_1E0968910(v2, v27 - v26, &qword_1EACE6148);
  OUTLINED_FUNCTION_13_0(v28, 1, v17);
  if (v29)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v30();
    OUTLINED_FUNCTION_6();
    sub_1E0968A6C((uint64_t)&qword_1EBEF06B0);
    sub_1E099A000();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v17);
  }
  uint64_t v31 = (int *)type metadata accessor for PlaylistEntryReactionPropertyProvider();
  if (*(void *)(v2 + v31[5] + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E099A100();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  sub_1E0968910(v2 + v31[6], v1, &qword_1EBEF1A28);
  OUTLINED_FUNCTION_13_0(v1, 1, v11);
  if (v29)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v32();
    OUTLINED_FUNCTION_6();
    sub_1E096896C((uint64_t)&unk_1EACF40A0);
    sub_1E099A000();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v11);
  }
  sub_1E0968910(v2 + v31[7], v10, &qword_1EBEFC600);
  OUTLINED_FUNCTION_13_0(v10, 1, v38);
  if (v29)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v33();
    OUTLINED_FUNCTION_6();
    sub_1E09689EC((uint64_t)&qword_1EACE6C40);
    sub_1E099A000();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
  }
  OUTLINED_FUNCTION_21();
  sub_1E02DFCBC();
  swift_bridgeObjectRelease();
  sub_1E0993600();
  sub_1E0968A6C((uint64_t)&qword_1EBEF1830);
  sub_1E099A000();
  sub_1E0995B70();
  sub_1E0968A6C((uint64_t)&qword_1EBEF1C90);
  sub_1E099A000();
  if (*(void *)(v2 + v31[11] + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E099A100();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1E09682C0()
{
  return sub_1E099B0E0();
}

void (*sub_1E0968308(void *a1, uint64_t a2))(uint64_t *a1, char a2)
{
  uint64_t v5 = malloc(0x50uLL);
  *a1 = v5;
  v5[8] = a2;
  v5[9] = v2;
  sub_1E09662B4();
  return sub_1E0968370;
}

void sub_1E0968370(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    sub_1E0968910(*a1, (uint64_t)v2 + 32, &qword_1EBEF9AC0);
    swift_retain();
    sub_1E0966828((uint64_t)v2 + 32);
    sub_1E02F5758((uint64_t)v2, &qword_1EBEF9AC0);
  }
  else
  {
    swift_retain();
    sub_1E0966828((uint64_t)v2);
  }
  free(v2);
}

uint64_t sub_1E0968424()
{
  return sub_1E099B0E0();
}

unint64_t sub_1E0968460()
{
  return sub_1E0968A6C((uint64_t)&qword_1EACEF108);
}

uint64_t sub_1E09684A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = sub_1E0968A6C((uint64_t)&unk_1EACF4078);
  return MEMORY[0x1F40F0200](a1, a4, a3, v7);
}

uint64_t sub_1E096853C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_1E0993600();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1E09685AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 36);
  uint64_t v5 = sub_1E0993600();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_1E096861C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_1E0995B70();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1E096868C(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 44));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1E09686C4(uint64_t a1)
{
  unint64_t v2 = sub_1E0968A6C((uint64_t)&unk_1EACF4078);
  return MEMORY[0x1F40F01F8](a1, v2);
}

uint64_t sub_1E0968740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_1E0968A6C((uint64_t)&unk_1EACF4068);
  return MEMORY[0x1F40F0270](a1, a3, a2, a4, v8);
}

uint64_t sub_1E09687D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1E0968A6C((uint64_t)&unk_1EACF4070);
  return MEMORY[0x1F40F0268](a1, a2, a3, v6);
}

uint64_t sub_1E0968858(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PlaylistEntryReactionPropertyProvider();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1E09688B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_94_0();
  v4();
  return a2;
}

uint64_t sub_1E0968910(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_94_0();
  v4();
  return a2;
}

unint64_t sub_1E096896C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEF1A20);
    sub_1E0968A6C(v4);
    unint64_t result = OUTLINED_FUNCTION_32_0();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1E09689EC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBEFC5F8);
    sub_1E0968A6C(v4);
    unint64_t result = OUTLINED_FUNCTION_32_0();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1E0968A6C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_72_1(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t *sub_1E0968AB0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    unint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    unint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_1E0996410();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v13 = a3[8];
    *(uint64_t *)((char *)v7 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v14 = (char *)v7 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = (int *)type metadata accessor for EditorialElementLink();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, (uint64_t)v16))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
      memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      uint64_t v18 = sub_1E0992360();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v14, v15, v18);
      v14[v16[5]] = v15[v16[5]];
      v14[v16[6]] = v15[v16[6]];
      *(void *)&v14[v16[7]] = *(void *)&v15[v16[7]];
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, (uint64_t)v16);
    }
    uint64_t v19 = a3[10];
    *(uint64_t *)((char *)v7 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    uint64_t v20 = (char *)v7 + v19;
    uint64_t v21 = (char *)a2 + v19;
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v11))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
      memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v20, v21, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v11);
    }
    uint64_t v23 = a3[11];
    uint64_t v24 = (char *)v7 + v23;
    uint64_t v25 = (char *)a2 + v23;
    uint64_t v26 = sub_1E0992360();
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
      memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
    uint64_t v28 = a3[13];
    *(uint64_t *)((char *)v7 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    *(uint64_t *)((char *)v7 + v28) = *(uint64_t *)((char *)a2 + v28);
    uint64_t v29 = a3[14];
    uint64_t v30 = (char *)v7 + v29;
    uint64_t v31 = (char *)a2 + v29;
    uint64_t v32 = sub_1E0993600();
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33(v30, v31, v32);
    uint64_t v34 = a3[15];
    uint64_t v35 = (char *)v7 + v34;
    uint64_t v36 = (char *)a2 + v34;
    uint64_t v37 = sub_1E0995B70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    uint64_t v38 = a3[16];
    uint64_t v39 = a3[17];
    uint64_t v40 = (uint64_t *)((char *)v7 + v38);
    uint64_t v41 = (uint64_t *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    void *v40 = *v41;
    v40[1] = v42;
    *(uint64_t *)((char *)v7 + v39) = *(uint64_t *)((char *)a2 + v39);
    uint64_t v43 = a3[19];
    *(uint64_t *)((char *)v7 + a3[18]) = *(uint64_t *)((char *)a2 + a3[18]);
    *(uint64_t *)((char *)v7 + v43) = *(uint64_t *)((char *)a2 + v43);
    *(uint64_t *)((char *)v7 + a3[20]) = *(uint64_t *)((char *)a2 + a3[20]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_1E0968F50(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_1E0996410();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[8];
  uint64_t v7 = type metadata accessor for EditorialElementLink();
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    uint64_t v8 = sub_1E0992360();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[10];
  if (!__swift_getEnumTagSinglePayload(v9, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v9, v5);
  }
  uint64_t v10 = a1 + a2[11];
  uint64_t v11 = sub_1E0992360();
  if (!__swift_getEnumTagSinglePayload(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = a1 + a2[14];
  uint64_t v13 = sub_1E0993600();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = a1 + a2[15];
  uint64_t v15 = sub_1E0995B70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_1E09691F8(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_1E0996410();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = (int *)type metadata accessor for EditorialElementLink();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, (uint64_t)v15))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    uint64_t v17 = sub_1E0992360();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v13, v14, v17);
    v13[v15[5]] = v14[v15[5]];
    v13[v15[6]] = v14[v15[6]];
    *(void *)&v13[v15[7]] = *(void *)&v14[v15[7]];
    swift_bridgeObjectRetain();
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, (uint64_t)v15);
  }
  uint64_t v18 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v10))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v19, v20, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v10);
  }
  uint64_t v22 = a3[11];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = sub_1E0992360();
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v23, v24, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
  }
  uint64_t v27 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + v27) = *(void *)((char *)a2 + v27);
  uint64_t v28 = a3[14];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  uint64_t v31 = sub_1E0993600();
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32(v29, v30, v31);
  uint64_t v33 = a3[15];
  uint64_t v34 = (char *)a1 + v33;
  uint64_t v35 = (char *)a2 + v33;
  uint64_t v36 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
  uint64_t v37 = a3[16];
  uint64_t v38 = a3[17];
  uint64_t v39 = (void *)((char *)a1 + v37);
  uint64_t v40 = (void *)((char *)a2 + v37);
  uint64_t v41 = v40[1];
  *uint64_t v39 = *v40;
  v39[1] = v41;
  *(void *)((char *)a1 + v38) = *(void *)((char *)a2 + v38);
  uint64_t v42 = a3[19];
  *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
  *(void *)((char *)a1 + v42) = *(void *)((char *)a2 + v42);
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1E0969644(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E0996410();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = (int *)type metadata accessor for EditorialElementLink();
  int v18 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, (uint64_t)v17);
  int v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v17);
  if (v18)
  {
    if (!v19)
    {
      uint64_t v20 = sub_1E0992360();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 16))(v15, v16, v20);
      v15[v17[5]] = v16[v17[5]];
      v15[v17[6]] = v16[v17[6]];
      *(void *)&v15[v17[7]] = *(void *)&v16[v17[7]];
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    sub_1E096DC40((uint64_t)v15, (void (*)(void))type metadata accessor for EditorialElementLink);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v49 = sub_1E0992360();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v49 - 8) + 24))(v15, v16, v49);
  v15[v17[5]] = v16[v17[5]];
  v15[v17[6]] = v16[v17[6]];
  *(void *)&v15[v17[7]] = *(void *)&v16[v17[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_13:
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  int v25 = __swift_getEnumTagSinglePayload((uint64_t)a1 + v22, 1, v9);
  int v26 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v9);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v23, v24, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v27 = *(void *)(v9 - 8);
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v23, v9);
LABEL_18:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 24))(v23, v24, v9);
LABEL_19:
  uint64_t v29 = a3[11];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_1E0992360();
  int v33 = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v32);
  int v34 = __swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32);
  if (!v33)
  {
    uint64_t v35 = *(void *)(v32 - 8);
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 24))(v30, v31, v32);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v32);
    goto LABEL_24;
  }
  if (v34)
  {
LABEL_24:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v30, v31, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
LABEL_25:
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[14];
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  uint64_t v40 = sub_1E0993600();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 24))(v38, v39, v40);
  uint64_t v41 = a3[15];
  uint64_t v42 = (char *)a1 + v41;
  uint64_t v43 = (char *)a2 + v41;
  uint64_t v44 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 24))(v42, v43, v44);
  uint64_t v45 = a3[16];
  char v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  *char v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[19]) = *(void *)((char *)a2 + a3[19]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1E0969D34(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E0996410();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = (int *)type metadata accessor for EditorialElementLink();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, (uint64_t)v14))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
    memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    uint64_t v16 = sub_1E0992360();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v12, v13, v16);
    v12[v14[5]] = v13[v14[5]];
    v12[v14[6]] = v13[v14[6]];
    *(void *)&v12[v14[7]] = *(void *)&v13[v14[7]];
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, (uint64_t)v14);
  }
  uint64_t v17 = a3[10];
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  int v18 = (char *)a1 + v17;
  int v19 = (char *)a2 + v17;
  if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v17, 1, v9))
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v18, v19, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v9);
  }
  uint64_t v21 = a3[11];
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = sub_1E0992360();
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v22, v23, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v24);
  }
  uint64_t v26 = a3[13];
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  *(void *)((char *)a1 + v26) = *(void *)((char *)a2 + v26);
  uint64_t v27 = a3[14];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = sub_1E0993600();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v28, v29, v30);
  uint64_t v31 = a3[15];
  uint64_t v32 = (char *)a1 + v31;
  int v33 = (char *)a2 + v31;
  uint64_t v34 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32))(v32, v33, v34);
  uint64_t v35 = a3[17];
  *(_OWORD *)((char *)a1 + a3[16]) = *(_OWORD *)((char *)a2 + a3[16]);
  *(void *)((char *)a1 + v35) = *(void *)((char *)a2 + v35);
  uint64_t v36 = a3[19];
  *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
  *(void *)((char *)a1 + v36) = *(void *)((char *)a2 + v36);
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  return a1;
}

void *sub_1E096A118(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1E0996410();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v7, v8, v9);
LABEL_7:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = (int *)type metadata accessor for EditorialElementLink();
  int v18 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, (uint64_t)v17);
  int v19 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, (uint64_t)v17);
  if (v18)
  {
    if (!v19)
    {
      uint64_t v20 = sub_1E0992360();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 32))(v15, v16, v20);
      v15[v17[5]] = v16[v17[5]];
      v15[v17[6]] = v16[v17[6]];
      *(void *)&v15[v17[7]] = *(void *)&v16[v17[7]];
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
    sub_1E096DC40((uint64_t)v15, (void (*)(void))type metadata accessor for EditorialElementLink);
LABEL_12:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  uint64_t v51 = sub_1E0992360();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v51 - 8) + 40))(v15, v16, v51);
  v15[v17[5]] = v16[v17[5]];
  v15[v17[6]] = v16[v17[6]];
  *(void *)&v15[v17[7]] = *(void *)&v16[v17[7]];
  swift_bridgeObjectRelease();
LABEL_13:
  *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  int v25 = __swift_getEnumTagSinglePayload((uint64_t)a1 + v22, 1, v9);
  int v26 = __swift_getEnumTagSinglePayload((uint64_t)v24, 1, v9);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v23, v24, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v27 = *(void *)(v9 - 8);
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v23, v9);
LABEL_18:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
    memcpy(v23, v24, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v23, v24, v9);
LABEL_19:
  uint64_t v29 = a3[11];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = sub_1E0992360();
  int v33 = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v32);
  int v34 = __swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32);
  if (!v33)
  {
    uint64_t v35 = *(void *)(v32 - 8);
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 40))(v30, v31, v32);
      goto LABEL_25;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v30, v32);
    goto LABEL_24;
  }
  if (v34)
  {
LABEL_24:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
    memcpy(v30, v31, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
  __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
LABEL_25:
  *(void *)((char *)a1 + a3[12]) = *(void *)((char *)a2 + a3[12]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[14];
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  uint64_t v40 = sub_1E0993600();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 40))(v38, v39, v40);
  uint64_t v41 = a3[15];
  uint64_t v42 = (char *)a1 + v41;
  uint64_t v43 = (char *)a2 + v41;
  uint64_t v44 = sub_1E0995B70();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 40))(v42, v43, v44);
  uint64_t v45 = a3[16];
  char v46 = (void *)((char *)a1 + v45);
  uint64_t v47 = (void *)((char *)a2 + v45);
  uint64_t v49 = *v47;
  uint64_t v48 = v47[1];
  *char v46 = v49;
  v46[1] = v48;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[18]) = *(void *)((char *)a2 + a3[18]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[19]) = *(void *)((char *)a2 + a3[19]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[20]) = *(void *)((char *)a2 + a3[20]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1E096A79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1E096A7B0);
}

uint64_t sub_1E096A7B0(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[6];
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a3[8];
    goto LABEL_14;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v13 + 84) == a2)
  {
    uint64_t v8 = v12;
    uint64_t v9 = a3[11];
    goto LABEL_14;
  }
  if (a2 != 0x7FFFFFFF)
  {
    sub_1E0993600();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v17 + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v9 = a3[14];
    }
    else
    {
      uint64_t v8 = sub_1E0995B70();
      uint64_t v9 = a3[15];
    }
LABEL_14:
    return __swift_getEnumTagSinglePayload(a1 + v9, a2, v8);
  }
  unint64_t v14 = *(void *)(a1 + a3[13]);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_1E096A8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1E096A8EC);
}

void sub_1E096A8EC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a4[6];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) == a3)
    {
      uint64_t v10 = v12;
      uint64_t v11 = a4[8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
      OUTLINED_FUNCTION_0();
      if (*(_DWORD *)(v15 + 84) == a3)
      {
        uint64_t v10 = v14;
        uint64_t v11 = a4[11];
      }
      else
      {
        if (a3 == 0x7FFFFFFF)
        {
          *(void *)(a1 + a4[13]) = (a2 - 1);
          return;
        }
        sub_1E0993600();
        OUTLINED_FUNCTION_0();
        if (*(_DWORD *)(v17 + 84) == a3)
        {
          uint64_t v10 = v16;
          uint64_t v11 = a4[14];
        }
        else
        {
          uint64_t v10 = sub_1E0995B70();
          uint64_t v11 = a4[15];
        }
      }
    }
  }
  __swift_storeEnumTagSinglePayload(a1 + v11, a2, a2, v10);
}

uint64_t type metadata accessor for EditorialItemPropertyProvider()
{
  uint64_t result = qword_1EBEF1478;
  if (!qword_1EBEF1478) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1E096AA58()
{
  sub_1E096AC64(319, (unint64_t *)&qword_1EBEF0180, MEMORY[0x1E4F36F38]);
  if (v0 <= 0x3F)
  {
    sub_1E096AC64(319, &qword_1EBEF1380, (void (*)(uint64_t))type metadata accessor for EditorialElementLink);
    if (v1 <= 0x3F)
    {
      sub_1E096AC64(319, (unint64_t *)&qword_1EBEFA5C8, MEMORY[0x1E4F276F0]);
      if (v2 <= 0x3F)
      {
        sub_1E0993600();
        if (v3 <= 0x3F)
        {
          sub_1E0995B70();
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_1E096AC64(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1E099A8E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1E096ACB8()
{
  return sub_1E096DD60(&qword_1EACF40A8, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
}

void sub_1E096AD00()
{
  OUTLINED_FUNCTION_19();
  unint64_t v3 = v0;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  uint64_t v9 = OUTLINED_FUNCTION_13(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_23();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
  uint64_t v11 = OUTLINED_FUNCTION_13(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_16_0();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  uint64_t v13 = OUTLINED_FUNCTION_13(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_14_8();
  uint64_t v16 = v14 - v15;
  MEMORY[0x1F4188790](v17);
  int v19 = (char *)&v51 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1828);
  uint64_t v20 = swift_dynamicCastClass();
  if (!v20)
  {
    *(void *)&long long v53 = 0;
    *((void *)&v53 + 1) = 0xE000000000000000;
    sub_1E099AA20();
    sub_1E099A130();
    uint64_t v55 = v5;
    sub_1E0992C40();
    sub_1E099ABC0();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_25();
    uint64_t v50 = 31;
    goto LABEL_59;
  }
  uint64_t v21 = v20;
  uint64_t v52 = v7;
  uint64_t v22 = qword_1EBEF17F8;
  swift_retain();
  if (v22 != -1) {
    swift_once();
  }
  *(void *)&long long v53 = qword_1EBF091F8;
  uint64_t v55 = v21;
  sub_1E02B80A8(&qword_1EACF40C8, &qword_1EBEF1828);
  if (OUTLINED_FUNCTION_8_3())
  {
    uint64_t v23 = *v0;
    uint64_t v24 = v52;
    if (*v3)
    {
      int v25 = &qword_1EBEF2388;
LABEL_7:
      *((void *)&v54 + 1) = __swift_instantiateConcreteTypeFromMangledName(v25);
      swift_bridgeObjectRetain();
      swift_release();
LABEL_56:
      *(void *)&long long v53 = v23;
      uint64_t v36 = v24;
      goto LABEL_57;
    }
    goto LABEL_55;
  }
  uint64_t v26 = qword_1EBEF17E0;
  swift_retain();
  if (v26 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_3_9(qword_1EBEF17D8);
  OUTLINED_FUNCTION_54();
  if (v26)
  {
    uint64_t v27 = v0[1];
    if (v27)
    {
LABEL_12:
      uint64_t v28 = &qword_1EBEF2478;
LABEL_13:
      *((void *)&v54 + 1) = __swift_instantiateConcreteTypeFromMangledName(v28);
      swift_bridgeObjectRetain();
      swift_release();
LABEL_39:
      uint64_t v36 = v52;
      *(void *)&long long v53 = v27;
      goto LABEL_57;
    }
LABEL_38:
    swift_release();
    *((void *)&v53 + 1) = 0;
    long long v54 = 0uLL;
    goto LABEL_39;
  }
  uint64_t v29 = qword_1EBEF17F0;
  swift_retain();
  if (v29 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_3_9(qword_1EBF091F0);
  OUTLINED_FUNCTION_54();
  if (v29)
  {
    uint64_t v30 = type metadata accessor for EditorialItemPropertyProvider();
    sub_1E02B8160((uint64_t)v0 + *(int *)(v30 + 24), (uint64_t)v19, &qword_1EBEF1E90);
    uint64_t v31 = sub_1E0996410();
    OUTLINED_FUNCTION_13_0((uint64_t)v19, 1, v31);
    if (!v32)
    {
LABEL_50:
      OUTLINED_FUNCTION_32_47();
      OUTLINED_FUNCTION_2_0();
      (*(void (**)(void))(v49 + 32))();
      goto LABEL_26;
    }
    swift_release();
    int v33 = &qword_1EBEF1E90;
    uint64_t v34 = (uint64_t)v19;
  }
  else
  {
    uint64_t v35 = qword_1EBEF1808;
    swift_retain();
    if (v35 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_3_9(qword_1EBF09200);
    OUTLINED_FUNCTION_54();
    if (v35)
    {
      uint64_t v27 = *(void *)((char *)v0 + *(int *)(type metadata accessor for EditorialItemPropertyProvider() + 28));
      if (v27)
      {
        uint64_t v28 = &qword_1EBEF2378;
        goto LABEL_13;
      }
      goto LABEL_38;
    }
    uint64_t v37 = qword_1EBEF1820;
    swift_retain();
    if (v37 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_3_9(qword_1EBF09210);
    OUTLINED_FUNCTION_54();
    if (v37)
    {
      uint64_t v38 = type metadata accessor for EditorialItemPropertyProvider();
      sub_1E02B8160((uint64_t)v0 + *(int *)(v38 + 32), v2, &qword_1EBEF1378);
      uint64_t v39 = type metadata accessor for EditorialElementLink();
      OUTLINED_FUNCTION_13_0(v2, 1, v39);
      if (!v32)
      {
        uint64_t v41 = OUTLINED_FUNCTION_32_47();
        sub_1E096DD00(v2, (uint64_t)v41, (void (*)(void))type metadata accessor for EditorialElementLink);
LABEL_26:
        swift_release();
        goto LABEL_27;
      }
      swift_release();
      int v33 = &qword_1EBEF1378;
      uint64_t v34 = v2;
    }
    else
    {
      uint64_t v40 = qword_1EBEF17B8;
      swift_retain();
      if (v40 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_3_9(qword_1EBEF17B0);
      OUTLINED_FUNCTION_54();
      if (v40)
      {
        uint64_t v27 = *(void *)((char *)v0 + *(int *)(type metadata accessor for EditorialItemPropertyProvider() + 36));
        if (v27) {
          goto LABEL_12;
        }
        goto LABEL_38;
      }
      uint64_t v42 = qword_1EBEF17D0;
      swift_retain();
      if (v42 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_3_9(qword_1EBEF17C0);
      OUTLINED_FUNCTION_54();
      if (v42)
      {
        uint64_t v43 = type metadata accessor for EditorialItemPropertyProvider();
        sub_1E02B8160((uint64_t)v0 + *(int *)(v43 + 40), v16, &qword_1EBEF1E90);
        uint64_t v44 = sub_1E0996410();
        OUTLINED_FUNCTION_13_0(v16, 1, v44);
        if (!v32) {
          goto LABEL_50;
        }
        swift_release();
        int v33 = &qword_1EBEF1E90;
        uint64_t v34 = v16;
      }
      else
      {
        uint64_t v45 = qword_1EBEF1818;
        swift_retain();
        if (v45 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_3_9(qword_1EBF09208);
        OUTLINED_FUNCTION_54();
        if ((v45 & 1) == 0)
        {
          sub_1E096DD60(&qword_1EBEF10E0, (void (*)(uint64_t))type metadata accessor for EditorialItem);
          swift_retain();
          *(void *)&long long v53 = sub_1E0992FD0();
          uint64_t v55 = v21;
          char v48 = OUTLINED_FUNCTION_8_3();
          swift_release();
          swift_release();
          if ((v48 & 1) == 0)
          {
            while (1)
            {
              *(void *)&long long v53 = 0;
              *((void *)&v53 + 1) = 0xE000000000000000;
              sub_1E099AA20();
              sub_1E099A130();
              uint64_t v55 = v5;
              sub_1E0992C40();
              sub_1E099ABC0();
              OUTLINED_FUNCTION_16_1();
              OUTLINED_FUNCTION_25();
              uint64_t v50 = 56;
LABEL_59:
              uint64_t v51 = v50;
              OUTLINED_FUNCTION_7_4();
              __break(1u);
            }
          }
          uint64_t v23 = *(void *)((char *)v3 + *(int *)(type metadata accessor for EditorialItemPropertyProvider() + 48));
          uint64_t v24 = v52;
          if (v23)
          {
            int v25 = &qword_1EACE8400;
            goto LABEL_7;
          }
LABEL_55:
          swift_release();
          *((void *)&v53 + 1) = 0;
          long long v54 = 0uLL;
          goto LABEL_56;
        }
        uint64_t v46 = type metadata accessor for EditorialItemPropertyProvider();
        sub_1E02B8160((uint64_t)v0 + *(int *)(v46 + 44), v1, &qword_1EBEFA5C0);
        uint64_t v47 = sub_1E0992360();
        OUTLINED_FUNCTION_13_0(v1, 1, v47);
        if (!v32) {
          goto LABEL_50;
        }
        swift_release();
        int v33 = &qword_1EBEFA5C0;
        uint64_t v34 = v1;
      }
    }
  }
  sub_1E02B81BC(v34, v33);
  long long v53 = 0u;
  long long v54 = 0u;
LABEL_27:
  uint64_t v36 = v52;
LABEL_57:
  sub_1E02B80F8((uint64_t)&v53, v36);
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1E096B538(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1828);
  if (!swift_dynamicCastClass()) {
    goto LABEL_16;
  }
  uint64_t v3 = qword_1EBEF17E0;
  swift_retain_n();
  if (v3 != -1) {
    swift_once();
  }
  sub_1E02B80A8(&qword_1EACF40C8, &qword_1EBEF1828);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_52_0();
  if ((v1 & 1) == 0)
  {
    uint64_t v4 = qword_1EBEF1808;
    swift_retain();
    if (v4 != -1) {
      swift_once();
    }
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_52_0();
    if ((v4 & 1) == 0)
    {
      uint64_t v5 = qword_1EBEF17B8;
      swift_retain();
      if (v5 != -1) {
        swift_once();
      }
      OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_52_0();
      if ((v5 & 1) == 0)
      {
        uint64_t v6 = qword_1EBEF17D0;
        swift_retain();
        if (v6 != -1) {
          swift_once();
        }
        OUTLINED_FUNCTION_26();
        OUTLINED_FUNCTION_52_0();
        if ((v6 & 1) == 0)
        {
          sub_1E096DD60(&qword_1EBEF10E0, (void (*)(uint64_t))type metadata accessor for EditorialItem);
          swift_retain();
          sub_1E0992FD0();
          char v7 = OUTLINED_FUNCTION_26();
          swift_release();
          swift_release();
          if ((v7 & 1) == 0)
          {
LABEL_16:
            while (1)
            {
              sub_1E099AA20();
              sub_1E099A130();
              sub_1E0992C40();
              sub_1E099ABC0();
              OUTLINED_FUNCTION_16_1();
              OUTLINED_FUNCTION_7_4();
              __break(1u);
            }
          }
        }
      }
    }
  }
  swift_getKeyPath();
  sub_1E096DD60(&qword_1EBEF1468, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
  sub_1E0997950();
  swift_release_n();
  swift_release();
  return sub_1E02B81BC(a1, &qword_1EBEF9AC0);
}

void sub_1E096B934()
{
  OUTLINED_FUNCTION_19();
  uint64_t v36 = v1;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  uint64_t v9 = OUTLINED_FUNCTION_13(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_14_8();
  uint64_t v12 = v10 - v11;
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v36 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6A98);
  uint64_t v17 = OUTLINED_FUNCTION_13(v16);
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_6_1();
  uint64_t v18 = (int *)type metadata accessor for EditorialItemPropertyProvider();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_23();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF40B8);
  uint64_t v20 = swift_dynamicCastClass();
  if (!v20)
  {
    uint64_t v39 = 0;
    unint64_t v40 = 0xE000000000000000;
    sub_1E099AA20();
    sub_1E099A130();
    uint64_t v37 = v7;
    sub_1E0992F00();
    sub_1E099AF50();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_25();
    uint64_t v35 = 86;
    goto LABEL_32;
  }
  uint64_t v3 = v20;
  sub_1E02B7F84(v5, (uint64_t)&v39);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE5F20);
  if (!swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload(v0, 1, 1, (uint64_t)v18);
    sub_1E02B81BC(v0, &qword_1EACE6A98);
    sub_1E02B7F84(v5, (uint64_t)&v39);
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    sub_1E099AA20();
    sub_1E099A130();
    sub_1E099ABC0();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_25();
    uint64_t v35 = 89;
    goto LABEL_32;
  }
  __swift_storeEnumTagSinglePayload(v0, 0, 1, (uint64_t)v18);
  sub_1E096DD00(v0, v2, (void (*)(void))type metadata accessor for EditorialItemPropertyProvider);
  uint64_t v21 = qword_1EBEF17E0;
  swift_retain();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v39 = qword_1EBEF17D8;
  uint64_t v37 = v3;
  sub_1E02B80A8(&qword_1EACF40C0, &qword_1EACF40B8);
  OUTLINED_FUNCTION_46_3();
  OUTLINED_FUNCTION_56_2();
  if (v21)
  {
    swift_release();
    uint64_t v22 = *(void *)(v2 + 8);
    swift_bridgeObjectRetain();
    sub_1E096DC40(v2, (void (*)(void))type metadata accessor for EditorialItemPropertyProvider);
    uint64_t v23 = v36;
    if (!v22) {
      uint64_t v22 = swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    *(void *)(v23 + 8) = v22;
  }
  else
  {
    uint64_t v24 = qword_1EBEF1808;
    swift_retain();
    if (v24 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_1EBF09200;
    uint64_t v37 = v3;
    OUTLINED_FUNCTION_46_3();
    OUTLINED_FUNCTION_56_2();
    if (v24)
    {
      swift_release();
      uint64_t v25 = *(void *)(v2 + v18[7]);
      swift_bridgeObjectRetain();
      sub_1E096DC40(v2, (void (*)(void))type metadata accessor for EditorialItemPropertyProvider);
      uint64_t v26 = v18[7];
    }
    else
    {
      uint64_t v27 = qword_1EBEF17B8;
      swift_retain();
      if (v27 != -1) {
        swift_once();
      }
      uint64_t v39 = qword_1EBEF17B0;
      uint64_t v37 = v3;
      OUTLINED_FUNCTION_46_3();
      OUTLINED_FUNCTION_56_2();
      if (v27)
      {
        swift_release();
        uint64_t v25 = *(void *)(v2 + v18[9]);
        swift_bridgeObjectRetain();
        sub_1E096DC40(v2, (void (*)(void))type metadata accessor for EditorialItemPropertyProvider);
        uint64_t v26 = v18[9];
      }
      else
      {
        uint64_t v28 = qword_1EBEF17D0;
        swift_retain();
        if (v28 != -1) {
          swift_once();
        }
        uint64_t v39 = qword_1EBEF17C0;
        uint64_t v37 = v3;
        OUTLINED_FUNCTION_46_3();
        OUTLINED_FUNCTION_56_2();
        if (v28)
        {
          swift_release();
          sub_1E02B8160(v2 + v18[10], v12, &qword_1EBEF1E90);
          sub_1E096DC40(v2, (void (*)(void))type metadata accessor for EditorialItemPropertyProvider);
          uint64_t v29 = sub_1E0996410();
          OUTLINED_FUNCTION_13_0(v12, 1, v29);
          if (v30)
          {
            uint64_t v34 = v36;
            sub_1E02B8160(v36 + v18[10], (uint64_t)v15, &qword_1EBEF1E90);
            sub_1E02B81BC(v12, &qword_1EBEF1E90);
          }
          else
          {
            OUTLINED_FUNCTION_2_0();
            (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v15, v12, v29);
            __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v29);
            uint64_t v34 = v36;
          }
          sub_1E096DC98((uint64_t)v15, v34 + v18[10]);
          goto LABEL_28;
        }
        sub_1E096DD60(&qword_1EBEF10E0, (void (*)(uint64_t))type metadata accessor for EditorialItem);
        swift_retain();
        uint64_t v39 = sub_1E0992FD0();
        uint64_t v37 = v3;
        char v31 = sub_1E099A040();
        swift_release();
        swift_release();
        if ((v31 & 1) == 0)
        {
          while (1)
          {
            uint64_t v39 = 0;
            unint64_t v40 = 0xE000000000000000;
            sub_1E099AA20();
            sub_1E099A130();
            uint64_t v37 = v3;
            sub_1E099ABC0();
            OUTLINED_FUNCTION_16_1();
            OUTLINED_FUNCTION_25();
            uint64_t v35 = 106;
LABEL_32:
            uint64_t v36 = v35;
            OUTLINED_FUNCTION_7_4();
            __break(1u);
          }
        }
        swift_release();
        uint64_t v25 = *(void *)(v2 + v18[12]);
        swift_bridgeObjectRetain();
        sub_1E096DC40(v2, (void (*)(void))type metadata accessor for EditorialItemPropertyProvider);
        uint64_t v26 = v18[12];
      }
    }
    uint64_t v32 = v36;
    if (!v25) {
      uint64_t v25 = swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    *(void *)(v32 + v26) = v25;
  }
LABEL_28:
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1E096C08C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFD360);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1E099D680;
  if (qword_1EBEF17F8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_1EBF091F8;
  uint64_t v1 = qword_1EBEF17E0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_1EBEF17D8;
  uint64_t v2 = qword_1EBEF17F0;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_1EBF091F0;
  uint64_t v3 = qword_1EBEF1808;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(v0 + 56) = qword_1EBF09200;
  uint64_t v4 = qword_1EBEF1820;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  *(void *)(v0 + 64) = qword_1EBF09210;
  uint64_t v5 = qword_1EBEF17B8;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  *(void *)(v0 + 72) = qword_1EBEF17B0;
  uint64_t v6 = qword_1EBEF17D0;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  *(void *)(v0 + 80) = qword_1EBEF17C0;
  uint64_t v7 = qword_1EBEF1818;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  *(void *)(v0 + 88) = qword_1EBF09208;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1828);
  sub_1E096DD60(&qword_1EBEF10E0, (void (*)(uint64_t))type metadata accessor for EditorialItem);
  swift_retain();
  *(void *)(v0 + 96) = sub_1E0992FD0();
  uint64_t result = sub_1E099A370();
  qword_1EBF091B8 = v0;
  return result;
}

void sub_1E096C354()
{
  OUTLINED_FUNCTION_19();
  uint64_t v2 = v1;
  v184 = v1;
  v185 = v3;
  uint64_t v4 = v3;
  uint64_t v170 = sub_1E0992360();
  OUTLINED_FUNCTION_2_4();
  uint64_t v167 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  uint64_t v166 = v7;
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE5F48);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_32();
  uint64_t v171 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  uint64_t v11 = OUTLINED_FUNCTION_13(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_36();
  uint64_t v174 = v12;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v13);
  v176 = (char *)&v159 - v14;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v15);
  uint64_t v169 = (uint64_t)&v159 - v16;
  uint64_t v17 = type metadata accessor for EditorialElementLink();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_6_1();
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF40D0);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_32();
  uint64_t v178 = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1378);
  uint64_t v22 = OUTLINED_FUNCTION_13(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_14_8();
  uint64_t v25 = v23 - v24;
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  uint64_t v29 = (char *)&v159 - v28;
  MEMORY[0x1F4188790](v27);
  char v31 = (char *)&v159 - v30;
  uint64_t v182 = sub_1E0996410();
  OUTLINED_FUNCTION_2_4();
  uint64_t v180 = v32;
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_32();
  uint64_t v177 = v34;
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEA7E8);
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_36();
  uint64_t v173 = v36;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v37);
  uint64_t v183 = (uint64_t)&v159 - v38;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  uint64_t v40 = OUTLINED_FUNCTION_13(v39);
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_36();
  uint64_t v172 = v41;
  OUTLINED_FUNCTION_21_0();
  uint64_t v43 = MEMORY[0x1F4188790](v42);
  MEMORY[0x1F4188790](v43);
  v179 = (char *)&v159 - v44;
  OUTLINED_FUNCTION_21_0();
  uint64_t v46 = MEMORY[0x1F4188790](v45);
  uint64_t v47 = MEMORY[0x1F4188790](v46);
  MEMORY[0x1F4188790](v47);
  uint64_t v50 = *v2;
  if (*v4)
  {
    if (!v50) {
      goto LABEL_21;
    }
    uint64_t v165 = (uint64_t)&v159 - v48;
    v164 = v29;
    v163 = v31;
    uint64_t v51 = v49;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E02FC48C();
    char v53 = v52;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v49 = v51;
    char v31 = v163;
    uint64_t v29 = v164;
    if ((v53 & 1) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v165 = (uint64_t)&v159 - v48;
    if (v50) {
      goto LABEL_21;
    }
  }
  uint64_t v54 = v185[1];
  uint64_t v55 = v184[1];
  uint64_t v162 = v49;
  if (v54)
  {
    if (!v55) {
      goto LABEL_21;
    }
    OUTLINED_FUNCTION_34_44();
    swift_bridgeObjectRetain();
    uint64_t v56 = swift_bridgeObjectRetain();
    sub_1E02D5474(v56, v55, v57, v58, v59, v60, v61, v62, v159, (uint64_t)v160, v161, v162, (uint64_t)v163, (uint64_t)v164, v165, v166, v167, v168, v169,
      v170);
    char v64 = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v64 & 1) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    OUTLINED_FUNCTION_34_44();
    if (v55) {
      goto LABEL_21;
    }
  }
  char v65 = (int *)type metadata accessor for EditorialItemPropertyProvider();
  uint64_t v66 = OUTLINED_FUNCTION_103_2(v65[6]);
  uint64_t v67 = v165;
  sub_1E02B8160(v66, v165, &qword_1EBEF1E90);
  v160 = v65;
  uint64_t v68 = v162;
  sub_1E02B8160((uint64_t)v184 + v65[6], v162, &qword_1EBEF1E90);
  uint64_t v69 = v183;
  uint64_t v70 = v183 + *(int *)(v181 + 48);
  sub_1E02B8160(v67, v183, &qword_1EBEF1E90);
  uint64_t v161 = v70;
  sub_1E02B8160(v68, v70, &qword_1EBEF1E90);
  uint64_t v71 = v69;
  uint64_t v72 = v69;
  uint64_t v73 = v182;
  OUTLINED_FUNCTION_13_0(v72, 1, v182);
  if (v77)
  {
    uint64_t v159 = v25;
    sub_1E02B81BC(v68, &qword_1EBEF1E90);
    sub_1E02B81BC(v67, &qword_1EBEF1E90);
    OUTLINED_FUNCTION_13_0(v161, 1, v73);
    if (v77)
    {
      sub_1E02B81BC(v183, &qword_1EBEF1E90);
      goto LABEL_23;
    }
LABEL_19:
    uint64_t v78 = &qword_1EACEA7E8;
    uint64_t v79 = v183;
LABEL_20:
    sub_1E02B81BC(v79, v78);
    goto LABEL_21;
  }
  uint64_t v74 = v71;
  uint64_t v75 = v71;
  uint64_t v76 = (uint64_t)v164;
  sub_1E02B8160(v75, (uint64_t)v164, &qword_1EBEF1E90);
  OUTLINED_FUNCTION_13_0(v161, 1, v73);
  if (v77)
  {
    sub_1E02B81BC(v162, &qword_1EBEF1E90);
    sub_1E02B81BC(v165, &qword_1EBEF1E90);
    (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v76, v73);
    goto LABEL_19;
  }
  uint64_t v159 = v25;
  uint64_t v80 = v180;
  uint64_t v81 = v177;
  OUTLINED_FUNCTION_35();
  v82();
  sub_1E096DD60(&qword_1EACEA818, MEMORY[0x1E4F36F38]);
  LODWORD(v161) = sub_1E099A040();
  uint64_t v83 = *(void (**)(void, void))(v80 + 8);
  v83(v81, v73);
  sub_1E02B81BC(v162, &qword_1EBEF1E90);
  sub_1E02B81BC(v165, &qword_1EBEF1E90);
  v83(v76, v73);
  sub_1E02B81BC(v74, &qword_1EBEF1E90);
  if ((v161 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v183 = v0;
  OUTLINED_FUNCTION_35_20();
  uint64_t v85 = *(int *)(v84 + 28);
  char v86 = v184;
  uint64_t v87 = *(uint64_t *)((char *)v184 + v85);
  if (*(void *)((char *)v185 + v85))
  {
    char v88 = v179;
    if (!v87) {
      goto LABEL_21;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E02FC4BC();
    char v90 = v89;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v90 & 1) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    char v88 = v179;
    if (v87) {
      goto LABEL_21;
    }
  }
  uint64_t v91 = v160;
  uint64_t v92 = OUTLINED_FUNCTION_103_2(v160[8]);
  sub_1E02B8160(v92, (uint64_t)v31, &qword_1EBEF1378);
  sub_1E02B8160((uint64_t)v86 + v91[8], (uint64_t)v29, &qword_1EBEF1378);
  uint64_t v93 = v178;
  uint64_t v94 = v178 + *(int *)(v175 + 48);
  sub_1E02B8160((uint64_t)v31, v178, &qword_1EBEF1378);
  sub_1E02B8160((uint64_t)v29, v94, &qword_1EBEF1378);
  OUTLINED_FUNCTION_13_0(v93, 1, v17);
  if (v77)
  {
    sub_1E02B81BC((uint64_t)v29, &qword_1EBEF1378);
    sub_1E02B81BC((uint64_t)v31, &qword_1EBEF1378);
    OUTLINED_FUNCTION_13_0(v94, 1, v17);
    uint64_t v95 = (uint64_t)v176;
    if (v77)
    {
      sub_1E02B81BC(v178, &qword_1EBEF1378);
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  uint64_t v96 = v159;
  sub_1E02B8160(v178, v159, &qword_1EBEF1378);
  OUTLINED_FUNCTION_13_0(v94, 1, v17);
  uint64_t v98 = v176;
  if (v97)
  {
    sub_1E02B81BC((uint64_t)v29, &qword_1EBEF1378);
    sub_1E02B81BC((uint64_t)v31, &qword_1EBEF1378);
    sub_1E096DC40(v96, (void (*)(void))type metadata accessor for EditorialElementLink);
LABEL_36:
    uint64_t v78 = &qword_1EACF40D0;
    uint64_t v79 = v178;
    goto LABEL_20;
  }
  uint64_t v99 = v183;
  sub_1E096DD00(v94, v183, (void (*)(void))type metadata accessor for EditorialElementLink);
  static EditorialElementLink.== infix(_:_:)(v96, v99);
  char v101 = v100;
  sub_1E096DC40(v99, (void (*)(void))type metadata accessor for EditorialElementLink);
  sub_1E02B81BC((uint64_t)v29, &qword_1EBEF1378);
  sub_1E02B81BC((uint64_t)v31, &qword_1EBEF1378);
  uint64_t v95 = (uint64_t)v98;
  sub_1E096DC40(v96, (void (*)(void))type metadata accessor for EditorialElementLink);
  sub_1E02B81BC(v178, &qword_1EBEF1378);
  if ((v101 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_38:
  uint64_t v102 = (uint64_t)v88;
  OUTLINED_FUNCTION_35_20();
  uint64_t v104 = *(int *)(v103 + 36);
  v105 = v184;
  uint64_t v106 = *(uint64_t *)((char *)v184 + v104);
  if (*(void *)((char *)v185 + v104))
  {
    uint64_t v107 = v174;
    if (!v106) {
      goto LABEL_21;
    }
    swift_bridgeObjectRetain();
    uint64_t v108 = swift_bridgeObjectRetain();
    sub_1E02D5474(v108, v106, v109, v110, v111, v112, v113, v114, v159, (uint64_t)v160, v161, v162, (uint64_t)v163, (uint64_t)v164, v165, v166, v167, v168, v169,
      v170);
    char v116 = v115;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v116 & 1) == 0) {
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v107 = v174;
    if (v106) {
      goto LABEL_21;
    }
  }
  v117 = v160;
  uint64_t v118 = OUTLINED_FUNCTION_103_2(v160[10]);
  sub_1E02B8160(v118, v102, &qword_1EBEF1E90);
  uint64_t v119 = (uint64_t)v163;
  sub_1E02B8160((uint64_t)v105 + v117[10], (uint64_t)v163, &qword_1EBEF1E90);
  uint64_t v120 = v173;
  uint64_t v121 = v173 + *(int *)(v181 + 48);
  sub_1E02B8160(v102, v173, &qword_1EBEF1E90);
  sub_1E02B8160(v119, v121, &qword_1EBEF1E90);
  uint64_t v122 = v182;
  OUTLINED_FUNCTION_13_0(v120, 1, v182);
  if (v77)
  {
    sub_1E02B81BC(v119, &qword_1EBEF1E90);
    sub_1E02B81BC(v102, &qword_1EBEF1E90);
    OUTLINED_FUNCTION_13_0(v121, 1, v122);
    if (v77)
    {
      sub_1E02B81BC(v120, &qword_1EBEF1E90);
      goto LABEL_53;
    }
LABEL_51:
    uint64_t v78 = &qword_1EACEA7E8;
LABEL_62:
    uint64_t v79 = v120;
    goto LABEL_20;
  }
  uint64_t v123 = v172;
  sub_1E02B8160(v120, v172, &qword_1EBEF1E90);
  OUTLINED_FUNCTION_13_0(v121, 1, v122);
  if (v124)
  {
    sub_1E02B81BC(v119, &qword_1EBEF1E90);
    sub_1E02B81BC(v102, &qword_1EBEF1E90);
    (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v123, v122);
    goto LABEL_51;
  }
  uint64_t v125 = v180;
  uint64_t v126 = v177;
  OUTLINED_FUNCTION_35();
  v127();
  sub_1E096DD60(&qword_1EACEA818, MEMORY[0x1E4F36F38]);
  LODWORD(v183) = sub_1E099A040();
  uint64_t v128 = v120;
  v129 = *(void (**)(void, void))(v125 + 8);
  v129(v126, v122);
  sub_1E02B81BC(v119, &qword_1EBEF1E90);
  sub_1E02B81BC(v102, &qword_1EBEF1E90);
  v129(v172, v122);
  uint64_t v107 = v174;
  sub_1E02B81BC(v128, &qword_1EBEF1E90);
  if ((v183 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_53:
  v130 = v160;
  uint64_t v131 = OUTLINED_FUNCTION_103_2(v160[11]);
  uint64_t v132 = v169;
  sub_1E02B8160(v131, v169, &qword_1EBEFA5C0);
  sub_1E02B8160((uint64_t)v105 + v130[11], v95, &qword_1EBEFA5C0);
  uint64_t v120 = v171;
  uint64_t v133 = v171 + *(int *)(v168 + 48);
  sub_1E02B8160(v132, v171, &qword_1EBEFA5C0);
  sub_1E02B8160(v95, v133, &qword_1EBEFA5C0);
  uint64_t v134 = v170;
  OUTLINED_FUNCTION_13_0(v120, 1, v170);
  if (v77)
  {
    sub_1E02B81BC(v95, &qword_1EBEFA5C0);
    uint64_t v120 = v171;
    sub_1E02B81BC(v132, &qword_1EBEFA5C0);
    OUTLINED_FUNCTION_13_0(v133, 1, v134);
    if (v77)
    {
      sub_1E02B81BC(v120, &qword_1EBEFA5C0);
      goto LABEL_64;
    }
    goto LABEL_61;
  }
  sub_1E02B8160(v120, v107, &qword_1EBEFA5C0);
  OUTLINED_FUNCTION_13_0(v133, 1, v134);
  if (v135)
  {
    sub_1E02B81BC(v95, &qword_1EBEFA5C0);
    sub_1E02B81BC(v132, &qword_1EBEFA5C0);
    (*(void (**)(uint64_t, uint64_t))(v167 + 8))(v107, v134);
LABEL_61:
    uint64_t v78 = &qword_1EACE5F48;
    goto LABEL_62;
  }
  uint64_t v136 = v95;
  uint64_t v138 = v166;
  uint64_t v137 = v167;
  OUTLINED_FUNCTION_35();
  v139();
  sub_1E096DD60(&qword_1EACE5F58, MEMORY[0x1E4F276F0]);
  char v140 = sub_1E099A040();
  v141 = *(void (**)(void, void))(v137 + 8);
  v141(v138, v134);
  sub_1E02B81BC(v136, &qword_1EBEFA5C0);
  sub_1E02B81BC(v132, &qword_1EBEFA5C0);
  v141(v107, v134);
  sub_1E02B81BC(v171, &qword_1EBEFA5C0);
  if ((v140 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_64:
  OUTLINED_FUNCTION_35_20();
  uint64_t v143 = *(int *)(v142 + 48);
  uint64_t v144 = *(uint64_t *)((char *)v105 + v143);
  if (*(void *)((char *)v185 + v143))
  {
    if (!v144) {
      goto LABEL_21;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1E02D5454();
    char v146 = v145;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v146 & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if (v144)
  {
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_35_20();
  if ((sub_1E02D521C(*(void *)((char *)v185 + *(int *)(v147 + 52)), *(uint64_t *)((char *)v105 + *(int *)(v147 + 52))) & 1) == 0) {
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_35_20();
  uint64_t v149 = v148;
  if ((sub_1E09934D0() & 1) == 0) {
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_103_2(*(int *)(v149 + 60));
  if ((sub_1E033A61C() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v150 = *(int *)(v149 + 64);
  v151 = (void *)((char *)v185 + v150);
  uint64_t v152 = *(void *)((char *)v185 + v150 + 8);
  v153 = (uint64_t *)((char *)v184 + v150);
  uint64_t v154 = v153[1];
  if (!v152)
  {
    if (v154) {
      goto LABEL_21;
    }
    goto LABEL_81;
  }
  if (v154)
  {
    BOOL v155 = *v151 == *v153 && v152 == v154;
    if (v155 || (sub_1E099AF80() & 1) != 0)
    {
LABEL_81:
      OUTLINED_FUNCTION_10_72();
      if (v156)
      {
        OUTLINED_FUNCTION_10_72();
        if (v157)
        {
          OUTLINED_FUNCTION_10_72();
          if (v158) {
            OUTLINED_FUNCTION_10_72();
          }
        }
      }
    }
  }
LABEL_21:
  OUTLINED_FUNCTION_18();
}

void sub_1E096D254()
{
  OUTLINED_FUNCTION_19();
  uint64_t v3 = v2;
  sub_1E0992360();
  OUTLINED_FUNCTION_2_4();
  uint64_t v34 = v5;
  uint64_t v35 = v4;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_32();
  uint64_t v33 = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
  uint64_t v8 = OUTLINED_FUNCTION_13(v7);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1E0996410();
  OUTLINED_FUNCTION_2_4();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_16_0();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  uint64_t v16 = OUTLINED_FUNCTION_13(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_14_8();
  uint64_t v19 = v17 - v18;
  MEMORY[0x1F4188790](v20);
  uint64_t v22 = (char *)&v32 - v21;
  if (*v0)
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E03022A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  if (v0[1])
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E02DFE1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  uint64_t v23 = (int *)type metadata accessor for EditorialItemPropertyProvider();
  sub_1E02B8160((uint64_t)v0 + v23[6], (uint64_t)v22, &qword_1EBEF1E90);
  OUTLINED_FUNCTION_13_0((uint64_t)v22, 1, v11);
  if (v24)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v25();
    OUTLINED_FUNCTION_6();
    sub_1E096DD60(&qword_1EACE6630, MEMORY[0x1E4F36F38]);
    OUTLINED_FUNCTION_33_50();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
  }
  if (*(void *)((char *)v0 + v23[7]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E0302278();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  sub_1E034DFF0();
  if (*(void *)((char *)v0 + v23[9]))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E02DFE1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  sub_1E02B8160((uint64_t)v0 + v23[10], v19, &qword_1EBEF1E90);
  OUTLINED_FUNCTION_13_0(v19, 1, v11);
  if (v24)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    OUTLINED_FUNCTION_35();
    v26();
    OUTLINED_FUNCTION_6();
    sub_1E096DD60(&qword_1EACE6630, MEMORY[0x1E4F36F38]);
    OUTLINED_FUNCTION_33_50();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
  }
  uint64_t v27 = v35;
  sub_1E02B8160((uint64_t)v0 + v23[11], (uint64_t)v10, &qword_1EBEFA5C0);
  OUTLINED_FUNCTION_13_0((uint64_t)v10, 1, v27);
  if (v24)
  {
    OUTLINED_FUNCTION_17();
  }
  else
  {
    uint64_t v29 = v33;
    uint64_t v28 = v34;
    OUTLINED_FUNCTION_35();
    v30();
    OUTLINED_FUNCTION_6();
    sub_1E096DD60((unint64_t *)&unk_1EACE5F70, MEMORY[0x1E4F276F0]);
    sub_1E099A000();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v27);
  }
  uint64_t v31 = *(void *)((char *)v0 + v23[12]);
  if (v31)
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E02DF4A8(v3, v31);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_21();
  sub_1E02DFCBC();
  swift_bridgeObjectRelease();
  sub_1E0993600();
  sub_1E096DD60((unint64_t *)&qword_1EBEF1830, MEMORY[0x1E4F35FA0]);
  sub_1E099A000();
  sub_1E0995B70();
  sub_1E096DD60(&qword_1EBEF1C90, MEMORY[0x1E4F36CC0]);
  sub_1E099A000();
  if (*(void *)((char *)v0 + v23[16] + 8))
  {
    OUTLINED_FUNCTION_6();
    swift_bridgeObjectRetain();
    sub_1E099A100();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_30_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1E096D830()
{
  return sub_1E099B0E0();
}

void (*sub_1E096D878(void *a1, uint64_t a2))(uint64_t *a1, char a2)
{
  uint64_t v5 = malloc(0x50uLL);
  *a1 = v5;
  v5[8] = a2;
  v5[9] = v2;
  sub_1E096AD00();
  return sub_1E096D8E0;
}

void sub_1E096D8E0(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    sub_1E02B8160(*a1, (uint64_t)v2 + 32, &qword_1EBEF9AC0);
    swift_retain();
    sub_1E096B538((uint64_t)v2 + 32);
    sub_1E02B81BC((uint64_t)v2, &qword_1EBEF9AC0);
  }
  else
  {
    swift_retain();
    sub_1E096B538((uint64_t)v2);
  }
  free(v2);
}

uint64_t sub_1E096D994()
{
  return sub_1E099B0E0();
}

uint64_t sub_1E096D9D0()
{
  return sub_1E096DD60(&qword_1EBEF1470, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
}

uint64_t sub_1E096DA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_1E096DD60(&qword_1EBEF1468, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
  return MEMORY[0x1F40F0200](a1, a4, a3, v7);
}

uint64_t sub_1E096DAAC(uint64_t a1)
{
  uint64_t v2 = sub_1E096DD60(&qword_1EBEF1468, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
  return MEMORY[0x1F40F01F8](a1, v2);
}

uint64_t sub_1E096DB28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1E096DD60(&qword_1EACF40A8, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
  return MEMORY[0x1F40F0270](a1, a3, a2, a4, v8);
}

uint64_t sub_1E096DBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1E096DD60(&qword_1EACF40B0, (void (*)(uint64_t))type metadata accessor for EditorialItemPropertyProvider);
  return MEMORY[0x1F40F0268](a1, a2, a3, v6);
}

uint64_t sub_1E096DC40(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_1E096DC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1E096DD00(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1E096DD60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1E096DDA8()
{
  uint64_t v1 = *v0;
  uint64_t v194 = sub_1E09986A0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v193 = v2;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_49(v4);
  uint64_t v191 = sub_1E0998710();
  OUTLINED_FUNCTION_2_4();
  uint64_t v190 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_49(v7);
  uint64_t v184 = sub_1E09938A0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v183 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_43_1(v10);
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACED8C8);
  MEMORY[0x1F4188790](v182);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_43_1(v12);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A50);
  uint64_t v14 = OUTLINED_FUNCTION_13(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_49(v20);
  uint64_t v181 = sub_1E09943B0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v180 = v21;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_49(v24);
  uint64_t v179 = sub_1E0993600();
  OUTLINED_FUNCTION_2_4();
  uint64_t v178 = v25;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_43_1(v28);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1F90);
  uint64_t v30 = OUTLINED_FUNCTION_13(v29);
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_43_1(v32);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFACB0);
  uint64_t v34 = OUTLINED_FUNCTION_13(v33);
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_43_1(v36);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(qword_1EBEFD408);
  uint64_t v38 = OUTLINED_FUNCTION_13(v37);
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_49(v40);
  uint64_t v189 = sub_1E0999C10();
  OUTLINED_FUNCTION_2_4();
  uint64_t v177 = v41;
  MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v43);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_84();
  OUTLINED_FUNCTION_34();
  MEMORY[0x1F4188790](v45);
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_43_1(v46);
  uint64_t v47 = *(void *)(v1 + *MEMORY[0x1E4F35CE0]);
  uint64_t v48 = sub_1E099A8E0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v195 = v49;
  MEMORY[0x1F4188790](v50);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_34();
  uint64_t v52 = MEMORY[0x1F4188790](v51);
  uint64_t v54 = (char *)v161 - v53;
  MEMORY[0x1F4188790](v52);
  uint64_t v56 = (char *)v161 - v55;
  uint64_t v57 = sub_1E09929B0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v196 = v58;
  MEMORY[0x1F4188790](v59);
  uint64_t v61 = (char *)v161 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_1E0992920();
  OUTLINED_FUNCTION_2_4();
  uint64_t v64 = v63;
  MEMORY[0x1F4188790](v65);
  uint64_t v67 = (char *)v161 - v66;
  v192 = v0;
  sub_1E0992930();
  int v68 = (*(uint64_t (**)(char *, uint64_t))(v64 + 88))(v67, v62);
  if (v68 == *MEMORY[0x1E4F35CD8])
  {
    uint64_t v69 = OUTLINED_FUNCTION_21_53();
    v70(v69);
    swift_getTupleTypeMetadata2();
    uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v196 + 32);
    uint64_t v187 = v57;
    v71(v61, v67, v57);
    uint64_t v72 = v195;
    OUTLINED_FUNCTION_10_73();
    v73();
    uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v72 + 16);
    v74(v54, v56, v48);
    OUTLINED_FUNCTION_13_0((uint64_t)v54, 1, v47);
    uint64_t v75 = v56;
    uint64_t v162 = v56;
    if (v122)
    {
      (*(void (**)(char *, uint64_t))(v72 + 8))(v54, v48);
      OUTLINED_FUNCTION_23_56();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1778);
      swift_dynamicCast();
      OUTLINED_FUNCTION_23_56();
      if (v82)
      {
        if (*((void *)&v201 + 1))
        {
          v161[0] = v61;
          OUTLINED_FUNCTION_22_49();
          __swift_project_boxed_opaque_existential_1(&v203, (uint64_t)v204);
          sub_1E0992EC0();
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFABE0);
          uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEF2080);
          if (swift_dynamicCast())
          {
            sub_1E02B8CF8(v197, (uint64_t)&v200);
            sub_1E02B7F84((uint64_t)&v200, (uint64_t)v199);
            if (OUTLINED_FUNCTION_7_94())
            {
              OUTLINED_FUNCTION_19_70();
              uint64_t v85 = v168;
              OUTLINED_FUNCTION_10_73();
              v86();
              uint64_t v87 = v166;
              sub_1E0999BC0();
              uint64_t v88 = sub_1E0999510();
              OUTLINED_FUNCTION_14_61(v88);
              sub_1E02B8C9C(v87, &qword_1EBEFACB0);
              uint64_t v89 = v165;
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 16))(v165, v85, v48);
              uint64_t v90 = v173;
              uint64_t v91 = v175;
              uint64_t v92 = v172;
              if (v84 == 1)
              {
                uint64_t v93 = *(void (**)(void))(v84 + 8);
                OUTLINED_FUNCTION_22_8();
                v93();
                OUTLINED_FUNCTION_22_8();
                v93();
                uint64_t v81 = 3;
LABEL_57:
                id v80 = (id)*((void *)&v201 + 1);
                __swift_project_boxed_opaque_existential_1(&v200, *((uint64_t *)&v201 + 1));
                uint64_t v152 = OUTLINED_FUNCTION_4_102();
                v153(v152);
                OUTLINED_FUNCTION_25_61();
                uint64_t v154 = OUTLINED_FUNCTION_13_65();
                v155(v154);
                OUTLINED_FUNCTION_3_93();
                v156();
                OUTLINED_FUNCTION_60();
                v157();
                __swift_destroy_boxed_opaque_existential_1((uint64_t)&v200);
                goto LABEL_58;
              }
              uint64_t v146 = v163;
              sub_1E0999BF0();
              uint64_t v147 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
              v147(v89, v48);
              v147(v168, v48);
              uint64_t v148 = sub_1E0997C30();
              OUTLINED_FUNCTION_14_61(v148);
              sub_1E02B8C9C(v146, &qword_1EBEF1F90);
              uint64_t v123 = v169;
              if (v147 == 1)
              {
LABEL_53:
                uint64_t v81 = 3;
                goto LABEL_57;
              }
            }
            else
            {
              OUTLINED_FUNCTION_27_60();
              sub_1E02B8C9C(v83, qword_1EBEFD408);
              uint64_t v90 = v173;
              uint64_t v123 = v169;
              uint64_t v91 = v175;
              uint64_t v92 = v172;
            }
            __swift_project_boxed_opaque_existential_1(&v200, *((uint64_t *)&v201 + 1));
            sub_1E0994850();
            uint64_t v124 = v167;
            sub_1E0993380();
            OUTLINED_FUNCTION_3_93();
            v125();
            sub_1E02BC92C(v91);
            OUTLINED_FUNCTION_3_93();
            v126();
            uint64_t v127 = OUTLINED_FUNCTION_16_65();
            uint64_t v129 = *(void *)(v128 - 256);
            v130(v127);
            __swift_storeEnumTagSinglePayload(v92, 0, 1, v129);
            OUTLINED_FUNCTION_15_63();
            sub_1E096F22C(v92, v124);
            OUTLINED_FUNCTION_13_0(v90, 1, v129);
            if (v122)
            {
              sub_1E02B8C9C(v92, &qword_1EBEF1A50);
              sub_1E02B8C9C(v91, &qword_1EBEF1A50);
              OUTLINED_FUNCTION_13_0(v124, 1, v129);
              if (v122)
              {
                sub_1E02B8C9C(v90, &qword_1EBEF1A50);
                goto LABEL_53;
              }
            }
            else
            {
              sub_1E096F22C(v90, v123);
              OUTLINED_FUNCTION_13_0(v124, 1, v129);
              if (!v135)
              {
                uint64_t v149 = OUTLINED_FUNCTION_12_65();
                v150(v149);
                sub_1E096F294();
                LODWORD(v196) = sub_1E099A040();
                v151 = *(void (**)(void))(v124 + 8);
                OUTLINED_FUNCTION_29_0();
                v151();
                sub_1E02B8C9C(v92, &qword_1EBEF1A50);
                sub_1E02B8C9C(v175, &qword_1EBEF1A50);
                OUTLINED_FUNCTION_29_0();
                v151();
                sub_1E02B8C9C(v90, &qword_1EBEF1A50);
                if (v196) {
                  uint64_t v81 = 3;
                }
                else {
                  uint64_t v81 = 1;
                }
                goto LABEL_57;
              }
              sub_1E02B8C9C(v92, &qword_1EBEF1A50);
              sub_1E02B8C9C(v91, &qword_1EBEF1A50);
              (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v123, v129);
            }
            sub_1E02B8C9C(v90, &qword_1EACED8C8);
            uint64_t v81 = 1;
            goto LABEL_57;
          }
          uint64_t v198 = 0;
          memset(v197, 0, sizeof(v197));
          sub_1E02B8C9C((uint64_t)v197, &qword_1EBEF2090);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v203);
          uint64_t v48 = v161[1];
          uint64_t v72 = v195;
          uint64_t v75 = v56;
          uint64_t v61 = (char *)v161[0];
LABEL_15:
          v74((char *)v57, v75, v48);
          OUTLINED_FUNCTION_13_0(v57, 1, v47);
          if (v122)
          {
            (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v57, v48);
            uint64_t v94 = v187;
          }
          else
          {
            uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEF2080);
            int v96 = swift_dynamicCast();
            uint64_t v94 = v187;
            if (v96)
            {
              uint64_t v97 = v196;
              if (*((void *)&v201 + 1))
              {
                OUTLINED_FUNCTION_22_49();
                sub_1E02B7F84((uint64_t)&v203, (uint64_t)&v200);
                if (OUTLINED_FUNCTION_7_94())
                {
                  OUTLINED_FUNCTION_19_70();
                  OUTLINED_FUNCTION_10_73();
                  v98();
                  uint64_t v99 = v171;
                  sub_1E0999BC0();
                  uint64_t v100 = sub_1E0999510();
                  OUTLINED_FUNCTION_14_61(v100);
                  sub_1E02B8C9C(v99, &qword_1EBEFACB0);
                  (*(void (**)(uint64_t, char *, uint64_t))(v95 + 16))(v170, v56, v48);
                  uint64_t v101 = v186;
                  uint64_t v102 = v188;
                  uint64_t v103 = v185;
                  if (v95 == 1)
                  {
                    uint64_t v104 = *(void (**)(void))(v95 + 8);
                    OUTLINED_FUNCTION_22_8();
                    v104();
                    OUTLINED_FUNCTION_22_8();
                    v104();
LABEL_43:
                    uint64_t v81 = 3;
                    goto LABEL_51;
                  }
                  uint64_t v131 = v164;
                  sub_1E0999BF0();
                  uint64_t v132 = *(void (**)(void))(v95 + 8);
                  OUTLINED_FUNCTION_60();
                  v132();
                  OUTLINED_FUNCTION_60();
                  v132();
                  uint64_t v133 = sub_1E0997C30();
                  LODWORD(v132) = __swift_getEnumTagSinglePayload(v131, 1, v133);
                  uint64_t v134 = v131;
                  uint64_t v114 = v176;
                  sub_1E02B8C9C(v134, &qword_1EBEF1F90);
                  if (v132 == 1) {
                    goto LABEL_43;
                  }
                }
                else
                {
                  OUTLINED_FUNCTION_27_60();
                  sub_1E02B8C9C(v72, qword_1EBEFD408);
                  uint64_t v101 = v186;
                  uint64_t v114 = v176;
                  uint64_t v102 = v188;
                  uint64_t v103 = v185;
                }
                __swift_project_boxed_opaque_existential_1(&v203, (uint64_t)v204);
                sub_1E0994850();
                uint64_t v115 = v174;
                sub_1E0993380();
                OUTLINED_FUNCTION_3_93();
                v116();
                sub_1E02BC92C(v102);
                OUTLINED_FUNCTION_3_93();
                v117();
                uint64_t v118 = OUTLINED_FUNCTION_16_65();
                uint64_t v120 = *(void *)(v119 - 256);
                v121(v118);
                __swift_storeEnumTagSinglePayload(v103, 0, 1, v120);
                OUTLINED_FUNCTION_15_63();
                sub_1E096F22C(v103, v115);
                OUTLINED_FUNCTION_13_0(v101, 1, v120);
                if (v122)
                {
                  sub_1E02B8C9C(v103, &qword_1EBEF1A50);
                  sub_1E02B8C9C(v102, &qword_1EBEF1A50);
                  OUTLINED_FUNCTION_13_0(v115, 1, v120);
                  if (v122)
                  {
                    sub_1E02B8C9C(v101, &qword_1EBEF1A50);
                    goto LABEL_43;
                  }
                }
                else
                {
                  sub_1E096F22C(v101, v114);
                  OUTLINED_FUNCTION_13_0(v115, 1, v120);
                  if (!v122)
                  {
                    OUTLINED_FUNCTION_12_65();
                    OUTLINED_FUNCTION_10_73();
                    v136();
                    sub_1E096F294();
                    uint64_t v137 = v115;
                    char v138 = sub_1E099A040();
                    v139 = *(void (**)(void))(v137 + 8);
                    OUTLINED_FUNCTION_29_0();
                    v139();
                    sub_1E02B8C9C(v103, &qword_1EBEF1A50);
                    sub_1E02B8C9C(v188, &qword_1EBEF1A50);
                    OUTLINED_FUNCTION_29_0();
                    v139();
                    sub_1E02B8C9C(v101, &qword_1EBEF1A50);
                    if (v138) {
                      uint64_t v81 = 3;
                    }
                    else {
                      uint64_t v81 = 1;
                    }
                    goto LABEL_51;
                  }
                  sub_1E02B8C9C(v103, &qword_1EBEF1A50);
                  sub_1E02B8C9C(v102, &qword_1EBEF1A50);
                  (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v114, v120);
                }
                sub_1E02B8C9C(v101, &qword_1EACED8C8);
                uint64_t v81 = 1;
LABEL_51:
                id v80 = v204;
                __swift_project_boxed_opaque_existential_1(&v203, (uint64_t)v204);
                uint64_t v140 = OUTLINED_FUNCTION_4_102();
                v141(v140);
                OUTLINED_FUNCTION_25_61();
                uint64_t v142 = OUTLINED_FUNCTION_13_65();
                v143(v142);
                OUTLINED_FUNCTION_60();
                v144();
                OUTLINED_FUNCTION_3_93();
                v145();
LABEL_58:
                __swift_destroy_boxed_opaque_existential_1((uint64_t)&v203);
                goto LABEL_59;
              }
              goto LABEL_24;
            }
          }
          uint64_t v202 = 0;
          long long v200 = 0u;
          long long v201 = 0u;
          uint64_t v97 = v196;
LABEL_24:
          sub_1E02B8C9C((uint64_t)&v200, &qword_1EBEF2090);
          uint64_t v105 = v48;
          uint64_t v106 = v72;
          sub_1E09929A0();
          uint64_t v107 = sub_1E0557A54();
          uint64_t v108 = self;
          sub_1E0992900();
          uint64_t v109 = v61;
          uint64_t v110 = (void *)sub_1E099A050();
          swift_bridgeObjectRelease();
          id v111 = objc_msgSend(v108, sel_identifierSetWithIdentifier_modelObjectType_specificLibraryDatabaseID_isPossibleLibraryPersistentID_source_, v110, v107, 0, 0, 8);

          sub_1E0999F30();
          id v112 = objc_allocWithZone(MEMORY[0x1E4F38620]);
          id v80 = sub_1E02BD424((uint64_t)v111, v107);
          OUTLINED_FUNCTION_3_93();
          v113();
          (*(void (**)(char *, uint64_t))(v106 + 8))(v162, v105);
          (*(void (**)(char *, uint64_t))(v97 + 8))(v109, v94);
          uint64_t v81 = 4;
          goto LABEL_59;
        }
LABEL_14:
        sub_1E02B8C9C((uint64_t)&v200, &qword_1EBEF1780);
        goto LABEL_15;
      }
    }
    uint64_t v202 = 0;
    long long v200 = 0u;
    long long v201 = 0u;
    goto LABEL_14;
  }
  if (v68 == *MEMORY[0x1E4F35CD0])
  {
    uint64_t v76 = OUTLINED_FUNCTION_21_53();
    v77(v76);
    id v78 = objc_msgSend(self, sel_emptyIdentifierSet);
    sub_1E0999F30();
    id v79 = objc_allocWithZone(MEMORY[0x1E4F38620]);
    id v80 = sub_1E02BD424((uint64_t)v78, 26);
    (*(void (**)(char *, uint64_t))(*(void *)(v47 - 8) + 8))(v67, v47);
    uint64_t v81 = 0;
LABEL_59:
    id v158 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F38678]), sel_initWithInnerObject_, v80);
    id v159 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F386B0]), sel_initWithModel_personalizationStyle_, v158, v81);

    return (uint64_t)v159;
  }
  uint64_t result = sub_1E099AC30();
  __break(1u);
  return result;
}

uint64_t sub_1E096F22C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1A50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1E096F294()
{
  unint64_t result = qword_1EBEFABC0;
  if (!qword_1EBEFABC0)
  {
    sub_1E09938A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBEFABC0);
  }
  return result;
}

uint64_t sub_1E096F2E8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBEF02A0);
  uint64_t v4 = swift_allocError();
  *uint64_t v5 = a2;
  return MEMORY[0x1F4188208](a1, v4);
}

uint64_t sub_1E096F350(uint64_t a1, _OWORD *a2)
{
  sub_1E02BEAFC(a2, *(_OWORD **)(*(void *)(a1 + 64) + 40));
  return swift_continuation_throwingResume();
}

uint64_t sub_1E096F3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 40);
  uint64_t v4 = sub_1E0992360();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a2, v4);
  return swift_continuation_throwingResume();
}

uint64_t sub_1E096F440(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_1E096F460()
{
  OUTLINED_FUNCTION_11_0();
  v0[3] = v1;
  v0[4] = v2;
  v0[2] = v3;
  uint64_t v4 = sub_1E0993230();
  v0[5] = v4;
  OUTLINED_FUNCTION_5_1(v4);
  v0[6] = v5;
  v0[7] = swift_task_alloc();
  v0[8] = swift_task_alloc();
  uint64_t v6 = sub_1E0995130();
  v0[9] = v6;
  OUTLINED_FUNCTION_5_1(v6);
  v0[10] = v7;
  v0[11] = swift_task_alloc();
  v0[12] = swift_task_alloc();
  uint64_t v8 = sub_1E0993110();
  v0[13] = v8;
  OUTLINED_FUNCTION_5_1(v8);
  v0[14] = v9;
  v0[15] = swift_task_alloc();
  OUTLINED_FUNCTION_11_2();
  return MEMORY[0x1F4188298](v10, v11, v12);
}

uint64_t sub_1E096F588()
{
  uint64_t v1 = v0[4];
  if (*(unsigned char *)(v1 + 17))
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[18] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_1E096F8E4;
    uint64_t v3 = v0[7];
    uint64_t v4 = v0[3];
    uint64_t v5 = v0[4];
    return sub_1E096FB90(v3, v4, v5);
  }
  else
  {
    if (*(unsigned char *)(v1 + *(int *)(_s13ConfigurationVMa() + 48)))
    {
      if (qword_1EBEF0278 != -1) {
        swift_once();
      }
      uint64_t v8 = v0[10];
      uint64_t v7 = v0[11];
      uint64_t v9 = v0[9];
      uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EBEF0258);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    }
    else
    {
      sub_1E0995110();
    }
    (*(void (**)(void, void, void))(v0[10] + 32))(v0[12], v0[11], v0[9]);
    sub_1E09930F0();
    uint64_t v11 = (void *)swift_task_alloc();
    v0[16] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_1E096F760;
    uint64_t v12 = v0[8];
    uint64_t v13 = v0[3];
    return MEMORY[0x1F40EE690](v12, v13);
  }
}

uint64_t sub_1E096F760()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_19_12();
  *uint64_t v2 = v1;
  *(void *)(v1 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1E096F840()
{
  OUTLINED_FUNCTION_24_7();
  uint64_t v0 = OUTLINED_FUNCTION_13_66();
  v1(v0);
  uint64_t v2 = OUTLINED_FUNCTION_6_78();
  v3(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_87();
  return v4();
}

uint64_t sub_1E096F8E4()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_19_12();
  *uint64_t v2 = v1;
  *(void *)(v1 + 152) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_2();
  return MEMORY[0x1F4188298](v3, v4, v5);
}

uint64_t sub_1E096F9C4()
{
  OUTLINED_FUNCTION_24_7();
  uint64_t v0 = OUTLINED_FUNCTION_6_78();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_87();
  return v2();
}

uint64_t sub_1E096FA60()
{
  OUTLINED_FUNCTION_24_7();
  uint64_t v0 = OUTLINED_FUNCTION_13_66();
  v1(v0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v2();
}

uint64_t sub_1E096FAFC()
{
  OUTLINED_FUNCTION_24_7();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v0();
}

uint64_t sub_1E096FB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[32] = a2;
  v3[33] = a3;
  v3[31] = a1;
  sub_1E0992520();
  v3[34] = swift_task_alloc();
  uint64_t v4 = sub_1E0992540();
  v3[35] = v4;
  v3[36] = *(void *)(v4 - 8);
  v3[37] = swift_task_alloc();
  sub_1E0991F50();
  v3[38] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_1E096FCAC, 0, 0);
}

uint64_t sub_1E096FCAC()
{
  uint64_t v1 = v0[33];
  int v2 = *(unsigned __int8 *)(v1 + *(int *)(_s13ConfigurationVMa() + 52));
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v1;
  uint64_t v4 = v0[38];
  if (v2 == 1)
  {
    uint64_t v5 = v0 + 2;
    uint64_t v6 = v0 + 18;
    id v7 = objc_allocWithZone(MEMORY[0x1E4FB8660]);
    uint64_t v8 = (void *)sub_1E0970684((uint64_t)sub_1E0970898, v3, (uint64_t)&unk_1F3B7D190, (uint64_t)sub_1E09708A4, (uint64_t)&block_descriptor_6);
    v0[39] = v8;
    swift_task_dealloc();
    sub_1E09930C0();
    id v9 = objc_allocWithZone(MEMORY[0x1E4FB8668]);
    id v10 = sub_1E0970794(v4, v8);
    v0[40] = v10;
    sub_1E097082C();
    id v11 = sub_1E0704438();
    v0[41] = v11;
    v0[2] = v0;
    v0[7] = v0 + 29;
    v0[3] = sub_1E096FFD8;
    uint64_t v12 = swift_continuation_init();
    v0[18] = MEMORY[0x1E4F143A8];
    v0[19] = 0x40000000;
    v0[20] = sub_1E09705C0;
    v0[21] = &block_descriptor_5_0;
    v0[22] = v12;
  }
  else
  {
    uint64_t v6 = v0 + 23;
    uint64_t v5 = v0 + 10;
    id v13 = objc_allocWithZone(MEMORY[0x1E4FB8758]);
    uint64_t v14 = (void *)sub_1E0970684((uint64_t)sub_1E032302C, v3, (uint64_t)&unk_1F3B7D1B8, (uint64_t)sub_1E0970948, (uint64_t)&block_descriptor_13);
    v0[43] = v14;
    swift_task_dealloc();
    sub_1E09930C0();
    id v15 = objc_allocWithZone(MEMORY[0x1E4FB8760]);
    id v10 = sub_1E0970794(v4, v14);
    v0[44] = v10;
    sub_1E097082C();
    id v11 = sub_1E0704438();
    v0[45] = v11;
    v0[10] = v0;
    v0[15] = v0 + 28;
    v0[11] = sub_1E097023C;
    uint64_t v16 = swift_continuation_init();
    v0[23] = MEMORY[0x1E4F143A8];
    v0[24] = 0x40000000;
    v0[25] = sub_1E09705C0;
    v0[26] = &block_descriptor_19;
    v0[27] = v16;
  }
  objc_msgSend(v11, sel_enqueueDataRequest_withCompletionHandler_, v10, v6);
  return MEMORY[0x1F41881E8](v5);
}

uint64_t sub_1E096FFD8()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_19_12();
  *int v2 = v1;
  *int v2 = *v0;
  *(void *)(v1 + 336) = *(void *)(v3 + 48);
  OUTLINED_FUNCTION_11_2();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1E09700B4()
{
  uint64_t v1 = *(void **)(v0 + 320);
  int v2 = *(void **)(v0 + 328);

  uint64_t v3 = *(void **)(v0 + 232);
  *(void *)(v0 + 240) = v3;

  uint64_t v4 = sub_1E097086C((id *)(v0 + 240));
  if (v5 >> 60 != 15)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    id v8 = objc_msgSend(v3, sel_urlResponse);
    if (v8)
    {
      id v9 = v8;
      self;
      uint64_t v10 = swift_dynamicCastObjCClass();
      if (v10)
      {
        OUTLINED_FUNCTION_8_70(v10);

        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_87();
        goto LABEL_8;
      }
      sub_1E04A98E0(v6, v7);
    }
    else
    {
      sub_1E04A98E0(v6, v7);
    }
  }
  sub_1E0992500();
  sub_1E09327C8(MEMORY[0x1E4FBC860]);
  sub_1E0932900();
  OUTLINED_FUNCTION_7_95();
  sub_1E0992530();
  uint64_t v12 = OUTLINED_FUNCTION_10_74();
  v13(v12);
  swift_willThrow();

  OUTLINED_FUNCTION_14_62();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
LABEL_8:
  return v11();
}

uint64_t sub_1E097023C()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_19_12();
  *int v2 = v1;
  *int v2 = *v0;
  *(void *)(v1 + 368) = *(void *)(v3 + 112);
  OUTLINED_FUNCTION_11_2();
  return MEMORY[0x1F4188298](v4, v5, v6);
}

uint64_t sub_1E0970318()
{
  uint64_t v1 = *(void **)(v0 + 352);
  int v2 = *(void **)(v0 + 360);

  uint64_t v3 = *(void **)(v0 + 224);
  *(void *)(v0 + 240) = v3;

  uint64_t v4 = sub_1E097086C((id *)(v0 + 240));
  if (v5 >> 60 != 15)
  {
    uint64_t v6 = v4;
    unint64_t v7 = v5;
    id v8 = objc_msgSend(v3, sel_urlResponse);
    if (v8)
    {
      id v9 = v8;
      self;
      uint64_t v10 = swift_dynamicCastObjCClass();
      if (v10)
      {
        OUTLINED_FUNCTION_8_70(v10);

        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_87();
        goto LABEL_8;
      }
      sub_1E04A98E0(v6, v7);
    }
    else
    {
      sub_1E04A98E0(v6, v7);
    }
  }
  sub_1E0992500();
  sub_1E09327C8(MEMORY[0x1E4FBC860]);
  sub_1E0932900();
  OUTLINED_FUNCTION_7_95();
  sub_1E0992530();
  uint64_t v12 = OUTLINED_FUNCTION_10_74();
  v13(v12);
  swift_willThrow();

  OUTLINED_FUNCTION_14_62();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
LABEL_8:
  return v11();
}

uint64_t sub_1E09704A0()
{
  OUTLINED_FUNCTION_24_7();
  uint64_t v1 = (void *)v0[41];
  uint64_t v3 = (void *)v0[39];
  int v2 = (void *)v0[40];
  swift_willThrow();

  OUTLINED_FUNCTION_14_62();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v4();
}

uint64_t sub_1E0970530()
{
  OUTLINED_FUNCTION_24_7();
  uint64_t v1 = (void *)v0[45];
  uint64_t v3 = (void *)v0[43];
  int v2 = (void *)v0[44];
  swift_willThrow();

  OUTLINED_FUNCTION_14_62();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_7_0();
  return v4();
}

uint64_t sub_1E09705C0(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3) {
    return sub_1E096F2E8(v3, (uint64_t)a3);
  }
  if (a2) {
    return sub_1E096F440(v3, (uint64_t)a2);
  }
  __break(1u);
  return result;
}

void sub_1E0970610(uint64_t a1, void *a2)
{
  int v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_1E097065C(uint64_t a1, uint64_t a2)
{
  return sub_1E0970684(a1, a2, (uint64_t)&unk_1F3B7D1B8, (uint64_t)sub_1E0970948, (uint64_t)&block_descriptor_13);
}

uint64_t sub_1E0970684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  v15[4] = a4;
  v15[5] = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 1107296256;
  v15[2] = sub_1E0970610;
  v15[3] = a5;
  id v11 = _Block_copy(v15);
  swift_retain();
  id v12 = objc_msgSend(v5, sel_initWithBlock_, v11);
  _Block_release(v11);
  swift_release();
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0) {
    return (uint64_t)v12;
  }
  __break(1u);
  return result;
}

id sub_1E0970794(uint64_t a1, void *a2)
{
  id v3 = v2;
  uint64_t v6 = (void *)sub_1E0991F30();
  id v7 = objc_msgSend(v3, sel_initWithURLRequest_requestContext_, v6, a2);

  uint64_t v8 = sub_1E0991F50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  return v7;
}

unint64_t sub_1E097082C()
{
  unint64_t result = qword_1EBEEFC80;
  if (!qword_1EBEEFC80)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBEEFC80);
  }
  return result;
}

uint64_t sub_1E097086C(id *a1)
{
  id v1 = *a1;
  return sub_1E09708CC(v1);
}

void sub_1E0970898(void *a1)
{
  sub_1E070402C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1E09708A4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1E09708CC(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bodyData);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1E09923C0();

  return v3;
}

uint64_t sub_1E097094C()
{
  return sub_1E0971C40((unint64_t *)&unk_1EBEF2538, type metadata accessor for MusicKit_SoftLinking_MPModelEmptyOptions);
}

uint64_t sub_1E0970994()
{
  return sub_1E0971C40((unint64_t *)&unk_1EBEF2550, type metadata accessor for MusicKit_SoftLinking_MPModelEmptyVariants);
}

uint64_t sub_1E09709E4()
{
  dynamic_cast_existential_1_unconditional(v0);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_6_79();
  uint64_t v6 = sub_1E06DF3DC(v1, v2, v3, v4, v5);
  if (dynamic_cast_existential_1_conditional(v0))
  {
    uint64_t v7 = sub_1E0970BC4();
    swift_release();
    return v7;
  }
  return v6;
}

uint64_t sub_1E0970A84()
{
  OUTLINED_FUNCTION_16_66();
  dynamic_cast_existential_1_unconditional(v0);
  uint64_t v1 = (void *)OUTLINED_FUNCTION_7_96();
  sub_1E06DF3DC(v1, v2, v3, v4, v5);
  dynamic_cast_existential_1_unconditional(v0);
  uint64_t v6 = OUTLINED_FUNCTION_6_79();
  uint64_t v11 = sub_1E0691414(v6, v7, v8, v9, v10);
  swift_release();
  return v11;
}

uint64_t sub_1E0970B00(void *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v8 = dynamic_cast_existential_1_conditional(v4);
  if (!v8) {
    return 0;
  }
  uint64_t v10 = sub_1E06DF3DC(a1, a2, a3, v8, v9);
  uint64_t v11 = dynamic_cast_existential_1_unconditional(v4);
  uint64_t v13 = sub_1E0691414(v10, a1, a2, v11, v12);
  swift_release();
  return v13;
}

uint64_t sub_1E0970BC4()
{
  OUTLINED_FUNCTION_16_66();
  if (dynamic_cast_existential_1_conditional(v0))
  {
    uint64_t v1 = OUTLINED_FUNCTION_7_96();
    return sub_1E0691414(v1, v2, v3, v4, v5);
  }
  else
  {
    sub_1E099AA20();
    sub_1E099B1D0();
    sub_1E099A130();
    swift_bridgeObjectRelease();
    sub_1E099A130();
    uint64_t result = sub_1E099AC30();
    __break(1u);
  }
  return result;
}

uint64_t sub_1E0970CA8(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v7 = dynamic_cast_existential_1_unconditional(v3);
  return sub_1E0691414(a1, a2, a3, v7, v8);
}

uint64_t sub_1E0970D08@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for RecentlyAddedMusicItem, a1);
}

uint64_t sub_1E0970D20@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for MusicMovie, a1);
}

uint64_t sub_1E0970D38@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for UploadedAudio, a1);
}

uint64_t sub_1E0970D50@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for UploadedVideo, a1);
}

uint64_t sub_1E0970D68@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for TVShow, a1);
}

uint64_t sub_1E0970D80@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for Composer, a1);
}

uint64_t sub_1E0970D98@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for TVSeason, a1);
}

uint64_t sub_1E0970DB0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F365E0], a1);
}

uint64_t sub_1E0970DC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F37BB0], a1);
}

uint64_t sub_1E0970DE0@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F37CF0], a1);
}

uint64_t sub_1E0970DF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F37E28], a1);
}

uint64_t sub_1E0970E10@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F37F10], a1);
}

uint64_t sub_1E0970E28@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for Playlist.Collaborator, a1);
}

uint64_t sub_1E0970E40@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074((uint64_t (*)(uint64_t))type metadata accessor for Playlist.Folder.Item, a1);
}

uint64_t sub_1E0970E58@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for Playlist.Folder, a1);
}

uint64_t sub_1E0970E70@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for Playlist.Entry.Reaction, a1);
}

uint64_t sub_1E0970E88@<X0>(uint64_t (*a1)(uint64_t)@<X1>, uint64_t a2@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2030);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_4_103();
  OUTLINED_FUNCTION_0_53();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_45_0();
  MEMORY[0x1F4188790](v9);
  uint64_t v10 = OUTLINED_FUNCTION_15_64();
  uint64_t v11 = a1(v10);
  if (dynamic_cast_existential_1_conditional(v11))
  {
    uint64_t v12 = OUTLINED_FUNCTION_1_100();
    v13(v12);
    if (__swift_getEnumTagSinglePayload(v3, 1, v2) == 1)
    {
      sub_1E0971B40(v3);
      uint64_t v14 = sub_1E0998A30();
      uint64_t v15 = a2;
      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v19 = OUTLINED_FUNCTION_3_94();
      v20(v19);
      uint64_t v21 = *(void (**)(void))(v4 + 88);
      swift_retain();
      OUTLINED_FUNCTION_14_63();
      v21();
      uint64_t v22 = OUTLINED_FUNCTION_2_105();
      v23(v22);
      OUTLINED_FUNCTION_8_71();
      uint64_t v24 = OUTLINED_FUNCTION_10_75();
      v25(v24);
      uint64_t v14 = sub_1E0998A30();
      uint64_t v15 = a2;
      uint64_t v16 = 0;
    }
    return __swift_storeEnumTagSinglePayload(v15, v16, 1, v14);
  }
  else
  {
    uint64_t v17 = sub_1E0998A30();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v17);
  }
}

uint64_t sub_1E0971044@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F38300], a1);
}

uint64_t sub_1E097105C@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0971074(MEMORY[0x1E4F383D0], a1);
}

uint64_t sub_1E0971074@<X0>(uint64_t (*a1)(uint64_t)@<X1>, uint64_t a2@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2030);
  MEMORY[0x1F4188790](v7 - 8);
  OUTLINED_FUNCTION_4_103();
  OUTLINED_FUNCTION_0_53();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_45_0();
  MEMORY[0x1F4188790](v9);
  uint64_t v10 = OUTLINED_FUNCTION_15_64();
  uint64_t v11 = a1(v10);
  dynamic_cast_existential_1_unconditional(v11);
  uint64_t v12 = OUTLINED_FUNCTION_1_100();
  v13(v12);
  if (__swift_getEnumTagSinglePayload(v3, 1, v2) == 1)
  {
    sub_1E0971B40(v3);
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v15 = OUTLINED_FUNCTION_3_94();
    v16(v15);
    uint64_t v17 = *(void (**)(void))(v4 + 88);
    swift_retain();
    OUTLINED_FUNCTION_14_63();
    v17();
    uint64_t v18 = OUTLINED_FUNCTION_2_105();
    v19(v18);
    OUTLINED_FUNCTION_8_71();
    uint64_t v20 = OUTLINED_FUNCTION_10_75();
    v21(v20);
    uint64_t v14 = 0;
  }
  uint64_t v22 = sub_1E0998A30();
  return __swift_storeEnumTagSinglePayload(a2, v14, 1, v22);
}

uint64_t sub_1E09711DC(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t sub_1E0971234()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFD360);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1E09DE720;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4100);
  swift_getKeyPath();
  uint64_t v1 = sub_1E0998450();
  swift_release();
  *(void *)(v0 + 32) = v1;
  swift_getKeyPath();
  uint64_t v2 = sub_1E0998450();
  swift_release();
  *(void *)(v0 + 40) = v2;
  swift_getKeyPath();
  uint64_t v3 = sub_1E0998440();
  swift_release();
  *(void *)(v0 + 48) = v3;
  swift_getKeyPath();
  uint64_t v4 = sub_1E0998450();
  swift_release();
  *(void *)(v0 + 56) = v4;
  swift_getKeyPath();
  uint64_t v5 = sub_1E0998450();
  swift_release();
  *(void *)(v0 + 64) = v5;
  uint64_t result = sub_1E099A370();
  qword_1EAD612F8 = v0;
  return result;
}

uint64_t sub_1E0971364()
{
  return sub_1E0994850();
}

uint64_t sub_1E09713E0(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
}

uint64_t *sub_1E0971438()
{
  if (qword_1EACE59E8 != -1) {
    swift_once();
  }
  return &qword_1EAD612F8;
}

void sub_1E0971484()
{
  qword_1EAD61300 = MEMORY[0x1E4FBC860];
}

uint64_t *sub_1E0971498()
{
  if (qword_1EACE59F0 != -1) {
    swift_once();
  }
  return &qword_1EAD61300;
}

id sub_1E09714E4()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F38680]);
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_1E097151C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB500);
  if (swift_dynamicCastClass())
  {
    uint64_t v0 = qword_1EACE5378;
    swift_retain();
    if (v0 != -1) {
      swift_once();
    }
    sub_1E0971BA0();
    if (OUTLINED_FUNCTION_6_5()) {
      goto LABEL_8;
    }
    uint64_t v1 = qword_1EACE5380;
    swift_retain();
    if (v1 != -1) {
      swift_once();
    }
    char v2 = OUTLINED_FUNCTION_6_5();
    swift_release();
    if (v2)
    {
LABEL_8:
      unint64_t v3 = TVEpisode.LegacyModelTVEpisodePropertyKey.rawValue.getter();
      swift_release();
      return v3;
    }
    OUTLINED_FUNCTION_17_67();
    OUTLINED_FUNCTION_2_9();
    sub_1E099A130();
    sub_1E0992C40();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_1_8();
  }
  else
  {
    sub_1E099AA20();
    OUTLINED_FUNCTION_2_9();
    sub_1E099A130();
    sub_1E0992C40();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_1_8();
  }
  uint64_t result = OUTLINED_FUNCTION_12_66();
  __break(1u);
  return result;
}

uint64_t sub_1E097173C@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB500);
  if (swift_dynamicCastClass())
  {
    uint64_t v2 = qword_1EACE5378;
    swift_retain();
    if (v2 != -1) {
      swift_once();
    }
    sub_1E0971BA0();
    if (OUTLINED_FUNCTION_7_7())
    {
      swift_release();
      unint64_t v3 = (unsigned int *)MEMORY[0x1E4F37870];
LABEL_10:
      uint64_t v6 = *v3;
      uint64_t v7 = sub_1E09986A0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(a1, v6, v7);
      sub_1E09986A0();
      return __swift_storeEnumTagSinglePayload(a1, 0, 1, v7);
    }
    uint64_t v4 = qword_1EACE5380;
    swift_retain();
    if (v4 != -1) {
      swift_once();
    }
    char v5 = OUTLINED_FUNCTION_7_7();
    swift_release();
    if (v5)
    {
      swift_release();
      unint64_t v3 = (unsigned int *)MEMORY[0x1E4F37848];
      goto LABEL_10;
    }
    sub_1E099AA20();
    OUTLINED_FUNCTION_2_9();
    sub_1E099A130();
    sub_1E0992C40();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_1_8();
  }
  else
  {
    OUTLINED_FUNCTION_17_67();
    OUTLINED_FUNCTION_2_9();
    sub_1E099A130();
    sub_1E0992C40();
    OUTLINED_FUNCTION_3_3();
    sub_1E099A130();
    OUTLINED_FUNCTION_1_8();
  }
  uint64_t result = OUTLINED_FUNCTION_12_66();
  __break(1u);
  return result;
}

uint64_t sub_1E09719CC()
{
  sub_1E0971438();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E09719FC()
{
  sub_1E0971498();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1E0971A38(void *a1)
{
  a1[1] = sub_1E0971C40(qword_1EACF40E8, (void (*)(uint64_t))type metadata accessor for TVEpisode);
  a1[2] = sub_1E0971C40((unint64_t *)&unk_1EACF0D30, (void (*)(uint64_t))type metadata accessor for TVEpisode);
  uint64_t result = sub_1E0971C40(&qword_1EACF0820, (void (*)(uint64_t))type metadata accessor for TVEpisode);
  a1[3] = result;
  return result;
}

uint64_t sub_1E0971AE4()
{
  return sub_1E09709E4();
}

uint64_t sub_1E0971AFC()
{
  return sub_1E0970BC4();
}

uint64_t sub_1E0971B14@<X0>(uint64_t a1@<X8>)
{
  return sub_1E0970E88((uint64_t (*)(uint64_t))type metadata accessor for TVEpisode, a1);
}

uint64_t sub_1E0971B40(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF2030);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1E0971BA0()
{
  unint64_t result = qword_1EACEB508;
  if (!qword_1EACEB508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EACEB500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACEB508);
  }
  return result;
}

uint64_t sub_1E0971BF8()
{
  return sub_1E0971C40(&qword_1EBEF15D8, (void (*)(uint64_t))type metadata accessor for TVEpisode);
}

uint64_t sub_1E0971C40(unint64_t *a1, void (*a2)(uint64_t))
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

void AudioAnalysis.Tonality.tonic.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void AudioAnalysis.Tonality.mode.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

uint64_t sub_1E0971CAC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x74616C6641 && a2 == 0xE500000000000000;
  if (v2 || (sub_1E099AF80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 65 && a2 == 0xE100000000000000;
    if (v6 || (sub_1E099AF80() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x74616C6642 && a2 == 0xE500000000000000;
      if (v7 || (sub_1E099AF80() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 66 && a2 == 0xE100000000000000;
        if (v8 || (sub_1E099AF80() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 67 && a2 == 0xE100000000000000;
          if (v9 || (sub_1E099AF80() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x707261687343 && a2 == 0xE600000000000000;
            if (v10 || (sub_1E099AF80() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 68 && a2 == 0xE100000000000000;
              if (v11 || (sub_1E099AF80() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                BOOL v12 = a1 == 0x74616C6645 && a2 == 0xE500000000000000;
                if (v12 || (sub_1E099AF80() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else
                {
                  BOOL v13 = a1 == 69 && a2 == 0xE100000000000000;
                  if (v13 || (sub_1E099AF80() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 8;
                  }
                  else
                  {
                    BOOL v14 = a1 == 70 && a2 == 0xE100000000000000;
                    if (v14 || (sub_1E099AF80() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 9;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x707261687346 && a2 == 0xE600000000000000;
                      if (v15 || (sub_1E099AF80() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 10;
                      }
                      else if (a1 == 71 && a2 == 0xE100000000000000)
                      {
                        swift_bridgeObjectRelease();
                        return 11;
                      }
                      else
                      {
                        char v17 = sub_1E099AF80();
                        swift_bridgeObjectRelease();
                        if (v17) {
                          return 11;
                        }
                        else {
                          return 12;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1E097203C(char a1)
{
  uint64_t result = 0x74616C6641;
  switch(a1)
  {
    case 1:
      uint64_t result = 65;
      break;
    case 2:
      uint64_t result = 0x74616C6642;
      break;
    case 3:
      uint64_t result = 66;
      break;
    case 4:
      uint64_t result = 67;
      break;
    case 5:
      uint64_t result = 0x707261687343;
      break;
    case 6:
      uint64_t result = 68;
      break;
    case 7:
      uint64_t result = 0x74616C6645;
      break;
    case 8:
      uint64_t result = 69;
      break;
    case 9:
      uint64_t result = 70;
      break;
    case 10:
      uint64_t result = 0x707261687346;
      break;
    case 11:
      uint64_t result = 71;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1E0972134(uint64_t a1)
{
  unint64_t v2 = sub_1E097322C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972170(uint64_t a1)
{
  unint64_t v2 = sub_1E097322C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E09721AC(uint64_t a1)
{
  unint64_t v2 = sub_1E0973278();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09721E8(uint64_t a1)
{
  unint64_t v2 = sub_1E0973278();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0972224(uint64_t a1)
{
  unint64_t v2 = sub_1E0973194();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972260(uint64_t a1)
{
  unint64_t v2 = sub_1E0973194();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E097229C(uint64_t a1)
{
  unint64_t v2 = sub_1E09731E0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09722D8(uint64_t a1)
{
  unint64_t v2 = sub_1E09731E0();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0972314(uint64_t a1)
{
  unint64_t v2 = sub_1E0973148();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972350(uint64_t a1)
{
  unint64_t v2 = sub_1E0973148();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E097238C()
{
  return sub_1E097203C(*v0);
}

uint64_t sub_1E0972394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E0971CAC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E09723BC(uint64_t a1)
{
  unint64_t v2 = sub_1E0972EE8();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09723F8(uint64_t a1)
{
  unint64_t v2 = sub_1E0972EE8();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0972434(uint64_t a1)
{
  unint64_t v2 = sub_1E09730FC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972470(uint64_t a1)
{
  unint64_t v2 = sub_1E09730FC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E09724AC(uint64_t a1)
{
  unint64_t v2 = sub_1E09730B0();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09724E8(uint64_t a1)
{
  unint64_t v2 = sub_1E09730B0();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0972524(uint64_t a1)
{
  unint64_t v2 = sub_1E0973018();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972560(uint64_t a1)
{
  unint64_t v2 = sub_1E0973018();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E097259C(uint64_t a1)
{
  unint64_t v2 = sub_1E0973064();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09725D8(uint64_t a1)
{
  unint64_t v2 = sub_1E0973064();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0972614(uint64_t a1)
{
  unint64_t v2 = sub_1E0972FCC();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972650(uint64_t a1)
{
  unint64_t v2 = sub_1E0972FCC();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E097268C(uint64_t a1)
{
  unint64_t v2 = sub_1E0972F80();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09726C8(uint64_t a1)
{
  unint64_t v2 = sub_1E0972F80();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0972704(uint64_t a1)
{
  unint64_t v2 = sub_1E0972F34();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0972740(uint64_t a1)
{
  unint64_t v2 = sub_1E0972F34();
  return MEMORY[0x1F41862B0](a1, v2);
}

void *static AudioAnalysis.Tonality.Tonic.allCases.getter()
{
  return &unk_1F3B68E40;
}

void AudioAnalysis.Tonality.Tonic.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11, char a12, char a13, char a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  OUTLINED_FUNCTION_47_0();
  a26 = v30;
  a27 = v31;
  uint64_t v32 = v27;
  uint64_t v34 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4108);
  OUTLINED_FUNCTION_2_4();
  uint64_t v106 = v36;
  uint64_t v107 = v35;
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_127(v37, v80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4110);
  OUTLINED_FUNCTION_2_4();
  uint64_t v103 = v39;
  uint64_t v104 = v38;
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_47(v40, v81);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4118);
  OUTLINED_FUNCTION_2_4();
  uint64_t v100 = v42;
  uint64_t v101 = v41;
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_14_0(v43, v82);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4120);
  OUTLINED_FUNCTION_2_4();
  uint64_t v97 = v45;
  uint64_t v98 = v44;
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_32();
  uint64_t v96 = v46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4128);
  OUTLINED_FUNCTION_2_4();
  uint64_t v94 = v48;
  uint64_t v95 = v47;
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_32();
  uint64_t v93 = v49;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4130);
  OUTLINED_FUNCTION_2_4();
  uint64_t v91 = v50;
  MEMORY[0x1F4188790](v51);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_43_1(v52);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4138);
  OUTLINED_FUNCTION_2_4();
  uint64_t v89 = v53;
  MEMORY[0x1F4188790](v54);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_43_1(v55);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4140);
  OUTLINED_FUNCTION_2_4();
  uint64_t v87 = v56;
  MEMORY[0x1F4188790](v57);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_43_1(v58);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4148);
  OUTLINED_FUNCTION_2_4();
  uint64_t v85 = v59;
  MEMORY[0x1F4188790](v60);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_43_1(v61);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4150);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v62);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_43_1(v63);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4158);
  OUTLINED_FUNCTION_2_4();
  uint64_t v83 = v65;
  MEMORY[0x1F4188790](v66);
  OUTLINED_FUNCTION_16_0();
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4160);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v68);
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4168);
  OUTLINED_FUNCTION_2_4();
  uint64_t v109 = v69;
  uint64_t v110 = v70;
  MEMORY[0x1F4188790](v69);
  OUTLINED_FUNCTION_7_3();
  uint64_t v71 = *v32;
  uint64_t v72 = __swift_project_boxed_opaque_existential_1(v34, v34[3]);
  sub_1E0972EE8();
  uint64_t v108 = v28;
  sub_1E099B180();
  switch(v71)
  {
    case 1:
      v111[5] = 1;
      sub_1E097322C();
      uint64_t v72 = v108;
      uint64_t v67 = v109;
      sub_1E099AE30();
      (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v29, v64);
      goto LABEL_17;
    case 2:
      v111[6] = 2;
      sub_1E09731E0();
      OUTLINED_FUNCTION_3_95();
      uint64_t v74 = OUTLINED_FUNCTION_8_17();
      uint64_t v76 = v111;
      goto LABEL_8;
    case 3:
      v111[7] = 3;
      sub_1E0973194();
      OUTLINED_FUNCTION_3_95();
      uint64_t v74 = OUTLINED_FUNCTION_8_17();
      uint64_t v76 = &a10;
      goto LABEL_8;
    case 4:
      a10 = 4;
      sub_1E0973148();
      OUTLINED_FUNCTION_3_95();
      uint64_t v74 = OUTLINED_FUNCTION_8_17();
      uint64_t v76 = (char *)&a20;
      goto LABEL_8;
    case 5:
      a11 = 5;
      sub_1E09730FC();
      OUTLINED_FUNCTION_3_95();
      uint64_t v74 = OUTLINED_FUNCTION_8_17();
      uint64_t v76 = (char *)&a23;
LABEL_8:
      uint64_t v77 = *((void *)v76 - 32);
      goto LABEL_16;
    case 6:
      a12 = 6;
      sub_1E09730B0();
      OUTLINED_FUNCTION_3_95();
      uint64_t v74 = OUTLINED_FUNCTION_8_17();
      uint64_t v77 = v92;
      goto LABEL_16;
    case 7:
      a13 = 7;
      sub_1E0973064();
      uint64_t v78 = v93;
      OUTLINED_FUNCTION_3_95();
      uint64_t v79 = v94;
      uint64_t v77 = v95;
      goto LABEL_15;
    case 8:
      a14 = 8;
      sub_1E0973018();
      uint64_t v78 = v96;
      OUTLINED_FUNCTION_3_95();
      uint64_t v79 = v97;
      uint64_t v77 = v98;
      goto LABEL_15;
    case 9:
      a15 = 9;
      sub_1E0972FCC();
      uint64_t v78 = v99;
      OUTLINED_FUNCTION_3_95();
      uint64_t v79 = v100;
      uint64_t v77 = v101;
      goto LABEL_15;
    case 10:
      a16 = 10;
      sub_1E0972F80();
      uint64_t v78 = v102;
      OUTLINED_FUNCTION_3_95();
      uint64_t v79 = v103;
      uint64_t v77 = v104;
      goto LABEL_15;
    case 11:
      a17 = 11;
      sub_1E0972F34();
      uint64_t v78 = v105;
      OUTLINED_FUNCTION_3_95();
      uint64_t v79 = v106;
      uint64_t v77 = v107;
LABEL_15:
      uint64_t v75 = *(void (**)(uint64_t, uint64_t))(v79 + 8);
      uint64_t v74 = v78;
LABEL_16:
      v75(v74, v77);
LABEL_17:
      (*(void (**)(void *, uint64_t))(v110 + 8))(v72, v67);
      break;
    default:
      v111[4] = 0;
      sub_1E0973278();
      sub_1E099AE30();
      OUTLINED_FUNCTION_11();
      v73();
      (*(void (**)(void *, uint64_t))(v110 + 8))(v108, v109);
      break;
  }
  OUTLINED_FUNCTION_42();
}

unint64_t sub_1E0972EE8()
{
  unint64_t result = qword_1EACF4170;
  if (!qword_1EACF4170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4170);
  }
  return result;
}

unint64_t sub_1E0972F34()
{
  unint64_t result = qword_1EACF4178;
  if (!qword_1EACF4178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4178);
  }
  return result;
}

unint64_t sub_1E0972F80()
{
  unint64_t result = qword_1EACF4180;
  if (!qword_1EACF4180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4180);
  }
  return result;
}

unint64_t sub_1E0972FCC()
{
  unint64_t result = qword_1EACF4188;
  if (!qword_1EACF4188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4188);
  }
  return result;
}

unint64_t sub_1E0973018()
{
  unint64_t result = qword_1EACF4190;
  if (!qword_1EACF4190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4190);
  }
  return result;
}

unint64_t sub_1E0973064()
{
  unint64_t result = qword_1EACF4198;
  if (!qword_1EACF4198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4198);
  }
  return result;
}

unint64_t sub_1E09730B0()
{
  unint64_t result = qword_1EACF41A0;
  if (!qword_1EACF41A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41A0);
  }
  return result;
}

unint64_t sub_1E09730FC()
{
  unint64_t result = qword_1EACF41A8;
  if (!qword_1EACF41A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41A8);
  }
  return result;
}

unint64_t sub_1E0973148()
{
  unint64_t result = qword_1EACF41B0;
  if (!qword_1EACF41B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41B0);
  }
  return result;
}

unint64_t sub_1E0973194()
{
  unint64_t result = qword_1EACF41B8;
  if (!qword_1EACF41B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41B8);
  }
  return result;
}

unint64_t sub_1E09731E0()
{
  unint64_t result = qword_1EACF41C0;
  if (!qword_1EACF41C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41C0);
  }
  return result;
}

unint64_t sub_1E097322C()
{
  unint64_t result = qword_1EACF41C8;
  if (!qword_1EACF41C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41C8);
  }
  return result;
}

unint64_t sub_1E0973278()
{
  unint64_t result = qword_1EACF41D0;
  if (!qword_1EACF41D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF41D0);
  }
  return result;
}

void AudioAnalysis.Tonality.Tonic.init(from:)()
{
  OUTLINED_FUNCTION_47_0();
  unint64_t v2 = v1;
  uint64_t v39 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF41D8);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_127(v5, v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF41E0);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF41E8);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF41F0);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_47(v9, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF41F8);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4200);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4208);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4210);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4218);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4220);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_14_0(v16, v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4228);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4230);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_7_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4238);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_22();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_1E0972EE8();
  sub_1E099B140();
  if (v0) {
    goto LABEL_7;
  }
  uint64_t v20 = sub_1E099AE00();
  uint64_t v21 = *(void *)(v20 + 16);
  if (!v21
    || (uint64_t v22 = *(unsigned __int8 *)(v20 + 32),
        sub_1E03CB888(1, v21, v20, v20 + 32, 0, (2 * v21) | 1),
        uint64_t v24 = v23,
        unint64_t v26 = v25,
        swift_bridgeObjectRelease(),
        v24 != v26 >> 1))
  {
    uint64_t v27 = sub_1E099AAB0();
    swift_allocError();
    uint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF26A0);
    *uint64_t v29 = &type metadata for AudioAnalysis.Tonality.Tonic;
    sub_1E099AD40();
    sub_1E099AA90();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x1E4FBBA70], v27);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v30 = OUTLINED_FUNCTION_25_62();
    v31(v30);
LABEL_7:
    uint64_t v32 = (uint64_t)v2;
    goto LABEL_8;
  }
  switch(v22)
  {
    case 1:
      sub_1E097322C();
      OUTLINED_FUNCTION_14_64();
      OUTLINED_FUNCTION_26_61();
      goto LABEL_20;
    case 2:
      sub_1E09731E0();
      OUTLINED_FUNCTION_2_106();
      OUTLINED_FUNCTION_18_55();
      goto LABEL_21;
    case 3:
      sub_1E0973194();
      OUTLINED_FUNCTION_2_106();
      OUTLINED_FUNCTION_18_55();
      goto LABEL_21;
    case 4:
      sub_1E0973148();
      OUTLINED_FUNCTION_2_106();
      OUTLINED_FUNCTION_18_55();
      goto LABEL_21;
    case 5:
      sub_1E09730FC();
      OUTLINED_FUNCTION_2_106();
      OUTLINED_FUNCTION_18_55();
      goto LABEL_21;
    case 6:
      sub_1E09730B0();
      OUTLINED_FUNCTION_2_106();
      goto LABEL_21;
    case 7:
      sub_1E0973064();
      OUTLINED_FUNCTION_14_64();
      OUTLINED_FUNCTION_26_61();
LABEL_20:
      OUTLINED_FUNCTION_11();
      v33();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_25_62();
      goto LABEL_22;
    case 8:
      sub_1E0973018();
      OUTLINED_FUNCTION_2_106();
      OUTLINED_FUNCTION_18_55();
      goto LABEL_21;
    case 9:
      sub_1E0972FCC();
      OUTLINED_FUNCTION_2_106();
      goto LABEL_21;
    case 10:
      sub_1E0972F80();
      OUTLINED_FUNCTION_2_106();
      goto LABEL_21;
    case 11:
      sub_1E0972F34();
      OUTLINED_FUNCTION_2_106();
      goto LABEL_21;
    default:
      sub_1E0973278();
      OUTLINED_FUNCTION_2_106();
      OUTLINED_FUNCTION_18_55();
LABEL_21:
      OUTLINED_FUNCTION_11();
      v34();
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_24_66();
LABEL_22:
      OUTLINED_FUNCTION_11();
      v35();
      uint64_t v32 = (uint64_t)v2;
      *uint64_t v39 = v22;
      break;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1(v32);
  OUTLINED_FUNCTION_42();
}

void sub_1E0973C54(void *a1@<X8>)
{
  *a1 = &unk_1F3B68E40;
}

void sub_1E0973C64()
{
}

#error "1E0973C88: call analysis failed (funcsize=6)"

BOOL static AudioAnalysis.Tonality.Mode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AudioAnalysis.Tonality.Mode.hash(into:)()
{
  return sub_1E099B0A0();
}

uint64_t sub_1E0973CE0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F6A616DLL && a2 == 0xE500000000000000;
  if (v2 || (sub_1E099AF80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x726F6E696DLL && a2 == 0xE500000000000000;
    if (v6 || (sub_1E099AF80() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6C61727475656ELL && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_1E099AF80();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_1E0973E28(char a1)
{
  if (!a1) {
    return 0x726F6A616DLL;
  }
  if (a1 == 1) {
    return 0x726F6E696DLL;
  }
  return 0x6C61727475656ELL;
}

uint64_t sub_1E0973E78()
{
  return sub_1E0973E28(*v0);
}

uint64_t sub_1E0973E80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E0973CE0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E0973EA8(uint64_t a1)
{
  unint64_t v2 = sub_1E0974E2C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0973EE4(uint64_t a1)
{
  unint64_t v2 = sub_1E0974E2C();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0973F20(uint64_t a1)
{
  unint64_t v2 = sub_1E0974F10();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0973F5C(uint64_t a1)
{
  unint64_t v2 = sub_1E0974F10();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0973F98(uint64_t a1)
{
  unint64_t v2 = sub_1E0974EC4();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0973FD4(uint64_t a1)
{
  unint64_t v2 = sub_1E0974EC4();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0974010(uint64_t a1)
{
  unint64_t v2 = sub_1E0974E78();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E097404C(uint64_t a1)
{
  unint64_t v2 = sub_1E0974E78();
  return MEMORY[0x1F41862B0](a1, v2);
}

void *static AudioAnalysis.Tonality.Mode.allCases.getter()
{
  return &unk_1F3B68B78;
}

void AudioAnalysis.Tonality.Mode.encode(to:)()
{
  OUTLINED_FUNCTION_47_0();
  uint64_t v1 = v0;
  unint64_t v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4240);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4248);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_16_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4250);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_22();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4258);
  OUTLINED_FUNCTION_2_4();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_22();
  uint64_t v13 = v12 - v11;
  int v14 = *v1;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1E0974E2C();
  sub_1E099B180();
  if (v14)
  {
    if (v14 == 1) {
      sub_1E0974EC4();
    }
    else {
      sub_1E0974E78();
    }
    OUTLINED_FUNCTION_7_5();
  }
  else
  {
    sub_1E0974F10();
    OUTLINED_FUNCTION_7_5();
    OUTLINED_FUNCTION_26_61();
  }
  OUTLINED_FUNCTION_11();
  v15();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  OUTLINED_FUNCTION_42();
}

void AudioAnalysis.Tonality.Mode.init(from:)()
{
  OUTLINED_FUNCTION_47_0();
  unint64_t v3 = v2;
  uint64_t v34 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4280);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_32();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4288);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4290);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_24();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4298);
  OUTLINED_FUNCTION_2_4();
  uint64_t v35 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_16_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1E0974E2C();
  sub_1E099B140();
  if (v0) {
    goto LABEL_10;
  }
  uint64_t v36 = v3;
  uint64_t v11 = v1;
  uint64_t v12 = sub_1E099AE00();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
LABEL_9:
    uint64_t v25 = sub_1E099AAB0();
    swift_allocError();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF26A0);
    void *v27 = &type metadata for AudioAnalysis.Tonality.Mode;
    sub_1E099AD40();
    sub_1E099AA90();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x1E4FBBA70], v25);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v11, v8);
    unint64_t v3 = v36;
LABEL_10:
    uint64_t v28 = (uint64_t)v3;
    goto LABEL_11;
  }
  uint64_t v14 = v1;
  int v15 = *(unsigned __int8 *)(v12 + 32);
  sub_1E03CB888(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  uint64_t v17 = v16;
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    uint64_t v11 = v14;
    goto LABEL_9;
  }
  char v20 = v15;
  if (v15)
  {
    if (v15 == 1)
    {
      sub_1E0974EC4();
      OUTLINED_FUNCTION_6_4();
      uint64_t v21 = v34;
      OUTLINED_FUNCTION_11();
      v22();
      swift_unknownObjectRelease();
      uint64_t v23 = OUTLINED_FUNCTION_1_0();
      v24(v23);
    }
    else
    {
      sub_1E0974E78();
      OUTLINED_FUNCTION_6_4();
      uint64_t v21 = v34;
      OUTLINED_FUNCTION_11();
      v31();
      swift_unknownObjectRelease();
      uint64_t v32 = OUTLINED_FUNCTION_1_0();
      v33(v32);
      char v20 = v15;
    }
  }
  else
  {
    sub_1E0974F10();
    OUTLINED_FUNCTION_6_4();
    OUTLINED_FUNCTION_26_61();
    OUTLINED_FUNCTION_11();
    v29();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_11();
    v30();
    uint64_t v21 = v34;
  }
  *uint64_t v21 = v20;
  uint64_t v28 = (uint64_t)v36;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_1(v28);
  OUTLINED_FUNCTION_42();
}

void sub_1E0974758(void *a1@<X8>)
{
  *a1 = &unk_1F3B68B78;
}

void sub_1E0974768()
{
}

void sub_1E0974780()
{
}

uint64_t static AudioAnalysis.Tonality.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  int v3 = a1[1];
  int v4 = *a2;
  int v5 = a2[1];
  if (v2 == 12)
  {
    if (v4 != 12) {
      return 0;
    }
  }
  else if (v4 == 12 || v2 != v4)
  {
    return 0;
  }
  if (v3 == 3)
  {
    if (v5 != 3) {
      return 0;
    }
  }
  else if (v5 == 3 || v3 != v5)
  {
    return 0;
  }
  return 1;
}

uint64_t AudioAnalysis.Tonality.hash(into:)()
{
  int v1 = v0[1];
  if (*v0 == 12)
  {
    sub_1E099B0B0();
  }
  else
  {
    sub_1E099B0B0();
    sub_1E099B0A0();
  }
  if (v1 == 3) {
    return sub_1E099B0B0();
  }
  sub_1E099B0B0();
  return sub_1E099B0A0();
}

uint64_t sub_1E0974870(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x63696E6F74 && a2 == 0xE500000000000000;
  if (v2 || (sub_1E099AF80() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701080941 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_1E099AF80();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1E0974948(char a1)
{
  if (a1) {
    return 1701080941;
  }
  else {
    return 0x63696E6F74;
  }
}

uint64_t sub_1E0974974()
{
  return sub_1E0974948(*v0);
}

uint64_t sub_1E097497C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1E0974870(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1E09749A4(uint64_t a1)
{
  unint64_t v2 = sub_1E0974F5C();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E09749E0(uint64_t a1)
{
  unint64_t v2 = sub_1E0974F5C();
  return MEMORY[0x1F41862B0](a1, v2);
}

void AudioAnalysis.Tonality.encode(to:)()
{
  OUTLINED_FUNCTION_47_0();
  int v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF42A0);
  OUTLINED_FUNCTION_2_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_2();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_1E0974F5C();
  sub_1E099B180();
  sub_1E0974FA8();
  sub_1E099AE80();
  if (!v0)
  {
    sub_1E0974FF4();
    sub_1E099AE80();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  OUTLINED_FUNCTION_42();
}

uint64_t AudioAnalysis.Tonality.hashValue.getter()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  sub_1E099B090();
  sub_1E099B0B0();
  if (v1 != 12) {
    sub_1E099B0A0();
  }
  sub_1E099B0B0();
  if (v2 != 3) {
    sub_1E099B0A0();
  }
  return sub_1E099B0E0();
}

void AudioAnalysis.Tonality.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14)
{
  OUTLINED_FUNCTION_47_0();
  uint64_t v16 = v15;
  unint64_t v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF42C0);
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_24();
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  sub_1E0974F5C();
  sub_1E099B140();
  if (!v14)
  {
    sub_1E0975040();
    OUTLINED_FUNCTION_28_51();
    sub_1E097508C();
    OUTLINED_FUNCTION_28_51();
    uint64_t v20 = OUTLINED_FUNCTION_5_18();
    v21(v20);
    *unint64_t v18 = a14;
    v18[1] = a12;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  OUTLINED_FUNCTION_42();
}

void sub_1E0974D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AudioAnalysis.Tonality.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8, SBYTE4(vars8), SBYTE5(vars8), SBYTE6(vars8), SHIBYTE(vars8));
}

void sub_1E0974D6C()
{
}

uint64_t sub_1E0974D90()
{
  uint64_t v1 = *v0;
  int v2 = v0[1];
  sub_1E099B090();
  sub_1E099B0B0();
  if (v1 != 12) {
    sub_1E099B0A0();
  }
  sub_1E099B0B0();
  if (v2 != 3) {
    sub_1E099B0A0();
  }
  return sub_1E099B0E0();
}

unint64_t sub_1E0974E2C()
{
  unint64_t result = qword_1EACF4260;
  if (!qword_1EACF4260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4260);
  }
  return result;
}

unint64_t sub_1E0974E78()
{
  unint64_t result = qword_1EACF4268;
  if (!qword_1EACF4268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4268);
  }
  return result;
}

unint64_t sub_1E0974EC4()
{
  unint64_t result = qword_1EACF4270;
  if (!qword_1EACF4270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4270);
  }
  return result;
}

unint64_t sub_1E0974F10()
{
  unint64_t result = qword_1EACF4278;
  if (!qword_1EACF4278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4278);
  }
  return result;
}

unint64_t sub_1E0974F5C()
{
  unint64_t result = qword_1EACF42A8;
  if (!qword_1EACF42A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF42A8);
  }
  return result;
}

unint64_t sub_1E0974FA8()
{
  unint64_t result = qword_1EACF42B0;
  if (!qword_1EACF42B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF42B0);
  }
  return result;
}

unint64_t sub_1E0974FF4()
{
  unint64_t result = qword_1EACF42B8;
  if (!qword_1EACF42B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF42B8);
  }
  return result;
}

unint64_t sub_1E0975040()
{
  unint64_t result = qword_1EACF42C8;
  if (!qword_1EACF42C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF42C8);
  }
  return result;
}

unint64_t sub_1E097508C()
{
  unint64_t result = qword_1EACF42D0;
  if (!qword_1EACF42D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF42D0);
  }
  return result;
}

uint64_t sub_1E09750D8()
{
  return sub_1E041B55C(&qword_1EACF42D8, &qword_1EACF42E0);
}

unint64_t sub_1E0975104()
{
  unint64_t result = qword_1EACF42E8;
  if (!qword_1EACF42E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF42E8);
  }
  return result;
}

uint64_t sub_1E0975150()
{
  return sub_1E041B55C(&qword_1EACF42F0, &qword_1EACF42F8);
}

unint64_t sub_1E097517C()
{
  unint64_t result = qword_1EACF4300;
  if (!qword_1EACF4300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4300);
  }
  return result;
}

unint64_t sub_1E09751CC()
{
  unint64_t result = qword_1EACF4308;
  if (!qword_1EACF4308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4308);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s8TonalityVwet(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 65283 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 65283 < 0xFF0000) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (v4) {
        goto LABEL_15;
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
LABEL_15:
        int v5 = (*a1 | (v4 << 16)) - 65284;
        return (v5 + 1);
      }
      int v4 = *((unsigned __int8 *)a1 + 2);
      if (*((unsigned char *)a1 + 2)) {
        goto LABEL_15;
      }
    }
  }
LABEL_17:
  if (*((unsigned __int8 *)a1 + 1) <= 3u) {
    int v6 = 3;
  }
  else {
    int v6 = *((unsigned __int8 *)a1 + 1);
  }
  int v7 = v6 - 4;
  if (*((unsigned __int8 *)a1 + 1) < 3u) {
    int v5 = -1;
  }
  else {
    int v5 = v7;
  }
  return (v5 + 1);
}

uint64_t _s8TonalityVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65283 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65283 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 253) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 253;
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
        JUMPOUT(0x1E097538CLL);
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
          *(unsigned char *)(result + 1) = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for AudioAnalysis.Tonality()
{
}

void type metadata accessor for AudioAnalysis.Tonality.Tonic()
{
}

void type metadata accessor for AudioAnalysis.Tonality.Mode()
{
}

unsigned char *_s8TonalityV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E09754B0);
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

ValueMetadata *_s8TonalityV10CodingKeysOMa()
{
  return &_s8TonalityV10CodingKeysON;
}

unsigned char *_s8TonalityV4ModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1E09755B4);
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

ValueMetadata *_s8TonalityV4ModeO10CodingKeysOMa()
{
  return &_s8TonalityV4ModeO10CodingKeysON;
}

ValueMetadata *_s8TonalityV4ModeO15MajorCodingKeysOMa()
{
  return &_s8TonalityV4ModeO15MajorCodingKeysON;
}

ValueMetadata *_s8TonalityV4ModeO15MinorCodingKeysOMa()
{
  return &_s8TonalityV4ModeO15MinorCodingKeysON;
}

ValueMetadata *_s8TonalityV4ModeO17NeutralCodingKeysOMa()
{
  return &_s8TonalityV4ModeO17NeutralCodingKeysON;
}

unsigned char *_s8TonalityV5TonicOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *unint64_t result = a2 + 11;
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
        JUMPOUT(0x1E09756E8);
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
          *unint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *_s8TonalityV5TonicO10CodingKeysOMa()
{
  return &_s8TonalityV5TonicO10CodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO15AflatCodingKeysOMa()
{
  return &_s8TonalityV5TonicO15AflatCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11ACodingKeysOMa()
{
  return &_s8TonalityV5TonicO11ACodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO15BflatCodingKeysOMa()
{
  return &_s8TonalityV5TonicO15BflatCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11BCodingKeysOMa()
{
  return &_s8TonalityV5TonicO11BCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11CCodingKeysOMa()
{
  return &_s8TonalityV5TonicO11CCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO16CsharpCodingKeysOMa()
{
  return &_s8TonalityV5TonicO16CsharpCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11DCodingKeysOMa()
{
  return &_s8TonalityV5TonicO11DCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO15EflatCodingKeysOMa()
{
  return &_s8TonalityV5TonicO15EflatCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11ECodingKeysOMa()
{
  return &_s8TonalityV5TonicO11ECodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11FCodingKeysOMa()
{
  return &_s8TonalityV5TonicO11FCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO16FsharpCodingKeysOMa()
{
  return &_s8TonalityV5TonicO16FsharpCodingKeysON;
}

ValueMetadata *_s8TonalityV5TonicO11GCodingKeysOMa()
{
  return &_s8TonalityV5TonicO11GCodingKeysON;
}

unint64_t sub_1E09757E4()
{
  unint64_t result = qword_1EACF4310;
  if (!qword_1EACF4310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4310);
  }
  return result;
}

unint64_t sub_1E0975834()
{
  unint64_t result = qword_1EACF4318;
  if (!qword_1EACF4318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4318);
  }
  return result;
}

unint64_t sub_1E0975884()
{
  unint64_t result = qword_1EACF4320;
  if (!qword_1EACF4320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4320);
  }
  return result;
}

unint64_t sub_1E09758D4()
{
  unint64_t result = qword_1EACF4328;
  if (!qword_1EACF4328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4328);
  }
  return result;
}

unint64_t sub_1E0975924()
{
  unint64_t result = qword_1EACF4330;
  if (!qword_1EACF4330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4330);
  }
  return result;
}

unint64_t sub_1E0975974()
{
  unint64_t result = qword_1EACF4338;
  if (!qword_1EACF4338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4338);
  }
  return result;
}

unint64_t sub_1E09759C4()
{
  unint64_t result = qword_1EACF4340;
  if (!qword_1EACF4340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4340);
  }
  return result;
}

unint64_t sub_1E0975A14()
{
  unint64_t result = qword_1EACF4348;
  if (!qword_1EACF4348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4348);
  }
  return result;
}

unint64_t sub_1E0975A64()
{
  unint64_t result = qword_1EACF4350;
  if (!qword_1EACF4350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4350);
  }
  return result;
}

unint64_t sub_1E0975AB4()
{
  unint64_t result = qword_1EACF4358;
  if (!qword_1EACF4358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4358);
  }
  return result;
}

unint64_t sub_1E0975B04()
{
  unint64_t result = qword_1EACF4360;
  if (!qword_1EACF4360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4360);
  }
  return result;
}

unint64_t sub_1E0975B54()
{
  unint64_t result = qword_1EACF4368;
  if (!qword_1EACF4368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4368);
  }
  return result;
}

unint64_t sub_1E0975BA4()
{
  unint64_t result = qword_1EACF4370;
  if (!qword_1EACF4370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4370);
  }
  return result;
}

unint64_t sub_1E0975BF4()
{
  unint64_t result = qword_1EACF4378;
  if (!qword_1EACF4378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4378);
  }
  return result;
}

unint64_t sub_1E0975C44()
{
  unint64_t result = qword_1EACF4380;
  if (!qword_1EACF4380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4380);
  }
  return result;
}

unint64_t sub_1E0975C94()
{
  unint64_t result = qword_1EACF4388;
  if (!qword_1EACF4388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4388);
  }
  return result;
}

unint64_t sub_1E0975CE4()
{
  unint64_t result = qword_1EACF4390;
  if (!qword_1EACF4390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4390);
  }
  return result;
}

unint64_t sub_1E0975D34()
{
  unint64_t result = qword_1EACF4398;
  if (!qword_1EACF4398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4398);
  }
  return result;
}

unint64_t sub_1E0975D84()
{
  unint64_t result = qword_1EACF43A0;
  if (!qword_1EACF43A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43A0);
  }
  return result;
}

unint64_t sub_1E0975DD4()
{
  unint64_t result = qword_1EACF43A8;
  if (!qword_1EACF43A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43A8);
  }
  return result;
}

unint64_t sub_1E0975E24()
{
  unint64_t result = qword_1EACF43B0;
  if (!qword_1EACF43B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43B0);
  }
  return result;
}

unint64_t sub_1E0975E74()
{
  unint64_t result = qword_1EACF43B8;
  if (!qword_1EACF43B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43B8);
  }
  return result;
}

unint64_t sub_1E0975EC4()
{
  unint64_t result = qword_1EACF43C0;
  if (!qword_1EACF43C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43C0);
  }
  return result;
}

unint64_t sub_1E0975F14()
{
  unint64_t result = qword_1EACF43C8;
  if (!qword_1EACF43C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43C8);
  }
  return result;
}

unint64_t sub_1E0975F64()
{
  unint64_t result = qword_1EACF43D0;
  if (!qword_1EACF43D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43D0);
  }
  return result;
}

unint64_t sub_1E0975FB4()
{
  unint64_t result = qword_1EACF43D8;
  if (!qword_1EACF43D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43D8);
  }
  return result;
}

unint64_t sub_1E0976004()
{
  unint64_t result = qword_1EACF43E0;
  if (!qword_1EACF43E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43E0);
  }
  return result;
}

unint64_t sub_1E0976054()
{
  unint64_t result = qword_1EACF43E8;
  if (!qword_1EACF43E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43E8);
  }
  return result;
}

unint64_t sub_1E09760A4()
{
  unint64_t result = qword_1EACF43F0;
  if (!qword_1EACF43F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43F0);
  }
  return result;
}

unint64_t sub_1E09760F4()
{
  unint64_t result = qword_1EACF43F8;
  if (!qword_1EACF43F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF43F8);
  }
  return result;
}

unint64_t sub_1E0976144()
{
  unint64_t result = qword_1EACF4400;
  if (!qword_1EACF4400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4400);
  }
  return result;
}

unint64_t sub_1E0976194()
{
  unint64_t result = qword_1EACF4408;
  if (!qword_1EACF4408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4408);
  }
  return result;
}

unint64_t sub_1E09761E4()
{
  unint64_t result = qword_1EACF4410;
  if (!qword_1EACF4410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4410);
  }
  return result;
}

unint64_t sub_1E0976234()
{
  unint64_t result = qword_1EACF4418;
  if (!qword_1EACF4418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4418);
  }
  return result;
}

unint64_t sub_1E0976284()
{
  unint64_t result = qword_1EACF4420;
  if (!qword_1EACF4420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4420);
  }
  return result;
}

unint64_t sub_1E09762D4()
{
  unint64_t result = qword_1EACF4428;
  if (!qword_1EACF4428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4428);
  }
  return result;
}

unint64_t sub_1E0976324()
{
  unint64_t result = qword_1EACF4430;
  if (!qword_1EACF4430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4430);
  }
  return result;
}

unint64_t sub_1E0976374()
{
  unint64_t result = qword_1EACF4438;
  if (!qword_1EACF4438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4438);
  }
  return result;
}

unint64_t sub_1E09763C4()
{
  unint64_t result = qword_1EACF4440;
  if (!qword_1EACF4440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4440);
  }
  return result;
}

void *sub_1E0976418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E097643C(a1, a2, a3, &qword_1EACF4540);
}

void *sub_1E0976424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E097643C(a1, a2, a3, &qword_1EACF4538);
}

void *sub_1E0976430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1E097643C(a1, a2, a3, &qword_1EACF4548);
}

void *sub_1E097643C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v9 = *(void *)(*v4 + 120);
  sub_1E0995190();
  swift_allocObject();
  *(void *)((char *)v4 + v9) = sub_1E0995180();
  v4[2] = a1;
  v4[3] = a2;
  *(void *)((char *)v4 + *(void *)(*v4 + 112)) = a3;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  swift_storeEnumTagMultiPayload();
  return v4;
}

uint64_t sub_1E09764F4(uint64_t a1, uint64_t a2)
{
  uint64_t v183 = a1;
  uint64_t v4 = type metadata accessor for StorePlatformUploadedVideo();
  uint64_t v5 = OUTLINED_FUNCTION_13(v4);
  MEMORY[0x1F4188790](v5);
  uint64_t v171 = (uint64_t)v161 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for StorePlatformUploadedAudio();
  uint64_t v8 = OUTLINED_FUNCTION_13(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_66_3(v9, v161[0]);
  uint64_t v10 = type metadata accessor for StorePlatformTVShow();
  uint64_t v11 = OUTLINED_FUNCTION_13(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_15_34(v12, v161[0]);
  uint64_t v13 = type metadata accessor for StorePlatformTVSeason();
  uint64_t v14 = OUTLINED_FUNCTION_13(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_124_0(v15, v161[0]);
  uint64_t v16 = type metadata accessor for StorePlatformTVEpisode();
  uint64_t v17 = OUTLINED_FUNCTION_13(v16);
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_8_55(v18, v161[0]);
  uint64_t v19 = type metadata accessor for StorePlatformStation();
  uint64_t v20 = OUTLINED_FUNCTION_13(v19);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_32();
  uint64_t v166 = v21;
  uint64_t v22 = type metadata accessor for StorePlatformSong();
  uint64_t v23 = OUTLINED_FUNCTION_13(v22);
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_32();
  uint64_t v165 = v24;
  uint64_t v25 = type metadata accessor for StorePlatformSocialProfile();
  uint64_t v26 = OUTLINED_FUNCTION_13(v25);
  MEMORY[0x1F4188790](v26);
  uint64_t v164 = (uint64_t)v161 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for StorePlatformRecordLabel();
  uint64_t v29 = OUTLINED_FUNCTION_13(v28);
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_45_6(v30, v161[0]);
  uint64_t v31 = type metadata accessor for StorePlatformRadioShow();
  uint64_t v32 = OUTLINED_FUNCTION_13(v31);
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_49((uint64_t)v161 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v34 = type metadata accessor for StorePlatformPlaylist();
  uint64_t v35 = OUTLINED_FUNCTION_13(v34);
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_49((uint64_t)v161 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = type metadata accessor for StorePlatformMusicVideo();
  uint64_t v38 = OUTLINED_FUNCTION_13(v37);
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_49((uint64_t)v161 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v40 = type metadata accessor for StorePlatformMusicMovie();
  uint64_t v41 = OUTLINED_FUNCTION_13(v40);
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_49((uint64_t)v161 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = type metadata accessor for StorePlatformGenre();
  uint64_t v44 = OUTLINED_FUNCTION_13(v43);
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_49(v45);
  uint64_t v46 = type metadata accessor for StorePlatformCurator();
  uint64_t v47 = OUTLINED_FUNCTION_13(v46);
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_49(v48);
  uint64_t v49 = type metadata accessor for StorePlatformArtist();
  uint64_t v50 = OUTLINED_FUNCTION_13(v49);
  MEMORY[0x1F4188790](v50);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_49(v51);
  uint64_t v52 = type metadata accessor for StorePlatformAlbum();
  uint64_t v53 = OUTLINED_FUNCTION_13(v52);
  MEMORY[0x1F4188790](v53);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_49(v54);
  uint64_t v55 = type metadata accessor for StorePlatformGenericMusicItem();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v56);
  uint64_t v182 = (char *)v161 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v58);
  OUTLINED_FUNCTION_84();
  uint64_t v181 = (char *)v59;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v60);
  OUTLINED_FUNCTION_84();
  uint64_t v180 = (char *)v61;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v62);
  OUTLINED_FUNCTION_84();
  uint64_t v179 = (char *)v63;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v64);
  OUTLINED_FUNCTION_84();
  uint64_t v178 = (char *)v65;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v66);
  OUTLINED_FUNCTION_84();
  uint64_t v177 = (char *)v67;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v68);
  OUTLINED_FUNCTION_84();
  uint64_t v176 = (char *)v69;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v70);
  OUTLINED_FUNCTION_84();
  uint64_t v175 = v71;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v72);
  OUTLINED_FUNCTION_84();
  uint64_t v174 = (char *)v73;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v74);
  OUTLINED_FUNCTION_84();
  uint64_t v173 = (char *)v75;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1F4188790](v76);
  OUTLINED_FUNCTION_84();
  uint64_t v172 = (char *)v77;
  OUTLINED_FUNCTION_21_0();
  uint64_t v79 = MEMORY[0x1F4188790](v78);
  uint64_t v81 = (uint64_t *)((char *)v161 - v80);
  uint64_t v82 = MEMORY[0x1F4188790](v79);
  uint64_t v84 = (uint64_t *)((char *)v161 - v83);
  uint64_t v85 = MEMORY[0x1F4188790](v82);
  uint64_t v87 = (char *)v161 - v86;
  uint64_t v88 = MEMORY[0x1F4188790](v85);
  uint64_t v90 = (char *)v161 - v89;
  uint64_t v91 = MEMORY[0x1F4188790](v88);
  uint64_t v93 = (char *)v161 - v92;
  MEMORY[0x1F4188790](v91);
  uint64_t v95 = (uint64_t *)((char *)v161 - v94);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF45C8);
  uint64_t v97 = OUTLINED_FUNCTION_13(v96);
  MEMORY[0x1F4188790](v97);
  OUTLINED_FUNCTION_8_0();
  uint64_t v99 = (uint64_t)v2 + *(int *)(v98 + 56);
  sub_1E04A7328(v183, (uint64_t)v2);
  uint64_t v100 = a2;
  uint64_t v101 = v99;
  sub_1E04A7328(v100, v99);
  uint64_t v102 = (uint64_t)v2;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v106 = OUTLINED_FUNCTION_13_67();
      sub_1E04A7328(v106, (uint64_t)v93);
      if (OUTLINED_FUNCTION_11_76() == 1)
      {
        OUTLINED_FUNCTION_52_34(v101, (void (*)(void))type metadata accessor for StorePlatformArtist, (uint64_t)&v184);
        uint64_t v107 = OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E0505338(v107, v108);
        uint64_t v110 = type metadata accessor for StorePlatformArtist;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformArtist;
      goto LABEL_56;
    case 2u:
      uint64_t v111 = OUTLINED_FUNCTION_13_67();
      sub_1E04A7328(v111, (uint64_t)v90);
      if (OUTLINED_FUNCTION_11_76() == 2)
      {
        OUTLINED_FUNCTION_52_34(v101, (void (*)(void))type metadata accessor for StorePlatformCurator, (uint64_t)&v185);
        char v109 = sub_1E053365C((uint64_t)v90, (uint64_t)v2);
        id v112 = type metadata accessor for StorePlatformCurator;
        sub_1E09897C8((uint64_t)v2, (void (*)(void))type metadata accessor for StorePlatformCurator);
        uint64_t v113 = (uint64_t)v90;
        goto LABEL_37;
      }
      uint64_t v104 = type metadata accessor for StorePlatformCurator;
      uint64_t v105 = (uint64_t)v90;
      goto LABEL_57;
    case 3u:
      uint64_t v114 = OUTLINED_FUNCTION_13_67();
      sub_1E04A7328(v114, (uint64_t)v87);
      if (OUTLINED_FUNCTION_11_76() == 3)
      {
        uint64_t v115 = v162;
        sub_1E097A1B4(v101, v162, (void (*)(void))type metadata accessor for StorePlatformGenre);
        char v109 = sub_1E0665270((uint64_t)v87, v115);
        sub_1E09897C8(v115, (void (*)(void))type metadata accessor for StorePlatformGenre);
        uint64_t v113 = (uint64_t)v87;
        char v116 = type metadata accessor for StorePlatformGenre;
        goto LABEL_38;
      }
      uint64_t v104 = type metadata accessor for StorePlatformGenre;
      uint64_t v105 = (uint64_t)v87;
      goto LABEL_57;
    case 4u:
      uint64_t v117 = OUTLINED_FUNCTION_13_67();
      sub_1E04A7328(v117, (uint64_t)v84);
      if (OUTLINED_FUNCTION_11_76() == 4)
      {
        OUTLINED_FUNCTION_52_34(v101, (void (*)(void))type metadata accessor for StorePlatformMusicMovie, (uint64_t)&v186);
        char v109 = sub_1E0673C98(v84, v2);
        id v112 = type metadata accessor for StorePlatformMusicMovie;
        sub_1E09897C8((uint64_t)v2, (void (*)(void))type metadata accessor for StorePlatformMusicMovie);
        uint64_t v113 = (uint64_t)v84;
        goto LABEL_37;
      }
      uint64_t v104 = type metadata accessor for StorePlatformMusicMovie;
      uint64_t v105 = (uint64_t)v84;
      goto LABEL_57;
    case 5u:
      uint64_t v118 = OUTLINED_FUNCTION_13_67();
      sub_1E04A7328(v118, (uint64_t)v81);
      if (OUTLINED_FUNCTION_11_76() == 5)
      {
        OUTLINED_FUNCTION_52_34(v101, (void (*)(void))type metadata accessor for StorePlatformMusicVideo, (uint64_t)&v187);
        char v109 = sub_1E070C03C(v81, v2);
        id v112 = type metadata accessor for StorePlatformMusicVideo;
        sub_1E09897C8((uint64_t)v2, (void (*)(void))type metadata accessor for StorePlatformMusicVideo);
        uint64_t v113 = (uint64_t)v81;
        goto LABEL_37;
      }
      uint64_t v104 = type metadata accessor for StorePlatformMusicVideo;
      uint64_t v105 = (uint64_t)v81;
      goto LABEL_57;
    case 6u:
      uint64_t v119 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v172;
      sub_1E04A7328(v119, (uint64_t)v172);
      if (OUTLINED_FUNCTION_11_76() == 6)
      {
        OUTLINED_FUNCTION_52_34(v101, (void (*)(void))type metadata accessor for StorePlatformPlaylist, (uint64_t)&v188);
        uint64_t v120 = OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E0878710(v120, v121);
        uint64_t v110 = type metadata accessor for StorePlatformPlaylist;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformPlaylist;
      goto LABEL_56;
    case 7u:
      uint64_t v122 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v173;
      sub_1E04A7328(v122, (uint64_t)v173);
      if (OUTLINED_FUNCTION_11_76() == 7)
      {
        OUTLINED_FUNCTION_52_34(v101, (void (*)(void))type metadata accessor for StorePlatformRadioShow, (uint64_t)&v189);
        uint64_t v123 = OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E07D65B0(v123, v124);
        uint64_t v110 = type metadata accessor for StorePlatformRadioShow;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformRadioShow;
      goto LABEL_56;
    case 8u:
      uint64_t v125 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v174;
      sub_1E04A7328(v125, (uint64_t)v174);
      if (OUTLINED_FUNCTION_11_76() == 8)
      {
        uint64_t v102 = v163;
        sub_1E097A1B4(v101, v163, (void (*)(void))type metadata accessor for StorePlatformRecordLabel);
        uint64_t v126 = OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E08732B8(v126, v127);
        uint64_t v110 = type metadata accessor for StorePlatformRecordLabel;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformRecordLabel;
      goto LABEL_56;
    case 9u:
      uint64_t v128 = v175;
      sub_1E04A7328((uint64_t)v2, v175);
      if (OUTLINED_FUNCTION_11_76() == 9)
      {
        uint64_t v129 = v164;
        sub_1E097A1B4(v101, v164, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
        uint64_t v130 = OUTLINED_FUNCTION_96();
        char v109 = sub_1E056F2F0(v130, v131);
        sub_1E09897C8(v129, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
        sub_1E09897C8(v128, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
        uint64_t v132 = v102;
        goto LABEL_39;
      }
      sub_1E09897C8(v128, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
      uint64_t v55 = (uint64_t)v2;
      goto LABEL_58;
    case 0xAu:
      uint64_t v133 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v176;
      sub_1E04A7328(v133, (uint64_t)v176);
      if (OUTLINED_FUNCTION_11_76() == 10)
      {
        uint64_t v102 = v165;
        sub_1E097A1B4(v101, v165, (void (*)(void))type metadata accessor for StorePlatformSong);
        uint64_t v134 = (void *)OUTLINED_FUNCTION_77_1();
        sub_1E04E74A4(v134, v135);
        char v109 = v136;
        uint64_t v110 = type metadata accessor for StorePlatformSong;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformSong;
      goto LABEL_56;
    case 0xBu:
      uint64_t v137 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v177;
      sub_1E04A7328(v137, (uint64_t)v177);
      if (OUTLINED_FUNCTION_11_76() == 11)
      {
        uint64_t v102 = v166;
        sub_1E097A1B4(v101, v166, (void (*)(void))type metadata accessor for StorePlatformStation);
        uint64_t v138 = OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E0943C68(v138, v139);
        uint64_t v110 = type metadata accessor for StorePlatformStation;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformStation;
      goto LABEL_56;
    case 0xCu:
      uint64_t v140 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v178;
      sub_1E04A7328(v140, (uint64_t)v178);
      if (OUTLINED_FUNCTION_11_76() == 12)
      {
        uint64_t v102 = v167;
        sub_1E097A1B4(v101, v167, (void (*)(void))type metadata accessor for StorePlatformTVEpisode);
        v141 = (void *)OUTLINED_FUNCTION_77_1();
        sub_1E03F8800(v141, v142);
        char v109 = v143;
        uint64_t v110 = type metadata accessor for StorePlatformTVEpisode;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformTVEpisode;
      goto LABEL_56;
    case 0xDu:
      uint64_t v144 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v179;
      sub_1E04A7328(v144, (uint64_t)v179);
      if (OUTLINED_FUNCTION_11_76() == 13)
      {
        uint64_t v102 = v168;
        sub_1E097A1B4(v101, v168, (void (*)(void))type metadata accessor for StorePlatformTVSeason);
        char v145 = (void *)OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E0961B90(v145, v146);
        uint64_t v110 = type metadata accessor for StorePlatformTVSeason;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformTVSeason;
      goto LABEL_56;
    case 0xEu:
      uint64_t v147 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v180;
      sub_1E04A7328(v147, (uint64_t)v180);
      if (OUTLINED_FUNCTION_11_76() == 14)
      {
        uint64_t v102 = v169;
        sub_1E097A1B4(v101, v169, (void (*)(void))type metadata accessor for StorePlatformTVShow);
        uint64_t v148 = (void *)OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E04FEB08(v148, v149);
        uint64_t v110 = type metadata accessor for StorePlatformTVShow;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformTVShow;
      goto LABEL_56;
    case 0xFu:
      uint64_t v150 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v181;
      sub_1E04A7328(v150, (uint64_t)v181);
      if (OUTLINED_FUNCTION_11_76() == 15)
      {
        uint64_t v102 = v170;
        sub_1E097A1B4(v101, v170, (void (*)(void))type metadata accessor for StorePlatformUploadedAudio);
        v151 = (void *)OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E04AC8A4(v151, v152);
        uint64_t v110 = type metadata accessor for StorePlatformUploadedAudio;
        goto LABEL_36;
      }
      char v156 = type metadata accessor for StorePlatformUploadedAudio;
      goto LABEL_56;
    case 0x10u:
      uint64_t v153 = OUTLINED_FUNCTION_13_67();
      uint64_t v93 = v182;
      sub_1E04A7328(v153, (uint64_t)v182);
      if (OUTLINED_FUNCTION_11_76() == 16)
      {
        uint64_t v102 = v171;
        sub_1E097A1B4(v101, v171, (void (*)(void))type metadata accessor for StorePlatformUploadedVideo);
        uint64_t v154 = (void *)OUTLINED_FUNCTION_77_1();
        char v109 = sub_1E068DB10(v154, v155);
        uint64_t v110 = type metadata accessor for StorePlatformUploadedVideo;
LABEL_36:
        id v112 = v110;
        sub_1E09897C8(v102, (void (*)(void))v110);
        uint64_t v113 = (uint64_t)v93;
        goto LABEL_37;
      }
      char v156 = type metadata accessor for StorePlatformUploadedVideo;
LABEL_56:
      uint64_t v104 = v156;
      uint64_t v105 = (uint64_t)v93;
      goto LABEL_57;
    default:
      uint64_t v103 = OUTLINED_FUNCTION_13_67();
      sub_1E04A7328(v103, (uint64_t)v95);
      if (OUTLINED_FUNCTION_11_76())
      {
        uint64_t v104 = type metadata accessor for StorePlatformAlbum;
        uint64_t v105 = (uint64_t)v95;
LABEL_57:
        sub_1E09897C8(v105, (void (*)(void))v104);
LABEL_58:
        sub_1E02B81BC(v55, &qword_1EACF45C8);
        char v109 = 0;
      }
      else
      {
        uint64_t v158 = v161[0];
        sub_1E097A1B4(v101, v161[0], (void (*)(void))type metadata accessor for StorePlatformAlbum);
        sub_1E0741F80(v95, v158);
        char v160 = v159;
        id v112 = type metadata accessor for StorePlatformAlbum;
        sub_1E09897C8(v158, (void (*)(void))type metadata accessor for StorePlatformAlbum);
        uint64_t v113 = (uint64_t)v95;
        char v109 = v160;
LABEL_37:
        char v116 = v112;
LABEL_38:
        sub_1E09897C8(v113, (void (*)(void))v116);
        uint64_t v132 = v55;
LABEL_39:
        sub_1E09897C8(v132, (void (*)(void))type metadata accessor for StorePlatformGenericMusicItem);
      }
      return v109 & 1;
  }
}

uint64_t sub_1E09774A0(uint64_t a1)
{
  uint64_t v70 = a1;
  uint64_t v9 = type metadata accessor for StorePlatformUploadedVideo();
  uint64_t v10 = OUTLINED_FUNCTION_13(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_42_45(v11, v59);
  uint64_t v12 = type metadata accessor for StorePlatformUploadedAudio();
  uint64_t v13 = OUTLINED_FUNCTION_13(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_121_1(v14, v59);
  uint64_t v15 = type metadata accessor for StorePlatformTVShow();
  uint64_t v16 = OUTLINED_FUNCTION_13(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_167(v17, v59);
  uint64_t v18 = type metadata accessor for StorePlatformTVSeason();
  uint64_t v19 = OUTLINED_FUNCTION_13(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_125_7(v20, v59);
  uint64_t v21 = type metadata accessor for StorePlatformTVEpisode();
  uint64_t v22 = OUTLINED_FUNCTION_13(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_69_0(v23, v59);
  uint64_t v24 = type metadata accessor for StorePlatformStation();
  uint64_t v25 = OUTLINED_FUNCTION_13(v24);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_220(v26, v59);
  uint64_t v27 = type metadata accessor for StorePlatformSong();
  uint64_t v28 = OUTLINED_FUNCTION_13(v27);
  MEMORY[0x1F4188790](v28);
  uint64_t v62 = (uint64_t)&v59 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for StorePlatformSocialProfile();
  uint64_t v31 = OUTLINED_FUNCTION_13(v30);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_169(v32, v59);
  uint64_t v33 = type metadata accessor for StorePlatformRecordLabel();
  uint64_t v34 = OUTLINED_FUNCTION_13(v33);
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_168(v35, v59);
  uint64_t v36 = type metadata accessor for StorePlatformRadioShow();
  uint64_t v37 = OUTLINED_FUNCTION_13(v36);
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_6_1();
  uint64_t v38 = type metadata accessor for StorePlatformPlaylist();
  uint64_t v39 = OUTLINED_FUNCTION_13(v38);
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_8_0();
  uint64_t v40 = type metadata accessor for StorePlatformMusicVideo();
  uint64_t v41 = OUTLINED_FUNCTION_13(v40);
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_10_1();
  uint64_t v42 = type metadata accessor for StorePlatformMusicMovie();
  uint64_t v43 = OUTLINED_FUNCTION_13(v42);
  MEMORY[0x1F4188790](v43);
  OUTLINED_FUNCTION_12();
  uint64_t v44 = type metadata accessor for StorePlatformGenre();
  uint64_t v45 = OUTLINED_FUNCTION_13(v44);
  MEMORY[0x1F4188790](v45);
  uint64_t v47 = (char *)&v59 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for StorePlatformCurator();
  uint64_t v49 = OUTLINED_FUNCTION_13(v48);
  MEMORY[0x1F4188790](v49);
  OUTLINED_FUNCTION_11_4();
  uint64_t v50 = type metadata accessor for StorePlatformArtist();
  uint64_t v51 = OUTLINED_FUNCTION_13(v50);
  MEMORY[0x1F4188790](v51);
  OUTLINED_FUNCTION_19_1();
  uint64_t v52 = type metadata accessor for StorePlatformAlbum();
  uint64_t v53 = OUTLINED_FUNCTION_13(v52);
  MEMORY[0x1F4188790](v53);
  OUTLINED_FUNCTION_6_0();
  type metadata accessor for StorePlatformGenericMusicItem();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v54);
  OUTLINED_FUNCTION_17_0();
  sub_1E04A7328(v69, v2);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1E097A1B4(v2, v7, (void (*)(void))type metadata accessor for StorePlatformArtist);
      sub_1E099B0A0();
      sub_1E0506314();
      uint64_t v55 = type metadata accessor for StorePlatformArtist;
      uint64_t v56 = v7;
      return sub_1E09897C8(v56, (void (*)(void))v55);
    case 2u:
      sub_1E097A1B4(v2, v6, (void (*)(void))type metadata accessor for StorePlatformCurator);
      sub_1E099B0A0();
      sub_1E0534724();
      uint64_t v55 = type metadata accessor for StorePlatformCurator;
      uint64_t v56 = v6;
      return sub_1E09897C8(v56, (void (*)(void))v55);
    case 3u:
      sub_1E097A1B4(v2, (uint64_t)v47, (void (*)(void))type metadata accessor for StorePlatformGenre);
      sub_1E099B0A0();
      sub_1E0666048();
      uint64_t v55 = type metadata accessor for StorePlatformGenre;
      uint64_t v56 = (uint64_t)v47;
      return sub_1E09897C8(v56, (void (*)(void))v55);
    case 4u:
      sub_1E097A1B4(v2, v5, (void (*)(void))type metadata accessor for StorePlatformMusicMovie);
      sub_1E099B0A0();
      sub_1E06751F0();
      uint64_t v55 = type metadata accessor for StorePlatformMusicMovie;
      uint64_t v56 = v5;
      return sub_1E09897C8(v56, (void (*)(void))v55);
    case 5u:
      sub_1E097A1B4(v2, v4, (void (*)(void))type metadata accessor for StorePlatformMusicVideo);
      sub_1E099B0A0();
      sub_1E070D484();
      uint64_t v55 = type metadata accessor for StorePlatformMusicVideo;
      uint64_t v56 = v4;
      return sub_1E09897C8(v56, (void (*)(void))v55);
    case 6u:
      sub_1E097A1B4(v2, v3, (void (*)(void))type metadata accessor for StorePlatformPlaylist);
      sub_1E099B0A0();
      sub_1E0879AC8();
      uint64_t v55 = type metadata accessor for StorePlatformPlaylist;
      uint64_t v56 = v3;
      return sub_1E09897C8(v56, (void (*)(void))v55);
    case 7u:
      sub_1E097A1B4(v2, v1, (void (*)(void))type metadata accessor for StorePlatformRadioShow);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E07D7388();
      uint64_t v57 = type metadata accessor for StorePlatformRadioShow;
      goto LABEL_19;
    case 8u:
      uint64_t v1 = v60;
      sub_1E097A1B4(v2, v60, (void (*)(void))type metadata accessor for StorePlatformRecordLabel);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E087405C();
      uint64_t v57 = type metadata accessor for StorePlatformRecordLabel;
      goto LABEL_19;
    case 9u:
      uint64_t v1 = v61;
      sub_1E097A1B4(v2, v61, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E056FCC4();
      uint64_t v57 = type metadata accessor for StorePlatformSocialProfile;
      goto LABEL_19;
    case 0xAu:
      uint64_t v1 = v62;
      sub_1E097A1B4(v2, v62, (void (*)(void))type metadata accessor for StorePlatformSong);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E04E8BC0();
      uint64_t v57 = type metadata accessor for StorePlatformSong;
      goto LABEL_19;
    case 0xBu:
      uint64_t v1 = v63;
      sub_1E097A1B4(v2, v63, (void (*)(void))type metadata accessor for StorePlatformStation);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E09452B4();
      uint64_t v57 = type metadata accessor for StorePlatformStation;
      goto LABEL_19;
    case 0xCu:
      uint64_t v1 = v64;
      sub_1E097A1B4(v2, v64, (void (*)(void))type metadata accessor for StorePlatformTVEpisode);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E03F9D8C();
      uint64_t v57 = type metadata accessor for StorePlatformTVEpisode;
      goto LABEL_19;
    case 0xDu:
      uint64_t v1 = v65;
      sub_1E097A1B4(v2, v65, (void (*)(void))type metadata accessor for StorePlatformTVSeason);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E096253C();
      uint64_t v57 = type metadata accessor for StorePlatformTVSeason;
      goto LABEL_19;
    case 0xEu:
      uint64_t v1 = v66;
      sub_1E097A1B4(v2, v66, (void (*)(void))type metadata accessor for StorePlatformTVShow);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E04FFA5C();
      uint64_t v57 = type metadata accessor for StorePlatformTVShow;
      goto LABEL_19;
    case 0xFu:
      uint64_t v1 = v67;
      sub_1E097A1B4(v2, v67, (void (*)(void))type metadata accessor for StorePlatformUploadedAudio);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E04AD598();
      uint64_t v57 = type metadata accessor for StorePlatformUploadedAudio;
      goto LABEL_19;
    case 0x10u:
      uint64_t v1 = v68;
      sub_1E097A1B4(v2, v68, (void (*)(void))type metadata accessor for StorePlatformUploadedVideo);
      sub_1E099B0A0();
      OUTLINED_FUNCTION_280();
      sub_1E068EA98();
      uint64_t v57 = type metadata accessor for StorePlatformUploadedVideo;
LABEL_19:
      uint64_t v55 = v57;
      uint64_t v56 = v1;
      break;
    default:
      sub_1E097A1B4(v2, v8, (void (*)(void))type metadata accessor for StorePlatformAlbum);
      sub_1E099B0A0();
      sub_1E0743678();
      uint64_t v55 = type metadata accessor for StorePlatformAlbum;
      uint64_t v56 = v8;
      break;
  }
  return sub_1E09897C8(v56, (void (*)(void))v55);
}

uint64_t sub_1E0977E04()
{
  sub_1E099B090();
  sub_1E09774A0((uint64_t)v1);
  return sub_1E099B0E0();
}

uint64_t sub_1E0977E50()
{
  sub_1E099B090();
  sub_1E09774A0((uint64_t)v1);
  return sub_1E099B0E0();
}

uint64_t sub_1E0977E8C(uint64_t a1)
{
  unint64_t v2 = sub_1E097A168();
  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1E0977EC8(uint64_t a1)
{
  unint64_t v2 = sub_1E097A168();
  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t sub_1E0977F04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v185 = a2;
  sub_1E099AAA0();
  OUTLINED_FUNCTION_2_4();
  uint64_t v175 = v4;
  uint64_t v176 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v174 = (char *)&v167 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  uint64_t v6 = type metadata accessor for StorePlatformUploadedVideo();
  uint64_t v7 = OUTLINED_FUNCTION_13(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_45_6(v8, (uint64_t)v167);
  uint64_t v9 = type metadata accessor for StorePlatformUploadedAudio();
  uint64_t v10 = OUTLINED_FUNCTION_13(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_49((uint64_t)&v167 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for StorePlatformTVShow();
  uint64_t v13 = OUTLINED_FUNCTION_13(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_49((uint64_t)&v167 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = type metadata accessor for StorePlatformTVSeason();
  uint64_t v16 = OUTLINED_FUNCTION_13(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_49((uint64_t)&v167 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = type metadata accessor for StorePlatformTVEpisode();
  uint64_t v19 = OUTLINED_FUNCTION_13(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_49((uint64_t)&v167 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = type metadata accessor for StorePlatformStation();
  uint64_t v22 = OUTLINED_FUNCTION_13(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_8_55(v23, (uint64_t)v167);
  uint64_t v24 = type metadata accessor for StorePlatformSong();
  uint64_t v25 = OUTLINED_FUNCTION_13(v24);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_124_0(v26, (uint64_t)v167);
  uint64_t v27 = type metadata accessor for StorePlatformSocialProfile();
  uint64_t v28 = OUTLINED_FUNCTION_13(v27);
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_15_34(v29, (uint64_t)v167);
  uint64_t v30 = type metadata accessor for StorePlatformRecordLabel();
  uint64_t v31 = OUTLINED_FUNCTION_13(v30);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_66_3(v32, (uint64_t)v167);
  uint64_t v33 = type metadata accessor for StorePlatformPlaylist();
  uint64_t v34 = OUTLINED_FUNCTION_13(v33);
  MEMORY[0x1F4188790](v34);
  uint64_t v181 = (uint64_t)&v167 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  uint64_t v36 = type metadata accessor for StorePlatformMusicVideo();
  uint64_t v37 = OUTLINED_FUNCTION_13(v36);
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_32();
  uint64_t v182 = v38;
  OUTLINED_FUNCTION_5();
  uint64_t v39 = type metadata accessor for StorePlatformMusicMovie();
  uint64_t v40 = OUTLINED_FUNCTION_13(v39);
  MEMORY[0x1F4188790](v40);
  uint64_t v183 = (uint64_t)&v167 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  uint64_t v42 = type metadata accessor for StorePlatformCurator();
  uint64_t v43 = OUTLINED_FUNCTION_13(v42);
  MEMORY[0x1F4188790](v43);
  uint64_t v184 = (uint64_t)&v167 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  uint64_t v45 = type metadata accessor for StorePlatformArtist();
  uint64_t v46 = OUTLINED_FUNCTION_13(v45);
  MEMORY[0x1F4188790](v46);
  uint64_t v186 = (char *)&v167 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  uint64_t v48 = type metadata accessor for StorePlatformAlbum();
  uint64_t v49 = OUTLINED_FUNCTION_13(v48);
  MEMORY[0x1F4188790](v49);
  uint64_t v51 = (char *)&v167 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4518);
  OUTLINED_FUNCTION_2_4();
  uint64_t v187 = v52;
  MEMORY[0x1F4188790](v53);
  OUTLINED_FUNCTION_12();
  uint64_t v54 = type metadata accessor for StorePlatformGenericMusicItem();
  OUTLINED_FUNCTION_14();
  uint64_t v56 = MEMORY[0x1F4188790](v55);
  uint64_t v58 = (char *)&v167 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v56);
  uint64_t v60 = (char *)&v167 - v59;
  uint64_t v61 = a1[3];
  uint64_t v190 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v61);
  sub_1E097A168();
  uint64_t v62 = v188;
  sub_1E099B140();
  if (!v62)
  {
    uint64_t v167 = v58;
    uint64_t v64 = (uint64_t)v186;
    uint64_t v168 = v54;
    uint64_t v188 = v60;
    uint64_t v66 = sub_1E099ADB0();
    uint64_t v67 = v65;
    BOOL v68 = v66 == 0x6D75626C61 && v65 == (char *)0xE500000000000000;
    uint64_t v63 = v190;
    if (v68 || (OUTLINED_FUNCTION_71_18(), (OUTLINED_FUNCTION_45_42() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_59_27();
      sub_1E07454B8(v189, (uint64_t)v51);
      uint64_t v69 = OUTLINED_FUNCTION_8_72();
      v70(v69);
      OUTLINED_FUNCTION_12_67((uint64_t)v51, v71, (void (*)(void))type metadata accessor for StorePlatformAlbum);
      OUTLINED_FUNCTION_5_88();
LABEL_9:
      swift_storeEnumTagMultiPayload();
LABEL_10:
      uint64_t v72 = v185;
LABEL_11:
      sub_1E097A1B4(v66, v72, (void (*)(void))type metadata accessor for StorePlatformGenericMusicItem);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
    }
    BOOL v73 = v66 == 0x747369747261 && v67 == (char *)0xE600000000000000;
    if (v73 || (OUTLINED_FUNCTION_69_17(), (OUTLINED_FUNCTION_45_42() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_59_27();
      sub_1E05074E4(v189, v64);
      uint64_t v74 = OUTLINED_FUNCTION_8_72();
      v75(v74);
      OUTLINED_FUNCTION_12_67(v64, v77, (void (*)(void))type metadata accessor for StorePlatformArtist);
      OUTLINED_FUNCTION_5_88();
      goto LABEL_9;
    }
    BOOL v78 = v66 == 0x646E617262 && v67 == (char *)0xE500000000000000;
    if (v78 || (OUTLINED_FUNCTION_64_21(), (OUTLINED_FUNCTION_45_42() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_59_27();
      uint64_t v79 = v184;
      sub_1E053587C(v189, v184);
      uint64_t v80 = OUTLINED_FUNCTION_8_72();
      v81(v80);
      OUTLINED_FUNCTION_12_67(v79, v82, (void (*)(void))type metadata accessor for StorePlatformCurator);
      OUTLINED_FUNCTION_5_88();
      goto LABEL_9;
    }
    OUTLINED_FUNCTION_32_48();
    BOOL v85 = v66 == v84 && v67 == v83;
    if (v85 || (OUTLINED_FUNCTION_31_48(), (OUTLINED_FUNCTION_45_42() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      uint64_t v86 = (uint64_t)v167;
      sub_1E07B46D4(v63, (uint64_t)v167);
      uint64_t v87 = OUTLINED_FUNCTION_8_72();
      v88(v87);
      OUTLINED_FUNCTION_12_67(v86, v89, (void (*)(void))type metadata accessor for StorePlatformGenericMusicItem);
      goto LABEL_10;
    }
    if (v66 == 0x6569766F6DLL && v67 == (char *)0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      uint64_t v72 = v185;
      uint64_t v66 = (uint64_t)v188;
      goto LABEL_38;
    }
    OUTLINED_FUNCTION_79_17();
    uint64_t v184 = v66;
    uint64_t v186 = v67;
    char v91 = sub_1E099AF80();
    uint64_t v72 = v185;
    uint64_t v66 = (uint64_t)v188;
    if (v91)
    {
      swift_bridgeObjectRelease();
LABEL_38:
      OUTLINED_FUNCTION_59_27();
      uint64_t v92 = v183;
      sub_1E0672660(v189, v183);
      uint64_t v93 = OUTLINED_FUNCTION_62_18();
      v94(v93);
      sub_1E097A1B4(v92, v66, (void (*)(void))type metadata accessor for StorePlatformMusicMovie);
      swift_storeEnumTagMultiPayload();
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_54_28();
    uint64_t v96 = v186;
    if (v184 == v97 && v186 == v95)
    {
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    OUTLINED_FUNCTION_53_33();
    if (sub_1E099AF80())
    {
      swift_bridgeObjectRelease();
      uint64_t v63 = v190;
LABEL_46:
      OUTLINED_FUNCTION_59_27();
      uint64_t v99 = v182;
      sub_1E070AA3C(v189, v182);
      uint64_t v102 = OUTLINED_FUNCTION_1_101();
      v103(v102);
      OUTLINED_FUNCTION_12_67(v99, v104, (void (*)(void))type metadata accessor for StorePlatformMusicVideo);
      OUTLINED_FUNCTION_5_88();
      goto LABEL_9;
    }
    OUTLINED_FUNCTION_74_19();
    OUTLINED_FUNCTION_73_21();
    BOOL v105 = v68 && v96 == (char *)0xE800000000000000;
    if (v105 || (OUTLINED_FUNCTION_60_0(), (OUTLINED_FUNCTION_10_76() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_187_0();
      sub_1E087B31C(v189, v181);
      uint64_t v106 = OUTLINED_FUNCTION_1_101();
      v107(v106);
      OUTLINED_FUNCTION_12_67(v181, v108, (void (*)(void))type metadata accessor for StorePlatformPlaylist);
      OUTLINED_FUNCTION_5_88();
      goto LABEL_53;
    }
    BOOL v109 = v184 == 0x614C64726F636572 && v186 == (char *)0xEB000000006C6562;
    if (v109 || (OUTLINED_FUNCTION_10_76() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_187_0();
      sub_1E0874EBC(v189, v180);
      uint64_t v110 = OUTLINED_FUNCTION_1_101();
      v111(v110);
      OUTLINED_FUNCTION_12_67(v180, v112, (void (*)(void))type metadata accessor for StorePlatformRecordLabel);
      OUTLINED_FUNCTION_5_88();
      goto LABEL_53;
    }
    OUTLINED_FUNCTION_28_52();
    if (v184 == v114 && v186 == v113)
    {
      OUTLINED_FUNCTION_63_20();
    }
    else
    {
      OUTLINED_FUNCTION_27_61();
      if ((OUTLINED_FUNCTION_10_76() & 1) == 0)
      {
        OUTLINED_FUNCTION_73_21();
        BOOL v119 = v68 && v186 == (char *)0xE400000000000000;
        if (v119 || (OUTLINED_FUNCTION_10_76() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_187_0();
          sub_1E04E5BD4(v189, v178);
          uint64_t v120 = OUTLINED_FUNCTION_1_101();
          v121(v120);
          OUTLINED_FUNCTION_12_67(v178, v122, (void (*)(void))type metadata accessor for StorePlatformSong);
          OUTLINED_FUNCTION_5_88();
        }
        else
        {
          OUTLINED_FUNCTION_47_36();
          BOOL v125 = v184 == v124 && v186 == v123;
          if (v125 || (OUTLINED_FUNCTION_46_34(), (OUTLINED_FUNCTION_10_76() & 1) != 0))
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_187_0();
            sub_1E09468A0(v189, v177);
            uint64_t v126 = OUTLINED_FUNCTION_1_101();
            v127(v126);
            OUTLINED_FUNCTION_12_67(v177, v128, (void (*)(void))type metadata accessor for StorePlatformStation);
            OUTLINED_FUNCTION_5_88();
          }
          else
          {
            OUTLINED_FUNCTION_77_17();
            BOOL v130 = v184 == v129 && v186 == (char *)0xE900000000000065;
            if (v130 || (OUTLINED_FUNCTION_76_18(), (OUTLINED_FUNCTION_10_76() & 1) != 0))
            {
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_187_0();
              OUTLINED_FUNCTION_75_22();
              sub_1E03F71A8(v131, v132);
              uint64_t v133 = OUTLINED_FUNCTION_1_101();
              v134(v133);
              OUTLINED_FUNCTION_12_67(v169, v135, (void (*)(void))type metadata accessor for StorePlatformTVEpisode);
              OUTLINED_FUNCTION_5_88();
            }
            else
            {
              OUTLINED_FUNCTION_78_18();
              OUTLINED_FUNCTION_73_21();
              BOOL v136 = v68 && v186 == (char *)0xE800000000000000;
              if (v136 || (OUTLINED_FUNCTION_61_26(), (OUTLINED_FUNCTION_10_76() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                OUTLINED_FUNCTION_187_0();
                OUTLINED_FUNCTION_75_22();
                sub_1E09636EC(v137, v138);
                uint64_t v139 = OUTLINED_FUNCTION_1_101();
                v140(v139);
                OUTLINED_FUNCTION_12_67(v170, v141, (void (*)(void))type metadata accessor for StorePlatformTVSeason);
                OUTLINED_FUNCTION_5_88();
              }
              else
              {
                OUTLINED_FUNCTION_72_19();
                OUTLINED_FUNCTION_73_21();
                BOOL v142 = v68 && v186 == (char *)0xE900000000000064;
                if (v142 || (OUTLINED_FUNCTION_51_35(), (OUTLINED_FUNCTION_10_76() & 1) != 0))
                {
                  swift_bridgeObjectRelease();
                  OUTLINED_FUNCTION_187_0();
                  OUTLINED_FUNCTION_75_22();
                  sub_1E05011B0(v143, v144);
                  uint64_t v145 = OUTLINED_FUNCTION_1_101();
                  v146(v145);
                  OUTLINED_FUNCTION_12_67(v171, v147, (void (*)(void))type metadata accessor for StorePlatformTVShow);
                  OUTLINED_FUNCTION_5_88();
                }
                else
                {
                  OUTLINED_FUNCTION_70_18();
                  if (v184 == 0x646564616F6C7075 && v186 == v148)
                  {
                    OUTLINED_FUNCTION_67_15();
                  }
                  else
                  {
                    OUTLINED_FUNCTION_30_42();
                    if ((OUTLINED_FUNCTION_10_76() & 1) == 0)
                    {
                      OUTLINED_FUNCTION_66_25();
                      if (v184 == 0x646564616F6C7075 && v186 == v155)
                      {
                        OUTLINED_FUNCTION_65_26();
                      }
                      else
                      {
                        OUTLINED_FUNCTION_29_50();
                        if ((OUTLINED_FUNCTION_10_76() & 1) == 0)
                        {
                          uint64_t v63 = v190;
                          __swift_project_boxed_opaque_existential_1(v190, v190[3]);
                          sub_1E099B0F0();
                          v189[0] = 0;
                          v189[1] = 0xE000000000000000;
                          sub_1E099AA20();
                          sub_1E099A130();
                          sub_1E099A130();
                          swift_bridgeObjectRelease();
                          sub_1E099A130();
                          char v157 = v174;
                          sub_1E099AA90();
                          uint64_t v158 = sub_1E099AAB0();
                          swift_allocError();
                          char v160 = v159;
                          uint64_t v161 = (char *)v159
                               + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF26A0) + 48);
                          uint64_t *v160 = v168;
                          uint64_t v163 = v175;
                          uint64_t v162 = v176;
                          (*(void (**)(char *, char *, uint64_t))(v175 + 16))(v161, v157, v176);
                          (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v158 - 8) + 104))(v160, *MEMORY[0x1E4FBBA70], v158);
                          swift_willThrow();
                          (*(void (**)(char *, uint64_t))(v163 + 8))(v157, v162);
                          uint64_t v100 = OUTLINED_FUNCTION_1_101();
                          v101(v100);
                          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
                        }
                      }
                      swift_bridgeObjectRelease();
                      OUTLINED_FUNCTION_187_0();
                      sub_1E068CDAC(v189, v173);
                      uint64_t v164 = OUTLINED_FUNCTION_1_101();
                      v165(v164);
                      OUTLINED_FUNCTION_12_67(v173, v166, (void (*)(void))type metadata accessor for StorePlatformUploadedVideo);
                      OUTLINED_FUNCTION_5_88();
                      goto LABEL_53;
                    }
                  }
                  swift_bridgeObjectRelease();
                  OUTLINED_FUNCTION_187_0();
                  OUTLINED_FUNCTION_75_22();
                  sub_1E04ABBB0(v150, v151);
                  uint64_t v152 = OUTLINED_FUNCTION_1_101();
                  v153(v152);
                  OUTLINED_FUNCTION_12_67(v172, v154, (void (*)(void))type metadata accessor for StorePlatformUploadedAudio);
                  OUTLINED_FUNCTION_5_88();
                }
              }
            }
          }
        }
LABEL_53:
        swift_storeEnumTagMultiPayload();
        uint64_t v63 = v190;
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_187_0();
    sub_1E057087C(v189, v179);
    uint64_t v116 = OUTLINED_FUNCTION_1_101();
    v117(v116);
    OUTLINED_FUNCTION_12_67(v179, v118, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
    OUTLINED_FUNCTION_5_88();
    goto LABEL_53;
  }
  uint64_t v63 = v190;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
}

uint64_t sub_1E0978F14(void *a1)
{
  BOOL v68 = a1;
  uint64_t v9 = type metadata accessor for StorePlatformUploadedVideo();
  uint64_t v10 = OUTLINED_FUNCTION_13(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_42_45(v11, v59);
  uint64_t v12 = type metadata accessor for StorePlatformUploadedAudio();
  uint64_t v13 = OUTLINED_FUNCTION_13(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_121_1(v14, v59);
  uint64_t v15 = type metadata accessor for StorePlatformTVShow();
  uint64_t v16 = OUTLINED_FUNCTION_13(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_167(v17, v59);
  uint64_t v18 = type metadata accessor for StorePlatformTVSeason();
  uint64_t v19 = OUTLINED_FUNCTION_13(v18);
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_125_7(v20, v59);
  uint64_t v21 = type metadata accessor for StorePlatformTVEpisode();
  uint64_t v22 = OUTLINED_FUNCTION_13(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_69_0(v23, v59);
  uint64_t v24 = type metadata accessor for StorePlatformStation();
  uint64_t v25 = OUTLINED_FUNCTION_13(v24);
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_220(v26, v59);
  uint64_t v27 = type metadata accessor for StorePlatformRecordLabel();
  uint64_t v28 = OUTLINED_FUNCTION_13(v27);
  MEMORY[0x1F4188790](v28);
  uint64_t v62 = (uint64_t)&v59 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_5();
  uint64_t v30 = type metadata accessor for StorePlatformRadioShow();
  uint64_t v31 = OUTLINED_FUNCTION_13(v30);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_169(v32, v59);
  uint64_t v33 = type metadata accessor for StorePlatformSong();
  uint64_t v34 = OUTLINED_FUNCTION_13(v33);
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_168(v35, v59);
  uint64_t v36 = type metadata accessor for StorePlatformSocialProfile();
  uint64_t v37 = OUTLINED_FUNCTION_13(v36);
  MEMORY[0x1F4188790](v37);
  uint64_t v59 = (uint64_t)&v59 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for StorePlatformPlaylist();
  uint64_t v40 = OUTLINED_FUNCTION_13(v39);
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_11_4();
  uint64_t v41 = type metadata accessor for StorePlatformMusicVideo();
  uint64_t v42 = OUTLINED_FUNCTION_13(v41);
  MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_19_1();
  uint64_t v43 = type metadata accessor for StorePlatformMusicMovie();
  uint64_t v44 = OUTLINED_FUNCTION_13(v43);
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_6_0();
  uint64_t v45 = type metadata accessor for StorePlatformGenre();
  uint64_t v46 = OUTLINED_FUNCTION_13(v45);
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_12();
  uint64_t v47 = type metadata accessor for StorePlatformCurator();
  uint64_t v48 = OUTLINED_FUNCTION_13(v47);
  MEMORY[0x1F4188790](v48);
  OUTLINED_FUNCTION_2();
  uint64_t v49 = type metadata accessor for StorePlatformArtist();
  uint64_t v50 = OUTLINED_FUNCTION_13(v49);
  MEMORY[0x1F4188790](v50);
  OUTLINED_FUNCTION_10_1();
  uint64_t v51 = type metadata accessor for StorePlatformAlbum();
  uint64_t v52 = OUTLINED_FUNCTION_13(v51);
  MEMORY[0x1F4188790](v52);
  OUTLINED_FUNCTION_17_0();
  type metadata accessor for StorePlatformGenericMusicItem();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v53);
  OUTLINED_FUNCTION_6_1();
  sub_1E04A7328(v69, v1);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1E097A1B4(v1, v4, (void (*)(void))type metadata accessor for StorePlatformArtist);
      sub_1E0507074(v68);
      uint64_t v56 = type metadata accessor for StorePlatformArtist;
      uint64_t v57 = v4;
      return sub_1E09897C8(v57, (void (*)(void))v56);
    case 2u:
      sub_1E097A1B4(v1, v3, (void (*)(void))type metadata accessor for StorePlatformCurator);
      sub_1E0535454(v68);
      uint64_t v56 = type metadata accessor for StorePlatformCurator;
      uint64_t v57 = v3;
      return sub_1E09897C8(v57, (void (*)(void))v56);
    case 3u:
      sub_1E097A1B4(v1, v5, (void (*)(void))type metadata accessor for StorePlatformGenre);
      sub_1E0666BC0(v68);
      uint64_t v56 = type metadata accessor for StorePlatformGenre;
      uint64_t v57 = v5;
      return sub_1E09897C8(v57, (void (*)(void))v56);
    case 4u:
      sub_1E097A1B4(v1, v8, (void (*)(void))type metadata accessor for StorePlatformMusicMovie);
      sub_1E0673394(v68);
      uint64_t v56 = type metadata accessor for StorePlatformMusicMovie;
      uint64_t v57 = v8;
      return sub_1E09897C8(v57, (void (*)(void))v56);
    case 5u:
      sub_1E097A1B4(v1, v7, (void (*)(void))type metadata accessor for StorePlatformMusicVideo);
      sub_1E070B780(v68);
      uint64_t v56 = type metadata accessor for StorePlatformMusicVideo;
      uint64_t v57 = v7;
      return sub_1E09897C8(v57, (void (*)(void))v56);
    case 6u:
      sub_1E097A1B4(v1, v6, (void (*)(void))type metadata accessor for StorePlatformPlaylist);
      sub_1E087AD70(v68);
      uint64_t v56 = type metadata accessor for StorePlatformPlaylist;
      uint64_t v57 = v6;
      return sub_1E09897C8(v57, (void (*)(void))v56);
    case 7u:
      uint64_t v2 = v61;
      sub_1E097A1B4(v1, v61, (void (*)(void))type metadata accessor for StorePlatformRadioShow);
      sub_1E07D7F10(v68);
      uint64_t v55 = type metadata accessor for StorePlatformRadioShow;
      goto LABEL_19;
    case 8u:
      uint64_t v2 = v62;
      sub_1E097A1B4(v1, v62, (void (*)(void))type metadata accessor for StorePlatformRecordLabel);
      sub_1E0874AF0(v68);
      uint64_t v55 = type metadata accessor for StorePlatformRecordLabel;
      goto LABEL_19;
    case 9u:
      uint64_t v2 = v59;
      sub_1E097A1B4(v1, v59, (void (*)(void))type metadata accessor for StorePlatformSocialProfile);
      sub_1E05705B0(v68);
      uint64_t v55 = type metadata accessor for StorePlatformSocialProfile;
      goto LABEL_19;
    case 0xAu:
      uint64_t v2 = v60;
      sub_1E097A1B4(v1, v60, (void (*)(void))type metadata accessor for StorePlatformSong);
      sub_1E04E6B04(v68);
      uint64_t v55 = type metadata accessor for StorePlatformSong;
      goto LABEL_19;
    case 0xBu:
      uint64_t v2 = v63;
      sub_1E097A1B4(v1, v63, (void (*)(void))type metadata accessor for StorePlatformStation);
      sub_1E0946374(v68);
      uint64_t v55 = type metadata accessor for StorePlatformStation;
      goto LABEL_19;
    case 0xCu:
      OUTLINED_FUNCTION_12_67(v1, v54, (void (*)(void))type metadata accessor for StorePlatformTVEpisode);
      sub_1E03F7F20(v68);
      uint64_t v55 = type metadata accessor for StorePlatformTVEpisode;
      goto LABEL_19;
    case 0xDu:
      uint64_t v2 = v64;
      sub_1E097A1B4(v1, v64, (void (*)(void))type metadata accessor for StorePlatformTVSeason);
      sub_1E0963228(v68);
      uint64_t v55 = type metadata accessor for StorePlatformTVSeason;
      goto LABEL_19;
    case 0xEu:
      uint64_t v2 = v65;
      sub_1E097A1B4(v1, v65, (void (*)(void))type metadata accessor for StorePlatformTVShow);
      sub_1E0500BA8(v68);
      uint64_t v55 = type metadata accessor for StorePlatformTVShow;
      goto LABEL_19;
    case 0xFu:
      uint64_t v2 = v66;
      sub_1E097A1B4(v1, v66, (void (*)(void))type metadata accessor for StorePlatformUploadedAudio);
      sub_1E04AC474(v68);
      uint64_t v55 = type metadata accessor for StorePlatformUploadedAudio;
      goto LABEL_19;
    case 0x10u:
      uint64_t v2 = v67;
      sub_1E097A1B4(v1, v67, (void (*)(void))type metadata accessor for StorePlatformUploadedVideo);
      sub_1E068D6F4(v68);
      uint64_t v55 = type metadata accessor for StorePlatformUploadedVideo;
      goto LABEL_19;
    default:
      sub_1E097A1B4(v1, v2, (void (*)(void))type metadata accessor for StorePlatformAlbum);
      sub_1E0744DB0(v68);
      uint64_t v55 = type metadata accessor for StorePlatformAlbum;
LABEL_19:
      uint64_t v56 = v55;
      uint64_t v57 = v2;
      return sub_1E09897C8(v57, (void (*)(void))v56);
  }
}

uint64_t sub_1E09797E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1E0977F04(a1, a2);
}

uint64_t sub_1E0979800(void *a1)
{
  return sub_1E0978F14(a1);
}

uint64_t GenericMusicItem.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF08D0);
  uint64_t v7 = OUTLINED_FUNCTION_13(v6);
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_19_1();
  uint64_t v8 = type metadata accessor for GenericMusicItem();
  OUTLINED_FUNCTION_14();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2();
  if (!*(void *)(a1 + 16)) {
    goto LABEL_108;
  }
  unint64_t v10 = sub_1E0386318();
  if ((v11 & 1) == 0) {
    goto LABEL_108;
  }
  sub_1E02CE938(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v111);
  if ((OUTLINED_FUNCTION_68_16() & 1) == 0) {
    goto LABEL_108;
  }
  sub_1E02CD81C(a1, &v111);
  if (!v112)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v18 = &qword_1EBEF9AC0;
    uint64_t v19 = &v111;
    goto LABEL_13;
  }
  if ((OUTLINED_FUNCTION_68_16() & 1) == 0)
  {
LABEL_107:
    swift_bridgeObjectRelease();
LABEL_108:
    swift_bridgeObjectRelease();
    goto LABEL_109;
  }
  uint64_t v13 = v113;
  uint64_t v12 = v114;
  uint64_t v14 = sub_1E0994A90();
  uint64_t v16 = v15;
  if (v13 != 0x6D75626C61 || v12 != 0xE500000000000000)
  {
    OUTLINED_FUNCTION_71_18();
    if ((OUTLINED_FUNCTION_4_104() & 1) == 0)
    {
      BOOL v25 = v13 == 0x747369747261 && v12 == 0xE600000000000000;
      if (v25 || (OUTLINED_FUNCTION_69_17(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
      {
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF44F8);
        uint64_t v26 = OUTLINED_FUNCTION_6_80();
        OUTLINED_FUNCTION_3_96(v26, v27, v28, &qword_1EACF4530);
        OUTLINED_FUNCTION_18_73();
        uint64_t v29 = sub_1E07B52AC(&qword_1EACF4500, &qword_1EACF44F8);
        OUTLINED_FUNCTION_2_107(v29);
        sub_1E0999260();
        OUTLINED_FUNCTION_96();
        goto LABEL_15;
      }
      if (v13 != 0x646E617262 || v12 != 0xE500000000000000)
      {
        OUTLINED_FUNCTION_64_21();
        if ((OUTLINED_FUNCTION_4_104() & 1) == 0)
        {
          OUTLINED_FUNCTION_32_48();
          if (v13 != v32 || v12 != v31)
          {
            OUTLINED_FUNCTION_31_48();
            if ((OUTLINED_FUNCTION_4_104() & 1) == 0)
            {
              BOOL v34 = v13 == 0x6569766F6DLL && v12 == 0xE500000000000000;
              if (v34 || (OUTLINED_FUNCTION_79_17(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF44E8);
                uint64_t v35 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v35, v36, v37, &qword_1EACF4550);
                OUTLINED_FUNCTION_18_73();
                uint64_t v38 = sub_1E07B52AC(&qword_1EACF44F0, &qword_1EACF44E8);
                OUTLINED_FUNCTION_2_107(v38);
                MusicMovie.init(propertyProvider:)();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_54_28();
              BOOL v41 = v13 == v40 && v12 == v39;
              if (v41 || (OUTLINED_FUNCTION_53_33(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF44D8);
                uint64_t v42 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v42, v43, v44, &qword_1EACF4558);
                OUTLINED_FUNCTION_18_73();
                uint64_t v45 = sub_1E07B52AC(&qword_1EACF44E0, &qword_1EACF44D8);
                OUTLINED_FUNCTION_2_107(v45);
                sub_1E0994980();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_74_19();
              BOOL v47 = v13 == v46 && v12 == 0xE800000000000000;
              if (v47 || (OUTLINED_FUNCTION_60_0(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF44C8);
                uint64_t v48 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v48, v49, v50, &qword_1EACF4560);
                OUTLINED_FUNCTION_18_73();
                uint64_t v51 = sub_1E07B52AC(&qword_1EACF44D0, &qword_1EACF44C8);
                OUTLINED_FUNCTION_2_107(v51);
                sub_1E0999960();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_28_52();
              if (v13 == v53 && v12 == v52)
              {
                OUTLINED_FUNCTION_63_20();
LABEL_63:
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF44B8);
                uint64_t v55 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v55, v56, v57, &qword_1EACF4568);
                OUTLINED_FUNCTION_18_73();
                uint64_t v58 = sub_1E07B52AC(&qword_1EACF44C0, &qword_1EACF44B8);
                OUTLINED_FUNCTION_2_107(v58);
                SocialProfile.init(propertyProvider:)();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_27_61();
              if (OUTLINED_FUNCTION_4_104()) {
                goto LABEL_63;
              }
              BOOL v59 = v13 == 1735290739 && v12 == 0xE400000000000000;
              if (v59 || (OUTLINED_FUNCTION_4_104() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF44A8);
                uint64_t v60 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v60, v61, v62, &qword_1EACF4570);
                OUTLINED_FUNCTION_18_73();
                uint64_t v63 = sub_1E07B52AC(&qword_1EACF44B0, &qword_1EACF44A8);
                OUTLINED_FUNCTION_2_107(v63);
                sub_1E0998C00();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_47_36();
              BOOL v66 = v13 == v65 && v12 == v64;
              if (v66 || (OUTLINED_FUNCTION_46_34(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4498);
                uint64_t v67 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v67, v68, v69, &qword_1EACF4578);
                OUTLINED_FUNCTION_18_73();
                uint64_t v70 = sub_1E07B52AC(&qword_1EACF44A0, &qword_1EACF4498);
                OUTLINED_FUNCTION_2_107(v70);
                sub_1E09996A0();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_77_17();
              BOOL v72 = v13 == v71 && v12 == 0xE900000000000065;
              if (v72 || (OUTLINED_FUNCTION_76_18(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4488);
                uint64_t v73 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v73, v74, v75, &qword_1EACF4580);
                OUTLINED_FUNCTION_18_73();
                uint64_t v76 = sub_1E07B52AC(&qword_1EACF4490, &qword_1EACF4488);
                uint64_t v77 = (void *)OUTLINED_FUNCTION_2_107(v76);
                TVEpisode.init(propertyProvider:)(v77, v78);
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_78_18();
              BOOL v80 = v13 == v79 && v12 == 0xE800000000000000;
              if (v80 || (OUTLINED_FUNCTION_61_26(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4478);
                uint64_t v81 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v81, v82, v83, &qword_1EACF4588);
                OUTLINED_FUNCTION_18_73();
                uint64_t v84 = sub_1E07B52AC(&qword_1EACF4480, &qword_1EACF4478);
                BOOL v85 = (void *)OUTLINED_FUNCTION_2_107(v84);
                TVSeason.init(propertyProvider:)(v85, v86);
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_72_19();
              BOOL v88 = v13 == v87 && v12 == 0xE900000000000064;
              if (v88 || (OUTLINED_FUNCTION_51_35(), (OUTLINED_FUNCTION_4_104() & 1) != 0))
              {
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4468);
                uint64_t v89 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v89, v90, v91, &qword_1EACF4590);
                OUTLINED_FUNCTION_18_73();
                uint64_t v92 = sub_1E07B52AC(&qword_1EACF4470, &qword_1EACF4468);
                OUTLINED_FUNCTION_2_107(v92);
                TVShow.init(propertyProvider:)();
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_70_18();
              if (v13 == 0x646564616F6C7075 && v12 == v93)
              {
                OUTLINED_FUNCTION_67_15();
LABEL_101:
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4458);
                uint64_t v95 = OUTLINED_FUNCTION_6_80();
                OUTLINED_FUNCTION_3_96(v95, v96, v97, &qword_1EACF4598);
                OUTLINED_FUNCTION_18_73();
                uint64_t v98 = sub_1E07B52AC(&qword_1EACF4460, &qword_1EACF4458);
                uint64_t v99 = (void *)OUTLINED_FUNCTION_2_107(v98);
                UploadedAudio.init(propertyProvider:)(v99, v100);
                OUTLINED_FUNCTION_96();
                goto LABEL_15;
              }
              OUTLINED_FUNCTION_30_42();
              if (OUTLINED_FUNCTION_4_104()) {
                goto LABEL_101;
              }
              OUTLINED_FUNCTION_66_25();
              if (v13 == 0x646564616F6C7075 && v12 == v101)
              {
                OUTLINED_FUNCTION_65_26();
                swift_bridgeObjectRelease();
              }
              else
              {
                OUTLINED_FUNCTION_29_50();
                char v103 = OUTLINED_FUNCTION_4_104();
                swift_bridgeObjectRelease();
                if ((v103 & 1) == 0) {
                  goto LABEL_107;
                }
              }
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4448);
              uint64_t v105 = OUTLINED_FUNCTION_6_80();
              OUTLINED_FUNCTION_3_96(v105, v106, v107, &qword_1EACF45A0);
              OUTLINED_FUNCTION_18_73();
              uint64_t v108 = sub_1E07B52AC(&qword_1EACF4450, &qword_1EACF4448);
              BOOL v109 = (void *)OUTLINED_FUNCTION_2_107(v108);
              UploadedVideo.init(propertyProvider:)(v109, v110);
              OUTLINED_FUNCTION_96();
              goto LABEL_15;
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      sub_1E07B4CFC(v14, v16, a1, v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload(v3, 1, v8) != 1)
      {
        sub_1E097A1B4(v3, v2, (void (*)(void))type metadata accessor for GenericMusicItem);
        goto LABEL_16;
      }
      uint64_t v18 = &qword_1EBEF08D0;
      uint64_t v19 = (long long *)v3;
LABEL_13:
      sub_1E02B81BC((uint64_t)v19, v18);
LABEL_109:
      uint64_t v24 = 1;
      return __swift_storeEnumTagSinglePayload(a2, v24, 1, v8);
    }
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EACF4508);
  uint64_t v20 = OUTLINED_FUNCTION_6_80();
  OUTLINED_FUNCTION_3_96(v20, v21, v22, &qword_1EACF4528);
  OUTLINED_FUNCTION_18_73();
  uint64_t v23 = sub_1E07B52AC(&qword_1EACF4510, &qword_1EACF4508);
  OUTLINED_FUNCTION_2_107(v23);
  sub_1E0998E40();
  OUTLINED_FUNCTION_96();
LABEL_15:
  swift_storeEnumTagMultiPayload();
LABEL_16:
  sub_1E097A1B4(v2, a2, (void (*)(void))type metadata accessor for GenericMusicItem);
  uint64_t v24 = 0;
  return __swift_storeEnumTagSinglePayload(a2, v24, 1, v8);
}

uint64_t type metadata accessor for StorePlatformGenericMusicItem()
{
  uint64_t result = qword_1EBEEFAE0;
  if (!qword_1EBEEFAE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1E097A168()
{
  unint64_t result = qword_1EACF4520;
  if (!qword_1EACF4520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF4520);
  }
  return result;
}

uint64_t sub_1E097A1B4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unsigned char *storeEnumTagSinglePayload for StorePlatformGenericMusicItem.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1E097A2B0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StorePlatformGenericMusicItem.CodingKeys()
{
  return &type metadata for StorePlatformGenericMusicItem.CodingKeys;
}

uint64_t *sub_1E097A2E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v15))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v15);
        }
        uint64_t v95 = (int *)type metadata accessor for StorePlatformArtist();
        *(uint64_t *)((char *)a1 + v95[5]) = *(uint64_t *)((char *)a2 + v95[5]);
        *(uint64_t *)((char *)a1 + v95[6]) = *(uint64_t *)((char *)a2 + v95[6]);
        *(uint64_t *)((char *)a1 + v95[7]) = *(uint64_t *)((char *)a2 + v95[7]);
        *(uint64_t *)((char *)a1 + v95[8]) = *(uint64_t *)((char *)a2 + v95[8]);
        uint64_t v96 = v95[9];
        uint64_t v97 = (uint64_t *)((char *)a1 + v96);
        uint64_t v98 = (uint64_t *)((char *)a2 + v96);
        uint64_t v99 = v98[1];
        *uint64_t v97 = *v98;
        v97[1] = v99;
        uint64_t v100 = v95[10];
        uint64_t v101 = (char *)a1 + v100;
        uint64_t v102 = (char *)a2 + v100;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v102, 1, v103))
        {
          uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v101, v102, *(void *)(*(void *)(v104 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v103 - 8) + 16))(v101, v102, v103);
          __swift_storeEnumTagSinglePayload((uint64_t)v101, 0, 1, v103);
        }
        uint64_t v262 = v95[11];
        v263 = (uint64_t *)((char *)a1 + v262);
        v264 = (uint64_t *)((char *)a2 + v262);
        uint64_t v265 = v264[1];
        void *v263 = *v264;
        v263[1] = v265;
        uint64_t v266 = v95[12];
        v267 = (uint64_t *)((char *)a1 + v266);
        v268 = (uint64_t *)((char *)a2 + v266);
        uint64_t v269 = v268[1];
        void *v267 = *v268;
        v267[1] = v269;
        uint64_t v270 = v95[13];
        v271 = (char *)a1 + v270;
        v272 = (char *)a2 + v270;
        uint64_t v273 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v272, 1, v273))
        {
          uint64_t v274 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v271, v272, *(void *)(*(void *)(v274 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v273 - 8) + 16))(v271, v272, v273);
          __swift_storeEnumTagSinglePayload((uint64_t)v271, 0, 1, v273);
        }
        uint64_t v443 = v95[14];
        v444 = (char *)a1 + v443;
        v445 = (char *)a2 + v443;
        uint64_t v446 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v445, 1, v446))
        {
          uint64_t v447 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v444, v445, *(void *)(*(void *)(v447 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v445, 1, v15))
          {
            uint64_t v549 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v444, v445, *(void *)(*(void *)(v549 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v444, v445, v15);
            __swift_storeEnumTagSinglePayload((uint64_t)v444, 0, 1, v15);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v444, 0, 1, v446);
        }
        uint64_t v646 = v95[15];
        v360 = (char *)a1 + v646;
        v361 = (char *)a2 + v646;
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v273)) {
          goto LABEL_207;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v273 - 8) + 16))(v360, v361, v273);
        __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, v273);
        break;
      case 2u:
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v17))
        {
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v18 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v17);
        }
        uint64_t v105 = (int *)type metadata accessor for StorePlatformCurator();
        *(uint64_t *)((char *)a1 + v105[5]) = *(uint64_t *)((char *)a2 + v105[5]);
        *(uint64_t *)((char *)a1 + v105[6]) = *(uint64_t *)((char *)a2 + v105[6]);
        uint64_t v106 = v105[7];
        uint64_t v107 = (uint64_t *)((char *)a1 + v106);
        uint64_t v108 = (uint64_t *)((char *)a2 + v106);
        uint64_t v109 = v108[1];
        *uint64_t v107 = *v108;
        v107[1] = v109;
        uint64_t v110 = v105[8];
        long long v111 = (char *)a1 + v110;
        uint64_t v112 = (char *)a2 + v110;
        uint64_t v113 = sub_1E09955A0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v112, 1, v113))
        {
          uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB800);
          memcpy(v111, v112, *(void *)(*(void *)(v114 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v113 - 8) + 16))(v111, v112, v113);
          __swift_storeEnumTagSinglePayload((uint64_t)v111, 0, 1, v113);
        }
        uint64_t v275 = v105[9];
        v276 = (char *)a1 + v275;
        v277 = (char *)a2 + v275;
        uint64_t v278 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v277, 1, v278))
        {
          uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v276, v277, *(void *)(*(void *)(v279 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v278 - 8) + 16))(v276, v277, v278);
          __swift_storeEnumTagSinglePayload((uint64_t)v276, 0, 1, v278);
        }
        uint64_t v448 = v105[10];
        v449 = (uint64_t *)((char *)a1 + v448);
        v450 = (uint64_t *)((char *)a2 + v448);
        uint64_t v451 = v450[1];
        void *v449 = *v450;
        v449[1] = v451;
        uint64_t v452 = v105[11];
        v453 = (uint64_t *)((char *)a1 + v452);
        v454 = (uint64_t *)((char *)a2 + v452);
        uint64_t v455 = v454[1];
        void *v453 = *v454;
        v453[1] = v455;
        uint64_t v456 = v105[12];
        v457 = (char *)a1 + v456;
        v458 = (char *)a2 + v456;
        uint64_t v459 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v458, 1, v459))
        {
          uint64_t v460 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v457, v458, *(void *)(*(void *)(v460 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v458, 1, v17))
          {
            uint64_t v550 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v457, v458, *(void *)(*(void *)(v550 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v457, v458, v17);
            __swift_storeEnumTagSinglePayload((uint64_t)v457, 0, 1, v17);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v457, 0, 1, v459);
        }
        uint64_t v647 = v105[13];
        v360 = (char *)a1 + v647;
        v361 = (char *)a2 + v647;
        uint64_t v34 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_207;
        }
        goto LABEL_270;
      case 3u:
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v19))
        {
          uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v20 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v19);
        }
        uint64_t v115 = (int *)type metadata accessor for StorePlatformGenre();
        *(uint64_t *)((char *)a1 + v115[5]) = *(uint64_t *)((char *)a2 + v115[5]);
        *(uint64_t *)((char *)a1 + v115[6]) = *(uint64_t *)((char *)a2 + v115[6]);
        uint64_t v116 = v115[7];
        uint64_t v117 = (uint64_t *)((char *)a1 + v116);
        uint64_t v118 = (uint64_t *)((char *)a2 + v116);
        uint64_t v119 = v118[1];
        void *v117 = *v118;
        v117[1] = v119;
        uint64_t v120 = v115[8];
        uint64_t v121 = (char *)a1 + v120;
        uint64_t v122 = (char *)a2 + v120;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v122, 1, v123))
        {
          uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v121, v122, *(void *)(*(void *)(v124 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 16))(v121, v122, v123);
          __swift_storeEnumTagSinglePayload((uint64_t)v121, 0, 1, v123);
        }
        uint64_t v280 = v115[9];
        v281 = (uint64_t *)((char *)a1 + v280);
        v282 = (uint64_t *)((char *)a2 + v280);
        uint64_t v283 = v282[1];
        void *v281 = *v282;
        v281[1] = v283;
        uint64_t v284 = v115[10];
        v285 = (uint64_t *)((char *)a1 + v284);
        v286 = (uint64_t *)((char *)a2 + v284);
        uint64_t v287 = v286[1];
        void *v285 = *v286;
        v285[1] = v287;
        uint64_t v288 = v115[11];
        v289 = (char *)a1 + v288;
        v290 = (char *)a2 + v288;
        uint64_t v291 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v290, 1, v291))
        {
          uint64_t v292 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v289, v290, *(void *)(*(void *)(v292 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v290, 1, v19))
          {
            uint64_t v461 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v289, v290, *(void *)(*(void *)(v461 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v289, v290, v19);
            __swift_storeEnumTagSinglePayload((uint64_t)v289, 0, 1, v19);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v289, 0, 1, v291);
        }
        uint64_t v613 = v115[12];
        v360 = (char *)a1 + v613;
        v361 = (char *)a2 + v613;
        uint64_t v34 = sub_1E0992360();
        if (!__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_270;
        }
        goto LABEL_207;
      case 4u:
        uint64_t v21 = a2[1];
        *a1 = *a2;
        a1[1] = v21;
        uint64_t v22 = (int *)type metadata accessor for StorePlatformMusicMovie();
        uint64_t v23 = v22[5];
        uint64_t v24 = (char *)a1 + v23;
        BOOL v25 = (char *)a2 + v23;
        swift_bridgeObjectRetain();
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
        {
          uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v24, v25, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
          __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
        }
        *(uint64_t *)((char *)a1 + v22[6]) = *(uint64_t *)((char *)a2 + v22[6]);
        uint64_t v125 = v22[7];
        uint64_t v126 = (uint64_t *)((char *)a1 + v125);
        uint64_t v127 = (uint64_t *)((char *)a2 + v125);
        uint64_t v128 = v127[1];
        *uint64_t v126 = *v127;
        v126[1] = v128;
        *(uint64_t *)((char *)a1 + v22[8]) = *(uint64_t *)((char *)a2 + v22[8]);
        uint64_t v129 = v22[9];
        BOOL v130 = (char *)a1 + v129;
        uint64_t v131 = (char *)a2 + v129;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v131, 1, v132))
        {
          uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v130, v131, *(void *)(*(void *)(v133 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v132 - 8) + 16))(v130, v131, v132);
          __swift_storeEnumTagSinglePayload((uint64_t)v130, 0, 1, v132);
        }
        *(uint64_t *)((char *)a1 + v22[10]) = *(uint64_t *)((char *)a2 + v22[10]);
        *(uint64_t *)((char *)a1 + v22[11]) = *(uint64_t *)((char *)a2 + v22[11]);
        *(uint64_t *)((char *)a1 + v22[12]) = *(uint64_t *)((char *)a2 + v22[12]);
        *(uint64_t *)((char *)a1 + v22[13]) = *(uint64_t *)((char *)a2 + v22[13]);
        uint64_t v293 = v22[14];
        v294 = (uint64_t *)((char *)a1 + v293);
        v295 = (uint64_t *)((char *)a2 + v293);
        uint64_t v296 = v295[1];
        void *v294 = *v295;
        v294[1] = v296;
        uint64_t v297 = v22[15];
        __dstf = (char *)a1 + v297;
        v298 = (char *)a2 + v297;
        uint64_t v299 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v298, 1, v299))
        {
          uint64_t v300 = v299;
          uint64_t v301 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstf, v298, *(void *)(*(void *)(v301 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v299 - 8) + 16))(__dstf, v298, v299);
          uint64_t v300 = v299;
          __swift_storeEnumTagSinglePayload((uint64_t)__dstf, 0, 1, v299);
        }
        *((unsigned char *)a1 + v22[16]) = *((unsigned char *)a2 + v22[16]);
        uint64_t v462 = v22[17];
        v463 = (char *)a1 + v462;
        v464 = (char *)a2 + v462;
        uint64_t v465 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v464, 1, v465))
        {
          uint64_t v466 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v463, v464, *(void *)(*(void *)(v466 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v465 - 8) + 16))(v463, v464, v465);
          __swift_storeEnumTagSinglePayload((uint64_t)v463, 0, 1, v465);
        }
        *(uint64_t *)((char *)a1 + v22[18]) = *(uint64_t *)((char *)a2 + v22[18]);
        uint64_t v551 = v22[19];
        v552 = (uint64_t *)((char *)a1 + v551);
        v553 = (uint64_t *)((char *)a2 + v551);
        uint64_t v554 = v553[1];
        void *v552 = *v553;
        v552[1] = v554;
        *(uint64_t *)((char *)a1 + v22[20]) = *(uint64_t *)((char *)a2 + v22[20]);
        uint64_t v555 = v22[21];
        v556 = (uint64_t *)((char *)a1 + v555);
        v557 = (uint64_t *)((char *)a2 + v555);
        uint64_t v558 = v557[1];
        void *v556 = *v557;
        v556[1] = v558;
        *((unsigned char *)a1 + v22[22]) = *((unsigned char *)a2 + v22[22]);
        uint64_t v559 = v22[23];
        v560 = (uint64_t *)((char *)a1 + v559);
        v561 = (uint64_t *)((char *)a2 + v559);
        uint64_t v562 = v561[1];
        void *v560 = *v561;
        v560[1] = v562;
        uint64_t v563 = v22[24];
        v564 = (char *)a1 + v563;
        v565 = (char *)a2 + v563;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v566 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
        if (__swift_getEnumTagSinglePayload((uint64_t)v565, 1, v566))
        {
          uint64_t v567 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
          memcpy(v564, v565, *(void *)(*(void *)(v567 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v566 - 8) + 16))(v564, v565, v566);
          __swift_storeEnumTagSinglePayload((uint64_t)v564, 0, 1, v566);
        }
        uint64_t v599 = v22[25];
        v360 = (char *)a1 + v599;
        v361 = (char *)a2 + v599;
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v300)) {
          goto LABEL_207;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v300 - 8) + 16))(v360, v361, v300);
        __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, v300);
        break;
      case 5u:
        uint64_t v28 = a2[1];
        *a1 = *a2;
        a1[1] = v28;
        uint64_t v29 = a2[3];
        a1[2] = a2[2];
        a1[3] = v29;
        uint64_t v30 = (int *)type metadata accessor for StorePlatformMusicVideo();
        uint64_t v31 = v30[6];
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)a2 + v31;
        uint64_t v34 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v34))
        {
          uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
          __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v34);
        }
        uint64_t v134 = v30[7];
        uint64_t v135 = (char *)a1 + v134;
        BOOL v136 = (char *)a2 + v134;
        uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        uint64_t v656 = v137;
        if (__swift_getEnumTagSinglePayload((uint64_t)v136, 1, v137))
        {
          uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v135, v136, *(void *)(*(void *)(v138 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v137 - 8) + 16))(v135, v136, v137);
          __swift_storeEnumTagSinglePayload((uint64_t)v135, 0, 1, v137);
        }
        uint64_t v302 = v30[8];
        v303 = (uint64_t *)((char *)a1 + v302);
        v304 = (uint64_t *)((char *)a2 + v302);
        uint64_t v305 = v304[1];
        void *v303 = *v304;
        v303[1] = v305;
        uint64_t v306 = v30[9];
        v307 = (uint64_t *)((char *)a1 + v306);
        v308 = (uint64_t *)((char *)a2 + v306);
        uint64_t v309 = v308[1];
        void *v307 = *v308;
        v307[1] = v309;
        *(uint64_t *)((char *)a1 + v30[10]) = *(uint64_t *)((char *)a2 + v30[10]);
        uint64_t v310 = v30[11];
        v311 = (uint64_t *)((char *)a1 + v310);
        v312 = (uint64_t *)((char *)a2 + v310);
        uint64_t v313 = v312[1];
        void *v311 = *v312;
        v311[1] = v313;
        *(uint64_t *)((char *)a1 + v30[12]) = *(uint64_t *)((char *)a2 + v30[12]);
        *(uint64_t *)((char *)a1 + v30[13]) = *(uint64_t *)((char *)a2 + v30[13]);
        *(uint64_t *)((char *)a1 + v30[14]) = *(uint64_t *)((char *)a2 + v30[14]);
        *(uint64_t *)((char *)a1 + v30[15]) = *(uint64_t *)((char *)a2 + v30[15]);
        uint64_t v314 = v30[16];
        v315 = (uint64_t *)((char *)a1 + v314);
        v316 = (uint64_t *)((char *)a2 + v314);
        uint64_t v317 = v316[1];
        void *v315 = *v316;
        v315[1] = v317;
        uint64_t v318 = v30[17];
        v662 = (char *)a1 + v318;
        v658 = (char *)a2 + v318;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v658, 1, v34))
        {
          uint64_t v319 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v662, v658, *(void *)(*(void *)(v319 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v662, v658, v34);
          __swift_storeEnumTagSinglePayload((uint64_t)v662, 0, 1, v34);
        }
        *((unsigned char *)a1 + v30[18]) = *((unsigned char *)a2 + v30[18]);
        uint64_t v467 = v30[19];
        v468 = (uint64_t *)((char *)a1 + v467);
        v469 = (uint64_t *)((char *)a2 + v467);
        uint64_t v470 = v469[1];
        void *v468 = *v469;
        v468[1] = v470;
        *(uint64_t *)((char *)a1 + v30[20]) = *(uint64_t *)((char *)a2 + v30[20]);
        uint64_t v471 = v30[21];
        v472 = (uint64_t *)((char *)a1 + v471);
        v473 = (uint64_t *)((char *)a2 + v471);
        uint64_t v474 = v473[1];
        void *v472 = *v473;
        v472[1] = v474;
        uint64_t v475 = v30[22];
        v476 = (char *)a1 + v475;
        v477 = (char *)a2 + v475;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v477, 1, v34))
        {
          uint64_t v478 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v476, v477, *(void *)(*(void *)(v478 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v476, v477, v34);
          __swift_storeEnumTagSinglePayload((uint64_t)v476, 0, 1, v34);
        }
        *((unsigned char *)a1 + v30[23]) = *((unsigned char *)a2 + v30[23]);
        uint64_t v568 = v30[24];
        v569 = (char *)a1 + v568;
        v570 = (char *)a2 + v568;
        *(void *)v569 = *(void *)v570;
        v569[8] = v570[8];
        uint64_t v571 = v30[25];
        v572 = (char *)a1 + v571;
        v573 = (char *)a2 + v571;
        uint64_t v574 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v573, 1, v574))
        {
          uint64_t v575 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v572, v573, *(void *)(*(void *)(v575 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v573, 1, v656))
          {
            uint64_t v601 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v572, v573, *(void *)(*(void *)(v601 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v656 - 8) + 16))(v572, v573, v656);
            __swift_storeEnumTagSinglePayload((uint64_t)v572, 0, 1, v656);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v572, 0, 1, v574);
        }
        uint64_t v649 = v30[26];
        v360 = (char *)a1 + v649;
        v361 = (char *)a2 + v649;
        if (!__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_270;
        }
        goto LABEL_207;
      case 6u:
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        __dst = (void *)v36;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v36))
        {
          uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v37 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v36 - 8) + 16))(a1, a2, v36);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v36);
        }
        uint64_t v139 = (int *)type metadata accessor for StorePlatformPlaylist();
        *(uint64_t *)((char *)a1 + v139[5]) = *(uint64_t *)((char *)a2 + v139[5]);
        uint64_t v140 = v139[6];
        uint64_t v141 = (uint64_t *)((char *)a1 + v140);
        BOOL v142 = (uint64_t *)((char *)a2 + v140);
        uint64_t v143 = v142[1];
        void *v141 = *v142;
        v141[1] = v143;
        *(uint64_t *)((char *)a1 + v139[7]) = *(uint64_t *)((char *)a2 + v139[7]);
        *(uint64_t *)((char *)a1 + v139[8]) = *(uint64_t *)((char *)a2 + v139[8]);
        uint64_t v144 = v139[9];
        uint64_t v145 = (char *)a1 + v144;
        uint64_t v146 = (char *)a2 + v144;
        uint64_t v147 = sub_1E0996410();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v146, 1, v147))
        {
          uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
          memcpy(v145, v146, *(void *)(*(void *)(v148 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v147 - 8) + 16))(v145, v146, v147);
          __swift_storeEnumTagSinglePayload((uint64_t)v145, 0, 1, v147);
        }
        *(uint64_t *)((char *)a1 + v139[10]) = *(uint64_t *)((char *)a2 + v139[10]);
        *(uint64_t *)((char *)a1 + v139[11]) = *(uint64_t *)((char *)a2 + v139[11]);
        uint64_t v320 = v139[12];
        v321 = (uint64_t *)((char *)a1 + v320);
        v322 = (uint64_t *)((char *)a2 + v320);
        uint64_t v323 = v322[1];
        void *v321 = *v322;
        v321[1] = v323;
        uint64_t v324 = v139[13];
        v325 = (uint64_t *)((char *)a1 + v324);
        v326 = (uint64_t *)((char *)a2 + v324);
        uint64_t v327 = v326[1];
        void *v325 = *v326;
        v325[1] = v327;
        uint64_t v328 = v139[14];
        v329 = (char *)a1 + v328;
        v330 = (char *)a2 + v328;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v331 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v330, 1, v331))
        {
          uint64_t v332 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v329, v330, *(void *)(*(void *)(v332 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v331 - 8) + 16))(v329, v330, v331);
          __swift_storeEnumTagSinglePayload((uint64_t)v329, 0, 1, v331);
        }
        uint64_t v479 = v139[15];
        v480 = (uint64_t *)((char *)a1 + v479);
        v481 = (uint64_t *)((char *)a2 + v479);
        uint64_t v482 = v481[1];
        void *v480 = *v481;
        v480[1] = v482;
        *((unsigned char *)a1 + v139[16]) = *((unsigned char *)a2 + v139[16]);
        uint64_t v483 = v139[17];
        v484 = (char *)a1 + v483;
        v485 = (char *)a2 + v483;
        uint64_t v486 = sub_1E0995F90();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v485, 1, v486))
        {
          uint64_t v487 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE08);
          memcpy(v484, v485, *(void *)(*(void *)(v487 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v486 - 8) + 16))(v484, v485, v486);
          __swift_storeEnumTagSinglePayload((uint64_t)v484, 0, 1, v486);
        }
        *(uint64_t *)((char *)a1 + v139[18]) = *(uint64_t *)((char *)a2 + v139[18]);
        uint64_t v576 = v139[19];
        v577 = (char *)a1 + v576;
        v578 = (char *)a2 + v576;
        uint64_t v579 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v578, 1, v579))
        {
          uint64_t v580 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v577, v578, *(void *)(*(void *)(v580 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v578, 1, (uint64_t)__dst))
          {
            uint64_t v602 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v577, v578, *(void *)(*(void *)(v602 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, void *))(*(__dst - 1) + 16))(v577, v578, __dst);
            __swift_storeEnumTagSinglePayload((uint64_t)v577, 0, 1, (uint64_t)__dst);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v577, 0, 1, v579);
        }
        uint64_t v650 = v139[20];
        v360 = (char *)a1 + v650;
        v361 = (char *)a2 + v650;
        uint64_t v34 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_207;
        }
        goto LABEL_270;
      case 7u:
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v38))
        {
          uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v39 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v38 - 8) + 16))(a1, a2, v38);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v38);
        }
        uint64_t v149 = (int *)type metadata accessor for StorePlatformRadioShow();
        *(uint64_t *)((char *)a1 + v149[5]) = *(uint64_t *)((char *)a2 + v149[5]);
        *(uint64_t *)((char *)a1 + v149[6]) = *(uint64_t *)((char *)a2 + v149[6]);
        uint64_t v150 = v149[7];
        uint64_t v151 = (uint64_t *)((char *)a1 + v150);
        uint64_t v152 = (uint64_t *)((char *)a2 + v150);
        uint64_t v153 = v152[1];
        void *v151 = *v152;
        v151[1] = v153;
        uint64_t v154 = v149[8];
        BOOL v155 = (char *)a1 + v154;
        char v156 = (char *)a2 + v154;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v156, 1, v157))
        {
          uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v155, v156, *(void *)(*(void *)(v158 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v157 - 8) + 16))(v155, v156, v157);
          __swift_storeEnumTagSinglePayload((uint64_t)v155, 0, 1, v157);
        }
        uint64_t v333 = v149[9];
        v334 = (uint64_t *)((char *)a1 + v333);
        v335 = (uint64_t *)((char *)a2 + v333);
        uint64_t v336 = v335[1];
        void *v334 = *v335;
        v334[1] = v336;
        uint64_t v337 = v149[10];
        v338 = (uint64_t *)((char *)a1 + v337);
        v339 = (uint64_t *)((char *)a2 + v337);
        uint64_t v340 = v339[1];
        void *v338 = *v339;
        v338[1] = v340;
        uint64_t v341 = v149[11];
        v342 = (char *)a1 + v341;
        v343 = (char *)a2 + v341;
        uint64_t v344 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v343, 1, v344))
        {
          uint64_t v345 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v342, v343, *(void *)(*(void *)(v345 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v343, 1, v38))
          {
            uint64_t v488 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v342, v343, *(void *)(*(void *)(v488 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v342, v343, v38);
            __swift_storeEnumTagSinglePayload((uint64_t)v342, 0, 1, v38);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v342, 0, 1, v344);
        }
        uint64_t v614 = v149[12];
        v360 = (char *)a1 + v614;
        v361 = (char *)a2 + v614;
        uint64_t v34 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_207;
        }
        goto LABEL_270;
      case 8u:
        uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        __dsta = (void *)v40;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v40))
        {
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v40 - 8) + 16))(a1, a2, v40);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v40);
        }
        char v159 = (int *)type metadata accessor for StorePlatformRecordLabel();
        uint64_t v160 = v159[5];
        uint64_t v161 = (char *)a1 + v160;
        uint64_t v162 = (char *)a2 + v160;
        uint64_t v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v162, 1, v163))
        {
          uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v161, v162, *(void *)(*(void *)(v164 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v163 - 8) + 16))(v161, v162, v163);
          __swift_storeEnumTagSinglePayload((uint64_t)v161, 0, 1, v163);
        }
        *(uint64_t *)((char *)a1 + v159[6]) = *(uint64_t *)((char *)a2 + v159[6]);
        *(uint64_t *)((char *)a1 + v159[7]) = *(uint64_t *)((char *)a2 + v159[7]);
        uint64_t v346 = v159[8];
        v347 = (uint64_t *)((char *)a1 + v346);
        v348 = (uint64_t *)((char *)a2 + v346);
        uint64_t v349 = v348[1];
        void *v347 = *v348;
        v347[1] = v349;
        uint64_t v350 = v159[9];
        v351 = (uint64_t *)((char *)a1 + v350);
        v352 = (uint64_t *)((char *)a2 + v350);
        uint64_t v353 = v352[1];
        void *v351 = *v352;
        v351[1] = v353;
        uint64_t v354 = v159[10];
        v355 = (char *)a1 + v354;
        v356 = (char *)a2 + v354;
        uint64_t v357 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v356, 1, v357))
        {
          uint64_t v358 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v355, v356, *(void *)(*(void *)(v358 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v356, 1, (uint64_t)__dsta))
          {
            uint64_t v489 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v355, v356, *(void *)(*(void *)(v489 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, void *))(*(__dsta - 1) + 16))(v355, v356, __dsta);
            __swift_storeEnumTagSinglePayload((uint64_t)v355, 0, 1, (uint64_t)__dsta);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v355, 0, 1, v357);
        }
        uint64_t v615 = v159[11];
        v360 = (char *)a1 + v615;
        v361 = (char *)a2 + v615;
        uint64_t v34 = sub_1E0992360();
        if (!__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_270;
        }
        goto LABEL_207;
      case 9u:
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v42))
        {
          uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v43 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v42 - 8) + 16))(a1, a2, v42);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v42);
        }
        uint64_t v165 = (int *)type metadata accessor for StorePlatformSocialProfile();
        uint64_t v166 = v165[5];
        uint64_t v167 = (uint64_t *)((char *)a1 + v166);
        uint64_t v168 = (uint64_t *)((char *)a2 + v166);
        uint64_t v169 = v168[1];
        *uint64_t v167 = *v168;
        v167[1] = v169;
        uint64_t v170 = v165[6];
        uint64_t v171 = (uint64_t *)((char *)a1 + v170);
        uint64_t v172 = (uint64_t *)((char *)a2 + v170);
        uint64_t v173 = v172[1];
        *uint64_t v171 = *v172;
        v171[1] = v173;
        *((unsigned char *)a1 + v165[7]) = *((unsigned char *)a2 + v165[7]);
        *((unsigned char *)a1 + v165[8]) = *((unsigned char *)a2 + v165[8]);
        uint64_t v174 = v165[9];
        uint64_t v175 = (uint64_t *)((char *)a1 + v174);
        uint64_t v176 = (uint64_t *)((char *)a2 + v174);
        uint64_t v177 = v176[1];
        *uint64_t v175 = *v176;
        v175[1] = v177;
        uint64_t v178 = v165[10];
        uint64_t v179 = (char *)a1 + v178;
        uint64_t v180 = (char *)a2 + v178;
        uint64_t v181 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v180, 1, v181))
        {
          uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v179, v180, *(void *)(*(void *)(v182 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v181 - 8) + 16))(v179, v180, v181);
          __swift_storeEnumTagSinglePayload((uint64_t)v179, 0, 1, v181);
        }
        uint64_t v359 = v165[11];
        v360 = (char *)a1 + v359;
        v361 = (char *)a2 + v359;
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v181)) {
          goto LABEL_207;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v181 - 8) + 16))(v360, v361, v181);
        __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, v181);
        break;
      case 0xAu:
        uint64_t v44 = a2[1];
        *a1 = *a2;
        a1[1] = v44;
        uint64_t v45 = a2[3];
        a1[2] = a2[2];
        a1[3] = v45;
        uint64_t v46 = (int *)type metadata accessor for StorePlatformSong();
        uint64_t v47 = v46[6];
        uint64_t v48 = (char *)a1 + v47;
        uint64_t v49 = (char *)a2 + v47;
        uint64_t v50 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v49, 1, v50))
        {
          uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v48, v49, *(void *)(*(void *)(v51 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 16))(v48, v49, v50);
          __swift_storeEnumTagSinglePayload((uint64_t)v48, 0, 1, v50);
        }
        uint64_t v183 = v46[7];
        uint64_t v184 = (char *)a1 + v183;
        uint64_t v185 = (char *)a2 + v183;
        uint64_t v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        __dstb = (void *)v50;
        uint64_t v654 = v186;
        if (__swift_getEnumTagSinglePayload((uint64_t)v185, 1, v186))
        {
          uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v184, v185, *(void *)(*(void *)(v187 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v186 - 8) + 16))(v184, v185, v186);
          __swift_storeEnumTagSinglePayload((uint64_t)v184, 0, 1, v186);
        }
        *(uint64_t *)((char *)a1 + v46[8]) = *(uint64_t *)((char *)a2 + v46[8]);
        uint64_t v362 = v46[9];
        v363 = (uint64_t *)((char *)a1 + v362);
        v364 = (uint64_t *)((char *)a2 + v362);
        uint64_t v365 = v364[1];
        void *v363 = *v364;
        v363[1] = v365;
        uint64_t v366 = v46[10];
        v367 = (uint64_t *)((char *)a1 + v366);
        v368 = (uint64_t *)((char *)a2 + v366);
        uint64_t v369 = v368[1];
        void *v367 = *v368;
        v367[1] = v369;
        uint64_t v370 = v46[11];
        v371 = (uint64_t *)((char *)a1 + v370);
        v372 = (uint64_t *)((char *)a2 + v370);
        uint64_t v373 = type metadata accessor for StorePlatformComposer();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v372, 1, v373))
        {
          uint64_t v374 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6448);
          memcpy(v371, v372, *(void *)(*(void *)(v374 - 8) + 64));
        }
        else
        {
          uint64_t v490 = v372[1];
          void *v371 = *v372;
          v371[1] = v490;
          uint64_t v491 = *(int *)(v373 + 20);
          v492 = (char *)v371 + v491;
          v493 = (char *)v372 + v491;
          swift_bridgeObjectRetain();
          if (__swift_getEnumTagSinglePayload((uint64_t)v493, 1, (uint64_t)__dstb))
          {
            uint64_t v494 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
            memcpy(v492, v493, *(void *)(*(void *)(v494 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, void *))(*(__dstb - 1) + 16))(v492, v493, __dstb);
            __swift_storeEnumTagSinglePayload((uint64_t)v492, 0, 1, (uint64_t)__dstb);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v371, 0, 1, v373);
        }
        *(uint64_t *)((char *)a1 + v46[12]) = *(uint64_t *)((char *)a2 + v46[12]);
        uint64_t v616 = v46[13];
        v617 = (uint64_t *)((char *)a1 + v616);
        v618 = (uint64_t *)((char *)a2 + v616);
        uint64_t v660 = v618[1];
        void *v617 = *v618;
        v617[1] = v660;
        uint64_t v619 = v46[14];
        v620 = (char *)a1 + v619;
        v621 = (char *)a2 + v619;
        *(void *)v620 = *(void *)v621;
        v620[8] = v621[8];
        *(uint64_t *)((char *)a1 + v46[15]) = *(uint64_t *)((char *)a2 + v46[15]);
        *(uint64_t *)((char *)a1 + v46[16]) = *(uint64_t *)((char *)a2 + v46[16]);
        *(uint64_t *)((char *)a1 + v46[17]) = *(uint64_t *)((char *)a2 + v46[17]);
        *(uint64_t *)((char *)a1 + v46[18]) = *(uint64_t *)((char *)a2 + v46[18]);
        *((unsigned char *)a1 + v46[19]) = *((unsigned char *)a2 + v46[19]);
        *((unsigned char *)a1 + v46[20]) = *((unsigned char *)a2 + v46[20]);
        uint64_t v622 = v46[21];
        v623 = (uint64_t *)((char *)a1 + v622);
        v624 = (uint64_t *)((char *)a2 + v622);
        uint64_t v625 = v624[1];
        void *v623 = *v624;
        v623[1] = v625;
        *((unsigned char *)a1 + v46[22]) = *((unsigned char *)a2 + v46[22]);
        *((unsigned char *)a1 + v46[23]) = *((unsigned char *)a2 + v46[23]);
        uint64_t v626 = v46[24];
        v627 = (uint64_t *)((char *)a1 + v626);
        v628 = (uint64_t *)((char *)a2 + v626);
        uint64_t v629 = v628[1];
        void *v627 = *v628;
        v627[1] = v629;
        *(uint64_t *)((char *)a1 + v46[25]) = *(uint64_t *)((char *)a2 + v46[25]);
        uint64_t v630 = v46[26];
        v631 = (uint64_t *)((char *)a1 + v630);
        v632 = (uint64_t *)((char *)a2 + v630);
        uint64_t v633 = v632[1];
        void *v631 = *v632;
        v631[1] = v633;
        uint64_t v634 = v46[27];
        v664 = (char *)a1 + v634;
        v635 = (char *)a2 + v634;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v635, 1, (uint64_t)__dstb))
        {
          uint64_t v636 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v664, v635, *(void *)(*(void *)(v636 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, void *))(*(__dstb - 1) + 16))(v664, v635, __dstb);
          __swift_storeEnumTagSinglePayload((uint64_t)v664, 0, 1, (uint64_t)__dstb);
        }
        *((unsigned char *)a1 + v46[28]) = *((unsigned char *)a2 + v46[28]);
        uint64_t v637 = v46[29];
        v638 = (char *)a1 + v637;
        v639 = (char *)a2 + v637;
        *(void *)v638 = *(void *)v639;
        v638[8] = v639[8];
        uint64_t v640 = v46[30];
        v641 = (char *)a1 + v640;
        v642 = (char *)a2 + v640;
        uint64_t v643 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v642, 1, v643))
        {
          uint64_t v644 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v641, v642, *(void *)(*(void *)(v644 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v642, 1, v654))
          {
            uint64_t v645 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v641, v642, *(void *)(*(void *)(v645 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v654 - 8) + 16))(v641, v642, v654);
            __swift_storeEnumTagSinglePayload((uint64_t)v641, 0, 1, v654);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v641, 0, 1, v643);
        }
        uint64_t v652 = v46[31];
        v360 = (char *)a1 + v652;
        v361 = (char *)a2 + v652;
        if (!__swift_getEnumTagSinglePayload((uint64_t)v361, 1, (uint64_t)__dstb)) {
          goto LABEL_274;
        }
        goto LABEL_207;
      case 0xBu:
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0170);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v52))
        {
          uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE40);
          memcpy(a1, a2, *(void *)(*(void *)(v53 - 8) + 64));
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v52 - 8) + 16))(a1, a2, v52);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v52);
        }
        uint64_t v188 = (int *)type metadata accessor for StorePlatformStation();
        uint64_t v189 = v188[5];
        uint64_t v190 = (char *)a1 + v189;
        uint64_t v191 = (char *)a2 + v189;
        uint64_t v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v191, 1, v192))
        {
          uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v190, v191, *(void *)(*(void *)(v193 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v192 - 8) + 16))(v190, v191, v192);
          __swift_storeEnumTagSinglePayload((uint64_t)v190, 0, 1, v192);
        }
        *(uint64_t *)((char *)a1 + v188[6]) = *(uint64_t *)((char *)a2 + v188[6]);
        uint64_t v375 = v188[7];
        v376 = (char *)a1 + v375;
        v377 = (char *)a2 + v375;
        uint64_t v378 = sub_1E0995890();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v377, 1, v378))
        {
          uint64_t v379 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE38);
          memcpy(v376, v377, *(void *)(*(void *)(v379 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v378 - 8) + 16))(v376, v377, v378);
          __swift_storeEnumTagSinglePayload((uint64_t)v376, 0, 1, v378);
        }
        *(uint64_t *)((char *)a1 + v188[8]) = *(uint64_t *)((char *)a2 + v188[8]);
        *(uint64_t *)((char *)a1 + v188[9]) = *(uint64_t *)((char *)a2 + v188[9]);
        uint64_t v495 = v188[10];
        v496 = (uint64_t *)((char *)a1 + v495);
        v497 = (uint64_t *)((char *)a2 + v495);
        uint64_t v498 = v497[1];
        void *v496 = *v497;
        v496[1] = v498;
        *((unsigned char *)a1 + v188[11]) = *((unsigned char *)a2 + v188[11]);
        uint64_t v499 = v188[12];
        v500 = (char *)a1 + v499;
        v501 = (char *)a2 + v499;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v502 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v501, 1, v502))
        {
          uint64_t v503 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v500, v501, *(void *)(*(void *)(v503 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v502 - 8) + 16))(v500, v501, v502);
          __swift_storeEnumTagSinglePayload((uint64_t)v500, 0, 1, v502);
        }
        uint64_t v581 = v188[13];
        v582 = (uint64_t *)((char *)a1 + v581);
        v583 = (uint64_t *)((char *)a2 + v581);
        uint64_t v584 = v583[1];
        void *v582 = *v583;
        v582[1] = v584;
        uint64_t v585 = v188[14];
        v586 = (char *)a1 + v585;
        v587 = (char *)a2 + v585;
        v586[8] = v587[8];
        *(void *)v586 = *(void *)v587;
        uint64_t v588 = v188[15];
        v589 = (char *)a1 + v588;
        v590 = (char *)a2 + v588;
        uint64_t v591 = sub_1E0995740();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v590, 1, v591))
        {
          uint64_t v592 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE30);
          memcpy(v589, v590, *(void *)(*(void *)(v592 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v591 - 8) + 16))(v589, v590, v591);
          __swift_storeEnumTagSinglePayload((uint64_t)v589, 0, 1, v591);
        }
        uint64_t v603 = v188[16];
        v604 = (char *)a1 + v603;
        v605 = (char *)a2 + v603;
        uint64_t v606 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v605, 1, v606))
        {
          uint64_t v607 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v604, v605, *(void *)(*(void *)(v607 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v605, 1, v192))
          {
            uint64_t v612 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v604, v605, *(void *)(*(void *)(v612 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v192 - 8) + 16))(v604, v605, v192);
            __swift_storeEnumTagSinglePayload((uint64_t)v604, 0, 1, v192);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v604, 0, 1, v606);
        }
        uint64_t v651 = v188[17];
        v360 = (char *)a1 + v651;
        v361 = (char *)a2 + v651;
        uint64_t v34 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v34)) {
          goto LABEL_207;
        }
LABEL_270:
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v360, v361, v34);
        __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, v34);
        break;
      case 0xCu:
        uint64_t v54 = a2[1];
        *a1 = *a2;
        a1[1] = v54;
        uint64_t v55 = a2[3];
        a1[2] = a2[2];
        a1[3] = v55;
        uint64_t v56 = a2[5];
        a1[4] = a2[4];
        a1[5] = v56;
        uint64_t v57 = (int *)type metadata accessor for StorePlatformTVEpisode();
        uint64_t v58 = v57[8];
        BOOL v59 = (char *)a1 + v58;
        uint64_t v60 = (char *)a2 + v58;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v60, 1, v61))
        {
          uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v59, v60, *(void *)(*(void *)(v62 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v61 - 8) + 16))(v59, v60, v61);
          __swift_storeEnumTagSinglePayload((uint64_t)v59, 0, 1, v61);
        }
        *(uint64_t *)((char *)a1 + v57[9]) = *(uint64_t *)((char *)a2 + v57[9]);
        *(uint64_t *)((char *)a1 + v57[10]) = *(uint64_t *)((char *)a2 + v57[10]);
        uint64_t v194 = v57[11];
        uint64_t v195 = (char *)a1 + v194;
        uint64_t v196 = (char *)a2 + v194;
        v195[8] = v196[8];
        *(void *)uint64_t v195 = *(void *)v196;
        uint64_t v197 = v57[12];
        uint64_t v198 = (char *)a1 + v197;
        v199 = (char *)a2 + v197;
        v198[8] = v199[8];
        *(void *)uint64_t v198 = *(void *)v199;
        uint64_t v200 = v57[13];
        long long v201 = (char *)a1 + v200;
        uint64_t v202 = (char *)a2 + v200;
        *(void *)long long v201 = *(void *)v202;
        v201[8] = v202[8];
        *(uint64_t *)((char *)a1 + v57[14]) = *(uint64_t *)((char *)a2 + v57[14]);
        *(uint64_t *)((char *)a1 + v57[15]) = *(uint64_t *)((char *)a2 + v57[15]);
        *((unsigned char *)a1 + v57[16]) = *((unsigned char *)a2 + v57[16]);
        uint64_t v203 = v57[17];
        v204 = (uint64_t *)((char *)a1 + v203);
        v205 = (uint64_t *)((char *)a2 + v203);
        uint64_t v206 = v205[1];
        void *v204 = *v205;
        v204[1] = v206;
        uint64_t v207 = v57[18];
        __dstc = (char *)a1 + v207;
        v208 = (char *)a2 + v207;
        uint64_t v209 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v208, 1, v209))
        {
          uint64_t v210 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstc, v208, *(void *)(*(void *)(v210 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v209 - 8) + 16))(__dstc, v208, v209);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstc, 0, 1, v209);
        }
        *((unsigned char *)a1 + v57[19]) = *((unsigned char *)a2 + v57[19]);
        uint64_t v380 = v57[20];
        v381 = (uint64_t *)((char *)a1 + v380);
        v382 = (uint64_t *)((char *)a2 + v380);
        uint64_t v383 = v382[1];
        void *v381 = *v382;
        v381[1] = v383;
        *(uint64_t *)((char *)a1 + v57[21]) = *(uint64_t *)((char *)a2 + v57[21]);
        uint64_t v384 = v57[22];
        v385 = (char *)a1 + v384;
        v386 = (char *)a2 + v384;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v387 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v386, 1, v387))
        {
          uint64_t v388 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v385, v386, *(void *)(*(void *)(v388 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v387 - 8) + 16))(v385, v386, v387);
          __swift_storeEnumTagSinglePayload((uint64_t)v385, 0, 1, v387);
        }
        uint64_t v504 = v57[23];
        v505 = (uint64_t *)((char *)a1 + v504);
        v506 = (uint64_t *)((char *)a2 + v504);
        uint64_t v507 = v506[1];
        void *v505 = *v506;
        v505[1] = v507;
        uint64_t v508 = v57[24];
        v509 = (char *)a1 + v508;
        v510 = (char *)a2 + v508;
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v510, 1, v387))
        {
          uint64_t v511 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v509, v510, *(void *)(*(void *)(v511 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v387 - 8) + 16))(v509, v510, v387);
          __swift_storeEnumTagSinglePayload((uint64_t)v509, 0, 1, v387);
        }
        *((unsigned char *)a1 + v57[25]) = *((unsigned char *)a2 + v57[25]);
        uint64_t v593 = v57[26];
        v594 = (char *)a1 + v593;
        v595 = (char *)a2 + v593;
        uint64_t v596 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
        if (__swift_getEnumTagSinglePayload((uint64_t)v595, 1, v596))
        {
          uint64_t v597 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
          memcpy(v594, v595, *(void *)(*(void *)(v597 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v596 - 8) + 16))(v594, v595, v596);
          __swift_storeEnumTagSinglePayload((uint64_t)v594, 0, 1, v596);
        }
        uint64_t v608 = v57[27];
        v609 = (char *)a1 + v608;
        v610 = (char *)a2 + v608;
        *(void *)v609 = *(void *)v610;
        v609[8] = v610[8];
        *((unsigned char *)a1 + v57[28]) = *((unsigned char *)a2 + v57[28]);
        uint64_t v611 = v57[29];
        v360 = (char *)a1 + v611;
        v361 = (char *)a2 + v611;
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v209)) {
          goto LABEL_207;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v209 - 8) + 16))(v360, v361, v209);
        __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, v209);
        break;
      case 0xDu:
        uint64_t v63 = a2[1];
        *a1 = *a2;
        a1[1] = v63;
        uint64_t v64 = (int *)type metadata accessor for StorePlatformTVSeason();
        uint64_t v65 = v64[5];
        BOOL v66 = (char *)a1 + v65;
        uint64_t v67 = (char *)a2 + v65;
        swift_bridgeObjectRetain();
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v67, 1, v68))
        {
          uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v66, v67, *(void *)(*(void *)(v69 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16))(v66, v67, v68);
          __swift_storeEnumTagSinglePayload((uint64_t)v66, 0, 1, v68);
        }
        *(uint64_t *)((char *)a1 + v64[6]) = *(uint64_t *)((char *)a2 + v64[6]);
        *(uint64_t *)((char *)a1 + v64[7]) = *(uint64_t *)((char *)a2 + v64[7]);
        *(uint64_t *)((char *)a1 + v64[8]) = *(uint64_t *)((char *)a2 + v64[8]);
        uint64_t v211 = v64[9];
        v212 = (uint64_t *)((char *)a1 + v211);
        v213 = (uint64_t *)((char *)a2 + v211);
        uint64_t v214 = v213[1];
        void *v212 = *v213;
        v212[1] = v214;
        *(uint64_t *)((char *)a1 + v64[10]) = *(uint64_t *)((char *)a2 + v64[10]);
        *(uint64_t *)((char *)a1 + v64[11]) = *(uint64_t *)((char *)a2 + v64[11]);
        *(uint64_t *)((char *)a1 + v64[12]) = *(uint64_t *)((char *)a2 + v64[12]);
        *(uint64_t *)((char *)a1 + v64[13]) = *(uint64_t *)((char *)a2 + v64[13]);
        uint64_t v215 = v64[14];
        v216 = (uint64_t *)((char *)a1 + v215);
        v217 = (uint64_t *)((char *)a2 + v215);
        uint64_t v218 = v217[1];
        void *v216 = *v217;
        v216[1] = v218;
        uint64_t v219 = v64[15];
        v220 = (uint64_t *)((char *)a1 + v219);
        v221 = (uint64_t *)((char *)a2 + v219);
        uint64_t v222 = v221[1];
        void *v220 = *v221;
        v220[1] = v222;
        uint64_t v223 = v64[16];
        v224 = (uint64_t *)((char *)a1 + v223);
        v225 = (uint64_t *)((char *)a2 + v223);
        uint64_t v226 = v225[1];
        void *v224 = *v225;
        v224[1] = v226;
        uint64_t v227 = v64[17];
        v228 = (char *)a1 + v227;
        v229 = (char *)a2 + v227;
        *(void *)v228 = *(void *)v229;
        v228[8] = v229[8];
        uint64_t v230 = v64[18];
        __dstd = (char *)a1 + v230;
        v231 = (char *)a2 + v230;
        uint64_t v232 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v231, 1, v232))
        {
          uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstd, v231, *(void *)(*(void *)(v233 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v232 - 8) + 16))(__dstd, v231, v232);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstd, 0, 1, v232);
        }
        break;
      case 0xEu:
        uint64_t v70 = a2[1];
        *a1 = *a2;
        a1[1] = v70;
        uint64_t v71 = (int *)type metadata accessor for StorePlatformTVShow();
        uint64_t v72 = v71[5];
        uint64_t v73 = (char *)a1 + v72;
        uint64_t v74 = (char *)a2 + v72;
        swift_bridgeObjectRetain();
        uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v74, 1, v75))
        {
          uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v73, v74, *(void *)(*(void *)(v76 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v75 - 8) + 16))(v73, v74, v75);
          __swift_storeEnumTagSinglePayload((uint64_t)v73, 0, 1, v75);
        }
        uint64_t v234 = v71[6];
        v235 = (uint64_t *)((char *)a1 + v234);
        v236 = (uint64_t *)((char *)a2 + v234);
        uint64_t v237 = v236[1];
        void *v235 = *v236;
        v235[1] = v237;
        *(uint64_t *)((char *)a1 + v71[7]) = *(uint64_t *)((char *)a2 + v71[7]);
        *(uint64_t *)((char *)a1 + v71[8]) = *(uint64_t *)((char *)a2 + v71[8]);
        *(uint64_t *)((char *)a1 + v71[9]) = *(uint64_t *)((char *)a2 + v71[9]);
        *(uint64_t *)((char *)a1 + v71[10]) = *(uint64_t *)((char *)a2 + v71[10]);
        *(uint64_t *)((char *)a1 + v71[11]) = *(uint64_t *)((char *)a2 + v71[11]);
        *(uint64_t *)((char *)a1 + v71[12]) = *(uint64_t *)((char *)a2 + v71[12]);
        uint64_t v238 = v71[13];
        v239 = (char *)a1 + v238;
        v240 = (char *)a2 + v238;
        *(void *)v239 = *(void *)v240;
        v239[8] = v240[8];
        *(uint64_t *)((char *)a1 + v71[14]) = *(uint64_t *)((char *)a2 + v71[14]);
        *(uint64_t *)((char *)a1 + v71[15]) = *(uint64_t *)((char *)a2 + v71[15]);
        *((unsigned char *)a1 + v71[16]) = *((unsigned char *)a2 + v71[16]);
        uint64_t v241 = v71[17];
        __dste = (char *)a1 + v241;
        v657 = (char *)a2 + v241;
        uint64_t v242 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v657, 1, v242))
        {
          uint64_t v243 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dste, v657, *(void *)(*(void *)(v243 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v242 - 8) + 16))(__dste, v657, v242);
          __swift_storeEnumTagSinglePayload((uint64_t)__dste, 0, 1, v242);
        }
        uint64_t v389 = v71[18];
        v390 = (char *)a1 + v389;
        v391 = (char *)a2 + v389;
        uint64_t v392 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v391, 1, v392))
        {
          uint64_t v393 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v390, v391, *(void *)(*(void *)(v393 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v392 - 8) + 16))(v390, v391, v392);
          __swift_storeEnumTagSinglePayload((uint64_t)v390, 0, 1, v392);
        }
        *(uint64_t *)((char *)a1 + v71[19]) = *(uint64_t *)((char *)a2 + v71[19]);
        uint64_t v512 = v71[20];
        v513 = (uint64_t *)((char *)a1 + v512);
        v514 = (uint64_t *)((char *)a2 + v512);
        uint64_t v515 = v514[1];
        void *v513 = *v514;
        v513[1] = v515;
        uint64_t v516 = v71[21];
        v517 = (uint64_t *)((char *)a1 + v516);
        v518 = (uint64_t *)((char *)a2 + v516);
        uint64_t v519 = v518[1];
        void *v517 = *v518;
        v517[1] = v519;
        uint64_t v520 = v71[22];
        v360 = (char *)a1 + v520;
        v361 = (char *)a2 + v520;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, v242)) {
          goto LABEL_207;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v242 - 8) + 16))(v360, v361, v242);
        __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, v242);
        break;
      case 0xFu:
        uint64_t v77 = a2[1];
        *a1 = *a2;
        a1[1] = v77;
        uint64_t v78 = (int *)type metadata accessor for StorePlatformUploadedAudio();
        uint64_t v79 = v78[5];
        BOOL v80 = (char *)a1 + v79;
        uint64_t v81 = (char *)a2 + v79;
        swift_bridgeObjectRetain();
        uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v81, 1, v82))
        {
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v80, v81, *(void *)(*(void *)(v83 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
          __swift_storeEnumTagSinglePayload((uint64_t)v80, 0, 1, v82);
        }
        uint64_t v244 = v78[6];
        v245 = (char *)a1 + v244;
        v246 = (char *)a2 + v244;
        uint64_t v247 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
        if (__swift_getEnumTagSinglePayload((uint64_t)v246, 1, v247))
        {
          uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
          memcpy(v245, v246, *(void *)(*(void *)(v248 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 16))(v245, v246, v247);
          __swift_storeEnumTagSinglePayload((uint64_t)v245, 0, 1, v247);
        }
        uint64_t v394 = v78[7];
        v395 = (uint64_t *)((char *)a1 + v394);
        v396 = (uint64_t *)((char *)a2 + v394);
        v663 = (void *)v396[1];
        void *v395 = *v396;
        v395[1] = v663;
        uint64_t v397 = v78[8];
        v398 = (char *)a1 + v397;
        v399 = (char *)a2 + v397;
        v398[8] = v399[8];
        *(void *)v398 = *(void *)v399;
        *(uint64_t *)((char *)a1 + v78[9]) = *(uint64_t *)((char *)a2 + v78[9]);
        *(uint64_t *)((char *)a1 + v78[10]) = *(uint64_t *)((char *)a2 + v78[10]);
        *(uint64_t *)((char *)a1 + v78[11]) = *(uint64_t *)((char *)a2 + v78[11]);
        uint64_t v400 = v78[12];
        v401 = (uint64_t *)((char *)a1 + v400);
        v402 = (uint64_t *)((char *)a2 + v400);
        uint64_t v403 = v402[1];
        void *v401 = *v402;
        v401[1] = v403;
        *((unsigned char *)a1 + v78[13]) = *((unsigned char *)a2 + v78[13]);
        uint64_t v404 = v78[14];
        v405 = (uint64_t *)((char *)a1 + v404);
        v406 = (uint64_t *)((char *)a2 + v404);
        uint64_t v407 = v406[1];
        void *v405 = *v406;
        v405[1] = v407;
        uint64_t v408 = v78[15];
        v409 = (uint64_t *)((char *)a1 + v408);
        v410 = (uint64_t *)((char *)a2 + v408);
        uint64_t v411 = v410[1];
        void *v409 = *v410;
        v409[1] = v411;
        uint64_t v412 = v78[16];
        __dstg = (char *)a1 + v412;
        v659 = (char *)a2 + v412;
        uint64_t v413 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v659, 1, v413))
        {
          uint64_t v414 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstg, v659, *(void *)(*(void *)(v414 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v413 - 8) + 16))(__dstg, v659, v413);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstg, 0, 1, v413);
        }
        goto LABEL_175;
      case 0x10u:
        uint64_t v84 = a2[1];
        *a1 = *a2;
        a1[1] = v84;
        uint64_t v78 = (int *)type metadata accessor for StorePlatformUploadedVideo();
        uint64_t v85 = v78[5];
        uint64_t v86 = (char *)a1 + v85;
        uint64_t v87 = (char *)a2 + v85;
        swift_bridgeObjectRetain();
        uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v87, 1, v88))
        {
          uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v86, v87, *(void *)(*(void *)(v89 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 16))(v86, v87, v88);
          __swift_storeEnumTagSinglePayload((uint64_t)v86, 0, 1, v88);
        }
        uint64_t v249 = v78[6];
        v250 = (char *)a1 + v249;
        v251 = (char *)a2 + v249;
        uint64_t v252 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
        if (__swift_getEnumTagSinglePayload((uint64_t)v251, 1, v252))
        {
          uint64_t v253 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
          memcpy(v250, v251, *(void *)(*(void *)(v253 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v252 - 8) + 16))(v250, v251, v252);
          __swift_storeEnumTagSinglePayload((uint64_t)v250, 0, 1, v252);
        }
        uint64_t v415 = v78[7];
        v416 = (uint64_t *)((char *)a1 + v415);
        v417 = (uint64_t *)((char *)a2 + v415);
        uint64_t v418 = v417[1];
        void *v416 = *v417;
        v416[1] = v418;
        *(uint64_t *)((char *)a1 + v78[8]) = *(uint64_t *)((char *)a2 + v78[8]);
        *(uint64_t *)((char *)a1 + v78[9]) = *(uint64_t *)((char *)a2 + v78[9]);
        *(uint64_t *)((char *)a1 + v78[10]) = *(uint64_t *)((char *)a2 + v78[10]);
        uint64_t v419 = v78[11];
        v420 = (uint64_t *)((char *)a1 + v419);
        v421 = (uint64_t *)((char *)a2 + v419);
        uint64_t v422 = v421[1];
        void *v420 = *v421;
        v420[1] = v422;
        uint64_t v423 = v78[12];
        __dsth = (char *)a1 + v423;
        v424 = (char *)a2 + v423;
        uint64_t v425 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v424, 1, v425))
        {
          uint64_t v426 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dsth, v424, *(void *)(*(void *)(v426 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v425 - 8) + 16))(__dsth, v424, v425);
          __swift_storeEnumTagSinglePayload((uint64_t)__dsth, 0, 1, v425);
        }
        *((unsigned char *)a1 + v78[13]) = *((unsigned char *)a2 + v78[13]);
        uint64_t v529 = v78[14];
        v530 = (uint64_t *)((char *)a1 + v529);
        v531 = (uint64_t *)((char *)a2 + v529);
        uint64_t v532 = v531[1];
        void *v530 = *v531;
        v530[1] = v532;
        uint64_t v533 = v78[15];
        v534 = (uint64_t *)((char *)a1 + v533);
        v535 = (uint64_t *)((char *)a2 + v533);
        uint64_t v536 = v535[1];
        void *v534 = *v535;
        v534[1] = v536;
        uint64_t v537 = v78[16];
        v538 = (char *)a1 + v537;
        v539 = (char *)a2 + v537;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v539, 1, v425))
        {
          uint64_t v540 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v538, v539, *(void *)(*(void *)(v540 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v425 - 8) + 16))(v538, v539, v425);
          __swift_storeEnumTagSinglePayload((uint64_t)v538, 0, 1, v425);
        }
LABEL_175:
        *((unsigned char *)a1 + v78[17]) = *((unsigned char *)a2 + v78[17]);
        uint64_t v521 = v78[18];
        v522 = (uint64_t *)((char *)a1 + v521);
        v523 = (uint64_t *)((char *)a2 + v521);
        uint64_t v524 = v523[1];
        void *v522 = *v523;
        v522[1] = v524;
        uint64_t v525 = v78[19];
        v526 = (uint64_t *)((char *)a1 + v525);
        v527 = (uint64_t *)((char *)a2 + v525);
        uint64_t v528 = v527[1];
        void *v526 = *v527;
        v526[1] = v528;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        uint64_t v7 = a2[3];
        a1[2] = a2[2];
        a1[3] = v7;
        uint64_t v8 = (int *)type metadata accessor for StorePlatformAlbum();
        uint64_t v9 = v8[6];
        unint64_t v10 = (char *)a1 + v9;
        char v11 = (char *)a2 + v9;
        uint64_t v12 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
        {
          uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
          __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
        }
        uint64_t v90 = v8[7];
        uint64_t v91 = (char *)a1 + v90;
        uint64_t v92 = (char *)a2 + v90;
        uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        __dstb = (void *)v12;
        uint64_t v655 = v93;
        if (__swift_getEnumTagSinglePayload((uint64_t)v92, 1, v93))
        {
          uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v91, v92, *(void *)(*(void *)(v94 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v93 - 8) + 16))(v91, v92, v93);
          __swift_storeEnumTagSinglePayload((uint64_t)v91, 0, 1, v93);
        }
        *(uint64_t *)((char *)a1 + v8[8]) = *(uint64_t *)((char *)a2 + v8[8]);
        *(uint64_t *)((char *)a1 + v8[9]) = *(uint64_t *)((char *)a2 + v8[9]);
        *(uint64_t *)((char *)a1 + v8[10]) = *(uint64_t *)((char *)a2 + v8[10]);
        *(uint64_t *)((char *)a1 + v8[11]) = *(uint64_t *)((char *)a2 + v8[11]);
        uint64_t v254 = v8[12];
        v255 = (uint64_t *)((char *)a1 + v254);
        v256 = (uint64_t *)((char *)a2 + v254);
        uint64_t v257 = v256[1];
        void *v255 = *v256;
        v255[1] = v257;
        *(uint64_t *)((char *)a1 + v8[13]) = *(uint64_t *)((char *)a2 + v8[13]);
        *(uint64_t *)((char *)a1 + v8[14]) = *(uint64_t *)((char *)a2 + v8[14]);
        *(uint64_t *)((char *)a1 + v8[15]) = *(uint64_t *)((char *)a2 + v8[15]);
        *(uint64_t *)((char *)a1 + v8[16]) = *(uint64_t *)((char *)a2 + v8[16]);
        *((unsigned char *)a1 + v8[17]) = *((unsigned char *)a2 + v8[17]);
        *((unsigned char *)a1 + v8[18]) = *((unsigned char *)a2 + v8[18]);
        *((unsigned char *)a1 + v8[19]) = *((unsigned char *)a2 + v8[19]);
        uint64_t v258 = v8[20];
        v661 = (char *)a1 + v258;
        v259 = (char *)a2 + v258;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v260 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v259, 1, v260))
        {
          uint64_t v261 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v661, v259, *(void *)(*(void *)(v261 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v260 - 8) + 16))(v661, v259, v260);
          __swift_storeEnumTagSinglePayload((uint64_t)v661, 0, 1, v260);
        }
        uint64_t v427 = v8[21];
        v428 = (uint64_t *)((char *)a1 + v427);
        v429 = (uint64_t *)((char *)a2 + v427);
        uint64_t v430 = v429[1];
        void *v428 = *v429;
        v428[1] = v430;
        uint64_t v431 = v8[22];
        v432 = (uint64_t *)((char *)a1 + v431);
        v433 = (uint64_t *)((char *)a2 + v431);
        uint64_t v434 = v433[1];
        void *v432 = *v433;
        v432[1] = v434;
        *(uint64_t *)((char *)a1 + v8[23]) = *(uint64_t *)((char *)a2 + v8[23]);
        uint64_t v435 = v8[24];
        v436 = (uint64_t *)((char *)a1 + v435);
        v437 = (uint64_t *)((char *)a2 + v435);
        uint64_t v438 = v437[1];
        void *v436 = *v437;
        v436[1] = v438;
        uint64_t v439 = v8[25];
        v440 = (char *)a1 + v439;
        v441 = (char *)a2 + v439;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v441, 1, (uint64_t)__dstb))
        {
          uint64_t v442 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v440, v441, *(void *)(*(void *)(v442 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, void *))(*(__dstb - 1) + 16))(v440, v441, __dstb);
          __swift_storeEnumTagSinglePayload((uint64_t)v440, 0, 1, (uint64_t)__dstb);
        }
        uint64_t v541 = v8[26];
        v542 = (char *)a1 + v541;
        v543 = (char *)a2 + v541;
        *(void *)v542 = *(void *)v543;
        v542[8] = v543[8];
        uint64_t v544 = v8[27];
        v545 = (char *)a1 + v544;
        v546 = (char *)a2 + v544;
        uint64_t v547 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v546, 1, v547))
        {
          uint64_t v548 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v545, v546, *(void *)(*(void *)(v548 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v546, 1, v655))
          {
            uint64_t v598 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v545, v546, *(void *)(*(void *)(v598 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v655 - 8) + 16))(v545, v546, v655);
            __swift_storeEnumTagSinglePayload((uint64_t)v545, 0, 1, v655);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v545, 0, 1, v547);
        }
        uint64_t v648 = v8[28];
        v360 = (char *)a1 + v648;
        v361 = (char *)a2 + v648;
        if (__swift_getEnumTagSinglePayload((uint64_t)v361, 1, (uint64_t)__dstb))
        {
LABEL_207:
          uint64_t v600 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v360, v361, *(void *)(*(void *)(v600 - 8) + 64));
        }
        else
        {
LABEL_274:
          (*(void (**)(char *, char *, void *))(*(__dstb - 1) + 16))(v360, v361, __dstb);
          __swift_storeEnumTagSinglePayload((uint64_t)v360, 0, 1, (uint64_t)__dstb);
        }
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1E097EEC8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v3 = (int *)type metadata accessor for StorePlatformAlbum();
      uint64_t v4 = a1 + v3[6];
      uint64_t v5 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      }
      uint64_t v6 = a1 + v3[7];
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v6, 1, v7)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v8 = a1 + v3[20];
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v8, 1, v9)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v10 = a1 + v3[25];
      if (!__swift_getEnumTagSinglePayload(v10, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v10, v5);
      }
      uint64_t v11 = a1 + v3[27];
      uint64_t v12 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v11, 1, v12)
        && !__swift_getEnumTagSinglePayload(v11, 1, v7))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v11, v7);
      }
      uint64_t v13 = v3[28];
      goto LABEL_108;
    case 1:
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v14)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
      }
      uint64_t v15 = (int *)type metadata accessor for StorePlatformArtist();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = a1 + v15[10];
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v16, 1, v17)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = a1 + v15[13];
      uint64_t v19 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v18, 1, v19)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
      }
      uint64_t v20 = a1 + v15[14];
      uint64_t v21 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v20, 1, v21)
        && !__swift_getEnumTagSinglePayload(v20, 1, v14))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v20, v14);
      }
      uint64_t v22 = a1 + v15[15];
      uint64_t result = __swift_getEnumTagSinglePayload(v22, 1, v19);
      if (result) {
        return result;
      }
      uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8);
      uint64_t v24 = v22;
      uint64_t v25 = v19;
      goto LABEL_150;
    case 2:
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v26)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(a1, v26);
      }
      uint64_t v27 = (int *)type metadata accessor for StorePlatformCurator();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v28 = a1 + v27[8];
      uint64_t v29 = sub_1E09955A0();
      if (!__swift_getEnumTagSinglePayload(v28, 1, v29)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
      }
      uint64_t v30 = a1 + v27[9];
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v30, 1, v31)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v32 = a1 + v27[12];
      uint64_t v33 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v32, 1, v33)
        && !__swift_getEnumTagSinglePayload(v32, 1, v26))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v32, v26);
      }
      uint64_t v34 = v27[13];
      goto LABEL_137;
    case 3:
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v35)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(a1, v35);
      }
      uint64_t v36 = type metadata accessor for StorePlatformGenre();
      goto LABEL_76;
    case 4:
      swift_bridgeObjectRelease();
      uint64_t v37 = (int *)type metadata accessor for StorePlatformMusicMovie();
      uint64_t v38 = a1 + v37[5];
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v38, 1, v39)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v38, v39);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v40 = a1 + v37[9];
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (!__swift_getEnumTagSinglePayload(v40, 1, v41)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8))(v40, v41);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v42 = a1 + v37[15];
      uint64_t v43 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v42, 1, v43)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(v42, v43);
      }
      uint64_t v44 = a1 + v37[17];
      uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v44, 1, v45)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v45 - 8) + 8))(v44, v45);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v46 = a1 + v37[24];
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
      if (!__swift_getEnumTagSinglePayload(v46, 1, v47)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v47 - 8) + 8))(v46, v47);
      }
      uint64_t v48 = v37[25];
      goto LABEL_147;
    case 5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v49 = (int *)type metadata accessor for StorePlatformMusicVideo();
      uint64_t v50 = a1 + v49[6];
      uint64_t v5 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v50, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v50, v5);
      }
      uint64_t v51 = a1 + v49[7];
      uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v51, 1, v52)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v52 - 8) + 8))(v51, v52);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v53 = a1 + v49[17];
      if (!__swift_getEnumTagSinglePayload(v53, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v53, v5);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v54 = a1 + v49[22];
      if (!__swift_getEnumTagSinglePayload(v54, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v54, v5);
      }
      uint64_t v55 = a1 + v49[25];
      uint64_t v56 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v55, 1, v56)
        && !__swift_getEnumTagSinglePayload(v55, 1, v52))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v52 - 8) + 8))(v55, v52);
      }
      uint64_t v13 = v49[26];
      goto LABEL_108;
    case 6:
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v57)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v57 - 8) + 8))(a1, v57);
      }
      uint64_t v58 = (int *)type metadata accessor for StorePlatformPlaylist();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v59 = a1 + v58[9];
      uint64_t v60 = sub_1E0996410();
      if (!__swift_getEnumTagSinglePayload(v59, 1, v60)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v60 - 8) + 8))(v59, v60);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v61 = a1 + v58[14];
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v61, 1, v62)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 8))(v61, v62);
      }
      swift_bridgeObjectRelease();
      uint64_t v63 = a1 + v58[17];
      uint64_t v64 = sub_1E0995F90();
      if (!__swift_getEnumTagSinglePayload(v63, 1, v64)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v64 - 8) + 8))(v63, v64);
      }
      swift_bridgeObjectRelease();
      uint64_t v65 = a1 + v58[19];
      uint64_t v66 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v65, 1, v66)
        && !__swift_getEnumTagSinglePayload(v65, 1, v57))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v57 - 8) + 8))(v65, v57);
      }
      uint64_t v34 = v58[20];
      goto LABEL_137;
    case 7:
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v35)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(a1, v35);
      }
      uint64_t v36 = type metadata accessor for StorePlatformRadioShow();
LABEL_76:
      uint64_t v67 = (int *)v36;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v68 = a1 + v67[8];
      uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v68, 1, v69)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v69 - 8) + 8))(v68, v69);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v70 = a1 + v67[11];
      uint64_t v71 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v70, 1, v71)
        && !__swift_getEnumTagSinglePayload(v70, 1, v35))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v70, v35);
      }
      uint64_t v34 = v67[12];
      goto LABEL_137;
    case 8:
      uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v72)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 8))(a1, v72);
      }
      uint64_t v73 = (int *)type metadata accessor for StorePlatformRecordLabel();
      uint64_t v74 = a1 + v73[5];
      uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (!__swift_getEnumTagSinglePayload(v74, 1, v75)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v75 - 8) + 8))(v74, v75);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v76 = a1 + v73[10];
      uint64_t v77 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v76, 1, v77)
        && !__swift_getEnumTagSinglePayload(v76, 1, v72))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v72 - 8) + 8))(v76, v72);
      }
      uint64_t v34 = v73[11];
      goto LABEL_137;
    case 9:
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v78)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v78 - 8) + 8))(a1, v78);
      }
      uint64_t v79 = type metadata accessor for StorePlatformSocialProfile();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v80 = a1 + *(int *)(v79 + 40);
      uint64_t v43 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v80, 1, v43)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(v80, v43);
      }
      uint64_t v48 = *(int *)(v79 + 44);
      goto LABEL_147;
    case 10:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v81 = (int *)type metadata accessor for StorePlatformSong();
      uint64_t v82 = a1 + v81[6];
      uint64_t v5 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v82, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v82, v5);
      }
      uint64_t v83 = a1 + v81[7];
      uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v83, 1, v84)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v84 - 8) + 8))(v83, v84);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v85 = a1 + v81[11];
      uint64_t v86 = type metadata accessor for StorePlatformComposer();
      if (!__swift_getEnumTagSinglePayload(v85, 1, v86))
      {
        swift_bridgeObjectRelease();
        uint64_t v87 = v85 + *(int *)(v86 + 20);
        if (!__swift_getEnumTagSinglePayload(v87, 1, v5)) {
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v87, v5);
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v88 = a1 + v81[27];
      if (!__swift_getEnumTagSinglePayload(v88, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v88, v5);
      }
      uint64_t v89 = a1 + v81[30];
      uint64_t v90 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v89, 1, v90)
        && !__swift_getEnumTagSinglePayload(v89, 1, v84))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v84 - 8) + 8))(v89, v84);
      }
      uint64_t v13 = v81[31];
LABEL_108:
      uint64_t v91 = a1 + v13;
      goto LABEL_138;
    case 11:
      uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0170);
      if (!__swift_getEnumTagSinglePayload(a1, 1, v92)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v92 - 8) + 8))(a1, v92);
      }
      uint64_t v93 = (int *)type metadata accessor for StorePlatformStation();
      uint64_t v94 = a1 + v93[5];
      uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v94, 1, v95)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v95 - 8) + 8))(v94, v95);
      }
      swift_bridgeObjectRelease();
      uint64_t v96 = a1 + v93[7];
      uint64_t v97 = sub_1E0995890();
      if (!__swift_getEnumTagSinglePayload(v96, 1, v97)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v97 - 8) + 8))(v96, v97);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v98 = a1 + v93[12];
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v98, 1, v99)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v99 - 8) + 8))(v98, v99);
      }
      swift_bridgeObjectRelease();
      uint64_t v100 = a1 + v93[15];
      uint64_t v101 = sub_1E0995740();
      if (!__swift_getEnumTagSinglePayload(v100, 1, v101)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v101 - 8) + 8))(v100, v101);
      }
      uint64_t v102 = a1 + v93[16];
      uint64_t v103 = type metadata accessor for StorePlatformUber();
      if (!__swift_getEnumTagSinglePayload(v102, 1, v103)
        && !__swift_getEnumTagSinglePayload(v102, 1, v95))
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v95 - 8) + 8))(v102, v95);
      }
      uint64_t v34 = v93[17];
      goto LABEL_137;
    case 12:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v104 = (int *)type metadata accessor for StorePlatformTVEpisode();
      uint64_t v105 = a1 + v104[8];
      uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (!__swift_getEnumTagSinglePayload(v105, 1, v106)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v106 - 8) + 8))(v105, v106);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v107 = a1 + v104[18];
      uint64_t v43 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v107, 1, v43)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(v107, v43);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v108 = a1 + v104[22];
      uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v108, 1, v109)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v109 - 8) + 8))(v108, v109);
      }
      swift_bridgeObjectRelease();
      uint64_t v110 = a1 + v104[24];
      if (!__swift_getEnumTagSinglePayload(v110, 1, v109)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v109 - 8) + 8))(v110, v109);
      }
      uint64_t v111 = a1 + v104[26];
      uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
      if (!__swift_getEnumTagSinglePayload(v111, 1, v112)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v112 - 8) + 8))(v111, v112);
      }
      uint64_t v48 = v104[29];
      goto LABEL_147;
    case 13:
      swift_bridgeObjectRelease();
      uint64_t v113 = type metadata accessor for StorePlatformTVSeason();
      uint64_t v114 = a1 + *(int *)(v113 + 20);
      uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v114, 1, v115)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v115 - 8) + 8))(v114, v115);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(int *)(v113 + 72);
LABEL_137:
      uint64_t v91 = a1 + v34;
      uint64_t v5 = sub_1E0992360();
LABEL_138:
      uint64_t result = __swift_getEnumTagSinglePayload(v91, 1, v5);
      if (result) {
        return result;
      }
      uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      uint64_t v24 = v91;
      uint64_t v25 = v5;
      goto LABEL_150;
    case 14:
      swift_bridgeObjectRelease();
      uint64_t v116 = (int *)type metadata accessor for StorePlatformTVShow();
      uint64_t v117 = a1 + v116[5];
      uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v117, 1, v118)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v118 - 8) + 8))(v117, v118);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v119 = a1 + v116[17];
      uint64_t v43 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v119, 1, v43)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(v119, v43);
      }
      uint64_t v120 = a1 + v116[18];
      uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (!__swift_getEnumTagSinglePayload(v120, 1, v121)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v121 - 8) + 8))(v120, v121);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v48 = v116[22];
LABEL_147:
      uint64_t v122 = a1 + v48;
      uint64_t result = __swift_getEnumTagSinglePayload(v122, 1, v43);
      if (result) {
        return result;
      }
      uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8);
      uint64_t v24 = v122;
      uint64_t v25 = v43;
LABEL_150:
      uint64_t result = v23(v24, v25);
      break;
    case 15:
      swift_bridgeObjectRelease();
      uint64_t v123 = (int *)type metadata accessor for StorePlatformUploadedAudio();
      uint64_t v124 = a1 + v123[5];
      uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v124, 1, v125)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v125 - 8) + 8))(v124, v125);
      }
      uint64_t v126 = a1 + v123[6];
      uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
      if (!__swift_getEnumTagSinglePayload(v126, 1, v127)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v127 - 8) + 8))(v126, v127);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v128 = a1 + v123[16];
      uint64_t v129 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v128, 1, v129)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v129 - 8) + 8))(v128, v129);
      }
      goto LABEL_167;
    case 16:
      swift_bridgeObjectRelease();
      BOOL v130 = (int *)type metadata accessor for StorePlatformUploadedVideo();
      uint64_t v131 = a1 + v130[5];
      uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (!__swift_getEnumTagSinglePayload(v131, 1, v132)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v132 - 8) + 8))(v131, v132);
      }
      uint64_t v133 = a1 + v130[6];
      uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
      if (!__swift_getEnumTagSinglePayload(v133, 1, v134)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v134 - 8) + 8))(v133, v134);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v135 = a1 + v130[12];
      uint64_t v136 = sub_1E0992360();
      if (!__swift_getEnumTagSinglePayload(v135, 1, v136)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v136 - 8) + 8))(v135, v136);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v137 = a1 + v130[16];
      if (!__swift_getEnumTagSinglePayload(v137, 1, v136)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v136 - 8) + 8))(v137, v136);
      }
LABEL_167:
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *sub_1E0981034(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v12))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v12);
      }
      uint64_t v91 = (int *)type metadata accessor for StorePlatformArtist();
      *(void *)((char *)a1 + v91[5]) = *(void *)((char *)a2 + v91[5]);
      *(void *)((char *)a1 + v91[6]) = *(void *)((char *)a2 + v91[6]);
      *(void *)((char *)a1 + v91[7]) = *(void *)((char *)a2 + v91[7]);
      *(void *)((char *)a1 + v91[8]) = *(void *)((char *)a2 + v91[8]);
      uint64_t v92 = v91[9];
      uint64_t v93 = (void *)((char *)a1 + v92);
      uint64_t v94 = (void *)((char *)a2 + v92);
      uint64_t v95 = v94[1];
      *uint64_t v93 = *v94;
      v93[1] = v95;
      uint64_t v96 = v91[10];
      uint64_t v97 = (char *)a1 + v96;
      uint64_t v98 = (char *)a2 + v96;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v98, 1, v99))
      {
        uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v97, v98, *(void *)(*(void *)(v100 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 16))(v97, v98, v99);
        __swift_storeEnumTagSinglePayload((uint64_t)v97, 0, 1, v99);
      }
      uint64_t v263 = v91[11];
      v264 = (void *)((char *)a1 + v263);
      uint64_t v265 = (void *)((char *)a2 + v263);
      uint64_t v266 = v265[1];
      void *v264 = *v265;
      v264[1] = v266;
      uint64_t v267 = v91[12];
      v268 = (void *)((char *)a1 + v267);
      uint64_t v269 = (void *)((char *)a2 + v267);
      uint64_t v270 = v269[1];
      void *v268 = *v269;
      v268[1] = v270;
      uint64_t v271 = v91[13];
      v272 = (char *)a1 + v271;
      uint64_t v273 = (char *)a2 + v271;
      uint64_t v274 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v273, 1, v274))
      {
        uint64_t v275 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v272, v273, *(void *)(*(void *)(v275 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v274 - 8) + 16))(v272, v273, v274);
        __swift_storeEnumTagSinglePayload((uint64_t)v272, 0, 1, v274);
      }
      uint64_t v421 = v91[14];
      uint64_t v422 = (char *)a1 + v421;
      uint64_t v423 = (char *)a2 + v421;
      uint64_t v424 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v423, 1, v424))
      {
        uint64_t v425 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v422, v423, *(void *)(*(void *)(v425 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v423, 1, v12))
        {
          uint64_t v517 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v422, v423, *(void *)(*(void *)(v517 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v422, v423, v12);
          __swift_storeEnumTagSinglePayload((uint64_t)v422, 0, 1, v12);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v422, 0, 1, v424);
      }
      uint64_t v620 = v91[15];
      v335 = (char *)a1 + v620;
      uint64_t v336 = (char *)a2 + v620;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v620, 1, v274)) {
        goto LABEL_251;
      }
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v274 - 8) + 16))(v335, v336, v274);
      uint64_t v337 = (uint64_t)v335;
      uint64_t v338 = v274;
      goto LABEL_253;
    case 2u:
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v14))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v14);
      }
      uint64_t v101 = (int *)type metadata accessor for StorePlatformCurator();
      *(void *)((char *)a1 + v101[5]) = *(void *)((char *)a2 + v101[5]);
      *(void *)((char *)a1 + v101[6]) = *(void *)((char *)a2 + v101[6]);
      uint64_t v102 = v101[7];
      uint64_t v103 = (void *)((char *)a1 + v102);
      uint64_t v104 = (void *)((char *)a2 + v102);
      uint64_t v105 = v104[1];
      *uint64_t v103 = *v104;
      v103[1] = v105;
      uint64_t v106 = v101[8];
      uint64_t v107 = (char *)a1 + v106;
      uint64_t v108 = (char *)a2 + v106;
      uint64_t v109 = sub_1E09955A0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v108, 1, v109))
      {
        uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB800);
        memcpy(v107, v108, *(void *)(*(void *)(v110 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v109 - 8) + 16))(v107, v108, v109);
        __swift_storeEnumTagSinglePayload((uint64_t)v107, 0, 1, v109);
      }
      uint64_t v276 = v101[9];
      v277 = (char *)a1 + v276;
      uint64_t v278 = (char *)a2 + v276;
      uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v278, 1, v279))
      {
        uint64_t v280 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v277, v278, *(void *)(*(void *)(v280 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v279 - 8) + 16))(v277, v278, v279);
        __swift_storeEnumTagSinglePayload((uint64_t)v277, 0, 1, v279);
      }
      uint64_t v426 = v101[10];
      uint64_t v427 = (void *)((char *)a1 + v426);
      v428 = (void *)((char *)a2 + v426);
      uint64_t v429 = v428[1];
      *uint64_t v427 = *v428;
      v427[1] = v429;
      uint64_t v430 = v101[11];
      uint64_t v431 = (void *)((char *)a1 + v430);
      v432 = (void *)((char *)a2 + v430);
      uint64_t v433 = v432[1];
      *uint64_t v431 = *v432;
      v431[1] = v433;
      uint64_t v434 = v101[12];
      uint64_t v435 = (char *)a1 + v434;
      v436 = (char *)a2 + v434;
      uint64_t v437 = type metadata accessor for StorePlatformUber();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v436, 1, v437))
      {
        uint64_t v438 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v435, v436, *(void *)(*(void *)(v438 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v436, 1, v14))
        {
          uint64_t v518 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v435, v436, *(void *)(*(void *)(v518 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v435, v436, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)v435, 0, 1, v14);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v435, 0, 1, v437);
      }
      uint64_t v590 = v101[13];
      goto LABEL_244;
    case 3u:
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v16))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v16);
      }
      uint64_t v111 = (int *)type metadata accessor for StorePlatformGenre();
      goto LABEL_58;
    case 4u:
      uint64_t v18 = a2[1];
      *a1 = *a2;
      a1[1] = v18;
      uint64_t v19 = (int *)type metadata accessor for StorePlatformMusicMovie();
      uint64_t v20 = v19[5];
      uint64_t v21 = (char *)a1 + v20;
      uint64_t v22 = (char *)a2 + v20;
      swift_bridgeObjectRetain();
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
        __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
      }
      *(void *)((char *)a1 + v19[6]) = *(void *)((char *)a2 + v19[6]);
      uint64_t v112 = v19[7];
      uint64_t v113 = (void *)((char *)a1 + v112);
      uint64_t v114 = (void *)((char *)a2 + v112);
      uint64_t v115 = v114[1];
      *uint64_t v113 = *v114;
      v113[1] = v115;
      *(void *)((char *)a1 + v19[8]) = *(void *)((char *)a2 + v19[8]);
      uint64_t v116 = v19[9];
      uint64_t v117 = (char *)a1 + v116;
      uint64_t v118 = (char *)a2 + v116;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (__swift_getEnumTagSinglePayload((uint64_t)v118, 1, v119))
      {
        uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
        memcpy(v117, v118, *(void *)(*(void *)(v120 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v119 - 8) + 16))(v117, v118, v119);
        __swift_storeEnumTagSinglePayload((uint64_t)v117, 0, 1, v119);
      }
      *(void *)((char *)a1 + v19[10]) = *(void *)((char *)a2 + v19[10]);
      *(void *)((char *)a1 + v19[11]) = *(void *)((char *)a2 + v19[11]);
      *(void *)((char *)a1 + v19[12]) = *(void *)((char *)a2 + v19[12]);
      *(void *)((char *)a1 + v19[13]) = *(void *)((char *)a2 + v19[13]);
      uint64_t v281 = v19[14];
      v282 = (void *)((char *)a1 + v281);
      uint64_t v283 = (void *)((char *)a2 + v281);
      uint64_t v284 = v283[1];
      void *v282 = *v283;
      v282[1] = v284;
      uint64_t v285 = v19[15];
      v631 = (char *)a1 + v285;
      v286 = (char *)a2 + v285;
      uint64_t v287 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __dstg = (void *)v287;
      if (__swift_getEnumTagSinglePayload((uint64_t)v286, 1, v287))
      {
        uint64_t v288 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v631, v286, *(void *)(*(void *)(v288 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v287 - 8) + 16))(v631, v286, v287);
        __swift_storeEnumTagSinglePayload((uint64_t)v631, 0, 1, v287);
      }
      *((unsigned char *)a1 + v19[16]) = *((unsigned char *)a2 + v19[16]);
      uint64_t v439 = v19[17];
      v440 = (char *)a1 + v439;
      v441 = (char *)a2 + v439;
      uint64_t v442 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v441, 1, v442))
      {
        uint64_t v443 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v440, v441, *(void *)(*(void *)(v443 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v442 - 8) + 16))(v440, v441, v442);
        __swift_storeEnumTagSinglePayload((uint64_t)v440, 0, 1, v442);
      }
      *(void *)((char *)a1 + v19[18]) = *(void *)((char *)a2 + v19[18]);
      uint64_t v519 = v19[19];
      uint64_t v520 = (void *)((char *)a1 + v519);
      uint64_t v521 = (void *)((char *)a2 + v519);
      uint64_t v522 = v521[1];
      *uint64_t v520 = *v521;
      v520[1] = v522;
      *(void *)((char *)a1 + v19[20]) = *(void *)((char *)a2 + v19[20]);
      uint64_t v523 = v19[21];
      uint64_t v524 = (void *)((char *)a1 + v523);
      uint64_t v525 = (void *)((char *)a2 + v523);
      uint64_t v526 = v525[1];
      *uint64_t v524 = *v525;
      v524[1] = v526;
      *((unsigned char *)a1 + v19[22]) = *((unsigned char *)a2 + v19[22]);
      uint64_t v527 = v19[23];
      uint64_t v528 = (void *)((char *)a1 + v527);
      uint64_t v529 = (void *)((char *)a2 + v527);
      uint64_t v530 = v529[1];
      *uint64_t v528 = *v529;
      v528[1] = v530;
      uint64_t v531 = v19[24];
      uint64_t v532 = (char *)a1 + v531;
      uint64_t v533 = (char *)a2 + v531;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v534 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
      if (__swift_getEnumTagSinglePayload((uint64_t)v533, 1, v534))
      {
        uint64_t v535 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
        memcpy(v532, v533, *(void *)(*(void *)(v535 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v534 - 8) + 16))(v532, v533, v534);
        __swift_storeEnumTagSinglePayload((uint64_t)v532, 0, 1, v534);
      }
      uint64_t v575 = v19[25];
      v335 = (char *)a1 + v575;
      uint64_t v336 = (char *)a2 + v575;
      uint64_t v576 = (uint64_t)a2 + v575;
      uint64_t v577 = (uint64_t)__dstg;
      goto LABEL_245;
    case 5u:
      uint64_t v25 = a2[1];
      *a1 = *a2;
      a1[1] = v25;
      uint64_t v26 = a2[3];
      a1[2] = a2[2];
      a1[3] = v26;
      uint64_t v27 = (int *)type metadata accessor for StorePlatformMusicVideo();
      uint64_t v28 = v27[6];
      uint64_t v29 = (char *)a1 + v28;
      uint64_t v30 = (char *)a2 + v28;
      uint64_t v31 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31))
      {
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
        __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
      }
      uint64_t v121 = v27[7];
      uint64_t v122 = (char *)a1 + v121;
      uint64_t v123 = (char *)a2 + v121;
      uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      uint64_t v626 = v124;
      if (__swift_getEnumTagSinglePayload((uint64_t)v123, 1, v124))
      {
        uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v122, v123, *(void *)(*(void *)(v125 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v124 - 8) + 16))(v122, v123, v124);
        __swift_storeEnumTagSinglePayload((uint64_t)v122, 0, 1, v124);
      }
      uint64_t v289 = v27[8];
      v290 = (void *)((char *)a1 + v289);
      uint64_t v291 = (void *)((char *)a2 + v289);
      uint64_t v292 = v291[1];
      void *v290 = *v291;
      v290[1] = v292;
      uint64_t v293 = v27[9];
      v294 = (void *)((char *)a1 + v293);
      v295 = (void *)((char *)a2 + v293);
      uint64_t v296 = v295[1];
      void *v294 = *v295;
      v294[1] = v296;
      *(void *)((char *)a1 + v27[10]) = *(void *)((char *)a2 + v27[10]);
      uint64_t v297 = v27[11];
      v298 = (void *)((char *)a1 + v297);
      uint64_t v299 = (void *)((char *)a2 + v297);
      uint64_t v300 = v299[1];
      void *v298 = *v299;
      v298[1] = v300;
      *(void *)((char *)a1 + v27[12]) = *(void *)((char *)a2 + v27[12]);
      *(void *)((char *)a1 + v27[13]) = *(void *)((char *)a2 + v27[13]);
      *(void *)((char *)a1 + v27[14]) = *(void *)((char *)a2 + v27[14]);
      *(void *)((char *)a1 + v27[15]) = *(void *)((char *)a2 + v27[15]);
      uint64_t v301 = v27[16];
      uint64_t v302 = (void *)((char *)a1 + v301);
      v303 = (void *)((char *)a2 + v301);
      uint64_t v304 = v303[1];
      *uint64_t v302 = *v303;
      v302[1] = v304;
      uint64_t v305 = v27[17];
      v632 = (char *)a1 + v305;
      uint64_t v306 = (char *)a2 + v305;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v306, 1, v31))
      {
        uint64_t v307 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v632, v306, *(void *)(*(void *)(v307 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v632, v306, v31);
        __swift_storeEnumTagSinglePayload((uint64_t)v632, 0, 1, v31);
      }
      *((unsigned char *)a1 + v27[18]) = *((unsigned char *)a2 + v27[18]);
      uint64_t v444 = v27[19];
      v445 = (void *)((char *)a1 + v444);
      uint64_t v446 = (void *)((char *)a2 + v444);
      uint64_t v447 = v446[1];
      void *v445 = *v446;
      v445[1] = v447;
      *(void *)((char *)a1 + v27[20]) = *(void *)((char *)a2 + v27[20]);
      uint64_t v448 = v27[21];
      v449 = (void *)((char *)a1 + v448);
      v450 = (void *)((char *)a2 + v448);
      uint64_t v451 = v450[1];
      void *v449 = *v450;
      v449[1] = v451;
      uint64_t v452 = v27[22];
      v453 = (char *)a1 + v452;
      v454 = (char *)a2 + v452;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v454, 1, v31))
      {
        uint64_t v455 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v453, v454, *(void *)(*(void *)(v455 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v453, v454, v31);
        __swift_storeEnumTagSinglePayload((uint64_t)v453, 0, 1, v31);
      }
      *((unsigned char *)a1 + v27[23]) = *((unsigned char *)a2 + v27[23]);
      uint64_t v536 = v27[24];
      uint64_t v537 = (char *)a1 + v536;
      v538 = (char *)a2 + v536;
      *(void *)uint64_t v537 = *(void *)v538;
      v537[8] = v538[8];
      uint64_t v539 = v27[25];
      uint64_t v540 = (char *)a1 + v539;
      uint64_t v541 = (char *)a2 + v539;
      uint64_t v542 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v541, 1, v542))
      {
        uint64_t v543 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v540, v541, *(void *)(*(void *)(v543 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v541, 1, v626))
        {
          uint64_t v578 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v540, v541, *(void *)(*(void *)(v578 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v626 - 8) + 16))(v540, v541, v626);
          __swift_storeEnumTagSinglePayload((uint64_t)v540, 0, 1, v626);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v540, 0, 1, v542);
      }
      uint64_t v621 = v27[26];
      goto LABEL_250;
    case 6u:
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      __dst = (void *)v33;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v33))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v33 - 8) + 16))(a1, a2, v33);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v33);
      }
      uint64_t v126 = (int *)type metadata accessor for StorePlatformPlaylist();
      *(void *)((char *)a1 + v126[5]) = *(void *)((char *)a2 + v126[5]);
      uint64_t v127 = v126[6];
      uint64_t v128 = (void *)((char *)a1 + v127);
      uint64_t v129 = (void *)((char *)a2 + v127);
      uint64_t v130 = v129[1];
      *uint64_t v128 = *v129;
      v128[1] = v130;
      *(void *)((char *)a1 + v126[7]) = *(void *)((char *)a2 + v126[7]);
      *(void *)((char *)a1 + v126[8]) = *(void *)((char *)a2 + v126[8]);
      uint64_t v131 = v126[9];
      uint64_t v132 = (char *)a1 + v131;
      uint64_t v133 = (char *)a2 + v131;
      uint64_t v134 = sub_1E0996410();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v133, 1, v134))
      {
        uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
        memcpy(v132, v133, *(void *)(*(void *)(v135 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v134 - 8) + 16))(v132, v133, v134);
        __swift_storeEnumTagSinglePayload((uint64_t)v132, 0, 1, v134);
      }
      *(void *)((char *)a1 + v126[10]) = *(void *)((char *)a2 + v126[10]);
      *(void *)((char *)a1 + v126[11]) = *(void *)((char *)a2 + v126[11]);
      uint64_t v308 = v126[12];
      uint64_t v309 = (void *)((char *)a1 + v308);
      uint64_t v310 = (void *)((char *)a2 + v308);
      uint64_t v311 = v310[1];
      *uint64_t v309 = *v310;
      v309[1] = v311;
      uint64_t v312 = v126[13];
      uint64_t v313 = (void *)((char *)a1 + v312);
      uint64_t v314 = (void *)((char *)a2 + v312);
      uint64_t v315 = v314[1];
      *uint64_t v313 = *v314;
      v313[1] = v315;
      uint64_t v316 = v126[14];
      uint64_t v317 = (char *)a1 + v316;
      uint64_t v318 = (char *)a2 + v316;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v319 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v318, 1, v319))
      {
        uint64_t v320 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v317, v318, *(void *)(*(void *)(v320 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v319 - 8) + 16))(v317, v318, v319);
        __swift_storeEnumTagSinglePayload((uint64_t)v317, 0, 1, v319);
      }
      uint64_t v456 = v126[15];
      v457 = (void *)((char *)a1 + v456);
      v458 = (void *)((char *)a2 + v456);
      uint64_t v459 = v458[1];
      void *v457 = *v458;
      v457[1] = v459;
      *((unsigned char *)a1 + v126[16]) = *((unsigned char *)a2 + v126[16]);
      uint64_t v460 = v126[17];
      uint64_t v461 = (char *)a1 + v460;
      uint64_t v462 = (char *)a2 + v460;
      uint64_t v463 = sub_1E0995F90();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v462, 1, v463))
      {
        uint64_t v464 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE08);
        memcpy(v461, v462, *(void *)(*(void *)(v464 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v463 - 8) + 16))(v461, v462, v463);
        __swift_storeEnumTagSinglePayload((uint64_t)v461, 0, 1, v463);
      }
      *(void *)((char *)a1 + v126[18]) = *(void *)((char *)a2 + v126[18]);
      uint64_t v544 = v126[19];
      v545 = (char *)a1 + v544;
      v546 = (char *)a2 + v544;
      uint64_t v547 = type metadata accessor for StorePlatformUber();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v546, 1, v547))
      {
        uint64_t v548 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v545, v546, *(void *)(*(void *)(v548 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v546, 1, (uint64_t)__dst))
        {
          uint64_t v579 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v545, v546, *(void *)(*(void *)(v579 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, void *))(*(__dst - 1) + 16))(v545, v546, __dst);
          __swift_storeEnumTagSinglePayload((uint64_t)v545, 0, 1, (uint64_t)__dst);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v545, 0, 1, v547);
      }
      uint64_t v590 = v126[20];
      goto LABEL_244;
    case 7u:
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v16))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v16);
      }
      uint64_t v111 = (int *)type metadata accessor for StorePlatformRadioShow();
LABEL_58:
      uint64_t v136 = v111;
      *(void *)((char *)a1 + v111[5]) = *(void *)((char *)a2 + v111[5]);
      *(void *)((char *)a1 + v111[6]) = *(void *)((char *)a2 + v111[6]);
      uint64_t v137 = v111[7];
      uint64_t v138 = (void *)((char *)a1 + v137);
      uint64_t v139 = (void *)((char *)a2 + v137);
      uint64_t v140 = v139[1];
      *uint64_t v138 = *v139;
      v138[1] = v140;
      uint64_t v141 = v111[8];
      BOOL v142 = (char *)a1 + v141;
      uint64_t v143 = (char *)a2 + v141;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v143, 1, v144))
      {
        uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v142, v143, *(void *)(*(void *)(v145 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v144 - 8) + 16))(v142, v143, v144);
        __swift_storeEnumTagSinglePayload((uint64_t)v142, 0, 1, v144);
      }
      uint64_t v146 = v136[9];
      uint64_t v147 = (void *)((char *)a1 + v146);
      uint64_t v148 = (void *)((char *)a2 + v146);
      uint64_t v149 = v148[1];
      *uint64_t v147 = *v148;
      v147[1] = v149;
      uint64_t v150 = v136[10];
      uint64_t v151 = (void *)((char *)a1 + v150);
      uint64_t v152 = (void *)((char *)a2 + v150);
      uint64_t v153 = v152[1];
      void *v151 = *v152;
      v151[1] = v153;
      uint64_t v154 = v136[11];
      BOOL v155 = (char *)a1 + v154;
      char v156 = (char *)a2 + v154;
      uint64_t v157 = type metadata accessor for StorePlatformUber();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v156, 1, v157))
      {
        uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v155, v156, *(void *)(*(void *)(v158 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v156, 1, v16))
        {
          uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v155, v156, *(void *)(*(void *)(v159 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v155, v156, v16);
          __swift_storeEnumTagSinglePayload((uint64_t)v155, 0, 1, v16);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v155, 0, 1, v157);
      }
      uint64_t v590 = v136[12];
      goto LABEL_244;
    case 8u:
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      __dsta = (void *)v36;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v36))
      {
        uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v37 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(a1, a2, v36);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v36);
      }
      uint64_t v160 = (int *)type metadata accessor for StorePlatformRecordLabel();
      uint64_t v161 = v160[5];
      uint64_t v162 = (char *)a1 + v161;
      uint64_t v163 = (char *)a2 + v161;
      uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (__swift_getEnumTagSinglePayload((uint64_t)v163, 1, v164))
      {
        uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
        memcpy(v162, v163, *(void *)(*(void *)(v165 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v164 - 8) + 16))(v162, v163, v164);
        __swift_storeEnumTagSinglePayload((uint64_t)v162, 0, 1, v164);
      }
      *(void *)((char *)a1 + v160[6]) = *(void *)((char *)a2 + v160[6]);
      *(void *)((char *)a1 + v160[7]) = *(void *)((char *)a2 + v160[7]);
      uint64_t v321 = v160[8];
      v322 = (void *)((char *)a1 + v321);
      uint64_t v323 = (void *)((char *)a2 + v321);
      uint64_t v324 = v323[1];
      void *v322 = *v323;
      v322[1] = v324;
      uint64_t v325 = v160[9];
      v326 = (void *)((char *)a1 + v325);
      uint64_t v327 = (void *)((char *)a2 + v325);
      uint64_t v328 = v327[1];
      void *v326 = *v327;
      v326[1] = v328;
      uint64_t v329 = v160[10];
      v330 = (char *)a1 + v329;
      uint64_t v331 = (char *)a2 + v329;
      uint64_t v332 = type metadata accessor for StorePlatformUber();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v331, 1, v332))
      {
        uint64_t v333 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v330, v331, *(void *)(*(void *)(v333 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v331, 1, (uint64_t)__dsta))
        {
          uint64_t v465 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v330, v331, *(void *)(*(void *)(v465 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, void *))(*(__dsta - 1) + 16))(v330, v331, __dsta);
          __swift_storeEnumTagSinglePayload((uint64_t)v330, 0, 1, (uint64_t)__dsta);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v330, 0, 1, v332);
      }
      uint64_t v590 = v160[11];
      goto LABEL_244;
    case 9u:
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v38))
      {
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v39 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v38 - 8) + 16))(a1, a2, v38);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v38);
      }
      uint64_t v166 = (int *)type metadata accessor for StorePlatformSocialProfile();
      uint64_t v167 = v166[5];
      uint64_t v168 = (void *)((char *)a1 + v167);
      uint64_t v169 = (void *)((char *)a2 + v167);
      uint64_t v170 = v169[1];
      *uint64_t v168 = *v169;
      v168[1] = v170;
      uint64_t v171 = v166[6];
      uint64_t v172 = (void *)((char *)a1 + v171);
      uint64_t v173 = (void *)((char *)a2 + v171);
      uint64_t v174 = v173[1];
      *uint64_t v172 = *v173;
      v172[1] = v174;
      *((unsigned char *)a1 + v166[7]) = *((unsigned char *)a2 + v166[7]);
      *((unsigned char *)a1 + v166[8]) = *((unsigned char *)a2 + v166[8]);
      uint64_t v175 = v166[9];
      uint64_t v176 = (void *)((char *)a1 + v175);
      uint64_t v177 = (void *)((char *)a2 + v175);
      uint64_t v178 = v177[1];
      void *v176 = *v177;
      v176[1] = v178;
      uint64_t v179 = v166[10];
      uint64_t v180 = (char *)a1 + v179;
      uint64_t v181 = (char *)a2 + v179;
      uint64_t v182 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v181, 1, v182))
      {
        uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v180, v181, *(void *)(*(void *)(v183 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v182 - 8) + 16))(v180, v181, v182);
        __swift_storeEnumTagSinglePayload((uint64_t)v180, 0, 1, v182);
      }
      uint64_t v334 = v166[11];
      v335 = (char *)a1 + v334;
      uint64_t v336 = (char *)a2 + v334;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v334, 1, v182)) {
        goto LABEL_251;
      }
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v182 - 8) + 16))(v335, v336, v182);
      uint64_t v337 = (uint64_t)v335;
      uint64_t v338 = v182;
      goto LABEL_253;
    case 0xAu:
      uint64_t v40 = a2[1];
      *a1 = *a2;
      a1[1] = v40;
      uint64_t v41 = a2[3];
      a1[2] = a2[2];
      a1[3] = v41;
      uint64_t v42 = (int *)type metadata accessor for StorePlatformSong();
      uint64_t v43 = v42[6];
      uint64_t v44 = (char *)a1 + v43;
      uint64_t v45 = (char *)a2 + v43;
      uint64_t v46 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v45, 1, v46))
      {
        uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v44, v45, *(void *)(*(void *)(v47 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
        __swift_storeEnumTagSinglePayload((uint64_t)v44, 0, 1, v46);
      }
      uint64_t v184 = v42[7];
      uint64_t v185 = (char *)a1 + v184;
      uint64_t v186 = (char *)a2 + v184;
      uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      __dstc = (void *)v46;
      uint64_t v624 = v187;
      if (__swift_getEnumTagSinglePayload((uint64_t)v186, 1, v187))
      {
        uint64_t v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v185, v186, *(void *)(*(void *)(v188 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v187 - 8) + 16))(v185, v186, v187);
        __swift_storeEnumTagSinglePayload((uint64_t)v185, 0, 1, v187);
      }
      *(void *)((char *)a1 + v42[8]) = *(void *)((char *)a2 + v42[8]);
      uint64_t v339 = v42[9];
      uint64_t v340 = (void *)((char *)a1 + v339);
      uint64_t v341 = (void *)((char *)a2 + v339);
      uint64_t v342 = v341[1];
      *uint64_t v340 = *v341;
      v340[1] = v342;
      uint64_t v343 = v42[10];
      uint64_t v344 = (void *)((char *)a1 + v343);
      uint64_t v345 = (void *)((char *)a2 + v343);
      uint64_t v346 = v345[1];
      *uint64_t v344 = *v345;
      v344[1] = v346;
      uint64_t v347 = v42[11];
      v348 = (void *)((char *)a1 + v347);
      uint64_t v349 = (void *)((char *)a2 + v347);
      uint64_t v350 = type metadata accessor for StorePlatformComposer();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v349, 1, v350))
      {
        uint64_t v351 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6448);
        memcpy(v348, v349, *(void *)(*(void *)(v351 - 8) + 64));
      }
      else
      {
        uint64_t v466 = v349[1];
        void *v348 = *v349;
        v348[1] = v466;
        uint64_t v467 = *(int *)(v350 + 20);
        v468 = (char *)v348 + v467;
        v469 = (char *)v349 + v467;
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v469, 1, (uint64_t)__dstc))
        {
          uint64_t v470 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v468, v469, *(void *)(*(void *)(v470 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, void *))(*(__dstc - 1) + 16))(v468, v469, __dstc);
          __swift_storeEnumTagSinglePayload((uint64_t)v468, 0, 1, (uint64_t)__dstc);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v348, 0, 1, v350);
      }
      *(void *)((char *)a1 + v42[12]) = *(void *)((char *)a2 + v42[12]);
      uint64_t v591 = v42[13];
      uint64_t v592 = (void *)((char *)a1 + v591);
      uint64_t v593 = (void *)((char *)a2 + v591);
      uint64_t v629 = v593[1];
      *uint64_t v592 = *v593;
      v592[1] = v629;
      uint64_t v594 = v42[14];
      v595 = (char *)a1 + v594;
      uint64_t v596 = (char *)a2 + v594;
      *(void *)v595 = *(void *)v596;
      v595[8] = v596[8];
      *(void *)((char *)a1 + v42[15]) = *(void *)((char *)a2 + v42[15]);
      *(void *)((char *)a1 + v42[16]) = *(void *)((char *)a2 + v42[16]);
      *(void *)((char *)a1 + v42[17]) = *(void *)((char *)a2 + v42[17]);
      *(void *)((char *)a1 + v42[18]) = *(void *)((char *)a2 + v42[18]);
      *((unsigned char *)a1 + v42[19]) = *((unsigned char *)a2 + v42[19]);
      *((unsigned char *)a1 + v42[20]) = *((unsigned char *)a2 + v42[20]);
      uint64_t v597 = v42[21];
      uint64_t v598 = (void *)((char *)a1 + v597);
      uint64_t v599 = (void *)((char *)a2 + v597);
      uint64_t v600 = v599[1];
      *uint64_t v598 = *v599;
      v598[1] = v600;
      *((unsigned char *)a1 + v42[22]) = *((unsigned char *)a2 + v42[22]);
      *((unsigned char *)a1 + v42[23]) = *((unsigned char *)a2 + v42[23]);
      uint64_t v601 = v42[24];
      uint64_t v602 = (void *)((char *)a1 + v601);
      uint64_t v603 = (void *)((char *)a2 + v601);
      uint64_t v604 = v603[1];
      *uint64_t v602 = *v603;
      v602[1] = v604;
      *(void *)((char *)a1 + v42[25]) = *(void *)((char *)a2 + v42[25]);
      uint64_t v605 = v42[26];
      uint64_t v606 = (void *)((char *)a1 + v605);
      uint64_t v607 = (void *)((char *)a2 + v605);
      uint64_t v608 = v607[1];
      *uint64_t v606 = *v607;
      v606[1] = v608;
      uint64_t v609 = v42[27];
      uint64_t v634 = (char *)a1 + v609;
      v628 = (char *)a2 + v609;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v31 = (uint64_t)__dstc;
      if (__swift_getEnumTagSinglePayload((uint64_t)v628, 1, (uint64_t)__dstc))
      {
        uint64_t v610 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v634, v628, *(void *)(*(void *)(v610 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, void *))(*(__dstc - 1) + 16))(v634, v628, __dstc);
        __swift_storeEnumTagSinglePayload((uint64_t)v634, 0, 1, (uint64_t)__dstc);
      }
      *((unsigned char *)a1 + v42[28]) = *((unsigned char *)a2 + v42[28]);
      uint64_t v611 = v42[29];
      uint64_t v612 = (char *)a1 + v611;
      uint64_t v613 = (char *)a2 + v611;
      *(void *)uint64_t v612 = *(void *)v613;
      v612[8] = v613[8];
      uint64_t v614 = v42[30];
      uint64_t v615 = (char *)a1 + v614;
      uint64_t v616 = (char *)a2 + v614;
      uint64_t v617 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v616, 1, v617))
      {
        uint64_t v618 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v615, v616, *(void *)(*(void *)(v618 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v616, 1, v624))
        {
          uint64_t v619 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v615, v616, *(void *)(*(void *)(v619 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v624 - 8) + 16))(v615, v616, v624);
          __swift_storeEnumTagSinglePayload((uint64_t)v615, 0, 1, v624);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v615, 0, 1, v617);
      }
      uint64_t v621 = v42[31];
      goto LABEL_250;
    case 0xBu:
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0170);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v48))
      {
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE40);
        memcpy(a1, a2, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v48 - 8) + 16))(a1, a2, v48);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v48);
      }
      uint64_t v189 = (int *)type metadata accessor for StorePlatformStation();
      uint64_t v190 = v189[5];
      uint64_t v191 = (char *)a1 + v190;
      uint64_t v192 = (char *)a2 + v190;
      uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v192, 1, v193))
      {
        uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v191, v192, *(void *)(*(void *)(v194 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v193 - 8) + 16))(v191, v192, v193);
        __swift_storeEnumTagSinglePayload((uint64_t)v191, 0, 1, v193);
      }
      *(void *)((char *)a1 + v189[6]) = *(void *)((char *)a2 + v189[6]);
      uint64_t v352 = v189[7];
      uint64_t v353 = (char *)a1 + v352;
      uint64_t v354 = (char *)a2 + v352;
      uint64_t v355 = sub_1E0995890();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v354, 1, v355))
      {
        uint64_t v356 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE38);
        memcpy(v353, v354, *(void *)(*(void *)(v356 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v355 - 8) + 16))(v353, v354, v355);
        __swift_storeEnumTagSinglePayload((uint64_t)v353, 0, 1, v355);
      }
      *(void *)((char *)a1 + v189[8]) = *(void *)((char *)a2 + v189[8]);
      *(void *)((char *)a1 + v189[9]) = *(void *)((char *)a2 + v189[9]);
      uint64_t v471 = v189[10];
      v472 = (void *)((char *)a1 + v471);
      v473 = (void *)((char *)a2 + v471);
      uint64_t v474 = v473[1];
      void *v472 = *v473;
      v472[1] = v474;
      *((unsigned char *)a1 + v189[11]) = *((unsigned char *)a2 + v189[11]);
      uint64_t v475 = v189[12];
      v476 = (char *)a1 + v475;
      v477 = (char *)a2 + v475;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v478 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v477, 1, v478))
      {
        uint64_t v479 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v476, v477, *(void *)(*(void *)(v479 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v478 - 8) + 16))(v476, v477, v478);
        __swift_storeEnumTagSinglePayload((uint64_t)v476, 0, 1, v478);
      }
      uint64_t v549 = v189[13];
      uint64_t v550 = (void *)((char *)a1 + v549);
      uint64_t v551 = (void *)((char *)a2 + v549);
      uint64_t v552 = v551[1];
      *uint64_t v550 = *v551;
      v550[1] = v552;
      uint64_t v553 = v189[14];
      uint64_t v554 = (char *)a1 + v553;
      uint64_t v555 = (char *)a2 + v553;
      v554[8] = v555[8];
      *(void *)uint64_t v554 = *(void *)v555;
      uint64_t v556 = v189[15];
      v557 = (char *)a1 + v556;
      uint64_t v558 = (char *)a2 + v556;
      uint64_t v559 = sub_1E0995740();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v558, 1, v559))
      {
        uint64_t v560 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE30);
        memcpy(v557, v558, *(void *)(*(void *)(v560 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v559 - 8) + 16))(v557, v558, v559);
        __swift_storeEnumTagSinglePayload((uint64_t)v557, 0, 1, v559);
      }
      uint64_t v580 = v189[16];
      uint64_t v581 = (char *)a1 + v580;
      v582 = (char *)a2 + v580;
      uint64_t v583 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v582, 1, v583))
      {
        uint64_t v584 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v581, v582, *(void *)(*(void *)(v584 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v582, 1, v193))
        {
          uint64_t v589 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v581, v582, *(void *)(*(void *)(v589 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v193 - 8) + 16))(v581, v582, v193);
          __swift_storeEnumTagSinglePayload((uint64_t)v581, 0, 1, v193);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v581, 0, 1, v583);
      }
      uint64_t v590 = v189[17];
LABEL_244:
      v335 = (char *)a1 + v590;
      uint64_t v336 = (char *)a2 + v590;
      uint64_t v577 = sub_1E0992360();
      uint64_t v576 = (uint64_t)v336;
LABEL_245:
      if (__swift_getEnumTagSinglePayload(v576, 1, v577)) {
        goto LABEL_251;
      }
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v577 - 8) + 16))(v335, v336, v577);
      uint64_t v337 = (uint64_t)v335;
      uint64_t v338 = v577;
      goto LABEL_253;
    case 0xCu:
      uint64_t v50 = a2[1];
      *a1 = *a2;
      a1[1] = v50;
      uint64_t v51 = a2[3];
      a1[2] = a2[2];
      a1[3] = v51;
      uint64_t v52 = a2[5];
      a1[4] = a2[4];
      a1[5] = v52;
      uint64_t v53 = (int *)type metadata accessor for StorePlatformTVEpisode();
      uint64_t v54 = v53[8];
      uint64_t v55 = (char *)a1 + v54;
      uint64_t v56 = (char *)a2 + v54;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (__swift_getEnumTagSinglePayload((uint64_t)v56, 1, v57))
      {
        uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
        memcpy(v55, v56, *(void *)(*(void *)(v58 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
        __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v57);
      }
      *(void *)((char *)a1 + v53[9]) = *(void *)((char *)a2 + v53[9]);
      *(void *)((char *)a1 + v53[10]) = *(void *)((char *)a2 + v53[10]);
      uint64_t v195 = v53[11];
      uint64_t v196 = (char *)a1 + v195;
      uint64_t v197 = (char *)a2 + v195;
      v196[8] = v197[8];
      *(void *)uint64_t v196 = *(void *)v197;
      uint64_t v198 = v53[12];
      v199 = (char *)a1 + v198;
      uint64_t v200 = (char *)a2 + v198;
      char v199[8] = v200[8];
      *(void *)v199 = *(void *)v200;
      uint64_t v201 = v53[13];
      uint64_t v202 = (char *)a1 + v201;
      uint64_t v203 = (char *)a2 + v201;
      *(void *)uint64_t v202 = *(void *)v203;
      v202[8] = v203[8];
      *(void *)((char *)a1 + v53[14]) = *(void *)((char *)a2 + v53[14]);
      *(void *)((char *)a1 + v53[15]) = *(void *)((char *)a2 + v53[15]);
      *((unsigned char *)a1 + v53[16]) = *((unsigned char *)a2 + v53[16]);
      uint64_t v204 = v53[17];
      v205 = (void *)((char *)a1 + v204);
      uint64_t v206 = (void *)((char *)a2 + v204);
      uint64_t v207 = v206[1];
      void *v205 = *v206;
      v205[1] = v207;
      uint64_t v208 = v53[18];
      __dstd = (char *)a1 + v208;
      uint64_t v209 = (char *)a2 + v208;
      uint64_t v210 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v209, 1, v210))
      {
        uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(__dstd, v209, *(void *)(*(void *)(v211 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v210 - 8) + 16))(__dstd, v209, v210);
        __swift_storeEnumTagSinglePayload((uint64_t)__dstd, 0, 1, v210);
      }
      *((unsigned char *)a1 + v53[19]) = *((unsigned char *)a2 + v53[19]);
      uint64_t v357 = v53[20];
      uint64_t v358 = (void *)((char *)a1 + v357);
      uint64_t v359 = (void *)((char *)a2 + v357);
      uint64_t v360 = v359[1];
      *uint64_t v358 = *v359;
      v358[1] = v360;
      *(void *)((char *)a1 + v53[21]) = *(void *)((char *)a2 + v53[21]);
      uint64_t v361 = v53[22];
      uint64_t v362 = (char *)a1 + v361;
      v363 = (char *)a2 + v361;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v364 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v363, 1, v364))
      {
        uint64_t v365 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v362, v363, *(void *)(*(void *)(v365 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v364 - 8) + 16))(v362, v363, v364);
        __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v364);
      }
      uint64_t v480 = v53[23];
      v481 = (void *)((char *)a1 + v480);
      uint64_t v482 = (void *)((char *)a2 + v480);
      uint64_t v483 = v482[1];
      void *v481 = *v482;
      v481[1] = v483;
      uint64_t v484 = v53[24];
      v485 = (char *)a1 + v484;
      uint64_t v486 = (char *)a2 + v484;
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v486, 1, v364))
      {
        uint64_t v487 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v485, v486, *(void *)(*(void *)(v487 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v364 - 8) + 16))(v485, v486, v364);
        __swift_storeEnumTagSinglePayload((uint64_t)v485, 0, 1, v364);
      }
      *((unsigned char *)a1 + v53[25]) = *((unsigned char *)a2 + v53[25]);
      uint64_t v561 = v53[26];
      uint64_t v562 = (char *)a1 + v561;
      uint64_t v563 = (char *)a2 + v561;
      uint64_t v564 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
      if (__swift_getEnumTagSinglePayload((uint64_t)v563, 1, v564))
      {
        uint64_t v565 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
        memcpy(v562, v563, *(void *)(*(void *)(v565 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v564 - 8) + 16))(v562, v563, v564);
        __swift_storeEnumTagSinglePayload((uint64_t)v562, 0, 1, v564);
      }
      uint64_t v585 = v53[27];
      v586 = (char *)a1 + v585;
      v587 = (char *)a2 + v585;
      *(void *)v586 = *(void *)v587;
      v586[8] = v587[8];
      *((unsigned char *)a1 + v53[28]) = *((unsigned char *)a2 + v53[28]);
      uint64_t v588 = v53[29];
      v335 = (char *)a1 + v588;
      uint64_t v336 = (char *)a2 + v588;
      goto LABEL_206;
    case 0xDu:
      uint64_t v59 = a2[1];
      *a1 = *a2;
      a1[1] = v59;
      uint64_t v60 = (int *)type metadata accessor for StorePlatformTVSeason();
      uint64_t v61 = v60[5];
      uint64_t v62 = (char *)a1 + v61;
      uint64_t v63 = (char *)a2 + v61;
      swift_bridgeObjectRetain();
      uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v63, 1, v64))
      {
        uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v62, v63, *(void *)(*(void *)(v65 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v64 - 8) + 16))(v62, v63, v64);
        __swift_storeEnumTagSinglePayload((uint64_t)v62, 0, 1, v64);
      }
      *(void *)((char *)a1 + v60[6]) = *(void *)((char *)a2 + v60[6]);
      *(void *)((char *)a1 + v60[7]) = *(void *)((char *)a2 + v60[7]);
      *(void *)((char *)a1 + v60[8]) = *(void *)((char *)a2 + v60[8]);
      uint64_t v212 = v60[9];
      v213 = (void *)((char *)a1 + v212);
      uint64_t v214 = (void *)((char *)a2 + v212);
      uint64_t v215 = v214[1];
      void *v213 = *v214;
      v213[1] = v215;
      *(void *)((char *)a1 + v60[10]) = *(void *)((char *)a2 + v60[10]);
      *(void *)((char *)a1 + v60[11]) = *(void *)((char *)a2 + v60[11]);
      *(void *)((char *)a1 + v60[12]) = *(void *)((char *)a2 + v60[12]);
      *(void *)((char *)a1 + v60[13]) = *(void *)((char *)a2 + v60[13]);
      uint64_t v216 = v60[14];
      v217 = (void *)((char *)a1 + v216);
      uint64_t v218 = (void *)((char *)a2 + v216);
      uint64_t v219 = v218[1];
      void *v217 = *v218;
      v217[1] = v219;
      uint64_t v220 = v60[15];
      v221 = (void *)((char *)a1 + v220);
      uint64_t v222 = (void *)((char *)a2 + v220);
      uint64_t v223 = v222[1];
      void *v221 = *v222;
      v221[1] = v223;
      uint64_t v224 = v60[16];
      v225 = (void *)((char *)a1 + v224);
      uint64_t v226 = (void *)((char *)a2 + v224);
      uint64_t v227 = v226[1];
      void *v225 = *v226;
      v225[1] = v227;
      uint64_t v228 = v60[17];
      v229 = (char *)a1 + v228;
      uint64_t v230 = (char *)a2 + v228;
      *(void *)v229 = *(void *)v230;
      v229[8] = v230[8];
      uint64_t v231 = v60[18];
      __dste = (char *)a1 + v231;
      uint64_t v232 = (char *)a2 + v231;
      uint64_t v233 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v232, 1, v233))
      {
        uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(__dste, v232, *(void *)(*(void *)(v234 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v233 - 8) + 16))(__dste, v232, v233);
        __swift_storeEnumTagSinglePayload((uint64_t)__dste, 0, 1, v233);
      }
      goto LABEL_254;
    case 0xEu:
      uint64_t v66 = a2[1];
      *a1 = *a2;
      a1[1] = v66;
      uint64_t v67 = (int *)type metadata accessor for StorePlatformTVShow();
      uint64_t v68 = v67[5];
      uint64_t v69 = (char *)a1 + v68;
      uint64_t v70 = (char *)a2 + v68;
      swift_bridgeObjectRetain();
      uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v70, 1, v71))
      {
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v69, v70, *(void *)(*(void *)(v72 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 16))(v69, v70, v71);
        __swift_storeEnumTagSinglePayload((uint64_t)v69, 0, 1, v71);
      }
      uint64_t v235 = v67[6];
      v236 = (void *)((char *)a1 + v235);
      uint64_t v237 = (void *)((char *)a2 + v235);
      uint64_t v238 = v237[1];
      void *v236 = *v237;
      v236[1] = v238;
      *(void *)((char *)a1 + v67[7]) = *(void *)((char *)a2 + v67[7]);
      *(void *)((char *)a1 + v67[8]) = *(void *)((char *)a2 + v67[8]);
      *(void *)((char *)a1 + v67[9]) = *(void *)((char *)a2 + v67[9]);
      *(void *)((char *)a1 + v67[10]) = *(void *)((char *)a2 + v67[10]);
      *(void *)((char *)a1 + v67[11]) = *(void *)((char *)a2 + v67[11]);
      *(void *)((char *)a1 + v67[12]) = *(void *)((char *)a2 + v67[12]);
      uint64_t v239 = v67[13];
      v240 = (char *)a1 + v239;
      uint64_t v241 = (char *)a2 + v239;
      *(void *)v240 = *(void *)v241;
      v240[8] = v241[8];
      *(void *)((char *)a1 + v67[14]) = *(void *)((char *)a2 + v67[14]);
      *(void *)((char *)a1 + v67[15]) = *(void *)((char *)a2 + v67[15]);
      *((unsigned char *)a1 + v67[16]) = *((unsigned char *)a2 + v67[16]);
      uint64_t v242 = v67[17];
      __dstf = (char *)a1 + v242;
      uint64_t v243 = (char *)a2 + v242;
      uint64_t v627 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v210 = v627;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v243, 1, v627))
      {
        uint64_t v244 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(__dstf, v243, *(void *)(*(void *)(v244 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v627 - 8) + 16))(__dstf, v243, v627);
        __swift_storeEnumTagSinglePayload((uint64_t)__dstf, 0, 1, v627);
      }
      uint64_t v366 = v67[18];
      v367 = (char *)a1 + v366;
      v368 = (char *)a2 + v366;
      uint64_t v369 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v368, 1, v369))
      {
        uint64_t v370 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v367, v368, *(void *)(*(void *)(v370 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v369 - 8) + 16))(v367, v368, v369);
        __swift_storeEnumTagSinglePayload((uint64_t)v367, 0, 1, v369);
      }
      *(void *)((char *)a1 + v67[19]) = *(void *)((char *)a2 + v67[19]);
      uint64_t v488 = v67[20];
      uint64_t v489 = (void *)((char *)a1 + v488);
      uint64_t v490 = (void *)((char *)a2 + v488);
      uint64_t v491 = v490[1];
      *uint64_t v489 = *v490;
      v489[1] = v491;
      uint64_t v492 = v67[21];
      v493 = (void *)((char *)a1 + v492);
      uint64_t v494 = (void *)((char *)a2 + v492);
      uint64_t v495 = v494[1];
      void *v493 = *v494;
      v493[1] = v495;
      uint64_t v496 = v67[22];
      v335 = (char *)a1 + v496;
      uint64_t v336 = (char *)a2 + v496;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_206:
      if (__swift_getEnumTagSinglePayload((uint64_t)v336, 1, v210)) {
        goto LABEL_251;
      }
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v210 - 8) + 16))(v335, v336, v210);
      uint64_t v337 = (uint64_t)v335;
      uint64_t v338 = v210;
      goto LABEL_253;
    case 0xFu:
      uint64_t v73 = a2[1];
      *a1 = *a2;
      a1[1] = v73;
      uint64_t v74 = (int *)type metadata accessor for StorePlatformUploadedAudio();
      uint64_t v75 = v74[5];
      uint64_t v76 = (char *)a1 + v75;
      uint64_t v77 = (char *)a2 + v75;
      swift_bridgeObjectRetain();
      uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v77, 1, v78))
      {
        uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v76, v77, *(void *)(*(void *)(v79 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v78 - 8) + 16))(v76, v77, v78);
        __swift_storeEnumTagSinglePayload((uint64_t)v76, 0, 1, v78);
      }
      uint64_t v245 = v74[6];
      v246 = (char *)a1 + v245;
      uint64_t v247 = (char *)a2 + v245;
      uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
      if (__swift_getEnumTagSinglePayload((uint64_t)v247, 1, v248))
      {
        uint64_t v249 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
        memcpy(v246, v247, *(void *)(*(void *)(v249 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v248 - 8) + 16))(v246, v247, v248);
        __swift_storeEnumTagSinglePayload((uint64_t)v246, 0, 1, v248);
      }
      uint64_t v371 = v74[7];
      v372 = (void *)((char *)a1 + v371);
      uint64_t v373 = (void *)((char *)a2 + v371);
      uint64_t v633 = (void *)v373[1];
      void *v372 = *v373;
      v372[1] = v633;
      uint64_t v374 = v74[8];
      uint64_t v375 = (char *)a1 + v374;
      v376 = (char *)a2 + v374;
      v375[8] = v376[8];
      *(void *)uint64_t v375 = *(void *)v376;
      *(void *)((char *)a1 + v74[9]) = *(void *)((char *)a2 + v74[9]);
      *(void *)((char *)a1 + v74[10]) = *(void *)((char *)a2 + v74[10]);
      *(void *)((char *)a1 + v74[11]) = *(void *)((char *)a2 + v74[11]);
      uint64_t v377 = v74[12];
      uint64_t v378 = (void *)((char *)a1 + v377);
      uint64_t v379 = (void *)((char *)a2 + v377);
      uint64_t v380 = v379[1];
      *uint64_t v378 = *v379;
      v378[1] = v380;
      *((unsigned char *)a1 + v74[13]) = *((unsigned char *)a2 + v74[13]);
      uint64_t v381 = v74[14];
      v382 = (void *)((char *)a1 + v381);
      uint64_t v383 = (void *)((char *)a2 + v381);
      uint64_t v384 = v383[1];
      void *v382 = *v383;
      v382[1] = v384;
      uint64_t v385 = v74[15];
      v386 = (void *)((char *)a1 + v385);
      uint64_t v387 = (void *)((char *)a2 + v385);
      uint64_t v388 = v387[1];
      void *v386 = *v387;
      v386[1] = v388;
      uint64_t v389 = v74[16];
      __dsth = (char *)a1 + v389;
      v390 = (char *)a2 + v389;
      uint64_t v391 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v390, 1, v391))
      {
        uint64_t v392 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(__dsth, v390, *(void *)(*(void *)(v392 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v391 - 8) + 16))(__dsth, v390, v391);
        __swift_storeEnumTagSinglePayload((uint64_t)__dsth, 0, 1, v391);
      }
      goto LABEL_192;
    case 0x10u:
      uint64_t v80 = a2[1];
      *a1 = *a2;
      a1[1] = v80;
      uint64_t v74 = (int *)type metadata accessor for StorePlatformUploadedVideo();
      uint64_t v81 = v74[5];
      uint64_t v82 = (char *)a1 + v81;
      uint64_t v83 = (char *)a2 + v81;
      swift_bridgeObjectRetain();
      uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v83, 1, v84))
      {
        uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v82, v83, *(void *)(*(void *)(v85 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v84 - 8) + 16))(v82, v83, v84);
        __swift_storeEnumTagSinglePayload((uint64_t)v82, 0, 1, v84);
      }
      uint64_t v250 = v74[6];
      v251 = (char *)a1 + v250;
      uint64_t v252 = (char *)a2 + v250;
      uint64_t v253 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
      if (__swift_getEnumTagSinglePayload((uint64_t)v252, 1, v253))
      {
        uint64_t v254 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
        memcpy(v251, v252, *(void *)(*(void *)(v254 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v253 - 8) + 16))(v251, v252, v253);
        __swift_storeEnumTagSinglePayload((uint64_t)v251, 0, 1, v253);
      }
      uint64_t v393 = v74[7];
      uint64_t v394 = (void *)((char *)a1 + v393);
      v395 = (void *)((char *)a2 + v393);
      uint64_t v396 = v395[1];
      *uint64_t v394 = *v395;
      v394[1] = v396;
      *(void *)((char *)a1 + v74[8]) = *(void *)((char *)a2 + v74[8]);
      *(void *)((char *)a1 + v74[9]) = *(void *)((char *)a2 + v74[9]);
      *(void *)((char *)a1 + v74[10]) = *(void *)((char *)a2 + v74[10]);
      uint64_t v397 = v74[11];
      v398 = (void *)((char *)a1 + v397);
      v399 = (void *)((char *)a2 + v397);
      uint64_t v400 = v399[1];
      void *v398 = *v399;
      v398[1] = v400;
      uint64_t v401 = v74[12];
      __dsti = (char *)a1 + v401;
      v402 = (char *)a2 + v401;
      uint64_t v403 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v402, 1, v403))
      {
        uint64_t v404 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(__dsti, v402, *(void *)(*(void *)(v404 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v403 - 8) + 16))(__dsti, v402, v403);
        __swift_storeEnumTagSinglePayload((uint64_t)__dsti, 0, 1, v403);
      }
      *((unsigned char *)a1 + v74[13]) = *((unsigned char *)a2 + v74[13]);
      uint64_t v497 = v74[14];
      uint64_t v498 = (void *)((char *)a1 + v497);
      uint64_t v499 = (void *)((char *)a2 + v497);
      uint64_t v500 = v499[1];
      *uint64_t v498 = *v499;
      v498[1] = v500;
      uint64_t v501 = v74[15];
      uint64_t v502 = (void *)((char *)a1 + v501);
      uint64_t v503 = (void *)((char *)a2 + v501);
      uint64_t v504 = v503[1];
      *uint64_t v502 = *v503;
      v502[1] = v504;
      uint64_t v505 = v74[16];
      v506 = (char *)a1 + v505;
      uint64_t v507 = (char *)a2 + v505;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v507, 1, v403))
      {
        uint64_t v508 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v506, v507, *(void *)(*(void *)(v508 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v403 - 8) + 16))(v506, v507, v403);
        __swift_storeEnumTagSinglePayload((uint64_t)v506, 0, 1, v403);
      }
LABEL_192:
      *((unsigned char *)a1 + v74[17]) = *((unsigned char *)a2 + v74[17]);
      uint64_t v566 = v74[18];
      uint64_t v567 = (void *)((char *)a1 + v566);
      uint64_t v568 = (void *)((char *)a2 + v566);
      uint64_t v569 = v568[1];
      *uint64_t v567 = *v568;
      v567[1] = v569;
      uint64_t v570 = v74[19];
      uint64_t v571 = (void *)((char *)a1 + v570);
      v572 = (void *)((char *)a2 + v570);
      uint64_t v573 = v572[1];
      *uint64_t v571 = *v572;
      v571[1] = v573;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_254;
    default:
      uint64_t v4 = a2[1];
      *a1 = *a2;
      a1[1] = v4;
      uint64_t v5 = a2[3];
      a1[2] = a2[2];
      a1[3] = v5;
      uint64_t v6 = (int *)type metadata accessor for StorePlatformAlbum();
      uint64_t v7 = v6[6];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_1E0992360();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      }
      uint64_t v86 = v6[7];
      uint64_t v87 = (char *)a1 + v86;
      uint64_t v88 = (char *)a2 + v86;
      uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      __dstb = (void *)v10;
      uint64_t v625 = v89;
      if (__swift_getEnumTagSinglePayload((uint64_t)v88, 1, v89))
      {
        uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v87, v88, *(void *)(*(void *)(v90 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v89 - 8) + 16))(v87, v88, v89);
        __swift_storeEnumTagSinglePayload((uint64_t)v87, 0, 1, v89);
      }
      *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
      *(void *)((char *)a1 + v6[9]) = *(void *)((char *)a2 + v6[9]);
      *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
      *(void *)((char *)a1 + v6[11]) = *(void *)((char *)a2 + v6[11]);
      uint64_t v255 = v6[12];
      v256 = (void *)((char *)a1 + v255);
      uint64_t v257 = (void *)((char *)a2 + v255);
      uint64_t v258 = v257[1];
      void *v256 = *v257;
      v256[1] = v258;
      *(void *)((char *)a1 + v6[13]) = *(void *)((char *)a2 + v6[13]);
      *(void *)((char *)a1 + v6[14]) = *(void *)((char *)a2 + v6[14]);
      *(void *)((char *)a1 + v6[15]) = *(void *)((char *)a2 + v6[15]);
      *(void *)((char *)a1 + v6[16]) = *(void *)((char *)a2 + v6[16]);
      *((unsigned char *)a1 + v6[17]) = *((unsigned char *)a2 + v6[17]);
      *((unsigned char *)a1 + v6[18]) = *((unsigned char *)a2 + v6[18]);
      *((unsigned char *)a1 + v6[19]) = *((unsigned char *)a2 + v6[19]);
      uint64_t v259 = v6[20];
      uint64_t v630 = (char *)a1 + v259;
      uint64_t v260 = (char *)a2 + v259;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v261 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v260, 1, v261))
      {
        uint64_t v262 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v630, v260, *(void *)(*(void *)(v262 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v261 - 8) + 16))(v630, v260, v261);
        __swift_storeEnumTagSinglePayload((uint64_t)v630, 0, 1, v261);
      }
      uint64_t v405 = v6[21];
      v406 = (void *)((char *)a1 + v405);
      uint64_t v407 = (void *)((char *)a2 + v405);
      uint64_t v408 = v407[1];
      void *v406 = *v407;
      v406[1] = v408;
      uint64_t v409 = v6[22];
      v410 = (void *)((char *)a1 + v409);
      uint64_t v411 = (void *)((char *)a2 + v409);
      uint64_t v412 = v411[1];
      void *v410 = *v411;
      v410[1] = v412;
      *(void *)((char *)a1 + v6[23]) = *(void *)((char *)a2 + v6[23]);
      uint64_t v413 = v6[24];
      uint64_t v414 = (void *)((char *)a1 + v413);
      uint64_t v415 = (void *)((char *)a2 + v413);
      uint64_t v416 = v415[1];
      *uint64_t v414 = *v415;
      v414[1] = v416;
      uint64_t v417 = v6[25];
      uint64_t v418 = (char *)a1 + v417;
      uint64_t v419 = (char *)a2 + v417;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v31 = (uint64_t)__dstb;
      if (__swift_getEnumTagSinglePayload((uint64_t)v419, 1, (uint64_t)__dstb))
      {
        uint64_t v420 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v418, v419, *(void *)(*(void *)(v420 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, void *))(*(__dstb - 1) + 16))(v418, v419, __dstb);
        __swift_storeEnumTagSinglePayload((uint64_t)v418, 0, 1, (uint64_t)__dstb);
      }
      uint64_t v509 = v6[26];
      v510 = (char *)a1 + v509;
      uint64_t v511 = (char *)a2 + v509;
      *(void *)v510 = *(void *)v511;
      v510[8] = v511[8];
      uint64_t v512 = v6[27];
      v513 = (char *)a1 + v512;
      v514 = (char *)a2 + v512;
      uint64_t v515 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v514, 1, v515))
      {
        uint64_t v516 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v513, v514, *(void *)(*(void *)(v516 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v514, 1, v625))
        {
          uint64_t v574 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v513, v514, *(void *)(*(void *)(v574 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v625 - 8) + 16))(v513, v514, v625);
          __swift_storeEnumTagSinglePayload((uint64_t)v513, 0, 1, v625);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v513, 0, 1, v515);
      }
      uint64_t v621 = v6[28];
LABEL_250:
      v335 = (char *)a1 + v621;
      uint64_t v336 = (char *)a2 + v621;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v621, 1, v31))
      {
LABEL_251:
        uint64_t v622 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v335, v336, *(void *)(*(void *)(v622 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v31 - 8) + 16))(v335, v336, v31);
        uint64_t v337 = (uint64_t)v335;
        uint64_t v338 = v31;
LABEL_253:
        __swift_storeEnumTagSinglePayload(v337, 0, 1, v338);
      }
LABEL_254:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
}

void *sub_1E09852BC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1E09897C8((uint64_t)a1, (void (*)(void))type metadata accessor for StorePlatformGenericMusicItem);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v10))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v10);
        }
        uint64_t v75 = (int *)type metadata accessor for StorePlatformArtist();
        *(void *)((char *)a1 + v75[5]) = *(void *)((char *)a2 + v75[5]);
        *(void *)((char *)a1 + v75[6]) = *(void *)((char *)a2 + v75[6]);
        *(void *)((char *)a1 + v75[7]) = *(void *)((char *)a2 + v75[7]);
        *(void *)((char *)a1 + v75[8]) = *(void *)((char *)a2 + v75[8]);
        uint64_t v76 = v75[9];
        uint64_t v77 = (void *)((char *)a1 + v76);
        uint64_t v78 = (void *)((char *)a2 + v76);
        *uint64_t v77 = *v78;
        v77[1] = v78[1];
        uint64_t v79 = v75[10];
        uint64_t v80 = (char *)a1 + v79;
        uint64_t v81 = (char *)a2 + v79;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v81, 1, v82))
        {
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v80, v81, *(void *)(*(void *)(v83 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 16))(v80, v81, v82);
          __swift_storeEnumTagSinglePayload((uint64_t)v80, 0, 1, v82);
        }
        uint64_t v235 = v75[11];
        v236 = (void *)((char *)a1 + v235);
        uint64_t v237 = (void *)((char *)a2 + v235);
        void *v236 = *v237;
        v236[1] = v237[1];
        uint64_t v238 = v75[12];
        uint64_t v239 = (void *)((char *)a1 + v238);
        v240 = (void *)((char *)a2 + v238);
        void *v239 = *v240;
        v239[1] = v240[1];
        uint64_t v241 = v75[13];
        uint64_t v242 = (char *)a1 + v241;
        uint64_t v243 = (char *)a2 + v241;
        uint64_t v244 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v243, 1, v244))
        {
          uint64_t v245 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v242, v243, *(void *)(*(void *)(v245 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v244 - 8) + 16))(v242, v243, v244);
          __swift_storeEnumTagSinglePayload((uint64_t)v242, 0, 1, v244);
        }
        uint64_t v372 = v75[14];
        uint64_t v373 = (char *)a1 + v372;
        uint64_t v374 = (char *)a2 + v372;
        uint64_t v375 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v374, 1, v375))
        {
          uint64_t v376 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v373, v374, *(void *)(*(void *)(v376 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v374, 1, v10))
          {
            uint64_t v457 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v373, v374, *(void *)(*(void *)(v457 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v373, v374, v10);
            __swift_storeEnumTagSinglePayload((uint64_t)v373, 0, 1, v10);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v373, 0, 1, v375);
        }
        uint64_t v556 = v75[15];
        uint64_t v296 = (char *)a1 + v556;
        uint64_t v297 = (char *)a2 + v556;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v556, 1, v244)) {
          goto LABEL_252;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v244 - 8) + 16))(v296, v297, v244);
        uint64_t v298 = (uint64_t)v296;
        uint64_t v299 = v244;
        goto LABEL_254;
      case 2u:
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v12))
        {
          uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v12);
        }
        uint64_t v84 = (int *)type metadata accessor for StorePlatformCurator();
        *(void *)((char *)a1 + v84[5]) = *(void *)((char *)a2 + v84[5]);
        *(void *)((char *)a1 + v84[6]) = *(void *)((char *)a2 + v84[6]);
        uint64_t v85 = v84[7];
        uint64_t v86 = (void *)((char *)a1 + v85);
        uint64_t v87 = (void *)((char *)a2 + v85);
        void *v86 = *v87;
        v86[1] = v87[1];
        uint64_t v88 = v84[8];
        uint64_t v89 = (char *)a1 + v88;
        uint64_t v90 = (char *)a2 + v88;
        uint64_t v91 = sub_1E09955A0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v90, 1, v91))
        {
          uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB800);
          memcpy(v89, v90, *(void *)(*(void *)(v92 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v91 - 8) + 16))(v89, v90, v91);
          __swift_storeEnumTagSinglePayload((uint64_t)v89, 0, 1, v91);
        }
        uint64_t v246 = v84[9];
        uint64_t v247 = (char *)a1 + v246;
        uint64_t v248 = (char *)a2 + v246;
        uint64_t v249 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v248, 1, v249))
        {
          uint64_t v250 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v247, v248, *(void *)(*(void *)(v250 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v249 - 8) + 16))(v247, v248, v249);
          __swift_storeEnumTagSinglePayload((uint64_t)v247, 0, 1, v249);
        }
        uint64_t v377 = v84[10];
        uint64_t v378 = (void *)((char *)a1 + v377);
        uint64_t v379 = (void *)((char *)a2 + v377);
        *uint64_t v378 = *v379;
        v378[1] = v379[1];
        uint64_t v380 = v84[11];
        uint64_t v381 = (void *)((char *)a1 + v380);
        v382 = (void *)((char *)a2 + v380);
        void *v381 = *v382;
        v381[1] = v382[1];
        uint64_t v383 = v84[12];
        uint64_t v384 = (char *)a1 + v383;
        uint64_t v385 = (char *)a2 + v383;
        uint64_t v386 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v385, 1, v386))
        {
          uint64_t v387 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v384, v385, *(void *)(*(void *)(v387 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v385, 1, v12))
          {
            uint64_t v458 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v384, v385, *(void *)(*(void *)(v458 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v384, v385, v12);
            __swift_storeEnumTagSinglePayload((uint64_t)v384, 0, 1, v12);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v384, 0, 1, v386);
        }
        uint64_t v527 = v84[13];
        goto LABEL_245;
      case 3u:
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v14))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v14);
        }
        uint64_t v93 = (int *)type metadata accessor for StorePlatformGenre();
        goto LABEL_59;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v16 = (int *)type metadata accessor for StorePlatformMusicMovie();
        uint64_t v17 = v16[5];
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        swift_bridgeObjectRetain();
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v18, v19, *(void *)(*(void *)(v21 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
          __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
        }
        *(void *)((char *)a1 + v16[6]) = *(void *)((char *)a2 + v16[6]);
        uint64_t v94 = v16[7];
        uint64_t v95 = (void *)((char *)a1 + v94);
        uint64_t v96 = (void *)((char *)a2 + v94);
        *uint64_t v95 = *v96;
        v95[1] = v96[1];
        *(void *)((char *)a1 + v16[8]) = *(void *)((char *)a2 + v16[8]);
        uint64_t v97 = v16[9];
        uint64_t v98 = (char *)a1 + v97;
        uint64_t v99 = (char *)a2 + v97;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v99, 1, v100))
        {
          uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v98, v99, *(void *)(*(void *)(v101 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v100 - 8) + 16))(v98, v99, v100);
          __swift_storeEnumTagSinglePayload((uint64_t)v98, 0, 1, v100);
        }
        *(void *)((char *)a1 + v16[10]) = *(void *)((char *)a2 + v16[10]);
        *(void *)((char *)a1 + v16[11]) = *(void *)((char *)a2 + v16[11]);
        *(void *)((char *)a1 + v16[12]) = *(void *)((char *)a2 + v16[12]);
        *(void *)((char *)a1 + v16[13]) = *(void *)((char *)a2 + v16[13]);
        uint64_t v251 = v16[14];
        uint64_t v252 = (void *)((char *)a1 + v251);
        uint64_t v253 = (void *)((char *)a2 + v251);
        *uint64_t v252 = *v253;
        v252[1] = v253[1];
        uint64_t v254 = v16[15];
        uint64_t v563 = (char *)a1 + v254;
        uint64_t v255 = (char *)a2 + v254;
        uint64_t v256 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        __dste = (void *)v256;
        if (__swift_getEnumTagSinglePayload((uint64_t)v255, 1, v256))
        {
          uint64_t v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v563, v255, *(void *)(*(void *)(v257 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v256 - 8) + 16))(v563, v255, v256);
          __swift_storeEnumTagSinglePayload((uint64_t)v563, 0, 1, v256);
        }
        *((unsigned char *)a1 + v16[16]) = *((unsigned char *)a2 + v16[16]);
        uint64_t v388 = v16[17];
        uint64_t v389 = (char *)a1 + v388;
        v390 = (char *)a2 + v388;
        uint64_t v391 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v390, 1, v391))
        {
          uint64_t v392 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v389, v390, *(void *)(*(void *)(v392 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v391 - 8) + 16))(v389, v390, v391);
          __swift_storeEnumTagSinglePayload((uint64_t)v389, 0, 1, v391);
        }
        *(void *)((char *)a1 + v16[18]) = *(void *)((char *)a2 + v16[18]);
        uint64_t v459 = v16[19];
        uint64_t v460 = (void *)((char *)a1 + v459);
        uint64_t v461 = (void *)((char *)a2 + v459);
        *uint64_t v460 = *v461;
        v460[1] = v461[1];
        *(void *)((char *)a1 + v16[20]) = *(void *)((char *)a2 + v16[20]);
        uint64_t v462 = v16[21];
        uint64_t v463 = (void *)((char *)a1 + v462);
        uint64_t v464 = (void *)((char *)a2 + v462);
        void *v463 = *v464;
        v463[1] = v464[1];
        *((unsigned char *)a1 + v16[22]) = *((unsigned char *)a2 + v16[22]);
        uint64_t v465 = v16[23];
        uint64_t v466 = (void *)((char *)a1 + v465);
        uint64_t v467 = (void *)((char *)a2 + v465);
        *uint64_t v466 = *v467;
        v466[1] = v467[1];
        uint64_t v468 = v16[24];
        v469 = (char *)a1 + v468;
        uint64_t v470 = (char *)a2 + v468;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v471 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
        if (__swift_getEnumTagSinglePayload((uint64_t)v470, 1, v471))
        {
          uint64_t v472 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
          memcpy(v469, v470, *(void *)(*(void *)(v472 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v471 - 8) + 16))(v469, v470, v471);
          __swift_storeEnumTagSinglePayload((uint64_t)v469, 0, 1, v471);
        }
        uint64_t v511 = v16[25];
        uint64_t v296 = (char *)a1 + v511;
        uint64_t v297 = (char *)a2 + v511;
        uint64_t v512 = (uint64_t)a2 + v511;
        uint64_t v513 = (uint64_t)__dste;
        goto LABEL_246;
      case 5u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v22 = (int *)type metadata accessor for StorePlatformMusicVideo();
        uint64_t v23 = v22[6];
        uint64_t v24 = (char *)a1 + v23;
        uint64_t v25 = (char *)a2 + v23;
        uint64_t v8 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v8))
        {
          uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v24, v25, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v8);
        }
        uint64_t v102 = v22[7];
        uint64_t v103 = (char *)a1 + v102;
        uint64_t v104 = (char *)a2 + v102;
        uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v104, 1, v105))
        {
          uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v103, v104, *(void *)(*(void *)(v106 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v105 - 8) + 16))(v103, v104, v105);
          __swift_storeEnumTagSinglePayload((uint64_t)v103, 0, 1, v105);
        }
        uint64_t v258 = v22[8];
        uint64_t v259 = (void *)((char *)a1 + v258);
        uint64_t v260 = (void *)((char *)a2 + v258);
        void *v259 = *v260;
        v259[1] = v260[1];
        uint64_t v261 = v22[9];
        uint64_t v262 = (void *)((char *)a1 + v261);
        uint64_t v263 = (void *)((char *)a2 + v261);
        *uint64_t v262 = *v263;
        v262[1] = v263[1];
        *(void *)((char *)a1 + v22[10]) = *(void *)((char *)a2 + v22[10]);
        uint64_t v264 = v22[11];
        uint64_t v265 = (void *)((char *)a1 + v264);
        uint64_t v266 = (void *)((char *)a2 + v264);
        *uint64_t v265 = *v266;
        v265[1] = v266[1];
        *(void *)((char *)a1 + v22[12]) = *(void *)((char *)a2 + v22[12]);
        *(void *)((char *)a1 + v22[13]) = *(void *)((char *)a2 + v22[13]);
        *(void *)((char *)a1 + v22[14]) = *(void *)((char *)a2 + v22[14]);
        *(void *)((char *)a1 + v22[15]) = *(void *)((char *)a2 + v22[15]);
        uint64_t v267 = v22[16];
        v268 = (void *)((char *)a1 + v267);
        uint64_t v269 = (void *)((char *)a2 + v267);
        void *v268 = *v269;
        v268[1] = v269[1];
        uint64_t v270 = v22[17];
        uint64_t v564 = (char *)a1 + v270;
        uint64_t v271 = (char *)a2 + v270;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v271, 1, v8))
        {
          uint64_t v272 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v564, v271, *(void *)(*(void *)(v272 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v564, v271, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v564, 0, 1, v8);
        }
        *((unsigned char *)a1 + v22[18]) = *((unsigned char *)a2 + v22[18]);
        uint64_t v393 = v22[19];
        uint64_t v394 = (void *)((char *)a1 + v393);
        v395 = (void *)((char *)a2 + v393);
        *uint64_t v394 = *v395;
        v394[1] = v395[1];
        *(void *)((char *)a1 + v22[20]) = *(void *)((char *)a2 + v22[20]);
        uint64_t v396 = v22[21];
        uint64_t v397 = (void *)((char *)a1 + v396);
        v398 = (void *)((char *)a2 + v396);
        *uint64_t v397 = *v398;
        v397[1] = v398[1];
        uint64_t v399 = v22[22];
        uint64_t v400 = (char *)a1 + v399;
        uint64_t v401 = (char *)a2 + v399;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v401, 1, v8))
        {
          uint64_t v402 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v400, v401, *(void *)(*(void *)(v402 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v400, v401, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v400, 0, 1, v8);
        }
        *((unsigned char *)a1 + v22[23]) = *((unsigned char *)a2 + v22[23]);
        uint64_t v473 = v22[24];
        uint64_t v474 = (char *)a1 + v473;
        uint64_t v475 = (char *)a2 + v473;
        uint64_t v476 = *(void *)v475;
        v474[8] = v475[8];
        *(void *)uint64_t v474 = v476;
        uint64_t v477 = v22[25];
        uint64_t v478 = (char *)a1 + v477;
        uint64_t v479 = (char *)a2 + v477;
        uint64_t v480 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v479, 1, v480))
        {
          uint64_t v481 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v478, v479, *(void *)(*(void *)(v481 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v479, 1, v105))
          {
            uint64_t v514 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v478, v479, *(void *)(*(void *)(v514 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v105 - 8) + 16))(v478, v479, v105);
            __swift_storeEnumTagSinglePayload((uint64_t)v478, 0, 1, v105);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v478, 0, 1, v480);
        }
        uint64_t v557 = v22[26];
        goto LABEL_251;
      case 6u:
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        __dst = (void *)v27;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v27))
        {
          uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v28 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(a1, a2, v27);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v27);
        }
        uint64_t v107 = (int *)type metadata accessor for StorePlatformPlaylist();
        *(void *)((char *)a1 + v107[5]) = *(void *)((char *)a2 + v107[5]);
        uint64_t v108 = v107[6];
        uint64_t v109 = (void *)((char *)a1 + v108);
        uint64_t v110 = (void *)((char *)a2 + v108);
        *uint64_t v109 = *v110;
        v109[1] = v110[1];
        *(void *)((char *)a1 + v107[7]) = *(void *)((char *)a2 + v107[7]);
        *(void *)((char *)a1 + v107[8]) = *(void *)((char *)a2 + v107[8]);
        uint64_t v111 = v107[9];
        uint64_t v112 = (char *)a1 + v111;
        uint64_t v113 = (char *)a2 + v111;
        uint64_t v114 = sub_1E0996410();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v113, 1, v114))
        {
          uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
          memcpy(v112, v113, *(void *)(*(void *)(v115 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v114 - 8) + 16))(v112, v113, v114);
          __swift_storeEnumTagSinglePayload((uint64_t)v112, 0, 1, v114);
        }
        *(void *)((char *)a1 + v107[10]) = *(void *)((char *)a2 + v107[10]);
        *(void *)((char *)a1 + v107[11]) = *(void *)((char *)a2 + v107[11]);
        uint64_t v273 = v107[12];
        uint64_t v274 = (void *)((char *)a1 + v273);
        uint64_t v275 = (void *)((char *)a2 + v273);
        *uint64_t v274 = *v275;
        v274[1] = v275[1];
        uint64_t v276 = v107[13];
        v277 = (void *)((char *)a1 + v276);
        uint64_t v278 = (void *)((char *)a2 + v276);
        void *v277 = *v278;
        v277[1] = v278[1];
        uint64_t v279 = v107[14];
        uint64_t v280 = (char *)a1 + v279;
        uint64_t v281 = (char *)a2 + v279;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v282 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v281, 1, v282))
        {
          uint64_t v283 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v280, v281, *(void *)(*(void *)(v283 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v282 - 8) + 16))(v280, v281, v282);
          __swift_storeEnumTagSinglePayload((uint64_t)v280, 0, 1, v282);
        }
        uint64_t v403 = v107[15];
        uint64_t v404 = (void *)((char *)a1 + v403);
        uint64_t v405 = (void *)((char *)a2 + v403);
        *uint64_t v404 = *v405;
        v404[1] = v405[1];
        *((unsigned char *)a1 + v107[16]) = *((unsigned char *)a2 + v107[16]);
        uint64_t v406 = v107[17];
        uint64_t v407 = (char *)a1 + v406;
        uint64_t v408 = (char *)a2 + v406;
        uint64_t v409 = sub_1E0995F90();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v408, 1, v409))
        {
          uint64_t v410 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE08);
          memcpy(v407, v408, *(void *)(*(void *)(v410 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v409 - 8) + 16))(v407, v408, v409);
          __swift_storeEnumTagSinglePayload((uint64_t)v407, 0, 1, v409);
        }
        *(void *)((char *)a1 + v107[18]) = *(void *)((char *)a2 + v107[18]);
        uint64_t v482 = v107[19];
        uint64_t v483 = (char *)a1 + v482;
        uint64_t v484 = (char *)a2 + v482;
        uint64_t v485 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v484, 1, v485))
        {
          uint64_t v486 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v483, v484, *(void *)(*(void *)(v486 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v484, 1, (uint64_t)__dst))
          {
            uint64_t v515 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v483, v484, *(void *)(*(void *)(v515 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, void *))(*(__dst - 1) + 16))(v483, v484, __dst);
            __swift_storeEnumTagSinglePayload((uint64_t)v483, 0, 1, (uint64_t)__dst);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v483, 0, 1, v485);
        }
        uint64_t v527 = v107[20];
        goto LABEL_245;
      case 7u:
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v14))
        {
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v29 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v14);
        }
        uint64_t v93 = (int *)type metadata accessor for StorePlatformRadioShow();
LABEL_59:
        uint64_t v116 = v93;
        *(void *)((char *)a1 + v93[5]) = *(void *)((char *)a2 + v93[5]);
        *(void *)((char *)a1 + v93[6]) = *(void *)((char *)a2 + v93[6]);
        uint64_t v117 = v93[7];
        uint64_t v118 = (void *)((char *)a1 + v117);
        uint64_t v119 = (void *)((char *)a2 + v117);
        *uint64_t v118 = *v119;
        v118[1] = v119[1];
        uint64_t v120 = v93[8];
        uint64_t v121 = (char *)a1 + v120;
        uint64_t v122 = (char *)a2 + v120;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v122, 1, v123))
        {
          uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v121, v122, *(void *)(*(void *)(v124 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 16))(v121, v122, v123);
          __swift_storeEnumTagSinglePayload((uint64_t)v121, 0, 1, v123);
        }
        uint64_t v125 = v116[9];
        uint64_t v126 = (void *)((char *)a1 + v125);
        uint64_t v127 = (void *)((char *)a2 + v125);
        *uint64_t v126 = *v127;
        v126[1] = v127[1];
        uint64_t v128 = v116[10];
        uint64_t v129 = (void *)((char *)a1 + v128);
        uint64_t v130 = (void *)((char *)a2 + v128);
        *uint64_t v129 = *v130;
        v129[1] = v130[1];
        uint64_t v131 = v116[11];
        uint64_t v132 = (char *)a1 + v131;
        uint64_t v133 = (char *)a2 + v131;
        uint64_t v134 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v133, 1, v134))
        {
          uint64_t v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v132, v133, *(void *)(*(void *)(v135 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v133, 1, v14))
          {
            uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v132, v133, *(void *)(*(void *)(v136 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v132, v133, v14);
            __swift_storeEnumTagSinglePayload((uint64_t)v132, 0, 1, v14);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v132, 0, 1, v134);
        }
        uint64_t v527 = v116[12];
        goto LABEL_245;
      case 8u:
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        __dsta = (void *)v30;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v30))
        {
          uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v31 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(a1, a2, v30);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v30);
        }
        uint64_t v137 = (int *)type metadata accessor for StorePlatformRecordLabel();
        uint64_t v138 = v137[5];
        uint64_t v139 = (char *)a1 + v138;
        uint64_t v140 = (char *)a2 + v138;
        uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v140, 1, v141))
        {
          uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v139, v140, *(void *)(*(void *)(v142 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v141 - 8) + 16))(v139, v140, v141);
          __swift_storeEnumTagSinglePayload((uint64_t)v139, 0, 1, v141);
        }
        *(void *)((char *)a1 + v137[6]) = *(void *)((char *)a2 + v137[6]);
        *(void *)((char *)a1 + v137[7]) = *(void *)((char *)a2 + v137[7]);
        uint64_t v284 = v137[8];
        uint64_t v285 = (void *)((char *)a1 + v284);
        v286 = (void *)((char *)a2 + v284);
        void *v285 = *v286;
        v285[1] = v286[1];
        uint64_t v287 = v137[9];
        uint64_t v288 = (void *)((char *)a1 + v287);
        uint64_t v289 = (void *)((char *)a2 + v287);
        *uint64_t v288 = *v289;
        v288[1] = v289[1];
        uint64_t v290 = v137[10];
        uint64_t v291 = (char *)a1 + v290;
        uint64_t v292 = (char *)a2 + v290;
        uint64_t v293 = type metadata accessor for StorePlatformUber();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v292, 1, v293))
        {
          uint64_t v294 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v291, v292, *(void *)(*(void *)(v294 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v292, 1, (uint64_t)__dsta))
          {
            uint64_t v411 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v291, v292, *(void *)(*(void *)(v411 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, void *))(*(__dsta - 1) + 16))(v291, v292, __dsta);
            __swift_storeEnumTagSinglePayload((uint64_t)v291, 0, 1, (uint64_t)__dsta);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v291, 0, 1, v293);
        }
        uint64_t v527 = v137[11];
        goto LABEL_245;
      case 9u:
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v32))
        {
          uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(a1, a2, v32);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v32);
        }
        uint64_t v143 = (int *)type metadata accessor for StorePlatformSocialProfile();
        uint64_t v144 = v143[5];
        uint64_t v145 = (void *)((char *)a1 + v144);
        uint64_t v146 = (void *)((char *)a2 + v144);
        *uint64_t v145 = *v146;
        v145[1] = v146[1];
        uint64_t v147 = v143[6];
        uint64_t v148 = (void *)((char *)a1 + v147);
        uint64_t v149 = (void *)((char *)a2 + v147);
        *uint64_t v148 = *v149;
        v148[1] = v149[1];
        *((unsigned char *)a1 + v143[7]) = *((unsigned char *)a2 + v143[7]);
        *((unsigned char *)a1 + v143[8]) = *((unsigned char *)a2 + v143[8]);
        uint64_t v150 = v143[9];
        uint64_t v151 = (void *)((char *)a1 + v150);
        uint64_t v152 = (void *)((char *)a2 + v150);
        void *v151 = *v152;
        v151[1] = v152[1];
        uint64_t v153 = v143[10];
        uint64_t v154 = (char *)a1 + v153;
        BOOL v155 = (char *)a2 + v153;
        uint64_t v156 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v155, 1, v156))
        {
          uint64_t v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v154, v155, *(void *)(*(void *)(v157 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v156 - 8) + 16))(v154, v155, v156);
          __swift_storeEnumTagSinglePayload((uint64_t)v154, 0, 1, v156);
        }
        uint64_t v295 = v143[11];
        uint64_t v296 = (char *)a1 + v295;
        uint64_t v297 = (char *)a2 + v295;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v295, 1, v156)) {
          goto LABEL_252;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v156 - 8) + 16))(v296, v297, v156);
        uint64_t v298 = (uint64_t)v296;
        uint64_t v299 = v156;
        goto LABEL_254;
      case 0xAu:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v34 = (int *)type metadata accessor for StorePlatformSong();
        uint64_t v35 = v34[6];
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        uint64_t v8 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v37, 1, v8))
        {
          uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v36, v37, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v8);
        }
        uint64_t v158 = v34[7];
        uint64_t v159 = (char *)a1 + v158;
        uint64_t v160 = (char *)a2 + v158;
        uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v160, 1, v161))
        {
          uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v159, v160, *(void *)(*(void *)(v162 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v161 - 8) + 16))(v159, v160, v161);
          __swift_storeEnumTagSinglePayload((uint64_t)v159, 0, 1, v161);
        }
        *(void *)((char *)a1 + v34[8]) = *(void *)((char *)a2 + v34[8]);
        uint64_t v300 = v34[9];
        uint64_t v301 = (void *)((char *)a1 + v300);
        uint64_t v302 = (void *)((char *)a2 + v300);
        *uint64_t v301 = *v302;
        v301[1] = v302[1];
        uint64_t v303 = v34[10];
        uint64_t v304 = (void *)((char *)a1 + v303);
        uint64_t v305 = (void *)((char *)a2 + v303);
        void *v304 = *v305;
        v304[1] = v305[1];
        uint64_t v306 = v34[11];
        uint64_t v307 = (void *)((char *)a1 + v306);
        uint64_t v308 = (void *)((char *)a2 + v306);
        uint64_t v309 = type metadata accessor for StorePlatformComposer();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v308, 1, v309))
        {
          uint64_t v310 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6448);
          memcpy(v307, v308, *(void *)(*(void *)(v310 - 8) + 64));
        }
        else
        {
          void *v307 = *v308;
          v307[1] = v308[1];
          uint64_t v412 = *(int *)(v309 + 20);
          uint64_t v413 = (char *)v307 + v412;
          uint64_t v414 = (char *)v308 + v412;
          swift_bridgeObjectRetain();
          if (__swift_getEnumTagSinglePayload((uint64_t)v414, 1, v8))
          {
            uint64_t v415 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
            memcpy(v413, v414, *(void *)(*(void *)(v415 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v413, v414, v8);
            __swift_storeEnumTagSinglePayload((uint64_t)v413, 0, 1, v8);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v307, 0, 1, v309);
        }
        *(void *)((char *)a1 + v34[12]) = *(void *)((char *)a2 + v34[12]);
        uint64_t v528 = v34[13];
        uint64_t v529 = (void *)((char *)a1 + v528);
        uint64_t v530 = (void *)((char *)a2 + v528);
        *uint64_t v529 = *v530;
        v529[1] = v530[1];
        uint64_t v531 = v34[14];
        uint64_t v532 = (char *)a1 + v531;
        uint64_t v533 = (char *)a2 + v531;
        uint64_t v534 = *(void *)v533;
        v532[8] = v533[8];
        *(void *)uint64_t v532 = v534;
        *(void *)((char *)a1 + v34[15]) = *(void *)((char *)a2 + v34[15]);
        *(void *)((char *)a1 + v34[16]) = *(void *)((char *)a2 + v34[16]);
        *(void *)((char *)a1 + v34[17]) = *(void *)((char *)a2 + v34[17]);
        *(void *)((char *)a1 + v34[18]) = *(void *)((char *)a2 + v34[18]);
        *((unsigned char *)a1 + v34[19]) = *((unsigned char *)a2 + v34[19]);
        *((unsigned char *)a1 + v34[20]) = *((unsigned char *)a2 + v34[20]);
        uint64_t v535 = v34[21];
        uint64_t v536 = (void *)((char *)a1 + v535);
        uint64_t v537 = (void *)((char *)a2 + v535);
        *uint64_t v536 = *v537;
        v536[1] = v537[1];
        *((unsigned char *)a1 + v34[22]) = *((unsigned char *)a2 + v34[22]);
        *((unsigned char *)a1 + v34[23]) = *((unsigned char *)a2 + v34[23]);
        uint64_t v538 = v34[24];
        uint64_t v539 = (void *)((char *)a1 + v538);
        uint64_t v540 = (void *)((char *)a2 + v538);
        void *v539 = *v540;
        v539[1] = v540[1];
        *(void *)((char *)a1 + v34[25]) = *(void *)((char *)a2 + v34[25]);
        uint64_t v541 = v34[26];
        uint64_t v542 = (void *)((char *)a1 + v541);
        uint64_t v543 = (void *)((char *)a2 + v541);
        void *v542 = *v543;
        v542[1] = v543[1];
        uint64_t v544 = v34[27];
        uint64_t v565 = (char *)a1 + v544;
        uint64_t v561 = (char *)a2 + v544;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v561, 1, v8))
        {
          uint64_t v545 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v565, v561, *(void *)(*(void *)(v545 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v565, v561, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v565, 0, 1, v8);
        }
        *((unsigned char *)a1 + v34[28]) = *((unsigned char *)a2 + v34[28]);
        uint64_t v546 = v34[29];
        uint64_t v547 = (char *)a1 + v546;
        uint64_t v548 = (char *)a2 + v546;
        uint64_t v549 = *(void *)v548;
        v547[8] = v548[8];
        *(void *)uint64_t v547 = v549;
        uint64_t v550 = v34[30];
        uint64_t v551 = (char *)a1 + v550;
        uint64_t v552 = (char *)a2 + v550;
        uint64_t v553 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v552, 1, v553))
        {
          uint64_t v554 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v551, v552, *(void *)(*(void *)(v554 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v552, 1, v161))
          {
            uint64_t v555 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v551, v552, *(void *)(*(void *)(v555 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v161 - 8) + 16))(v551, v552, v161);
            __swift_storeEnumTagSinglePayload((uint64_t)v551, 0, 1, v161);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v551, 0, 1, v553);
        }
        uint64_t v557 = v34[31];
        goto LABEL_251;
      case 0xBu:
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0170);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v39))
        {
          uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE40);
          memcpy(a1, a2, *(void *)(*(void *)(v40 - 8) + 64));
        }
        else
        {
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v39 - 8) + 16))(a1, a2, v39);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v39);
        }
        uint64_t v163 = (int *)type metadata accessor for StorePlatformStation();
        uint64_t v164 = v163[5];
        uint64_t v165 = (char *)a1 + v164;
        uint64_t v166 = (char *)a2 + v164;
        uint64_t v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v166, 1, v167))
        {
          uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v165, v166, *(void *)(*(void *)(v168 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v167 - 8) + 16))(v165, v166, v167);
          __swift_storeEnumTagSinglePayload((uint64_t)v165, 0, 1, v167);
        }
        *(void *)((char *)a1 + v163[6]) = *(void *)((char *)a2 + v163[6]);
        uint64_t v311 = v163[7];
        uint64_t v312 = (char *)a1 + v311;
        uint64_t v313 = (char *)a2 + v311;
        uint64_t v314 = sub_1E0995890();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v313, 1, v314))
        {
          uint64_t v315 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE38);
          memcpy(v312, v313, *(void *)(*(void *)(v315 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v314 - 8) + 16))(v312, v313, v314);
          __swift_storeEnumTagSinglePayload((uint64_t)v312, 0, 1, v314);
        }
        *(void *)((char *)a1 + v163[8]) = *(void *)((char *)a2 + v163[8]);
        *(void *)((char *)a1 + v163[9]) = *(void *)((char *)a2 + v163[9]);
        uint64_t v416 = v163[10];
        uint64_t v417 = (void *)((char *)a1 + v416);
        uint64_t v418 = (void *)((char *)a2 + v416);
        void *v417 = *v418;
        v417[1] = v418[1];
        *((unsigned char *)a1 + v163[11]) = *((unsigned char *)a2 + v163[11]);
        uint64_t v419 = v163[12];
        uint64_t v420 = (char *)a1 + v419;
        uint64_t v421 = (char *)a2 + v419;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v422 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v421, 1, v422))
        {
          uint64_t v423 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v420, v421, *(void *)(*(void *)(v423 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v422 - 8) + 16))(v420, v421, v422);
          __swift_storeEnumTagSinglePayload((uint64_t)v420, 0, 1, v422);
        }
        uint64_t v487 = v163[13];
        uint64_t v488 = (void *)((char *)a1 + v487);
        uint64_t v489 = (void *)((char *)a2 + v487);
        *uint64_t v488 = *v489;
        v488[1] = v489[1];
        uint64_t v490 = v163[14];
        uint64_t v491 = (char *)a1 + v490;
        uint64_t v492 = (char *)a2 + v490;
        uint64_t v493 = *(void *)v492;
        v491[8] = v492[8];
        *(void *)uint64_t v491 = v493;
        uint64_t v494 = v163[15];
        uint64_t v495 = (char *)a1 + v494;
        uint64_t v496 = (char *)a2 + v494;
        uint64_t v497 = sub_1E0995740();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v496, 1, v497))
        {
          uint64_t v498 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE30);
          memcpy(v495, v496, *(void *)(*(void *)(v498 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v497 - 8) + 16))(v495, v496, v497);
          __swift_storeEnumTagSinglePayload((uint64_t)v495, 0, 1, v497);
        }
        uint64_t v516 = v163[16];
        uint64_t v517 = (char *)a1 + v516;
        uint64_t v518 = (char *)a2 + v516;
        uint64_t v519 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v518, 1, v519))
        {
          uint64_t v520 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v517, v518, *(void *)(*(void *)(v520 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v518, 1, v167))
          {
            uint64_t v526 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v517, v518, *(void *)(*(void *)(v526 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v167 - 8) + 16))(v517, v518, v167);
            __swift_storeEnumTagSinglePayload((uint64_t)v517, 0, 1, v167);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v517, 0, 1, v519);
        }
        uint64_t v527 = v163[17];
LABEL_245:
        uint64_t v296 = (char *)a1 + v527;
        uint64_t v297 = (char *)a2 + v527;
        uint64_t v513 = sub_1E0992360();
        uint64_t v512 = (uint64_t)v297;
LABEL_246:
        if (__swift_getEnumTagSinglePayload(v512, 1, v513)) {
          goto LABEL_252;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v513 - 8) + 16))(v296, v297, v513);
        uint64_t v298 = (uint64_t)v296;
        uint64_t v299 = v513;
        goto LABEL_254;
      case 0xCu:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        uint64_t v41 = (int *)type metadata accessor for StorePlatformTVEpisode();
        uint64_t v42 = v41[8];
        uint64_t v43 = (char *)a1 + v42;
        uint64_t v44 = (char *)a2 + v42;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v45))
        {
          uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v43, v44, *(void *)(*(void *)(v46 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 16))(v43, v44, v45);
          __swift_storeEnumTagSinglePayload((uint64_t)v43, 0, 1, v45);
        }
        *(void *)((char *)a1 + v41[9]) = *(void *)((char *)a2 + v41[9]);
        *(void *)((char *)a1 + v41[10]) = *(void *)((char *)a2 + v41[10]);
        uint64_t v169 = v41[11];
        uint64_t v170 = (char *)a1 + v169;
        uint64_t v171 = (char *)a2 + v169;
        uint64_t v172 = *(void *)v171;
        v170[8] = v171[8];
        *(void *)uint64_t v170 = v172;
        uint64_t v173 = v41[12];
        uint64_t v174 = (char *)a1 + v173;
        uint64_t v175 = (char *)a2 + v173;
        uint64_t v176 = *(void *)v175;
        v174[8] = v175[8];
        *(void *)uint64_t v174 = v176;
        uint64_t v177 = v41[13];
        uint64_t v178 = (char *)a1 + v177;
        uint64_t v179 = (char *)a2 + v177;
        uint64_t v180 = *(void *)v179;
        v178[8] = v179[8];
        *(void *)uint64_t v178 = v180;
        *(void *)((char *)a1 + v41[14]) = *(void *)((char *)a2 + v41[14]);
        *(void *)((char *)a1 + v41[15]) = *(void *)((char *)a2 + v41[15]);
        *((unsigned char *)a1 + v41[16]) = *((unsigned char *)a2 + v41[16]);
        uint64_t v181 = v41[17];
        uint64_t v182 = (void *)((char *)a1 + v181);
        uint64_t v183 = (void *)((char *)a2 + v181);
        *uint64_t v182 = *v183;
        v182[1] = v183[1];
        uint64_t v184 = v41[18];
        __dstb = (char *)a1 + v184;
        uint64_t v185 = (char *)a2 + v184;
        uint64_t v186 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v185, 1, v186))
        {
          uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstb, v185, *(void *)(*(void *)(v187 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v186 - 8) + 16))(__dstb, v185, v186);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstb, 0, 1, v186);
        }
        *((unsigned char *)a1 + v41[19]) = *((unsigned char *)a2 + v41[19]);
        uint64_t v316 = v41[20];
        uint64_t v317 = (void *)((char *)a1 + v316);
        uint64_t v318 = (void *)((char *)a2 + v316);
        *uint64_t v317 = *v318;
        v317[1] = v318[1];
        *(void *)((char *)a1 + v41[21]) = *(void *)((char *)a2 + v41[21]);
        uint64_t v319 = v41[22];
        uint64_t v320 = (char *)a1 + v319;
        uint64_t v321 = (char *)a2 + v319;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v322 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v321, 1, v322))
        {
          uint64_t v323 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v320, v321, *(void *)(*(void *)(v323 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v322 - 8) + 16))(v320, v321, v322);
          __swift_storeEnumTagSinglePayload((uint64_t)v320, 0, 1, v322);
        }
        uint64_t v424 = v41[23];
        uint64_t v425 = (void *)((char *)a1 + v424);
        uint64_t v426 = (void *)((char *)a2 + v424);
        *uint64_t v425 = *v426;
        v425[1] = v426[1];
        uint64_t v427 = v41[24];
        v428 = (char *)a1 + v427;
        uint64_t v429 = (char *)a2 + v427;
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v429, 1, v322))
        {
          uint64_t v430 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v428, v429, *(void *)(*(void *)(v430 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v322 - 8) + 16))(v428, v429, v322);
          __swift_storeEnumTagSinglePayload((uint64_t)v428, 0, 1, v322);
        }
        *((unsigned char *)a1 + v41[25]) = *((unsigned char *)a2 + v41[25]);
        uint64_t v499 = v41[26];
        uint64_t v500 = (char *)a1 + v499;
        uint64_t v501 = (char *)a2 + v499;
        uint64_t v502 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
        if (__swift_getEnumTagSinglePayload((uint64_t)v501, 1, v502))
        {
          uint64_t v503 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
          memcpy(v500, v501, *(void *)(*(void *)(v503 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v502 - 8) + 16))(v500, v501, v502);
          __swift_storeEnumTagSinglePayload((uint64_t)v500, 0, 1, v502);
        }
        uint64_t v521 = v41[27];
        uint64_t v522 = (char *)a1 + v521;
        uint64_t v523 = (char *)a2 + v521;
        uint64_t v524 = *(void *)v523;
        v522[8] = v523[8];
        *(void *)uint64_t v522 = v524;
        *((unsigned char *)a1 + v41[28]) = *((unsigned char *)a2 + v41[28]);
        uint64_t v525 = v41[29];
        uint64_t v296 = (char *)a1 + v525;
        uint64_t v297 = (char *)a2 + v525;
        goto LABEL_207;
      case 0xDu:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v47 = (int *)type metadata accessor for StorePlatformTVSeason();
        uint64_t v48 = v47[5];
        uint64_t v49 = (char *)a1 + v48;
        uint64_t v50 = (char *)a2 + v48;
        swift_bridgeObjectRetain();
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v50, 1, v51))
        {
          uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v49, v50, *(void *)(*(void *)(v52 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
          __swift_storeEnumTagSinglePayload((uint64_t)v49, 0, 1, v51);
        }
        *(void *)((char *)a1 + v47[6]) = *(void *)((char *)a2 + v47[6]);
        *(void *)((char *)a1 + v47[7]) = *(void *)((char *)a2 + v47[7]);
        *(void *)((char *)a1 + v47[8]) = *(void *)((char *)a2 + v47[8]);
        uint64_t v188 = v47[9];
        uint64_t v189 = (void *)((char *)a1 + v188);
        uint64_t v190 = (void *)((char *)a2 + v188);
        *uint64_t v189 = *v190;
        v189[1] = v190[1];
        *(void *)((char *)a1 + v47[10]) = *(void *)((char *)a2 + v47[10]);
        *(void *)((char *)a1 + v47[11]) = *(void *)((char *)a2 + v47[11]);
        *(void *)((char *)a1 + v47[12]) = *(void *)((char *)a2 + v47[12]);
        *(void *)((char *)a1 + v47[13]) = *(void *)((char *)a2 + v47[13]);
        uint64_t v191 = v47[14];
        uint64_t v192 = (void *)((char *)a1 + v191);
        uint64_t v193 = (void *)((char *)a2 + v191);
        void *v192 = *v193;
        v192[1] = v193[1];
        uint64_t v194 = v47[15];
        uint64_t v195 = (void *)((char *)a1 + v194);
        uint64_t v196 = (void *)((char *)a2 + v194);
        *uint64_t v195 = *v196;
        v195[1] = v196[1];
        uint64_t v197 = v47[16];
        uint64_t v198 = (void *)((char *)a1 + v197);
        v199 = (void *)((char *)a2 + v197);
        *uint64_t v198 = *v199;
        v198[1] = v199[1];
        uint64_t v200 = v47[17];
        uint64_t v201 = (char *)a1 + v200;
        uint64_t v202 = (char *)a2 + v200;
        uint64_t v203 = *(void *)v202;
        v201[8] = v202[8];
        *(void *)uint64_t v201 = v203;
        uint64_t v204 = v47[18];
        __dstc = (char *)a1 + v204;
        v205 = (char *)a2 + v204;
        uint64_t v206 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v205, 1, v206))
        {
          uint64_t v207 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstc, v205, *(void *)(*(void *)(v207 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v206 - 8) + 16))(__dstc, v205, v206);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstc, 0, 1, v206);
        }
        goto LABEL_255;
      case 0xEu:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v53 = (int *)type metadata accessor for StorePlatformTVShow();
        uint64_t v54 = v53[5];
        uint64_t v55 = (char *)a1 + v54;
        uint64_t v56 = (char *)a2 + v54;
        swift_bridgeObjectRetain();
        uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v56, 1, v57))
        {
          uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v55, v56, *(void *)(*(void *)(v58 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v57 - 8) + 16))(v55, v56, v57);
          __swift_storeEnumTagSinglePayload((uint64_t)v55, 0, 1, v57);
        }
        uint64_t v208 = v53[6];
        uint64_t v209 = (void *)((char *)a1 + v208);
        uint64_t v210 = (void *)((char *)a2 + v208);
        *uint64_t v209 = *v210;
        v209[1] = v210[1];
        *(void *)((char *)a1 + v53[7]) = *(void *)((char *)a2 + v53[7]);
        *(void *)((char *)a1 + v53[8]) = *(void *)((char *)a2 + v53[8]);
        *(void *)((char *)a1 + v53[9]) = *(void *)((char *)a2 + v53[9]);
        *(void *)((char *)a1 + v53[10]) = *(void *)((char *)a2 + v53[10]);
        *(void *)((char *)a1 + v53[11]) = *(void *)((char *)a2 + v53[11]);
        *(void *)((char *)a1 + v53[12]) = *(void *)((char *)a2 + v53[12]);
        uint64_t v211 = v53[13];
        uint64_t v212 = (char *)a1 + v211;
        v213 = (char *)a2 + v211;
        uint64_t v214 = *(void *)v213;
        v212[8] = v213[8];
        *(void *)uint64_t v212 = v214;
        *(void *)((char *)a1 + v53[14]) = *(void *)((char *)a2 + v53[14]);
        *(void *)((char *)a1 + v53[15]) = *(void *)((char *)a2 + v53[15]);
        *((unsigned char *)a1 + v53[16]) = *((unsigned char *)a2 + v53[16]);
        uint64_t v215 = v53[17];
        __dstd = (char *)a1 + v215;
        uint64_t v216 = (char *)a2 + v215;
        uint64_t v560 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v186 = v560;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v216, 1, v560))
        {
          uint64_t v217 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstd, v216, *(void *)(*(void *)(v217 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v560 - 8) + 16))(__dstd, v216, v560);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstd, 0, 1, v560);
        }
        uint64_t v324 = v53[18];
        uint64_t v325 = (char *)a1 + v324;
        v326 = (char *)a2 + v324;
        uint64_t v327 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v326, 1, v327))
        {
          uint64_t v328 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v325, v326, *(void *)(*(void *)(v328 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v327 - 8) + 16))(v325, v326, v327);
          __swift_storeEnumTagSinglePayload((uint64_t)v325, 0, 1, v327);
        }
        *(void *)((char *)a1 + v53[19]) = *(void *)((char *)a2 + v53[19]);
        uint64_t v431 = v53[20];
        v432 = (void *)((char *)a1 + v431);
        uint64_t v433 = (void *)((char *)a2 + v431);
        void *v432 = *v433;
        v432[1] = v433[1];
        uint64_t v434 = v53[21];
        uint64_t v435 = (void *)((char *)a1 + v434);
        v436 = (void *)((char *)a2 + v434);
        *uint64_t v435 = *v436;
        v435[1] = v436[1];
        uint64_t v437 = v53[22];
        uint64_t v296 = (char *)a1 + v437;
        uint64_t v297 = (char *)a2 + v437;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_207:
        if (__swift_getEnumTagSinglePayload((uint64_t)v297, 1, v186)) {
          goto LABEL_252;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v186 - 8) + 16))(v296, v297, v186);
        uint64_t v298 = (uint64_t)v296;
        uint64_t v299 = v186;
        goto LABEL_254;
      case 0xFu:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v59 = (int *)type metadata accessor for StorePlatformUploadedAudio();
        uint64_t v60 = v59[5];
        uint64_t v61 = (char *)a1 + v60;
        uint64_t v62 = (char *)a2 + v60;
        swift_bridgeObjectRetain();
        uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v62, 1, v63))
        {
          uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v61, v62, *(void *)(*(void *)(v64 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v63 - 8) + 16))(v61, v62, v63);
          __swift_storeEnumTagSinglePayload((uint64_t)v61, 0, 1, v63);
        }
        uint64_t v218 = v59[6];
        uint64_t v219 = (char *)a1 + v218;
        uint64_t v220 = (char *)a2 + v218;
        uint64_t v221 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
        if (__swift_getEnumTagSinglePayload((uint64_t)v220, 1, v221))
        {
          uint64_t v222 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
          memcpy(v219, v220, *(void *)(*(void *)(v222 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v221 - 8) + 16))(v219, v220, v221);
          __swift_storeEnumTagSinglePayload((uint64_t)v219, 0, 1, v221);
        }
        uint64_t v329 = v59[7];
        v330 = (void *)((char *)a1 + v329);
        uint64_t v331 = (void *)((char *)a2 + v329);
        void *v330 = *v331;
        v330[1] = v331[1];
        uint64_t v332 = v59[8];
        uint64_t v333 = (char *)a1 + v332;
        uint64_t v334 = (char *)a2 + v332;
        uint64_t v335 = *(void *)v334;
        v333[8] = v334[8];
        *(void *)uint64_t v333 = v335;
        *(void *)((char *)a1 + v59[9]) = *(void *)((char *)a2 + v59[9]);
        *(void *)((char *)a1 + v59[10]) = *(void *)((char *)a2 + v59[10]);
        *(void *)((char *)a1 + v59[11]) = *(void *)((char *)a2 + v59[11]);
        uint64_t v336 = v59[12];
        uint64_t v337 = (void *)((char *)a1 + v336);
        uint64_t v338 = (void *)((char *)a2 + v336);
        *uint64_t v337 = *v338;
        v337[1] = v338[1];
        *((unsigned char *)a1 + v59[13]) = *((unsigned char *)a2 + v59[13]);
        uint64_t v339 = v59[14];
        uint64_t v340 = (void *)((char *)a1 + v339);
        uint64_t v341 = (void *)((char *)a2 + v339);
        *uint64_t v340 = *v341;
        v340[1] = v341[1];
        uint64_t v342 = v59[15];
        uint64_t v343 = (void *)((char *)a1 + v342);
        uint64_t v344 = (void *)((char *)a2 + v342);
        void *v343 = *v344;
        v343[1] = v344[1];
        uint64_t v345 = v59[16];
        __dstf = (char *)a1 + v345;
        uint64_t v346 = (char *)a2 + v345;
        uint64_t v347 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v346, 1, v347))
        {
          uint64_t v348 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstf, v346, *(void *)(*(void *)(v348 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v347 - 8) + 16))(__dstf, v346, v347);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstf, 0, 1, v347);
        }
        goto LABEL_193;
      case 0x10u:
        *a1 = *a2;
        a1[1] = a2[1];
        uint64_t v59 = (int *)type metadata accessor for StorePlatformUploadedVideo();
        uint64_t v65 = v59[5];
        uint64_t v66 = (char *)a1 + v65;
        uint64_t v67 = (char *)a2 + v65;
        swift_bridgeObjectRetain();
        uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v67, 1, v68))
        {
          uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v66, v67, *(void *)(*(void *)(v69 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v68 - 8) + 16))(v66, v67, v68);
          __swift_storeEnumTagSinglePayload((uint64_t)v66, 0, 1, v68);
        }
        uint64_t v223 = v59[6];
        uint64_t v224 = (char *)a1 + v223;
        v225 = (char *)a2 + v223;
        uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
        if (__swift_getEnumTagSinglePayload((uint64_t)v225, 1, v226))
        {
          uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
          memcpy(v224, v225, *(void *)(*(void *)(v227 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v226 - 8) + 16))(v224, v225, v226);
          __swift_storeEnumTagSinglePayload((uint64_t)v224, 0, 1, v226);
        }
        uint64_t v349 = v59[7];
        uint64_t v350 = (void *)((char *)a1 + v349);
        uint64_t v351 = (void *)((char *)a2 + v349);
        *uint64_t v350 = *v351;
        v350[1] = v351[1];
        *(void *)((char *)a1 + v59[8]) = *(void *)((char *)a2 + v59[8]);
        *(void *)((char *)a1 + v59[9]) = *(void *)((char *)a2 + v59[9]);
        *(void *)((char *)a1 + v59[10]) = *(void *)((char *)a2 + v59[10]);
        uint64_t v352 = v59[11];
        uint64_t v353 = (void *)((char *)a1 + v352);
        uint64_t v354 = (void *)((char *)a2 + v352);
        *uint64_t v353 = *v354;
        v353[1] = v354[1];
        uint64_t v355 = v59[12];
        __dstg = (char *)a1 + v355;
        uint64_t v356 = (char *)a2 + v355;
        uint64_t v357 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v356, 1, v357))
        {
          uint64_t v358 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(__dstg, v356, *(void *)(*(void *)(v358 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v357 - 8) + 16))(__dstg, v356, v357);
          __swift_storeEnumTagSinglePayload((uint64_t)__dstg, 0, 1, v357);
        }
        *((unsigned char *)a1 + v59[13]) = *((unsigned char *)a2 + v59[13]);
        uint64_t v438 = v59[14];
        uint64_t v439 = (void *)((char *)a1 + v438);
        v440 = (void *)((char *)a2 + v438);
        *uint64_t v439 = *v440;
        v439[1] = v440[1];
        uint64_t v441 = v59[15];
        uint64_t v442 = (void *)((char *)a1 + v441);
        uint64_t v443 = (void *)((char *)a2 + v441);
        *uint64_t v442 = *v443;
        v442[1] = v443[1];
        uint64_t v444 = v59[16];
        v445 = (char *)a1 + v444;
        uint64_t v446 = (char *)a2 + v444;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v446, 1, v357))
        {
          uint64_t v447 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v445, v446, *(void *)(*(void *)(v447 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v357 - 8) + 16))(v445, v446, v357);
          __swift_storeEnumTagSinglePayload((uint64_t)v445, 0, 1, v357);
        }
LABEL_193:
        *((unsigned char *)a1 + v59[17]) = *((unsigned char *)a2 + v59[17]);
        uint64_t v504 = v59[18];
        uint64_t v505 = (void *)((char *)a1 + v504);
        v506 = (void *)((char *)a2 + v504);
        void *v505 = *v506;
        v505[1] = v506[1];
        uint64_t v507 = v59[19];
        uint64_t v508 = (void *)((char *)a1 + v507);
        uint64_t v509 = (void *)((char *)a2 + v507);
        *uint64_t v508 = *v509;
        v508[1] = v509[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_255;
      default:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        uint64_t v4 = (int *)type metadata accessor for StorePlatformAlbum();
        uint64_t v5 = v4[6];
        uint64_t v6 = (char *)a1 + v5;
        uint64_t v7 = (char *)a2 + v5;
        uint64_t v8 = sub_1E0992360();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
        {
          uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
        }
        uint64_t v70 = v4[7];
        uint64_t v71 = (char *)a1 + v70;
        uint64_t v72 = (char *)a2 + v70;
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v72, 1, v73))
        {
          uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v71, v72, *(void *)(*(void *)(v74 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16))(v71, v72, v73);
          __swift_storeEnumTagSinglePayload((uint64_t)v71, 0, 1, v73);
        }
        *(void *)((char *)a1 + v4[8]) = *(void *)((char *)a2 + v4[8]);
        *(void *)((char *)a1 + v4[9]) = *(void *)((char *)a2 + v4[9]);
        *(void *)((char *)a1 + v4[10]) = *(void *)((char *)a2 + v4[10]);
        *(void *)((char *)a1 + v4[11]) = *(void *)((char *)a2 + v4[11]);
        uint64_t v228 = v4[12];
        v229 = (void *)((char *)a1 + v228);
        uint64_t v230 = (void *)((char *)a2 + v228);
        void *v229 = *v230;
        v229[1] = v230[1];
        *(void *)((char *)a1 + v4[13]) = *(void *)((char *)a2 + v4[13]);
        *(void *)((char *)a1 + v4[14]) = *(void *)((char *)a2 + v4[14]);
        *(void *)((char *)a1 + v4[15]) = *(void *)((char *)a2 + v4[15]);
        *(void *)((char *)a1 + v4[16]) = *(void *)((char *)a2 + v4[16]);
        *((unsigned char *)a1 + v4[17]) = *((unsigned char *)a2 + v4[17]);
        *((unsigned char *)a1 + v4[18]) = *((unsigned char *)a2 + v4[18]);
        *((unsigned char *)a1 + v4[19]) = *((unsigned char *)a2 + v4[19]);
        uint64_t v231 = v4[20];
        uint64_t v562 = (char *)a1 + v231;
        uint64_t v232 = (char *)a2 + v231;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v232, 1, v233))
        {
          uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v562, v232, *(void *)(*(void *)(v234 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v233 - 8) + 16))(v562, v232, v233);
          __swift_storeEnumTagSinglePayload((uint64_t)v562, 0, 1, v233);
        }
        uint64_t v359 = v4[21];
        uint64_t v360 = (void *)((char *)a1 + v359);
        uint64_t v361 = (void *)((char *)a2 + v359);
        void *v360 = *v361;
        v360[1] = v361[1];
        uint64_t v362 = v4[22];
        v363 = (void *)((char *)a1 + v362);
        uint64_t v364 = (void *)((char *)a2 + v362);
        void *v363 = *v364;
        v363[1] = v364[1];
        *(void *)((char *)a1 + v4[23]) = *(void *)((char *)a2 + v4[23]);
        uint64_t v365 = v4[24];
        uint64_t v366 = (void *)((char *)a1 + v365);
        v367 = (void *)((char *)a2 + v365);
        *uint64_t v366 = *v367;
        v366[1] = v367[1];
        uint64_t v368 = v4[25];
        uint64_t v369 = (char *)a1 + v368;
        uint64_t v370 = (char *)a2 + v368;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v370, 1, v8))
        {
          uint64_t v371 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v369, v370, *(void *)(*(void *)(v371 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v369, v370, v8);
          __swift_storeEnumTagSinglePayload((uint64_t)v369, 0, 1, v8);
        }
        uint64_t v448 = v4[26];
        v449 = (char *)a1 + v448;
        v450 = (char *)a2 + v448;
        uint64_t v451 = *(void *)v450;
        v449[8] = v450[8];
        *(void *)v449 = v451;
        uint64_t v452 = v4[27];
        v453 = (char *)a1 + v452;
        v454 = (char *)a2 + v452;
        uint64_t v455 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v454, 1, v455))
        {
          uint64_t v456 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v453, v454, *(void *)(*(void *)(v456 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v454, 1, v73))
          {
            uint64_t v510 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v453, v454, *(void *)(*(void *)(v510 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v73 - 8) + 16))(v453, v454, v73);
            __swift_storeEnumTagSinglePayload((uint64_t)v453, 0, 1, v73);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v453, 0, 1, v455);
        }
        uint64_t v557 = v4[28];
LABEL_251:
        uint64_t v296 = (char *)a1 + v557;
        uint64_t v297 = (char *)a2 + v557;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v557, 1, v8))
        {
LABEL_252:
          uint64_t v558 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v296, v297, *(void *)(*(void *)(v558 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v296, v297, v8);
          uint64_t v298 = (uint64_t)v296;
          uint64_t v299 = v8;
LABEL_254:
          __swift_storeEnumTagSinglePayload(v298, 0, 1, v299);
        }
LABEL_255:
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
  return a1;
}

uint64_t sub_1E09897C8(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_14();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

_OWORD *sub_1E0989820(_OWORD *a1, _OWORD *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
      }
      uint64_t v78 = (int *)type metadata accessor for StorePlatformArtist();
      *(void *)((char *)a1 + v78[5]) = *(void *)((char *)a2 + v78[5]);
      *(void *)((char *)a1 + v78[6]) = *(void *)((char *)a2 + v78[6]);
      *(void *)((char *)a1 + v78[7]) = *(void *)((char *)a2 + v78[7]);
      *(void *)((char *)a1 + v78[8]) = *(void *)((char *)a2 + v78[8]);
      *(_OWORD *)((char *)a1 + v78[9]) = *(_OWORD *)((char *)a2 + v78[9]);
      uint64_t v79 = v78[10];
      uint64_t v80 = (char *)a1 + v79;
      uint64_t v81 = (char *)a2 + v79;
      uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v81, 1, v82))
      {
        uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v80, v81, *(void *)(*(void *)(v83 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 32))(v80, v81, v82);
        __swift_storeEnumTagSinglePayload((uint64_t)v80, 0, 1, v82);
      }
      *(_OWORD *)((char *)a1 + v78[11]) = *(_OWORD *)((char *)a2 + v78[11]);
      *(_OWORD *)((char *)a1 + v78[12]) = *(_OWORD *)((char *)a2 + v78[12]);
      uint64_t v181 = v78[13];
      uint64_t v182 = (char *)a1 + v181;
      uint64_t v183 = (char *)a2 + v181;
      uint64_t v184 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v183, 1, v184))
      {
        uint64_t v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v182, v183, *(void *)(*(void *)(v185 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(v182, v183, v184);
        __swift_storeEnumTagSinglePayload((uint64_t)v182, 0, 1, v184);
      }
      uint64_t v253 = v78[14];
      uint64_t v254 = (char *)a1 + v253;
      uint64_t v255 = (char *)a2 + v253;
      uint64_t v256 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v255, 1, v256))
      {
        uint64_t v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v254, v255, *(void *)(*(void *)(v257 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v255, 1, v11))
        {
          uint64_t v305 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v254, v255, *(void *)(*(void *)(v305 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v254, v255, v11);
          __swift_storeEnumTagSinglePayload((uint64_t)v254, 0, 1, v11);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v254, 0, 1, v256);
      }
      uint64_t v367 = v78[15];
      uint64_t v349 = (char *)a1 + v367;
      uint64_t v211 = (char *)a2 + v367;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v367, 1, v184)) {
        goto LABEL_228;
      }
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(v349, v211, v184);
      uint64_t v212 = (uint64_t)v349;
      uint64_t v213 = v184;
      goto LABEL_248;
    case 2u:
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v13))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v13);
      }
      uint64_t v84 = (int *)type metadata accessor for StorePlatformCurator();
      *(void *)((char *)a1 + v84[5]) = *(void *)((char *)a2 + v84[5]);
      *(void *)((char *)a1 + v84[6]) = *(void *)((char *)a2 + v84[6]);
      *(_OWORD *)((char *)a1 + v84[7]) = *(_OWORD *)((char *)a2 + v84[7]);
      uint64_t v85 = v84[8];
      uint64_t v86 = (char *)a1 + v85;
      uint64_t v87 = (char *)a2 + v85;
      uint64_t v88 = sub_1E09955A0();
      if (__swift_getEnumTagSinglePayload((uint64_t)v87, 1, v88))
      {
        uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB800);
        memcpy(v86, v87, *(void *)(*(void *)(v89 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 32))(v86, v87, v88);
        __swift_storeEnumTagSinglePayload((uint64_t)v86, 0, 1, v88);
      }
      uint64_t v186 = v84[9];
      uint64_t v187 = (char *)a1 + v186;
      uint64_t v188 = (char *)a2 + v186;
      uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v188, 1, v189))
      {
        uint64_t v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v187, v188, *(void *)(*(void *)(v190 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v189 - 8) + 32))(v187, v188, v189);
        __swift_storeEnumTagSinglePayload((uint64_t)v187, 0, 1, v189);
      }
      *(_OWORD *)((char *)a1 + v84[10]) = *(_OWORD *)((char *)a2 + v84[10]);
      *(_OWORD *)((char *)a1 + v84[11]) = *(_OWORD *)((char *)a2 + v84[11]);
      uint64_t v258 = v84[12];
      uint64_t v259 = (char *)a1 + v258;
      uint64_t v260 = (char *)a2 + v258;
      uint64_t v261 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v260, 1, v261))
      {
        uint64_t v262 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v259, v260, *(void *)(*(void *)(v262 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v260, 1, v13))
        {
          uint64_t v306 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v259, v260, *(void *)(*(void *)(v306 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v259, v260, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v259, 0, 1, v13);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v259, 0, 1, v261);
      }
      uint64_t v158 = v84[13];
      goto LABEL_245;
    case 3u:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v15))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v15);
      }
      uint64_t v90 = (int *)type metadata accessor for StorePlatformGenre();
      goto LABEL_58;
    case 4u:
      *a1 = *a2;
      uint64_t v17 = (int *)type metadata accessor for StorePlatformMusicMovie();
      uint64_t v18 = v17[5];
      uint64_t v19 = (char *)a1 + v18;
      uint64_t v20 = (char *)a2 + v18;
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21))
      {
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
        __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
      }
      *(void *)((char *)a1 + v17[6]) = *(void *)((char *)a2 + v17[6]);
      *(_OWORD *)((char *)a1 + v17[7]) = *(_OWORD *)((char *)a2 + v17[7]);
      *(void *)((char *)a1 + v17[8]) = *(void *)((char *)a2 + v17[8]);
      uint64_t v91 = v17[9];
      uint64_t v92 = (char *)a1 + v91;
      uint64_t v93 = (char *)a2 + v91;
      uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (__swift_getEnumTagSinglePayload((uint64_t)v93, 1, v94))
      {
        uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
        memcpy(v92, v93, *(void *)(*(void *)(v95 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 32))(v92, v93, v94);
        __swift_storeEnumTagSinglePayload((uint64_t)v92, 0, 1, v94);
      }
      *(void *)((char *)a1 + v17[10]) = *(void *)((char *)a2 + v17[10]);
      *(void *)((char *)a1 + v17[11]) = *(void *)((char *)a2 + v17[11]);
      *(void *)((char *)a1 + v17[12]) = *(void *)((char *)a2 + v17[12]);
      *(void *)((char *)a1 + v17[13]) = *(void *)((char *)a2 + v17[13]);
      *(_OWORD *)((char *)a1 + v17[14]) = *(_OWORD *)((char *)a2 + v17[14]);
      uint64_t v191 = v17[15];
      uint64_t v192 = (char *)a1 + v191;
      uint64_t v193 = (char *)a2 + v191;
      uint64_t v153 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v193, 1, v153))
      {
        uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v192, v193, *(void *)(*(void *)(v194 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v192, v193, v153);
        __swift_storeEnumTagSinglePayload((uint64_t)v192, 0, 1, v153);
      }
      *((unsigned char *)a1 + v17[16]) = *((unsigned char *)a2 + v17[16]);
      uint64_t v263 = v17[17];
      uint64_t v264 = (char *)a1 + v263;
      uint64_t v265 = (char *)a2 + v263;
      uint64_t v266 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v265, 1, v266))
      {
        uint64_t v267 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v264, v265, *(void *)(*(void *)(v267 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v266 - 8) + 32))(v264, v265, v266);
        __swift_storeEnumTagSinglePayload((uint64_t)v264, 0, 1, v266);
      }
      *(void *)((char *)a1 + v17[18]) = *(void *)((char *)a2 + v17[18]);
      *(_OWORD *)((char *)a1 + v17[19]) = *(_OWORD *)((char *)a2 + v17[19]);
      *(void *)((char *)a1 + v17[20]) = *(void *)((char *)a2 + v17[20]);
      *(_OWORD *)((char *)a1 + v17[21]) = *(_OWORD *)((char *)a2 + v17[21]);
      *((unsigned char *)a1 + v17[22]) = *((unsigned char *)a2 + v17[22]);
      *(_OWORD *)((char *)a1 + v17[23]) = *(_OWORD *)((char *)a2 + v17[23]);
      uint64_t v307 = v17[24];
      uint64_t v308 = (char *)a1 + v307;
      uint64_t v309 = (char *)a2 + v307;
      uint64_t v310 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
      if (__swift_getEnumTagSinglePayload((uint64_t)v309, 1, v310))
      {
        uint64_t v311 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
        memcpy(v308, v309, *(void *)(*(void *)(v311 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v310 - 8) + 32))(v308, v309, v310);
        __swift_storeEnumTagSinglePayload((uint64_t)v308, 0, 1, v310);
      }
      uint64_t v291 = v17[25];
      goto LABEL_206;
    case 5u:
      long long v23 = a2[1];
      *a1 = *a2;
      a1[1] = v23;
      uint64_t v24 = (int *)type metadata accessor for StorePlatformMusicVideo();
      uint64_t v25 = v24[6];
      uint64_t v26 = (char *)a1 + v25;
      uint64_t v27 = (char *)a2 + v25;
      uint64_t v9 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v9))
      {
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v26, v27, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v9);
      }
      uint64_t v96 = v24[7];
      uint64_t v97 = (char *)a1 + v96;
      uint64_t v98 = (char *)a2 + v96;
      uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v98, 1, v99))
      {
        uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v97, v98, *(void *)(*(void *)(v100 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 32))(v97, v98, v99);
        __swift_storeEnumTagSinglePayload((uint64_t)v97, 0, 1, v99);
      }
      *(_OWORD *)((char *)a1 + v24[8]) = *(_OWORD *)((char *)a2 + v24[8]);
      *(_OWORD *)((char *)a1 + v24[9]) = *(_OWORD *)((char *)a2 + v24[9]);
      *(void *)((char *)a1 + v24[10]) = *(void *)((char *)a2 + v24[10]);
      *(_OWORD *)((char *)a1 + v24[11]) = *(_OWORD *)((char *)a2 + v24[11]);
      *(void *)((char *)a1 + v24[12]) = *(void *)((char *)a2 + v24[12]);
      *(void *)((char *)a1 + v24[13]) = *(void *)((char *)a2 + v24[13]);
      *(void *)((char *)a1 + v24[14]) = *(void *)((char *)a2 + v24[14]);
      *(void *)((char *)a1 + v24[15]) = *(void *)((char *)a2 + v24[15]);
      *(_OWORD *)((char *)a1 + v24[16]) = *(_OWORD *)((char *)a2 + v24[16]);
      uint64_t v195 = v24[17];
      uint64_t v196 = (char *)a1 + v195;
      uint64_t v197 = (char *)a2 + v195;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v195, 1, v9))
      {
        uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v196, v197, *(void *)(*(void *)(v198 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v196, v197, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v196, 0, 1, v9);
      }
      *((unsigned char *)a1 + v24[18]) = *((unsigned char *)a2 + v24[18]);
      *(_OWORD *)((char *)a1 + v24[19]) = *(_OWORD *)((char *)a2 + v24[19]);
      *(void *)((char *)a1 + v24[20]) = *(void *)((char *)a2 + v24[20]);
      *(_OWORD *)((char *)a1 + v24[21]) = *(_OWORD *)((char *)a2 + v24[21]);
      uint64_t v268 = v24[22];
      uint64_t v269 = (char *)a1 + v268;
      uint64_t v270 = (char *)a2 + v268;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v268, 1, v9))
      {
        uint64_t v271 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v269, v270, *(void *)(*(void *)(v271 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v269, v270, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v269, 0, 1, v9);
      }
      *((unsigned char *)a1 + v24[23]) = *((unsigned char *)a2 + v24[23]);
      uint64_t v312 = v24[24];
      uint64_t v313 = (char *)a1 + v312;
      uint64_t v314 = (char *)a2 + v312;
      *(void *)uint64_t v313 = *(void *)v314;
      v313[8] = v314[8];
      uint64_t v315 = v24[25];
      uint64_t v316 = (char *)a1 + v315;
      uint64_t v317 = (char *)a2 + v315;
      uint64_t v318 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v317, 1, v318))
      {
        uint64_t v319 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v316, v317, *(void *)(*(void *)(v319 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v317, 1, v99))
        {
          uint64_t v339 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v316, v317, *(void *)(*(void *)(v339 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 32))(v316, v317, v99);
          __swift_storeEnumTagSinglePayload((uint64_t)v316, 0, 1, v99);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v316, 0, 1, v318);
      }
      uint64_t v370 = v24[26];
      goto LABEL_252;
    case 6u:
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v29))
      {
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v30 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v29 - 8) + 32))(a1, a2, v29);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v29);
      }
      uint64_t v101 = (int *)type metadata accessor for StorePlatformPlaylist();
      *(void *)((char *)a1 + v101[5]) = *(void *)((char *)a2 + v101[5]);
      *(_OWORD *)((char *)a1 + v101[6]) = *(_OWORD *)((char *)a2 + v101[6]);
      *(void *)((char *)a1 + v101[7]) = *(void *)((char *)a2 + v101[7]);
      *(void *)((char *)a1 + v101[8]) = *(void *)((char *)a2 + v101[8]);
      uint64_t v102 = v101[9];
      uint64_t v103 = (char *)a1 + v102;
      uint64_t v104 = (char *)a2 + v102;
      uint64_t v105 = sub_1E0996410();
      if (__swift_getEnumTagSinglePayload((uint64_t)v104, 1, v105))
      {
        uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
        memcpy(v103, v104, *(void *)(*(void *)(v106 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v105 - 8) + 32))(v103, v104, v105);
        __swift_storeEnumTagSinglePayload((uint64_t)v103, 0, 1, v105);
      }
      *(void *)((char *)a1 + v101[10]) = *(void *)((char *)a2 + v101[10]);
      *(void *)((char *)a1 + v101[11]) = *(void *)((char *)a2 + v101[11]);
      *(_OWORD *)((char *)a1 + v101[12]) = *(_OWORD *)((char *)a2 + v101[12]);
      *(_OWORD *)((char *)a1 + v101[13]) = *(_OWORD *)((char *)a2 + v101[13]);
      uint64_t v199 = v101[14];
      uint64_t v200 = (char *)a1 + v199;
      uint64_t v201 = (char *)a2 + v199;
      uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v201, 1, v202))
      {
        uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v200, v201, *(void *)(*(void *)(v203 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v202 - 8) + 32))(v200, v201, v202);
        __swift_storeEnumTagSinglePayload((uint64_t)v200, 0, 1, v202);
      }
      *(_OWORD *)((char *)a1 + v101[15]) = *(_OWORD *)((char *)a2 + v101[15]);
      *((unsigned char *)a1 + v101[16]) = *((unsigned char *)a2 + v101[16]);
      uint64_t v272 = v101[17];
      uint64_t v273 = (char *)a1 + v272;
      uint64_t v274 = (char *)a2 + v272;
      uint64_t v275 = sub_1E0995F90();
      if (__swift_getEnumTagSinglePayload((uint64_t)v274, 1, v275))
      {
        uint64_t v276 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE08);
        memcpy(v273, v274, *(void *)(*(void *)(v276 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v275 - 8) + 32))(v273, v274, v275);
        __swift_storeEnumTagSinglePayload((uint64_t)v273, 0, 1, v275);
      }
      *(void *)((char *)a1 + v101[18]) = *(void *)((char *)a2 + v101[18]);
      uint64_t v320 = v101[19];
      uint64_t v321 = (char *)a1 + v320;
      uint64_t v322 = (char *)a2 + v320;
      uint64_t v323 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v322, 1, v323))
      {
        uint64_t v324 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v321, v322, *(void *)(*(void *)(v324 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v322, 1, v29))
        {
          uint64_t v340 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v321, v322, *(void *)(*(void *)(v340 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v321, v322, v29);
          __swift_storeEnumTagSinglePayload((uint64_t)v321, 0, 1, v29);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v321, 0, 1, v323);
      }
      uint64_t v158 = v101[20];
      goto LABEL_245;
    case 7u:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v15))
      {
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v15);
      }
      uint64_t v90 = (int *)type metadata accessor for StorePlatformRadioShow();
LABEL_58:
      uint64_t v107 = v90;
      *(void *)((char *)a1 + v90[5]) = *(void *)((char *)a2 + v90[5]);
      *(void *)((char *)a1 + v90[6]) = *(void *)((char *)a2 + v90[6]);
      *(_OWORD *)((char *)a1 + v90[7]) = *(_OWORD *)((char *)a2 + v90[7]);
      uint64_t v108 = v90[8];
      uint64_t v109 = (char *)a1 + v108;
      uint64_t v110 = (char *)a2 + v108;
      uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v110, 1, v111))
      {
        uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v109, v110, *(void *)(*(void *)(v112 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 32))(v109, v110, v111);
        __swift_storeEnumTagSinglePayload((uint64_t)v109, 0, 1, v111);
      }
      *(_OWORD *)((char *)a1 + v107[9]) = *(_OWORD *)((char *)a2 + v107[9]);
      *(_OWORD *)((char *)a1 + v107[10]) = *(_OWORD *)((char *)a2 + v107[10]);
      uint64_t v113 = v107[11];
      uint64_t v114 = (char *)a1 + v113;
      uint64_t v115 = (char *)a2 + v113;
      uint64_t v116 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v115, 1, v116))
      {
        uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v114, v115, *(void *)(*(void *)(v117 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v115, 1, v15))
        {
          uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v114, v115, *(void *)(*(void *)(v118 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v114, v115, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)v114, 0, 1, v15);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v114, 0, 1, v116);
      }
      uint64_t v158 = v107[12];
      goto LABEL_245;
    case 8u:
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v32))
      {
        uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v33 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v32 - 8) + 32))(a1, a2, v32);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v32);
      }
      uint64_t v119 = (int *)type metadata accessor for StorePlatformRecordLabel();
      uint64_t v120 = v119[5];
      uint64_t v121 = (char *)a1 + v120;
      uint64_t v122 = (char *)a2 + v120;
      uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (__swift_getEnumTagSinglePayload((uint64_t)v122, 1, v123))
      {
        uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
        memcpy(v121, v122, *(void *)(*(void *)(v124 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 32))(v121, v122, v123);
        __swift_storeEnumTagSinglePayload((uint64_t)v121, 0, 1, v123);
      }
      *(void *)((char *)a1 + v119[6]) = *(void *)((char *)a2 + v119[6]);
      *(void *)((char *)a1 + v119[7]) = *(void *)((char *)a2 + v119[7]);
      *(_OWORD *)((char *)a1 + v119[8]) = *(_OWORD *)((char *)a2 + v119[8]);
      *(_OWORD *)((char *)a1 + v119[9]) = *(_OWORD *)((char *)a2 + v119[9]);
      uint64_t v204 = v119[10];
      v205 = (char *)a1 + v204;
      uint64_t v206 = (char *)a2 + v204;
      uint64_t v207 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v206, 1, v207))
      {
        uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v205, v206, *(void *)(*(void *)(v208 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v206, 1, v32))
        {
          uint64_t v277 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v205, v206, *(void *)(*(void *)(v277 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v205, v206, v32);
          __swift_storeEnumTagSinglePayload((uint64_t)v205, 0, 1, v32);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v205, 0, 1, v207);
      }
      uint64_t v158 = v119[11];
      goto LABEL_245;
    case 9u:
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v34))
      {
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(a1, a2, *(void *)(*(void *)(v35 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v34);
      }
      uint64_t v125 = (int *)type metadata accessor for StorePlatformSocialProfile();
      *(_OWORD *)((char *)a1 + v125[5]) = *(_OWORD *)((char *)a2 + v125[5]);
      *(_OWORD *)((char *)a1 + v125[6]) = *(_OWORD *)((char *)a2 + v125[6]);
      *((unsigned char *)a1 + v125[7]) = *((unsigned char *)a2 + v125[7]);
      *((unsigned char *)a1 + v125[8]) = *((unsigned char *)a2 + v125[8]);
      *(_OWORD *)((char *)a1 + v125[9]) = *(_OWORD *)((char *)a2 + v125[9]);
      uint64_t v126 = v125[10];
      uint64_t v127 = (char *)a1 + v126;
      uint64_t v128 = (char *)a2 + v126;
      uint64_t v9 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v128, 1, v9))
      {
        uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v127, v128, *(void *)(*(void *)(v129 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v127, v128, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v127, 0, 1, v9);
      }
      uint64_t v209 = v125[11];
      uint64_t v210 = (char *)a1 + v209;
      uint64_t v211 = (char *)a2 + v209;
      if (!__swift_getEnumTagSinglePayload((uint64_t)a2 + v209, 1, v9)) {
        goto LABEL_114;
      }
      goto LABEL_253;
    case 0xAu:
      long long v36 = a2[1];
      *a1 = *a2;
      a1[1] = v36;
      uint64_t v37 = (int *)type metadata accessor for StorePlatformSong();
      uint64_t v38 = v37[6];
      uint64_t v39 = (char *)a1 + v38;
      uint64_t v40 = (char *)a2 + v38;
      uint64_t v9 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v9))
      {
        uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v39, v40, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v9);
      }
      uint64_t v130 = v37[7];
      uint64_t v131 = (char *)a1 + v130;
      uint64_t v132 = (char *)a2 + v130;
      uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v132, 1, v133))
      {
        uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v131, v132, *(void *)(*(void *)(v134 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 32))(v131, v132, v133);
        __swift_storeEnumTagSinglePayload((uint64_t)v131, 0, 1, v133);
      }
      *(void *)((char *)a1 + v37[8]) = *(void *)((char *)a2 + v37[8]);
      *(_OWORD *)((char *)a1 + v37[9]) = *(_OWORD *)((char *)a2 + v37[9]);
      *(_OWORD *)((char *)a1 + v37[10]) = *(_OWORD *)((char *)a2 + v37[10]);
      uint64_t v214 = v37[11];
      uint64_t v215 = (_OWORD *)((char *)a1 + v214);
      uint64_t v216 = (_OWORD *)((char *)a2 + v214);
      uint64_t v217 = type metadata accessor for StorePlatformComposer();
      if (__swift_getEnumTagSinglePayload((uint64_t)v216, 1, v217))
      {
        uint64_t v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6448);
        memcpy(v215, v216, *(void *)(*(void *)(v218 - 8) + 64));
      }
      else
      {
        *uint64_t v215 = *v216;
        uint64_t v278 = *(int *)(v217 + 20);
        uint64_t v279 = (char *)v215 + v278;
        uint64_t v280 = (char *)v216 + v278;
        if (__swift_getEnumTagSinglePayload((uint64_t)v280, 1, v9))
        {
          uint64_t v281 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v279, v280, *(void *)(*(void *)(v281 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v279, v280, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v279, 0, 1, v9);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v215, 0, 1, v217);
      }
      *(void *)((char *)a1 + v37[12]) = *(void *)((char *)a2 + v37[12]);
      *(_OWORD *)((char *)a1 + v37[13]) = *(_OWORD *)((char *)a2 + v37[13]);
      uint64_t v351 = v37[14];
      uint64_t v352 = (char *)a1 + v351;
      uint64_t v353 = (char *)a2 + v351;
      *(void *)uint64_t v352 = *(void *)v353;
      v352[8] = v353[8];
      *(void *)((char *)a1 + v37[15]) = *(void *)((char *)a2 + v37[15]);
      *(void *)((char *)a1 + v37[16]) = *(void *)((char *)a2 + v37[16]);
      *(void *)((char *)a1 + v37[17]) = *(void *)((char *)a2 + v37[17]);
      *(void *)((char *)a1 + v37[18]) = *(void *)((char *)a2 + v37[18]);
      *((unsigned char *)a1 + v37[19]) = *((unsigned char *)a2 + v37[19]);
      *((unsigned char *)a1 + v37[20]) = *((unsigned char *)a2 + v37[20]);
      *(_OWORD *)((char *)a1 + v37[21]) = *(_OWORD *)((char *)a2 + v37[21]);
      *((unsigned char *)a1 + v37[22]) = *((unsigned char *)a2 + v37[22]);
      *((unsigned char *)a1 + v37[23]) = *((unsigned char *)a2 + v37[23]);
      *(_OWORD *)((char *)a1 + v37[24]) = *(_OWORD *)((char *)a2 + v37[24]);
      *(void *)((char *)a1 + v37[25]) = *(void *)((char *)a2 + v37[25]);
      *(_OWORD *)((char *)a1 + v37[26]) = *(_OWORD *)((char *)a2 + v37[26]);
      uint64_t v354 = v37[27];
      uint64_t v355 = (char *)a1 + v354;
      uint64_t v356 = (char *)a2 + v354;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v354, 1, v9))
      {
        uint64_t v357 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v355, v356, *(void *)(*(void *)(v357 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v355, v356, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v355, 0, 1, v9);
      }
      *((unsigned char *)a1 + v37[28]) = *((unsigned char *)a2 + v37[28]);
      uint64_t v358 = v37[29];
      uint64_t v359 = (char *)a1 + v358;
      uint64_t v360 = (char *)a2 + v358;
      *(void *)uint64_t v359 = *(void *)v360;
      v359[8] = v360[8];
      uint64_t v361 = v37[30];
      uint64_t v362 = (char *)a1 + v361;
      v363 = (char *)a2 + v361;
      uint64_t v364 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v363, 1, v364))
      {
        uint64_t v365 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v362, v363, *(void *)(*(void *)(v365 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v363, 1, v133))
        {
          uint64_t v366 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v362, v363, *(void *)(*(void *)(v366 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 32))(v362, v363, v133);
          __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v133);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v364);
      }
      uint64_t v370 = v37[31];
      goto LABEL_252;
    case 0xBu:
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0170);
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v42))
      {
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE40);
        memcpy(a1, a2, *(void *)(*(void *)(v43 - 8) + 64));
      }
      else
      {
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v42 - 8) + 32))(a1, a2, v42);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v42);
      }
      uint64_t v135 = (int *)type metadata accessor for StorePlatformStation();
      uint64_t v136 = v135[5];
      uint64_t v137 = (char *)a1 + v136;
      uint64_t v138 = (char *)a2 + v136;
      uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v138, 1, v139))
      {
        uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v137, v138, *(void *)(*(void *)(v140 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v139 - 8) + 32))(v137, v138, v139);
        __swift_storeEnumTagSinglePayload((uint64_t)v137, 0, 1, v139);
      }
      *(void *)((char *)a1 + v135[6]) = *(void *)((char *)a2 + v135[6]);
      uint64_t v219 = v135[7];
      uint64_t v220 = (char *)a1 + v219;
      uint64_t v221 = (char *)a2 + v219;
      uint64_t v222 = sub_1E0995890();
      if (__swift_getEnumTagSinglePayload((uint64_t)v221, 1, v222))
      {
        uint64_t v223 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE38);
        memcpy(v220, v221, *(void *)(*(void *)(v223 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v222 - 8) + 32))(v220, v221, v222);
        __swift_storeEnumTagSinglePayload((uint64_t)v220, 0, 1, v222);
      }
      *(void *)((char *)a1 + v135[8]) = *(void *)((char *)a2 + v135[8]);
      *(void *)((char *)a1 + v135[9]) = *(void *)((char *)a2 + v135[9]);
      *(_OWORD *)((char *)a1 + v135[10]) = *(_OWORD *)((char *)a2 + v135[10]);
      *((unsigned char *)a1 + v135[11]) = *((unsigned char *)a2 + v135[11]);
      uint64_t v282 = v135[12];
      uint64_t v283 = (char *)a1 + v282;
      uint64_t v284 = (char *)a2 + v282;
      uint64_t v285 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v284, 1, v285))
      {
        uint64_t v286 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v283, v284, *(void *)(*(void *)(v286 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v285 - 8) + 32))(v283, v284, v285);
        __swift_storeEnumTagSinglePayload((uint64_t)v283, 0, 1, v285);
      }
      *(_OWORD *)((char *)a1 + v135[13]) = *(_OWORD *)((char *)a2 + v135[13]);
      uint64_t v325 = v135[14];
      v326 = (char *)a1 + v325;
      uint64_t v327 = (char *)a2 + v325;
      v326[8] = v327[8];
      *(void *)v326 = *(void *)v327;
      uint64_t v328 = v135[15];
      uint64_t v329 = (char *)a1 + v328;
      v330 = (char *)a2 + v328;
      uint64_t v331 = sub_1E0995740();
      if (__swift_getEnumTagSinglePayload((uint64_t)v330, 1, v331))
      {
        uint64_t v332 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE30);
        memcpy(v329, v330, *(void *)(*(void *)(v332 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v331 - 8) + 32))(v329, v330, v331);
        __swift_storeEnumTagSinglePayload((uint64_t)v329, 0, 1, v331);
      }
      uint64_t v341 = v135[16];
      uint64_t v342 = (char *)a1 + v341;
      uint64_t v343 = (char *)a2 + v341;
      uint64_t v344 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v343, 1, v344))
      {
        uint64_t v345 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v342, v343, *(void *)(*(void *)(v345 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v343, 1, v139))
        {
          uint64_t v350 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v342, v343, *(void *)(*(void *)(v350 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v139 - 8) + 32))(v342, v343, v139);
          __swift_storeEnumTagSinglePayload((uint64_t)v342, 0, 1, v139);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v342, 0, 1, v344);
      }
      uint64_t v158 = v135[17];
      goto LABEL_245;
    case 0xCu:
      *a1 = *a2;
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
      *((void *)a1 + 5) = *((void *)a2 + 5);
      uint64_t v44 = (int *)type metadata accessor for StorePlatformTVEpisode();
      uint64_t v45 = v44[8];
      uint64_t v46 = (char *)a1 + v45;
      uint64_t v47 = (char *)a2 + v45;
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
      if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v48))
      {
        uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
        memcpy(v46, v47, *(void *)(*(void *)(v49 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v46, v47, v48);
        __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v48);
      }
      *(void *)((char *)a1 + v44[9]) = *(void *)((char *)a2 + v44[9]);
      *(void *)((char *)a1 + v44[10]) = *(void *)((char *)a2 + v44[10]);
      uint64_t v141 = v44[11];
      uint64_t v142 = (char *)a1 + v141;
      uint64_t v143 = (char *)a2 + v141;
      v142[8] = v143[8];
      *(void *)uint64_t v142 = *(void *)v143;
      uint64_t v144 = v44[12];
      uint64_t v145 = (char *)a1 + v144;
      uint64_t v146 = (char *)a2 + v144;
      v145[8] = v146[8];
      *(void *)uint64_t v145 = *(void *)v146;
      uint64_t v147 = v44[13];
      uint64_t v148 = (char *)a1 + v147;
      uint64_t v149 = (char *)a2 + v147;
      *(void *)uint64_t v148 = *(void *)v149;
      v148[8] = v149[8];
      *(void *)((char *)a1 + v44[14]) = *(void *)((char *)a2 + v44[14]);
      *(void *)((char *)a1 + v44[15]) = *(void *)((char *)a2 + v44[15]);
      *((unsigned char *)a1 + v44[16]) = *((unsigned char *)a2 + v44[16]);
      *(_OWORD *)((char *)a1 + v44[17]) = *(_OWORD *)((char *)a2 + v44[17]);
      uint64_t v150 = v44[18];
      uint64_t v151 = (char *)a1 + v150;
      uint64_t v152 = (char *)a2 + v150;
      uint64_t v153 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v152, 1, v153))
      {
        uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v151, v152, *(void *)(*(void *)(v154 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v151, v152, v153);
        __swift_storeEnumTagSinglePayload((uint64_t)v151, 0, 1, v153);
      }
      *((unsigned char *)a1 + v44[19]) = *((unsigned char *)a2 + v44[19]);
      *(_OWORD *)((char *)a1 + v44[20]) = *(_OWORD *)((char *)a2 + v44[20]);
      *(void *)((char *)a1 + v44[21]) = *(void *)((char *)a2 + v44[21]);
      uint64_t v224 = v44[22];
      v225 = (char *)a1 + v224;
      uint64_t v226 = (char *)a2 + v224;
      uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v226, 1, v227))
      {
        uint64_t v228 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v225, v226, *(void *)(*(void *)(v228 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 32))(v225, v226, v227);
        __swift_storeEnumTagSinglePayload((uint64_t)v225, 0, 1, v227);
      }
      *(_OWORD *)((char *)a1 + v44[23]) = *(_OWORD *)((char *)a2 + v44[23]);
      uint64_t v287 = v44[24];
      uint64_t v288 = (char *)a1 + v287;
      uint64_t v289 = (char *)a2 + v287;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v287, 1, v227))
      {
        uint64_t v290 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v288, v289, *(void *)(*(void *)(v290 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 32))(v288, v289, v227);
        __swift_storeEnumTagSinglePayload((uint64_t)v288, 0, 1, v227);
      }
      *((unsigned char *)a1 + v44[25]) = *((unsigned char *)a2 + v44[25]);
      uint64_t v333 = v44[26];
      uint64_t v334 = (char *)a1 + v333;
      uint64_t v335 = (char *)a2 + v333;
      uint64_t v336 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
      if (__swift_getEnumTagSinglePayload((uint64_t)v335, 1, v336))
      {
        uint64_t v337 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
        memcpy(v334, v335, *(void *)(*(void *)(v337 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v336 - 8) + 32))(v334, v335, v336);
        __swift_storeEnumTagSinglePayload((uint64_t)v334, 0, 1, v336);
      }
      uint64_t v346 = v44[27];
      uint64_t v347 = (char *)a1 + v346;
      uint64_t v348 = (char *)a2 + v346;
      *(void *)uint64_t v347 = *(void *)v348;
      v347[8] = v348[8];
      *((unsigned char *)a1 + v44[28]) = *((unsigned char *)a2 + v44[28]);
      uint64_t v291 = v44[29];
      goto LABEL_206;
    case 0xDu:
      *a1 = *a2;
      uint64_t v50 = (int *)type metadata accessor for StorePlatformTVSeason();
      uint64_t v51 = v50[5];
      uint64_t v52 = (char *)a1 + v51;
      uint64_t v53 = (char *)a2 + v51;
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v53, 1, v54))
      {
        uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v52, v53, *(void *)(*(void *)(v55 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(v52, v53, v54);
        __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v54);
      }
      *(void *)((char *)a1 + v50[6]) = *(void *)((char *)a2 + v50[6]);
      *(void *)((char *)a1 + v50[7]) = *(void *)((char *)a2 + v50[7]);
      *(void *)((char *)a1 + v50[8]) = *(void *)((char *)a2 + v50[8]);
      *(_OWORD *)((char *)a1 + v50[9]) = *(_OWORD *)((char *)a2 + v50[9]);
      *(void *)((char *)a1 + v50[10]) = *(void *)((char *)a2 + v50[10]);
      *(void *)((char *)a1 + v50[11]) = *(void *)((char *)a2 + v50[11]);
      *(void *)((char *)a1 + v50[12]) = *(void *)((char *)a2 + v50[12]);
      *(void *)((char *)a1 + v50[13]) = *(void *)((char *)a2 + v50[13]);
      *(_OWORD *)((char *)a1 + v50[14]) = *(_OWORD *)((char *)a2 + v50[14]);
      *(_OWORD *)((char *)a1 + v50[15]) = *(_OWORD *)((char *)a2 + v50[15]);
      *(_OWORD *)((char *)a1 + v50[16]) = *(_OWORD *)((char *)a2 + v50[16]);
      uint64_t v155 = v50[17];
      uint64_t v156 = (char *)a1 + v155;
      uint64_t v157 = (char *)a2 + v155;
      *(void *)uint64_t v156 = *(void *)v157;
      v156[8] = v157[8];
      uint64_t v158 = v50[18];
LABEL_245:
      uint64_t v371 = (char *)a1 + v158;
      uint64_t v372 = (uint64_t)a2 + v158;
      uint64_t v373 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload(v372, 1, v373))
      {
        size_t v368 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
        uint64_t v369 = v371;
        uint64_t v374 = (const void *)v372;
        goto LABEL_255;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v373 - 8) + 32))(v371, v372, v373);
      uint64_t v212 = (uint64_t)v371;
      uint64_t v213 = v373;
      goto LABEL_248;
    case 0xEu:
      *a1 = *a2;
      uint64_t v56 = (int *)type metadata accessor for StorePlatformTVShow();
      uint64_t v57 = v56[5];
      uint64_t v58 = (char *)a1 + v57;
      uint64_t v59 = (char *)a2 + v57;
      uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v59, 1, v60))
      {
        uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v58, v59, *(void *)(*(void *)(v61 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
        __swift_storeEnumTagSinglePayload((uint64_t)v58, 0, 1, v60);
      }
      *(_OWORD *)((char *)a1 + v56[6]) = *(_OWORD *)((char *)a2 + v56[6]);
      *(void *)((char *)a1 + v56[7]) = *(void *)((char *)a2 + v56[7]);
      *(void *)((char *)a1 + v56[8]) = *(void *)((char *)a2 + v56[8]);
      *(void *)((char *)a1 + v56[9]) = *(void *)((char *)a2 + v56[9]);
      *(void *)((char *)a1 + v56[10]) = *(void *)((char *)a2 + v56[10]);
      *(void *)((char *)a1 + v56[11]) = *(void *)((char *)a2 + v56[11]);
      *(void *)((char *)a1 + v56[12]) = *(void *)((char *)a2 + v56[12]);
      uint64_t v159 = v56[13];
      uint64_t v160 = (char *)a1 + v159;
      uint64_t v161 = (char *)a2 + v159;
      *(void *)uint64_t v160 = *(void *)v161;
      v160[8] = v161[8];
      *(void *)((char *)a1 + v56[14]) = *(void *)((char *)a2 + v56[14]);
      *(void *)((char *)a1 + v56[15]) = *(void *)((char *)a2 + v56[15]);
      *((unsigned char *)a1 + v56[16]) = *((unsigned char *)a2 + v56[16]);
      uint64_t v162 = v56[17];
      uint64_t v163 = (char *)a1 + v162;
      uint64_t v164 = (char *)a2 + v162;
      uint64_t v153 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v164, 1, v153))
      {
        uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v163, v164, *(void *)(*(void *)(v165 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v163, v164, v153);
        __swift_storeEnumTagSinglePayload((uint64_t)v163, 0, 1, v153);
      }
      uint64_t v229 = v56[18];
      uint64_t v230 = (char *)a1 + v229;
      uint64_t v231 = (char *)a2 + v229;
      uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v231, 1, v232))
      {
        uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v230, v231, *(void *)(*(void *)(v233 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v232 - 8) + 32))(v230, v231, v232);
        __swift_storeEnumTagSinglePayload((uint64_t)v230, 0, 1, v232);
      }
      *(void *)((char *)a1 + v56[19]) = *(void *)((char *)a2 + v56[19]);
      *(_OWORD *)((char *)a1 + v56[20]) = *(_OWORD *)((char *)a2 + v56[20]);
      *(_OWORD *)((char *)a1 + v56[21]) = *(_OWORD *)((char *)a2 + v56[21]);
      uint64_t v291 = v56[22];
LABEL_206:
      uint64_t v349 = (char *)a1 + v291;
      uint64_t v211 = (char *)a2 + v291;
      if (!__swift_getEnumTagSinglePayload((uint64_t)a2 + v291, 1, v153))
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v349, v211, v153);
        uint64_t v212 = (uint64_t)v349;
        uint64_t v213 = v153;
        goto LABEL_248;
      }
LABEL_228:
      size_t v368 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
      uint64_t v369 = v349;
      goto LABEL_254;
    case 0xFu:
      *a1 = *a2;
      uint64_t v62 = (int *)type metadata accessor for StorePlatformUploadedAudio();
      uint64_t v63 = v62[5];
      uint64_t v64 = (char *)a1 + v63;
      uint64_t v65 = (char *)a2 + v63;
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v65, 1, v66))
      {
        uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v64, v65, *(void *)(*(void *)(v67 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
        __swift_storeEnumTagSinglePayload((uint64_t)v64, 0, 1, v66);
      }
      uint64_t v166 = v62[6];
      uint64_t v167 = (char *)a1 + v166;
      uint64_t v168 = (char *)a2 + v166;
      uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
      if (__swift_getEnumTagSinglePayload((uint64_t)v168, 1, v169))
      {
        uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
        memcpy(v167, v168, *(void *)(*(void *)(v170 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v169 - 8) + 32))(v167, v168, v169);
        __swift_storeEnumTagSinglePayload((uint64_t)v167, 0, 1, v169);
      }
      *(_OWORD *)((char *)a1 + v62[7]) = *(_OWORD *)((char *)a2 + v62[7]);
      uint64_t v234 = v62[8];
      uint64_t v235 = (char *)a1 + v234;
      v236 = (char *)a2 + v234;
      v235[8] = v236[8];
      *(void *)uint64_t v235 = *(void *)v236;
      *(void *)((char *)a1 + v62[9]) = *(void *)((char *)a2 + v62[9]);
      *(void *)((char *)a1 + v62[10]) = *(void *)((char *)a2 + v62[10]);
      *(void *)((char *)a1 + v62[11]) = *(void *)((char *)a2 + v62[11]);
      *(_OWORD *)((char *)a1 + v62[12]) = *(_OWORD *)((char *)a2 + v62[12]);
      *((unsigned char *)a1 + v62[13]) = *((unsigned char *)a2 + v62[13]);
      *(_OWORD *)((char *)a1 + v62[14]) = *(_OWORD *)((char *)a2 + v62[14]);
      *(_OWORD *)((char *)a1 + v62[15]) = *(_OWORD *)((char *)a2 + v62[15]);
      uint64_t v237 = v62[16];
      uint64_t v238 = (char *)a1 + v237;
      uint64_t v239 = (uint64_t)a2 + v237;
      uint64_t v240 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload(v239, 1, v240))
      {
        size_t v241 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
        uint64_t v242 = v238;
        uint64_t v243 = (const void *)v239;
        goto LABEL_167;
      }
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v240 - 8) + 32))(v238, v239, v240);
      uint64_t v292 = (uint64_t)v238;
      uint64_t v293 = v240;
      goto LABEL_191;
    case 0x10u:
      *a1 = *a2;
      uint64_t v62 = (int *)type metadata accessor for StorePlatformUploadedVideo();
      uint64_t v68 = v62[5];
      uint64_t v69 = (char *)a1 + v68;
      uint64_t v70 = (char *)a2 + v68;
      uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v70, 1, v71))
      {
        uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v69, v70, *(void *)(*(void *)(v72 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 32))(v69, v70, v71);
        __swift_storeEnumTagSinglePayload((uint64_t)v69, 0, 1, v71);
      }
      uint64_t v171 = v62[6];
      uint64_t v172 = (char *)a1 + v171;
      uint64_t v173 = (char *)a2 + v171;
      uint64_t v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
      if (__swift_getEnumTagSinglePayload((uint64_t)v173, 1, v174))
      {
        uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
        memcpy(v172, v173, *(void *)(*(void *)(v175 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v174 - 8) + 32))(v172, v173, v174);
        __swift_storeEnumTagSinglePayload((uint64_t)v172, 0, 1, v174);
      }
      *(_OWORD *)((char *)a1 + v62[7]) = *(_OWORD *)((char *)a2 + v62[7]);
      *(void *)((char *)a1 + v62[8]) = *(void *)((char *)a2 + v62[8]);
      *(void *)((char *)a1 + v62[9]) = *(void *)((char *)a2 + v62[9]);
      *(void *)((char *)a1 + v62[10]) = *(void *)((char *)a2 + v62[10]);
      *(_OWORD *)((char *)a1 + v62[11]) = *(_OWORD *)((char *)a2 + v62[11]);
      uint64_t v244 = v62[12];
      uint64_t v245 = (char *)a1 + v244;
      uint64_t v246 = (char *)a2 + v244;
      uint64_t v247 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v246, 1, v247))
      {
        uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v245, v246, *(void *)(*(void *)(v248 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 32))(v245, v246, v247);
        __swift_storeEnumTagSinglePayload((uint64_t)v245, 0, 1, v247);
      }
      *((unsigned char *)a1 + v62[13]) = *((unsigned char *)a2 + v62[13]);
      *(_OWORD *)((char *)a1 + v62[14]) = *(_OWORD *)((char *)a2 + v62[14]);
      *(_OWORD *)((char *)a1 + v62[15]) = *(_OWORD *)((char *)a2 + v62[15]);
      uint64_t v294 = v62[16];
      uint64_t v295 = (char *)a1 + v294;
      uint64_t v296 = (char *)a2 + v294;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v294, 1, v247))
      {
        size_t v241 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
        uint64_t v242 = v295;
        uint64_t v243 = v296;
LABEL_167:
        memcpy(v242, v243, v241);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 32))(v295, v296, v247);
        uint64_t v292 = (uint64_t)v295;
        uint64_t v293 = v247;
LABEL_191:
        __swift_storeEnumTagSinglePayload(v292, 0, 1, v293);
      }
      *((unsigned char *)a1 + v62[17]) = *((unsigned char *)a2 + v62[17]);
      *(_OWORD *)((char *)a1 + v62[18]) = *(_OWORD *)((char *)a2 + v62[18]);
      *(_OWORD *)((char *)a1 + v62[19]) = *(_OWORD *)((char *)a2 + v62[19]);
LABEL_256:
      swift_storeEnumTagMultiPayload();
      return a1;
    default:
      long long v4 = a2[1];
      *a1 = *a2;
      a1[1] = v4;
      uint64_t v5 = (int *)type metadata accessor for StorePlatformAlbum();
      uint64_t v6 = v5[6];
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_1E0992360();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
      {
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      }
      uint64_t v73 = v5[7];
      uint64_t v74 = (char *)a1 + v73;
      uint64_t v75 = (char *)a2 + v73;
      uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
      if (__swift_getEnumTagSinglePayload((uint64_t)v75, 1, v76))
      {
        uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
        memcpy(v74, v75, *(void *)(*(void *)(v77 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v74, v75, v76);
        __swift_storeEnumTagSinglePayload((uint64_t)v74, 0, 1, v76);
      }
      *(void *)((char *)a1 + v5[8]) = *(void *)((char *)a2 + v5[8]);
      *(void *)((char *)a1 + v5[9]) = *(void *)((char *)a2 + v5[9]);
      *(void *)((char *)a1 + v5[10]) = *(void *)((char *)a2 + v5[10]);
      *(void *)((char *)a1 + v5[11]) = *(void *)((char *)a2 + v5[11]);
      *(_OWORD *)((char *)a1 + v5[12]) = *(_OWORD *)((char *)a2 + v5[12]);
      *(void *)((char *)a1 + v5[13]) = *(void *)((char *)a2 + v5[13]);
      *(void *)((char *)a1 + v5[14]) = *(void *)((char *)a2 + v5[14]);
      *(void *)((char *)a1 + v5[15]) = *(void *)((char *)a2 + v5[15]);
      *(void *)((char *)a1 + v5[16]) = *(void *)((char *)a2 + v5[16]);
      *((unsigned char *)a1 + v5[17]) = *((unsigned char *)a2 + v5[17]);
      *((unsigned char *)a1 + v5[18]) = *((unsigned char *)a2 + v5[18]);
      *((unsigned char *)a1 + v5[19]) = *((unsigned char *)a2 + v5[19]);
      uint64_t v176 = v5[20];
      uint64_t v177 = (char *)a1 + v176;
      uint64_t v178 = (char *)a2 + v176;
      uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
      if (__swift_getEnumTagSinglePayload((uint64_t)v178, 1, v179))
      {
        uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
        memcpy(v177, v178, *(void *)(*(void *)(v180 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v179 - 8) + 32))(v177, v178, v179);
        __swift_storeEnumTagSinglePayload((uint64_t)v177, 0, 1, v179);
      }
      *(_OWORD *)((char *)a1 + v5[21]) = *(_OWORD *)((char *)a2 + v5[21]);
      *(_OWORD *)((char *)a1 + v5[22]) = *(_OWORD *)((char *)a2 + v5[22]);
      *(void *)((char *)a1 + v5[23]) = *(void *)((char *)a2 + v5[23]);
      *(_OWORD *)((char *)a1 + v5[24]) = *(_OWORD *)((char *)a2 + v5[24]);
      uint64_t v249 = v5[25];
      uint64_t v250 = (char *)a1 + v249;
      uint64_t v251 = (char *)a2 + v249;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v249, 1, v9))
      {
        uint64_t v252 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
        memcpy(v250, v251, *(void *)(*(void *)(v252 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v250, v251, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)v250, 0, 1, v9);
      }
      uint64_t v297 = v5[26];
      uint64_t v298 = (char *)a1 + v297;
      uint64_t v299 = (char *)a2 + v297;
      *(void *)uint64_t v298 = *(void *)v299;
      v298[8] = v299[8];
      uint64_t v300 = v5[27];
      uint64_t v301 = (char *)a1 + v300;
      uint64_t v302 = (char *)a2 + v300;
      uint64_t v303 = type metadata accessor for StorePlatformUber();
      if (__swift_getEnumTagSinglePayload((uint64_t)v302, 1, v303))
      {
        uint64_t v304 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
        memcpy(v301, v302, *(void *)(*(void *)(v304 - 8) + 64));
      }
      else
      {
        if (__swift_getEnumTagSinglePayload((uint64_t)v302, 1, v76))
        {
          uint64_t v338 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v301, v302, *(void *)(*(void *)(v338 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v301, v302, v76);
          __swift_storeEnumTagSinglePayload((uint64_t)v301, 0, 1, v76);
        }
        __swift_storeEnumTagSinglePayload((uint64_t)v301, 0, 1, v303);
      }
      uint64_t v370 = v5[28];
LABEL_252:
      uint64_t v210 = (char *)a1 + v370;
      uint64_t v211 = (char *)a2 + v370;
      if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v370, 1, v9))
      {
LABEL_253:
        size_t v368 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
        uint64_t v369 = v210;
LABEL_254:
        uint64_t v374 = v211;
LABEL_255:
        memcpy(v369, v374, v368);
      }
      else
      {
LABEL_114:
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v210, v211, v9);
        uint64_t v212 = (uint64_t)v210;
        uint64_t v213 = v9;
LABEL_248:
        __swift_storeEnumTagSinglePayload(v212, 0, 1, v213);
      }
      goto LABEL_256;
  }
}

_OWORD *sub_1E098D234(_OWORD *a1, _OWORD *a2)
{
  if (a1 != a2)
  {
    sub_1E09897C8((uint64_t)a1, (void (*)(void))type metadata accessor for StorePlatformGenericMusicItem);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11))
        {
          uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
        }
        uint64_t v78 = (int *)type metadata accessor for StorePlatformArtist();
        *(void *)((char *)a1 + v78[5]) = *(void *)((char *)a2 + v78[5]);
        *(void *)((char *)a1 + v78[6]) = *(void *)((char *)a2 + v78[6]);
        *(void *)((char *)a1 + v78[7]) = *(void *)((char *)a2 + v78[7]);
        *(void *)((char *)a1 + v78[8]) = *(void *)((char *)a2 + v78[8]);
        *(_OWORD *)((char *)a1 + v78[9]) = *(_OWORD *)((char *)a2 + v78[9]);
        uint64_t v79 = v78[10];
        uint64_t v80 = (char *)a1 + v79;
        uint64_t v81 = (char *)a2 + v79;
        uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v81, 1, v82))
        {
          uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v80, v81, *(void *)(*(void *)(v83 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v82 - 8) + 32))(v80, v81, v82);
          __swift_storeEnumTagSinglePayload((uint64_t)v80, 0, 1, v82);
        }
        *(_OWORD *)((char *)a1 + v78[11]) = *(_OWORD *)((char *)a2 + v78[11]);
        *(_OWORD *)((char *)a1 + v78[12]) = *(_OWORD *)((char *)a2 + v78[12]);
        uint64_t v181 = v78[13];
        uint64_t v182 = (char *)a1 + v181;
        uint64_t v183 = (char *)a2 + v181;
        uint64_t v184 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v183, 1, v184))
        {
          uint64_t v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v182, v183, *(void *)(*(void *)(v185 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(v182, v183, v184);
          __swift_storeEnumTagSinglePayload((uint64_t)v182, 0, 1, v184);
        }
        uint64_t v253 = v78[14];
        uint64_t v254 = (char *)a1 + v253;
        uint64_t v255 = (char *)a2 + v253;
        uint64_t v256 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v255, 1, v256))
        {
          uint64_t v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v254, v255, *(void *)(*(void *)(v257 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v255, 1, v11))
          {
            uint64_t v305 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v254, v255, *(void *)(*(void *)(v305 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v254, v255, v11);
            __swift_storeEnumTagSinglePayload((uint64_t)v254, 0, 1, v11);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v254, 0, 1, v256);
        }
        uint64_t v367 = v78[15];
        uint64_t v349 = (char *)a1 + v367;
        uint64_t v211 = (char *)a2 + v367;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v367, 1, v184)) {
          goto LABEL_229;
        }
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v184 - 8) + 32))(v349, v211, v184);
        uint64_t v212 = (uint64_t)v349;
        uint64_t v213 = v184;
        goto LABEL_249;
      case 2u:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v13))
        {
          uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v13);
        }
        uint64_t v84 = (int *)type metadata accessor for StorePlatformCurator();
        *(void *)((char *)a1 + v84[5]) = *(void *)((char *)a2 + v84[5]);
        *(void *)((char *)a1 + v84[6]) = *(void *)((char *)a2 + v84[6]);
        *(_OWORD *)((char *)a1 + v84[7]) = *(_OWORD *)((char *)a2 + v84[7]);
        uint64_t v85 = v84[8];
        uint64_t v86 = (char *)a1 + v85;
        uint64_t v87 = (char *)a2 + v85;
        uint64_t v88 = sub_1E09955A0();
        if (__swift_getEnumTagSinglePayload((uint64_t)v87, 1, v88))
        {
          uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEB800);
          memcpy(v86, v87, *(void *)(*(void *)(v89 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v88 - 8) + 32))(v86, v87, v88);
          __swift_storeEnumTagSinglePayload((uint64_t)v86, 0, 1, v88);
        }
        uint64_t v186 = v84[9];
        uint64_t v187 = (char *)a1 + v186;
        uint64_t v188 = (char *)a2 + v186;
        uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v188, 1, v189))
        {
          uint64_t v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v187, v188, *(void *)(*(void *)(v190 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v189 - 8) + 32))(v187, v188, v189);
          __swift_storeEnumTagSinglePayload((uint64_t)v187, 0, 1, v189);
        }
        *(_OWORD *)((char *)a1 + v84[10]) = *(_OWORD *)((char *)a2 + v84[10]);
        *(_OWORD *)((char *)a1 + v84[11]) = *(_OWORD *)((char *)a2 + v84[11]);
        uint64_t v258 = v84[12];
        uint64_t v259 = (char *)a1 + v258;
        uint64_t v260 = (char *)a2 + v258;
        uint64_t v261 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v260, 1, v261))
        {
          uint64_t v262 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v259, v260, *(void *)(*(void *)(v262 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v260, 1, v13))
          {
            uint64_t v306 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v259, v260, *(void *)(*(void *)(v306 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v259, v260, v13);
            __swift_storeEnumTagSinglePayload((uint64_t)v259, 0, 1, v13);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v259, 0, 1, v261);
        }
        uint64_t v158 = v84[13];
        goto LABEL_246;
      case 3u:
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v15))
        {
          uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v15);
        }
        uint64_t v90 = (int *)type metadata accessor for StorePlatformGenre();
        goto LABEL_59;
      case 4u:
        *a1 = *a2;
        uint64_t v17 = (int *)type metadata accessor for StorePlatformMusicMovie();
        uint64_t v18 = v17[5];
        uint64_t v19 = (char *)a1 + v18;
        uint64_t v20 = (char *)a2 + v18;
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21))
        {
          uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
          __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
        }
        *(void *)((char *)a1 + v17[6]) = *(void *)((char *)a2 + v17[6]);
        *(_OWORD *)((char *)a1 + v17[7]) = *(_OWORD *)((char *)a2 + v17[7]);
        *(void *)((char *)a1 + v17[8]) = *(void *)((char *)a2 + v17[8]);
        uint64_t v91 = v17[9];
        uint64_t v92 = (char *)a1 + v91;
        uint64_t v93 = (char *)a2 + v91;
        uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v93, 1, v94))
        {
          uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v92, v93, *(void *)(*(void *)(v95 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v94 - 8) + 32))(v92, v93, v94);
          __swift_storeEnumTagSinglePayload((uint64_t)v92, 0, 1, v94);
        }
        *(void *)((char *)a1 + v17[10]) = *(void *)((char *)a2 + v17[10]);
        *(void *)((char *)a1 + v17[11]) = *(void *)((char *)a2 + v17[11]);
        *(void *)((char *)a1 + v17[12]) = *(void *)((char *)a2 + v17[12]);
        *(void *)((char *)a1 + v17[13]) = *(void *)((char *)a2 + v17[13]);
        *(_OWORD *)((char *)a1 + v17[14]) = *(_OWORD *)((char *)a2 + v17[14]);
        uint64_t v191 = v17[15];
        uint64_t v192 = (char *)a1 + v191;
        uint64_t v193 = (char *)a2 + v191;
        uint64_t v153 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v193, 1, v153))
        {
          uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v192, v193, *(void *)(*(void *)(v194 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v192, v193, v153);
          __swift_storeEnumTagSinglePayload((uint64_t)v192, 0, 1, v153);
        }
        *((unsigned char *)a1 + v17[16]) = *((unsigned char *)a2 + v17[16]);
        uint64_t v263 = v17[17];
        uint64_t v264 = (char *)a1 + v263;
        uint64_t v265 = (char *)a2 + v263;
        uint64_t v266 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v265, 1, v266))
        {
          uint64_t v267 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v264, v265, *(void *)(*(void *)(v267 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v266 - 8) + 32))(v264, v265, v266);
          __swift_storeEnumTagSinglePayload((uint64_t)v264, 0, 1, v266);
        }
        *(void *)((char *)a1 + v17[18]) = *(void *)((char *)a2 + v17[18]);
        *(_OWORD *)((char *)a1 + v17[19]) = *(_OWORD *)((char *)a2 + v17[19]);
        *(void *)((char *)a1 + v17[20]) = *(void *)((char *)a2 + v17[20]);
        *(_OWORD *)((char *)a1 + v17[21]) = *(_OWORD *)((char *)a2 + v17[21]);
        *((unsigned char *)a1 + v17[22]) = *((unsigned char *)a2 + v17[22]);
        *(_OWORD *)((char *)a1 + v17[23]) = *(_OWORD *)((char *)a2 + v17[23]);
        uint64_t v307 = v17[24];
        uint64_t v308 = (char *)a1 + v307;
        uint64_t v309 = (char *)a2 + v307;
        uint64_t v310 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
        if (__swift_getEnumTagSinglePayload((uint64_t)v309, 1, v310))
        {
          uint64_t v311 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
          memcpy(v308, v309, *(void *)(*(void *)(v311 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v310 - 8) + 32))(v308, v309, v310);
          __swift_storeEnumTagSinglePayload((uint64_t)v308, 0, 1, v310);
        }
        uint64_t v291 = v17[25];
        goto LABEL_207;
      case 5u:
        long long v23 = a2[1];
        *a1 = *a2;
        a1[1] = v23;
        uint64_t v24 = (int *)type metadata accessor for StorePlatformMusicVideo();
        uint64_t v25 = v24[6];
        uint64_t v26 = (char *)a1 + v25;
        uint64_t v27 = (char *)a2 + v25;
        uint64_t v9 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v27, 1, v9))
        {
          uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v26, v27, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v9);
        }
        uint64_t v96 = v24[7];
        uint64_t v97 = (char *)a1 + v96;
        uint64_t v98 = (char *)a2 + v96;
        uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v98, 1, v99))
        {
          uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v97, v98, *(void *)(*(void *)(v100 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 32))(v97, v98, v99);
          __swift_storeEnumTagSinglePayload((uint64_t)v97, 0, 1, v99);
        }
        *(_OWORD *)((char *)a1 + v24[8]) = *(_OWORD *)((char *)a2 + v24[8]);
        *(_OWORD *)((char *)a1 + v24[9]) = *(_OWORD *)((char *)a2 + v24[9]);
        *(void *)((char *)a1 + v24[10]) = *(void *)((char *)a2 + v24[10]);
        *(_OWORD *)((char *)a1 + v24[11]) = *(_OWORD *)((char *)a2 + v24[11]);
        *(void *)((char *)a1 + v24[12]) = *(void *)((char *)a2 + v24[12]);
        *(void *)((char *)a1 + v24[13]) = *(void *)((char *)a2 + v24[13]);
        *(void *)((char *)a1 + v24[14]) = *(void *)((char *)a2 + v24[14]);
        *(void *)((char *)a1 + v24[15]) = *(void *)((char *)a2 + v24[15]);
        *(_OWORD *)((char *)a1 + v24[16]) = *(_OWORD *)((char *)a2 + v24[16]);
        uint64_t v195 = v24[17];
        uint64_t v196 = (char *)a1 + v195;
        uint64_t v197 = (char *)a2 + v195;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v195, 1, v9))
        {
          uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v196, v197, *(void *)(*(void *)(v198 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v196, v197, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v196, 0, 1, v9);
        }
        *((unsigned char *)a1 + v24[18]) = *((unsigned char *)a2 + v24[18]);
        *(_OWORD *)((char *)a1 + v24[19]) = *(_OWORD *)((char *)a2 + v24[19]);
        *(void *)((char *)a1 + v24[20]) = *(void *)((char *)a2 + v24[20]);
        *(_OWORD *)((char *)a1 + v24[21]) = *(_OWORD *)((char *)a2 + v24[21]);
        uint64_t v268 = v24[22];
        uint64_t v269 = (char *)a1 + v268;
        uint64_t v270 = (char *)a2 + v268;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v268, 1, v9))
        {
          uint64_t v271 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v269, v270, *(void *)(*(void *)(v271 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v269, v270, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v269, 0, 1, v9);
        }
        *((unsigned char *)a1 + v24[23]) = *((unsigned char *)a2 + v24[23]);
        uint64_t v312 = v24[24];
        uint64_t v313 = (char *)a1 + v312;
        uint64_t v314 = (char *)a2 + v312;
        *(void *)uint64_t v313 = *(void *)v314;
        v313[8] = v314[8];
        uint64_t v315 = v24[25];
        uint64_t v316 = (char *)a1 + v315;
        uint64_t v317 = (char *)a2 + v315;
        uint64_t v318 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v317, 1, v318))
        {
          uint64_t v319 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v316, v317, *(void *)(*(void *)(v319 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v317, 1, v99))
          {
            uint64_t v339 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v316, v317, *(void *)(*(void *)(v339 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v99 - 8) + 32))(v316, v317, v99);
            __swift_storeEnumTagSinglePayload((uint64_t)v316, 0, 1, v99);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v316, 0, 1, v318);
        }
        uint64_t v370 = v24[26];
        goto LABEL_253;
      case 6u:
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v29))
        {
          uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v30 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v29 - 8) + 32))(a1, a2, v29);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v29);
        }
        uint64_t v101 = (int *)type metadata accessor for StorePlatformPlaylist();
        *(void *)((char *)a1 + v101[5]) = *(void *)((char *)a2 + v101[5]);
        *(_OWORD *)((char *)a1 + v101[6]) = *(_OWORD *)((char *)a2 + v101[6]);
        *(void *)((char *)a1 + v101[7]) = *(void *)((char *)a2 + v101[7]);
        *(void *)((char *)a1 + v101[8]) = *(void *)((char *)a2 + v101[8]);
        uint64_t v102 = v101[9];
        uint64_t v103 = (char *)a1 + v102;
        uint64_t v104 = (char *)a2 + v102;
        uint64_t v105 = sub_1E0996410();
        if (__swift_getEnumTagSinglePayload((uint64_t)v104, 1, v105))
        {
          uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E90);
          memcpy(v103, v104, *(void *)(*(void *)(v106 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v105 - 8) + 32))(v103, v104, v105);
          __swift_storeEnumTagSinglePayload((uint64_t)v103, 0, 1, v105);
        }
        *(void *)((char *)a1 + v101[10]) = *(void *)((char *)a2 + v101[10]);
        *(void *)((char *)a1 + v101[11]) = *(void *)((char *)a2 + v101[11]);
        *(_OWORD *)((char *)a1 + v101[12]) = *(_OWORD *)((char *)a2 + v101[12]);
        *(_OWORD *)((char *)a1 + v101[13]) = *(_OWORD *)((char *)a2 + v101[13]);
        uint64_t v199 = v101[14];
        uint64_t v200 = (char *)a1 + v199;
        uint64_t v201 = (char *)a2 + v199;
        uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v201, 1, v202))
        {
          uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v200, v201, *(void *)(*(void *)(v203 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v202 - 8) + 32))(v200, v201, v202);
          __swift_storeEnumTagSinglePayload((uint64_t)v200, 0, 1, v202);
        }
        *(_OWORD *)((char *)a1 + v101[15]) = *(_OWORD *)((char *)a2 + v101[15]);
        *((unsigned char *)a1 + v101[16]) = *((unsigned char *)a2 + v101[16]);
        uint64_t v272 = v101[17];
        uint64_t v273 = (char *)a1 + v272;
        uint64_t v274 = (char *)a2 + v272;
        uint64_t v275 = sub_1E0995F90();
        if (__swift_getEnumTagSinglePayload((uint64_t)v274, 1, v275))
        {
          uint64_t v276 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE08);
          memcpy(v273, v274, *(void *)(*(void *)(v276 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v275 - 8) + 32))(v273, v274, v275);
          __swift_storeEnumTagSinglePayload((uint64_t)v273, 0, 1, v275);
        }
        *(void *)((char *)a1 + v101[18]) = *(void *)((char *)a2 + v101[18]);
        uint64_t v320 = v101[19];
        uint64_t v321 = (char *)a1 + v320;
        uint64_t v322 = (char *)a2 + v320;
        uint64_t v323 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v322, 1, v323))
        {
          uint64_t v324 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v321, v322, *(void *)(*(void *)(v324 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v322, 1, v29))
          {
            uint64_t v340 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v321, v322, *(void *)(*(void *)(v340 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v321, v322, v29);
            __swift_storeEnumTagSinglePayload((uint64_t)v321, 0, 1, v29);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v321, 0, 1, v323);
        }
        uint64_t v158 = v101[20];
        goto LABEL_246;
      case 7u:
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v15))
        {
          uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v31 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v15);
        }
        uint64_t v90 = (int *)type metadata accessor for StorePlatformRadioShow();
LABEL_59:
        uint64_t v107 = v90;
        *(void *)((char *)a1 + v90[5]) = *(void *)((char *)a2 + v90[5]);
        *(void *)((char *)a1 + v90[6]) = *(void *)((char *)a2 + v90[6]);
        *(_OWORD *)((char *)a1 + v90[7]) = *(_OWORD *)((char *)a2 + v90[7]);
        uint64_t v108 = v90[8];
        uint64_t v109 = (char *)a1 + v108;
        uint64_t v110 = (char *)a2 + v108;
        uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v110, 1, v111))
        {
          uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v109, v110, *(void *)(*(void *)(v112 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v111 - 8) + 32))(v109, v110, v111);
          __swift_storeEnumTagSinglePayload((uint64_t)v109, 0, 1, v111);
        }
        *(_OWORD *)((char *)a1 + v107[9]) = *(_OWORD *)((char *)a2 + v107[9]);
        *(_OWORD *)((char *)a1 + v107[10]) = *(_OWORD *)((char *)a2 + v107[10]);
        uint64_t v113 = v107[11];
        uint64_t v114 = (char *)a1 + v113;
        uint64_t v115 = (char *)a2 + v113;
        uint64_t v116 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v115, 1, v116))
        {
          uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v114, v115, *(void *)(*(void *)(v117 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v115, 1, v15))
          {
            uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v114, v115, *(void *)(*(void *)(v118 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v114, v115, v15);
            __swift_storeEnumTagSinglePayload((uint64_t)v114, 0, 1, v15);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v114, 0, 1, v116);
        }
        uint64_t v158 = v107[12];
        goto LABEL_246;
      case 8u:
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v32))
        {
          uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v33 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v32 - 8) + 32))(a1, a2, v32);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v32);
        }
        uint64_t v119 = (int *)type metadata accessor for StorePlatformRecordLabel();
        uint64_t v120 = v119[5];
        uint64_t v121 = (char *)a1 + v120;
        uint64_t v122 = (char *)a2 + v120;
        uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v122, 1, v123))
        {
          uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v121, v122, *(void *)(*(void *)(v124 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v123 - 8) + 32))(v121, v122, v123);
          __swift_storeEnumTagSinglePayload((uint64_t)v121, 0, 1, v123);
        }
        *(void *)((char *)a1 + v119[6]) = *(void *)((char *)a2 + v119[6]);
        *(void *)((char *)a1 + v119[7]) = *(void *)((char *)a2 + v119[7]);
        *(_OWORD *)((char *)a1 + v119[8]) = *(_OWORD *)((char *)a2 + v119[8]);
        *(_OWORD *)((char *)a1 + v119[9]) = *(_OWORD *)((char *)a2 + v119[9]);
        uint64_t v204 = v119[10];
        v205 = (char *)a1 + v204;
        uint64_t v206 = (char *)a2 + v204;
        uint64_t v207 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v206, 1, v207))
        {
          uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v205, v206, *(void *)(*(void *)(v208 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v206, 1, v32))
          {
            uint64_t v277 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v205, v206, *(void *)(*(void *)(v277 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 32))(v205, v206, v32);
            __swift_storeEnumTagSinglePayload((uint64_t)v205, 0, 1, v32);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v205, 0, 1, v207);
        }
        uint64_t v158 = v119[11];
        goto LABEL_246;
      case 9u:
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v34))
        {
          uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(a1, a2, *(void *)(*(void *)(v35 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v34 - 8) + 32))(a1, a2, v34);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v34);
        }
        uint64_t v125 = (int *)type metadata accessor for StorePlatformSocialProfile();
        *(_OWORD *)((char *)a1 + v125[5]) = *(_OWORD *)((char *)a2 + v125[5]);
        *(_OWORD *)((char *)a1 + v125[6]) = *(_OWORD *)((char *)a2 + v125[6]);
        *((unsigned char *)a1 + v125[7]) = *((unsigned char *)a2 + v125[7]);
        *((unsigned char *)a1 + v125[8]) = *((unsigned char *)a2 + v125[8]);
        *(_OWORD *)((char *)a1 + v125[9]) = *(_OWORD *)((char *)a2 + v125[9]);
        uint64_t v126 = v125[10];
        uint64_t v127 = (char *)a1 + v126;
        uint64_t v128 = (char *)a2 + v126;
        uint64_t v9 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v128, 1, v9))
        {
          uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v127, v128, *(void *)(*(void *)(v129 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v127, v128, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v127, 0, 1, v9);
        }
        uint64_t v209 = v125[11];
        uint64_t v210 = (char *)a1 + v209;
        uint64_t v211 = (char *)a2 + v209;
        if (!__swift_getEnumTagSinglePayload((uint64_t)a2 + v209, 1, v9)) {
          goto LABEL_115;
        }
        goto LABEL_254;
      case 0xAu:
        long long v36 = a2[1];
        *a1 = *a2;
        a1[1] = v36;
        uint64_t v37 = (int *)type metadata accessor for StorePlatformSong();
        uint64_t v38 = v37[6];
        uint64_t v39 = (char *)a1 + v38;
        uint64_t v40 = (char *)a2 + v38;
        uint64_t v9 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v9))
        {
          uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v39, v40, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v39, 0, 1, v9);
        }
        uint64_t v130 = v37[7];
        uint64_t v131 = (char *)a1 + v130;
        uint64_t v132 = (char *)a2 + v130;
        uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v132, 1, v133))
        {
          uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v131, v132, *(void *)(*(void *)(v134 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 32))(v131, v132, v133);
          __swift_storeEnumTagSinglePayload((uint64_t)v131, 0, 1, v133);
        }
        *(void *)((char *)a1 + v37[8]) = *(void *)((char *)a2 + v37[8]);
        *(_OWORD *)((char *)a1 + v37[9]) = *(_OWORD *)((char *)a2 + v37[9]);
        *(_OWORD *)((char *)a1 + v37[10]) = *(_OWORD *)((char *)a2 + v37[10]);
        uint64_t v214 = v37[11];
        uint64_t v215 = (_OWORD *)((char *)a1 + v214);
        uint64_t v216 = (_OWORD *)((char *)a2 + v214);
        uint64_t v217 = type metadata accessor for StorePlatformComposer();
        if (__swift_getEnumTagSinglePayload((uint64_t)v216, 1, v217))
        {
          uint64_t v218 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6448);
          memcpy(v215, v216, *(void *)(*(void *)(v218 - 8) + 64));
        }
        else
        {
          *uint64_t v215 = *v216;
          uint64_t v278 = *(int *)(v217 + 20);
          uint64_t v279 = (char *)v215 + v278;
          uint64_t v280 = (char *)v216 + v278;
          if (__swift_getEnumTagSinglePayload((uint64_t)v280, 1, v9))
          {
            uint64_t v281 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
            memcpy(v279, v280, *(void *)(*(void *)(v281 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v279, v280, v9);
            __swift_storeEnumTagSinglePayload((uint64_t)v279, 0, 1, v9);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v215, 0, 1, v217);
        }
        *(void *)((char *)a1 + v37[12]) = *(void *)((char *)a2 + v37[12]);
        *(_OWORD *)((char *)a1 + v37[13]) = *(_OWORD *)((char *)a2 + v37[13]);
        uint64_t v351 = v37[14];
        uint64_t v352 = (char *)a1 + v351;
        uint64_t v353 = (char *)a2 + v351;
        *(void *)uint64_t v352 = *(void *)v353;
        v352[8] = v353[8];
        *(void *)((char *)a1 + v37[15]) = *(void *)((char *)a2 + v37[15]);
        *(void *)((char *)a1 + v37[16]) = *(void *)((char *)a2 + v37[16]);
        *(void *)((char *)a1 + v37[17]) = *(void *)((char *)a2 + v37[17]);
        *(void *)((char *)a1 + v37[18]) = *(void *)((char *)a2 + v37[18]);
        *((unsigned char *)a1 + v37[19]) = *((unsigned char *)a2 + v37[19]);
        *((unsigned char *)a1 + v37[20]) = *((unsigned char *)a2 + v37[20]);
        *(_OWORD *)((char *)a1 + v37[21]) = *(_OWORD *)((char *)a2 + v37[21]);
        *((unsigned char *)a1 + v37[22]) = *((unsigned char *)a2 + v37[22]);
        *((unsigned char *)a1 + v37[23]) = *((unsigned char *)a2 + v37[23]);
        *(_OWORD *)((char *)a1 + v37[24]) = *(_OWORD *)((char *)a2 + v37[24]);
        *(void *)((char *)a1 + v37[25]) = *(void *)((char *)a2 + v37[25]);
        *(_OWORD *)((char *)a1 + v37[26]) = *(_OWORD *)((char *)a2 + v37[26]);
        uint64_t v354 = v37[27];
        uint64_t v355 = (char *)a1 + v354;
        uint64_t v356 = (char *)a2 + v354;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v354, 1, v9))
        {
          uint64_t v357 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v355, v356, *(void *)(*(void *)(v357 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v355, v356, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v355, 0, 1, v9);
        }
        *((unsigned char *)a1 + v37[28]) = *((unsigned char *)a2 + v37[28]);
        uint64_t v358 = v37[29];
        uint64_t v359 = (char *)a1 + v358;
        uint64_t v360 = (char *)a2 + v358;
        *(void *)uint64_t v359 = *(void *)v360;
        v359[8] = v360[8];
        uint64_t v361 = v37[30];
        uint64_t v362 = (char *)a1 + v361;
        v363 = (char *)a2 + v361;
        uint64_t v364 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v363, 1, v364))
        {
          uint64_t v365 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v362, v363, *(void *)(*(void *)(v365 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v363, 1, v133))
          {
            uint64_t v366 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v362, v363, *(void *)(*(void *)(v366 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v133 - 8) + 32))(v362, v363, v133);
            __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v133);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v362, 0, 1, v364);
        }
        uint64_t v370 = v37[31];
        goto LABEL_253;
      case 0xBu:
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0170);
        if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v42))
        {
          uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE40);
          memcpy(a1, a2, *(void *)(*(void *)(v43 - 8) + 64));
        }
        else
        {
          (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v42 - 8) + 32))(a1, a2, v42);
          __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v42);
        }
        uint64_t v135 = (int *)type metadata accessor for StorePlatformStation();
        uint64_t v136 = v135[5];
        uint64_t v137 = (char *)a1 + v136;
        uint64_t v138 = (char *)a2 + v136;
        uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v138, 1, v139))
        {
          uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v137, v138, *(void *)(*(void *)(v140 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v139 - 8) + 32))(v137, v138, v139);
          __swift_storeEnumTagSinglePayload((uint64_t)v137, 0, 1, v139);
        }
        *(void *)((char *)a1 + v135[6]) = *(void *)((char *)a2 + v135[6]);
        uint64_t v219 = v135[7];
        uint64_t v220 = (char *)a1 + v219;
        uint64_t v221 = (char *)a2 + v219;
        uint64_t v222 = sub_1E0995890();
        if (__swift_getEnumTagSinglePayload((uint64_t)v221, 1, v222))
        {
          uint64_t v223 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE38);
          memcpy(v220, v221, *(void *)(*(void *)(v223 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v222 - 8) + 32))(v220, v221, v222);
          __swift_storeEnumTagSinglePayload((uint64_t)v220, 0, 1, v222);
        }
        *(void *)((char *)a1 + v135[8]) = *(void *)((char *)a2 + v135[8]);
        *(void *)((char *)a1 + v135[9]) = *(void *)((char *)a2 + v135[9]);
        *(_OWORD *)((char *)a1 + v135[10]) = *(_OWORD *)((char *)a2 + v135[10]);
        *((unsigned char *)a1 + v135[11]) = *((unsigned char *)a2 + v135[11]);
        uint64_t v282 = v135[12];
        uint64_t v283 = (char *)a1 + v282;
        uint64_t v284 = (char *)a2 + v282;
        uint64_t v285 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v284, 1, v285))
        {
          uint64_t v286 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v283, v284, *(void *)(*(void *)(v286 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v285 - 8) + 32))(v283, v284, v285);
          __swift_storeEnumTagSinglePayload((uint64_t)v283, 0, 1, v285);
        }
        *(_OWORD *)((char *)a1 + v135[13]) = *(_OWORD *)((char *)a2 + v135[13]);
        uint64_t v325 = v135[14];
        v326 = (char *)a1 + v325;
        uint64_t v327 = (char *)a2 + v325;
        v326[8] = v327[8];
        *(void *)v326 = *(void *)v327;
        uint64_t v328 = v135[15];
        uint64_t v329 = (char *)a1 + v328;
        v330 = (char *)a2 + v328;
        uint64_t v331 = sub_1E0995740();
        if (__swift_getEnumTagSinglePayload((uint64_t)v330, 1, v331))
        {
          uint64_t v332 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACEAE30);
          memcpy(v329, v330, *(void *)(*(void *)(v332 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v331 - 8) + 32))(v329, v330, v331);
          __swift_storeEnumTagSinglePayload((uint64_t)v329, 0, 1, v331);
        }
        uint64_t v341 = v135[16];
        uint64_t v342 = (char *)a1 + v341;
        uint64_t v343 = (char *)a2 + v341;
        uint64_t v344 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v343, 1, v344))
        {
          uint64_t v345 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v342, v343, *(void *)(*(void *)(v345 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v343, 1, v139))
          {
            uint64_t v350 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v342, v343, *(void *)(*(void *)(v350 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v139 - 8) + 32))(v342, v343, v139);
            __swift_storeEnumTagSinglePayload((uint64_t)v342, 0, 1, v139);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v342, 0, 1, v344);
        }
        uint64_t v158 = v135[17];
        goto LABEL_246;
      case 0xCu:
        *a1 = *a2;
        *((void *)a1 + 2) = *((void *)a2 + 2);
        *(_OWORD *)((char *)a1 + 24) = *(_OWORD *)((char *)a2 + 24);
        *((void *)a1 + 5) = *((void *)a2 + 5);
        uint64_t v44 = (int *)type metadata accessor for StorePlatformTVEpisode();
        uint64_t v45 = v44[8];
        uint64_t v46 = (char *)a1 + v45;
        uint64_t v47 = (char *)a2 + v45;
        uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0150);
        if (__swift_getEnumTagSinglePayload((uint64_t)v47, 1, v48))
        {
          uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6430);
          memcpy(v46, v47, *(void *)(*(void *)(v49 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 32))(v46, v47, v48);
          __swift_storeEnumTagSinglePayload((uint64_t)v46, 0, 1, v48);
        }
        *(void *)((char *)a1 + v44[9]) = *(void *)((char *)a2 + v44[9]);
        *(void *)((char *)a1 + v44[10]) = *(void *)((char *)a2 + v44[10]);
        uint64_t v141 = v44[11];
        uint64_t v142 = (char *)a1 + v141;
        uint64_t v143 = (char *)a2 + v141;
        v142[8] = v143[8];
        *(void *)uint64_t v142 = *(void *)v143;
        uint64_t v144 = v44[12];
        uint64_t v145 = (char *)a1 + v144;
        uint64_t v146 = (char *)a2 + v144;
        v145[8] = v146[8];
        *(void *)uint64_t v145 = *(void *)v146;
        uint64_t v147 = v44[13];
        uint64_t v148 = (char *)a1 + v147;
        uint64_t v149 = (char *)a2 + v147;
        *(void *)uint64_t v148 = *(void *)v149;
        v148[8] = v149[8];
        *(void *)((char *)a1 + v44[14]) = *(void *)((char *)a2 + v44[14]);
        *(void *)((char *)a1 + v44[15]) = *(void *)((char *)a2 + v44[15]);
        *((unsigned char *)a1 + v44[16]) = *((unsigned char *)a2 + v44[16]);
        *(_OWORD *)((char *)a1 + v44[17]) = *(_OWORD *)((char *)a2 + v44[17]);
        uint64_t v150 = v44[18];
        uint64_t v151 = (char *)a1 + v150;
        uint64_t v152 = (char *)a2 + v150;
        uint64_t v153 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v152, 1, v153))
        {
          uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v151, v152, *(void *)(*(void *)(v154 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v151, v152, v153);
          __swift_storeEnumTagSinglePayload((uint64_t)v151, 0, 1, v153);
        }
        *((unsigned char *)a1 + v44[19]) = *((unsigned char *)a2 + v44[19]);
        *(_OWORD *)((char *)a1 + v44[20]) = *(_OWORD *)((char *)a2 + v44[20]);
        *(void *)((char *)a1 + v44[21]) = *(void *)((char *)a2 + v44[21]);
        uint64_t v224 = v44[22];
        v225 = (char *)a1 + v224;
        uint64_t v226 = (char *)a2 + v224;
        uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v226, 1, v227))
        {
          uint64_t v228 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v225, v226, *(void *)(*(void *)(v228 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 32))(v225, v226, v227);
          __swift_storeEnumTagSinglePayload((uint64_t)v225, 0, 1, v227);
        }
        *(_OWORD *)((char *)a1 + v44[23]) = *(_OWORD *)((char *)a2 + v44[23]);
        uint64_t v287 = v44[24];
        uint64_t v288 = (char *)a1 + v287;
        uint64_t v289 = (char *)a2 + v287;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v287, 1, v227))
        {
          uint64_t v290 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v288, v289, *(void *)(*(void *)(v290 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v227 - 8) + 32))(v288, v289, v227);
          __swift_storeEnumTagSinglePayload((uint64_t)v288, 0, 1, v227);
        }
        *((unsigned char *)a1 + v44[25]) = *((unsigned char *)a2 + v44[25]);
        uint64_t v333 = v44[26];
        uint64_t v334 = (char *)a1 + v333;
        uint64_t v335 = (char *)a2 + v333;
        uint64_t v336 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0130);
        if (__swift_getEnumTagSinglePayload((uint64_t)v335, 1, v336))
        {
          uint64_t v337 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6438);
          memcpy(v334, v335, *(void *)(*(void *)(v337 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v336 - 8) + 32))(v334, v335, v336);
          __swift_storeEnumTagSinglePayload((uint64_t)v334, 0, 1, v336);
        }
        uint64_t v346 = v44[27];
        uint64_t v347 = (char *)a1 + v346;
        uint64_t v348 = (char *)a2 + v346;
        *(void *)uint64_t v347 = *(void *)v348;
        v347[8] = v348[8];
        *((unsigned char *)a1 + v44[28]) = *((unsigned char *)a2 + v44[28]);
        uint64_t v291 = v44[29];
        goto LABEL_207;
      case 0xDu:
        *a1 = *a2;
        uint64_t v50 = (int *)type metadata accessor for StorePlatformTVSeason();
        uint64_t v51 = v50[5];
        uint64_t v52 = (char *)a1 + v51;
        uint64_t v53 = (char *)a2 + v51;
        uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v53, 1, v54))
        {
          uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v52, v53, *(void *)(*(void *)(v55 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v54 - 8) + 32))(v52, v53, v54);
          __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v54);
        }
        *(void *)((char *)a1 + v50[6]) = *(void *)((char *)a2 + v50[6]);
        *(void *)((char *)a1 + v50[7]) = *(void *)((char *)a2 + v50[7]);
        *(void *)((char *)a1 + v50[8]) = *(void *)((char *)a2 + v50[8]);
        *(_OWORD *)((char *)a1 + v50[9]) = *(_OWORD *)((char *)a2 + v50[9]);
        *(void *)((char *)a1 + v50[10]) = *(void *)((char *)a2 + v50[10]);
        *(void *)((char *)a1 + v50[11]) = *(void *)((char *)a2 + v50[11]);
        *(void *)((char *)a1 + v50[12]) = *(void *)((char *)a2 + v50[12]);
        *(void *)((char *)a1 + v50[13]) = *(void *)((char *)a2 + v50[13]);
        *(_OWORD *)((char *)a1 + v50[14]) = *(_OWORD *)((char *)a2 + v50[14]);
        *(_OWORD *)((char *)a1 + v50[15]) = *(_OWORD *)((char *)a2 + v50[15]);
        *(_OWORD *)((char *)a1 + v50[16]) = *(_OWORD *)((char *)a2 + v50[16]);
        uint64_t v155 = v50[17];
        uint64_t v156 = (char *)a1 + v155;
        uint64_t v157 = (char *)a2 + v155;
        *(void *)uint64_t v156 = *(void *)v157;
        v156[8] = v157[8];
        uint64_t v158 = v50[18];
LABEL_246:
        uint64_t v371 = (char *)a1 + v158;
        uint64_t v372 = (uint64_t)a2 + v158;
        uint64_t v373 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload(v372, 1, v373))
        {
          size_t v368 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
          uint64_t v369 = v371;
          uint64_t v374 = (const void *)v372;
          goto LABEL_256;
        }
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v373 - 8) + 32))(v371, v372, v373);
        uint64_t v212 = (uint64_t)v371;
        uint64_t v213 = v373;
        goto LABEL_249;
      case 0xEu:
        *a1 = *a2;
        uint64_t v56 = (int *)type metadata accessor for StorePlatformTVShow();
        uint64_t v57 = v56[5];
        uint64_t v58 = (char *)a1 + v57;
        uint64_t v59 = (char *)a2 + v57;
        uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v59, 1, v60))
        {
          uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v58, v59, *(void *)(*(void *)(v61 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 32))(v58, v59, v60);
          __swift_storeEnumTagSinglePayload((uint64_t)v58, 0, 1, v60);
        }
        *(_OWORD *)((char *)a1 + v56[6]) = *(_OWORD *)((char *)a2 + v56[6]);
        *(void *)((char *)a1 + v56[7]) = *(void *)((char *)a2 + v56[7]);
        *(void *)((char *)a1 + v56[8]) = *(void *)((char *)a2 + v56[8]);
        *(void *)((char *)a1 + v56[9]) = *(void *)((char *)a2 + v56[9]);
        *(void *)((char *)a1 + v56[10]) = *(void *)((char *)a2 + v56[10]);
        *(void *)((char *)a1 + v56[11]) = *(void *)((char *)a2 + v56[11]);
        *(void *)((char *)a1 + v56[12]) = *(void *)((char *)a2 + v56[12]);
        uint64_t v159 = v56[13];
        uint64_t v160 = (char *)a1 + v159;
        uint64_t v161 = (char *)a2 + v159;
        *(void *)uint64_t v160 = *(void *)v161;
        v160[8] = v161[8];
        *(void *)((char *)a1 + v56[14]) = *(void *)((char *)a2 + v56[14]);
        *(void *)((char *)a1 + v56[15]) = *(void *)((char *)a2 + v56[15]);
        *((unsigned char *)a1 + v56[16]) = *((unsigned char *)a2 + v56[16]);
        uint64_t v162 = v56[17];
        uint64_t v163 = (char *)a1 + v162;
        uint64_t v164 = (char *)a2 + v162;
        uint64_t v153 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v164, 1, v153))
        {
          uint64_t v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v163, v164, *(void *)(*(void *)(v165 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v163, v164, v153);
          __swift_storeEnumTagSinglePayload((uint64_t)v163, 0, 1, v153);
        }
        uint64_t v229 = v56[18];
        uint64_t v230 = (char *)a1 + v229;
        uint64_t v231 = (char *)a2 + v229;
        uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v231, 1, v232))
        {
          uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v230, v231, *(void *)(*(void *)(v233 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v232 - 8) + 32))(v230, v231, v232);
          __swift_storeEnumTagSinglePayload((uint64_t)v230, 0, 1, v232);
        }
        *(void *)((char *)a1 + v56[19]) = *(void *)((char *)a2 + v56[19]);
        *(_OWORD *)((char *)a1 + v56[20]) = *(_OWORD *)((char *)a2 + v56[20]);
        *(_OWORD *)((char *)a1 + v56[21]) = *(_OWORD *)((char *)a2 + v56[21]);
        uint64_t v291 = v56[22];
LABEL_207:
        uint64_t v349 = (char *)a1 + v291;
        uint64_t v211 = (char *)a2 + v291;
        if (!__swift_getEnumTagSinglePayload((uint64_t)a2 + v291, 1, v153))
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v153 - 8) + 32))(v349, v211, v153);
          uint64_t v212 = (uint64_t)v349;
          uint64_t v213 = v153;
          goto LABEL_249;
        }
LABEL_229:
        size_t v368 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
        uint64_t v369 = v349;
        goto LABEL_255;
      case 0xFu:
        *a1 = *a2;
        uint64_t v62 = (int *)type metadata accessor for StorePlatformUploadedAudio();
        uint64_t v63 = v62[5];
        uint64_t v64 = (char *)a1 + v63;
        uint64_t v65 = (char *)a2 + v63;
        uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v65, 1, v66))
        {
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v64, v65, *(void *)(*(void *)(v67 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 32))(v64, v65, v66);
          __swift_storeEnumTagSinglePayload((uint64_t)v64, 0, 1, v66);
        }
        uint64_t v166 = v62[6];
        uint64_t v167 = (char *)a1 + v166;
        uint64_t v168 = (char *)a2 + v166;
        uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
        if (__swift_getEnumTagSinglePayload((uint64_t)v168, 1, v169))
        {
          uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
          memcpy(v167, v168, *(void *)(*(void *)(v170 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v169 - 8) + 32))(v167, v168, v169);
          __swift_storeEnumTagSinglePayload((uint64_t)v167, 0, 1, v169);
        }
        *(_OWORD *)((char *)a1 + v62[7]) = *(_OWORD *)((char *)a2 + v62[7]);
        uint64_t v234 = v62[8];
        uint64_t v235 = (char *)a1 + v234;
        v236 = (char *)a2 + v234;
        v235[8] = v236[8];
        *(void *)uint64_t v235 = *(void *)v236;
        *(void *)((char *)a1 + v62[9]) = *(void *)((char *)a2 + v62[9]);
        *(void *)((char *)a1 + v62[10]) = *(void *)((char *)a2 + v62[10]);
        *(void *)((char *)a1 + v62[11]) = *(void *)((char *)a2 + v62[11]);
        *(_OWORD *)((char *)a1 + v62[12]) = *(_OWORD *)((char *)a2 + v62[12]);
        *((unsigned char *)a1 + v62[13]) = *((unsigned char *)a2 + v62[13]);
        *(_OWORD *)((char *)a1 + v62[14]) = *(_OWORD *)((char *)a2 + v62[14]);
        *(_OWORD *)((char *)a1 + v62[15]) = *(_OWORD *)((char *)a2 + v62[15]);
        uint64_t v237 = v62[16];
        uint64_t v238 = (char *)a1 + v237;
        uint64_t v239 = (uint64_t)a2 + v237;
        uint64_t v240 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload(v239, 1, v240))
        {
          size_t v241 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
          uint64_t v242 = v238;
          uint64_t v243 = (const void *)v239;
          goto LABEL_168;
        }
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v240 - 8) + 32))(v238, v239, v240);
        uint64_t v292 = (uint64_t)v238;
        uint64_t v293 = v240;
        goto LABEL_192;
      case 0x10u:
        *a1 = *a2;
        uint64_t v62 = (int *)type metadata accessor for StorePlatformUploadedVideo();
        uint64_t v68 = v62[5];
        uint64_t v69 = (char *)a1 + v68;
        uint64_t v70 = (char *)a2 + v68;
        uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v70, 1, v71))
        {
          uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v69, v70, *(void *)(*(void *)(v72 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v71 - 8) + 32))(v69, v70, v71);
          __swift_storeEnumTagSinglePayload((uint64_t)v69, 0, 1, v71);
        }
        uint64_t v171 = v62[6];
        uint64_t v172 = (char *)a1 + v171;
        uint64_t v173 = (char *)a2 + v171;
        uint64_t v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0120);
        if (__swift_getEnumTagSinglePayload((uint64_t)v173, 1, v174))
        {
          uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6450);
          memcpy(v172, v173, *(void *)(*(void *)(v175 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v174 - 8) + 32))(v172, v173, v174);
          __swift_storeEnumTagSinglePayload((uint64_t)v172, 0, 1, v174);
        }
        *(_OWORD *)((char *)a1 + v62[7]) = *(_OWORD *)((char *)a2 + v62[7]);
        *(void *)((char *)a1 + v62[8]) = *(void *)((char *)a2 + v62[8]);
        *(void *)((char *)a1 + v62[9]) = *(void *)((char *)a2 + v62[9]);
        *(void *)((char *)a1 + v62[10]) = *(void *)((char *)a2 + v62[10]);
        *(_OWORD *)((char *)a1 + v62[11]) = *(_OWORD *)((char *)a2 + v62[11]);
        uint64_t v244 = v62[12];
        uint64_t v245 = (char *)a1 + v244;
        uint64_t v246 = (char *)a2 + v244;
        uint64_t v247 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v246, 1, v247))
        {
          uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v245, v246, *(void *)(*(void *)(v248 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 32))(v245, v246, v247);
          __swift_storeEnumTagSinglePayload((uint64_t)v245, 0, 1, v247);
        }
        *((unsigned char *)a1 + v62[13]) = *((unsigned char *)a2 + v62[13]);
        *(_OWORD *)((char *)a1 + v62[14]) = *(_OWORD *)((char *)a2 + v62[14]);
        *(_OWORD *)((char *)a1 + v62[15]) = *(_OWORD *)((char *)a2 + v62[15]);
        uint64_t v294 = v62[16];
        uint64_t v295 = (char *)a1 + v294;
        uint64_t v296 = (char *)a2 + v294;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v294, 1, v247))
        {
          size_t v241 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
          uint64_t v242 = v295;
          uint64_t v243 = v296;
LABEL_168:
          memcpy(v242, v243, v241);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v247 - 8) + 32))(v295, v296, v247);
          uint64_t v292 = (uint64_t)v295;
          uint64_t v293 = v247;
LABEL_192:
          __swift_storeEnumTagSinglePayload(v292, 0, 1, v293);
        }
        *((unsigned char *)a1 + v62[17]) = *((unsigned char *)a2 + v62[17]);
        *(_OWORD *)((char *)a1 + v62[18]) = *(_OWORD *)((char *)a2 + v62[18]);
        *(_OWORD *)((char *)a1 + v62[19]) = *(_OWORD *)((char *)a2 + v62[19]);
LABEL_257:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        long long v4 = a2[1];
        *a1 = *a2;
        a1[1] = v4;
        uint64_t v5 = (int *)type metadata accessor for StorePlatformAlbum();
        uint64_t v6 = v5[6];
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_1E0992360();
        if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
        {
          uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
        }
        uint64_t v73 = v5[7];
        uint64_t v74 = (char *)a1 + v73;
        uint64_t v75 = (char *)a2 + v73;
        uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC50);
        if (__swift_getEnumTagSinglePayload((uint64_t)v75, 1, v76))
        {
          uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
          memcpy(v74, v75, *(void *)(*(void *)(v77 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v74, v75, v76);
          __swift_storeEnumTagSinglePayload((uint64_t)v74, 0, 1, v76);
        }
        *(void *)((char *)a1 + v5[8]) = *(void *)((char *)a2 + v5[8]);
        *(void *)((char *)a1 + v5[9]) = *(void *)((char *)a2 + v5[9]);
        *(void *)((char *)a1 + v5[10]) = *(void *)((char *)a2 + v5[10]);
        *(void *)((char *)a1 + v5[11]) = *(void *)((char *)a2 + v5[11]);
        *(_OWORD *)((char *)a1 + v5[12]) = *(_OWORD *)((char *)a2 + v5[12]);
        *(void *)((char *)a1 + v5[13]) = *(void *)((char *)a2 + v5[13]);
        *(void *)((char *)a1 + v5[14]) = *(void *)((char *)a2 + v5[14]);
        *(void *)((char *)a1 + v5[15]) = *(void *)((char *)a2 + v5[15]);
        *(void *)((char *)a1 + v5[16]) = *(void *)((char *)a2 + v5[16]);
        *((unsigned char *)a1 + v5[17]) = *((unsigned char *)a2 + v5[17]);
        *((unsigned char *)a1 + v5[18]) = *((unsigned char *)a2 + v5[18]);
        *((unsigned char *)a1 + v5[19]) = *((unsigned char *)a2 + v5[19]);
        uint64_t v176 = v5[20];
        uint64_t v177 = (char *)a1 + v176;
        uint64_t v178 = (char *)a2 + v176;
        uint64_t v179 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF0140);
        if (__swift_getEnumTagSinglePayload((uint64_t)v178, 1, v179))
        {
          uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEF1E80);
          memcpy(v177, v178, *(void *)(*(void *)(v180 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v179 - 8) + 32))(v177, v178, v179);
          __swift_storeEnumTagSinglePayload((uint64_t)v177, 0, 1, v179);
        }
        *(_OWORD *)((char *)a1 + v5[21]) = *(_OWORD *)((char *)a2 + v5[21]);
        *(_OWORD *)((char *)a1 + v5[22]) = *(_OWORD *)((char *)a2 + v5[22]);
        *(void *)((char *)a1 + v5[23]) = *(void *)((char *)a2 + v5[23]);
        *(_OWORD *)((char *)a1 + v5[24]) = *(_OWORD *)((char *)a2 + v5[24]);
        uint64_t v249 = v5[25];
        uint64_t v250 = (char *)a1 + v249;
        uint64_t v251 = (char *)a2 + v249;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v249, 1, v9))
        {
          uint64_t v252 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0);
          memcpy(v250, v251, *(void *)(*(void *)(v252 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v250, v251, v9);
          __swift_storeEnumTagSinglePayload((uint64_t)v250, 0, 1, v9);
        }
        uint64_t v297 = v5[26];
        uint64_t v298 = (char *)a1 + v297;
        uint64_t v299 = (char *)a2 + v297;
        *(void *)uint64_t v298 = *(void *)v299;
        v298[8] = v299[8];
        uint64_t v300 = v5[27];
        uint64_t v301 = (char *)a1 + v300;
        uint64_t v302 = (char *)a2 + v300;
        uint64_t v303 = type metadata accessor for StorePlatformUber();
        if (__swift_getEnumTagSinglePayload((uint64_t)v302, 1, v303))
        {
          uint64_t v304 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EACE6440);
          memcpy(v301, v302, *(void *)(*(void *)(v304 - 8) + 64));
        }
        else
        {
          if (__swift_getEnumTagSinglePayload((uint64_t)v302, 1, v76))
          {
            uint64_t v338 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBEEFC58);
            memcpy(v301, v302, *(void *)(*(void *)(v338 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(*(void *)(v76 - 8) + 32))(v301, v302, v76);
            __swift_storeEnumTagSinglePayload((uint64_t)v301, 0, 1, v76);
          }
          __swift_storeEnumTagSinglePayload((uint64_t)v301, 0, 1, v303);
        }
        uint64_t v370 = v5[28];
LABEL_253:
        uint64_t v210 = (char *)a1 + v370;
        uint64_t v211 = (char *)a2 + v370;
        if (__swift_getEnumTagSinglePayload((uint64_t)a2 + v370, 1, v9))
        {
LABEL_254:
          size_t v368 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EBEFA5C0) - 8) + 64);
          uint64_t v369 = v210;
LABEL_255:
          uint64_t v374 = v211;
LABEL_256:
          memcpy(v369, v374, v368);
        }
        else
        {
LABEL_115:
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v210, v211, v9);
          uint64_t v212 = (uint64_t)v210;
          uint64_t v213 = v9;
LABEL_249:
          __swift_storeEnumTagSinglePayload(v212, 0, 1, v213);
        }
        goto LABEL_257;
    }
  }
  return a1;
}

uint64_t sub_1E0990C74()
{
  uint64_t result = type metadata accessor for StorePlatformAlbum();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for StorePlatformArtist();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for StorePlatformCurator();
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for StorePlatformGenre();
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for StorePlatformMusicMovie();
          if (v5 <= 0x3F)
          {
            uint64_t result = type metadata accessor for StorePlatformMusicVideo();
            if (v6 <= 0x3F)
            {
              uint64_t result = type metadata accessor for StorePlatformPlaylist();
              if (v7 <= 0x3F)
              {
                uint64_t result = type metadata accessor for StorePlatformRadioShow();
                if (v8 <= 0x3F)
                {
                  uint64_t result = type metadata accessor for StorePlatformRecordLabel();
                  if (v9 <= 0x3F)
                  {
                    uint64_t result = type metadata accessor for StorePlatformSocialProfile();
                    if (v10 <= 0x3F)
                    {
                      uint64_t result = type metadata accessor for StorePlatformSong();
                      if (v11 <= 0x3F)
                      {
                        uint64_t result = type metadata accessor for StorePlatformStation();
                        if (v12 <= 0x3F)
                        {
                          uint64_t result = type metadata accessor for StorePlatformTVEpisode();
                          if (v13 <= 0x3F)
                          {
                            uint64_t result = type metadata accessor for StorePlatformTVSeason();
                            if (v14 <= 0x3F)
                            {
                              uint64_t result = type metadata accessor for StorePlatformTVShow();
                              if (v15 <= 0x3F)
                              {
                                uint64_t result = type metadata accessor for StorePlatformUploadedAudio();
                                if (v16 <= 0x3F)
                                {
                                  uint64_t result = type metadata accessor for StorePlatformUploadedVideo();
                                  if (v17 <= 0x3F)
                                  {
                                    swift_initEnumMetadataMultiPayload();
                                    return 0;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_1E09910C0()
{
  unint64_t result = qword_1EACF45A8;
  if (!qword_1EACF45A8)
  {
    type metadata accessor for StorePlatformGenericMusicItem();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF45A8);
  }
  return result;
}

unint64_t sub_1E0991114()
{
  unint64_t result = qword_1EACF45B0;
  if (!qword_1EACF45B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF45B0);
  }
  return result;
}

unint64_t sub_1E0991164()
{
  unint64_t result = qword_1EACF45B8;
  if (!qword_1EACF45B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF45B8);
  }
  return result;
}

unint64_t sub_1E09911B4()
{
  unint64_t result = qword_1EACF45C0;
  if (!qword_1EACF45C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EACF45C0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_69_17()
{
  return 0x747369747261;
}

uint64_t OUTLINED_FUNCTION_79_17()
{
  return 0x6569766F6DLL;
}

void __getMPCPlayerPathClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPAVEndpointRouteClass_block_invoke_cold_1(v0);
}

void __getMPAVEndpointRouteClass_block_invoke_cold_1()
{
}

void __getMPAVRoutingControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCModelStorePlaybackItemsRequestClass_block_invoke_cold_1(v0);
}

void __getMPCModelStorePlaybackItemsRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCPlayerCommandDialogActionClass_block_invoke_cold_1(v0);
}

void __getMPCPlayerCommandDialogActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCPlayerCommandDialogClass_block_invoke_cold_1(v0);
}

void __getMPCPlayerCommandDialogClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCPlayerCommandStatusClass_block_invoke_cold_1(v0);
}

void __getMPCPlayerCommandStatusClass_block_invoke_cold_1()
{
}

void getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __getMPRestrictionsMonitorClass_block_invoke_cold_1(v0);
}

void __getMPRestrictionsMonitorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryPlaylistEntryReactionChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryPlaylistEntryReactionChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryPlaylistEditControllerClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryPlaylistEditControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getUIImageClass_block_invoke_cold_1(v0);
}

void __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelObjectClass_block_invoke_cold_1(v0);
}

void __getMPModelObjectClass_block_invoke_cold_1()
{
}

void __getMPCPlayerRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryAddToPlaylistChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryAddToPlaylistChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelSongClass_block_invoke_cold_1(v0);
}

void __getMPModelSongClass_block_invoke_cold_1()
{
}

void __getMPMutableSectionedCollectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCPlaybackEngineClass_block_invoke_cold_1(v0);
}

void __getMPCPlaybackEngineClass_block_invoke_cold_1()
{
}

void __getMPCPlayerResponseItemClass_block_invoke_cold_1()
{
}

void __getMPModelLibraryTransientStateControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPPropertySetClass_block_invoke_cold_1(v0);
}

void __getMPPropertySetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPStoreLibraryPersonalizationRequestClass_block_invoke_cold_1(v0);
}

void __getMPStoreLibraryPersonalizationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPStoreLibraryPersonalizationResponseClass_block_invoke_cold_1(v0);
}

void __getMPStoreLibraryPersonalizationResponseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryStartCollaborationChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryStartCollaborationChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaLibraryClass_block_invoke_cold_1(v0);
}

void __getMPMediaLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryRemoveFromPlaylistChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryRemoveFromPlaylistChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryKeepLocalChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryKeepLocalChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCPlayerCommandRequestClass_block_invoke_cold_1(v0);
}

void __getMPCPlayerCommandRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPAVEndpointRoutingDataSourceClass_block_invoke_cold_1(v0);
}

void __getMPAVEndpointRoutingDataSourceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryEndCollaborationChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryEndCollaborationChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPRemotePlaybackQueueClass_block_invoke_cold_1(v0);
}

void __getMPRemotePlaybackQueueClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPServerObjectDatabaseMediaKitImportRequestClass_block_invoke_cold_1(v0);
}

void __getMPServerObjectDatabaseMediaKitImportRequestClass_block_invoke_cold_1()
{
}

void __getMPRequestResponseControllerClass_block_invoke_cold_1()
{
}

void __getMPCPlayerResponseTracklistClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryFavoriteEntityRequestActionClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryFavoriteEntityRequestActionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryFavoriteEntityChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryFavoriteEntityChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelObjectClass_block_invoke_cold_1_0(v0);
}

void __getMPModelObjectClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPLibraryKeepLocalStatusObserverClass_block_invoke_cold_1(v0);
}

void __getMPLibraryKeepLocalStatusObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryDuplicatePlaylistChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryDuplicatePlaylistChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaLibraryClass_block_invoke_cold_1_0(v0);
}

void __getMPMediaLibraryClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPIdentifierSetClass_block_invoke_cold_1(v0);
}

void __getMPIdentifierSetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelPlaylistKindClass_block_invoke_cold_1(v0);
}

void __getMPModelPlaylistKindClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryDownloadQueueRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryDownloadQueueRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelSongClass_block_invoke_cold_1_0(v0);
}

void __getMPModelSongClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryJoinCollaborationChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryJoinCollaborationChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryDeleteEntityChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryDeleteEntityChangeRequestClass_block_invoke_cold_1()
{
}

void __getMPCloudControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryPlaylistEditChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryPlaylistEditChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getUIImageClass_block_invoke_cold_1_0(v0);
}

void __getUIImageClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPModelPlaylistEntryClass_block_invoke_cold_1(v0);
}

void __getMPModelPlaylistEntryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryImportChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryImportChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPServerObjectDatabaseClass_block_invoke_cold_1(v0);
}

void __getMPServerObjectDatabaseClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelGenericObjectKindClass_block_invoke_cold_1(v0);
}

void __getMPModelGenericObjectKindClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaQueryClass_block_invoke_cold_1(v0);
}

void __getMPMediaQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelAlbumKindClass_block_invoke_cold_1(v0);
}

void __getMPModelAlbumKindClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaPropertyPredicateClass_block_invoke_cold_1(v0);
}

void __getMPMediaPropertyPredicateClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelAlbumClass_block_invoke_cold_1(v0);
}

void __getMPModelAlbumClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelPlaylistClass_block_invoke_cold_1(v0);
}

void __getMPModelPlaylistClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelArtistClass_block_invoke_cold_1(v0);
}

void __getMPModelArtistClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelComposerClass_block_invoke_cold_1(v0);
}

void __getMPModelComposerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelGenreClass_block_invoke_cold_1(v0);
}

void __getMPModelGenreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPRemotePlaybackQueueClass_block_invoke_cold_1_0(v0);
}

void __getMPRemotePlaybackQueueClass_block_invoke_cold_1_0()
{
}

void __getMPContentTasteControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCloudServiceStatusControllerClass_block_invoke_cold_1(v0);
}

void __getMPCloudServiceStatusControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPLibraryAddStatusObserverClass_block_invoke_cold_1(v0);
}

void __getMPLibraryAddStatusObserverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaDownloadManagerClass_block_invoke_cold_1(v0);
}

void __getMPMediaDownloadManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryRemoveCollaboratorsChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryRemoveCollaboratorsChangeRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCPlayerChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPCPlayerChangeRequestClass_block_invoke_cold_1()
{
}

void __getMPCPlaybackIntentClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPCModelStorePlaybackItemsRequestClass_block_invoke_cold_1_0(v0);
}

void __getMPCModelStorePlaybackItemsRequestClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPCModelPlaybackIntentTracklistTokenClass_block_invoke_cold_1(v0);
}

void __getMPCModelPlaybackIntentTracklistTokenClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelAlbumClass_block_invoke_cold_1_0(v0);
}

void __getMPModelAlbumClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPModelArtistClass_block_invoke_cold_1_0(v0);
}

void __getMPModelArtistClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPModelRadioStationClass_block_invoke_cold_1(v0);
}

void __getMPModelRadioStationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelAlbumKindClass_block_invoke_cold_1_0(v0);
}

void __getMPModelAlbumKindClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  __getMPModelArtistKindClass_block_invoke_cold_1(v0);
}

void __getMPModelArtistKindClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelSongKindClass_block_invoke_cold_1(v0);
}

void __getMPModelSongKindClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelRadioStationKindClass_block_invoke_cold_1(v0);
}

void __getMPModelRadioStationKindClass_block_invoke_cold_1()
{
}

void __getMPAVRouteClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPMediaLibraryAlbumAppDataClass_block_invoke_cold_1(v0);
}

void __getMPMediaLibraryAlbumAppDataClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getMPModelLibraryAlbumAppDataChangeRequestClass_block_invoke_cold_1(v0);
}

void __getMPModelLibraryAlbumAppDataChangeRequestClass_block_invoke_cold_1()
{
}

void __getMPCPlayerResponseClass_block_invoke_cold_1()
{
}

uint64_t sub_1E0991F30()
{
  return MEMORY[0x1F40E2EA8]();
}

uint64_t sub_1E0991F40()
{
  return MEMORY[0x1F40E2EE8]();
}

uint64_t sub_1E0991F50()
{
  return MEMORY[0x1F40E2F60]();
}

uint64_t sub_1E0991F60()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1E0991F70()
{
  return MEMORY[0x1F40EE1D0]();
}

uint64_t sub_1E0991F80()
{
  return MEMORY[0x1F40EE1D8]();
}

uint64_t sub_1E0991F90()
{
  return MEMORY[0x1F40EE1E0]();
}

uint64_t sub_1E0991FA0()
{
  return MEMORY[0x1F40EE1E8]();
}

uint64_t sub_1E0991FB0()
{
  return MEMORY[0x1F40E3048]();
}

uint64_t sub_1E0991FC0()
{
  return MEMORY[0x1F40E3050]();
}

uint64_t sub_1E0991FD0()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1E0991FE0()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1E0991FF0()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1E0992000()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1E0992010()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1E0992020()
{
  return MEMORY[0x1F40E32C8]();
}

uint64_t sub_1E0992030()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1E0992040()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1E0992050()
{
  return MEMORY[0x1F40E35B0]();
}

uint64_t sub_1E0992060()
{
  return MEMORY[0x1F40E35C0]();
}

uint64_t sub_1E0992070()
{
  return MEMORY[0x1F40E35C8]();
}

uint64_t sub_1E0992080()
{
  return MEMORY[0x1F40E35D0]();
}

uint64_t sub_1E0992090()
{
  return MEMORY[0x1F40EE1F0]();
}

uint64_t sub_1E09920A0()
{
  return MEMORY[0x1F40EE1F8]();
}

uint64_t sub_1E09920B0()
{
  return MEMORY[0x1F40EE200]();
}

uint64_t sub_1E09920C0()
{
  return MEMORY[0x1F40E35D8]();
}

uint64_t sub_1E09920D0()
{
  return MEMORY[0x1F40E3668]();
}

uint64_t sub_1E09920E0()
{
  return MEMORY[0x1F40E3670]();
}

uint64_t sub_1E09920F0()
{
  return MEMORY[0x1F40E36B0]();
}

uint64_t sub_1E0992100()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1E0992110()
{
  return MEMORY[0x1F40E36E8]();
}

uint64_t sub_1E0992120()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1E0992130()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1E0992140()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1E0992150()
{
  return MEMORY[0x1F40E3778]();
}

uint64_t sub_1E0992160()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1E0992170()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1E0992180()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1E0992190()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1E09921A0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1E09921B0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1E09921C0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1E09921D0()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1E09921E0()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1E09921F0()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1E0992240()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1E0992260()
{
  return MEMORY[0x1F40E44E0]();
}

uint64_t sub_1E0992280()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1E0992290()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1E09922A0()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1E09922B0()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1E09922C0()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1E09922D0()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1E09922E0()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1E09922F0()
{
  return MEMORY[0x1F40E4A90]();
}

uint64_t sub_1E0992300()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1E0992310()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1E0992320()
{
  return MEMORY[0x1F40EE208]();
}

uint64_t sub_1E0992330()
{
  return MEMORY[0x1F40EE210]();
}

uint64_t sub_1E0992340()
{
  return MEMORY[0x1F40EE218]();
}

uint64_t sub_1E0992350()
{
  return MEMORY[0x1F40EE220]();
}

uint64_t sub_1E0992360()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1E0992370()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1E0992380()
{
  return MEMORY[0x1F40E4CA0]();
}

uint64_t sub_1E0992390()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1E09923A0()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1E09923B0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1E09923C0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1E09923D0()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1E09923E0()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1E09923F0()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1E0992400()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1E0992410()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1E0992420()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1E0992430()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1E0992440()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1E0992450()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1E0992460()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1E0992470()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1E0992480()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1E0992490()
{
  return MEMORY[0x1F40E5A58]();
}

uint64_t sub_1E09924A0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1E09924B0()
{
  return MEMORY[0x1F40E5AF0]();
}

uint64_t sub_1E09924C0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1E09924D0()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_1E09924E0()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1E09924F0()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1E0992500()
{
  return MEMORY[0x1F40E5DC0]();
}

uint64_t sub_1E0992510()
{
  return MEMORY[0x1F40E5DF8]();
}

uint64_t sub_1E0992520()
{
  return MEMORY[0x1F40E5E28]();
}

uint64_t sub_1E0992530()
{
  return MEMORY[0x1F40E5E38]();
}

uint64_t sub_1E0992540()
{
  return MEMORY[0x1F40E5E48]();
}

uint64_t sub_1E0992550()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1E0992560()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1E0992570()
{
  return MEMORY[0x1F40EE228]();
}

uint64_t sub_1E0992580()
{
  return MEMORY[0x1F40E5EF0]();
}

uint64_t sub_1E0992590()
{
  return MEMORY[0x1F41874F0]();
}

uint64_t sub_1E09925A0()
{
  return MEMORY[0x1F4187538]();
}

uint64_t sub_1E09925B0()
{
  return MEMORY[0x1F4187540]();
}

uint64_t sub_1E09925C0()
{
  return MEMORY[0x1F4187550]();
}

uint64_t sub_1E09925D0()
{
  return MEMORY[0x1F4187568]();
}

uint64_t sub_1E09925E0()
{
  return MEMORY[0x1F4187578]();
}

uint64_t sub_1E09925F0()
{
  return MEMORY[0x1F4187588]();
}

uint64_t sub_1E0992600()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1E0992610()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1E0992620()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1E0992630()
{
  return MEMORY[0x1F41126B0]();
}

uint64_t sub_1E0992640()
{
  return MEMORY[0x1F41126C0]();
}

uint64_t sub_1E0992650()
{
  return MEMORY[0x1F41126E8]();
}

uint64_t sub_1E0992660()
{
  return MEMORY[0x1F41126F0]();
}

uint64_t sub_1E0992670()
{
  return MEMORY[0x1F41126F8]();
}

uint64_t sub_1E0992680()
{
  return MEMORY[0x1F4112708]();
}

uint64_t sub_1E0992690()
{
  return MEMORY[0x1F4112720]();
}

uint64_t sub_1E09926A0()
{
  return MEMORY[0x1F4112728]();
}

uint64_t sub_1E09926B0()
{
  return MEMORY[0x1F4112730]();
}

uint64_t sub_1E09926C0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1E09926D0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1E09926E0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1E09926F0()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1E0992700()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1E0992710()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1E0992720()
{
  return MEMORY[0x1F40D6AC0]();
}

uint64_t sub_1E0992730()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1E0992740()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1E0992750()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1E0992760()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1E0992770()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1E0992780()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1E0992790()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1E09927A0()
{
  return MEMORY[0x1F40D6BB0]();
}

uint64_t sub_1E09927B0()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1E09927C0()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1E09927D0()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1E09927E0()
{
  return MEMORY[0x1F4187388]();
}

uint64_t sub_1E09927F0()
{
  return MEMORY[0x1F4187390]();
}

uint64_t sub_1E0992800()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1E0992810()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1E0992820()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1E0992830()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1E0992840()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1E0992850()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1E0992860()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1E0992870()
{
  return MEMORY[0x1F40EE230]();
}

uint64_t sub_1E0992880()
{
  return MEMORY[0x1F40EE238]();
}

uint64_t sub_1E0992890()
{
  return MEMORY[0x1F40EE240]();
}

uint64_t sub_1E09928A0()
{
  return MEMORY[0x1F40EE248]();
}

uint64_t sub_1E09928B0()
{
  return MEMORY[0x1F40EE250]();
}

uint64_t sub_1E09928C0()
{
  return MEMORY[0x1F40EE258]();
}

uint64_t sub_1E09928D0()
{
  return MEMORY[0x1F40EE260]();
}

uint64_t sub_1E09928E0()
{
  return MEMORY[0x1F40EE268]();
}

uint64_t sub_1E09928F0()
{
  return MEMORY[0x1F40EE270]();
}

uint64_t sub_1E0992900()
{
  return MEMORY[0x1F40EE278]();
}

uint64_t sub_1E0992910()
{
  return MEMORY[0x1F40EE280]();
}

uint64_t sub_1E0992920()
{
  return MEMORY[0x1F40EE288]();
}

uint64_t sub_1E0992930()
{
  return MEMORY[0x1F40EE290]();
}

uint64_t sub_1E0992940()
{
  return MEMORY[0x1F40EE298]();
}

uint64_t sub_1E0992950()
{
  return MEMORY[0x1F40EE2A0]();
}

uint64_t sub_1E0992970()
{
  return MEMORY[0x1F40EE2B0]();
}

uint64_t sub_1E0992980()
{
  return MEMORY[0x1F40EE2B8]();
}

uint64_t sub_1E0992990()
{
  return MEMORY[0x1F40EE2C0]();
}

uint64_t sub_1E09929A0()
{
  return MEMORY[0x1F40EE2C8]();
}

uint64_t sub_1E09929B0()
{
  return MEMORY[0x1F40EE2D0]();
}

uint64_t sub_1E09929C0()
{
  return MEMORY[0x1F40EE2D8]();
}

uint64_t sub_1E09929F0()
{
  return MEMORY[0x1F40EE2F0]();
}

uint64_t sub_1E0992A00()
{
  return MEMORY[0x1F40EE2F8]();
}

uint64_t sub_1E0992A10()
{
  return MEMORY[0x1F40EE300]();
}

uint64_t sub_1E0992A20()
{
  return MEMORY[0x1F40EE308]();
}

uint64_t sub_1E0992A30()
{
  return MEMORY[0x1F40EE310]();
}

uint64_t sub_1E0992A40()
{
  return MEMORY[0x1F40EE318]();
}

uint64_t sub_1E0992A90()
{
  return MEMORY[0x1F40EE340]();
}

uint64_t sub_1E0992AA0()
{
  return MEMORY[0x1F40EE348]();
}

uint64_t sub_1E0992AB0()
{
  return MEMORY[0x1F40EE350]();
}

uint64_t sub_1E0992AC0()
{
  return MEMORY[0x1F40EE358]();
}

uint64_t sub_1E0992AD0()
{
  return MEMORY[0x1F40EE360]();
}

uint64_t sub_1E0992AE0()
{
  return MEMORY[0x1F40EE368]();
}

uint64_t sub_1E0992AF0()
{
  return MEMORY[0x1F40EE370]();
}

uint64_t sub_1E0992B00()
{
  return MEMORY[0x1F40EE378]();
}

uint64_t sub_1E0992B10()
{
  return MEMORY[0x1F40EE380]();
}

uint64_t sub_1E0992B20()
{
  return MEMORY[0x1F40EE388]();
}

uint64_t sub_1E0992B30()
{
  return MEMORY[0x1F40EE390]();
}

uint64_t sub_1E0992B40()
{
  return MEMORY[0x1F40EE398]();
}

uint64_t sub_1E0992B50()
{
  return MEMORY[0x1F40EE3A0]();
}

uint64_t _s16MusicKitInternal0A18UserProfileRequestV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1F40EE3C0]();
}

uint64_t sub_1E0992BA0()
{
  return MEMORY[0x1F40EE3C8]();
}

uint64_t sub_1E0992BB0()
{
  return MEMORY[0x1F40EE3D0]();
}

uint64_t sub_1E0992BC0()
{
  return MEMORY[0x1F40EE3D8]();
}

uint64_t sub_1E0992BD0()
{
  return MEMORY[0x1F40EE3E0]();
}

uint64_t sub_1E0992BE0()
{
  return MEMORY[0x1F40EE3E8]();
}

uint64_t sub_1E0992BF0()
{
  return MEMORY[0x1F40EE3F0]();
}

uint64_t sub_1E0992C00()
{
  return MEMORY[0x1F40EE3F8]();
}

uint64_t sub_1E0992C10()
{
  return MEMORY[0x1F40EE400]();
}

uint64_t sub_1E0992C20()
{
  return MEMORY[0x1F40EE408]();
}

uint64_t sub_1E0992C30()
{
  return MEMORY[0x1F40EE410]();
}

uint64_t sub_1E0992C40()
{
  return MEMORY[0x1F40EE418]();
}

uint64_t sub_1E0992C50()
{
  return MEMORY[0x1F40EE420]();
}

uint64_t sub_1E0992C60()
{
  return MEMORY[0x1F40EE428]();
}

uint64_t sub_1E0992C70()
{
  return MEMORY[0x1F40EE430]();
}

uint64_t sub_1E0992C80()
{
  return MEMORY[0x1F40EE438]();
}

uint64_t sub_1E0992C90()
{
  return MEMORY[0x1F40EE440]();
}

uint64_t sub_1E0992CA0()
{
  return MEMORY[0x1F40EE448]();
}

uint64_t sub_1E0992CB0()
{
  return MEMORY[0x1F40EE450]();
}

uint64_t sub_1E0992CC0()
{
  return MEMORY[0x1F40EE458]();
}

uint64_t sub_1E0992CD0()
{
  return MEMORY[0x1F40EE460]();
}

uint64_t sub_1E0992CE0()
{
  return MEMORY[0x1F40EE468]();
}

uint64_t sub_1E0992CF0()
{
  return MEMORY[0x1F40EE470]();
}

uint64_t sub_1E0992D00()
{
  return MEMORY[0x1F40EE478]();
}

uint64_t sub_1E0992D10()
{
  return MEMORY[0x1F40EE480]();
}

uint64_t sub_1E0992D20()
{
  return MEMORY[0x1F40EE488]();
}

uint64_t sub_1E0992D30()
{
  return MEMORY[0x1F40EE490]();
}

uint64_t sub_1E0992D60()
{
  return MEMORY[0x1F40EE4A8]();
}

uint64_t sub_1E0992D70()
{
  return MEMORY[0x1F40EE4B0]();
}

uint64_t sub_1E0992D80()
{
  return MEMORY[0x1F40EE4B8]();
}

uint64_t sub_1E0992D90()
{
  return MEMORY[0x1F40EE4C0]();
}

uint64_t sub_1E0992DA0()
{
  return MEMORY[0x1F40EE4C8]();
}

uint64_t sub_1E0992DB0()
{
  return MEMORY[0x1F40EE4D0]();
}

uint64_t sub_1E0992DC0()
{
  return MEMORY[0x1F40EE4D8]();
}

uint64_t sub_1E0992DD0()
{
  return MEMORY[0x1F40EE4E0]();
}

uint64_t sub_1E0992DE0()
{
  return MEMORY[0x1F40EE4E8]();
}

uint64_t sub_1E0992DF0()
{
  return MEMORY[0x1F40EE4F0]();
}

uint64_t sub_1E0992E00()
{
  return MEMORY[0x1F40EE4F8]();
}

uint64_t sub_1E0992E10()
{
  return MEMORY[0x1F40EE500]();
}

uint64_t sub_1E0992E20()
{
  return MEMORY[0x1F40EE508]();
}

uint64_t sub_1E0992E30()
{
  return MEMORY[0x1F40EE510]();
}

uint64_t sub_1E0992E40()
{
  return MEMORY[0x1F40EE518]();
}

uint64_t sub_1E0992E50()
{
  return MEMORY[0x1F40EE520]();
}

uint64_t sub_1E0992E60()
{
  return MEMORY[0x1F40EE528]();
}

uint64_t sub_1E0992E70()
{
  return MEMORY[0x1F40EE530]();
}

uint64_t sub_1E0992E80()
{
  return MEMORY[0x1F40EE538]();
}

uint64_t sub_1E0992E90()
{
  return MEMORY[0x1F40EE540]();
}

uint64_t sub_1E0992EA0()
{
  return MEMORY[0x1F40EE548]();
}

uint64_t sub_1E0992EB0()
{
  return MEMORY[0x1F40EE550]();
}

uint64_t sub_1E0992EC0()
{
  return MEMORY[0x1F40EE558]();
}

uint64_t sub_1E0992ED0()
{
  return MEMORY[0x1F40EE578]();
}

uint64_t sub_1E0992EF0()
{
  return MEMORY[0x1F40EE588]();
}

uint64_t sub_1E0992F00()
{
  return MEMORY[0x1F40EE590]();
}

uint64_t sub_1E0992F10()
{
  return MEMORY[0x1F40EE598]();
}

uint64_t sub_1E0992F20()
{
  return MEMORY[0x1F40EE5A0]();
}

uint64_t sub_1E0992F30()
{
  return MEMORY[0x1F40EE5A8]();
}

uint64_t sub_1E0992F40()
{
  return MEMORY[0x1F40EE5B0]();
}

uint64_t sub_1E0992F50()
{
  return MEMORY[0x1F40EE5B8]();
}

uint64_t sub_1E0992F60()
{
  return MEMORY[0x1F40EE5C0]();
}

uint64_t sub_1E0992F70()
{
  return MEMORY[0x1F40EE5C8]();
}

uint64_t sub_1E0992F80()
{
  return MEMORY[0x1F40EE5D0]();
}

uint64_t sub_1E0992F90()
{
  return MEMORY[0x1F40EE5D8]();
}

uint64_t sub_1E0992FA0()
{
  return MEMORY[0x1F40EE5E0]();
}

uint64_t sub_1E0992FB0()
{
  return MEMORY[0x1F40EE5E8]();
}

uint64_t sub_1E0992FC0()
{
  return MEMORY[0x1F40EE5F0]();
}

uint64_t sub_1E0992FD0()
{
  return MEMORY[0x1F40EE5F8]();
}

uint64_t sub_1E0992FE0()
{
  return MEMORY[0x1F40EE600]();
}

uint64_t sub_1E0992FF0()
{
  return MEMORY[0x1F40EE608]();
}

uint64_t sub_1E0993000()
{
  return MEMORY[0x1F40EE610]();
}

uint64_t sub_1E0993010()
{
  return MEMORY[0x1F40EE618]();
}

uint64_t sub_1E0993020()
{
  return MEMORY[0x1F40EE620]();
}

uint64_t sub_1E0993030()
{
  return MEMORY[0x1F40EE628]();
}

uint64_t sub_1E0993040()
{
  return MEMORY[0x1F40EE630]();
}

uint64_t sub_1E0993050()
{
  return MEMORY[0x1F40EE638]();
}

uint64_t sub_1E0993060()
{
  return MEMORY[0x1F40EE640]();
}

uint64_t sub_1E0993070()
{
  return MEMORY[0x1F40EE648]();
}

uint64_t sub_1E0993080()
{
  return MEMORY[0x1F40EE650]();
}

uint64_t sub_1E0993090()
{
  return MEMORY[0x1F40EE658]();
}

uint64_t sub_1E09930A0()
{
  return MEMORY[0x1F40EE660]();
}

uint64_t sub_1E09930B0()
{
  return MEMORY[0x1F40EE668]();
}

uint64_t sub_1E09930C0()
{
  return MEMORY[0x1F40EE670]();
}

uint64_t sub_1E09930D0()
{
  return MEMORY[0x1F40EE678]();
}

uint64_t sub_1E09930E0()
{
  return MEMORY[0x1F40EE680]();
}

uint64_t sub_1E09930F0()
{
  return MEMORY[0x1F40EE688]();
}

uint64_t sub_1E0993110()
{
  return MEMORY[0x1F40EE698]();
}

uint64_t sub_1E0993130()
{
  return MEMORY[0x1F40EE6A8]();
}

uint64_t sub_1E0993140()
{
  return MEMORY[0x1F40EE6B0]();
}

uint64_t sub_1E0993150()
{
  return MEMORY[0x1F40EE6B8]();
}

uint64_t sub_1E0993160()
{
  return MEMORY[0x1F40EE6C0]();
}

uint64_t sub_1E0993170()
{
  return MEMORY[0x1F40EE6C8]();
}

uint64_t sub_1E0993190()
{
  return MEMORY[0x1F40EE6D8]();
}

uint64_t sub_1E09931A0()
{
  return MEMORY[0x1F40EE6E0]();
}

uint64_t sub_1E09931B0()
{
  return MEMORY[0x1F40EE6E8]();
}

uint64_t sub_1E09931C0()
{
  return MEMORY[0x1F40EE6F0]();
}

uint64_t sub_1E09931D0()
{
  return MEMORY[0x1F40EE6F8]();
}

uint64_t sub_1E09931E0()
{
  return MEMORY[0x1F40EE700]();
}

uint64_t sub_1E09931F0()
{
  return MEMORY[0x1F40EE708]();
}

uint64_t sub_1E0993200()
{
  return MEMORY[0x1F40EE710]();
}

uint64_t sub_1E0993220()
{
  return MEMORY[0x1F40EE720]();
}

uint64_t sub_1E0993230()
{
  return MEMORY[0x1F40EE728]();
}

uint64_t sub_1E0993240()
{
  return MEMORY[0x1F40EE730]();
}

uint64_t sub_1E0993270()
{
  return MEMORY[0x1F40EE750]();
}

uint64_t sub_1E0993280()
{
  return MEMORY[0x1F40EE770]();
}

uint64_t sub_1E0993290()
{
  return MEMORY[0x1F40EE778]();
}

uint64_t sub_1E09932A0()
{
  return MEMORY[0x1F40EE780]();
}

uint64_t sub_1E09932B0()
{
  return MEMORY[0x1F40EE788]();
}

uint64_t sub_1E09932C0()
{
  return MEMORY[0x1F40EE790]();
}

uint64_t sub_1E09932D0()
{
  return MEMORY[0x1F40EE798]();
}

uint64_t sub_1E09932E0()
{
  return MEMORY[0x1F40EE7A0]();
}

uint64_t sub_1E09932F0()
{
  return MEMORY[0x1F40EE7A8]();
}

uint64_t sub_1E0993300()
{
  return MEMORY[0x1F40EE7B0]();
}

uint64_t sub_1E0993310()
{
  return MEMORY[0x1F40EE7B8]();
}

uint64_t sub_1E0993320()
{
  return MEMORY[0x1F40EE7C0]();
}

uint64_t sub_1E0993330()
{
  return MEMORY[0x1F40EE7C8]();
}

uint64_t sub_1E0993340()
{
  return MEMORY[0x1F40EE7D0]();
}

uint64_t sub_1E0993350()
{
  return MEMORY[0x1F40EE7D8]();
}

uint64_t sub_1E0993360()
{
  return MEMORY[0x1F40EE7E0]();
}

uint64_t sub_1E0993370()
{
  return MEMORY[0x1F40EE7E8]();
}

uint64_t sub_1E0993380()
{
  return MEMORY[0x1F40EE7F0]();
}

uint64_t sub_1E0993390()
{
  return MEMORY[0x1F40EE7F8]();
}

uint64_t sub_1E09933A0()
{
  return MEMORY[0x1F40EE800]();
}

uint64_t sub_1E09933B0()
{
  return MEMORY[0x1F40EE808]();
}

uint64_t sub_1E09933C0()
{
  return MEMORY[0x1F40EE810]();
}

uint64_t sub_1E09933D0()
{
  return MEMORY[0x1F40EE818]();
}

uint64_t sub_1E09933E0()
{
  return MEMORY[0x1F40EE820]();
}

uint64_t sub_1E09933F0()
{
  return MEMORY[0x1F40EE828]();
}

uint64_t sub_1E0993400()
{
  return MEMORY[0x1F40EE830]();
}

uint64_t sub_1E0993410()
{
  return MEMORY[0x1F40EE838]();
}

uint64_t sub_1E0993420()
{
  return MEMORY[0x1F40EE840]();
}

uint64_t sub_1E0993430()
{
  return MEMORY[0x1F40EE848]();
}

uint64_t sub_1E0993440()
{
  return MEMORY[0x1F40EE850]();
}

uint64_t sub_1E0993450()
{
  return MEMORY[0x1F40EE858]();
}

uint64_t sub_1E0993460()
{
  return MEMORY[0x1F40EE860]();
}

uint64_t sub_1E0993470()
{
  return MEMORY[0x1F40EE868]();
}

uint64_t sub_1E0993480()
{
  return MEMORY[0x1F40EE870]();
}

uint64_t sub_1E0993490()
{
  return MEMORY[0x1F40EE878]();
}

uint64_t sub_1E09934A0()
{
  return MEMORY[0x1F40EE880]();
}

uint64_t sub_1E09934B0()
{
  return MEMORY[0x1F40EE888]();
}

uint64_t sub_1E09934C0()
{
  return MEMORY[0x1F40EE890]();
}

uint64_t sub_1E09934D0()
{
  return MEMORY[0x1F40EE898]();
}

uint64_t sub_1E09934E0()
{
  return MEMORY[0x1F40EE8A0]();
}

uint64_t sub_1E09934F0()
{
  return MEMORY[0x1F40EE8A8]();
}

uint64_t sub_1E0993500()
{
  return MEMORY[0x1F40EE8B0]();
}

uint64_t sub_1E0993510()
{
  return MEMORY[0x1F40EE8B8]();
}

uint64_t sub_1E0993520()
{
  return MEMORY[0x1F40EE8C0]();
}

uint64_t sub_1E0993530()
{
  return MEMORY[0x1F40EE8C8]();
}

uint64_t sub_1E0993540()
{
  return MEMORY[0x1F40EE8D0]();
}

uint64_t sub_1E0993550()
{
  return MEMORY[0x1F40EE8D8]();
}

uint64_t sub_1E0993560()
{
  return MEMORY[0x1F40EE8E0]();
}

uint64_t sub_1E0993570()
{
  return MEMORY[0x1F40EE8E8]();
}

uint64_t sub_1E0993580()
{
  return MEMORY[0x1F40EE8F0]();
}

uint64_t sub_1E0993590()
{
  return MEMORY[0x1F40EE8F8]();
}

uint64_t sub_1E09935A0()
{
  return MEMORY[0x1F40EE900]();
}

uint64_t sub_1E09935B0()
{
  return MEMORY[0x1F40EE908]();
}

uint64_t sub_1E09935C0()
{
  return MEMORY[0x1F40EE910]();
}

uint64_t sub_1E09935D0()
{
  return MEMORY[0x1F40EE918]();
}

uint64_t sub_1E09935E0()
{
  return MEMORY[0x1F40EE920]();
}

uint64_t sub_1E09935F0()
{
  return MEMORY[0x1F40EE928]();
}

uint64_t sub_1E0993600()
{
  return MEMORY[0x1F40EE930]();
}

uint64_t sub_1E0993610()
{
  return MEMORY[0x1F40EE938]();
}

uint64_t sub_1E0993620()
{
  return MEMORY[0x1F40EE940]();
}

uint64_t sub_1E0993630()
{
  return MEMORY[0x1F40EE948]();
}

uint64_t sub_1E0993640()
{
  return MEMORY[0x1F40EE950]();
}

uint64_t sub_1E0993650()
{
  return MEMORY[0x1F40EE958]();
}

uint64_t sub_1E0993660()
{
  return MEMORY[0x1F40EE960]();
}

uint64_t sub_1E0993670()
{
  return MEMORY[0x1F40EE968]();
}

uint64_t sub_1E0993680()
{
  return MEMORY[0x1F40EE970]();
}

uint64_t sub_1E0993690()
{
  return MEMORY[0x1F40EE978]();
}

uint64_t sub_1E09936A0()
{
  return MEMORY[0x1F40EE980]();
}

uint64_t sub_1E09936B0()
{
  return MEMORY[0x1F40EE988]();
}

uint64_t sub_1E09936C0()
{
  return MEMORY[0x1F40EE990]();
}

uint64_t sub_1E09936D0()
{
  return MEMORY[0x1F40EE998]();
}

uint64_t sub_1E09936E0()
{
  return MEMORY[0x1F40EE9A0]();
}

uint64_t sub_1E09936F0()
{
  return MEMORY[0x1F40EE9A8]();
}

uint64_t sub_1E0993700()
{
  return MEMORY[0x1F40EE9B0]();
}

uint64_t sub_1E0993710()
{
  return MEMORY[0x1F40EE9B8]();
}

uint64_t sub_1E0993720()
{
  return MEMORY[0x1F40EE9C0]();
}

uint64_t sub_1E0993730()
{
  return MEMORY[0x1F40EE9C8]();
}

uint64_t sub_1E0993740()
{
  return MEMORY[0x1F40EE9D0]();
}

uint64_t sub_1E0993750()
{
  return MEMORY[0x1F40EE9D8]();
}

uint64_t sub_1E0993760()
{
  return MEMORY[0x1F40EE9E0]();
}

uint64_t sub_1E0993770()
{
  return MEMORY[0x1F40EE9E8]();
}

uint64_t sub_1E09937A0()
{
  return MEMORY[0x1F40EEA00]();
}

uint64_t sub_1E09937B0()
{
  return MEMORY[0x1F40EEA08]();
}

uint64_t sub_1E09937C0()
{
  return MEMORY[0x1F40EEA10]();
}

uint64_t sub_1E09937D0()
{
  return MEMORY[0x1F40EEA18]();
}

uint64_t sub_1E09937F0()
{
  return MEMORY[0x1F40EEA28]();
}

uint64_t sub_1E0993800()
{
  return MEMORY[0x1F40EEA30]();
}

uint64_t sub_1E0993820()
{
  return MEMORY[0x1F40EEA40]();
}

uint64_t sub_1E0993830()
{
  return MEMORY[0x1F40EEA48]();
}

uint64_t sub_1E0993840()
{
  return MEMORY[0x1F40EEA50]();
}

uint64_t sub_1E0993850()
{
  return MEMORY[0x1F40EEA58]();
}

uint64_t sub_1E0993860()
{
  return MEMORY[0x1F40EEA60]();
}

uint64_t sub_1E0993870()
{
  return MEMORY[0x1F40EEA68]();
}

uint64_t sub_1E0993880()
{
  return MEMORY[0x1F40EEA70]();
}

uint64_t sub_1E0993890()
{
  return MEMORY[0x1F40EEA78]();
}

uint64_t sub_1E09938A0()
{
  return MEMORY[0x1F40EEA80]();
}

uint64_t sub_1E09938B0()
{
  return MEMORY[0x1F40EEA88]();
}

uint64_t sub_1E09938C0()
{
  return MEMORY[0x1F40EEA90]();
}

uint64_t sub_1E09938D0()
{
  return MEMORY[0x1F40EEA98]();
}

uint64_t sub_1E09938E0()
{
  return MEMORY[0x1F40EEAA0]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE010includeNonC12AddedContentSbvg_0()
{
  return MEMORY[0x1F40EEAA8]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE010includeNonC12AddedContentSbvs_0()
{
  return MEMORY[0x1F40EEAB0]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE013wantsDetailedC8ResponseSbvg_0()
{
  return MEMORY[0x1F40EEAB8]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE013wantsDetailedC8ResponseSbvs_0()
{
  return MEMORY[0x1F40EEAC0]();
}

uint64_t sub_1E0993930()
{
  return MEMORY[0x1F40EEAC8]();
}

uint64_t sub_1E0993940()
{
  return MEMORY[0x1F40EEAD0]();
}

uint64_t sub_1E0993950()
{
  return MEMORY[0x1F40EEAD8]();
}

uint64_t sub_1E0993960()
{
  return MEMORY[0x1F40EEAE0]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE21excludeNonPinnedItemsSbvg_0()
{
  return MEMORY[0x1F40EEAE8]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE21excludeNonPinnedItemsSbvs_0()
{
  return MEMORY[0x1F40EEAF0]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE25deferIdentifierResolutionSbvg_0()
{
  return MEMORY[0x1F40EEAF8]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE25deferIdentifierResolutionSbvs_0()
{
  return MEMORY[0x1F40EEB00]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE25excludeNonPinnedPlaylistsSbvg_0()
{
  return MEMORY[0x1F40EEB08]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE25excludeNonPinnedPlaylistsSbvs_0()
{
  return MEMORY[0x1F40EEB10]();
}

uint64_t sub_1E09939D0()
{
  return MEMORY[0x1F40EEB18]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE33ignoreExplicitContentRestrictionsSbvg_0()
{
  return MEMORY[0x1F40EEB20]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE33ignoreExplicitContentRestrictionsSbvs_0()
{
  return MEMORY[0x1F40EEB28]();
}

uint64_t sub_1E0993A00()
{
  return MEMORY[0x1F40EEB30]();
}

uint64_t sub_1E0993A10()
{
  return MEMORY[0x1F40EEB38]();
}

uint64_t sub_1E0993A20()
{
  return MEMORY[0x1F40EEB40]();
}

uint64_t sub_1E0993A30()
{
  return MEMORY[0x1F40EEB48]();
}

uint64_t sub_1E0993A40()
{
  return MEMORY[0x1F40EEB50]();
}

uint64_t sub_1E0993A50()
{
  return MEMORY[0x1F40EEB58]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE7libraryAA0aC0Cvg_0()
{
  return MEMORY[0x1F40EEB68]();
}

uint64_t _s8MusicKit0A14LibraryRequestV0aB8InternalE7libraryAA0aC0Cvs_0()
{
  return MEMORY[0x1F40EEB70]();
}

uint64_t sub_1E0993AA0()
{
  return MEMORY[0x1F40EEB80]();
}

uint64_t sub_1E0993AB0()
{
  return MEMORY[0x1F40EEB88]();
}

uint64_t _s8MusicKit0A14LibrarySectionV0aB8InternalE8childrenAA0A14ItemCollectionVyq_Gvg_0()
{
  return MEMORY[0x1F40EEB90]();
}

uint64_t _s8MusicKit0A14LibrarySectionV0aB8InternalE4itemxvg_0()
{
  return MEMORY[0x1F40EEB98]();
}

uint64_t sub_1E0993AE0()
{
  return MEMORY[0x1F40EEBA0]();
}

uint64_t sub_1E0993AF0()
{
  return MEMORY[0x1F40EEBA8]();
}

uint64_t sub_1E0993B00()
{
  return MEMORY[0x1F40EEBB0]();
}

uint64_t sub_1E0993B10()
{
  return MEMORY[0x1F40EEBB8]();
}

uint64_t sub_1E0993B20()
{
  return MEMORY[0x1F40EEBC0]();
}

uint64_t sub_1E0993B30()
{
  return MEMORY[0x1F40EEBC8]();
}

uint64_t sub_1E0993B40()
{
  return MEMORY[0x1F40EEBD0]();
}

uint64_t sub_1E0993B50()
{
  return MEMORY[0x1F40EEBD8]();
}

uint64_t sub_1E0993B60()
{
  return MEMORY[0x1F40EEBE0]();
}

uint64_t sub_1E0993B70()
{
  return MEMORY[0x1F40EEBE8]();
}

uint64_t sub_1E0993B80()
{
  return MEMORY[0x1F40EEBF0]();
}

uint64_t _s8MusicKit0A20CatalogChartsRequestV0aB8InternalE014excludeDefaultD0Sbvg_0()
{
  return MEMORY[0x1F40EEBF8]();
}

uint64_t _s8MusicKit0A20CatalogChartsRequestV0aB8InternalE014excludeDefaultD0Sbvs_0()
{
  return MEMORY[0x1F40EEC00]();
}

uint64_t _s8MusicKit0A20CatalogChartsRequestV0aB8InternalE18includeGeoLocationSbvg_0()
{
  return MEMORY[0x1F40EEC08]();
}

uint64_t _s8MusicKit0A20CatalogChartsRequestV0aB8InternalE18includeGeoLocationSbvs_0()
{
  return MEMORY[0x1F40EEC10]();
}

uint64_t sub_1E0993BD0()
{
  return MEMORY[0x1F40EEC18]();
}

uint64_t sub_1E0993BE0()
{
  return MEMORY[0x1F40EEC20]();
}

uint64_t sub_1E0993C00()
{
  return MEMORY[0x1F40EEC30]();
}

uint64_t sub_1E0993C10()
{
  return MEMORY[0x1F40EEC38]();
}

uint64_t sub_1E0993C20()
{
  return MEMORY[0x1F40EEC40]();
}

uint64_t sub_1E0993C30()
{
  return MEMORY[0x1F40EEC48]();
}

uint64_t sub_1E0993C40()
{
  return MEMORY[0x1F40EEC50]();
}

uint64_t sub_1E0993C70()
{
  return MEMORY[0x1F40EEC68]();
}

uint64_t sub_1E0993C80()
{
  return MEMORY[0x1F40EEC70]();
}

uint64_t sub_1E0993C90()
{
  return MEMORY[0x1F40EEC78]();
}

uint64_t sub_1E0993CA0()
{
  return MEMORY[0x1F40EEC80]();
}

uint64_t sub_1E0993CB0()
{
  return MEMORY[0x1F40EEC88]();
}

uint64_t sub_1E0993CC0()
{
  return MEMORY[0x1F40EEC90]();
}

uint64_t sub_1E0993CD0()
{
  return MEMORY[0x1F40EEC98]();
}

uint64_t sub_1E0993CE0()
{
  return MEMORY[0x1F40EECA0]();
}

uint64_t _s8MusicKit0A21LibrarySearchResponseV0aB8InternalE13requestedTermSSvg_0()
{
  return MEMORY[0x1F40EECA8]();
}

uint64_t sub_1E0993D00()
{
  return MEMORY[0x1F40EECB0]();
}

uint64_t sub_1E0993D10()
{
  return MEMORY[0x1F40EECB8]();
}

uint64_t sub_1E0993D20()
{
  return MEMORY[0x1F40EECC0]();
}

uint64_t sub_1E0993D30()
{
  return MEMORY[0x1F40EECC8]();
}

uint64_t sub_1E0993D40()
{
  return MEMORY[0x1F40EECD0]();
}

uint64_t sub_1E0993D50()
{
  return MEMORY[0x1F40EECD8]();
}

uint64_t sub_1E0993D60()
{
  return MEMORY[0x1F40EECE0]();
}

uint64_t sub_1E0993D70()
{
  return MEMORY[0x1F40EECE8]();
}

uint64_t sub_1E0993D80()
{
  return MEMORY[0x1F40EECF0]();
}

uint64_t sub_1E0993D90()
{
  return MEMORY[0x1F40EECF8]();
}

uint64_t sub_1E0993DA0()
{
  return MEMORY[0x1F40EED00]();
}

uint64_t sub_1E0993DB0()
{
  return MEMORY[0x1F40EED08]();
}

uint64_t sub_1E0993DC0()
{
  return MEMORY[0x1F40EED10]();
}

uint64_t sub_1E0993DD0()
{
  return MEMORY[0x1F40EED18]();
}

uint64_t sub_1E0993DE0()
{
  return MEMORY[0x1F40EED20]();
}

uint64_t sub_1E0993DF0()
{
  return MEMORY[0x1F40EED28]();
}

uint64_t sub_1E0993E00()
{
  return MEMORY[0x1F40EED30]();
}

uint64_t sub_1E0993E10()
{
  return MEMORY[0x1F40EED38]();
}

uint64_t sub_1E0993E20()
{
  return MEMORY[0x1F40EED40]();
}

uint64_t sub_1E0993E30()
{
  return MEMORY[0x1F40EED48]();
}

uint64_t sub_1E0993E40()
{
  return MEMORY[0x1F40EED50]();
}

uint64_t sub_1E0993E50()
{
  return MEMORY[0x1F40EED58]();
}

uint64_t sub_1E0993E60()
{
  return MEMORY[0x1F40EED60]();
}

uint64_t sub_1E0993E70()
{
  return MEMORY[0x1F40EED68]();
}

uint64_t sub_1E0993E80()
{
  return MEMORY[0x1F40EED70]();
}

uint64_t sub_1E0993E90()
{
  return MEMORY[0x1F40EED78]();
}

uint64_t sub_1E0993EA0()
{
  return MEMORY[0x1F40EED80]();
}

uint64_t sub_1E0993EB0()
{
  return MEMORY[0x1F40EED88]();
}

uint64_t sub_1E0993EC0()
{
  return MEMORY[0x1F40EED90]();
}

uint64_t sub_1E0993ED0()
{
  return MEMORY[0x1F40EED98]();
}

uint64_t sub_1E0993EE0()
{
  return MEMORY[0x1F40EEDA0]();
}

uint64_t sub_1E0993EF0()
{
  return MEMORY[0x1F40EEDA8]();
}

uint64_t sub_1E0993F00()
{
  return MEMORY[0x1F40EEDB0]();
}

uint64_t sub_1E0993F10()
{
  return MEMORY[0x1F40EEDB8]();
}

uint64_t sub_1E0993F20()
{
  return MEMORY[0x1F40EEDC0]();
}

uint64_t _s8MusicKit0A22CatalogResourceRequestV0aB8InternalE18prewarmForPlaybackSbvg_0()
{
  return MEMORY[0x1F40EEDC8]();
}

uint64_t _s8MusicKit0A22CatalogResourceRequestV0aB8InternalE18prewarmForPlaybackSbvs_0()
{
  return MEMORY[0x1F40EEDD0]();
}

uint64_t sub_1E0993F50()
{
  return MEMORY[0x1F40EEDD8]();
}

uint64_t sub_1E0993F60()
{
  return MEMORY[0x1F40EEDE0]();
}

uint64_t sub_1E0993F70()
{
  return MEMORY[0x1F40EEDE8]();
}

uint64_t sub_1E0993F90()
{
  return MEMORY[0x1F40EEDF8]();
}

uint64_t sub_1E0993FB0()
{
  return MEMORY[0x1F40EEE08]();
}

uint64_t sub_1E0993FC0()
{
  return MEMORY[0x1F40EEE10]();
}

uint64_t sub_1E0993FD0()
{
  return MEMORY[0x1F40EEE18]();
}

uint64_t sub_1E0993FE0()
{
  return MEMORY[0x1F40EEE20]();
}

uint64_t sub_1E0993FF0()
{
  return MEMORY[0x1F40EEE28]();
}

uint64_t sub_1E0994020()
{
  return MEMORY[0x1F40EEE40]();
}

uint64_t sub_1E0994030()
{
  return MEMORY[0x1F40EEE48]();
}

uint64_t sub_1E0994040()
{
  return MEMORY[0x1F40EEE50]();
}

uint64_t sub_1E0994050()
{
  return MEMORY[0x1F40EEE58]();
}

uint64_t sub_1E0994060()
{
  return MEMORY[0x1F40EEE60]();
}

uint64_t sub_1E0994070()
{
  return MEMORY[0x1F40EEE68]();
}

uint64_t sub_1E0994080()
{
  return MEMORY[0x1F40EEE70]();
}

uint64_t sub_1E0994090()
{
  return MEMORY[0x1F40EEE78]();
}

uint64_t sub_1E09940A0()
{
  return MEMORY[0x1F40EEE80]();
}

uint64_t sub_1E09940B0()
{
  return MEMORY[0x1F40EEE88]();
}

uint64_t sub_1E09940C0()
{
  return MEMORY[0x1F40EEE90]();
}

uint64_t sub_1E09940D0()
{
  return MEMORY[0x1F40EEE98]();
}

uint64_t sub_1E09940E0()
{
  return MEMORY[0x1F40EEEA0]();
}

uint64_t sub_1E09940F0()
{
  return MEMORY[0x1F40EEEA8]();
}

uint64_t sub_1E0994100()
{
  return MEMORY[0x1F40EEEB0]();
}

uint64_t sub_1E0994110()
{
  return MEMORY[0x1F40EEEB8]();
}

uint64_t sub_1E0994120()
{
  return MEMORY[0x1F40EEEC0]();
}

uint64_t sub_1E0994130()
{
  return MEMORY[0x1F40EEEC8]();
}

uint64_t sub_1E0994140()
{
  return MEMORY[0x1F40EEED0]();
}

uint64_t sub_1E0994150()
{
  return MEMORY[0x1F40EEED8]();
}

uint64_t sub_1E0994160()
{
  return MEMORY[0x1F40EEEE0]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE010includeNonC12AddedContentSbvg_0()
{
  return MEMORY[0x1F40EEEE8]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE010includeNonC12AddedContentSbvs_0()
{
  return MEMORY[0x1F40EEEF0]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE013wantsDetailedC8ResponseSbvg_0()
{
  return MEMORY[0x1F40EEEF8]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE013wantsDetailedC8ResponseSbvs_0()
{
  return MEMORY[0x1F40EEF00]();
}

uint64_t sub_1E09941B0()
{
  return MEMORY[0x1F40EEF08]();
}

uint64_t sub_1E09941C0()
{
  return MEMORY[0x1F40EEF10]();
}

uint64_t sub_1E09941D0()
{
  return MEMORY[0x1F40EEF18]();
}

uint64_t sub_1E09941E0()
{
  return MEMORY[0x1F40EEF20]();
}

uint64_t sub_1E09941F0()
{
  return MEMORY[0x1F40EEF28]();
}

uint64_t sub_1E0994200()
{
  return MEMORY[0x1F40EEF30]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE21excludeNonPinnedItemsSbvg_0()
{
  return MEMORY[0x1F40EEF38]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE21excludeNonPinnedItemsSbvs_0()
{
  return MEMORY[0x1F40EEF40]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE25deferIdentifierResolutionSbvg_0()
{
  return MEMORY[0x1F40EEF48]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE25deferIdentifierResolutionSbvs_0()
{
  return MEMORY[0x1F40EEF50]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE25excludeNonPinnedPlaylistsSbvg_0()
{
  return MEMORY[0x1F40EEF58]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE25excludeNonPinnedPlaylistsSbvs_0()
{
  return MEMORY[0x1F40EEF60]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE21downloadedContentOnlySbvg_0()
{
  return MEMORY[0x1F40EEF68]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE21downloadedContentOnlySbvs_0()
{
  return MEMORY[0x1F40EEF70]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE33ignoreExplicitContentRestrictionsSbvg_0()
{
  return MEMORY[0x1F40EEF78]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE33ignoreExplicitContentRestrictionsSbvs_0()
{
  return MEMORY[0x1F40EEF80]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE7libraryAA0aC0Cvg_0()
{
  return MEMORY[0x1F40EEF88]();
}

uint64_t _s8MusicKit0A23LibrarySectionedRequestV0aB8InternalE7libraryAA0aC0Cvs_0()
{
  return MEMORY[0x1F40EEF90]();
}

uint64_t sub_1E09942F0()
{
  return MEMORY[0x1F40EEFA8]();
}

uint64_t sub_1E0994300()
{
  return MEMORY[0x1F40EEFB0]();
}

uint64_t sub_1E0994310()
{
  return MEMORY[0x1F40EEFB8]();
}

uint64_t sub_1E0994320()
{
  return MEMORY[0x1F40EEFC0]();
}

uint64_t sub_1E0994330()
{
  return MEMORY[0x1F40EEFC8]();
}

uint64_t _s16MusicKitInternal0A18UserProfileRequestVACycfC_0()
{
  return MEMORY[0x1F40EEFD0]();
}

uint64_t sub_1E0994350()
{
  return MEMORY[0x1F40EEFD8]();
}

uint64_t sub_1E0994370()
{
  return MEMORY[0x1F40EEFE8]();
}

uint64_t sub_1E09943A0()
{
  return MEMORY[0x1F40EF000]();
}

uint64_t sub_1E09943B0()
{
  return MEMORY[0x1F40EF008]();
}

uint64_t sub_1E09943C0()
{
  return MEMORY[0x1F40EF010]();
}

uint64_t _s8MusicKit0A24LibrarySectionedResponseV0aB8InternalE14totalItemCountSivg_0()
{
  return MEMORY[0x1F40EF018]();
}

uint64_t sub_1E09943E0()
{
  return MEMORY[0x1F40EF020]();
}

uint64_t sub_1E09943F0()
{
  return MEMORY[0x1F40EF028]();
}

uint64_t sub_1E0994440()
{
  return MEMORY[0x1F40EF050]();
}

uint64_t sub_1E0994460()
{
  return MEMORY[0x1F40EF060]();
}

uint64_t sub_1E0994470()
{
  return MEMORY[0x1F40EF068]();
}

uint64_t sub_1E0994480()
{
  return MEMORY[0x1F40EF070]();
}

uint64_t sub_1E0994490()
{
  return MEMORY[0x1F40EF078]();
}

uint64_t sub_1E09944A0()
{
  return MEMORY[0x1F40EF080]();
}

uint64_t sub_1E09944B0()
{
  return MEMORY[0x1F40EF088]();
}

uint64_t sub_1E09944C0()
{
  return MEMORY[0x1F40EF090]();
}

uint64_t sub_1E09944D0()
{
  return MEMORY[0x1F40EF098]();
}

uint64_t sub_1E09944E0()
{
  return MEMORY[0x1F40EF0A0]();
}

uint64_t sub_1E09944F0()
{
  return MEMORY[0x1F40EF0A8]();
}

uint64_t sub_1E0994510()
{
  return MEMORY[0x1F40EF0B8]();
}

uint64_t sub_1E0994520()
{
  return MEMORY[0x1F40EF0C0]();
}

uint64_t sub_1E0994530()
{
  return MEMORY[0x1F40EF0C8]();
}

uint64_t sub_1E0994540()
{
  return MEMORY[0x1F40EF0D0]();
}

uint64_t sub_1E0994550()
{
  return MEMORY[0x1F40EF0D8]();
}

uint64_t sub_1E0994570()
{
  return MEMORY[0x1F40EF0E8]();
}

uint64_t sub_1E09945A0()
{
  return MEMORY[0x1F40EF100]();
}

uint64_t sub_1E09945B0()
{
  return MEMORY[0x1F40EF108]();
}

uint64_t sub_1E09945E0()
{
  return MEMORY[0x1F40EF120]();
}

uint64_t sub_1E09945F0()
{
  return MEMORY[0x1F40EF128]();
}

uint64_t sub_1E0994600()
{
  return MEMORY[0x1F40EF130]();
}

uint64_t sub_1E0994610()
{
  return MEMORY[0x1F40EF138]();
}

uint64_t _s8MusicKit0A32CatalogSearchSuggestionsResponseV0aB8InternalE13requestedTermSSvg_0()
{
  return MEMORY[0x1F40EF140]();
}

uint64_t sub_1E0994630()
{
  return MEMORY[0x1F40EF148]();
}

uint64_t sub_1E0994640()
{
  return MEMORY[0x1F40EF150]();
}

uint64_t sub_1E0994650()
{
  return MEMORY[0x1F40EF158]();
}

uint64_t sub_1E0994660()
{
  return MEMORY[0x1F40EF160]();
}

uint64_t sub_1E0994690()
{
  return MEMORY[0x1F40EF178]();
}

uint64_t sub_1E09946A0()
{
  return MEMORY[0x1F40EF180]();
}

uint64_t sub_1E09946B0()
{
  return MEMORY[0x1F40EF188]();
}

uint64_t sub_1E09946C0()
{
  return MEMORY[0x1F40EF190]();
}

uint64_t sub_1E09946D0()
{
  return MEMORY[0x1F40EF198]();
}

uint64_t sub_1E09946E0()
{
  return MEMORY[0x1F40EF1A0]();
}

uint64_t sub_1E09946F0()
{
  return MEMORY[0x1F40EF1A8]();
}

uint64_t sub_1E0994700()
{
  return MEMORY[0x1F40EF1B0]();
}

uint64_t sub_1E0994710()
{
  return MEMORY[0x1F40EF1B8]();
}

uint64_t sub_1E0994720()
{
  return MEMORY[0x1F40EF1C0]();
}

uint64_t sub_1E0994730()
{
  return MEMORY[0x1F40EF1C8]();
}

uint64_t sub_1E0994740()
{
  return MEMORY[0x1F40EF1D0]();
}

uint64_t sub_1E0994750()
{
  return MEMORY[0x1F40EF1D8]();
}

uint64_t sub_1E0994760()
{
  return MEMORY[0x1F40EF1E0]();
}

uint64_t sub_1E0994770()
{
  return MEMORY[0x1F40EF1E8]();
}

uint64_t sub_1E0994780()
{
  return MEMORY[0x1F40EF1F0]();
}

uint64_t sub_1E0994790()
{
  return MEMORY[0x1F40EF1F8]();
}

uint64_t sub_1E09947A0()
{
  return MEMORY[0x1F40EF200]();
}

uint64_t sub_1E09947B0()
{
  return MEMORY[0x1F40EF208]();
}

uint64_t sub_1E09947C0()
{
  return MEMORY[0x1F40EF210]();
}

uint64_t sub_1E09947D0()
{
  return MEMORY[0x1F40EF218]();
}

uint64_t sub_1E09947E0()
{
  return MEMORY[0x1F40EF220]();
}

uint64_t sub_1E0994830()
{
  return MEMORY[0x1F40EF248]();
}

uint64_t sub_1E0994840()
{
  return MEMORY[0x1F40EF250]();
}

uint64_t sub_1E0994850()
{
  return MEMORY[0x1F40EF258]();
}

uint64_t sub_1E0994870()
{
  return MEMORY[0x1F40EF268]();
}

uint64_t _s8MusicKit0A5VideoV0aB8InternalE14pickerSubtitleSSSgvg_0()
{
  return MEMORY[0x1F40EF270]();
}

uint64_t sub_1E0994890()
{
  return MEMORY[0x1F40EF278]();
}

uint64_t sub_1E09948A0()
{
  return MEMORY[0x1F40EF280]();
}

uint64_t sub_1E09948B0()
{
  return MEMORY[0x1F40EF288]();
}

uint64_t _s8MusicKit0A5VideoV0aB8InternalE12customLyricsSSSgvg_0()
{
  return MEMORY[0x1F40EF290]();
}

uint64_t _s8MusicKit0A5VideoV0aB8InternalE12immersiveURL10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40EF298]();
}

uint64_t sub_1E09948E0()
{
  return MEMORY[0x1F40EF2A0]();
}

uint64_t sub_1E09948F0()
{
  return MEMORY[0x1F40EF2A8]();
}

uint64_t _s8MusicKit0A5VideoV0aB8InternalE13favoritedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40EF2B0]();
}

uint64_t sub_1E0994910()
{
  return MEMORY[0x1F40EF2B8]();
}

uint64_t sub_1E0994920()
{
  return MEMORY[0x1F40EF2C0]();
}

uint64_t sub_1E0994930()
{
  return MEMORY[0x1F40EF2C8]();
}

uint64_t sub_1E0994940()
{
  return MEMORY[0x1F40EF2D0]();
}

uint64_t _s8MusicKit0A5VideoV0aB8InternalE15hasCustomLyricsSbvg_0()
{
  return MEMORY[0x1F40EF2D8]();
}

uint64_t sub_1E0994960()
{
  return MEMORY[0x1F40EF2E0]();
}

uint64_t sub_1E0994970()
{
  return MEMORY[0x1F40EF2E8]();
}

uint64_t sub_1E0994980()
{
  return MEMORY[0x1F40EF2F0]();
}

uint64_t sub_1E0994990()
{
  return MEMORY[0x1F40EF2F8]();
}

uint64_t sub_1E09949A0()
{
  return MEMORY[0x1F40EF300]();
}

uint64_t sub_1E09949B0()
{
  return MEMORY[0x1F40EF308]();
}

uint64_t sub_1E09949C0()
{
  return MEMORY[0x1F40EF310]();
}

uint64_t sub_1E09949D0()
{
  return MEMORY[0x1F40EF318]();
}

uint64_t sub_1E09949E0()
{
  return MEMORY[0x1F40EF320]();
}

uint64_t sub_1E09949F0()
{
  return MEMORY[0x1F40EF328]();
}

uint64_t sub_1E0994A00()
{
  return MEMORY[0x1F40EF330]();
}

uint64_t _s8MusicKit0A5VideoV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40EF338]();
}

uint64_t sub_1E0994A20()
{
  return MEMORY[0x1F40EF340]();
}

uint64_t sub_1E0994A30()
{
  return MEMORY[0x1F40EF348]();
}

uint64_t sub_1E0994A40()
{
  return MEMORY[0x1F40EF350]();
}

uint64_t sub_1E0994A50()
{
  return MEMORY[0x1F40EF358]();
}

uint64_t sub_1E0994A60()
{
  return MEMORY[0x1F40EF360]();
}

uint64_t sub_1E0994A70()
{
  return MEMORY[0x1F40EF368]();
}

uint64_t sub_1E0994A80()
{
  return MEMORY[0x1F40EF370]();
}

uint64_t sub_1E0994A90()
{
  return MEMORY[0x1F40EF378]();
}

uint64_t sub_1E0994AA0()
{
  return MEMORY[0x1F40EF380]();
}

uint64_t sub_1E0994AB0()
{
  return MEMORY[0x1F40EF388]();
}

uint64_t sub_1E0994AC0()
{
  return MEMORY[0x1F40EF390]();
}

uint64_t sub_1E0994AD0()
{
  return MEMORY[0x1F40EF398]();
}

uint64_t sub_1E0994AE0()
{
  return MEMORY[0x1F40EF3A0]();
}

uint64_t _s8MusicKit0A6PlayerC5QueueC0aB8InternalE23playActivityFeatureNameSSSgvg_0()
{
  return MEMORY[0x1F40EF3B0]();
}

uint64_t _s8MusicKit0A6PlayerC5QueueC0aB8InternalE23playActivityFeatureNameSSSgvs_0()
{
  return MEMORY[0x1F40EF3B8]();
}

uint64_t _s8MusicKit0A6PlayerC5QueueC0aB8InternalE30playActivityRecommendationData10Foundation0I0VSgvg_0()
{
  return MEMORY[0x1F40EF3C0]();
}

uint64_t _s8MusicKit0A6PlayerC5QueueC0aB8InternalE30playActivityRecommendationData10Foundation0I0VSgvs_0()
{
  return MEMORY[0x1F40EF3C8]();
}

uint64_t sub_1E0994B30()
{
  return MEMORY[0x1F40EF3D8]();
}

uint64_t sub_1E0994B40()
{
  return MEMORY[0x1F40EF3E0]();
}

uint64_t sub_1E0994B50()
{
  return MEMORY[0x1F40EF3E8]();
}

uint64_t _s8MusicKit0A7LibraryC0aB8InternalE10disconnectyyF_0()
{
  return MEMORY[0x1F40EF3F0]();
}

uint64_t sub_1E0994B70()
{
  return MEMORY[0x1F40EF3F8]();
}

uint64_t sub_1E0994B80()
{
  return MEMORY[0x1F40EF400]();
}

uint64_t _s8MusicKit0A7LibraryC0aB8InternalE2idSSvg_0()
{
  return MEMORY[0x1F40EF408]();
}

uint64_t sub_1E0994BA0()
{
  return MEMORY[0x1F40EF410]();
}

uint64_t sub_1E0994BB0()
{
  return MEMORY[0x1F40EF418]();
}

uint64_t sub_1E0994BC0()
{
  return MEMORY[0x1F40EF420]();
}

uint64_t sub_1E0994BD0()
{
  return MEMORY[0x1F40EF428]();
}

uint64_t sub_1E0994BE0()
{
  return MEMORY[0x1F40EF430]();
}

uint64_t sub_1E0994BF0()
{
  return MEMORY[0x1F40EF438]();
}

uint64_t sub_1E0994C00()
{
  return MEMORY[0x1F40EF440]();
}

uint64_t sub_1E0994C10()
{
  return MEMORY[0x1F40EF448]();
}

uint64_t _s8MusicKit0A7LibraryC0aB8InternalE4nameSSvg_0()
{
  return MEMORY[0x1F40EF450]();
}

uint64_t _s8MusicKit0A7LibraryC0aB8InternalE6deviceACvgZ_0()
{
  return MEMORY[0x1F40EF458]();
}

uint64_t _s8MusicKit0A7LibraryC0aB8InternalE4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x1F40EF460]();
}

uint64_t sub_1E0994C50()
{
  return MEMORY[0x1F40EF468]();
}

uint64_t sub_1E0994C60()
{
  return MEMORY[0x1F40EF470]();
}

uint64_t sub_1E0994C70()
{
  return MEMORY[0x1F40EF478]();
}

uint64_t sub_1E0994C80()
{
  return MEMORY[0x1F40EF480]();
}

uint64_t sub_1E0994C90()
{
  return MEMORY[0x1F40EF488]();
}

uint64_t sub_1E0994CA0()
{
  return MEMORY[0x1F40EF490]();
}

uint64_t sub_1E0994CB0()
{
  return MEMORY[0x1F40EF498]();
}

uint64_t sub_1E0994CC0()
{
  return MEMORY[0x1F40EF4A0]();
}

uint64_t sub_1E0994CD0()
{
  return MEMORY[0x1F40EF4A8]();
}

uint64_t sub_1E0994CE0()
{
  return MEMORY[0x1F40EF4B0]();
}

uint64_t sub_1E0994CF0()
{
  return MEMORY[0x1F40EF4B8]();
}

uint64_t sub_1E0994D00()
{
  return MEMORY[0x1F40EF4C0]();
}

uint64_t sub_1E0994D10()
{
  return MEMORY[0x1F40EF4C8]();
}

uint64_t sub_1E0994D20()
{
  return MEMORY[0x1F40EF4D0]();
}

uint64_t sub_1E0994D30()
{
  return MEMORY[0x1F40EF4D8]();
}

uint64_t sub_1E0994D40()
{
  return MEMORY[0x1F40EF4E0]();
}

uint64_t sub_1E0994D50()
{
  return MEMORY[0x1F40EF4E8]();
}

uint64_t sub_1E0994D60()
{
  return MEMORY[0x1F40EF4F0]();
}

uint64_t sub_1E0994D70()
{
  return MEMORY[0x1F40EF4F8]();
}

uint64_t sub_1E0994D80()
{
  return MEMORY[0x1F40EF500]();
}

uint64_t sub_1E0994D90()
{
  return MEMORY[0x1F40EF508]();
}

uint64_t sub_1E0994DA0()
{
  return MEMORY[0x1F40EF510]();
}

uint64_t sub_1E0994DB0()
{
  return MEMORY[0x1F40EF518]();
}

uint64_t sub_1E0994DC0()
{
  return MEMORY[0x1F40EF520]();
}

uint64_t sub_1E0994DD0()
{
  return MEMORY[0x1F40EF528]();
}

uint64_t sub_1E0994DE0()
{
  return MEMORY[0x1F40EF530]();
}

uint64_t sub_1E0994DF0()
{
  return MEMORY[0x1F40EF538]();
}

uint64_t sub_1E0994E00()
{
  return MEMORY[0x1F40EF540]();
}

uint64_t sub_1E0994E10()
{
  return MEMORY[0x1F40EF548]();
}

uint64_t sub_1E0994E20()
{
  return MEMORY[0x1F40EF550]();
}

uint64_t sub_1E0994E30()
{
  return MEMORY[0x1F40EF558]();
}

uint64_t sub_1E0994E40()
{
  return MEMORY[0x1F40EF560]();
}

uint64_t sub_1E0994E50()
{
  return MEMORY[0x1F40EF568]();
}

uint64_t sub_1E0994E60()
{
  return MEMORY[0x1F40EF570]();
}

uint64_t sub_1E0994E70()
{
  return MEMORY[0x1F40EF578]();
}

uint64_t sub_1E0994E80()
{
  return MEMORY[0x1F40EF580]();
}

uint64_t sub_1E0994E90()
{
  return MEMORY[0x1F40EF588]();
}

uint64_t sub_1E0994EA0()
{
  return MEMORY[0x1F40EF590]();
}

uint64_t sub_1E0994EB0()
{
  return MEMORY[0x1F40EF598]();
}

uint64_t sub_1E0994EC0()
{
  return MEMORY[0x1F40EF5A0]();
}

uint64_t sub_1E0994ED0()
{
  return MEMORY[0x1F40EF5A8]();
}

uint64_t sub_1E0994EE0()
{
  return MEMORY[0x1F40EF5B0]();
}

uint64_t sub_1E0994EF0()
{
  return MEMORY[0x1F40EF5B8]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE22catalogSearchableTypesSayAA12ResourceTypeVGvgZ_0()
{
  return MEMORY[0x1F40EF5C0]();
}

uint64_t sub_1E0994F10()
{
  return MEMORY[0x1F40EF5C8]();
}

uint64_t sub_1E0994F20()
{
  return MEMORY[0x1F40EF5D0]();
}

uint64_t sub_1E0994F30()
{
  return MEMORY[0x1F40EF5D8]();
}

uint64_t sub_1E0994F40()
{
  return MEMORY[0x1F40EF5E0]();
}

uint64_t sub_1E0994F50()
{
  return MEMORY[0x1F40EF5E8]();
}

uint64_t sub_1E0994F60()
{
  return MEMORY[0x1F40EF5F0]();
}

uint64_t sub_1E0994F70()
{
  return MEMORY[0x1F40EF5F8]();
}

uint64_t sub_1E0994F80()
{
  return MEMORY[0x1F40EF600]();
}

uint64_t sub_1E0994F90()
{
  return MEMORY[0x1F40EF608]();
}

uint64_t sub_1E0994FA0()
{
  return MEMORY[0x1F40EF610]();
}

uint64_t sub_1E0994FB0()
{
  return MEMORY[0x1F40EF618]();
}

uint64_t sub_1E0994FC0()
{
  return MEMORY[0x1F40EF620]();
}

uint64_t sub_1E0994FD0()
{
  return MEMORY[0x1F40EF628]();
}

uint64_t sub_1E0994FE0()
{
  return MEMORY[0x1F40EF630]();
}

uint64_t sub_1E0994FF0()
{
  return MEMORY[0x1F40EF638]();
}

uint64_t sub_1E0995000()
{
  return MEMORY[0x1F40EF640]();
}

uint64_t sub_1E0995010()
{
  return MEMORY[0x1F40EF648]();
}

uint64_t sub_1E0995020()
{
  return MEMORY[0x1F40EF650]();
}

uint64_t sub_1E0995030()
{
  return MEMORY[0x1F40EF658]();
}

uint64_t sub_1E0995040()
{
  return MEMORY[0x1F40EF660]();
}

uint64_t sub_1E0995050()
{
  return MEMORY[0x1F40EF668]();
}

uint64_t sub_1E0995060()
{
  return MEMORY[0x1F40EF670]();
}

uint64_t sub_1E0995070()
{
  return MEMORY[0x1F40EF678]();
}

uint64_t sub_1E0995080()
{
  return MEMORY[0x1F40EF680]();
}

uint64_t sub_1E0995090()
{
  return MEMORY[0x1F40EF688]();
}

uint64_t sub_1E09950A0()
{
  return MEMORY[0x1F40EF690]();
}

uint64_t sub_1E09950B0()
{
  return MEMORY[0x1F40EF698]();
}

uint64_t sub_1E09950C0()
{
  return MEMORY[0x1F40EF6A0]();
}

uint64_t sub_1E09950D0()
{
  return MEMORY[0x1F40EF6A8]();
}

uint64_t sub_1E09950E0()
{
  return MEMORY[0x1F40EF6B0]();
}

uint64_t sub_1E09950F0()
{
  return MEMORY[0x1F40EF6B8]();
}

uint64_t sub_1E0995100()
{
  return MEMORY[0x1F40EF6C0]();
}

uint64_t sub_1E0995110()
{
  return MEMORY[0x1F40EF6C8]();
}

uint64_t sub_1E0995120()
{
  return MEMORY[0x1F40EF6D0]();
}

uint64_t sub_1E0995130()
{
  return MEMORY[0x1F40EF6D8]();
}

uint64_t sub_1E0995140()
{
  return MEMORY[0x1F40EF6E0]();
}

uint64_t sub_1E0995150()
{
  return MEMORY[0x1F40EF6E8]();
}

uint64_t sub_1E0995160()
{
  return MEMORY[0x1F40EF6F0]();
}

uint64_t sub_1E0995170()
{
  return MEMORY[0x1F40EF6F8]();
}

uint64_t sub_1E0995180()
{
  return MEMORY[0x1F40EF700]();
}

uint64_t sub_1E0995190()
{
  return MEMORY[0x1F40EF708]();
}

uint64_t sub_1E09951A0()
{
  return MEMORY[0x1F40EF710]();
}

uint64_t sub_1E09951B0()
{
  return MEMORY[0x1F40EF718]();
}

uint64_t sub_1E09951C0()
{
  return MEMORY[0x1F40EF720]();
}

uint64_t sub_1E09951D0()
{
  return MEMORY[0x1F40EF728]();
}

uint64_t sub_1E09951E0()
{
  return MEMORY[0x1F40EF730]();
}

uint64_t sub_1E09951F0()
{
  return MEMORY[0x1F40EF738]();
}

uint64_t sub_1E0995200()
{
  return MEMORY[0x1F40EF740]();
}

uint64_t sub_1E0995210()
{
  return MEMORY[0x1F40EF748]();
}

uint64_t sub_1E0995220()
{
  return MEMORY[0x1F40EF750]();
}

uint64_t sub_1E0995230()
{
  return MEMORY[0x1F40EF758]();
}

uint64_t sub_1E0995240()
{
  return MEMORY[0x1F40EF760]();
}

uint64_t sub_1E0995250()
{
  return MEMORY[0x1F40EF768]();
}

uint64_t sub_1E0995260()
{
  return MEMORY[0x1F40EF770]();
}

uint64_t sub_1E0995270()
{
  return MEMORY[0x1F40EF778]();
}

uint64_t sub_1E0995280()
{
  return MEMORY[0x1F40EF780]();
}

uint64_t sub_1E0995290()
{
  return MEMORY[0x1F40EF788]();
}

uint64_t sub_1E09952A0()
{
  return MEMORY[0x1F40EF790]();
}

uint64_t sub_1E09952B0()
{
  return MEMORY[0x1F40EF798]();
}

uint64_t sub_1E09952C0()
{
  return MEMORY[0x1F40EF7A0]();
}

uint64_t sub_1E09952D0()
{
  return MEMORY[0x1F40EF7A8]();
}

uint64_t sub_1E09952E0()
{
  return MEMORY[0x1F40EF7B0]();
}

uint64_t sub_1E09952F0()
{
  return MEMORY[0x1F40EF7B8]();
}

uint64_t sub_1E0995300()
{
  return MEMORY[0x1F40EF7C0]();
}

uint64_t sub_1E0995310()
{
  return MEMORY[0x1F40EF7C8]();
}

uint64_t sub_1E0995320()
{
  return MEMORY[0x1F40EF7D0]();
}

uint64_t sub_1E0995330()
{
  return MEMORY[0x1F40EF7D8]();
}

uint64_t sub_1E0995340()
{
  return MEMORY[0x1F40EF7E0]();
}

uint64_t sub_1E0995350()
{
  return MEMORY[0x1F40EF7E8]();
}

uint64_t sub_1E0995360()
{
  return MEMORY[0x1F40EF7F0]();
}

uint64_t sub_1E0995370()
{
  return MEMORY[0x1F40EF7F8]();
}

uint64_t sub_1E0995380()
{
  return MEMORY[0x1F40EF800]();
}

uint64_t sub_1E0995390()
{
  return MEMORY[0x1F40EF808]();
}

uint64_t sub_1E09953A0()
{
  return MEMORY[0x1F40EF810]();
}

uint64_t sub_1E09953B0()
{
  return MEMORY[0x1F40EF818]();
}

uint64_t sub_1E09953C0()
{
  return MEMORY[0x1F40EF820]();
}

uint64_t sub_1E09953D0()
{
  return MEMORY[0x1F40EF828]();
}

uint64_t sub_1E09953E0()
{
  return MEMORY[0x1F40EF830]();
}

uint64_t _s8MusicKit11RecordLabelV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40EF838]();
}

uint64_t sub_1E0995400()
{
  return MEMORY[0x1F40EF840]();
}

uint64_t sub_1E0995410()
{
  return MEMORY[0x1F40EF848]();
}

uint64_t sub_1E0995420()
{
  return MEMORY[0x1F40EF850]();
}

uint64_t sub_1E0995430()
{
  return MEMORY[0x1F40EF858]();
}

uint64_t sub_1E0995440()
{
  return MEMORY[0x1F40EF860]();
}

uint64_t sub_1E0995450()
{
  return MEMORY[0x1F40EF868]();
}

uint64_t sub_1E0995460()
{
  return MEMORY[0x1F40EF870]();
}

uint64_t sub_1E0995470()
{
  return MEMORY[0x1F40EF878]();
}

uint64_t sub_1E0995480()
{
  return MEMORY[0x1F40EF880]();
}

uint64_t sub_1E0995490()
{
  return MEMORY[0x1F40EF888]();
}

uint64_t sub_1E09954A0()
{
  return MEMORY[0x1F40EF890]();
}

uint64_t sub_1E09954B0()
{
  return MEMORY[0x1F40EF898]();
}

uint64_t sub_1E09954C0()
{
  return MEMORY[0x1F40EF8A0]();
}

uint64_t sub_1E09954D0()
{
  return MEMORY[0x1F40EF8A8]();
}

uint64_t sub_1E09954E0()
{
  return MEMORY[0x1F40EF8B0]();
}

uint64_t sub_1E09954F0()
{
  return MEMORY[0x1F40EF8B8]();
}

uint64_t sub_1E0995500()
{
  return MEMORY[0x1F40EF8C0]();
}

uint64_t sub_1E0995510()
{
  return MEMORY[0x1F40EF8C8]();
}

uint64_t sub_1E0995520()
{
  return MEMORY[0x1F40EF8D0]();
}

uint64_t sub_1E0995530()
{
  return MEMORY[0x1F40EF8D8]();
}

uint64_t sub_1E0995540()
{
  return MEMORY[0x1F40EF8E0]();
}

uint64_t sub_1E0995550()
{
  return MEMORY[0x1F40EF8E8]();
}

uint64_t sub_1E0995560()
{
  return MEMORY[0x1F40EF8F0]();
}

uint64_t sub_1E0995570()
{
  return MEMORY[0x1F40EF8F8]();
}

uint64_t sub_1E0995580()
{
  return MEMORY[0x1F40EF900]();
}

uint64_t sub_1E0995590()
{
  return MEMORY[0x1F40EF908]();
}

uint64_t sub_1E09955A0()
{
  return MEMORY[0x1F40EF910]();
}

uint64_t sub_1E09955B0()
{
  return MEMORY[0x1F40EF918]();
}

uint64_t sub_1E09955C0()
{
  return MEMORY[0x1F40EF920]();
}

uint64_t sub_1E09955D0()
{
  return MEMORY[0x1F40EF928]();
}

uint64_t sub_1E09955E0()
{
  return MEMORY[0x1F40EF930]();
}

uint64_t sub_1E09955F0()
{
  return MEMORY[0x1F40EF938]();
}

uint64_t sub_1E0995600()
{
  return MEMORY[0x1F40EF940]();
}

uint64_t sub_1E0995610()
{
  return MEMORY[0x1F40EF948]();
}

uint64_t sub_1E0995620()
{
  return MEMORY[0x1F40EF950]();
}

uint64_t sub_1E0995630()
{
  return MEMORY[0x1F40EF958]();
}

uint64_t sub_1E0995640()
{
  return MEMORY[0x1F40EF960]();
}

uint64_t sub_1E0995650()
{
  return MEMORY[0x1F40EF968]();
}

uint64_t sub_1E0995660()
{
  return MEMORY[0x1F40EF970]();
}

uint64_t sub_1E0995670()
{
  return MEMORY[0x1F40EF978]();
}

uint64_t sub_1E0995680()
{
  return MEMORY[0x1F40EF980]();
}

uint64_t sub_1E0995690()
{
  return MEMORY[0x1F40EF988]();
}

uint64_t sub_1E09956A0()
{
  return MEMORY[0x1F40EF990]();
}

uint64_t sub_1E09956B0()
{
  return MEMORY[0x1F40EF998]();
}

uint64_t sub_1E09956C0()
{
  return MEMORY[0x1F40EF9A0]();
}

uint64_t sub_1E09956D0()
{
  return MEMORY[0x1F40EF9A8]();
}

uint64_t sub_1E09956E0()
{
  return MEMORY[0x1F40EF9B0]();
}

uint64_t sub_1E09956F0()
{
  return MEMORY[0x1F40EF9B8]();
}

uint64_t sub_1E0995700()
{
  return MEMORY[0x1F40EF9C0]();
}

uint64_t sub_1E0995710()
{
  return MEMORY[0x1F40EF9C8]();
}

uint64_t sub_1E0995720()
{
  return MEMORY[0x1F40EF9D0]();
}

uint64_t sub_1E0995730()
{
  return MEMORY[0x1F40EF9D8]();
}

uint64_t sub_1E0995740()
{
  return MEMORY[0x1F40EF9E0]();
}

uint64_t sub_1E0995750()
{
  return MEMORY[0x1F40EF9E8]();
}

uint64_t sub_1E0995760()
{
  return MEMORY[0x1F40EF9F0]();
}

uint64_t sub_1E0995770()
{
  return MEMORY[0x1F40EF9F8]();
}

uint64_t sub_1E0995780()
{
  return MEMORY[0x1F40EFA00]();
}

uint64_t sub_1E0995790()
{
  return MEMORY[0x1F40EFA08]();
}

uint64_t sub_1E09957A0()
{
  return MEMORY[0x1F40EFA10]();
}

uint64_t sub_1E09957B0()
{
  return MEMORY[0x1F40EFA18]();
}

uint64_t sub_1E09957C0()
{
  return MEMORY[0x1F40EFA20]();
}

uint64_t sub_1E09957D0()
{
  return MEMORY[0x1F40EFA28]();
}

uint64_t sub_1E09957E0()
{
  return MEMORY[0x1F40EFA30]();
}

uint64_t sub_1E09957F0()
{
  return MEMORY[0x1F40EFA38]();
}

uint64_t sub_1E0995800()
{
  return MEMORY[0x1F40EFA40]();
}

uint64_t sub_1E0995810()
{
  return MEMORY[0x1F40EFA48]();
}

uint64_t sub_1E0995820()
{
  return MEMORY[0x1F40EFA50]();
}

uint64_t sub_1E0995830()
{
  return MEMORY[0x1F40EFA58]();
}

uint64_t sub_1E0995840()
{
  return MEMORY[0x1F40EFA60]();
}

uint64_t sub_1E0995850()
{
  return MEMORY[0x1F40EFA68]();
}

uint64_t sub_1E0995860()
{
  return MEMORY[0x1F40EFA70]();
}

uint64_t sub_1E0995870()
{
  return MEMORY[0x1F40EFA78]();
}

uint64_t sub_1E0995880()
{
  return MEMORY[0x1F40EFA80]();
}

uint64_t sub_1E0995890()
{
  return MEMORY[0x1F40EFA88]();
}

uint64_t sub_1E09958A0()
{
  return MEMORY[0x1F40EFA90]();
}

uint64_t sub_1E09958B0()
{
  return MEMORY[0x1F40EFA98]();
}

uint64_t sub_1E09958C0()
{
  return MEMORY[0x1F40EFAA0]();
}

uint64_t sub_1E09958D0()
{
  return MEMORY[0x1F40EFAA8]();
}

uint64_t sub_1E09958E0()
{
  return MEMORY[0x1F40EFAB0]();
}

uint64_t sub_1E09958F0()
{
  return MEMORY[0x1F40EFAB8]();
}

uint64_t sub_1E0995900()
{
  return MEMORY[0x1F40EFAC0]();
}

uint64_t sub_1E0995910()
{
  return MEMORY[0x1F40EFAC8]();
}

uint64_t sub_1E0995920()
{
  return MEMORY[0x1F40EFAD0]();
}

uint64_t sub_1E0995930()
{
  return MEMORY[0x1F40EFAD8]();
}

uint64_t sub_1E0995940()
{
  return MEMORY[0x1F40EFAE0]();
}

uint64_t sub_1E0995950()
{
  return MEMORY[0x1F40EFAE8]();
}

uint64_t sub_1E0995960()
{
  return MEMORY[0x1F40EFAF0]();
}

uint64_t sub_1E0995970()
{
  return MEMORY[0x1F40EFAF8]();
}

uint64_t sub_1E0995980()
{
  return MEMORY[0x1F40EFB00]();
}

uint64_t sub_1E0995990()
{
  return MEMORY[0x1F40EFB08]();
}

uint64_t sub_1E09959A0()
{
  return MEMORY[0x1F40EFB10]();
}

uint64_t sub_1E09959B0()
{
  return MEMORY[0x1F40EFB18]();
}

uint64_t sub_1E09959C0()
{
  return MEMORY[0x1F40EFB20]();
}

uint64_t sub_1E09959D0()
{
  return MEMORY[0x1F40EFB28]();
}

uint64_t sub_1E09959E0()
{
  return MEMORY[0x1F40EFB30]();
}

uint64_t sub_1E09959F0()
{
  return MEMORY[0x1F40EFB38]();
}

uint64_t sub_1E0995A00()
{
  return MEMORY[0x1F40EFB40]();
}

uint64_t sub_1E0995A10()
{
  return MEMORY[0x1F40EFB48]();
}

uint64_t sub_1E0995A20()
{
  return MEMORY[0x1F40EFB50]();
}

uint64_t sub_1E0995A30()
{
  return MEMORY[0x1F40EFB58]();
}

uint64_t sub_1E0995A40()
{
  return MEMORY[0x1F40EFB60]();
}

uint64_t sub_1E0995A50()
{
  return MEMORY[0x1F40EFB68]();
}

uint64_t sub_1E0995A60()
{
  return MEMORY[0x1F40EFB70]();
}

uint64_t sub_1E0995A70()
{
  return MEMORY[0x1F40EFB78]();
}

uint64_t sub_1E0995A80()
{
  return MEMORY[0x1F40EFB80]();
}

uint64_t sub_1E0995A90()
{
  return MEMORY[0x1F40EFB88]();
}

uint64_t sub_1E0995AA0()
{
  return MEMORY[0x1F40EFB90]();
}

uint64_t sub_1E0995AB0()
{
  return MEMORY[0x1F40EFB98]();
}

uint64_t sub_1E0995AC0()
{
  return MEMORY[0x1F40EFBA0]();
}

uint64_t sub_1E0995AD0()
{
  return MEMORY[0x1F40EFBA8]();
}

uint64_t sub_1E0995AE0()
{
  return MEMORY[0x1F40EFBB0]();
}

uint64_t sub_1E0995AF0()
{
  return MEMORY[0x1F40EFBB8]();
}

uint64_t sub_1E0995B00()
{
  return MEMORY[0x1F40EFBC0]();
}

uint64_t sub_1E0995B10()
{
  return MEMORY[0x1F40EFBC8]();
}

uint64_t sub_1E0995B20()
{
  return MEMORY[0x1F40EFBD0]();
}

uint64_t sub_1E0995B30()
{
  return MEMORY[0x1F40EFBD8]();
}

uint64_t sub_1E0995B40()
{
  return MEMORY[0x1F40EFBE0]();
}

uint64_t sub_1E0995B50()
{
  return MEMORY[0x1F40EFBE8]();
}

uint64_t sub_1E0995B60()
{
  return MEMORY[0x1F40EFBF0]();
}

uint64_t sub_1E0995B70()
{
  return MEMORY[0x1F40EFBF8]();
}

uint64_t sub_1E0995B80()
{
  return MEMORY[0x1F40EFC00]();
}

uint64_t sub_1E0995B90()
{
  return MEMORY[0x1F40EFC08]();
}

uint64_t sub_1E0995BA0()
{
  return MEMORY[0x1F40EFC10]();
}

uint64_t sub_1E0995BB0()
{
  return MEMORY[0x1F40EFC18]();
}

uint64_t sub_1E0995BC0()
{
  return MEMORY[0x1F40EFC20]();
}

uint64_t sub_1E0995BD0()
{
  return MEMORY[0x1F40EFC28]();
}

uint64_t sub_1E0995BE0()
{
  return MEMORY[0x1F40EFC30]();
}

uint64_t sub_1E0995BF0()
{
  return MEMORY[0x1F40EFC38]();
}

uint64_t sub_1E0995C00()
{
  return MEMORY[0x1F40EFC40]();
}

uint64_t sub_1E0995C10()
{
  return MEMORY[0x1F40EFC48]();
}

uint64_t sub_1E0995C20()
{
  return MEMORY[0x1F40EFC50]();
}

uint64_t sub_1E0995C30()
{
  return MEMORY[0x1F40EFC58]();
}

uint64_t sub_1E0995C40()
{
  return MEMORY[0x1F40EFC60]();
}

uint64_t sub_1E0995C50()
{
  return MEMORY[0x1F40EFC68]();
}

uint64_t sub_1E0995C60()
{
  return MEMORY[0x1F40EFC70]();
}

uint64_t sub_1E0995C70()
{
  return MEMORY[0x1F40EFC78]();
}

uint64_t sub_1E0995C80()
{
  return MEMORY[0x1F40EFC80]();
}

uint64_t sub_1E0995C90()
{
  return MEMORY[0x1F40EFC88]();
}

uint64_t sub_1E0995CA0()
{
  return MEMORY[0x1F40EFC90]();
}

uint64_t sub_1E0995CB0()
{
  return MEMORY[0x1F40EFC98]();
}

uint64_t sub_1E0995CC0()
{
  return MEMORY[0x1F40EFCA0]();
}

uint64_t sub_1E0995CD0()
{
  return MEMORY[0x1F40EFCA8]();
}

uint64_t sub_1E0995CE0()
{
  return MEMORY[0x1F40EFCB0]();
}

uint64_t sub_1E0995CF0()
{
  return MEMORY[0x1F40EFCB8]();
}

uint64_t sub_1E0995D00()
{
  return MEMORY[0x1F40EFCC0]();
}

uint64_t sub_1E0995D10()
{
  return MEMORY[0x1F40EFCC8]();
}

uint64_t sub_1E0995D20()
{
  return MEMORY[0x1F40EFCD0]();
}

uint64_t sub_1E0995D30()
{
  return MEMORY[0x1F40EFCD8]();
}

uint64_t sub_1E0995D40()
{
  return MEMORY[0x1F40EFCE0]();
}

uint64_t sub_1E0995D50()
{
  return MEMORY[0x1F40EFCE8]();
}

uint64_t sub_1E0995D60()
{
  return MEMORY[0x1F40EFCF0]();
}

uint64_t sub_1E0995D70()
{
  return MEMORY[0x1F40EFCF8]();
}

uint64_t sub_1E0995D80()
{
  return MEMORY[0x1F40EFD00]();
}

uint64_t sub_1E0995D90()
{
  return MEMORY[0x1F40EFD08]();
}

uint64_t sub_1E0995DA0()
{
  return MEMORY[0x1F40EFD10]();
}

uint64_t sub_1E0995DB0()
{
  return MEMORY[0x1F40EFD18]();
}

uint64_t sub_1E0995DC0()
{
  return MEMORY[0x1F40EFD20]();
}

uint64_t sub_1E0995DD0()
{
  return MEMORY[0x1F40EFD28]();
}

uint64_t sub_1E0995DE0()
{
  return MEMORY[0x1F40EFD30]();
}

uint64_t sub_1E0995DF0()
{
  return MEMORY[0x1F40EFD38]();
}

uint64_t sub_1E0995E00()
{
  return MEMORY[0x1F40EFD40]();
}

uint64_t sub_1E0995E10()
{
  return MEMORY[0x1F40EFD48]();
}

uint64_t sub_1E0995E20()
{
  return MEMORY[0x1F40EFD50]();
}

uint64_t sub_1E0995E30()
{
  return MEMORY[0x1F40EFD58]();
}

uint64_t sub_1E0995E40()
{
  return MEMORY[0x1F40EFD60]();
}

uint64_t sub_1E0995E50()
{
  return MEMORY[0x1F40EFD68]();
}

uint64_t sub_1E0995E60()
{
  return MEMORY[0x1F40EFD70]();
}

uint64_t sub_1E0995E70()
{
  return MEMORY[0x1F40EFD78]();
}

uint64_t sub_1E0995E80()
{
  return MEMORY[0x1F40EFD80]();
}

uint64_t sub_1E0995E90()
{
  return MEMORY[0x1F40EFD88]();
}

uint64_t sub_1E0995EA0()
{
  return MEMORY[0x1F40EFD90]();
}

uint64_t sub_1E0995EB0()
{
  return MEMORY[0x1F40EFD98]();
}

uint64_t sub_1E0995EC0()
{
  return MEMORY[0x1F40EFDA0]();
}

uint64_t sub_1E0995ED0()
{
  return MEMORY[0x1F40EFDA8]();
}

uint64_t sub_1E0995EE0()
{
  return MEMORY[0x1F40EFDB0]();
}

uint64_t sub_1E0995EF0()
{
  return MEMORY[0x1F40EFDB8]();
}

uint64_t sub_1E0995F00()
{
  return MEMORY[0x1F40EFDC0]();
}

uint64_t sub_1E0995F10()
{
  return MEMORY[0x1F40EFDC8]();
}

uint64_t sub_1E0995F20()
{
  return MEMORY[0x1F40EFDD0]();
}

uint64_t sub_1E0995F30()
{
  return MEMORY[0x1F40EFDD8]();
}

uint64_t sub_1E0995F40()
{
  return MEMORY[0x1F40EFDE0]();
}

uint64_t sub_1E0995F50()
{
  return MEMORY[0x1F40EFDE8]();
}

uint64_t sub_1E0995F60()
{
  return MEMORY[0x1F40EFDF0]();
}

uint64_t sub_1E0995F70()
{
  return MEMORY[0x1F40EFDF8]();
}

uint64_t sub_1E0995F80()
{
  return MEMORY[0x1F40EFE00]();
}

uint64_t sub_1E0995F90()
{
  return MEMORY[0x1F40EFE08]();
}

uint64_t sub_1E0995FA0()
{
  return MEMORY[0x1F40EFE10]();
}

uint64_t sub_1E0995FB0()
{
  return MEMORY[0x1F40EFE18]();
}

uint64_t sub_1E0995FC0()
{
  return MEMORY[0x1F40EFE20]();
}

uint64_t sub_1E0995FD0()
{
  return MEMORY[0x1F40EFE28]();
}

uint64_t sub_1E0995FE0()
{
  return MEMORY[0x1F40EFE30]();
}

uint64_t sub_1E0995FF0()
{
  return MEMORY[0x1F40EFE38]();
}

uint64_t sub_1E0996000()
{
  return MEMORY[0x1F40EFE40]();
}

uint64_t sub_1E0996010()
{
  return MEMORY[0x1F40EFE48]();
}

uint64_t sub_1E0996020()
{
  return MEMORY[0x1F40EFE50]();
}

uint64_t sub_1E0996030()
{
  return MEMORY[0x1F40EFE58]();
}

uint64_t sub_1E0996040()
{
  return MEMORY[0x1F40EFE60]();
}

uint64_t sub_1E0996050()
{
  return MEMORY[0x1F40EFE68]();
}

uint64_t sub_1E0996060()
{
  return MEMORY[0x1F40EFE70]();
}

uint64_t sub_1E0996070()
{
  return MEMORY[0x1F40EFE78]();
}

uint64_t sub_1E0996080()
{
  return MEMORY[0x1F40EFE80]();
}

uint64_t sub_1E0996090()
{
  return MEMORY[0x1F40EFE88]();
}

uint64_t sub_1E09960A0()
{
  return MEMORY[0x1F40EFE90]();
}

uint64_t sub_1E09960B0()
{
  return MEMORY[0x1F40EFE98]();
}

uint64_t sub_1E09960C0()
{
  return MEMORY[0x1F40EFEA0]();
}

uint64_t sub_1E09960D0()
{
  return MEMORY[0x1F40EFEA8]();
}

uint64_t sub_1E09960E0()
{
  return MEMORY[0x1F40EFEB0]();
}

uint64_t sub_1E09960F0()
{
  return MEMORY[0x1F40EFEB8]();
}

uint64_t sub_1E0996100()
{
  return MEMORY[0x1F40EFEC0]();
}

uint64_t sub_1E0996110()
{
  return MEMORY[0x1F40EFEC8]();
}

uint64_t sub_1E0996120()
{
  return MEMORY[0x1F40EFED0]();
}

uint64_t sub_1E0996130()
{
  return MEMORY[0x1F40EFED8]();
}

uint64_t sub_1E0996140()
{
  return MEMORY[0x1F40EFEE0]();
}

uint64_t sub_1E0996150()
{
  return MEMORY[0x1F40EFEE8]();
}

uint64_t sub_1E0996160()
{
  return MEMORY[0x1F40EFEF0]();
}

uint64_t sub_1E0996170()
{
  return MEMORY[0x1F40EFEF8]();
}

uint64_t sub_1E0996180()
{
  return MEMORY[0x1F40EFF00]();
}

uint64_t sub_1E09961A0()
{
  return MEMORY[0x1F40EFF10]();
}

uint64_t sub_1E09961B0()
{
  return MEMORY[0x1F40EFF18]();
}

uint64_t sub_1E09961C0()
{
  return MEMORY[0x1F40EFF20]();
}

uint64_t sub_1E09961D0()
{
  return MEMORY[0x1F40EFF28]();
}

uint64_t sub_1E09961E0()
{
  return MEMORY[0x1F40EFF30]();
}

uint64_t sub_1E09961F0()
{
  return MEMORY[0x1F40EFF38]();
}

uint64_t sub_1E0996200()
{
  return MEMORY[0x1F40EFF40]();
}

uint64_t sub_1E0996210()
{
  return MEMORY[0x1F40EFF48]();
}

uint64_t sub_1E0996220()
{
  return MEMORY[0x1F40EFF50]();
}

uint64_t sub_1E0996230()
{
  return MEMORY[0x1F40EFF58]();
}

uint64_t sub_1E0996240()
{
  return MEMORY[0x1F40EFF60]();
}

uint64_t sub_1E0996250()
{
  return MEMORY[0x1F40EFF68]();
}

uint64_t sub_1E0996260()
{
  return MEMORY[0x1F40EFF70]();
}

uint64_t sub_1E0996270()
{
  return MEMORY[0x1F40EFF78]();
}

uint64_t sub_1E0996280()
{
  return MEMORY[0x1F40EFF80]();
}

uint64_t sub_1E0996290()
{
  return MEMORY[0x1F40EFF88]();
}

uint64_t sub_1E09962A0()
{
  return MEMORY[0x1F40EFF90]();
}

uint64_t sub_1E09962B0()
{
  return MEMORY[0x1F40EFF98]();
}

uint64_t sub_1E09962C0()
{
  return MEMORY[0x1F40EFFA0]();
}

uint64_t sub_1E09962D0()
{
  return MEMORY[0x1F40EFFA8]();
}

uint64_t sub_1E09962E0()
{
  return MEMORY[0x1F40EFFB0]();
}

uint64_t sub_1E09962F0()
{
  return MEMORY[0x1F40EFFB8]();
}

uint64_t sub_1E0996300()
{
  return MEMORY[0x1F40EFFC0]();
}

uint64_t sub_1E0996310()
{
  return MEMORY[0x1F40EFFC8]();
}

uint64_t sub_1E0996320()
{
  return MEMORY[0x1F40EFFD0]();
}

uint64_t sub_1E0996330()
{
  return MEMORY[0x1F40EFFD8]();
}

uint64_t sub_1E0996340()
{
  return MEMORY[0x1F40EFFE0]();
}

uint64_t sub_1E0996350()
{
  return MEMORY[0x1F40EFFE8]();
}

uint64_t sub_1E0996360()
{
  return MEMORY[0x1F40EFFF0]();
}

uint64_t sub_1E0996370()
{
  return MEMORY[0x1F40EFFF8]();
}

uint64_t sub_1E0996380()
{
  return MEMORY[0x1F40F0000]();
}

uint64_t sub_1E0996390()
{
  return MEMORY[0x1F40F0008]();
}

uint64_t sub_1E09963A0()
{
  return MEMORY[0x1F40F0010]();
}

uint64_t sub_1E09963B0()
{
  return MEMORY[0x1F40F0018]();
}

uint64_t sub_1E09963C0()
{
  return MEMORY[0x1F40F0020]();
}

uint64_t sub_1E09963D0()
{
  return MEMORY[0x1F40F0028]();
}

uint64_t sub_1E09963E0()
{
  return MEMORY[0x1F40F0030]();
}

uint64_t sub_1E09963F0()
{
  return MEMORY[0x1F40F0038]();
}

uint64_t sub_1E0996400()
{
  return MEMORY[0x1F40F0040]();
}

uint64_t sub_1E0996410()
{
  return MEMORY[0x1F40F0048]();
}

uint64_t sub_1E0996420()
{
  return MEMORY[0x1F40F0050]();
}

uint64_t sub_1E0996430()
{
  return MEMORY[0x1F40F0058]();
}

uint64_t sub_1E0996440()
{
  return MEMORY[0x1F40F0060]();
}

uint64_t sub_1E0996450()
{
  return MEMORY[0x1F40F0068]();
}

uint64_t sub_1E0996460()
{
  return MEMORY[0x1F40F0070]();
}

uint64_t sub_1E0996470()
{
  return MEMORY[0x1F40F0078]();
}

uint64_t sub_1E0996480()
{
  return MEMORY[0x1F40F0080]();
}

uint64_t sub_1E0996490()
{
  return MEMORY[0x1F40F0088]();
}

uint64_t sub_1E09964A0()
{
  return MEMORY[0x1F40F0090]();
}

uint64_t sub_1E09964B0()
{
  return MEMORY[0x1F40F0098]();
}

uint64_t sub_1E09964C0()
{
  return MEMORY[0x1F40F00A0]();
}

uint64_t sub_1E09964D0()
{
  return MEMORY[0x1F40F00A8]();
}

uint64_t sub_1E09964E0()
{
  return MEMORY[0x1F40F00B0]();
}

uint64_t sub_1E09964F0()
{
  return MEMORY[0x1F40F00B8]();
}

uint64_t sub_1E0996500()
{
  return MEMORY[0x1F40F00C0]();
}

uint64_t sub_1E0996510()
{
  return MEMORY[0x1F40F00C8]();
}

uint64_t sub_1E0996520()
{
  return MEMORY[0x1F40F00D0]();
}

uint64_t sub_1E0996530()
{
  return MEMORY[0x1F40F00D8]();
}

uint64_t sub_1E0996540()
{
  return MEMORY[0x1F40F00E0]();
}

uint64_t sub_1E0996550()
{
  return MEMORY[0x1F40F00E8]();
}

uint64_t sub_1E0996560()
{
  return MEMORY[0x1F40F00F0]();
}

uint64_t sub_1E0996570()
{
  return MEMORY[0x1F40F00F8]();
}

uint64_t sub_1E0996580()
{
  return MEMORY[0x1F40F0100]();
}

uint64_t sub_1E0996590()
{
  return MEMORY[0x1F40F0108]();
}

uint64_t sub_1E09965A0()
{
  return MEMORY[0x1F40F0110]();
}

uint64_t sub_1E09965B0()
{
  return MEMORY[0x1F40F0118]();
}

uint64_t sub_1E09965C0()
{
  return MEMORY[0x1F40F0120]();
}

uint64_t sub_1E09965D0()
{
  return MEMORY[0x1F40F0128]();
}

uint64_t sub_1E09965E0()
{
  return MEMORY[0x1F40F0130]();
}

uint64_t sub_1E09965F0()
{
  return MEMORY[0x1F40F0138]();
}

uint64_t sub_1E0996600()
{
  return MEMORY[0x1F40F0140]();
}

uint64_t sub_1E0996610()
{
  return MEMORY[0x1F40F0148]();
}

uint64_t sub_1E0996620()
{
  return MEMORY[0x1F40F0150]();
}

uint64_t sub_1E0996630()
{
  return MEMORY[0x1F40F0158]();
}

uint64_t sub_1E0996640()
{
  return MEMORY[0x1F40F0160]();
}

uint64_t sub_1E0996650()
{
  return MEMORY[0x1F40F0168]();
}

uint64_t sub_1E0996660()
{
  return MEMORY[0x1F40F0170]();
}

uint64_t sub_1E0996670()
{
  return MEMORY[0x1F40F0178]();
}

uint64_t sub_1E0996680()
{
  return MEMORY[0x1F40F0180]();
}

uint64_t sub_1E0996690()
{
  return MEMORY[0x1F40F0188]();
}

uint64_t sub_1E09966A0()
{
  return MEMORY[0x1F40F0190]();
}

uint64_t sub_1E09966B0()
{
  return MEMORY[0x1F40F0198]();
}

uint64_t sub_1E09966C0()
{
  return MEMORY[0x1F40F01A0]();
}

uint64_t sub_1E09966E0()
{
  return MEMORY[0x1F40F01B0]();
}

uint64_t sub_1E09966F0()
{
  return MEMORY[0x1F40F01B8]();
}

uint64_t sub_1E0996700()
{
  return MEMORY[0x1F40F01C0]();
}

uint64_t sub_1E0996710()
{
  return MEMORY[0x1F40F01C8]();
}

uint64_t sub_1E0996720()
{
  return MEMORY[0x1F40F01D0]();
}

uint64_t sub_1E0996730()
{
  return MEMORY[0x1F40F01D8]();
}

uint64_t sub_1E0996740()
{
  return MEMORY[0x1F40F01E0]();
}

uint64_t sub_1E0996750()
{
  return MEMORY[0x1F40F01E8]();
}

uint64_t sub_1E0996760()
{
  return MEMORY[0x1F40F01F0]();
}

uint64_t sub_1E0996790()
{
  return MEMORY[0x1F40F0208]();
}

uint64_t sub_1E09967A0()
{
  return MEMORY[0x1F40F0210]();
}

uint64_t sub_1E09967B0()
{
  return MEMORY[0x1F40F0218]();
}

uint64_t sub_1E09967C0()
{
  return MEMORY[0x1F40F0220]();
}

uint64_t sub_1E09967D0()
{
  return MEMORY[0x1F40F0228]();
}

uint64_t sub_1E09967E0()
{
  return MEMORY[0x1F40F0230]();
}

uint64_t sub_1E09967F0()
{
  return MEMORY[0x1F40F0238]();
}

uint64_t sub_1E0996800()
{
  return MEMORY[0x1F40F0240]();
}

uint64_t sub_1E0996810()
{
  return MEMORY[0x1F40F0248]();
}

uint64_t sub_1E0996820()
{
  return MEMORY[0x1F40F0250]();
}

uint64_t sub_1E0996830()
{
  return MEMORY[0x1F40F0258]();
}

uint64_t sub_1E0996840()
{
  return MEMORY[0x1F40F0260]();
}

uint64_t sub_1E0996870()
{
  return MEMORY[0x1F40F0278]();
}

uint64_t sub_1E0996880()
{
  return MEMORY[0x1F40F0280]();
}

uint64_t sub_1E0996890()
{
  return MEMORY[0x1F40F0288]();
}

uint64_t sub_1E09968A0()
{
  return MEMORY[0x1F40F0290]();
}

uint64_t sub_1E09968B0()
{
  return MEMORY[0x1F40F0298]();
}

uint64_t sub_1E09968C0()
{
  return MEMORY[0x1F40F02A0]();
}

uint64_t sub_1E09968D0()
{
  return MEMORY[0x1F40F02A8]();
}

uint64_t sub_1E09968E0()
{
  return MEMORY[0x1F40F02B0]();
}

uint64_t sub_1E09968F0()
{
  return MEMORY[0x1F40F02B8]();
}

uint64_t sub_1E0996900()
{
  return MEMORY[0x1F40F02C0]();
}

uint64_t sub_1E0996910()
{
  return MEMORY[0x1F40F02C8]();
}

uint64_t sub_1E0996920()
{
  return MEMORY[0x1F40F02D0]();
}

uint64_t sub_1E0996930()
{
  return MEMORY[0x1F40F02D8]();
}

uint64_t sub_1E0996940()
{
  return MEMORY[0x1F40F02E0]();
}

uint64_t sub_1E0996950()
{
  return MEMORY[0x1F40F02E8]();
}

uint64_t sub_1E0996960()
{
  return MEMORY[0x1F40F02F0]();
}

uint64_t sub_1E0996970()
{
  return MEMORY[0x1F40F02F8]();
}

uint64_t sub_1E0996980()
{
  return MEMORY[0x1F40F0300]();
}

uint64_t sub_1E0996990()
{
  return MEMORY[0x1F40F0308]();
}

uint64_t sub_1E09969A0()
{
  return MEMORY[0x1F40F0310]();
}

uint64_t sub_1E09969B0()
{
  return MEMORY[0x1F40F0318]();
}

uint64_t sub_1E09969C0()
{
  return MEMORY[0x1F40F0320]();
}

uint64_t sub_1E09969D0()
{
  return MEMORY[0x1F40F0328]();
}

uint64_t sub_1E09969E0()
{
  return MEMORY[0x1F40F0330]();
}

uint64_t sub_1E09969F0()
{
  return MEMORY[0x1F40F0338]();
}

uint64_t sub_1E0996A00()
{
  return MEMORY[0x1F40F0340]();
}

uint64_t sub_1E0996A10()
{
  return MEMORY[0x1F40F0348]();
}

uint64_t sub_1E0996A20()
{
  return MEMORY[0x1F40F0350]();
}

uint64_t sub_1E0996A30()
{
  return MEMORY[0x1F40F0358]();
}

uint64_t sub_1E0996A40()
{
  return MEMORY[0x1F40F0360]();
}

uint64_t sub_1E0996A50()
{
  return MEMORY[0x1F40F0368]();
}

uint64_t sub_1E0996A60()
{
  return MEMORY[0x1F40F0370]();
}

uint64_t sub_1E0996A70()
{
  return MEMORY[0x1F40F0378]();
}

uint64_t sub_1E0996A80()
{
  return MEMORY[0x1F40F0380]();
}

uint64_t sub_1E0996A90()
{
  return MEMORY[0x1F40F0388]();
}

uint64_t sub_1E0996AA0()
{
  return MEMORY[0x1F40F0390]();
}

uint64_t sub_1E0996AB0()
{
  return MEMORY[0x1F40F0398]();
}

uint64_t sub_1E0996AC0()
{
  return MEMORY[0x1F40F03A0]();
}

uint64_t sub_1E0996AD0()
{
  return MEMORY[0x1F40F03A8]();
}

uint64_t sub_1E0996AE0()
{
  return MEMORY[0x1F40F03B0]();
}

uint64_t sub_1E0996AF0()
{
  return MEMORY[0x1F40F03B8]();
}

uint64_t sub_1E0996B00()
{
  return MEMORY[0x1F40F03C0]();
}

uint64_t sub_1E0996B10()
{
  return MEMORY[0x1F40F03C8]();
}

uint64_t sub_1E0996B20()
{
  return MEMORY[0x1F40F03D0]();
}

uint64_t sub_1E0996B30()
{
  return MEMORY[0x1F40F03D8]();
}

uint64_t sub_1E0996B40()
{
  return MEMORY[0x1F40F03E0]();
}

uint64_t sub_1E0996B50()
{
  return MEMORY[0x1F40F03E8]();
}

uint64_t sub_1E0996B60()
{
  return MEMORY[0x1F40F03F0]();
}

uint64_t sub_1E0996B70()
{
  return MEMORY[0x1F40F03F8]();
}

uint64_t sub_1E0996B80()
{
  return MEMORY[0x1F40F0400]();
}

uint64_t sub_1E0996B90()
{
  return MEMORY[0x1F40F0408]();
}

uint64_t sub_1E0996BA0()
{
  return MEMORY[0x1F40F0410]();
}

uint64_t sub_1E0996BB0()
{
  return MEMORY[0x1F40F0418]();
}

uint64_t sub_1E0996BC0()
{
  return MEMORY[0x1F40F0420]();
}

uint64_t sub_1E0996BD0()
{
  return MEMORY[0x1F40F0428]();
}

uint64_t sub_1E0996BE0()
{
  return MEMORY[0x1F40F0430]();
}

uint64_t sub_1E0996BF0()
{
  return MEMORY[0x1F40F0438]();
}

uint64_t sub_1E0996C00()
{
  return MEMORY[0x1F40F0440]();
}

uint64_t sub_1E0996C10()
{
  return MEMORY[0x1F40F0448]();
}

uint64_t sub_1E0996C20()
{
  return MEMORY[0x1F40F0450]();
}

uint64_t sub_1E0996C30()
{
  return MEMORY[0x1F40F0458]();
}

uint64_t sub_1E0996C40()
{
  return MEMORY[0x1F40F0460]();
}

uint64_t sub_1E0996C50()
{
  return MEMORY[0x1F40F0468]();
}

uint64_t sub_1E0996C60()
{
  return MEMORY[0x1F40F0470]();
}

uint64_t sub_1E0996C70()
{
  return MEMORY[0x1F40F0478]();
}

uint64_t sub_1E0996C80()
{
  return MEMORY[0x1F40F0480]();
}

uint64_t sub_1E0996C90()
{
  return MEMORY[0x1F40F0488]();
}

uint64_t sub_1E0996CA0()
{
  return MEMORY[0x1F40F0490]();
}

uint64_t sub_1E0996CB0()
{
  return MEMORY[0x1F40F0498]();
}

uint64_t sub_1E0996CC0()
{
  return MEMORY[0x1F40F04A0]();
}

uint64_t sub_1E0996CD0()
{
  return MEMORY[0x1F40F04A8]();
}

uint64_t sub_1E0996CE0()
{
  return MEMORY[0x1F40F04B0]();
}

uint64_t sub_1E0996CF0()
{
  return MEMORY[0x1F40F04B8]();
}

uint64_t sub_1E0996D00()
{
  return MEMORY[0x1F40F04C0]();
}

uint64_t sub_1E0996D10()
{
  return MEMORY[0x1F40F04C8]();
}

uint64_t sub_1E0996D20()
{
  return MEMORY[0x1F40F04D0]();
}

uint64_t sub_1E0996D30()
{
  return MEMORY[0x1F40F04D8]();
}

uint64_t sub_1E0996D40()
{
  return MEMORY[0x1F40F04E0]();
}

uint64_t sub_1E0996D50()
{
  return MEMORY[0x1F40F04E8]();
}

uint64_t sub_1E0996D60()
{
  return MEMORY[0x1F40F04F0]();
}

uint64_t sub_1E0996D70()
{
  return MEMORY[0x1F40F04F8]();
}

uint64_t sub_1E0996D80()
{
  return MEMORY[0x1F40F0500]();
}

uint64_t sub_1E0996D90()
{
  return MEMORY[0x1F40F0508]();
}

uint64_t sub_1E0996DA0()
{
  return MEMORY[0x1F40F0510]();
}

uint64_t sub_1E0996DB0()
{
  return MEMORY[0x1F40F0518]();
}

uint64_t sub_1E0996DC0()
{
  return MEMORY[0x1F40F0520]();
}

uint64_t sub_1E0996DD0()
{
  return MEMORY[0x1F40F0528]();
}

uint64_t sub_1E0996DE0()
{
  return MEMORY[0x1F40F0530]();
}

uint64_t sub_1E0996DF0()
{
  return MEMORY[0x1F40F0538]();
}

uint64_t sub_1E0996E00()
{
  return MEMORY[0x1F40F0540]();
}

uint64_t sub_1E0996E10()
{
  return MEMORY[0x1F40F0548]();
}

uint64_t sub_1E0996E20()
{
  return MEMORY[0x1F40F0550]();
}

uint64_t sub_1E0996E30()
{
  return MEMORY[0x1F40F0558]();
}

uint64_t sub_1E0996E40()
{
  return MEMORY[0x1F40F0560]();
}

uint64_t sub_1E0996E50()
{
  return MEMORY[0x1F40F0568]();
}

uint64_t sub_1E0996E60()
{
  return MEMORY[0x1F40F0570]();
}

uint64_t sub_1E0996E70()
{
  return MEMORY[0x1F40F0578]();
}

uint64_t sub_1E0996E80()
{
  return MEMORY[0x1F40F0580]();
}

uint64_t sub_1E0996E90()
{
  return MEMORY[0x1F40F0588]();
}

uint64_t sub_1E0996EA0()
{
  return MEMORY[0x1F40F0590]();
}

uint64_t sub_1E0996EB0()
{
  return MEMORY[0x1F40F0598]();
}

uint64_t sub_1E0996EC0()
{
  return MEMORY[0x1F40F05A0]();
}

uint64_t sub_1E0996ED0()
{
  return MEMORY[0x1F40F05A8]();
}

uint64_t sub_1E0996EE0()
{
  return MEMORY[0x1F40F05B0]();
}

uint64_t sub_1E0996EF0()
{
  return MEMORY[0x1F40F05B8]();
}

uint64_t sub_1E0996F00()
{
  return MEMORY[0x1F40F05C0]();
}

uint64_t sub_1E0996F10()
{
  return MEMORY[0x1F40F05C8]();
}

uint64_t sub_1E0996F20()
{
  return MEMORY[0x1F40F05D0]();
}

uint64_t sub_1E0996F30()
{
  return MEMORY[0x1F40F05D8]();
}

uint64_t sub_1E0996F40()
{
  return MEMORY[0x1F40F05E0]();
}

uint64_t sub_1E0996F50()
{
  return MEMORY[0x1F40F05E8]();
}

uint64_t sub_1E0996F60()
{
  return MEMORY[0x1F40F05F0]();
}

uint64_t sub_1E0996F70()
{
  return MEMORY[0x1F40F05F8]();
}

uint64_t sub_1E0996F80()
{
  return MEMORY[0x1F40F0600]();
}

uint64_t sub_1E0996F90()
{
  return MEMORY[0x1F40F0608]();
}

uint64_t sub_1E0996FA0()
{
  return MEMORY[0x1F40F0610]();
}

uint64_t sub_1E0996FB0()
{
  return MEMORY[0x1F40F0618]();
}

uint64_t sub_1E0996FC0()
{
  return MEMORY[0x1F40F0620]();
}

uint64_t sub_1E0996FD0()
{
  return MEMORY[0x1F40F0628]();
}

uint64_t sub_1E0996FE0()
{
  return MEMORY[0x1F40F0630]();
}

uint64_t sub_1E0996FF0()
{
  return MEMORY[0x1F40F0638]();
}

uint64_t sub_1E0997000()
{
  return MEMORY[0x1F40F0640]();
}

uint64_t sub_1E0997010()
{
  return MEMORY[0x1F40F0648]();
}

uint64_t sub_1E0997020()
{
  return MEMORY[0x1F40F0650]();
}

uint64_t sub_1E0997030()
{
  return MEMORY[0x1F40F0658]();
}

uint64_t sub_1E0997040()
{
  return MEMORY[0x1F40F0660]();
}

uint64_t sub_1E0997050()
{
  return MEMORY[0x1F40F0668]();
}

uint64_t sub_1E0997060()
{
  return MEMORY[0x1F40F0670]();
}

uint64_t sub_1E0997070()
{
  return MEMORY[0x1F40F0678]();
}

uint64_t sub_1E0997080()
{
  return MEMORY[0x1F40F0680]();
}

uint64_t sub_1E0997090()
{
  return MEMORY[0x1F40F0688]();
}

uint64_t sub_1E09970A0()
{
  return MEMORY[0x1F40F0690]();
}

uint64_t sub_1E09970B0()
{
  return MEMORY[0x1F40F0698]();
}

uint64_t sub_1E09970C0()
{
  return MEMORY[0x1F40F06A0]();
}

uint64_t sub_1E09970D0()
{
  return MEMORY[0x1F40F06A8]();
}

uint64_t sub_1E09970E0()
{
  return MEMORY[0x1F40F06B0]();
}

uint64_t sub_1E09970F0()
{
  return MEMORY[0x1F40F06B8]();
}

uint64_t sub_1E0997100()
{
  return MEMORY[0x1F40F06C0]();
}

uint64_t sub_1E0997110()
{
  return MEMORY[0x1F40F06C8]();
}

uint64_t sub_1E0997120()
{
  return MEMORY[0x1F40F06D0]();
}

uint64_t sub_1E0997130()
{
  return MEMORY[0x1F40F06D8]();
}

uint64_t sub_1E0997140()
{
  return MEMORY[0x1F40F06E0]();
}

uint64_t sub_1E0997150()
{
  return MEMORY[0x1F40F06E8]();
}

uint64_t sub_1E0997160()
{
  return MEMORY[0x1F40F06F0]();
}

uint64_t sub_1E0997170()
{
  return MEMORY[0x1F40F06F8]();
}

uint64_t sub_1E0997180()
{
  return MEMORY[0x1F40F0700]();
}

uint64_t sub_1E0997190()
{
  return MEMORY[0x1F40F0708]();
}

uint64_t sub_1E09971A0()
{
  return MEMORY[0x1F40F0710]();
}

uint64_t sub_1E09971B0()
{
  return MEMORY[0x1F40F0718]();
}

uint64_t sub_1E09971C0()
{
  return MEMORY[0x1F40F0720]();
}

uint64_t sub_1E09971D0()
{
  return MEMORY[0x1F40F0728]();
}

uint64_t sub_1E09971E0()
{
  return MEMORY[0x1F40F0730]();
}

uint64_t sub_1E09971F0()
{
  return MEMORY[0x1F40F0738]();
}

uint64_t sub_1E0997200()
{
  return MEMORY[0x1F40F0740]();
}

uint64_t sub_1E0997210()
{
  return MEMORY[0x1F40F0748]();
}

uint64_t sub_1E0997220()
{
  return MEMORY[0x1F40F0750]();
}

uint64_t sub_1E0997230()
{
  return MEMORY[0x1F40F0758]();
}

uint64_t sub_1E0997240()
{
  return MEMORY[0x1F40F0760]();
}

uint64_t sub_1E0997250()
{
  return MEMORY[0x1F40F0768]();
}

uint64_t sub_1E0997260()
{
  return MEMORY[0x1F40F0770]();
}

uint64_t sub_1E0997270()
{
  return MEMORY[0x1F40F0778]();
}

uint64_t sub_1E0997280()
{
  return MEMORY[0x1F40F0780]();
}

uint64_t sub_1E0997290()
{
  return MEMORY[0x1F40F0788]();
}

uint64_t sub_1E09972A0()
{
  return MEMORY[0x1F40F0790]();
}

uint64_t sub_1E09972B0()
{
  return MEMORY[0x1F40F0798]();
}

uint64_t sub_1E09972C0()
{
  return MEMORY[0x1F40F07A0]();
}

uint64_t sub_1E09972D0()
{
  return MEMORY[0x1F40F07A8]();
}

uint64_t sub_1E09972E0()
{
  return MEMORY[0x1F40F07B0]();
}

uint64_t sub_1E09972F0()
{
  return MEMORY[0x1F40F07B8]();
}

uint64_t sub_1E0997300()
{
  return MEMORY[0x1F40F07C0]();
}

uint64_t sub_1E0997310()
{
  return MEMORY[0x1F40F07C8]();
}

uint64_t sub_1E0997320()
{
  return MEMORY[0x1F40F07D0]();
}

uint64_t sub_1E0997330()
{
  return MEMORY[0x1F40F07D8]();
}

uint64_t sub_1E0997340()
{
  return MEMORY[0x1F40F07E0]();
}

uint64_t sub_1E0997350()
{
  return MEMORY[0x1F40F07E8]();
}

uint64_t sub_1E0997360()
{
  return MEMORY[0x1F40F07F0]();
}

uint64_t sub_1E0997370()
{
  return MEMORY[0x1F40F07F8]();
}

uint64_t sub_1E0997380()
{
  return MEMORY[0x1F40F0800]();
}

uint64_t sub_1E0997390()
{
  return MEMORY[0x1F40F0808]();
}

uint64_t sub_1E09973A0()
{
  return MEMORY[0x1F40F0810]();
}

uint64_t sub_1E09973B0()
{
  return MEMORY[0x1F40F0818]();
}

uint64_t sub_1E09973C0()
{
  return MEMORY[0x1F40F0820]();
}

uint64_t sub_1E09973D0()
{
  return MEMORY[0x1F40F0828]();
}

uint64_t sub_1E09973E0()
{
  return MEMORY[0x1F40F0830]();
}

uint64_t sub_1E09973F0()
{
  return MEMORY[0x1F40F0838]();
}

uint64_t sub_1E0997400()
{
  return MEMORY[0x1F40F0840]();
}

uint64_t sub_1E0997410()
{
  return MEMORY[0x1F40F0848]();
}

uint64_t sub_1E0997420()
{
  return MEMORY[0x1F40F0850]();
}

uint64_t sub_1E0997430()
{
  return MEMORY[0x1F40F0858]();
}

uint64_t sub_1E0997440()
{
  return MEMORY[0x1F40F0860]();
}

uint64_t sub_1E0997450()
{
  return MEMORY[0x1F40F0868]();
}

uint64_t sub_1E0997460()
{
  return MEMORY[0x1F40F0870]();
}

uint64_t sub_1E0997470()
{
  return MEMORY[0x1F40F0878]();
}

uint64_t sub_1E0997480()
{
  return MEMORY[0x1F40F0880]();
}

uint64_t sub_1E0997490()
{
  return MEMORY[0x1F40F0888]();
}

uint64_t sub_1E09974A0()
{
  return MEMORY[0x1F40F0890]();
}

uint64_t sub_1E09974B0()
{
  return MEMORY[0x1F40F0898]();
}

uint64_t sub_1E09974C0()
{
  return MEMORY[0x1F40F08A0]();
}

uint64_t sub_1E09974D0()
{
  return MEMORY[0x1F40F08A8]();
}

uint64_t sub_1E09974E0()
{
  return MEMORY[0x1F40F08B0]();
}

uint64_t sub_1E09974F0()
{
  return MEMORY[0x1F40F08B8]();
}

uint64_t sub_1E0997500()
{
  return MEMORY[0x1F40F08C0]();
}

uint64_t sub_1E0997510()
{
  return MEMORY[0x1F40F08C8]();
}

uint64_t sub_1E0997520()
{
  return MEMORY[0x1F40F08D0]();
}

uint64_t sub_1E0997530()
{
  return MEMORY[0x1F40F08D8]();
}

uint64_t sub_1E0997540()
{
  return MEMORY[0x1F40F08E0]();
}

uint64_t sub_1E0997550()
{
  return MEMORY[0x1F40F08E8]();
}

uint64_t sub_1E0997560()
{
  return MEMORY[0x1F40F08F0]();
}

uint64_t sub_1E0997570()
{
  return MEMORY[0x1F40F08F8]();
}

uint64_t sub_1E0997580()
{
  return MEMORY[0x1F40F0900]();
}

uint64_t sub_1E0997590()
{
  return MEMORY[0x1F40F0908]();
}

uint64_t sub_1E09975A0()
{
  return MEMORY[0x1F40F0910]();
}

uint64_t sub_1E09975B0()
{
  return MEMORY[0x1F40F0918]();
}

uint64_t sub_1E09975C0()
{
  return MEMORY[0x1F40F0920]();
}

uint64_t sub_1E09975D0()
{
  return MEMORY[0x1F40F0928]();
}

uint64_t sub_1E09975E0()
{
  return MEMORY[0x1F40F0930]();
}

uint64_t sub_1E09975F0()
{
  return MEMORY[0x1F40F0938]();
}

uint64_t sub_1E0997600()
{
  return MEMORY[0x1F40F0940]();
}

uint64_t sub_1E0997610()
{
  return MEMORY[0x1F40F0948]();
}

uint64_t sub_1E0997620()
{
  return MEMORY[0x1F40F0950]();
}

uint64_t sub_1E0997630()
{
  return MEMORY[0x1F40F0958]();
}

uint64_t sub_1E0997640()
{
  return MEMORY[0x1F40F0960]();
}

uint64_t sub_1E0997650()
{
  return MEMORY[0x1F40F0968]();
}

uint64_t sub_1E0997660()
{
  return MEMORY[0x1F40F0970]();
}

uint64_t sub_1E0997670()
{
  return MEMORY[0x1F40F0978]();
}

uint64_t sub_1E0997680()
{
  return MEMORY[0x1F40F0980]();
}

uint64_t sub_1E0997690()
{
  return MEMORY[0x1F40F0988]();
}

uint64_t sub_1E09976A0()
{
  return MEMORY[0x1F40F0990]();
}

uint64_t sub_1E09976B0()
{
  return MEMORY[0x1F40F0998]();
}

uint64_t sub_1E09976C0()
{
  return MEMORY[0x1F40F09A0]();
}

uint64_t sub_1E09976D0()
{
  return MEMORY[0x1F40F09A8]();
}

uint64_t sub_1E09976E0()
{
  return MEMORY[0x1F40F09B0]();
}

uint64_t sub_1E09976F0()
{
  return MEMORY[0x1F40F09B8]();
}

uint64_t sub_1E0997700()
{
  return MEMORY[0x1F40F09C0]();
}

uint64_t sub_1E0997710()
{
  return MEMORY[0x1F40F09C8]();
}

uint64_t sub_1E0997720()
{
  return MEMORY[0x1F40F09D0]();
}

uint64_t sub_1E0997730()
{
  return MEMORY[0x1F40F09D8]();
}

uint64_t sub_1E0997740()
{
  return MEMORY[0x1F40F09E0]();
}

uint64_t sub_1E0997750()
{
  return MEMORY[0x1F40F09E8]();
}

uint64_t sub_1E0997760()
{
  return MEMORY[0x1F40F09F0]();
}

uint64_t sub_1E0997770()
{
  return MEMORY[0x1F40F09F8]();
}

uint64_t sub_1E0997780()
{
  return MEMORY[0x1F40F0A00]();
}

uint64_t sub_1E0997790()
{
  return MEMORY[0x1F40F0A08]();
}

uint64_t sub_1E09977A0()
{
  return MEMORY[0x1F40F0A10]();
}

uint64_t sub_1E09977B0()
{
  return MEMORY[0x1F40F0A18]();
}

uint64_t sub_1E09977C0()
{
  return MEMORY[0x1F40F0A20]();
}

uint64_t sub_1E09977D0()
{
  return MEMORY[0x1F40F0A28]();
}

uint64_t sub_1E09977E0()
{
  return MEMORY[0x1F40F0A30]();
}

uint64_t sub_1E09977F0()
{
  return MEMORY[0x1F40F0A38]();
}

uint64_t sub_1E0997800()
{
  return MEMORY[0x1F40F0A40]();
}

uint64_t sub_1E0997810()
{
  return MEMORY[0x1F40F0A48]();
}

uint64_t sub_1E0997820()
{
  return MEMORY[0x1F40F0A50]();
}

uint64_t sub_1E0997830()
{
  return MEMORY[0x1F40F0A58]();
}

uint64_t sub_1E0997840()
{
  return MEMORY[0x1F40F0A60]();
}

uint64_t sub_1E0997850()
{
  return MEMORY[0x1F40F0A68]();
}

uint64_t sub_1E0997860()
{
  return MEMORY[0x1F40F0A70]();
}

uint64_t sub_1E0997870()
{
  return MEMORY[0x1F40F0A78]();
}

uint64_t sub_1E0997880()
{
  return MEMORY[0x1F40F0A80]();
}

uint64_t sub_1E0997890()
{
  return MEMORY[0x1F40F0A88]();
}

uint64_t sub_1E09978A0()
{
  return MEMORY[0x1F40F0A90]();
}

uint64_t sub_1E09978B0()
{
  return MEMORY[0x1F40F0A98]();
}

uint64_t sub_1E09978C0()
{
  return MEMORY[0x1F40F0AA0]();
}

uint64_t sub_1E09978D0()
{
  return MEMORY[0x1F40F0AA8]();
}

uint64_t sub_1E09978E0()
{
  return MEMORY[0x1F40F0AB0]();
}

uint64_t sub_1E09978F0()
{
  return MEMORY[0x1F40F0AB8]();
}

uint64_t sub_1E0997900()
{
  return MEMORY[0x1F40F0AC0]();
}

uint64_t sub_1E0997910()
{
  return MEMORY[0x1F40F0AC8]();
}

uint64_t sub_1E0997920()
{
  return MEMORY[0x1F40F0AD0]();
}

uint64_t sub_1E0997930()
{
  return MEMORY[0x1F40F0AD8]();
}

uint64_t sub_1E0997940()
{
  return MEMORY[0x1F40F0AE0]();
}

uint64_t sub_1E0997950()
{
  return MEMORY[0x1F40F0AE8]();
}

uint64_t sub_1E0997960()
{
  return MEMORY[0x1F40F0AF0]();
}

uint64_t sub_1E0997970()
{
  return MEMORY[0x1F40F0AF8]();
}

uint64_t sub_1E0997980()
{
  return MEMORY[0x1F40F0B00]();
}

uint64_t sub_1E0997990()
{
  return MEMORY[0x1F40F0B08]();
}

uint64_t sub_1E09979A0()
{
  return MEMORY[0x1F40F0B10]();
}

uint64_t sub_1E09979B0()
{
  return MEMORY[0x1F40F0B18]();
}

uint64_t sub_1E09979C0()
{
  return MEMORY[0x1F40F0B20]();
}

uint64_t sub_1E09979D0()
{
  return MEMORY[0x1F40F0B28]();
}

uint64_t sub_1E09979E0()
{
  return MEMORY[0x1F40F0B30]();
}

uint64_t sub_1E09979F0()
{
  return MEMORY[0x1F40F0B38]();
}

uint64_t sub_1E0997A00()
{
  return MEMORY[0x1F40F0B40]();
}

uint64_t sub_1E0997A10()
{
  return MEMORY[0x1F40F0B48]();
}

uint64_t sub_1E0997A20()
{
  return MEMORY[0x1F40F0B50]();
}

uint64_t sub_1E0997A30()
{
  return MEMORY[0x1F40F0B58]();
}

uint64_t sub_1E0997A40()
{
  return MEMORY[0x1F40F0B60]();
}

uint64_t sub_1E0997A50()
{
  return MEMORY[0x1F40F0B68]();
}

uint64_t sub_1E0997A60()
{
  return MEMORY[0x1F40F0B70]();
}

uint64_t sub_1E0997A70()
{
  return MEMORY[0x1F40F0B78]();
}

uint64_t sub_1E0997A80()
{
  return MEMORY[0x1F40F0B80]();
}

uint64_t sub_1E0997A90()
{
  return MEMORY[0x1F40F0B88]();
}

uint64_t sub_1E0997AA0()
{
  return MEMORY[0x1F40F0B90]();
}

uint64_t sub_1E0997AB0()
{
  return MEMORY[0x1F40F0B98]();
}

uint64_t sub_1E0997AC0()
{
  return MEMORY[0x1F40F0BA0]();
}

uint64_t sub_1E0997AD0()
{
  return MEMORY[0x1F40F0BA8]();
}

uint64_t sub_1E0997AE0()
{
  return MEMORY[0x1F40F0BB0]();
}

uint64_t sub_1E0997AF0()
{
  return MEMORY[0x1F40F0BB8]();
}

uint64_t sub_1E0997B00()
{
  return MEMORY[0x1F40F0BC0]();
}

uint64_t sub_1E0997B10()
{
  return MEMORY[0x1F40F0BC8]();
}

uint64_t sub_1E0997B20()
{
  return MEMORY[0x1F40F0BD0]();
}

uint64_t sub_1E0997B30()
{
  return MEMORY[0x1F40F0BD8]();
}

uint64_t sub_1E0997B40()
{
  return MEMORY[0x1F40F0BE0]();
}

uint64_t sub_1E0997B50()
{
  return MEMORY[0x1F40F0BE8]();
}

uint64_t sub_1E0997B60()
{
  return MEMORY[0x1F40F0BF0]();
}

uint64_t sub_1E0997B70()
{
  return MEMORY[0x1F40F0BF8]();
}

uint64_t sub_1E0997B80()
{
  return MEMORY[0x1F40F0C00]();
}

uint64_t sub_1E0997B90()
{
  return MEMORY[0x1F40F0C08]();
}

uint64_t sub_1E0997BA0()
{
  return MEMORY[0x1F40F0C10]();
}

uint64_t sub_1E0997BB0()
{
  return MEMORY[0x1F40F0C18]();
}

uint64_t sub_1E0997BC0()
{
  return MEMORY[0x1F40F0C20]();
}

uint64_t sub_1E0997BD0()
{
  return MEMORY[0x1F40F0C28]();
}

uint64_t sub_1E0997BE0()
{
  return MEMORY[0x1F40F0C30]();
}

uint64_t sub_1E0997BF0()
{
  return MEMORY[0x1F40F0C38]();
}

uint64_t sub_1E0997C00()
{
  return MEMORY[0x1F40F0C40]();
}

uint64_t sub_1E0997C10()
{
  return MEMORY[0x1F40F0C48]();
}

uint64_t sub_1E0997C20()
{
  return MEMORY[0x1F40F0C50]();
}

uint64_t sub_1E0997C30()
{
  return MEMORY[0x1F40F0C58]();
}

uint64_t sub_1E0997C40()
{
  return MEMORY[0x1F40F0C60]();
}

uint64_t sub_1E0997C50()
{
  return MEMORY[0x1F40F0C68]();
}

uint64_t sub_1E0997C60()
{
  return MEMORY[0x1F40F0C70]();
}

uint64_t sub_1E0997C70()
{
  return MEMORY[0x1F40F0C78]();
}

uint64_t sub_1E0997C80()
{
  return MEMORY[0x1F40F0C80]();
}

uint64_t sub_1E0997C90()
{
  return MEMORY[0x1F40F0C88]();
}

uint64_t sub_1E0997CA0()
{
  return MEMORY[0x1F40F0C90]();
}

uint64_t sub_1E0997CB0()
{
  return MEMORY[0x1F40F0C98]();
}

uint64_t sub_1E0997CC0()
{
  return MEMORY[0x1F40F0CA0]();
}

uint64_t sub_1E0997CD0()
{
  return MEMORY[0x1F40F0CA8]();
}

uint64_t sub_1E0997CE0()
{
  return MEMORY[0x1F40F0CB0]();
}

uint64_t sub_1E0997CF0()
{
  return MEMORY[0x1F40F0CB8]();
}

uint64_t sub_1E0997D00()
{
  return MEMORY[0x1F40F0CC0]();
}

uint64_t sub_1E0997D10()
{
  return MEMORY[0x1F40F0CC8]();
}

uint64_t sub_1E0997D20()
{
  return MEMORY[0x1F40F0CD0]();
}

uint64_t sub_1E0997D30()
{
  return MEMORY[0x1F40F0CD8]();
}

uint64_t sub_1E0997D40()
{
  return MEMORY[0x1F40F0CE0]();
}

uint64_t sub_1E0997D50()
{
  return MEMORY[0x1F40F0CE8]();
}

uint64_t sub_1E0997D60()
{
  return MEMORY[0x1F40F0CF0]();
}

uint64_t sub_1E0997D70()
{
  return MEMORY[0x1F40F0CF8]();
}

uint64_t sub_1E0997D80()
{
  return MEMORY[0x1F40F0D00]();
}

uint64_t sub_1E0997D90()
{
  return MEMORY[0x1F40F0D08]();
}

uint64_t sub_1E0997DA0()
{
  return MEMORY[0x1F40F0D10]();
}

uint64_t sub_1E0997DB0()
{
  return MEMORY[0x1F40F0D18]();
}

uint64_t sub_1E0997DC0()
{
  return MEMORY[0x1F40F0D20]();
}

uint64_t sub_1E0997DD0()
{
  return MEMORY[0x1F40F0D28]();
}

uint64_t sub_1E0997DE0()
{
  return MEMORY[0x1F40F0D30]();
}

uint64_t sub_1E0997DF0()
{
  return MEMORY[0x1F40F0D38]();
}

uint64_t sub_1E0997E00()
{
  return MEMORY[0x1F40F0D40]();
}

uint64_t sub_1E0997E10()
{
  return MEMORY[0x1F40F0D48]();
}

uint64_t sub_1E0997E20()
{
  return MEMORY[0x1F40F0D50]();
}

uint64_t sub_1E0997E30()
{
  return MEMORY[0x1F40F0D58]();
}

uint64_t sub_1E0997E40()
{
  return MEMORY[0x1F40F0D60]();
}

uint64_t sub_1E0997E50()
{
  return MEMORY[0x1F40F0D68]();
}

uint64_t sub_1E0997E60()
{
  return MEMORY[0x1F40F0D70]();
}

uint64_t sub_1E0997E70()
{
  return MEMORY[0x1F40F0D78]();
}

uint64_t sub_1E0997E80()
{
  return MEMORY[0x1F40F0D80]();
}

uint64_t sub_1E0997E90()
{
  return MEMORY[0x1F40F0D88]();
}

uint64_t sub_1E0997EA0()
{
  return MEMORY[0x1F40F0D90]();
}

uint64_t sub_1E0997EB0()
{
  return MEMORY[0x1F40F0D98]();
}

uint64_t sub_1E0997EC0()
{
  return MEMORY[0x1F40F0DA0]();
}

uint64_t sub_1E0997ED0()
{
  return MEMORY[0x1F40F0DA8]();
}

uint64_t sub_1E0997EE0()
{
  return MEMORY[0x1F40F0DB0]();
}

uint64_t sub_1E0997EF0()
{
  return MEMORY[0x1F40F0DB8]();
}

uint64_t sub_1E0997F00()
{
  return MEMORY[0x1F40F0DC0]();
}

uint64_t sub_1E0997F10()
{
  return MEMORY[0x1F40F0DC8]();
}

uint64_t sub_1E0997F20()
{
  return MEMORY[0x1F40F0DD0]();
}

uint64_t sub_1E0997F30()
{
  return MEMORY[0x1F40F0DD8]();
}

uint64_t sub_1E0997F40()
{
  return MEMORY[0x1F40F0DE0]();
}

uint64_t sub_1E0997F50()
{
  return MEMORY[0x1F40F0DE8]();
}

uint64_t sub_1E0997F70()
{
  return MEMORY[0x1F40F0DF8]();
}

uint64_t sub_1E0997F80()
{
  return MEMORY[0x1F40F0E00]();
}

uint64_t sub_1E0997F90()
{
  return MEMORY[0x1F40F0E08]();
}

uint64_t sub_1E0997FA0()
{
  return MEMORY[0x1F40F0E10]();
}

uint64_t sub_1E0997FB0()
{
  return MEMORY[0x1F40F0E18]();
}

uint64_t sub_1E0997FC0()
{
  return MEMORY[0x1F40F0E20]();
}

uint64_t sub_1E0997FD0()
{
  return MEMORY[0x1F40F0E28]();
}

uint64_t sub_1E0997FE0()
{
  return MEMORY[0x1F40F0E30]();
}

uint64_t sub_1E0997FF0()
{
  return MEMORY[0x1F40F0E38]();
}

uint64_t sub_1E0998000()
{
  return MEMORY[0x1F40F0E40]();
}

uint64_t sub_1E0998010()
{
  return MEMORY[0x1F40F0E48]();
}

uint64_t sub_1E0998020()
{
  return MEMORY[0x1F40F0E50]();
}

uint64_t sub_1E0998030()
{
  return MEMORY[0x1F40F0E58]();
}

uint64_t sub_1E0998040()
{
  return MEMORY[0x1F40F0E60]();
}

uint64_t sub_1E0998050()
{
  return MEMORY[0x1F40F0E68]();
}

uint64_t sub_1E0998060()
{
  return MEMORY[0x1F40F0E70]();
}

uint64_t sub_1E0998070()
{
  return MEMORY[0x1F40F0E78]();
}

uint64_t sub_1E0998080()
{
  return MEMORY[0x1F40F0E80]();
}

uint64_t sub_1E0998090()
{
  return MEMORY[0x1F40F0E88]();
}

uint64_t sub_1E09980A0()
{
  return MEMORY[0x1F40F0E90]();
}

uint64_t sub_1E09980B0()
{
  return MEMORY[0x1F40F0E98]();
}

uint64_t sub_1E09980C0()
{
  return MEMORY[0x1F40F0EA0]();
}

uint64_t sub_1E09980D0()
{
  return MEMORY[0x1F40F0EA8]();
}

uint64_t sub_1E09980E0()
{
  return MEMORY[0x1F40F0EB0]();
}

uint64_t sub_1E09980F0()
{
  return MEMORY[0x1F40F0EB8]();
}

uint64_t sub_1E0998100()
{
  return MEMORY[0x1F40F0EC0]();
}

uint64_t sub_1E0998110()
{
  return MEMORY[0x1F40F0EC8]();
}

uint64_t sub_1E0998120()
{
  return MEMORY[0x1F40F0ED0]();
}

uint64_t sub_1E0998130()
{
  return MEMORY[0x1F40F0ED8]();
}

uint64_t sub_1E0998140()
{
  return MEMORY[0x1F40F0EE0]();
}

uint64_t sub_1E0998150()
{
  return MEMORY[0x1F40F0EE8]();
}

uint64_t sub_1E0998160()
{
  return MEMORY[0x1F40F0EF0]();
}

uint64_t sub_1E0998170()
{
  return MEMORY[0x1F40F0EF8]();
}

uint64_t sub_1E0998180()
{
  return MEMORY[0x1F40F0F00]();
}

uint64_t sub_1E0998190()
{
  return MEMORY[0x1F40F0F08]();
}

uint64_t sub_1E09981A0()
{
  return MEMORY[0x1F40F0F10]();
}

uint64_t sub_1E09981B0()
{
  return MEMORY[0x1F40F0F18]();
}

uint64_t sub_1E09981C0()
{
  return MEMORY[0x1F40F0F20]();
}

uint64_t sub_1E09981D0()
{
  return MEMORY[0x1F40F0F28]();
}

uint64_t sub_1E09981E0()
{
  return MEMORY[0x1F40F0F30]();
}

uint64_t sub_1E09981F0()
{
  return MEMORY[0x1F40F0F38]();
}

uint64_t sub_1E0998200()
{
  return MEMORY[0x1F40F0F40]();
}

uint64_t sub_1E0998210()
{
  return MEMORY[0x1F40F0F48]();
}

uint64_t sub_1E0998220()
{
  return MEMORY[0x1F40F0F50]();
}

uint64_t sub_1E0998230()
{
  return MEMORY[0x1F40F0F58]();
}

uint64_t sub_1E0998240()
{
  return MEMORY[0x1F40F0F60]();
}

uint64_t sub_1E0998250()
{
  return MEMORY[0x1F40F0F68]();
}

uint64_t sub_1E0998260()
{
  return MEMORY[0x1F40F0F70]();
}

uint64_t sub_1E0998270()
{
  return MEMORY[0x1F40F0F78]();
}

uint64_t sub_1E0998280()
{
  return MEMORY[0x1F40F0F80]();
}

uint64_t sub_1E0998290()
{
  return MEMORY[0x1F40F0F88]();
}

uint64_t sub_1E09982A0()
{
  return MEMORY[0x1F40F0F90]();
}

uint64_t sub_1E09982B0()
{
  return MEMORY[0x1F40F0F98]();
}

uint64_t sub_1E09982C0()
{
  return MEMORY[0x1F40F0FA0]();
}

uint64_t sub_1E09982D0()
{
  return MEMORY[0x1F40F0FA8]();
}

uint64_t sub_1E09982E0()
{
  return MEMORY[0x1F40F0FB0]();
}

uint64_t sub_1E09982F0()
{
  return MEMORY[0x1F40F0FB8]();
}

uint64_t sub_1E0998300()
{
  return MEMORY[0x1F40F0FC0]();
}

uint64_t sub_1E0998310()
{
  return MEMORY[0x1F40F0FC8]();
}

uint64_t sub_1E0998320()
{
  return MEMORY[0x1F40F0FD0]();
}

uint64_t sub_1E0998330()
{
  return MEMORY[0x1F40F0FD8]();
}

uint64_t sub_1E0998340()
{
  return MEMORY[0x1F40F0FE0]();
}

uint64_t sub_1E0998350()
{
  return MEMORY[0x1F40F0FE8]();
}

uint64_t sub_1E0998360()
{
  return MEMORY[0x1F40F0FF0]();
}

uint64_t sub_1E0998370()
{
  return MEMORY[0x1F40F0FF8]();
}

uint64_t sub_1E0998380()
{
  return MEMORY[0x1F40F1000]();
}

uint64_t sub_1E0998390()
{
  return MEMORY[0x1F40F1008]();
}

uint64_t sub_1E09983A0()
{
  return MEMORY[0x1F40F1010]();
}

uint64_t sub_1E09983B0()
{
  return MEMORY[0x1F40F1018]();
}

uint64_t sub_1E09983C0()
{
  return MEMORY[0x1F40F1020]();
}

uint64_t sub_1E09983D0()
{
  return MEMORY[0x1F40F1028]();
}

uint64_t sub_1E09983E0()
{
  return MEMORY[0x1F40F1030]();
}

uint64_t sub_1E09983F0()
{
  return MEMORY[0x1F40F1038]();
}

uint64_t sub_1E0998400()
{
  return MEMORY[0x1F40F1040]();
}

uint64_t sub_1E0998410()
{
  return MEMORY[0x1F40F1048]();
}

uint64_t sub_1E0998420()
{
  return MEMORY[0x1F40F1050]();
}

uint64_t sub_1E0998440()
{
  return MEMORY[0x1F40F1060]();
}

uint64_t sub_1E0998450()
{
  return MEMORY[0x1F40F1068]();
}

uint64_t sub_1E0998460()
{
  return MEMORY[0x1F40F1070]();
}

uint64_t sub_1E0998470()
{
  return MEMORY[0x1F40F1078]();
}

uint64_t sub_1E0998480()
{
  return MEMORY[0x1F40F1080]();
}

uint64_t sub_1E0998490()
{
  return MEMORY[0x1F40F1088]();
}

uint64_t sub_1E09984A0()
{
  return MEMORY[0x1F40F1090]();
}

uint64_t sub_1E09984B0()
{
  return MEMORY[0x1F40F1098]();
}

uint64_t sub_1E09984C0()
{
  return MEMORY[0x1F40F10A0]();
}

uint64_t sub_1E09984D0()
{
  return MEMORY[0x1F40F10A8]();
}

uint64_t sub_1E09984E0()
{
  return MEMORY[0x1F40F10B0]();
}

uint64_t sub_1E09984F0()
{
  return MEMORY[0x1F40F10B8]();
}

uint64_t sub_1E0998500()
{
  return MEMORY[0x1F40F10C0]();
}

uint64_t sub_1E0998510()
{
  return MEMORY[0x1F40F10C8]();
}

uint64_t sub_1E0998520()
{
  return MEMORY[0x1F40F10D0]();
}

uint64_t sub_1E0998530()
{
  return MEMORY[0x1F40F10D8]();
}

uint64_t sub_1E0998610()
{
  return MEMORY[0x1F40F1148]();
}

uint64_t sub_1E0998620()
{
  return MEMORY[0x1F40F1150]();
}

uint64_t sub_1E0998630()
{
  return MEMORY[0x1F40F1158]();
}

uint64_t sub_1E0998640()
{
  return MEMORY[0x1F40F1160]();
}

uint64_t sub_1E0998650()
{
  return MEMORY[0x1F40F1168]();
}

uint64_t sub_1E0998660()
{
  return MEMORY[0x1F40F1170]();
}

uint64_t sub_1E0998670()
{
  return MEMORY[0x1F40F1178]();
}

uint64_t sub_1E09986A0()
{
  return MEMORY[0x1F40F1190]();
}

uint64_t sub_1E09986B0()
{
  return MEMORY[0x1F40F1198]();
}

uint64_t sub_1E09986C0()
{
  return MEMORY[0x1F40F11A0]();
}

uint64_t sub_1E09986D0()
{
  return MEMORY[0x1F40F11A8]();
}

uint64_t sub_1E09986E0()
{
  return MEMORY[0x1F40F11B0]();
}

uint64_t sub_1E09986F0()
{
  return MEMORY[0x1F40F11B8]();
}

uint64_t sub_1E0998700()
{
  return MEMORY[0x1F40F11C0]();
}

uint64_t sub_1E0998710()
{
  return MEMORY[0x1F40F11C8]();
}

uint64_t sub_1E0998720()
{
  return MEMORY[0x1F40F11D0]();
}

uint64_t sub_1E0998730()
{
  return MEMORY[0x1F40F11D8]();
}

uint64_t sub_1E0998740()
{
  return MEMORY[0x1F40F11E0]();
}

uint64_t sub_1E0998750()
{
  return MEMORY[0x1F40F11E8]();
}

uint64_t sub_1E0998760()
{
  return MEMORY[0x1F40F11F0]();
}

uint64_t sub_1E0998780()
{
  return MEMORY[0x1F40F1200]();
}

uint64_t sub_1E0998790()
{
  return MEMORY[0x1F40F1208]();
}

uint64_t sub_1E09987A0()
{
  return MEMORY[0x1F40F1210]();
}

uint64_t sub_1E09987B0()
{
  return MEMORY[0x1F40F1218]();
}

uint64_t sub_1E09987C0()
{
  return MEMORY[0x1F40F1220]();
}

uint64_t sub_1E09987D0()
{
  return MEMORY[0x1F40F1228]();
}

uint64_t sub_1E09987E0()
{
  return MEMORY[0x1F40F1230]();
}

uint64_t sub_1E09987F0()
{
  return MEMORY[0x1F40F1238]();
}

uint64_t sub_1E0998800()
{
  return MEMORY[0x1F40F1240]();
}

uint64_t sub_1E0998810()
{
  return MEMORY[0x1F40F1248]();
}

uint64_t sub_1E0998820()
{
  return MEMORY[0x1F40F1250]();
}

uint64_t sub_1E0998830()
{
  return MEMORY[0x1F40F1258]();
}

uint64_t sub_1E0998850()
{
  return MEMORY[0x1F40F1268]();
}

uint64_t sub_1E0998860()
{
  return MEMORY[0x1F40F1270]();
}

uint64_t sub_1E0998870()
{
  return MEMORY[0x1F40F1278]();
}

uint64_t sub_1E0998880()
{
  return MEMORY[0x1F40F1280]();
}

uint64_t sub_1E0998890()
{
  return MEMORY[0x1F40F1288]();
}

uint64_t sub_1E09988A0()
{
  return MEMORY[0x1F40F1290]();
}

uint64_t sub_1E09988B0()
{
  return MEMORY[0x1F40F1298]();
}

uint64_t sub_1E09988C0()
{
  return MEMORY[0x1F40F12A0]();
}

uint64_t sub_1E09988D0()
{
  return MEMORY[0x1F40F12A8]();
}

uint64_t sub_1E09988E0()
{
  return MEMORY[0x1F40F12B0]();
}

uint64_t sub_1E09988F0()
{
  return MEMORY[0x1F40F12B8]();
}

uint64_t sub_1E0998900()
{
  return MEMORY[0x1F40F12C0]();
}

uint64_t sub_1E0998910()
{
  return MEMORY[0x1F40F12C8]();
}

uint64_t sub_1E0998920()
{
  return MEMORY[0x1F40F12D0]();
}

uint64_t sub_1E0998930()
{
  return MEMORY[0x1F40F12D8]();
}

uint64_t sub_1E0998940()
{
  return MEMORY[0x1F40F12E0]();
}

uint64_t sub_1E0998950()
{
  return MEMORY[0x1F40F12E8]();
}

uint64_t sub_1E0998960()
{
  return MEMORY[0x1F40F12F0]();
}

uint64_t sub_1E0998970()
{
  return MEMORY[0x1F40F12F8]();
}

uint64_t sub_1E0998980()
{
  return MEMORY[0x1F40F1300]();
}

uint64_t sub_1E0998990()
{
  return MEMORY[0x1F40F1308]();
}

uint64_t sub_1E09989A0()
{
  return MEMORY[0x1F40F1310]();
}

uint64_t sub_1E09989B0()
{
  return MEMORY[0x1F40F1318]();
}

uint64_t sub_1E09989C0()
{
  return MEMORY[0x1F40F1320]();
}

uint64_t sub_1E09989D0()
{
  return MEMORY[0x1F40F1328]();
}

uint64_t sub_1E09989E0()
{
  return MEMORY[0x1F40F1330]();
}

uint64_t sub_1E09989F0()
{
  return MEMORY[0x1F40F1338]();
}

uint64_t sub_1E0998A00()
{
  return MEMORY[0x1F40F1340]();
}

uint64_t sub_1E0998A10()
{
  return MEMORY[0x1F40F1348]();
}

uint64_t sub_1E0998A20()
{
  return MEMORY[0x1F40F1350]();
}

uint64_t sub_1E0998A30()
{
  return MEMORY[0x1F40F1358]();
}

uint64_t sub_1E0998A40()
{
  return MEMORY[0x1F40F1360]();
}

uint64_t sub_1E0998A50()
{
  return MEMORY[0x1F40F1368]();
}

uint64_t sub_1E0998A60()
{
  return MEMORY[0x1F40F1370]();
}

uint64_t sub_1E0998A70()
{
  return MEMORY[0x1F40F1378]();
}

uint64_t sub_1E0998A80()
{
  return MEMORY[0x1F40F1380]();
}

uint64_t sub_1E0998A90()
{
  return MEMORY[0x1F40F1388]();
}

uint64_t sub_1E0998AA0()
{
  return MEMORY[0x1F40F1390]();
}

uint64_t _s8MusicKit4SongV0aB8InternalE14pickerSubtitleSSSgvg_0()
{
  return MEMORY[0x1F40F1398]();
}

uint64_t sub_1E0998AC0()
{
  return MEMORY[0x1F40F13A0]();
}

uint64_t sub_1E0998AD0()
{
  return MEMORY[0x1F40F13A8]();
}

uint64_t sub_1E0998AE0()
{
  return MEMORY[0x1F40F13B0]();
}

uint64_t _s8MusicKit4SongV0aB8InternalE12customLyricsSSSgvg_0()
{
  return MEMORY[0x1F40F13B8]();
}

uint64_t sub_1E0998B00()
{
  return MEMORY[0x1F40F13C0]();
}

uint64_t sub_1E0998B10()
{
  return MEMORY[0x1F40F13C8]();
}

uint64_t sub_1E0998B20()
{
  return MEMORY[0x1F40F13D0]();
}

uint64_t sub_1E0998B30()
{
  return MEMORY[0x1F40F13D8]();
}

uint64_t sub_1E0998B40()
{
  return MEMORY[0x1F40F13E0]();
}

uint64_t sub_1E0998B50()
{
  return MEMORY[0x1F40F13E8]();
}

uint64_t _s8MusicKit4SongV0aB8InternalE13favoritedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F13F0]();
}

uint64_t sub_1E0998B70()
{
  return MEMORY[0x1F40F13F8]();
}

uint64_t sub_1E0998B80()
{
  return MEMORY[0x1F40F1400]();
}

uint64_t sub_1E0998B90()
{
  return MEMORY[0x1F40F1408]();
}

uint64_t sub_1E0998BA0()
{
  return MEMORY[0x1F40F1410]();
}

uint64_t sub_1E0998BB0()
{
  return MEMORY[0x1F40F1418]();
}

uint64_t sub_1E0998BC0()
{
  return MEMORY[0x1F40F1420]();
}

uint64_t _s8MusicKit4SongV0aB8InternalE15hasCustomLyricsSbvg_0()
{
  return MEMORY[0x1F40F1428]();
}

uint64_t sub_1E0998BE0()
{
  return MEMORY[0x1F40F1430]();
}

uint64_t sub_1E0998BF0()
{
  return MEMORY[0x1F40F1438]();
}

uint64_t sub_1E0998C00()
{
  return MEMORY[0x1F40F1440]();
}

uint64_t sub_1E0998C10()
{
  return MEMORY[0x1F40F1448]();
}

uint64_t _s8MusicKit4SongV0aB8InternalE19hasTimeSyncedLyricsSbvg_0()
{
  return MEMORY[0x1F40F1450]();
}

uint64_t sub_1E0998C30()
{
  return MEMORY[0x1F40F1458]();
}

uint64_t sub_1E0998C40()
{
  return MEMORY[0x1F40F1460]();
}

uint64_t sub_1E0998C50()
{
  return MEMORY[0x1F40F1468]();
}

uint64_t sub_1E0998C60()
{
  return MEMORY[0x1F40F1470]();
}

uint64_t sub_1E0998C70()
{
  return MEMORY[0x1F40F1478]();
}

uint64_t sub_1E0998C80()
{
  return MEMORY[0x1F40F1480]();
}

uint64_t sub_1E0998C90()
{
  return MEMORY[0x1F40F1488]();
}

uint64_t sub_1E0998CA0()
{
  return MEMORY[0x1F40F1490]();
}

uint64_t sub_1E0998CB0()
{
  return MEMORY[0x1F40F1498]();
}

uint64_t _s8MusicKit4SongV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F14A0]();
}

uint64_t sub_1E0998CD0()
{
  return MEMORY[0x1F40F14A8]();
}

uint64_t sub_1E0998CE0()
{
  return MEMORY[0x1F40F14B0]();
}

uint64_t sub_1E0998CF0()
{
  return MEMORY[0x1F40F14B8]();
}

uint64_t sub_1E0998D00()
{
  return MEMORY[0x1F40F14C0]();
}

uint64_t sub_1E0998D10()
{
  return MEMORY[0x1F40F14C8]();
}

uint64_t sub_1E0998D20()
{
  return MEMORY[0x1F40F14D0]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE14pickerSubtitleSSSgvg_0()
{
  return MEMORY[0x1F40F14D8]();
}

uint64_t sub_1E0998D40()
{
  return MEMORY[0x1F40F14E0]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE10isPreorderSbSgvg_0()
{
  return MEMORY[0x1F40F14E8]();
}

uint64_t sub_1E0998D60()
{
  return MEMORY[0x1F40F14F0]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE11versionHashSSSgvg_0()
{
  return MEMORY[0x1F40F14F8]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE12classicalURL10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1500]();
}

uint64_t sub_1E0998D90()
{
  return MEMORY[0x1F40F1508]();
}

uint64_t sub_1E0998DA0()
{
  return MEMORY[0x1F40F1510]();
}

uint64_t sub_1E0998DB0()
{
  return MEMORY[0x1F40F1518]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE13favoritedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1520]();
}

uint64_t sub_1E0998DD0()
{
  return MEMORY[0x1F40F1528]();
}

uint64_t sub_1E0998DE0()
{
  return MEMORY[0x1F40F1530]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE14downloadedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1538]();
}

uint64_t sub_1E0998E00()
{
  return MEMORY[0x1F40F1540]();
}

uint64_t sub_1E0998E10()
{
  return MEMORY[0x1F40F1548]();
}

uint64_t sub_1E0998E20()
{
  return MEMORY[0x1F40F1550]();
}

uint64_t sub_1E0998E30()
{
  return MEMORY[0x1F40F1558]();
}

uint64_t sub_1E0998E40()
{
  return MEMORY[0x1F40F1560]();
}

uint64_t sub_1E0998E50()
{
  return MEMORY[0x1F40F1568]();
}

uint64_t sub_1E0998E60()
{
  return MEMORY[0x1F40F1570]();
}

uint64_t sub_1E0998E70()
{
  return MEMORY[0x1F40F1578]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE20recommendationReasonSSSgvg_0()
{
  return MEMORY[0x1F40F1580]();
}

uint64_t sub_1E0998E90()
{
  return MEMORY[0x1F40F1588]();
}

uint64_t sub_1E0998EA0()
{
  return MEMORY[0x1F40F1590]();
}

uint64_t sub_1E0998EB0()
{
  return MEMORY[0x1F40F1598]();
}

uint64_t sub_1E0998EC0()
{
  return MEMORY[0x1F40F15A0]();
}

uint64_t sub_1E0998ED0()
{
  return MEMORY[0x1F40F15A8]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE24representativeTrackTitleSSSgvg_0()
{
  return MEMORY[0x1F40F15B0]();
}

uint64_t sub_1E0998EF0()
{
  return MEMORY[0x1F40F15B8]();
}

uint64_t sub_1E0998F00()
{
  return MEMORY[0x1F40F15C0]();
}

uint64_t sub_1E0998F10()
{
  return MEMORY[0x1F40F15C8]();
}

uint64_t _s8MusicKit5AlbumV0aB8InternalE30isClassicalExperienceAvailableSbvg_0()
{
  return MEMORY[0x1F40F15D0]();
}

uint64_t sub_1E0998F30()
{
  return MEMORY[0x1F40F15D8]();
}

uint64_t sub_1E0998F40()
{
  return MEMORY[0x1F40F15E0]();
}

uint64_t sub_1E0998F50()
{
  return MEMORY[0x1F40F15E8]();
}

uint64_t sub_1E0998F60()
{
  return MEMORY[0x1F40F15F0]();
}

uint64_t sub_1E0998F70()
{
  return MEMORY[0x1F40F15F8]();
}

uint64_t sub_1E0998F80()
{
  return MEMORY[0x1F40F1600]();
}

uint64_t sub_1E0998F90()
{
  return MEMORY[0x1F40F1608]();
}

uint64_t sub_1E0998FA0()
{
  return MEMORY[0x1F40F1610]();
}

uint64_t sub_1E0998FB0()
{
  return MEMORY[0x1F40F1618]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE9playlistsAA0A14ItemCollectionVyAA8PlaylistVGSgvg_0()
{
  return MEMORY[0x1F40F1620]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE9shortNameSSSgvg_0()
{
  return MEMORY[0x1F40F1628]();
}

uint64_t sub_1E0998FE0()
{
  return MEMORY[0x1F40F1630]();
}

uint64_t sub_1E0998FF0()
{
  return MEMORY[0x1F40F1638]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE14editorialNotesAA09EditorialF0VSgvg_0()
{
  return MEMORY[0x1F40F1640]();
}

uint64_t sub_1E0999010()
{
  return MEMORY[0x1F40F1648]();
}

uint64_t sub_1E0999020()
{
  return MEMORY[0x1F40F1650]();
}

uint64_t sub_1E0999030()
{
  return MEMORY[0x1F40F1658]();
}

uint64_t sub_1E0999040()
{
  return MEMORY[0x1F40F1660]();
}

uint64_t sub_1E0999050()
{
  return MEMORY[0x1F40F1668]();
}

uint64_t sub_1E0999060()
{
  return MEMORY[0x1F40F1670]();
}

uint64_t sub_1E0999070()
{
  return MEMORY[0x1F40F1678]();
}

uint64_t sub_1E0999080()
{
  return MEMORY[0x1F40F1680]();
}

uint64_t sub_1E0999090()
{
  return MEMORY[0x1F40F1688]();
}

uint64_t sub_1E09990A0()
{
  return MEMORY[0x1F40F1690]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE3url10Foundation3URLVSgvg_0()
{
  return MEMORY[0x1F40F1698]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F16A0]();
}

uint64_t _s8MusicKit5GenreV0aB8InternalE7artworkAA7ArtworkVSgvg_0()
{
  return MEMORY[0x1F40F16A8]();
}

uint64_t sub_1E09990E0()
{
  return MEMORY[0x1F40F16B0]();
}

uint64_t sub_1E09990F0()
{
  return MEMORY[0x1F40F16B8]();
}

uint64_t sub_1E0999100()
{
  return MEMORY[0x1F40F16C0]();
}

uint64_t sub_1E0999110()
{
  return MEMORY[0x1F40F16C8]();
}

uint64_t sub_1E0999120()
{
  return MEMORY[0x1F40F16D0]();
}

uint64_t sub_1E0999130()
{
  return MEMORY[0x1F40F16D8]();
}

uint64_t _s8MusicKit5TrackO0aB8InternalE13favoritedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F16E0]();
}

uint64_t sub_1E0999150()
{
  return MEMORY[0x1F40F16E8]();
}

uint64_t sub_1E0999160()
{
  return MEMORY[0x1F40F16F0]();
}

uint64_t sub_1E0999170()
{
  return MEMORY[0x1F40F16F8]();
}

uint64_t sub_1E0999180()
{
  return MEMORY[0x1F40F1700]();
}

uint64_t sub_1E0999190()
{
  return MEMORY[0x1F40F1708]();
}

uint64_t sub_1E09991A0()
{
  return MEMORY[0x1F40F1710]();
}

uint64_t sub_1E09991B0()
{
  return MEMORY[0x1F40F1718]();
}

uint64_t _s8MusicKit6ArtistV0aB8InternalE9biographySSSgvg_0()
{
  return MEMORY[0x1F40F1720]();
}

uint64_t sub_1E09991D0()
{
  return MEMORY[0x1F40F1728]();
}

uint64_t sub_1E09991E0()
{
  return MEMORY[0x1F40F1730]();
}

uint64_t _s8MusicKit6ArtistV0aB8InternalE12classicalURL10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1738]();
}

uint64_t sub_1E0999200()
{
  return MEMORY[0x1F40F1740]();
}

uint64_t _s8MusicKit6ArtistV0aB8InternalE13favoritedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1748]();
}

uint64_t sub_1E0999220()
{
  return MEMORY[0x1F40F1750]();
}

uint64_t sub_1E0999230()
{
  return MEMORY[0x1F40F1758]();
}

uint64_t sub_1E0999240()
{
  return MEMORY[0x1F40F1760]();
}

uint64_t sub_1E0999250()
{
  return MEMORY[0x1F40F1768]();
}

uint64_t sub_1E0999260()
{
  return MEMORY[0x1F40F1770]();
}

uint64_t sub_1E0999270()
{
  return MEMORY[0x1F40F1778]();
}

uint64_t sub_1E0999280()
{
  return MEMORY[0x1F40F1780]();
}

uint64_t sub_1E0999290()
{
  return MEMORY[0x1F40F1788]();
}

uint64_t sub_1E09992A0()
{
  return MEMORY[0x1F40F1790]();
}

uint64_t sub_1E09992B0()
{
  return MEMORY[0x1F40F1798]();
}

uint64_t sub_1E09992C0()
{
  return MEMORY[0x1F40F17A0]();
}

uint64_t _s8MusicKit6ArtistV0aB8InternalE30isClassicalExperienceAvailableSbvg_0()
{
  return MEMORY[0x1F40F17A8]();
}

uint64_t sub_1E09992E0()
{
  return MEMORY[0x1F40F17B0]();
}

uint64_t _s8MusicKit6ArtistV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F17B8]();
}

uint64_t sub_1E0999300()
{
  return MEMORY[0x1F40F17C0]();
}

uint64_t sub_1E0999310()
{
  return MEMORY[0x1F40F17C8]();
}

uint64_t sub_1E0999320()
{
  return MEMORY[0x1F40F17D0]();
}

uint64_t sub_1E0999330()
{
  return MEMORY[0x1F40F17D8]();
}

uint64_t sub_1E0999340()
{
  return MEMORY[0x1F40F17E0]();
}

uint64_t sub_1E0999350()
{
  return MEMORY[0x1F40F17E8]();
}

uint64_t sub_1E0999360()
{
  return MEMORY[0x1F40F17F0]();
}

uint64_t sub_1E0999370()
{
  return MEMORY[0x1F40F17F8]();
}

uint64_t sub_1E0999380()
{
  return MEMORY[0x1F40F1800]();
}

uint64_t sub_1E0999390()
{
  return MEMORY[0x1F40F1808]();
}

uint64_t sub_1E09993A0()
{
  return MEMORY[0x1F40F1810]();
}

uint64_t sub_1E09993B0()
{
  return MEMORY[0x1F40F1818]();
}

uint64_t sub_1E09993C0()
{
  return MEMORY[0x1F40F1820]();
}

uint64_t sub_1E09993D0()
{
  return MEMORY[0x1F40F1828]();
}

uint64_t sub_1E09993E0()
{
  return MEMORY[0x1F40F1830]();
}

uint64_t sub_1E09993F0()
{
  return MEMORY[0x1F40F1838]();
}

uint64_t sub_1E0999400()
{
  return MEMORY[0x1F40F1840]();
}

uint64_t sub_1E0999410()
{
  return MEMORY[0x1F40F1848]();
}

uint64_t sub_1E0999420()
{
  return MEMORY[0x1F40F1850]();
}

uint64_t sub_1E0999430()
{
  return MEMORY[0x1F40F1858]();
}

uint64_t sub_1E0999440()
{
  return MEMORY[0x1F40F1860]();
}

uint64_t sub_1E0999450()
{
  return MEMORY[0x1F40F1868]();
}

uint64_t sub_1E0999460()
{
  return MEMORY[0x1F40F1870]();
}

uint64_t sub_1E0999470()
{
  return MEMORY[0x1F40F1878]();
}

uint64_t sub_1E0999480()
{
  return MEMORY[0x1F40F1880]();
}

uint64_t sub_1E0999490()
{
  return MEMORY[0x1F40F1888]();
}

uint64_t sub_1E09994A0()
{
  return MEMORY[0x1F40F1890]();
}

uint64_t sub_1E09994B0()
{
  return MEMORY[0x1F40F1898]();
}

uint64_t sub_1E09994C0()
{
  return MEMORY[0x1F40F18A0]();
}

uint64_t sub_1E09994D0()
{
  return MEMORY[0x1F40F18A8]();
}

uint64_t sub_1E09994E0()
{
  return MEMORY[0x1F40F18B0]();
}

uint64_t sub_1E09994F0()
{
  return MEMORY[0x1F40F18B8]();
}

uint64_t _s8MusicKit7ArtworkV0aB8InternalE8hasTitleSbvg_0()
{
  return MEMORY[0x1F40F18C0]();
}

uint64_t sub_1E0999510()
{
  return MEMORY[0x1F40F18C8]();
}

uint64_t sub_1E0999520()
{
  return MEMORY[0x1F40F18D0]();
}

uint64_t sub_1E0999530()
{
  return MEMORY[0x1F40F18D8]();
}

uint64_t sub_1E0999540()
{
  return MEMORY[0x1F40F18E0]();
}

uint64_t sub_1E0999550()
{
  return MEMORY[0x1F40F18E8]();
}

uint64_t sub_1E0999560()
{
  return MEMORY[0x1F40F18F0]();
}

uint64_t sub_1E0999570()
{
  return MEMORY[0x1F40F18F8]();
}

uint64_t sub_1E0999580()
{
  return MEMORY[0x1F40F1900]();
}

uint64_t sub_1E0999590()
{
  return MEMORY[0x1F40F1908]();
}

uint64_t sub_1E09995A0()
{
  return MEMORY[0x1F40F1910]();
}

uint64_t sub_1E09995B0()
{
  return MEMORY[0x1F40F1918]();
}

uint64_t sub_1E09995C0()
{
  return MEMORY[0x1F40F1920]();
}

uint64_t sub_1E09995D0()
{
  return MEMORY[0x1F40F1928]();
}

uint64_t sub_1E09995E0()
{
  return MEMORY[0x1F40F1930]();
}

uint64_t _s8MusicKit7CuratorV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F1938]();
}

uint64_t sub_1E0999600()
{
  return MEMORY[0x1F40F1940]();
}

uint64_t sub_1E0999610()
{
  return MEMORY[0x1F40F1948]();
}

uint64_t sub_1E0999620()
{
  return MEMORY[0x1F40F1950]();
}

uint64_t sub_1E0999630()
{
  return MEMORY[0x1F40F1958]();
}

uint64_t sub_1E0999640()
{
  return MEMORY[0x1F40F1960]();
}

uint64_t sub_1E0999650()
{
  return MEMORY[0x1F40F1968]();
}

uint64_t sub_1E0999660()
{
  return MEMORY[0x1F40F1970]();
}

uint64_t sub_1E0999670()
{
  return MEMORY[0x1F40F1978]();
}

uint64_t sub_1E0999680()
{
  return MEMORY[0x1F40F1980]();
}

uint64_t sub_1E0999690()
{
  return MEMORY[0x1F40F1988]();
}

uint64_t sub_1E09996A0()
{
  return MEMORY[0x1F40F1990]();
}

uint64_t sub_1E09996B0()
{
  return MEMORY[0x1F40F1998]();
}

uint64_t sub_1E09996C0()
{
  return MEMORY[0x1F40F19A0]();
}

uint64_t _s8MusicKit7StationV0aB8InternalE12providerNameSSSgvg_0()
{
  return MEMORY[0x1F40F19A8]();
}

uint64_t _s8MusicKit7StationV0aB8InternalE20recommendationReasonSSSgvg_0()
{
  return MEMORY[0x1F40F19B0]();
}

uint64_t _s8MusicKit7StationV0aB8InternalE21providerUniversalLink10Foundation3URLVSgvg_0()
{
  return MEMORY[0x1F40F19B8]();
}

uint64_t sub_1E0999700()
{
  return MEMORY[0x1F40F19C0]();
}

uint64_t sub_1E0999710()
{
  return MEMORY[0x1F40F19C8]();
}

uint64_t _s8MusicKit7StationV0aB8InternalE24providerBundleIdentifierSSSgvg_0()
{
  return MEMORY[0x1F40F19D0]();
}

uint64_t sub_1E0999730()
{
  return MEMORY[0x1F40F19D8]();
}

uint64_t sub_1E0999740()
{
  return MEMORY[0x1F40F19E0]();
}

uint64_t _s8MusicKit7StationV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F19E8]();
}

uint64_t sub_1E0999760()
{
  return MEMORY[0x1F40F19F0]();
}

uint64_t sub_1E0999770()
{
  return MEMORY[0x1F40F19F8]();
}

uint64_t sub_1E0999780()
{
  return MEMORY[0x1F40F1A00]();
}

uint64_t sub_1E0999790()
{
  return MEMORY[0x1F40F1A08]();
}

uint64_t sub_1E09997A0()
{
  return MEMORY[0x1F40F1A10]();
}

uint64_t sub_1E09997B0()
{
  return MEMORY[0x1F40F1A18]();
}

uint64_t sub_1E09997C0()
{
  return MEMORY[0x1F40F1A20]();
}

uint64_t sub_1E09997D0()
{
  return MEMORY[0x1F40F1A28]();
}

uint64_t sub_1E09997E0()
{
  return MEMORY[0x1F40F1A30]();
}

uint64_t sub_1E09997F0()
{
  return MEMORY[0x1F40F1A38]();
}

uint64_t sub_1E0999800()
{
  return MEMORY[0x1F40F1A40]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE9isVisibleSbSgvg_0()
{
  return MEMORY[0x1F40F1A48]();
}

uint64_t sub_1E0999820()
{
  return MEMORY[0x1F40F1A50]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE14pickerSubtitleSSSgvg_0()
{
  return MEMORY[0x1F40F1A58]();
}

uint64_t sub_1E0999840()
{
  return MEMORY[0x1F40F1A60]();
}

uint64_t sub_1E0999850()
{
  return MEMORY[0x1F40F1A68]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE11versionHashSSSgvg_0()
{
  return MEMORY[0x1F40F1A70]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE12coverArtworkAA0F0VSgvg_0()
{
  return MEMORY[0x1F40F1A78]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE12supportsSingSbSgvg_0()
{
  return MEMORY[0x1F40F1A80]();
}

uint64_t sub_1E0999890()
{
  return MEMORY[0x1F40F1A88]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE13contentRatingAA07ContentF0OSgvg_0()
{
  return MEMORY[0x1F40F1A90]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE13favoritedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1A98]();
}

uint64_t sub_1E09998C0()
{
  return MEMORY[0x1F40F1AA0]();
}

uint64_t sub_1E09998D0()
{
  return MEMORY[0x1F40F1AA8]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE14downloadedDate10Foundation0F0VSgvg_0()
{
  return MEMORY[0x1F40F1AB0]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE14editorialNotesAA09EditorialF0VSgvg_0()
{
  return MEMORY[0x1F40F1AB8]();
}

uint64_t sub_1E0999900()
{
  return MEMORY[0x1F40F1AC0]();
}

uint64_t sub_1E0999920()
{
  return MEMORY[0x1F40F1AD0]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE15isCollaborativeSbSgvg_0()
{
  return MEMORY[0x1F40F1AD8]();
}

uint64_t sub_1E0999940()
{
  return MEMORY[0x1F40F1AE0]();
}

uint64_t sub_1E0999950()
{
  return MEMORY[0x1F40F1AE8]();
}

uint64_t sub_1E0999960()
{
  return MEMORY[0x1F40F1AF0]();
}

uint64_t sub_1E0999970()
{
  return MEMORY[0x1F40F1AF8]();
}

uint64_t sub_1E0999980()
{
  return MEMORY[0x1F40F1B00]();
}

uint64_t sub_1E0999990()
{
  return MEMORY[0x1F40F1B08]();
}

uint64_t sub_1E09999A0()
{
  return MEMORY[0x1F40F1B10]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE18hasAdminPrivilegesSbSgvg_0()
{
  return MEMORY[0x1F40F1B18]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE18tracksTiledArtworkAA0G0VSgvg_0()
{
  return MEMORY[0x1F40F1B20]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE20recommendationReasonSSSgvg_0()
{
  return MEMORY[0x1F40F1B28]();
}

uint64_t sub_1E09999E0()
{
  return MEMORY[0x1F40F1B30]();
}

uint64_t sub_1E09999F0()
{
  return MEMORY[0x1F40F1B38]();
}

uint64_t sub_1E0999A00()
{
  return MEMORY[0x1F40F1B40]();
}

uint64_t sub_1E0999A10()
{
  return MEMORY[0x1F40F1B48]();
}

uint64_t _s16MusicKitInternal0A23LibraryPlaylistResponseV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1F40F1B50]();
}

uint64_t sub_1E0999A30()
{
  return MEMORY[0x1F40F1B58]();
}

uint64_t sub_1E0999A40()
{
  return MEMORY[0x1F40F1B60]();
}

uint64_t sub_1E0999A50()
{
  return MEMORY[0x1F40F1B68]();
}

uint64_t sub_1E0999A60()
{
  return MEMORY[0x1F40F1B70]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F1B78]();
}

uint64_t sub_1E0999A80()
{
  return MEMORY[0x1F40F1B80]();
}

uint64_t sub_1E0999A90()
{
  return MEMORY[0x1F40F1B88]();
}

uint64_t sub_1E0999AA0()
{
  return MEMORY[0x1F40F1B90]();
}

uint64_t sub_1E0999AB0()
{
  return MEMORY[0x1F40F1B98]();
}

uint64_t sub_1E0999AC0()
{
  return MEMORY[0x1F40F1BA0]();
}

uint64_t sub_1E0999AD0()
{
  return MEMORY[0x1F40F1BA8]();
}

uint64_t sub_1E0999AE0()
{
  return MEMORY[0x1F40F1BB0]();
}

uint64_t sub_1E0999AF0()
{
  return MEMORY[0x1F40F1BB8]();
}

uint64_t sub_1E0999B00()
{
  return MEMORY[0x1F40F1BC0]();
}

uint64_t sub_1E0999B10()
{
  return MEMORY[0x1F40F1BC8]();
}

uint64_t sub_1E0999B20()
{
  return MEMORY[0x1F40F1BD0]();
}

uint64_t sub_1E0999B30()
{
  return MEMORY[0x1F40F1BD8]();
}

uint64_t sub_1E0999B40()
{
  return MEMORY[0x1F40F1BE0]();
}

uint64_t sub_1E0999B50()
{
  return MEMORY[0x1F40F1BE8]();
}

uint64_t sub_1E0999B60()
{
  return MEMORY[0x1F40F1BF0]();
}

uint64_t sub_1E0999B70()
{
  return MEMORY[0x1F40F1BF8]();
}

uint64_t sub_1E0999B80()
{
  return MEMORY[0x1F40F1C00]();
}

uint64_t sub_1E0999B90()
{
  return MEMORY[0x1F40F1C08]();
}

uint64_t sub_1E0999BA0()
{
  return MEMORY[0x1F40F1C10]();
}

uint64_t sub_1E0999BB0()
{
  return MEMORY[0x1F40F1C18]();
}

uint64_t sub_1E0999BC0()
{
  return MEMORY[0x1F40F1C20]();
}

uint64_t sub_1E0999BD0()
{
  return MEMORY[0x1F40F1C28]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE7isOwnerSbSgvg_0()
{
  return MEMORY[0x1F40F1C30]();
}

uint64_t sub_1E0999BF0()
{
  return MEMORY[0x1F40F1C38]();
}

uint64_t _s8MusicKit8PlaylistV0aB8InternalE8isPublicSbSgvg_0()
{
  return MEMORY[0x1F40F1C40]();
}

uint64_t sub_1E0999C10()
{
  return MEMORY[0x1F40F1C48]();
}

uint64_t sub_1E0999C20()
{
  return MEMORY[0x1F40F1C50]();
}

uint64_t sub_1E0999C30()
{
  return MEMORY[0x1F40F1C58]();
}

uint64_t sub_1E0999C40()
{
  return MEMORY[0x1F40F1C60]();
}

uint64_t sub_1E0999C50()
{
  return MEMORY[0x1F40F1C68]();
}

uint64_t sub_1E0999C60()
{
  return MEMORY[0x1F40F1C70]();
}

uint64_t sub_1E0999C70()
{
  return MEMORY[0x1F40F1C78]();
}

uint64_t sub_1E0999C80()
{
  return MEMORY[0x1F40F1C80]();
}

uint64_t sub_1E0999C90()
{
  return MEMORY[0x1F40F1C88]();
}

uint64_t sub_1E0999CA0()
{
  return MEMORY[0x1F40F1C90]();
}

uint64_t sub_1E0999CB0()
{
  return MEMORY[0x1F40F1C98]();
}

uint64_t sub_1E0999CC0()
{
  return MEMORY[0x1F40F1CA0]();
}

uint64_t sub_1E0999CD0()
{
  return MEMORY[0x1F40F1CA8]();
}

uint64_t sub_1E0999CE0()
{
  return MEMORY[0x1F40F1CB0]();
}

uint64_t sub_1E0999CF0()
{
  return MEMORY[0x1F40F1CB8]();
}

uint64_t sub_1E0999D00()
{
  return MEMORY[0x1F40F1CC0]();
}

uint64_t sub_1E0999D10()
{
  return MEMORY[0x1F40F1CC8]();
}

uint64_t sub_1E0999D20()
{
  return MEMORY[0x1F40F1CD0]();
}

uint64_t sub_1E0999D30()
{
  return MEMORY[0x1F40F1CD8]();
}

uint64_t sub_1E0999D40()
{
  return MEMORY[0x1F40F1CE0]();
}

uint64_t sub_1E0999D50()
{
  return MEMORY[0x1F40F1CE8]();
}

uint64_t sub_1E0999D60()
{
  return MEMORY[0x1F40F1CF0]();
}

uint64_t sub_1E0999D70()
{
  return MEMORY[0x1F40F1CF8]();
}

uint64_t sub_1E0999D80()
{
  return MEMORY[0x1F40F1D00]();
}

uint64_t sub_1E0999D90()
{
  return MEMORY[0x1F40F1D08]();
}

uint64_t sub_1E0999DA0()
{
  return MEMORY[0x1F40F1D10]();
}

uint64_t sub_1E0999DB0()
{
  return MEMORY[0x1F40F1D18]();
}

uint64_t sub_1E0999DC0()
{
  return MEMORY[0x1F40F1D20]();
}

uint64_t sub_1E0999DD0()
{
  return MEMORY[0x1F40F1D28]();
}

uint64_t sub_1E0999DE0()
{
  return MEMORY[0x1F40F1D30]();
}

uint64_t sub_1E0999DF0()
{
  return MEMORY[0x1F40F1D38]();
}

uint64_t sub_1E0999E00()
{
  return MEMORY[0x1F40F1D40]();
}

uint64_t sub_1E0999E10()
{
  return MEMORY[0x1F40F1D48]();
}

uint64_t sub_1E0999E20()
{
  return MEMORY[0x1F40F1D50]();
}

uint64_t sub_1E0999E30()
{
  return MEMORY[0x1F40F1D58]();
}

uint64_t sub_1E0999E40()
{
  return MEMORY[0x1F40F1D60]();
}

uint64_t sub_1E0999E50()
{
  return MEMORY[0x1F40F1D68]();
}

uint64_t sub_1E0999E60()
{
  return MEMORY[0x1F40F1D70]();
}

uint64_t sub_1E0999E70()
{
  return MEMORY[0x1F40F1D78]();
}

uint64_t sub_1E0999E80()
{
  return MEMORY[0x1F40F1D80]();
}

uint64_t sub_1E0999E90()
{
  return MEMORY[0x1F40F1D88]();
}

uint64_t _s8MusicKit9RadioShowV0aB8InternalE11pickerTitleSSSgvg_0()
{
  return MEMORY[0x1F40F1D90]();
}

uint64_t sub_1E0999EB0()
{
  return MEMORY[0x1F40F1D98]();
}

uint64_t sub_1E0999EC0()
{
  return MEMORY[0x1F40F1DA0]();
}

uint64_t sub_1E0999ED0()
{
  return MEMORY[0x1F40F1DA8]();
}

uint64_t sub_1E0999EE0()
{
  return MEMORY[0x1F40F1DB0]();
}

uint64_t sub_1E0999EF0()
{
  return MEMORY[0x1F41832F8]();
}

uint64_t sub_1E0999F00()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1E0999F10()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1E0999F20()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1E0999F30()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1E0999F40()
{
  return MEMORY[0x1F40F1DB8]();
}

uint64_t sub_1E0999F50()
{
  return MEMORY[0x1F40F1DC0]();
}

uint64_t sub_1E0999F60()
{
  return MEMORY[0x1F40F1DC8]();
}

uint64_t sub_1E0999F70()
{
  return MEMORY[0x1F40F1DD0]();
}

uint64_t sub_1E0999F80()
{
  return MEMORY[0x1F40F1DD8]();
}

uint64_t sub_1E0999F90()
{
  return MEMORY[0x1F40F1DE0]();
}

uint64_t sub_1E0999FA0()
{
  return MEMORY[0x1F40F1DE8]();
}

uint64_t sub_1E0999FB0()
{
  return MEMORY[0x1F40F1DF0]();
}

uint64_t sub_1E0999FC0()
{
  return MEMORY[0x1F40F1DF8]();
}

uint64_t sub_1E0999FD0()
{
  return MEMORY[0x1F41834C8]();
}

uint64_t sub_1E0999FE0()
{
  return MEMORY[0x1F41834E8]();
}

uint64_t sub_1E0999FF0()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1E099A000()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1E099A010()
{
  return MEMORY[0x1F41836D0]();
}

uint64_t sub_1E099A020()
{
  return MEMORY[0x1F4183720]();
}

uint64_t sub_1E099A030()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1E099A040()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1E099A050()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1E099A060()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1E099A070()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1E099A080()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1E099A090()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1E099A0A0()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1E099A0B0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1E099A0C0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1E099A0D0()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1E099A0E0()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1E099A0F0()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1E099A100()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1E099A110()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1E099A120()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1E099A130()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1E099A140()
{
  return MEMORY[0x1F40F1E00]();
}

uint64_t sub_1E099A150()
{
  return MEMORY[0x1F40F1E08]();
}

uint64_t sub_1E099A160()
{
  return MEMORY[0x1F40F1E10]();
}

uint64_t sub_1E099A170()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1E099A180()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1E099A190()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1E099A1B0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1E099A1C0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1E099A1D0()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1E099A1E0()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1E099A1F0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1E099A200()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1E099A210()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1E099A220()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1E099A230()
{
  return MEMORY[0x1F4183BC0]();
}

uint64_t sub_1E099A240()
{
  return MEMORY[0x1F4183BC8]();
}

uint64_t sub_1E099A250()
{
  return MEMORY[0x1F40F1E18]();
}

uint64_t sub_1E099A260()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1E099A270()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1E099A280()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1E099A290()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1E099A2A0()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1E099A2B0()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1E099A2C0()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_1E099A2D0()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1E099A2E0()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1E099A2F0()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_1E099A300()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1E099A310()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_1E099A320()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1E099A330()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1E099A340()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1E099A350()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1E099A360()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1E099A370()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1E099A380()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1E099A390()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1E099A3A0()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1E099A3B0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1E099A3C0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1E099A3D0()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1E099A3E0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1E099A3F0()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1E099A400()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1E099A410()
{
  return MEMORY[0x1F40F1E20]();
}

uint64_t sub_1E099A420()
{
  return MEMORY[0x1F40F1E28]();
}

uint64_t sub_1E099A430()
{
  return MEMORY[0x1F40F1E30]();
}

uint64_t sub_1E099A440()
{
  return MEMORY[0x1F40F1E38]();
}

uint64_t sub_1E099A450()
{
  return MEMORY[0x1F40F1E40]();
}

uint64_t sub_1E099A460()
{
  return MEMORY[0x1F40F1E48]();
}

uint64_t sub_1E099A470()
{
  return MEMORY[0x1F40F1E50]();
}

uint64_t sub_1E099A480()
{
  return MEMORY[0x1F40F1E58]();
}

uint64_t sub_1E099A490()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1E099A4A0()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1E099A4B0()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1E099A4C0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1E099A4D0()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1E099A4E0()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1E099A4F0()
{
  return MEMORY[0x1F4183FD0]();
}

uint64_t sub_1E099A500()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1E099A510()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1E099A520()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1E099A530()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1E099A540()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_1E099A550()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_1E099A580()
{
  return MEMORY[0x1F4187C70]();
}

uint64_t sub_1E099A5A0()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_1E099A5B0()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_1E099A5C0()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t sub_1E099A5D0()
{
  return MEMORY[0x1F4187CD0]();
}

uint64_t sub_1E099A5E0()
{
  return MEMORY[0x1F4187CD8]();
}

uint64_t sub_1E099A5F0()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t sub_1E099A600()
{
  return MEMORY[0x1F4187CF0]();
}

uint64_t sub_1E099A610()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1E099A620()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1E099A630()
{
  return MEMORY[0x1F4187D98]();
}

uint64_t sub_1E099A650()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t sub_1E099A660()
{
  return MEMORY[0x1F4187DD0]();
}

uint64_t sub_1E099A670()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1E099A690()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1E099A6A0()
{
  return MEMORY[0x1F40F1E60]();
}

uint64_t sub_1E099A6B0()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1E099A6C0()
{
  return MEMORY[0x1F4184280]();
}

uint64_t sub_1E099A6D0()
{
  return MEMORY[0x1F40F1E68]();
}

uint64_t sub_1E099A6E0()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1E099A6F0()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1E099A700()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1E099A710()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1E099A720()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1E099A730()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1E099A740()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1E099A750()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1E099A760()
{
  return MEMORY[0x1F40F1E70]();
}

uint64_t sub_1E099A770()
{
  return MEMORY[0x1F4187398]();
}

uint64_t sub_1E099A780()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1E099A790()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1E099A7A0()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1E099A7C0()
{
  return MEMORY[0x1F41873A8]();
}

uint64_t sub_1E099A7D0()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1E099A7E0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1E099A7F0()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1E099A800()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1E099A810()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1E099A820()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1E099A830()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1E099A840()
{
  return MEMORY[0x1F4187230]();
}

uint64_t sub_1E099A850()
{
  return MEMORY[0x1F40E6748]();
}

uint64_t sub_1E099A860()
{
  return MEMORY[0x1F40E6758]();
}

uint64_t sub_1E099A870()
{
  return MEMORY[0x1F40E6778]();
}

uint64_t sub_1E099A880()
{
  return MEMORY[0x1F41872D0]();
}

uint64_t sub_1E099A890()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1E099A8A0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1E099A8B0()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1E099A8C0()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1E099A8D0()
{
  return MEMORY[0x1F40F1E78]();
}

uint64_t sub_1E099A8E0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1E099A8F0()
{
  return MEMORY[0x1F4184648]();
}

uint64_t sub_1E099A900()
{
  return MEMORY[0x1F4184650]();
}

uint64_t sub_1E099A910()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1E099A920()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1E099A930()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1E099A940()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1E099A950()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1E099A960()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1E099A970()
{
  return MEMORY[0x1F40E6D38]();
}

uint64_t sub_1E099A980()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1E099A990()
{
  return MEMORY[0x1F41849B0]();
}

uint64_t sub_1E099A9A0()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1E099A9C0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1E099A9D0()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1E099A9E0()
{
  return MEMORY[0x1F4184BE0]();
}

uint64_t sub_1E099A9F0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1E099AA00()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1E099AA10()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1E099AA20()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1E099AA30()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1E099AA40()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t sub_1E099AA50()
{
  return MEMORY[0x1F4184D60]();
}

uint64_t sub_1E099AA60()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1E099AA70()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1E099AA80()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1E099AA90()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1E099AAA0()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_1E099AAB0()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1E099AAC0()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_1E099AAD0()
{
  return MEMORY[0x1F4184E10]();
}

uint64_t sub_1E099AAE0()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_1E099AAF0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1E099AB10()
{
  return MEMORY[0x1F4184E88]();
}

uint64_t sub_1E099AB20()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1E099AB30()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1E099AB40()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1E099AB50()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1E099AB60()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1E099AB70()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1E099AB80()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1E099AB90()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1E099ABA0()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1E099ABB0()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1E099ABC0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1E099ABD0()
{
  return MEMORY[0x1F40F1E80]();
}

uint64_t sub_1E099ABE0()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_1E099ABF0()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1E099AC00()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1E099AC10()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1E099AC20()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1E099AC30()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1E099AC40()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1E099AC50()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1E099AC60()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1E099AC70()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1E099AC80()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1E099AC90()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1E099ACA0()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1E099ACB0()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1E099ACC0()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1E099ACD0()
{
  return MEMORY[0x1F41853C0]();
}

uint64_t sub_1E099ACE0()
{
  return MEMORY[0x1F41853E8]();
}

uint64_t sub_1E099AD00()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_1E099AD10()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1E099AD30()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1E099AD40()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1E099AD50()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1E099AD60()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_1E099AD70()
{
  return MEMORY[0x1F4185508]();
}

uint64_t sub_1E099AD80()
{
  return MEMORY[0x1F4185518]();
}

uint64_t sub_1E099AD90()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1E099ADA0()
{
  return MEMORY[0x1F4185540]();
}

uint64_t sub_1E099ADB0()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1E099ADC0()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1E099ADD0()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1E099ADE0()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1E099ADF0()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1E099AE00()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1E099AE10()
{
  return MEMORY[0x1F41855E8]();
}

uint64_t sub_1E099AE20()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_1E099AE30()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1E099AE40()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1E099AE50()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_1E099AE60()
{
  return MEMORY[0x1F4185638]();
}

uint64_t sub_1E099AE70()
{
  return MEMORY[0x1F4185648]();
}

uint64_t sub_1E099AE80()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1E099AE90()
{
  return MEMORY[0x1F4185668]();
}

uint64_t sub_1E099AEA0()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1E099AEB0()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1E099AEC0()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1E099AED0()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1E099AEE0()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1E099AEF0()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_1E099AF00()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1E099AF10()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1E099AF20()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1E099AF40()
{
  return MEMORY[0x1F41859B0]();
}

uint64_t sub_1E099AF50()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1E099AF70()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1E099AF80()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1E099AF90()
{
  return MEMORY[0x1F4185A58]();
}

uint64_t sub_1E099AFA0()
{
  return MEMORY[0x1F4185A78]();
}

uint64_t sub_1E099AFB0()
{
  return MEMORY[0x1F4185AF0]();
}

uint64_t sub_1E099AFC0()
{
  return MEMORY[0x1F4185B10]();
}

uint64_t sub_1E099AFD0()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1E099AFE0()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1E099AFF0()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1E099B000()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1E099B010()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1E099B040()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1E099B050()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1E099B060()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1E099B070()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1E099B080()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1E099B090()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1E099B0A0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1E099B0B0()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1E099B0C0()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1E099B0D0()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1E099B0E0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1E099B0F0()
{
  return MEMORY[0x1F4185FA8]();
}

uint64_t sub_1E099B100()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_1E099B110()
{
  return MEMORY[0x1F40F1E88]();
}

uint64_t sub_1E099B120()
{
  return MEMORY[0x1F40F1E90]();
}

uint64_t sub_1E099B130()
{
  return MEMORY[0x1F4185FC0]();
}

uint64_t sub_1E099B140()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1E099B150()
{
  return MEMORY[0x1F4185FD0]();
}

uint64_t sub_1E099B160()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1E099B170()
{
  return MEMORY[0x1F40F1E98]();
}

uint64_t sub_1E099B180()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1E099B190()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_1E099B1C0()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1E099B1D0()
{
  return MEMORY[0x1F4186318]();
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x1F4177C20]();
}

uint64_t MRMediaRemoteSendCommandToPlayerWithResult()
{
  return MEMORY[0x1F412E768]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x1F412E9D8]();
}

uint64_t MRSystemAppPlaybackQueueCreateExternalRepresentation()
{
  return MEMORY[0x1F412E9E0]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x1F412EAB0]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryData()
{
  return MEMORY[0x1F412EAB8]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryFirstItemMultiverseIDData()
{
  return MEMORY[0x1F412EAC0]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryShuffleMode()
{
  return MEMORY[0x1F412EAD0]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationIDType()
{
  return MEMORY[0x1F412EAD8]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationStringIdentifier()
{
  return MEMORY[0x1F412EAE0]();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return MEMORY[0x1F412EAE8]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1F4188200]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1F41866E8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x1F4186738]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}