__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_236CD8650(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_236CD8670(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

void type metadata accessor for SHError(uint64_t a1)
{
}

void type metadata accessor for SHListeningLayerState(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for AttributedListeningView()
{
  return &type metadata for AttributedListeningView;
}

uint64_t sub_236CD86E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CD8700@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_236CFBDE0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = sub_236CD8744;
  *(void *)(a1 + 32) = 0;
  return result;
}

double sub_236CD8744@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFBD40();
  sub_236CD8860((uint64_t)v9);
  *(_OWORD *)&v11[119] = v9[7];
  *(_OWORD *)&v11[103] = v9[6];
  *(_OWORD *)&v11[55] = v9[3];
  *(_OWORD *)&v11[39] = v9[2];
  *(_OWORD *)&v11[135] = v10[0];
  *(_OWORD *)&v11[144] = *(_OWORD *)((char *)v10 + 9);
  *(_OWORD *)&v11[71] = v9[4];
  *(_OWORD *)&v11[87] = v9[5];
  *(_OWORD *)&v11[7] = v9[0];
  *(_OWORD *)&v11[23] = v9[1];
  long long v3 = *(_OWORD *)&v11[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v11[96];
  *(_OWORD *)(a1 + 129) = v3;
  long long v4 = *(_OWORD *)&v11[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v11[128];
  *(_OWORD *)(a1 + 161) = v4;
  long long v5 = *(_OWORD *)&v11[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v11[32];
  *(_OWORD *)(a1 + 65) = v5;
  long long v6 = *(_OWORD *)&v11[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v11[64];
  *(_OWORD *)(a1 + 97) = v6;
  double result = *(double *)v11;
  long long v8 = *(_OWORD *)&v11[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v11;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 33) = v8;
  return result;
}

uint64_t sub_236CD8860@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for SHListeningLayerState(0);
  sub_236CFC1F0();
  uint64_t v11 = *(void *)&v29[16];
  swift_retain();
  swift_retain();
  sub_236CFC1F0();
  long long v3 = *(_OWORD *)&v31[8];
  sub_236CFC1F0();
  swift_release();
  swift_release();
  long long v4 = *(_OWORD *)&v31[8];
  sub_236CFBBE0();
  sub_236CFBBE0();
  sub_236CFC250();
  sub_236CFBBD0();
  int v37 = v19;
  __int16 v38 = v20;
  *(_DWORD *)v41 = *(_DWORD *)v18;
  *(_DWORD *)&v41[3] = *(_DWORD *)&v18[3];
  *(_DWORD *)&v44[3] = *(_DWORD *)&v17[3];
  *(_DWORD *)v44 = *(_DWORD *)v17;
  *(_WORD *)&v24[30] = v20;
  *(_DWORD *)&v24[26] = v19;
  HIDWORD(v25) = *(_DWORD *)&v18[3];
  long long v21 = *(_OWORD *)v29;
  *(void *)&long long v22 = *(void *)&v29[16];
  *((void *)&v22 + 1) = 4;
  long long v23 = *(_OWORD *)&v31[8];
  *(void *)v24 = 4;
  *(_OWORD *)&v24[8] = *(_OWORD *)&v31[8];
  *(_WORD *)&v24[24] = 0;
  *(void *)&long long v25 = v12;
  BYTE8(v25) = v13;
  *(_DWORD *)((char *)&v25 + 9) = *(_DWORD *)v18;
  *(void *)&long long v26 = v14;
  BYTE8(v26) = v15;
  *(_DWORD *)((char *)&v26 + 9) = *(_DWORD *)v17;
  HIDWORD(v26) = *(_DWORD *)&v17[3];
  long long v27 = v16;
  char v30 = 1;
  *(_OWORD *)&v29[55] = *(_OWORD *)v24;
  *(_OWORD *)&v29[39] = *(_OWORD *)&v31[8];
  *(_OWORD *)&v29[23] = v22;
  *(_OWORD *)&v29[7] = *(_OWORD *)v29;
  long long v2 = *(_OWORD *)&v29[7];
  *(_OWORD *)&v29[119] = v16;
  *(_OWORD *)&v29[103] = v26;
  *(_OWORD *)&v29[87] = v25;
  *(_OWORD *)&v29[71] = *(_OWORD *)&v24[16];
  char v28 = 1;
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  long long v5 = *(_OWORD *)&v29[16];
  *(_OWORD *)(a1 + 9) = *(_OWORD *)v29;
  long long v6 = *(_OWORD *)&v29[80];
  *(_OWORD *)(a1 + 73) = *(_OWORD *)&v29[64];
  long long v7 = *(_OWORD *)&v29[32];
  *(_OWORD *)(a1 + 57) = *(_OWORD *)&v29[48];
  *(_OWORD *)(a1 + 41) = v7;
  *(_OWORD *)(a1 + 25) = v5;
  long long v8 = *(_OWORD *)&v29[96];
  long long v9 = *(_OWORD *)&v29[112];
  *(void *)(a1 + 136) = *(void *)&v29[127];
  *(void *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 121) = v9;
  *(_OWORD *)(a1 + 105) = v8;
  *(_OWORD *)(a1 + 89) = v6;
  *(unsigned char *)(a1 + 152) = 1;
  *(_OWORD *)v31 = v2;
  *(void *)&v31[16] = v11;
  uint64_t v32 = 4;
  long long v33 = v3;
  uint64_t v34 = 4;
  long long v35 = v4;
  __int16 v36 = 0;
  uint64_t v39 = v12;
  char v40 = v13;
  uint64_t v42 = v14;
  char v43 = v15;
  long long v45 = v16;
  sub_236CD98E0((uint64_t)&v21);
  return sub_236CD9950((uint64_t)v31);
}

uint64_t sub_236CD8B24()
{
  return sub_236CFC090();
}

uint64_t sub_236CD8B44(uint64_t a1, uint64_t a2)
{
  return sub_236CD8CE8(a1, a2, MEMORY[0x263F8D308]);
}

id sub_236CD8B70()
{
  return *v0;
}

uint64_t sub_236CD8B78@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_236CD8B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_236CD8C04(uint64_t a1, uint64_t a2)
{
  return sub_236CD8CE8(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_236CD8C1C()
{
  sub_236CFC360();
  sub_236CFC370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_236CD8C70()
{
  sub_236CFC360();
  sub_236CFC660();
  sub_236CFC370();
  uint64_t v0 = sub_236CFC670();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_236CD8CE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_236CFC360();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_236CD8D2C(uint64_t a1, id *a2)
{
  uint64_t result = sub_236CFC340();
  *a2 = 0;
  return result;
}

uint64_t sub_236CD8DA4(uint64_t a1, id *a2)
{
  char v3 = sub_236CFC350();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_236CD8E24@<X0>(uint64_t *a1@<X8>)
{
  sub_236CFC360();
  uint64_t v2 = sub_236CFC330();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_236CD8E68()
{
  return sub_236CFC360();
}

uint64_t sub_236CD8E78(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_236CD8EE4(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_236CD8F50(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_236CD8FE0()
{
  id v1 = *v0;
  uint64_t v2 = sub_236CFC480();

  return v2;
}

uint64_t sub_236CD9018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_236CD9094()
{
  return sub_236CFC670();
}

void *sub_236CD90F4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_236CD9104(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_236CD9110()
{
  uint64_t v0 = sub_236CFC360();
  uint64_t v2 = v1;
  if (v0 == sub_236CFC360() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_236CFC610();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_236CD91A0(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE330, type metadata accessor for DocumentAttributeKey);
  uint64_t v3 = sub_236CD94F0(&qword_2688CE338, type metadata accessor for DocumentAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_236CD925C(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE340, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v3 = sub_236CD94F0(&qword_2688CE348, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_236CD9318(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE278, type metadata accessor for SHError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_236CD9384(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE278, type metadata accessor for SHError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_236CD93F4(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_236CD9460()
{
  return sub_236CD94F0((unint64_t *)&qword_2688CE268, type metadata accessor for SHError);
}

uint64_t sub_236CD94A8()
{
  return sub_236CD94F0(&qword_2688CE270, type metadata accessor for SHError);
}

uint64_t sub_236CD94F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236CD9538()
{
  return sub_236CD94F0(&qword_2688CE278, type metadata accessor for SHError);
}

uint64_t sub_236CD9580()
{
  return sub_236CD94F0(&qword_2688CE280, type metadata accessor for SHError);
}

uint64_t sub_236CD95C8()
{
  return sub_236CD94F0(&qword_2688CE288, type metadata accessor for SHError);
}

uint64_t sub_236CD9610()
{
  return sub_236CD94F0(&qword_2688CE290, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_236CD966C()
{
  return sub_236CD94F0(&qword_2688CE298, type metadata accessor for Code);
}

unint64_t sub_236CD96B8()
{
  unint64_t result = qword_2688CE2A0;
  if (!qword_2688CE2A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE2A0);
  }
  return result;
}

uint64_t sub_236CD970C()
{
  return sub_236CD94F0(&qword_2688CE2A8, type metadata accessor for Code);
}

uint64_t sub_236CD9754()
{
  return sub_236CD94F0(&qword_2688CE2B0, type metadata accessor for SHError);
}

BOOL sub_236CD979C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_236CD97B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_236CFC330();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_236CD97F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236CFC360();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_236CD9824(uint64_t a1)
{
  uint64_t v2 = sub_236CD94F0((unint64_t *)&qword_2688CE350, type metadata accessor for SHAnalyticsPayload);
  uint64_t v3 = sub_236CD94F0(&qword_2688CE358, type metadata accessor for SHAnalyticsPayload);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_236CD98E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_236CD9950(uint64_t a1)
{
  return a1;
}

void type metadata accessor for DocumentAttributeKey(uint64_t a1)
{
}

void type metadata accessor for DocumentReadingOptionKey(uint64_t a1)
{
}

void type metadata accessor for SHAnalyticsPayload(uint64_t a1)
{
}

unint64_t sub_236CD99FC()
{
  unint64_t result = qword_2688CE2D8;
  if (!qword_2688CE2D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE2E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE2D8);
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

uint64_t sub_236CD9AA0()
{
  return sub_236CD94F0(&qword_2688CE2E8, type metadata accessor for SHAnalyticsPayload);
}

uint64_t sub_236CD9AE8()
{
  return sub_236CD94F0(&qword_2688CE2F0, type metadata accessor for SHAnalyticsPayload);
}

uint64_t sub_236CD9B30()
{
  return sub_236CD94F0(&qword_2688CE2F8, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_236CD9B78()
{
  return sub_236CD94F0(&qword_2688CE300, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_236CD9BC0()
{
  return sub_236CD94F0(&qword_2688CE308, type metadata accessor for DocumentAttributeKey);
}

uint64_t sub_236CD9C08()
{
  return sub_236CD94F0(&qword_2688CE310, type metadata accessor for DocumentAttributeKey);
}

uint64_t sub_236CD9C50()
{
  return sub_236CD94F0(&qword_2688CE318, type metadata accessor for DocumentAttributeKey);
}

uint64_t sub_236CD9C98()
{
  return sub_236CD94F0(&qword_2688CE320, type metadata accessor for DocumentReadingOptionKey);
}

uint64_t sub_236CD9CE0()
{
  return sub_236CD94F0(&qword_2688CE328, type metadata accessor for SHAnalyticsPayload);
}

void type metadata accessor for SHMediaItemPresentationStyle(uint64_t a1)
{
}

void sub_236CD9D3C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_236CD9D8C(char a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFB990();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0 && a2)
  {
    id v10 = a2;
    if (qword_2688CE248 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_236CFBA80();
    __swift_project_value_buffer(v11, (uint64_t)qword_2688D0F78);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
    id v12 = a2;
    id v13 = a2;
    uint64_t v14 = sub_236CFBA60();
    os_log_type_t v15 = sub_236CFC440();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      long long v23 = (void *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v26 = v24;
      *(_DWORD *)uint64_t v16 = 136315394;
      sub_236CDABEC();
      uint64_t v17 = sub_236CFC600();
      uint64_t v25 = sub_236CDA13C(v17, v18, &v26);
      sub_236CFC510();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      *(_WORD *)(v16 + 12) = 2112;
      id v19 = a2;
      uint64_t v20 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v25 = v20;
      sub_236CFC510();
      long long v21 = v23;
      *long long v23 = v20;

      _os_log_impl(&dword_236CCF000, v14, v15, "Failed to launch url: %s error: %@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE378);
      swift_arrayDestroy();
      MEMORY[0x237E0E170](v21, -1, -1);
      uint64_t v22 = v24;
      swift_arrayDestroy();
      MEMORY[0x237E0E170](v22, -1, -1);
      MEMORY[0x237E0E170](v16, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

void sub_236CDA0C4(uint64_t a1, uint64_t a2, void *a3)
{
  char v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_236CDA13C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_236CDA210(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_236CDAC94((uint64_t)v12, *a3);
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
      sub_236CDAC94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_236CDA210(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_236CFC520();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_236CDA3CC(a5, a6);
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
  uint64_t v8 = sub_236CFC560();
  if (!v8)
  {
    sub_236CFC580();
    __break(1u);
LABEL_17:
    uint64_t result = sub_236CFC5E0();
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

uint64_t sub_236CDA3CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_236CDA464(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_236CDA644(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_236CDA644(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_236CDA464(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_236CDA5DC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_236CFC540();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_236CFC580();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_236CFC380();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_236CFC5E0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_236CFC580();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_236CDA5DC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE380);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_236CDA644(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE380);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_236CFC5E0();
  __break(1u);
  return result;
}

void sub_236CDA794(uint64_t a1)
{
  uint64_t v2 = sub_236CFB990();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F018D8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE368);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236CFE530;
  *(void *)(inited + 32) = sub_236CFC360();
  *(void *)(inited + 40) = v7;
  uint64_t v8 = MEMORY[0x263F8D4F8];
  *(void *)(inited + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(inited + 48) = 1;
  *(void *)(inited + 80) = sub_236CFC360();
  *(void *)(inited + 88) = v9;
  *(void *)(inited + 120) = v8;
  *(unsigned char *)(inited + 96) = 1;
  sub_236CE6904(inited);
  uint64_t v10 = (void *)sub_236CFC2D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setFrontBoardOptions_, v10);

  size_t v11 = self;
  uint64_t v12 = (void *)sub_236CFB970();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v14 + v13, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_236CDAB1C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_236CDA0C4;
  aBlock[3] = &block_descriptor_4;
  os_log_type_t v15 = _Block_copy(aBlock);
  id v16 = v5;
  swift_release();
  objc_msgSend(v11, sel_openWithURL_configuration_completionHandler_, v12, v16, v15);
  _Block_release(v15);
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

uint64_t sub_236CDAA8C()
{
  uint64_t v1 = sub_236CFB990();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

void sub_236CDAB1C(char a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_236CFB990() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  sub_236CD9D8C(a1, a2, v6);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_236CDABEC()
{
  unint64_t result = qword_2688CE370;
  if (!qword_2688CE370)
  {
    sub_236CFB990();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE370);
  }
  return result;
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

uint64_t sub_236CDAC94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for NoMatch()
{
  return &type metadata for NoMatch;
}

uint64_t sub_236CDAD04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CDAD20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a1;
  unint64_t v42 = 0xD000000000000015;
  unint64_t v43 = 0x8000000236D000C0;
  unint64_t v44 = 0xD000000000000018;
  unint64_t v45 = 0x8000000236D000E0;
  sub_236CFC260();
  sub_236CDAF38(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v46, 0.0, 1, 0.0, 1);
  unsigned __int8 v3 = sub_236CFBF30();
  unsigned __int8 v4 = sub_236CFBF50();
  char v5 = sub_236CFBF40();
  sub_236CFBF40();
  if (sub_236CFBF40() != v3) {
    char v5 = sub_236CFBF40();
  }
  sub_236CFBF40();
  if (sub_236CFBF40() != v4) {
    char v5 = sub_236CFBF40();
  }
  sub_236CFBB20();
  long long v6 = v52;
  v33[6] = v52;
  v33[7] = v53;
  v33[8] = v54;
  long long v7 = v48;
  v33[2] = v48;
  v33[3] = v49;
  v33[4] = v50;
  v33[5] = v51;
  v33[0] = v46;
  v33[1] = v47;
  long long v26 = v52;
  long long v27 = v53;
  long long v28 = v54;
  long long v22 = v48;
  long long v23 = v49;
  long long v24 = v50;
  long long v25 = v51;
  uint64_t v34 = v55;
  *(void *)&long long v29 = v55;
  long long v20 = v46;
  long long v21 = v47;
  BYTE8(v29) = v5;
  *(void *)&long long v30 = v8;
  *((void *)&v30 + 1) = v9;
  *(void *)&long long v31 = v10;
  *((void *)&v31 + 1) = v11;
  char v32 = 0;
  *(unsigned char *)(a2 + 192) = 0;
  long long v12 = v27;
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v12;
  long long v13 = v23;
  long long v15 = v24;
  long long v14 = v25;
  *(_OWORD *)(a2 + 32) = v7;
  *(_OWORD *)(a2 + 48) = v13;
  *(_OWORD *)(a2 + 64) = v15;
  *(_OWORD *)(a2 + 80) = v14;
  long long v16 = v21;
  *(_OWORD *)a2 = v20;
  *(_OWORD *)(a2 + 16) = v16;
  long long v17 = v29;
  *(_OWORD *)(a2 + 128) = v28;
  *(_OWORD *)(a2 + 144) = v17;
  long long v18 = v31;
  *(_OWORD *)(a2 + 160) = v30;
  *(_OWORD *)(a2 + 176) = v18;
  char v35 = v5;
  uint64_t v36 = v8;
  uint64_t v37 = v9;
  uint64_t v38 = v10;
  uint64_t v39 = v11;
  char v40 = 0;
  sub_236CDB3A4((uint64_t)&v20);
  return sub_236CDB3DC((uint64_t)v33);
}

uint64_t sub_236CDAF38@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_236CFC450();
    long long v23 = (void *)sub_236CFBF10();
    sub_236CFBA50();
  }
  sub_236CFBC90();
  long long v24 = *(_OWORD *)(v13 + 8);
  long long v34 = *(_OWORD *)(v13 + 24);
  long long v35 = v24;
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 88) = v30;
  *(_OWORD *)(a9 + 104) = v31;
  *(_OWORD *)(a9 + 120) = v32;
  *(_OWORD *)(a9 + 136) = v33;
  *(_OWORD *)(a9 + 40) = v27;
  *(_OWORD *)(a9 + 56) = v28;
  *(void *)(a9 + 32) = *(void *)(v13 + 32);
  *(_OWORD *)(a9 + 72) = v29;
  sub_236CDB414((uint64_t)&v35);
  return sub_236CDB414((uint64_t)&v34);
}

__n128 sub_236CDB0F8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_236CFC450();
    long long v22 = (void *)sub_236CFBF10();
    sub_236CFBA50();
  }
  sub_236CFBC90();
  a9[4] = v28;
  a9[5] = v29;
  a9[6] = v30;
  *a9 = v24;
  a9[1] = v25;
  __n128 result = v27;
  a9[2] = v26;
  a9[3] = v27;
  return result;
}

double sub_236CDB284@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_236CFBDE0();
  sub_236CDAD20(v3, (uint64_t)v12);
  *(_OWORD *)&v14[151] = v12[9];
  *(_OWORD *)&v14[167] = v12[10];
  *(_OWORD *)&v14[183] = v12[11];
  v14[199] = v13;
  *(_OWORD *)&v14[87] = v12[5];
  *(_OWORD *)&v14[103] = v12[6];
  *(_OWORD *)&v14[119] = v12[7];
  *(_OWORD *)&v14[135] = v12[8];
  *(_OWORD *)&v14[23] = v12[1];
  *(_OWORD *)&v14[39] = v12[2];
  *(_OWORD *)&v14[55] = v12[3];
  *(_OWORD *)&v14[71] = v12[4];
  *(_OWORD *)&v14[7] = v12[0];
  long long v5 = *(_OWORD *)&v14[128];
  *(_OWORD *)(a1 + 161) = *(_OWORD *)&v14[144];
  long long v6 = *(_OWORD *)&v14[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v14[160];
  *(_OWORD *)(a1 + 193) = v6;
  long long v7 = *(_OWORD *)&v14[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v14[80];
  long long v8 = *(_OWORD *)&v14[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v14[96];
  *(_OWORD *)(a1 + 129) = v8;
  *(_OWORD *)(a1 + 145) = v5;
  long long v9 = *(_OWORD *)v14;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v14[16];
  double result = *(double *)&v14[32];
  long long v11 = *(_OWORD *)&v14[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v14[32];
  *(_OWORD *)(a1 + 65) = v11;
  *(_OWORD *)(a1 + 81) = v7;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 209) = *(void *)&v14[192];
  *(_OWORD *)(a1 + 17) = v9;
  return result;
}

uint64_t sub_236CDB3A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_236CDB3DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_236CDB414(uint64_t a1)
{
  return a1;
}

unint64_t sub_236CDB444()
{
  unint64_t result = qword_2688CE388;
  if (!qword_2688CE388)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE390);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE388);
  }
  return result;
}

uint64_t sub_236CDB4A0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3B0);
  sub_236CFC1C0();
  swift_bridgeObjectRetain();
  swift_release();
  sub_236CDE448();
  uint64_t v0 = sub_236CFC040();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  sub_236CFC1C0();
  swift_retain();
  swift_release();
  uint64_t v5 = sub_236CFBFF0();
  uint64_t v7 = v6;
  char v9 = v8;
  swift_release();
  sub_236CDDA20(v0, v2, v4);
  swift_bridgeObjectRelease();
  sub_236CFC100();
  uint64_t v10 = sub_236CFBFD0();
  swift_release();
  sub_236CDDA20(v5, v7, v9 & 1);
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t ExpandableTextView.init(text:font:numberOfLines:expandTextToken:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  type metadata accessor for ExpandableTextViewModel();
  swift_allocObject();
  sub_236CDD828(a1, a2, a3, a4, a5, a6, a7, a8);
  sub_236CFC1B0();
  sub_236CDDA08(a7);
  uint64_t result = swift_release();
  *a9 = v19;
  a9[1] = v20;
  return result;
}

uint64_t type metadata accessor for ExpandableTextViewModel()
{
  uint64_t result = qword_2688CE410;
  if (!qword_2688CE410) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ExpandableTextView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v69 = a1;
  uint64_t v2 = sub_236CFC420();
  uint64_t v67 = *(void *)(v2 - 8);
  uint64_t v68 = v2;
  MEMORY[0x270FA5388]();
  v66 = &v50[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_236CFC010();
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v55 = &v50[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_236CFB880();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  char v8 = &v50[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE398);
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388]();
  v59 = &v50[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3A0);
  uint64_t v64 = *(void *)(v10 - 8);
  uint64_t v65 = v10;
  MEMORY[0x270FA5388]();
  v63 = &v50[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3A8);
  MEMORY[0x270FA5388]();
  v62 = &v50[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = v1[1];
  uint64_t v72 = *v1;
  uint64_t v13 = v72;
  uint64_t v73 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3B0);
  sub_236CFC1C0();
  uint64_t v15 = v79;
  swift_getKeyPath();
  uint64_t v72 = v15;
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  swift_release();
  uint64_t v16 = v15 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v5);
  swift_release();
  uint64_t v17 = sub_236CFC030();
  uint64_t v19 = v18;
  LOBYTE(v15) = v20 & 1;
  uint64_t v72 = v13;
  uint64_t v73 = v14;
  sub_236CFC1C0();
  swift_retain();
  swift_release();
  uint64_t v53 = sub_236CFBFF0();
  uint64_t v52 = v21;
  int v51 = v22;
  uint64_t v54 = v23;
  swift_release();
  sub_236CDDA20(v17, v19, v15);
  swift_bridgeObjectRelease();
  uint64_t v72 = v13;
  uint64_t v73 = v14;
  sub_236CFC1C0();
  uint64_t v24 = v70;
  swift_getKeyPath();
  uint64_t v72 = v24;
  sub_236CFBA00();
  swift_release();
  uint64_t v25 = 0;
  char v26 = *(unsigned char *)(v24
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded);
  if ((v26 & 1) == 0) {
    uint64_t v25 = *(void *)(v24 + 40);
  }
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v72 = v53;
  uint64_t v73 = v52;
  char v74 = v51 & 1;
  uint64_t v75 = v54;
  uint64_t v76 = KeyPath;
  uint64_t v77 = v25;
  char v78 = v26;
  uint64_t v70 = v13;
  uint64_t v71 = v14;
  uint64_t v28 = sub_236CDB4A0();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  long long v33 = v55;
  sub_236CFC000();
  sub_236CDDA20(v28, v30, v32);
  swift_bridgeObjectRelease();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3D8);
  unint64_t v35 = sub_236CDDA9C();
  uint64_t v36 = v59;
  sub_236CFC070();
  (*(void (**)(unsigned char *, uint64_t))(v56 + 8))(v33, v57);
  sub_236CDDA20(v72, v73, v74);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v13;
  *(void *)(v37 + 24) = v14;
  swift_retain();
  swift_retain();
  uint64_t v72 = v34;
  uint64_t v73 = v35;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = v63;
  uint64_t v39 = v61;
  sub_236CFC080();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v36, v39);
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = v13;
  *(void *)(v40 + 24) = v14;
  swift_retain();
  swift_retain();
  uint64_t v41 = v66;
  sub_236CFC400();
  uint64_t v42 = (uint64_t)v62;
  unint64_t v43 = &v62[*(int *)(v58 + 36)];
  uint64_t v44 = sub_236CFBC20();
  uint64_t v46 = v67;
  uint64_t v45 = v68;
  (*(void (**)(char *, unsigned char *, uint64_t))(v67 + 16))(&v43[*(int *)(v44 + 20)], v41, v68);
  *(void *)unint64_t v43 = &unk_2688CE400;
  *((void *)v43 + 1) = v40;
  uint64_t v48 = v64;
  uint64_t v47 = v65;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v64 + 16))(v42, v38, v65);
  (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v41, v45);
  (*(void (**)(unsigned char *, uint64_t))(v48 + 8))(v38, v47);
  return sub_236CDDD50(v42, v69);
}

uint64_t sub_236CDBF00@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  swift_release();
  uint64_t v3 = v1 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  uint64_t v4 = sub_236CFB880();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_236CDBFFC()
{
  return swift_release();
}

uint64_t sub_236CDC04C()
{
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFB9F0();
  swift_release();
  swift_getKeyPath();
  sub_236CFBA00();
  uint64_t result = swift_release();
  uint64_t v2 = *(void (**)(void))(v0
                                     + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  if (v2)
  {
    swift_getKeyPath();
    swift_retain();
    sub_236CFBA00();
    swift_release();
    v2(*(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded));
    return sub_236CDDA08((uint64_t)v2);
  }
  return result;
}

uint64_t sub_236CDC1C4(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  sub_236CFC3F0();
  v2[7] = sub_236CFC3E0();
  uint64_t v4 = sub_236CFC3C0();
  v2[8] = v4;
  v2[9] = v3;
  return MEMORY[0x270FA2498](sub_236CDC25C, v4, v3);
}

uint64_t sub_236CDC25C()
{
  uint64_t v1 = v0[6];
  v0[2] = v0[5];
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3B0);
  sub_236CFC1C0();
  v0[10] = v0[4];
  uint64_t v2 = (void *)swift_task_alloc();
  v0[11] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_236CDC318;
  return sub_236CDC4BC();
}

uint64_t sub_236CDC318()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_236CDC45C, v3, v2);
}

uint64_t sub_236CDC45C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_236CDC4BC()
{
  v1[20] = v0;
  sub_236CFB8D0();
  v1[21] = swift_task_alloc();
  uint64_t v2 = sub_236CFB880();
  v1[22] = v2;
  v1[23] = *(void *)(v2 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  sub_236CFC3F0();
  v1[26] = sub_236CFC3E0();
  uint64_t v4 = sub_236CFC3C0();
  v1[27] = v4;
  v1[28] = v3;
  return MEMORY[0x270FA2498](sub_236CDC5EC, v4, v3);
}

uint64_t sub_236CDC5EC()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = self;
  v0[29] = *(void *)(v1 + 48);
  v0[30] = *(void *)(v1 + 56);
  uint64_t v3 = sub_236CFC330();
  v0[31] = v3;
  sub_236CE6A3C(MEMORY[0x263F8EE78]);
  type metadata accessor for DocumentReadingOptionKey(0);
  sub_236CDE2DC(&qword_2688CE340, type metadata accessor for DocumentReadingOptionKey);
  uint64_t v4 = sub_236CFC2D0();
  v0[32] = v4;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_236CDC7AC;
  uint64_t v5 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_236CDD534;
  v0[13] = &block_descriptor;
  v0[14] = v5;
  objc_msgSend(v2, sel_loadFromHTMLWithString_options_completionHandler_, v3, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_236CDC7AC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 264) = v2;
  uint64_t v3 = *(void *)(v1 + 224);
  uint64_t v4 = *(void *)(v1 + 216);
  if (v2) {
    uint64_t v5 = sub_236CDCB18;
  }
  else {
    uint64_t v5 = sub_236CDC8DC;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_236CDC8DC()
{
  uint64_t v2 = (void *)v0[31];
  uint64_t v1 = (void *)v0[32];
  uint64_t v3 = v0[25];
  uint64_t v5 = v0[23];
  uint64_t v4 = v0[24];
  uint64_t v14 = v0[22];
  uint64_t v6 = v0[20];
  swift_release();
  uint64_t v7 = (void *)v0[15];
  swift_bridgeObjectRelease();

  id v8 = v7;
  sub_236CFB8A0();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)swift_task_alloc() = KeyPath;
  swift_getKeyPath();
  swift_task_dealloc();
  v0[18] = *(void *)(v6 + 16);
  sub_236CDE1E8();
  swift_retain();
  sub_236CFB870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v14);
  swift_getKeyPath();
  uint64_t v10 = swift_task_alloc();
  *(void *)(v10 + 16) = v6;
  *(void *)(v10 + 24) = v4;
  v0[19] = v6;
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFB9F0();
  swift_release();
  swift_task_dealloc();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v11(v4, v14);

  v11(v0[25], v0[22]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_236CDCB18()
{
  uint64_t v2 = (void *)v0[32];
  uint64_t v1 = (void *)v0[33];
  uint64_t v3 = (void *)v0[31];
  uint64_t v4 = v0[25];
  uint64_t v9 = v0[23];
  uint64_t v5 = v0[20];
  swift_release();
  swift_willThrow();

  swift_bridgeObjectRetain();
  sub_236CFB8C0();
  sub_236CFB890();
  swift_getKeyPath();
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  v0[17] = v5;
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFB9F0();
  swift_release();
  swift_task_dealloc();
  (*(void (**)(void, void))(v9 + 8))(v0[25], v0[22]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_236CDCCD8()
{
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  swift_release();
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded);
}

uint64_t sub_236CDCD80@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  uint64_t v5 = sub_236CFB880();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_236CDCE7C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_236CFB880();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2;
  swift_getKeyPath();
  uint64_t v11 = v8;
  uint64_t v12 = v7;
  uint64_t v13 = v8;
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFB9F0();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_236CDD004(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  swift_beginAccess();
  uint64_t v4 = sub_236CFB880();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(v3, a2, v4);
  return swift_endAccess();
}

uint64_t sub_236CDD0A0@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  uint64_t result = swift_release();
  *a2 = *(unsigned char *)(v3
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded);
  return result;
}

uint64_t sub_236CDD150()
{
  return swift_release();
}

uint64_t sub_236CDD220()
{
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  swift_release();
  uint64_t v1 = *(void *)(v0
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  sub_236CDE40C(v1);
  return v1;
}

uint64_t sub_236CDD2E0@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(unsigned __int8 *a1)@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFBA00();
  swift_release();
  uint64_t v4 = *(void *)(v3
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  uint64_t v5 = *(void *)(v3
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler
                 + 8);
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_236CDE41C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(unsigned __int8 *))v6;
  return sub_236CDE40C(v4);
}

uint64_t sub_236CDD3D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = v1;
    uint64_t v4 = sub_236CDE3D4;
  }
  else
  {
    uint64_t v4 = 0;
  }
  swift_getKeyPath();
  MEMORY[0x270FA5388]();
  sub_236CDE40C(v2);
  sub_236CDE2DC(&qword_2688CE3C0, (void (*)(uint64_t))type metadata accessor for ExpandableTextViewModel);
  sub_236CFB9F0();
  sub_236CDDA08((uint64_t)v4);
  return swift_release();
}

uint64_t sub_236CDD534(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE448);
    uint64_t v6 = swift_allocError();
    *uint64_t v7 = a4;
    id v8 = a4;
    a1 = v4;
    a2 = (void *)v6;
    return MEMORY[0x270FA2410](a1, a2);
  }
  uint64_t v9 = a2;
  if (!a2)
  {
    __break(1u);
    return MEMORY[0x270FA2410](a1, a2);
  }
  type metadata accessor for DocumentAttributeKey(0);
  sub_236CDE2DC(&qword_2688CE330, type metadata accessor for DocumentAttributeKey);
  uint64_t v10 = sub_236CFC2E0();
  uint64_t v11 = *(void **)(*(void *)(v4 + 64) + 40);
  *uint64_t v11 = v9;
  v11[1] = v10;
  id v12 = v9;
  return swift_continuation_throwingResume();
}

uint64_t sub_236CDD658()
{
  return sub_236CFC320() & 1;
}

uint64_t sub_236CDD6B4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText;
  uint64_t v2 = sub_236CFB880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_236CDDA08(*(void *)(v0
                          + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler));
  uint64_t v3 = v0
     + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel___observationRegistrar;
  uint64_t v4 = sub_236CFBA40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_236CDD7C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_236CFBD20();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_236CDD7F8()
{
  return sub_236CFBD30();
}

void *sub_236CDD828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = a8;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  v23[1] = a1;
  sub_236CFB8D0();
  MEMORY[0x270FA5388]();
  uint64_t v26 = sub_236CFB880();
  uint64_t v14 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((unsigned char *)v8 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded) = 0;
  uint64_t v17 = (void *)((char *)v8
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  *uint64_t v17 = 0;
  v17[1] = 0;
  sub_236CFBA30();
  v8[6] = a1;
  v8[7] = a2;
  uint64_t v18 = v24;
  v8[2] = a3;
  v8[3] = v18;
  v8[4] = v25;
  v8[5] = a4;
  uint64_t v19 = (void *)((char *)v8
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  uint64_t v20 = *(void *)((char *)v8
                  + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v21 = v27;
  sub_236CDE40C(a7);
  sub_236CDDA08(v20);
  *uint64_t v19 = a7;
  v19[1] = v21;
  sub_236CFB8C0();
  sub_236CFB890();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))((uint64_t)v8+ OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__attributedText, v16, v26);
  return v8;
}

uint64_t sub_236CDDA08(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_236CDDA20(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_236CDDA38@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_236CFBD20();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_236CDDA6C()
{
  return sub_236CFBD30();
}

unint64_t sub_236CDDA9C()
{
  unint64_t result = qword_2688CE3E0;
  if (!qword_2688CE3E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE3D8);
    sub_236CDDB18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE3E0);
  }
  return result;
}

unint64_t sub_236CDDB18()
{
  unint64_t result = qword_2688CE3E8;
  if (!qword_2688CE3E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE3F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE3E8);
  }
  return result;
}

uint64_t sub_236CDDB78()
{
  return sub_236CDBFFC();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CDDBC4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_236CDDC5C;
  return sub_236CDC1C4(v2, v3);
}

uint64_t sub_236CDDC5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_236CDDD50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE3A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CDDDB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for ExpandableTextView()
{
  swift_release();
  return swift_release();
}

void *_s11ShazamKitUI18ExpandableTextViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ExpandableTextView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for ExpandableTextView(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExpandableTextView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ExpandableTextView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ExpandableTextView()
{
  return &type metadata for ExpandableTextView;
}

uint64_t sub_236CDDF80()
{
  return type metadata accessor for ExpandableTextViewModel();
}

uint64_t sub_236CDDF88()
{
  uint64_t result = sub_236CFB880();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_236CFBA40();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

unint64_t sub_236CDE090()
{
  unint64_t result = qword_2688CE420;
  if (!qword_2688CE420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE3A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE398);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE3D8);
    sub_236CDDA9C();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_236CDE2DC(&qword_2688CE428, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE420);
  }
  return result;
}

uint64_t sub_236CDE1AC()
{
  return sub_236CDD004(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_236CDE1C8()
{
}

unint64_t sub_236CDE1E8()
{
  unint64_t result = qword_2688CE438;
  if (!qword_2688CE438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE438);
  }
  return result;
}

void sub_236CDE23C()
{
}

uint64_t sub_236CDE264()
{
  return 8;
}

uint64_t sub_236CDE270()
{
  return swift_release();
}

uint64_t sub_236CDE278(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_236CDE288()
{
  return sub_236CFC310();
}

void *sub_236CDE2D0(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_236CDE2DC(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_236CDE324()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__expanded) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_236CDE344()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)(v0[2]
                 + OBJC_IVAR____TtC11ShazamKitUIP33_9979AAF9E31D2582850620124584051123ExpandableTextViewModel__onExpandTextHandler);
  uint64_t v4 = *v3;
  *uint64_t v3 = v1;
  v3[1] = v2;
  sub_236CDE40C(v1);
  return sub_236CDDA08(v4);
}

uint64_t sub_236CDE39C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CDE3D4(char a1)
{
  uint64_t v2 = *(uint64_t (**)(char *))(v1 + 16);
  char v4 = a1;
  return v2(&v4);
}

uint64_t sub_236CDE40C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_236CDE41C(unsigned __int8 *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_236CDE448()
{
  unint64_t result = qword_2688CE450;
  if (!qword_2688CE450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE450);
  }
  return result;
}

uint64_t sub_236CDE4A0()
{
  return sub_236CDE1AC();
}

void sub_236CDE4B8()
{
}

ValueMetadata *type metadata accessor for AmbientArtworkUnavailableView()
{
  return &type metadata for AmbientArtworkUnavailableView;
}

uint64_t sub_236CDE4E0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_236CDE4FC()
{
  qword_2688CE458 = 0x636973756DLL;
  unk_2688CE460 = 0xE500000000000000;
}

uint64_t sub_236CDE51C(uint64_t a1)
{
  return sub_236CDE544(a1, (SEL *)&selRef_systemFillColor, &qword_2688CE468);
}

uint64_t sub_236CDE530(uint64_t a1)
{
  return sub_236CDE544(a1, (SEL *)&selRef_systemGray5Color, &qword_2688CE470);
}

uint64_t sub_236CDE544(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4 = [self *a2];
  uint64_t result = MEMORY[0x237E0D430](v4);
  *a3 = result;
  return result;
}

__n128 sub_236CDE58C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFC250();
  uint64_t v4 = v3;
  sub_236CDE63C((uint64_t)&v19);
  uint64_t v5 = v19;
  char v6 = v20;
  char v7 = v21;
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  char v10 = v24;
  char v11 = v25;
  uint64_t v12 = v26;
  char v13 = v27;
  uint64_t v14 = v28;
  char v15 = v29;
  uint64_t v16 = v31;
  uint64_t v17 = v32;
  __n128 result = v30;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 25) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 49) = v11;
  *(void *)(a1 + 56) = v12;
  *(unsigned char *)(a1 + 64) = v13;
  *(void *)(a1 + 72) = v14;
  *(unsigned char *)(a1 + 80) = v15;
  *(__n128 *)(a1 + 88) = result;
  *(void *)(a1 + 104) = v16;
  *(void *)(a1 + 112) = v17;
  return result;
}

uint64_t sub_236CDE63C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFC150();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2688CE178 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_2688CE470;
  uint64_t v7 = qword_2688CE168;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_236CFC170();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v8 = sub_236CFC190();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_236CFBBE0();
  sub_236CFBBE0();
  sub_236CFC250();
  sub_236CFBBD0();
  uint64_t v9 = v18;
  char v10 = v19;
  uint64_t v11 = v20;
  char v12 = v21;
  uint64_t v13 = v22;
  uint64_t v14 = v23;
  if (qword_2688CE170 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_2688CE468;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v6;
  *(_WORD *)(a1 + 8) = 256;
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(unsigned char *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = KeyPath;
  *(void *)(a1 + 96) = v15;
  swift_retain();
  swift_retain();
  return swift_release();
}

void sub_236CDE8EC(__n128 (**a1)@<Q0>(uint64_t a1@<X8>)@<X8>)
{
  *a1 = sub_236CDE58C;
  a1[1] = 0;
}

unint64_t sub_236CDE910()
{
  unint64_t result = qword_2688CE478;
  if (!qword_2688CE478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE480);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE478);
  }
  return result;
}

uint64_t sub_236CDE96C(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(double *)(v5 + 40) = a1;
  *(double *)(v5 + 48) = a2;
  *(void *)(v5 + 24) = a4;
  *(void *)(v5 + 32) = a5;
  uint64_t v6 = *(void *)(type metadata accessor for LocationViewPopulator() - 8);
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = *(void *)(v6 + 64);
  *(void *)(v5 + 72) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE498);
  *(void *)(v5 + 80) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  *(void *)(v5 + 88) = swift_task_alloc();
  uint64_t v7 = sub_236CFB990();
  *(void *)(v5 + 96) = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  *(void *)(v5 + 104) = v8;
  *(void *)(v5 + 112) = *(void *)(v8 + 64);
  *(void *)(v5 + 120) = swift_task_alloc();
  *(void *)(v5 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_236CDEB08, 0, 0);
}

uint64_t sub_236CDEB08()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  sub_236CFC220();
  sub_236CE1DA8(*(void *)(v0 + 16) + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL, v3, &qword_2688CE4A0);
  swift_release();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_236CE17A0(*(void *)(v0 + 88), &qword_2688CE4A0);
  }
  else
  {
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v5 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v10 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v39 = *(void *)(v0 + 56);
    uint64_t v38 = *(void *)(v0 + 32);
    uint64_t v41 = v5;
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v40(v5, *(void *)(v0 + 88), v8);
    uint64_t v11 = sub_236CFC420();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v5, v8);
    uint64_t v12 = v10;
    sub_236CE1510(v38, v10);
    unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v14 = (v6 + *(unsigned __int8 *)(v39 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = 0;
    *(void *)(v15 + 24) = 0;
    v40(v15 + v13, v4, v8);
    sub_236CE1658(v12, v15 + v14);
    sub_236CDF59C(v9, (uint64_t)&unk_2688CE4E0, v15);
    sub_236CE17A0(v9, &qword_2688CE498);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v41, v8);
  }
  uint64_t v17 = *(void *)(v0 + 72);
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v19 = *(void *)(v0 + 56);
  uint64_t v18 = *(void *)(v0 + 64);
  double v21 = *(double *)(v0 + 40);
  double v20 = *(double *)(v0 + 48);
  uint64_t v22 = *(void *)(v0 + 32);
  uint64_t v23 = sub_236CFC420();
  char v24 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
  uint64_t v42 = *v24;
  (*v24)(v16, 1, 1, v23);
  sub_236CE1510(v22, v17);
  unint64_t v25 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v26 = v25 + v18;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = 0;
  *(void *)(v27 + 24) = 0;
  sub_236CE1658(v17, v27 + v25);
  sub_236CDF59C(v16, (uint64_t)&unk_2688CE4B8, v27);
  sub_236CE17A0(v16, &qword_2688CE498);
  if (v21 > 0.0 && v20 > 0.0)
  {
    uint64_t v29 = *(void *)(v0 + 72);
    uint64_t v28 = *(void *)(v0 + 80);
    uint64_t v31 = *(void *)(v0 + 40);
    uint64_t v30 = *(void *)(v0 + 48);
    uint64_t v32 = *(void *)(v0 + 32);
    v42(v28, 1, 1, v23);
    sub_236CE1510(v32, v29);
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = 0;
    *(void *)(v33 + 24) = 0;
    sub_236CE1658(v29, v33 + v25);
    uint64_t v34 = (void *)(v33 + ((v26 + 7) & 0xFFFFFFFFFFFFFFF8));
    *uint64_t v34 = v31;
    v34[1] = v30;
    sub_236CDF59C(v28, (uint64_t)&unk_2688CE4D0, v33);
    sub_236CE17A0(v28, &qword_2688CE498);
  }
  unint64_t v35 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v35;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4C0);
  *unint64_t v35 = v0;
  v35[1] = sub_236CDEF5C;
  return MEMORY[0x270FA1E50](0, 0, v36);
}

uint64_t sub_236CDEF5C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_236CDF0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a5;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)&dword_2688CE488 + dword_2688CE488);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 40) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_236CDF198;
  return v9(a4);
}

uint64_t sub_236CDF198(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v5 = sub_236CDF364;
  }
  else
  {
    *(void *)(v4 + 56) = a1;
    uint64_t v5 = sub_236CDF2C8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_236CDF2C8()
{
  uint64_t v1 = v0[7];
  v0[8] = v0[6];
  v0[9] = v1;
  sub_236CFC3F0();
  v0[10] = sub_236CFC3E0();
  uint64_t v3 = sub_236CFC3C0();
  return MEMORY[0x270FA2498](sub_236CDF3FC, v3, v2);
}

uint64_t sub_236CDF364()
{
  sub_236CFC3F0();
  v0[8] = 0;
  v0[9] = 0;
  v0[10] = sub_236CFC3E0();
  uint64_t v2 = sub_236CFC3C0();
  return MEMORY[0x270FA2498](sub_236CDF3FC, v2, v1);
}

uint64_t sub_236CDF3FC()
{
  uint64_t v1 = (void *)v0[9];
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  sub_236CFC220();
  uint64_t v2 = v0[2];
  swift_getKeyPath();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  v0[3] = v2;
  sub_236CE1D2C();
  id v4 = v1;
  sub_236CFB9F0();

  swift_release();
  swift_release();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_236CDF53C, 0, 0);
}

uint64_t sub_236CDF53C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_236CDF59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE498);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236CE1DA8(a1, (uint64_t)v10, &qword_2688CE498);
  uint64_t v11 = sub_236CFC420();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_236CE17A0((uint64_t)v10, &qword_2688CE498);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = sub_236CFC3C0();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_236CFC410();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  uint64_t v18 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_236CDF7A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 128) = a4;
  return MEMORY[0x270FA2498](sub_236CDF7C4, 0, 0);
}

uint64_t sub_236CDF7C4()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00A40]), sel_init);
  v0[17] = v1;
  v0[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  sub_236CFC220();
  uint64_t v2 = *(void **)(v0[10] + 16);
  v0[19] = v2;
  id v3 = v2;
  swift_release();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_236CDF924;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_236CDFDBC;
  v0[13] = &block_descriptor_26;
  v0[14] = v4;
  objc_msgSend(v1, sel_reverseGeocodeLocation_completionHandler_, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_236CDF924()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 160) = v1;
  if (v1) {
    uint64_t v2 = sub_236CDFD34;
  }
  else {
    uint64_t v2 = sub_236CDFA34;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_236CDFA34()
{
  unint64_t v1 = *(void *)(v0 + 120);

  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_236CFC5A0();
    uint64_t v2 = swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_3:
      if ((v1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x237E0D890](0, v1);
      }
      else
      {
        if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return MEMORY[0x270FA2498](v2, v3, v4);
        }
        id v5 = *(id *)(v1 + 32);
      }
      *(void *)(v0 + 168) = v5;
      swift_bridgeObjectRelease();
      sub_236CFC3F0();
      *(void *)(v0 + 176) = sub_236CFC3E0();
      uint64_t v6 = sub_236CFC3C0();
      uint64_t v8 = v7;
      uint64_t v2 = (uint64_t)sub_236CDFB90;
      uint64_t v3 = v6;
      uint64_t v4 = v8;
      return MEMORY[0x270FA2498](v2, v3, v4);
    }
  }
  else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v10 = *(void **)(v0 + 136);
  swift_bridgeObjectRelease();

  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_236CDFB90()
{
  swift_release();
  sub_236CFC220();
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = sub_236CDFE88();
  uint64_t v4 = v3;
  swift_getKeyPath();
  id v5 = (void *)swift_task_alloc();
  v5[2] = v1;
  v5[3] = v2;
  v5[4] = v4;
  *(void *)(v0 + 80) = v1;
  sub_236CE1D2C();
  sub_236CFB9F0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_236CDFCCC, 0, 0);
}

uint64_t sub_236CDFCCC()
{
  uint64_t v1 = *(void **)(v0 + 136);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_236CDFD34()
{
  uint64_t v1 = (void *)v0[19];
  uint64_t v2 = (void *)v0[20];
  uint64_t v3 = (void *)v0[17];
  swift_willThrow();

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_236CDFDBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE448);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_236CE1F24();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_236CFC3A0();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_236CDFE88()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFEB18]), sel_init);
  id v2 = objc_msgSend(v0, sel_thoroughfare);
  if (v2)
  {
    uint64_t v3 = v2;
    sub_236CFC360();
  }
  uint64_t v4 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setStreet_, v4);

  id v5 = objc_msgSend(v0, sel_locality);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_236CFC360();
  }
  id v7 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setCity_, v7);

  id v8 = objc_msgSend(v0, sel_subLocality);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_236CFC360();
  }
  uint64_t v10 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSubLocality_, v10);

  id v11 = objc_msgSend(v0, sel_subAdministrativeArea);
  if (v11)
  {
    uint64_t v12 = v11;
    sub_236CFC360();
  }
  uint64_t v13 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSubAdministrativeArea_, v13);

  id v14 = objc_msgSend(v0, sel_administrativeArea);
  if (v14)
  {
    uint64_t v15 = v14;
    sub_236CFC360();
  }
  uint64_t v16 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setState_, v16);

  id v17 = objc_msgSend(v0, sel_country);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_236CFC360();
  }
  uint64_t v19 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setCountry_, v19);

  id v20 = objc_msgSend(self, sel_singleLineStringFromPostalAddress_addCountryName_, v1, 1);
  if (v20)
  {
    double v21 = v20;
    uint64_t v22 = sub_236CFC360();
  }
  else
  {

    return 0;
  }
  return v22;
}

uint64_t sub_236CE01B4(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(double *)(v6 + 48) = a1;
  *(double *)(v6 + 56) = a2;
  *(void *)(v6 + 40) = a6;
  return MEMORY[0x270FA2498](sub_236CE01D8, 0, 0);
}

uint64_t sub_236CE01D8()
{
  *(void *)(v0 + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  sub_236CFC220();
  id v1 = *(void **)(*(void *)(v0 + 16) + 16);
  *(void *)(v0 + 72) = v1;
  id v2 = v1;
  swift_release();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  *(void *)uint64_t v3 = v0;
  *(void *)(v3 + 8) = sub_236CE02CC;
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v3 + 152) = *(void *)(v0 + 40);
  *(_OWORD *)(v3 + 136) = v4;
  *(void *)(v3 + 128) = v2;
  return MEMORY[0x270FA2498](sub_236CE0638, 0, 0);
}

uint64_t sub_236CE02CC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_236CE03E8, 0, 0);
}

uint64_t sub_236CE03E8()
{
  sub_236CFC3F0();
  *(void *)(v0 + 96) = sub_236CFC3E0();
  uint64_t v2 = sub_236CFC3C0();
  return MEMORY[0x270FA2498](sub_236CE047C, v2, v1);
}

uint64_t sub_236CE047C()
{
  uint64_t v1 = (void *)v0[11];
  swift_release();
  sub_236CFC220();
  uint64_t v2 = v0[3];
  swift_getKeyPath();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  v0[4] = v2;
  sub_236CE1D2C();
  id v4 = v1;
  sub_236CFB9F0();

  swift_release();
  swift_release();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_236CE05B0, 0, 0);
}

uint64_t sub_236CE05B0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_236CE0610(uint64_t a1, double a2, double a3)
{
  *(void *)(v4 + 152) = v3;
  *(double *)(v4 + 136) = a2;
  *(double *)(v4 + 144) = a3;
  *(void *)(v4 + 128) = a1;
  return MEMORY[0x270FA2498](sub_236CE0638, 0, 0);
}

uint64_t sub_236CE0638()
{
  id v1 = sub_236CE0968(*(void **)(v0 + 128), *(double *)(v0 + 136), *(double *)(v0 + 144));
  *(void *)(v0 + 160) = v1;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_236CE074C;
  uint64_t v2 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_236CE0A80;
  *(void *)(v0 + 104) = &block_descriptor_0;
  *(void *)(v0 + 112) = v2;
  objc_msgSend(v1, sel_startWithCompletionHandler_, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_236CE074C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    uint64_t v2 = sub_236CE08EC;
  }
  else {
    uint64_t v2 = sub_236CE085C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_236CE085C()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[15];
  id v3 = objc_msgSend(v2, sel_image);

  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_236CE08EC()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_willThrow();

  id v3 = (uint64_t (*)(void))v0[1];
  return v3(0);
}

id sub_236CE0968(void *a1, double a2, double a3)
{
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F10998]), sel_init);
  objc_msgSend(a1, sel_coordinate);
  id v9 = objc_msgSend(self, sel_cameraLookingAtCenterCoordinate_fromDistance_pitch_heading_, v7, v8, 8000.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setCamera_, v9);

  objc_msgSend(v6, sel_setMapType_, 0);
  objc_msgSend(v6, sel_setSize_, a2, a3);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F109A0]), sel_initWithOptions_, v6);

  return v10;
}

uint64_t sub_236CE0A80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE448);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    a1 = v3;
    a2 = (void *)v5;
    return MEMORY[0x270FA2410](a1, a2);
  }
  if (!a2)
  {
    __break(1u);
    return MEMORY[0x270FA2410](a1, a2);
  }
  **(void **)(*(void *)(v3 + 64) + 40) = a2;
  id v8 = a2;
  return swift_continuation_throwingResume();
}

id sub_236CE0B40@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 40);
  *a2 = v4;
  return v4;
}

void sub_236CE0BC8(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_236CE1D2C();
  id v2 = v1;
  sub_236CFB9F0();
  swift_release();
}

id sub_236CE0C74@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  uint64_t v4 = *(void **)(v3 + 48);
  *a2 = v4;
  return v4;
}

void sub_236CE0CFC(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  sub_236CE1D2C();
  id v2 = v1;
  sub_236CFB9F0();
  swift_release();
}

uint64_t sub_236CE0DA8(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_236CE0E84;
  return v6(a1);
}

uint64_t sub_236CE0E84()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_236CE0F7C(uint64_t a1)
{
  v1[2] = a1;
  uint64_t v2 = sub_236CFB990();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  uint64_t v3 = sub_236CFB850();
  v1[6] = v3;
  v1[7] = *(void *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_236CE1098, 0, 0);
}

uint64_t sub_236CE1098()
{
  (*(void (**)(void, void, void))(v0[4] + 16))(v0[5], v0[2], v0[3]);
  sub_236CFB840();
  v0[9] = objc_msgSend(self, sel_sharedSession);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[10] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_236CE1194;
  uint64_t v2 = v0[8];
  return MEMORY[0x270EF1EB0](v2, 0);
}

uint64_t sub_236CE1194(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *v4;
  id v9 = *(void **)(*v4 + 72);
  *(void *)(*v4 + 88) = v3;
  swift_task_dealloc();

  if (v3)
  {
    id v10 = sub_236CE13E4;
  }
  else
  {

    *(void *)(v8 + 96) = a2;
    *(void *)(v8 + 104) = a1;
    id v10 = sub_236CE12F0;
  }
  return MEMORY[0x270FA2498](v10, 0, 0);
}

uint64_t sub_236CE12F0()
{
  unint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = v0[6];
  id v6 = objc_allocWithZone(MEMORY[0x263F827E8]);
  uint64_t v7 = (void *)sub_236CFB9A0();
  id v8 = objc_msgSend(v6, sel_initWithData_, v7);
  sub_236CE146C(v2, v1);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  id v9 = (uint64_t (*)(id))v0[1];
  return v9(v8);
}

uint64_t sub_236CE13E4()
{
  (*(void (**)(void, void))(v0[7] + 8))(v0[8], v0[6]);
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_236CE146C(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for LocationViewPopulator()
{
  uint64_t result = qword_2688CE510;
  if (!qword_2688CE510) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_236CE1510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationViewPopulator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CE1574()
{
  uint64_t v1 = *(void *)(type metadata accessor for LocationViewPopulator() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_unknownObjectRelease();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_236CE1658(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LocationViewPopulator();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CE16BC()
{
  uint64_t v2 = *(void *)(type metadata accessor for LocationViewPopulator() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_236CDDC5C;
  v4[16] = v3;
  return MEMORY[0x270FA2498](sub_236CDF7C4, 0, 0);
}

uint64_t sub_236CE17A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236CE17FC()
{
  uint64_t v1 = *(void *)(type metadata accessor for LocationViewPopulator() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t sub_236CE18EC()
{
  uint64_t v2 = *(void *)(type metadata accessor for LocationViewPopulator() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + v4);
  uint64_t v7 = *(void *)(v0 + v4 + 8);
  id v8 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v8;
  *id v8 = v1;
  v8[1] = sub_236CE23FC;
  v8[6] = v6;
  v8[7] = v7;
  v8[5] = v5;
  return MEMORY[0x270FA2498](sub_236CE01D8, 0, 0);
}

uint64_t sub_236CE1A0C()
{
  uint64_t v1 = sub_236CFB990();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for LocationViewPopulator() - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v0 + v8, v11);
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_236CE1B7C()
{
  uint64_t v2 = *(void *)(sub_236CFB990() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for LocationViewPopulator() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = v0 + v3;
  uint64_t v8 = v0 + (v6 & ~v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_236CE23FC;
  v9[4] = v8;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)&dword_2688CE488 + dword_2688CE488);
  uint64_t v10 = (void *)swift_task_alloc();
  v9[5] = v10;
  *uint64_t v10 = v9;
  v10[1] = sub_236CDF198;
  return v12(v7);
}

void sub_236CE1D10()
{
  sub_236CE4A7C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_236CE1D2C()
{
  unint64_t result = qword_2688CE4E8;
  if (!qword_2688CE4E8)
  {
    type metadata accessor for LocationViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2688CE4E8);
  }
  return result;
}

void sub_236CE1D8C()
{
  sub_236CE49D0(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_236CE1DA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236CE1E0C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CE1E44(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_236CDDC5C;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2688CE4F8 + dword_2688CE4F8);
  return v6(a1, v4);
}

uint64_t sub_236CE1F04()
{
  return sub_236CE472C(v0[2], v0[3], v0[4]);
}

unint64_t sub_236CE1F24()
{
  unint64_t result = qword_2688CE508;
  if (!qword_2688CE508)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688CE508);
  }
  return result;
}

uint64_t sub_236CE1F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_236CE1FD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_236CE203C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_236CE20A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_236CE210C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_236CE2174(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_236CE21DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_236CE21F0);
}

uint64_t sub_236CE21F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_236CE2260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_236CE2274);
}

uint64_t sub_236CE2274(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void sub_236CE22E8()
{
  sub_236CE2374();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_236CE2374()
{
  if (!qword_2688CE520)
  {
    type metadata accessor for LocationViewModel();
    unint64_t v0 = sub_236CFC240();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2688CE520);
    }
  }
}

void sub_236CE23CC()
{
}

void sub_236CE23E4()
{
}

void *initializeBufferWithCopyOfBuffer for SizeChangeModifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SizeChangeModifier()
{
  return swift_release();
}

void *assignWithCopy for SizeChangeModifier(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SizeChangeModifier(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SizeChangeModifier()
{
  return &type metadata for SizeChangeModifier;
}

uint64_t sub_236CE24B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CE24D4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_236CFC110();
  sub_236CFBBE0();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  *a3 = v6;
  a3[1] = v8;
  a3[2] = v10;
  a3[3] = (uint64_t)sub_236CE2764;
  a3[4] = v11;
  return swift_retain();
}

void sub_236CE2574()
{
  xmmword_2688CE528 = 0uLL;
}

double sub_236CE2584@<D0>(_OWORD *a1@<X8>)
{
  if (qword_2688CE180 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_2688CE528;
  *a1 = xmmword_2688CE528;
  return result;
}

double sub_236CE25E4(_OWORD *a1, void (*a2)(long long *__return_ptr))
{
  a2(&v4);
  double result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_236CE2634()
{
  return sub_236CFBBC0();
}

uint64_t sub_236CE2650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  swift_retain();
  uint64_t v8 = sub_236CFC250();
  uint64_t v10 = v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(a2, a1, v11);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE540);
  uint64_t v13 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(a2 + *(int *)(result + 36));
  *uint64_t v13 = sub_236CE275C;
  v13[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v7;
  v13[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v8;
  v13[3] = v10;
  return result;
}

uint64_t sub_236CE2724()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CE275C@<X0>(uint64_t *a1@<X8>)
{
  return sub_236CE24D4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_236CE2764(double *a1)
{
  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

ValueMetadata *type metadata accessor for SizeChangeModifier.SizePreferenceKey()
{
  return &type metadata for SizeChangeModifier.SizePreferenceKey;
}

unint64_t sub_236CE27A4()
{
  unint64_t result = qword_2688CE548;
  if (!qword_2688CE548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE540);
    sub_236CE2868(&qword_2688CE550, &qword_2688CE538);
    sub_236CE2868(&qword_2688CE558, &qword_2688CE560);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE548);
  }
  return result;
}

uint64_t sub_236CE2868(unint64_t *a1, uint64_t *a2)
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

id sub_236CE28B4(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView;
  id v12 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v13 = v4;
  *(void *)&v5[v11] = objc_msgSend(v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v14 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer;
  *(void *)&v13[v14] = objc_msgSend(objc_allocWithZone((Class)SHListeningLayer), sel_initWithIntroAnimation_useCustomCompatibleBackground_, 0, 1);
  uint64_t v15 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel;
  *(void *)&v13[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v18.receiver = v13;
  v18.super_class = ObjectType;
  id v16 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  sub_236CE29F0();

  return v16;
}

id sub_236CE29F0()
{
  swift_getObjectType();
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView];
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v2 = objc_msgSend(v1, sel_layer);
  id v31 = *(id *)&v0[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer];
  objc_msgSend(v2, sel_addSublayer_);

  objc_msgSend(v0, sel_addSubview_, v1);
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel];
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_addSubview_, v3);
  id v4 = objc_msgSend(self, sel_systemFontOfSize_weight_, 62.0, *MEMORY[0x263F81840]);
  objc_msgSend(v3, sel_setFont_, v4);

  id v5 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v3, sel_setTextColor_, v5);

  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_236CFB8B0();

  uint64_t v8 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v8, 0xE000000000000000);

  id v30 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE580);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_236CFEA00;
  id v10 = objc_msgSend(v1, sel_leadingAnchor);
  id v11 = objc_msgSend(v0, sel_leadingAnchor);
  id v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(void *)(v9 + 32) = v12;
  id v13 = objc_msgSend(v1, sel_centerYAnchor);
  id v14 = objc_msgSend(v0, sel_centerYAnchor);
  id v15 = objc_msgSend(v13, byte_264CC02EE, v14);

  *(void *)(v9 + 40) = v15;
  id v16 = objc_msgSend(v1, sel_heightAnchor);
  id v17 = objc_msgSend(v0, sel_heightAnchor);
  id v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_multiplier_, v17, 0.65);

  *(void *)(v9 + 48) = v18;
  id v19 = objc_msgSend(v1, sel_widthAnchor);
  id v20 = objc_msgSend(v0, sel_heightAnchor);
  id v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_multiplier_, v20, 0.65);

  *(void *)(v9 + 56) = v21;
  id v22 = objc_msgSend(v3, sel_centerYAnchor);
  id v23 = objc_msgSend(v0, sel_centerYAnchor);
  id v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

  *(void *)(v9 + 64) = v24;
  id v25 = objc_msgSend(v3, sel_trailingAnchor);
  id v26 = objc_msgSend(v0, sel_trailingAnchor);
  id v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, -36.0);

  *(void *)(v9 + 72) = v27;
  sub_236CFC3B0();
  sub_236CE3248();
  uint64_t v28 = (void *)sub_236CFC390();
  swift_bridgeObjectRelease();
  objc_msgSend(v30, sel_activateConstraints_, v28);

  return objc_msgSend(v31, sel_startActiveListeningAnimation);
}

id sub_236CE2F3C(void *a1)
{
  id v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayerView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v7 = v2;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLayer;
  *(void *)&v7[v8] = objc_msgSend(objc_allocWithZone((Class)SHListeningLayer), sel_initWithIntroAnimation_useCustomCompatibleBackground_, 0, 1);
  uint64_t v9 = OBJC_IVAR____TtC11ShazamKitUI22AmbientListeningUIView_listeningLabel;
  *(void *)&v7[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v7;
  v14.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    sub_236CE29F0();
  }
  return v11;
}

id sub_236CE3190()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AmbientListeningUIView()
{
  return self;
}

unint64_t sub_236CE3248()
{
  unint64_t result = qword_2688CE588;
  if (!qword_2688CE588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688CE588);
  }
  return result;
}

uint64_t MatchResult.showStreamingServiceLink.getter()
{
  return *v0;
}

uint64_t MatchResult.showStreamingServiceLink.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*MatchResult.showStreamingServiceLink.modify())()
{
  return nullsub_1;
}

ShazamKitUI::MatchResult __swiftcall MatchResult.init(mediaItem:)(ShazamKitUI::MatchResult mediaItem)
{
  *(unsigned char *)uint64_t v1 = 1;
  *(void *)(v1 + 8) = *(void *)&mediaItem.showStreamingServiceLink;
  return mediaItem;
}

uint64_t static MatchResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  sub_236CE3328();
  return sub_236CFC470() & 1;
}

unint64_t sub_236CE3328()
{
  unint64_t result = qword_2688CE590;
  if (!qword_2688CE590)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688CE590);
  }
  return result;
}

uint64_t sub_236CE3368(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  sub_236CE3328();
  return sub_236CFC470() & 1;
}

BOOL _s11ShazamKitUI17MatchingFlowStateO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a1;
  objc_super v2 = *(void **)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  unint64_t v6 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (*(unsigned char *)(a1 + 16))
  {
    if (v4 == 1)
    {
      if (v7 == 1)
      {
        if (v3)
        {
          id v17 = *(void **)a1;
          if (v6)
          {
            type metadata accessor for SHError(0);
            uint64_t v8 = 1;
            sub_236CE391C(v3, v2, 1);
            sub_236CE391C((id)v6, (void *)v5, 1);
            sub_236CE391C(v3, v2, 1);
            sub_236CE391C((id)v6, (void *)v5, 1);
            sub_236CE391C(v3, v2, 1);
            sub_236CE391C((id)v6, (void *)v5, 1);
            sub_236CE391C(v3, v2, 1);
            sub_236CE3B30();
            char v9 = sub_236CFC320();
            sub_236CE3948(v3, v2, 1);
            sub_236CE3948((void *)v6, (void *)v5, 1);
            sub_236CE3948((void *)v6, (void *)v5, 1);
            sub_236CE3948(v3, v2, 1);
            sub_236CE3948((void *)v6, (void *)v5, 1);

            sub_236CE3948(v3, v2, 1);
            if (v9) {
              return v8;
            }
            return 0;
          }
          sub_236CE391C(0, (void *)v5, 1);
          sub_236CE391C(v3, v2, 1);
          sub_236CE391C(0, (void *)v5, 1);
          sub_236CE391C(v3, v2, 1);
          sub_236CE391C(0, (void *)v5, 1);
          sub_236CE391C(v3, v2, 1);
          sub_236CE3948(v3, v2, 1);
          sub_236CE3948(0, (void *)v5, 1);

          sub_236CE3948(v3, v2, 1);
          id v12 = 0;
        }
        else
        {
          id v16 = (id)v6;
          uint64_t v8 = 1;
          sub_236CE391C((id)v6, (void *)v5, 1);
          sub_236CE391C(0, v2, 1);
          sub_236CE3948(0, v2, 1);
          sub_236CE3948((void *)v6, (void *)v5, 1);
          if (!v6) {
            return v8;
          }
          sub_236CE3948(0, v2, 1);
          id v12 = (void *)v6;
        }
        id v13 = (void *)v5;
        char v14 = 1;
        goto LABEL_17;
      }
    }
    else if (v7 == 2 && (v5 | v6) == 0)
    {
      sub_236CE3948(*(void **)a1, v2, 2);
      sub_236CE3948(0, 0, 2);
      return 1;
    }
    goto LABEL_16;
  }
  if (*(unsigned char *)(a2 + 16))
  {
LABEL_16:
    sub_236CE391C(*(id *)a2, *(void **)(a2 + 8), v7);
    sub_236CE391C(v3, v2, v4);
    sub_236CE3948(v3, v2, v4);
    id v12 = (void *)v6;
    id v13 = (void *)v5;
    char v14 = v7;
LABEL_17:
    sub_236CE3948(v12, v13, v14);
    return 0;
  }
  if (((*(void *)a1 & 1) == 0) == (v6 & 1))
  {
    sub_236CE391C(*(id *)a2, *(void **)(a2 + 8), 0);
    sub_236CE391C(v3, v2, 0);
    sub_236CE3948(v3, v2, 0);
    id v12 = (void *)v6;
    id v13 = (void *)v5;
    char v14 = 0;
    goto LABEL_17;
  }
  sub_236CE3328();
  sub_236CE391C((id)v6, (void *)v5, 0);
  sub_236CE391C(v3, v2, 0);
  sub_236CE391C((id)v6, (void *)v5, 0);
  sub_236CE391C(v3, v2, 0);
  char v10 = sub_236CFC470();
  sub_236CE3948(v3, v2, 0);
  sub_236CE3948((void *)v6, (void *)v5, 0);
  sub_236CE3948((void *)v6, (void *)v5, 0);
  sub_236CE3948(v3, v2, 0);
  return (v10 & 1) != 0;
}

uint64_t initializeBufferWithCopyOfBuffer for MatchResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

void destroy for MatchResult(uint64_t a1)
{
}

uint64_t assignWithCopy for MatchResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  id v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v3;
  id v5 = v3;

  return a1;
}

uint64_t assignWithTake for MatchResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for MatchResult(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MatchResult(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MatchResult()
{
  return &type metadata for MatchResult;
}

id sub_236CE391C(id result, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return result;
    }
    a2 = result;
  }
  return a2;
}

void destroy for MatchingFlowState(uint64_t a1)
{
}

void sub_236CE3948(void *a1, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    a2 = a1;
  }
}

uint64_t _s11ShazamKitUI17MatchingFlowStateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_236CE391C(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MatchingFlowState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_236CE391C(*(id *)a2, v4, v5);
  unint64_t v6 = *(void **)a1;
  int v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_236CE3948(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MatchingFlowState(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_236CE3948(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MatchingFlowState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MatchingFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_236CE3AF0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_236CE3B08(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MatchingFlowState()
{
  return &type metadata for MatchingFlowState;
}

unint64_t sub_236CE3B30()
{
  unint64_t result = qword_2688CE268;
  if (!qword_2688CE268)
  {
    type metadata accessor for SHError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE268);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MatchResultTitles(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for MatchResultTitles()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MatchResultTitles(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MatchResultTitles(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MatchResultTitles(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MatchResultTitles(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MatchResultTitles(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatchResultTitles()
{
  return &type metadata for MatchResultTitles;
}

uint64_t sub_236CE3DC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CE3DDC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  swift_bridgeObjectRetain();
  sub_236CFBD90();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  char v5 = self;
  id v6 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  LOWORD(v32) = 256;
  uint64_t v7 = sub_236CFC020();
  uint64_t v45 = v8;
  uint64_t v46 = v7;
  char v10 = v9;
  uint64_t v48 = v11;
  if (qword_2688CE238 != -1) {
    swift_once();
  }
  uint64_t v38 = qword_2688D0F58;
  uint64_t v39 = *a1;
  uint64_t v44 = unk_2688D0F60;
  swift_bridgeObjectRetain();
  int v37 = sub_236CFBF00();
  sub_236CFC290();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v43 = sub_236CFBF90();
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_2688CE1C8 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_2688D0EF8;
  uint64_t v47 = swift_getKeyPath();
  uint64_t v41 = v16;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_236CFBD90();
  id v17 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata, 0, v32);
  uint64_t v18 = sub_236CFC020();
  uint64_t v20 = v19;
  char v22 = v21;
  uint64_t v40 = v23;
  if (qword_2688CE240 != -1) {
    swift_once();
  }
  uint64_t v35 = qword_2688D0F68;
  uint64_t v36 = unk_2688D0F70;
  swift_bridgeObjectRetain();
  int v34 = sub_236CFBF00();
  sub_236CFC290();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v28 = sub_236CFBF60();
  uint64_t v29 = swift_getKeyPath();
  if (qword_2688CE1D0 != -1) {
    swift_once();
  }
  uint64_t v30 = qword_2688D0F00;
  uint64_t v33 = swift_getKeyPath();
  *(void *)a2 = v46;
  *(void *)(a2 + 8) = v45;
  *(unsigned char *)(a2 + 16) = v10 & 1;
  *(void *)(a2 + 24) = v48;
  *(void *)(a2 + 32) = v38;
  *(void *)(a2 + 40) = v44;
  *(void *)(a2 + 48) = v39;
  *(_DWORD *)(a2 + 56) = v37;
  *(void *)(a2 + 64) = v13;
  *(void *)(a2 + 72) = v15;
  *(unsigned char *)(a2 + 80) = 1;
  *(void *)(a2 + 88) = KeyPath;
  *(void *)(a2 + 96) = v43;
  *(void *)(a2 + 104) = v47;
  *(void *)(a2 + 112) = v41;
  *(void *)(a2 + 120) = v18;
  *(void *)(a2 + 128) = v20;
  *(unsigned char *)(a2 + 136) = v22 & 1;
  *(void *)(a2 + 144) = v40;
  *(void *)(a2 + 152) = v35;
  *(void *)(a2 + 160) = v36;
  *(void *)(a2 + 168) = v39;
  *(_DWORD *)(a2 + 176) = v34;
  *(void *)(a2 + 184) = v25;
  *(void *)(a2 + 192) = v27;
  *(unsigned char *)(a2 + 200) = 1;
  *(_DWORD *)(a2 + 201) = *(_DWORD *)v49;
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v49[3];
  *(void *)(a2 + 208) = v29;
  *(void *)(a2 + 216) = v28;
  *(void *)(a2 + 224) = v33;
  *(void *)(a2 + 232) = v30;
  sub_236CE43B4(v46, v45, v10 & 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_236CE43B4(v18, v20, v22 & 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_236CDDA20(v18, v20, v22 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_236CDDA20(v46, v45, v10 & 1);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

__n128 sub_236CE42B0@<Q0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v11[0] = *(_OWORD *)v1;
  v11[1] = v3;
  uint64_t v12 = *(void *)(v1 + 32);
  sub_236CE3DDC((uint64_t *)v11, (uint64_t)v13);
  long long v4 = v13[13];
  *(_OWORD *)(a1 + 192) = v13[12];
  *(_OWORD *)(a1 + 208) = v4;
  *(_OWORD *)(a1 + 224) = v13[14];
  long long v5 = v13[9];
  *(_OWORD *)(a1 + 128) = v13[8];
  *(_OWORD *)(a1 + 144) = v5;
  long long v6 = v13[11];
  *(_OWORD *)(a1 + 160) = v13[10];
  *(_OWORD *)(a1 + 176) = v6;
  long long v7 = v13[5];
  *(_OWORD *)(a1 + 64) = v13[4];
  *(_OWORD *)(a1 + 80) = v7;
  long long v8 = v13[7];
  *(_OWORD *)(a1 + 96) = v13[6];
  *(_OWORD *)(a1 + 112) = v8;
  long long v9 = v13[1];
  *(_OWORD *)a1 = v13[0];
  *(_OWORD *)(a1 + 16) = v9;
  __n128 result = (__n128)v13[3];
  *(_OWORD *)(a1 + 32) = v13[2];
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_236CE4354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236CFBD00();
  *a1 = result;
  return result;
}

uint64_t sub_236CE4380()
{
  return sub_236CFBD10();
}

uint64_t sub_236CE43B4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_236CE43C8()
{
  unint64_t result = qword_2688CE598;
  if (!qword_2688CE598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE5A0);
    sub_236CE443C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE598);
  }
  return result;
}

unint64_t sub_236CE443C()
{
  unint64_t result = qword_2688CE5A8;
  if (!qword_2688CE5A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE5B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE5A8);
  }
  return result;
}

uint64_t LocationViewModel.address.setter()
{
  return swift_bridgeObjectRelease();
}

id LocationViewModel.location.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t LocationViewModel.address.getter()
{
  swift_getKeyPath();
  sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_236CE45E0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 32);
  *a2 = *(void *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_236CE4674()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_236CE472C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for LocationViewModel()
{
  uint64_t result = qword_2688CE5C0;
  if (!qword_2688CE5C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void (*LocationViewModel.address.modify(void *a1))(void **a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_getKeyPath();
  v3[4] = OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel___observationRegistrar;
  *uint64_t v3 = v1;
  v3[5] = sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  *uint64_t v3 = v1;
  swift_getKeyPath();
  sub_236CFBA20();
  swift_release();
  swift_beginAccess();
  return sub_236CE48DC;
}

void sub_236CE48DC(void **a1)
{
  uint64_t v1 = *a1;
  swift_endAccess();
  *uint64_t v1 = v1[3];
  swift_getKeyPath();
  sub_236CFBA10();
  swift_release();
  free(v1);
}

void *sub_236CE4958()
{
  swift_getKeyPath();
  sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  return v1;
}

void sub_236CE49D0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = a2;
  id v3 = a2;
}

void *sub_236CE4A04()
{
  swift_getKeyPath();
  sub_236CE1D2C();
  sub_236CFBA00();
  swift_release();
  uint64_t v1 = *(void **)(v0 + 48);
  id v2 = v1;
  return v1;
}

void sub_236CE4A7C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = a2;
  id v3 = a2;
}

uint64_t LocationViewModel.__allocating_init(location:albumArtURL:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  MEMORY[0x270FA5388]();
  long long v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236CE4B8C(a2, (uint64_t)v5);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 24) = 0u;
  *(_OWORD *)(v6 + 40) = 0u;
  sub_236CFBA30();
  *(void *)(v6 + 16) = a1;
  sub_236CE4BF4((uint64_t)v5, v6 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  *(void *)(v6 + 56) = 0;
  sub_236CE4C5C(a2);
  return v6;
}

uint64_t sub_236CE4B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CE4BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CE4C5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t LocationViewModel.__allocating_init(location:artworkView:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  MEMORY[0x270FA5388]();
  long long v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_236CFB990();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  sub_236CFBA30();
  *(void *)(v7 + 16) = a1;
  sub_236CE4BF4((uint64_t)v5, v7 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  *(void *)(v7 + 56) = a2;
  return v7;
}

id *LocationViewModel.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_236CE4C5C((uint64_t)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel___observationRegistrar;
  uint64_t v2 = sub_236CFBA40();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LocationViewModel.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_236CE4C5C((uint64_t)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel_albumArtURL);
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC11ShazamKitUI17LocationViewModel___observationRegistrar;
  uint64_t v2 = sub_236CFBA40();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_236CE4F3C()
{
  return type metadata accessor for LocationViewModel();
}

void sub_236CE4F44()
{
  sub_236CE5050();
  if (v0 <= 0x3F)
  {
    sub_236CFBA40();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for LocationViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocationViewModel);
}

void sub_236CE5050()
{
  if (!qword_2688CE5D0)
  {
    sub_236CFB990();
    unint64_t v0 = sub_236CFC500();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2688CE5D0);
    }
  }
}

uint64_t sub_236CE50B8()
{
  return sub_236CE1F04();
}

ValueMetadata *type metadata accessor for MediaLibraryItemRow()
{
  return &type metadata for MediaLibraryItemRow;
}

uint64_t sub_236CE50E0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_236CE50FC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE5E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v16 - v9;
  uint64_t v16 = 0;
  __int16 v17 = 1;
  *(void *)(swift_allocObject() + 16) = a1;
  id v11 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE5E8);
  sub_236CE5B48();
  sub_236CFC080();
  swift_release();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v12(v8, v10, v4);
  *(void *)a2 = v11;
  *(int64x2_t *)(a2 + 8) = vdupq_n_s64(0x4044000000000000uLL);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE608);
  v12((char *)(a2 + *(int *)(v13 + 48)), v8, v4);
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  id v15 = v11;
  v14(v10, v4);
  v14(v8, v4);
}

uint64_t sub_236CE52F4(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE498);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_236CFC420();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_236CFC3F0();
  id v5 = a1;
  uint64_t v6 = sub_236CFC3E0();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v5;
  sub_236CEE934((uint64_t)v3, (uint64_t)&unk_2688CE618, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_236CE540C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[15] = a1;
  v4[16] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE620);
  v4[17] = v5;
  v4[18] = *(void *)(v5 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  sub_236CFC3F0();
  v4[22] = sub_236CFC3E0();
  uint64_t v7 = sub_236CFC3C0();
  v4[23] = v7;
  v4[24] = v6;
  return MEMORY[0x270FA2498](sub_236CE5520, v7, v6);
}

uint64_t sub_236CE5520()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[16];
  uint64_t v3 = self;
  v0[2] = v0;
  v0[7] = v1;
  v0[3] = sub_236CE563C;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_236CE5984;
  v0[13] = &block_descriptor_1;
  v0[14] = v4;
  objc_msgSend(v3, sel_presentMediaItem_presentationSettings_completionHandler_, v2, 0, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_236CE563C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 200) = v2;
  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 184);
    uint64_t v4 = *(void *)(v1 + 192);
    uint64_t v5 = sub_236CE58BC;
  }
  else
  {
    *(_DWORD *)(v1 + 208) = *(_DWORD *)(*(void *)(v1 + 136) + 48);
    uint64_t v3 = *(void *)(v1 + 184);
    uint64_t v4 = *(void *)(v1 + 192);
    uint64_t v5 = sub_236CE5758;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_236CE5758()
{
  uint64_t v1 = *(int *)(v0 + 208);
  uint64_t v2 = *(uint64_t **)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v16 = *(void *)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void **)(v0 + 120);
  swift_release();
  uint64_t v7 = (char *)v2 + v1;
  uint64_t v8 = (char *)(v3 + *(int *)(v4 + 48));
  uint64_t v9 = *v2;
  uint64_t v10 = sub_236CFB990();
  id v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v7, v10);
  uint64_t v12 = (char *)(v16 + *(int *)(v4 + 48));
  v11(v12, v8, v10);
  uint64_t v13 = (char *)v6 + *(int *)(v4 + 48);
  *uint64_t v6 = v9;
  v11(v13, v12, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_236CE58BC()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[15];
  swift_release();
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v4, 1, 1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_236CE5984(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE620);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void *)(a1 + 32);
  if (a4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE448);
    uint64_t v11 = swift_allocError();
    *uint64_t v12 = a4;
    id v13 = a4;
    return MEMORY[0x270FA2410](v10, v11);
  }
  else
  {
    *uint64_t v9 = a2;
    sub_236CFB980();
    sub_236CE6650((uint64_t)v9, *(void *)(*(void *)(v10 + 64) + 40), &qword_2688CE620);
    return swift_continuation_throwingResume();
  }
}

void sub_236CE5AB8(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  *(void *)a1 = sub_236CFBD40();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE5D8);
  sub_236CE50FC(v3, a1 + *(int *)(v4 + 44));
}

uint64_t sub_236CE5B08()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_236CE5B40()
{
  return sub_236CE52F4(*(void **)(v0 + 16));
}

unint64_t sub_236CE5B48()
{
  unint64_t result = qword_2688CE5F0;
  if (!qword_2688CE5F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE5E8);
    sub_236CE2868(&qword_2688CE5F8, &qword_2688CE600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE5F0);
  }
  return result;
}

uint64_t sub_236CE5BE8()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_236CE5C28(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_236CDDC5C;
  return sub_236CE540C(a1, v4, v5, v6);
}

uint64_t initializeBufferWithCopyOfBuffer for MediaLibraryItemRowContent(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void destroy for MediaLibraryItemRowContent(id *a1)
{
}

uint64_t assignWithCopy for MediaLibraryItemRowContent(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MediaLibraryItemRowContent(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaLibraryItemRowContent(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaLibraryItemRowContent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaLibraryItemRowContent()
{
  return &type metadata for MediaLibraryItemRowContent;
}

uint64_t sub_236CE5E5C()
{
  return sub_236CE2868(&qword_2688CE628, &qword_2688CE630);
}

uint64_t sub_236CE5E98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CE5EB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AlbumArt();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE638);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v36 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  id v18 = objc_msgSend(a1, sel_artworkURL);
  if (v18)
  {
    uint64_t v19 = v18;
    sub_236CFB980();

    uint64_t v20 = sub_236CFB990();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_236CFB990();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v5, 1, 1, v21);
  }
  sub_236CE6650((uint64_t)v5, (uint64_t)v8, &qword_2688CE4A0);
  *(void *)&v8[*(int *)(v6 + 20)] = 0;
  sub_236CFC250();
  sub_236CFBBD0();
  sub_236CE6590((uint64_t)v8, (uint64_t)v15);
  char v22 = &v15[*(int *)(v9 + 36)];
  long long v23 = v47;
  *(_OWORD *)char v22 = v46;
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v48;
  sub_236CE65F4((uint64_t)v8);
  sub_236CE6650((uint64_t)v15, (uint64_t)v17, &qword_2688CE638);
  uint64_t v36 = sub_236CFBDE0();
  sub_236CE625C(a1, (uint64_t)v39);
  uint64_t v24 = v39[0];
  uint64_t v25 = v39[1];
  char v26 = v40;
  uint64_t v28 = v41;
  uint64_t v27 = v42;
  uint64_t v29 = v43;
  char v30 = v44;
  uint64_t v31 = v45;
  sub_236CE66B4((uint64_t)v17, (uint64_t)v12);
  uint64_t v32 = (uint64_t)v12;
  int v37 = v12;
  uint64_t v33 = v38;
  sub_236CE66B4(v32, v38);
  uint64_t v34 = v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688CE640) + 48);
  *(void *)uint64_t v34 = v36;
  *(void *)(v34 + 8) = 0;
  *(unsigned char *)(v34 + 16) = 1;
  *(void *)(v34 + 24) = v24;
  *(void *)(v34 + 32) = v25;
  *(unsigned char *)(v34 + 40) = v26;
  *(void *)(v34 + 48) = v28;
  *(void *)(v34 + 56) = v27;
  *(void *)(v34 + 64) = v29;
  *(unsigned char *)(v34 + 72) = v30;
  *(void *)(v34 + 80) = v31;
  sub_236CE43B4(v24, v25, v26);
  swift_bridgeObjectRetain();
  sub_236CE43B4(v27, v29, v30);
  swift_bridgeObjectRetain();
  sub_236CE671C((uint64_t)v17);
  sub_236CDDA20(v24, v25, v26);
  swift_bridgeObjectRelease();
  sub_236CDDA20(v27, v29, v30);
  swift_bridgeObjectRelease();
  return sub_236CE671C((uint64_t)v37);
}

uint64_t sub_236CE625C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(a1, sel_title);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_236CFC360();
  }
  sub_236CDE448();
  uint64_t v5 = sub_236CFC040();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_236CFBF60();
  uint64_t v10 = sub_236CFBFF0();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_236CDDA20(v5, v7, v9);
  swift_bridgeObjectRelease();
  if (qword_2688CE1C8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_236CFBFD0();
  uint64_t v42 = v16;
  uint64_t v43 = v15;
  char v40 = v17;
  uint64_t v44 = v18;
  sub_236CDDA20(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(a1, sel_subtitle);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_236CFC360();
  }
  uint64_t v21 = sub_236CFC040();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  sub_236CFBF80();
  uint64_t v26 = sub_236CFBFF0();
  uint64_t v28 = v27;
  char v30 = v29;
  swift_release();
  sub_236CDDA20(v21, v23, v25);
  swift_bridgeObjectRelease();
  if (qword_2688CE1D0 != -1) {
    swift_once();
  }
  char v31 = v30 & 1;
  uint64_t v32 = sub_236CFBFD0();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  char v38 = v37 & 1;
  sub_236CDDA20(v26, v28, v31);
  swift_bridgeObjectRelease();
  *(void *)a2 = v43;
  *(void *)(a2 + 8) = v42;
  *(unsigned char *)(a2 + 16) = v40 & 1;
  *(void *)(a2 + 24) = v44;
  *(void *)(a2 + 32) = v32;
  *(void *)(a2 + 40) = v34;
  *(unsigned char *)(a2 + 48) = v38;
  *(void *)(a2 + 56) = v36;
  sub_236CE43B4(v43, v42, v40 & 1);
  swift_bridgeObjectRetain();
  sub_236CE43B4(v32, v34, v38);
  swift_bridgeObjectRetain();
  sub_236CDDA20(v32, v34, v38);
  swift_bridgeObjectRelease();
  sub_236CDDA20(v43, v42, v40 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_236CE6584@<X0>(uint64_t a1@<X8>)
{
  return sub_236CE5EB4(*v1, a1);
}

uint64_t sub_236CE6590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlbumArt();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CE65F4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AlbumArt();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236CE6650(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_236CE66B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CE671C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE638);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_236CE6780()
{
  unint64_t result = qword_2688CE648;
  if (!qword_2688CE648)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE650);
    sub_236CE2868(&qword_2688CE658, &qword_2688CE660);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE648);
  }
  return result;
}

void sub_236CE6820()
{
  qword_2688D0E98 = 0x6E20747369747241;
  unk_2688D0EA0 = 0xEB00000000656D61;
}

void sub_236CE684C()
{
  qword_2688D0EA8 = 0x6D616E20676E6F53;
  unk_2688D0EB0 = 0xE900000000000065;
}

void sub_236CE6874()
{
  unk_2688D0EC6 = -4864;
}

void sub_236CE68A4()
{
  qword_2688D0EC8 = 0x20676E697373694DLL;
  unk_2688D0ED0 = 0xEF6B726F77747261;
}

void sub_236CE68D4()
{
  unk_2688D0EE6 = -4864;
}

unint64_t sub_236CE6904(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE688);
  uint64_t v2 = sub_236CFC5D0();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_236CE1DA8(v6, (uint64_t)&v15, &qword_2688CE690);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_236CE6E54(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_236CE7FC0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_236CE6A3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE698);
  uint64_t v2 = sub_236CFC5D0();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_236CE1DA8(v6, (uint64_t)&v13, &qword_2688CE6A0);
    uint64_t v7 = v13;
    unint64_t result = sub_236CE6ECC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_236CE7FC0(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_236CE6B6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE680);
  uint64_t v2 = (void *)sub_236CFC5D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_236CE6ECC((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_236CE6C78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE678);
  uint64_t v2 = (void *)sub_236CFC5D0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_236CE6E54(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_236CE6D94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236CFC360();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_236CE6DC8(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_236CE71B8(a1, (uint64_t)sub_236CE7988, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

unint64_t sub_236CE6E54(uint64_t a1, uint64_t a2)
{
  sub_236CFC660();
  sub_236CFC370();
  uint64_t v4 = sub_236CFC670();
  return sub_236CE6F5C(a1, a2, v4);
}

unint64_t sub_236CE6ECC(uint64_t a1)
{
  sub_236CFC360();
  sub_236CFC660();
  sub_236CFC370();
  uint64_t v2 = sub_236CFC670();
  swift_bridgeObjectRelease();
  return sub_236CE7040(a1, v2);
}

unint64_t sub_236CE6F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_236CFC610() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_236CFC610() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_236CE7040(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_236CFC360();
    uint64_t v8 = v7;
    if (v6 == sub_236CFC360() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_236CFC610();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_236CFC360();
          uint64_t v15 = v14;
          if (v13 == sub_236CFC360() && v15 == v16) {
            break;
          }
          char v18 = sub_236CFC610();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_236CE71B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_236CE79D4();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v54 = v9;
  uint64_t v12 = (void *)*a5;
  unint64_t v14 = sub_236CE6E54(v7, v8);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v18 = v13;
  if (v12[3] >= v17)
  {
    if (a4)
    {
      uint64_t v21 = (void *)*a5;
      if (v13) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_236CE77D4();
      uint64_t v21 = (void *)*a5;
      if (v18) {
        goto LABEL_9;
      }
    }
LABEL_11:
    v21[(v14 >> 6) + 8] |= 1 << v14;
    char v25 = (uint64_t *)(v21[6] + 16 * v14);
    *char v25 = v10;
    v25[1] = v11;
    *(void *)(v21[7] + 8 * v14) = v54;
    uint64_t v26 = v21[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v21[2] = v28;
LABEL_13:
    sub_236CE79D4();
    if (v30)
    {
      uint64_t v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = v31;
      do
      {
        uint64_t v41 = (void *)*a5;
        unint64_t v42 = sub_236CE6E54(v32, v33);
        uint64_t v44 = v41[2];
        BOOL v45 = (v43 & 1) == 0;
        BOOL v27 = __OFADD__(v44, v45);
        uint64_t v46 = v44 + v45;
        if (v27) {
          goto LABEL_24;
        }
        char v47 = v43;
        if (v41[3] < v46)
        {
          sub_236CE74C4(v46, 1);
          unint64_t v42 = sub_236CE6E54(v32, v33);
          if ((v47 & 1) != (v48 & 1)) {
            goto LABEL_26;
          }
        }
        long long v49 = (void *)*a5;
        if (v47)
        {
          uint64_t v35 = 8 * v42;
          id v36 = *(id *)(v49[7] + 8 * v42);
          swift_bridgeObjectRelease();

          uint64_t v37 = v49[7];
          *(void *)(v37 + v35) = v36;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          long long v50 = (uint64_t *)(v49[6] + 16 * v42);
          *long long v50 = v32;
          v50[1] = v33;
          *(void *)(v49[7] + 8 * v42) = v34;
          uint64_t v51 = v49[2];
          BOOL v27 = __OFADD__(v51, 1);
          uint64_t v52 = v51 + 1;
          if (v27) {
            goto LABEL_25;
          }
          v49[2] = v52;
        }
        sub_236CE79D4();
        uint64_t v32 = v38;
        uint64_t v33 = v39;
        uint64_t v34 = v40;
      }
      while (v39);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_236CE7FB8();
    return swift_release();
  }
  sub_236CE74C4(v17, a4 & 1);
  unint64_t v19 = sub_236CE6E54(v10, v11);
  if ((v18 & 1) == (v20 & 1))
  {
    unint64_t v14 = v19;
    uint64_t v21 = (void *)*a5;
    if ((v18 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v22 = 8 * v14;
    id v23 = *(id *)(v21[7] + 8 * v14);
    swift_bridgeObjectRelease();

    uint64_t v24 = v21[7];
    *(void *)(v24 + v22) = v23;
    goto LABEL_13;
  }
LABEL_26:
  uint64_t result = sub_236CFC620();
  __break(1u);
  return result;
}

uint64_t sub_236CE74C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE678);
  char v38 = a2;
  uint64_t v6 = sub_236CFC5C0();
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
    uint64_t v22 = (void *)(v5 + 64);
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
          uint64_t v3 = v35;
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_236CFC660();
    sub_236CFC370();
    uint64_t result = sub_236CFC670();
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
    char v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *char v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

id sub_236CE77D4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE678);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_236CFC5B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
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
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_236CE7988@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  id v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_236CE79D4()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    unint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = *(void **)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    unint64_t v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  int64_t v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      unint64_t v15 = v0[1];
      uint64_t v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      unint64_t v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        uint64_t v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          int64_t v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          uint64_t v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            int64_t v13 = v3 + 3;
            goto LABEL_7;
          }
          unint64_t v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            uint64_t v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            int64_t v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              uint64_t v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              uint64_t v18 = v3 + 6;
              while (v14 != v18)
              {
                uint64_t v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  int64_t v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

void sub_236CE7B68(uint64_t a1)
{
  type metadata accessor for SHAnalyticsPayload(0);
  sub_236CE3328();
  sub_236CE7F60();
  uint64_t v2 = sub_236CFC2F0();
  id v3 = objc_msgSend(self, sel_mainBundle);
  id v4 = objc_msgSend(v3, sel_bundleIdentifier);

  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE670);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_236CFEDA0;
    unint64_t v6 = (void *)*MEMORY[0x263F6C518];
    *(void *)(inited + 32) = *MEMORY[0x263F6C518];
    *(void *)(inited + 40) = v4;
    id v7 = v6;
    uint64_t v8 = inited;
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  sub_236CE6B6C(v8);
  uint64_t v9 = sub_236CFC2F0();
  swift_bridgeObjectRelease();
  sub_236CE6DC8(v9, v2);
  uint64_t v10 = self;
  uint64_t v11 = (void *)sub_236CFC2D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_sendEvent_withPayload_, a1, v11);
}

void sub_236CE7D58(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE668);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236CFEDA0;
  *(void *)(inited + 32) = sub_236CFC360();
  *(void *)(inited + 40) = v4;
  sub_236CFC360();
  uint64_t v5 = sub_236CFC330();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v5;
  unint64_t v6 = sub_236CE6C78(inited);
  id v7 = objc_msgSend(self, sel_mainBundle);
  id v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE670);
    uint64_t v9 = swift_initStackObject();
    *(_OWORD *)(v9 + 16) = xmmword_236CFEDA0;
    uint64_t v10 = (void *)*MEMORY[0x263F6C518];
    *(void *)(v9 + 32) = *MEMORY[0x263F6C518];
    *(void *)(v9 + 40) = v8;
    id v11 = v10;
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
  }
  sub_236CE6B6C(v12);
  type metadata accessor for SHAnalyticsPayload(0);
  sub_236CE3328();
  sub_236CE7F60();
  uint64_t v13 = sub_236CFC2F0();
  swift_bridgeObjectRelease();
  sub_236CE6DC8(v13, v6);
  unint64_t v14 = self;
  unint64_t v15 = (void *)sub_236CFC2D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v14, sel_sendEvent_withPayload_, a2, v15);
}

unint64_t sub_236CE7F60()
{
  unint64_t result = qword_2688CE350;
  if (!qword_2688CE350)
  {
    type metadata accessor for SHAnalyticsPayload(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE350);
  }
  return result;
}

uint64_t sub_236CE7FB8()
{
  return swift_release();
}

_OWORD *sub_236CE7FC0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_236CE7FD0@<X0>(uint64_t *a1@<X8>)
{
  return sub_236CE6D94(a1);
}

void sub_236CE7FE8()
{
  swift_getObjectType();
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel];
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_addSubview_, v1);
  id v2 = objc_msgSend(self, sel_systemFontOfSize_weight_, 62.0, *MEMORY[0x263F81840]);
  objc_msgSend(v1, sel_setFont_, v2);

  id v3 = objc_msgSend(self, sel_whiteColor);
  objc_msgSend(v1, sel_setTextColor_, v3);

  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_236CFB8B0();

  unint64_t v6 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setText_, v6, 0xE000000000000000);

  id v7 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE580);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_236CFEDB0;
  id v9 = objc_msgSend(v1, sel_centerXAnchor);
  id v10 = objc_msgSend(v0, sel_centerXAnchor);
  id v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(void *)(v8 + 32) = v11;
  id v12 = objc_msgSend(v1, sel_centerYAnchor);
  id v13 = objc_msgSend(v0, sel_centerYAnchor);
  id v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(void *)(v8 + 40) = v14;
  sub_236CFC3B0();
  sub_236CE3248();
  id v15 = (id)sub_236CFC390();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_activateConstraints_, v15);
}

id sub_236CE83D4(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC11ShazamKitUI20AmbientNoMatchUIView_titleLabel;
  id v5 = objc_allocWithZone(MEMORY[0x263F828E0]);
  unint64_t v6 = v1;
  *(void *)&v1[v4] = objc_msgSend(v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v11.receiver = v6;
  v11.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v11, sel_initWithCoder_, a1);
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
    sub_236CE7FE8();
  }
  return v8;
}

uint64_t type metadata accessor for AmbientNoMatchUIView()
{
  return self;
}

ValueMetadata *type metadata accessor for MediaLibraryViewModel()
{
  return &type metadata for MediaLibraryViewModel;
}

uint64_t sub_236CE8580()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Assets()
{
  return self;
}

id sub_236CE85B4()
{
  type metadata accessor for Assets();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2688D0EE8 = (uint64_t)result;
  return result;
}

void sub_236CE860C()
{
  qword_2688CE6B0 = 0x746954686374616DLL;
  *(void *)algn_2688CE6B8 = 0xEF726F6C6F43656CLL;
}

uint64_t sub_236CE863C(uint64_t a1)
{
  return sub_236CE8840(a1, 0xD000000000000013, 0x8000000236D005A0, MEMORY[0x263F1B460], &qword_2688D0EF0);
}

uint64_t sub_236CE8674()
{
  if (qword_2688CE1B8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2688CE1B0;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_2688D0EE8;
  uint64_t result = sub_236CFC130();
  qword_2688D0EF8 = result;
  return result;
}

uint64_t sub_236CE8730(uint64_t a1)
{
  return sub_236CE8840(a1, 0xD000000000000012, 0x8000000236D00580, MEMORY[0x263F1B460], &qword_2688D0F00);
}

uint64_t sub_236CE8768(uint64_t a1)
{
  return sub_236CE8840(a1, 0xD000000000000011, 0x8000000236D00560, MEMORY[0x263F1B460], &qword_2688D0F08);
}

uint64_t sub_236CE87A0(uint64_t a1)
{
  return sub_236CE8840(a1, 0xD000000000000016, 0x8000000236D00540, MEMORY[0x263F1B460], &qword_2688D0F10);
}

void sub_236CE87D8()
{
  algn_2688CE6C8[7] = -18;
}

uint64_t sub_236CE8808(uint64_t a1)
{
  return sub_236CE8840(a1, 0xD000000000000014, 0x8000000236D00520, MEMORY[0x263F1B580], &qword_2688D0F18);
}

uint64_t sub_236CE8840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t *a5)
{
  if (qword_2688CE1B0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_2688D0EE8;
  id v10 = (id)qword_2688D0EE8;
  uint64_t result = a4(a2, a3, v9);
  *a5 = result;
  return result;
}

uint64_t sub_236CE88D0()
{
  if (qword_2688CE1E8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2688CE1B0;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_2688D0EE8;
  uint64_t result = sub_236CFC1A0();
  qword_2688D0F20 = result;
  return result;
}

ValueMetadata *type metadata accessor for AmbientListening()
{
  return &type metadata for AmbientListening;
}

uint64_t sub_236CE899C()
{
  return MEMORY[0x263F1BB58];
}

id sub_236CE89A8()
{
  type metadata accessor for AmbientListeningUIView();
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_236CE89F4()
{
  return sub_236CFBE30();
}

uint64_t sub_236CE8A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CE8B80();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_236CE8A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CE8B80();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_236CE8B00()
{
}

unint64_t sub_236CE8B2C()
{
  unint64_t result = qword_2688CE6D0;
  if (!qword_2688CE6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE6D0);
  }
  return result;
}

unint64_t sub_236CE8B80()
{
  unint64_t result = qword_2688CE6D8;
  if (!qword_2688CE6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE6D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for MatchSnippet(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  id v4 = v3;
  return a1;
}

void destroy for MatchSnippet(uint64_t a1)
{
}

uint64_t assignWithCopy for MatchSnippet(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v3 = *(void **)(a2 + 16);
  id v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v3;
  id v5 = v3;

  return a1;
}

uint64_t assignWithTake for MatchSnippet(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for MatchSnippet(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MatchSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for MatchSnippet()
{
  return &type metadata for MatchSnippet;
}

uint64_t sub_236CE8D40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CE8D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE6E0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE6E8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v34 - v11;
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v34 - v13;
  id v15 = *(char **)v1;
  int v16 = *(unsigned __int8 *)(v1 + 8);
  unint64_t v17 = *(void **)(v1 + 16);
  *(void *)a1 = sub_236CFBDE0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_236CFC260();
  sub_236CDB0F8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v49, 0.0, 1, 0.0, 1);
  uint64_t v48 = v49;
  int v47 = BYTE8(v49);
  uint64_t v46 = v50;
  int v45 = v51;
  uint64_t v44 = v52;
  int v43 = v53;
  uint64_t v42 = v54;
  int v41 = v55;
  uint64_t v40 = v56;
  int v39 = v57;
  uint64_t v38 = v58;
  int v37 = v59;
  uint64_t v36 = v60;
  uint64_t v35 = v61;
  *(void *)id v5 = sub_236CFBD40();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE6F0);
  sub_236CE9184(v15, v16, v17, (uint64_t)&v5[*(int *)(v18 + 44)]);
  LOBYTE(v17) = sub_236CFBF30();
  unsigned __int8 v19 = sub_236CFBF50();
  char v20 = sub_236CFBF40();
  sub_236CFBF40();
  if (sub_236CFBF40() != v17) {
    char v20 = sub_236CFBF40();
  }
  sub_236CFBF40();
  if (sub_236CFBF40() != v19) {
    char v20 = sub_236CFBF40();
  }
  uint64_t v21 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688CE6F8) + 44);
  sub_236CFBB20();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_236CE1DA8((uint64_t)v5, (uint64_t)v12, &qword_2688CE6E0);
  uint64_t v30 = &v12[*(int *)(v6 + 36)];
  *uint64_t v30 = v20;
  *((void *)v30 + 1) = v23;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v27;
  *((void *)v30 + 4) = v29;
  v30[40] = 0;
  sub_236CE17A0((uint64_t)v5, &qword_2688CE6E0);
  sub_236CE6650((uint64_t)v12, (uint64_t)v14, &qword_2688CE6E8);
  sub_236CE1DA8((uint64_t)v14, (uint64_t)v9, &qword_2688CE6E8);
  *(void *)uint64_t v21 = v48;
  *(unsigned char *)(v21 + 8) = v47;
  *(void *)(v21 + 16) = v46;
  *(unsigned char *)(v21 + 24) = v45;
  *(void *)(v21 + 32) = v44;
  *(unsigned char *)(v21 + 40) = v43;
  *(void *)(v21 + 48) = v42;
  *(unsigned char *)(v21 + 56) = v41;
  *(void *)(v21 + 64) = v40;
  *(unsigned char *)(v21 + 72) = v39;
  *(void *)(v21 + 80) = v38;
  *(unsigned char *)(v21 + 88) = v37;
  uint64_t v31 = v35;
  *(void *)(v21 + 96) = v36;
  *(void *)(v21 + 104) = v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE700);
  sub_236CE1DA8((uint64_t)v9, v21 + *(int *)(v32 + 48), &qword_2688CE6E8);
  sub_236CE17A0((uint64_t)v14, &qword_2688CE6E8);
  return sub_236CE17A0((uint64_t)v9, &qword_2688CE6E8);
}

uint64_t sub_236CE9184@<X0>(char *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  int v121 = a2;
  v137 = a1;
  uint64_t v132 = a4;
  uint64_t v111 = sub_236CFBB40();
  uint64_t v110 = *(void *)(v111 - 8);
  MEMORY[0x270FA5388](v111);
  v109 = (char *)&v109 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE708);
  uint64_t v116 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v115 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE710);
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  v122 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE718);
  uint64_t v119 = *(void *)(v120 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v120);
  v117 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v112 = (char *)&v109 - v10;
  uint64_t v11 = sub_236CFB990();
  uint64_t v136 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v123 = (char *)&v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v134 = (char *)&v109 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE720);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  v131 = (char *)&v109 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v130 = (char *)&v109 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  v129 = (char *)&v109 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v109 - v22;
  uint64_t v24 = type metadata accessor for AlbumArt();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v109 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE728);
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v109 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE730);
  MEMORY[0x270FA5388](v125);
  uint64_t v31 = (char *)&v109 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE738);
  MEMORY[0x270FA5388](v126);
  id v33 = (char *)&v109 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE740);
  uint64_t v34 = MEMORY[0x270FA5388](v128);
  v124 = (char *)&v109 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = (char *)&v109 - v37;
  MEMORY[0x270FA5388](v36);
  uint64_t v135 = (uint64_t)&v109 - v39;
  id v133 = a3;
  id v40 = objc_msgSend(a3, sel_artworkURL);
  if (v40)
  {
    int v41 = v40;
    sub_236CFB980();

    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t, void *))(v136 + 56);
    int v43 = v23;
    uint64_t v44 = 0;
  }
  else
  {
    uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t, void *))(v136 + 56);
    int v43 = v23;
    uint64_t v44 = 1;
  }
  v127 = v42;
  v42(v43, v44, 1, (void *)v11);
  sub_236CE6650((uint64_t)v23, (uint64_t)v26, &qword_2688CE4A0);
  *(void *)&v26[*(int *)(v24 + 20)] = 0x4022000000000000;
  if (qword_2688CE230 != -1) {
    swift_once();
  }
  uint64_t v46 = qword_2688D0F48;
  uint64_t v45 = unk_2688D0F50;
  swift_bridgeObjectRetain();
  int v47 = sub_236CFBEF0();
  sub_236CFC290();
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  sub_236CE6590((uint64_t)v26, (uint64_t)v29);
  uint64_t v52 = &v29[*(int *)(v27 + 36)];
  *(void *)uint64_t v52 = v46;
  *((void *)v52 + 1) = v45;
  *((void *)v52 + 2) = v137;
  *((_DWORD *)v52 + 6) = v47;
  *((void *)v52 + 4) = v49;
  *((void *)v52 + 5) = v51;
  v52[48] = 1;
  sub_236CE65F4((uint64_t)v26);
  sub_236CFC250();
  sub_236CFBBD0();
  sub_236CE1DA8((uint64_t)v29, (uint64_t)v31, &qword_2688CE728);
  unsigned __int8 v53 = &v31[*(int *)(v125 + 36)];
  long long v54 = v139;
  *(_OWORD *)unsigned __int8 v53 = v138;
  *((_OWORD *)v53 + 1) = v54;
  *((_OWORD *)v53 + 2) = v140;
  sub_236CE17A0((uint64_t)v29, &qword_2688CE728);
  sub_236CE1DA8((uint64_t)v31, (uint64_t)v33, &qword_2688CE730);
  unsigned __int8 v55 = &v33[*(int *)(v126 + 36)];
  *(void *)unsigned __int8 v55 = 0;
  *((_WORD *)v55 + 4) = 1;
  sub_236CE17A0((uint64_t)v31, &qword_2688CE730);
  char v56 = sub_236CFBF50();
  sub_236CFBB20();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  sub_236CE1DA8((uint64_t)v33, (uint64_t)v38, &qword_2688CE738);
  uint64_t v65 = &v38[*(int *)(v128 + 36)];
  *uint64_t v65 = v56;
  *((void *)v65 + 1) = v58;
  *((void *)v65 + 2) = v60;
  *((void *)v65 + 3) = v62;
  *((void *)v65 + 4) = v64;
  v65[40] = 0;
  sub_236CE17A0((uint64_t)v33, &qword_2688CE738);
  sub_236CE6650((uint64_t)v38, v135, &qword_2688CE740);
  uint64_t v126 = sub_236CFBDE0();
  id v66 = v133;
  id v67 = objc_msgSend(v133, sel_title);
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v128 = sub_236CFC360();
    unint64_t v70 = v69;
  }
  else
  {
    uint64_t v128 = 0;
    unint64_t v70 = 0xE000000000000000;
  }
  uint64_t v72 = (uint64_t)v130;
  uint64_t v71 = (uint64_t)v131;
  uint64_t v73 = v136;
  char v74 = v134;
  id v75 = objc_msgSend(v66, sel_subtitle);
  uint64_t v76 = (void *)v11;
  if (v75)
  {
    uint64_t v77 = v75;
    v131 = (char *)sub_236CFC360();
    unint64_t v79 = v78;
  }
  else
  {
    v131 = 0;
    unint64_t v79 = 0xE000000000000000;
  }
  id v80 = objc_msgSend(v66, sel_appleMusicURL);
  if (!v80)
  {
    uint64_t v83 = (uint64_t)v129;
    v127(v129, 1, 1, v76);
    goto LABEL_17;
  }
  v81 = v80;
  sub_236CFB980();

  v82 = *(void (**)(void))(v73 + 32);
  uint64_t v83 = (uint64_t)v129;
  v82();
  v127((char *)v83, 0, 1, v76);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v73 + 48))(v83, 1, v76) == 1)
  {
LABEL_17:
    sub_236CE17A0(v83, &qword_2688CE4A0);
LABEL_18:
    uint64_t v100 = v126;
    uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE748);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v72, 1, 1, v101);
    uint64_t v99 = (uint64_t)v124;
    goto LABEL_19;
  }
  ((void (*)(char *, uint64_t, void *))v82)(v74, v83, v76);
  if ((v121 & 1) == 0)
  {
    (*(void (**)(char *, void *))(v73 + 8))(v74, v76);
    goto LABEL_18;
  }
  uint64_t v84 = (*(uint64_t (**)(char *, char *, void *))(v73 + 16))(v123, v74, v76);
  MEMORY[0x270FA5388](v84);
  *(&v109 - 4) = v137;
  *((unsigned char *)&v109 - 24) = 1;
  *(&v109 - 2) = (char *)v133;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE758);
  sub_236CEA214();
  sub_236CFBFA0();
  v85 = v109;
  sub_236CFBB30();
  v86 = v115;
  uint64_t v87 = v111;
  sub_236CFC210();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v85, v87);
  sub_236CFBB50();
  sub_236CE2868(&qword_2688CE7B8, &qword_2688CE710);
  sub_236CE2868(&qword_2688CE7C0, &qword_2688CE708);
  id v133 = v76;
  v88 = v117;
  uint64_t v89 = v114;
  uint64_t v90 = v118;
  v91 = v122;
  sub_236CFC0B0();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v86, v90);
  (*(void (**)(char *, uint64_t))(v113 + 8))(v91, v89);
  uint64_t v92 = v119;
  v93 = v112;
  uint64_t v94 = v120;
  (*(void (**)(char *, char *, uint64_t))(v119 + 32))(v112, v88, v120);
  v95 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
  v95(v88, v93, v94);
  *(void *)uint64_t v71 = 0;
  *(unsigned char *)(v71 + 8) = 1;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE7C8);
  v95((char *)(v71 + *(int *)(v96 + 48)), v88, v94);
  v97 = *(void (**)(char *, uint64_t))(v92 + 8);
  v97(v93, v94);
  (*(void (**)(char *, id))(v136 + 8))(v134, v133);
  v97(v88, v94);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE748);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v98 - 8) + 56))(v71, 0, 1, v98);
  sub_236CE6650(v71, v72, &qword_2688CE720);
  uint64_t v99 = (uint64_t)v124;
  uint64_t v100 = v126;
LABEL_19:
  uint64_t v102 = v135;
  sub_236CE1DA8(v135, v99, &qword_2688CE740);
  sub_236CE1DA8(v72, v71, &qword_2688CE720);
  uint64_t v103 = v132;
  sub_236CE1DA8(v99, v132, &qword_2688CE740);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE750);
  uint64_t v105 = v103 + *(int *)(v104 + 48);
  *(void *)uint64_t v105 = v100;
  *(void *)(v105 + 8) = 0x3FF0000000000000;
  *(unsigned char *)(v105 + 16) = 0;
  uint64_t v106 = v128;
  *(void *)(v105 + 24) = v137;
  *(void *)(v105 + 32) = v106;
  v107 = v131;
  *(void *)(v105 + 40) = v70;
  *(void *)(v105 + 48) = v107;
  *(void *)(v105 + 56) = v79;
  sub_236CE1DA8(v71, v103 + *(int *)(v104 + 64), &qword_2688CE720);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_236CE17A0(v72, &qword_2688CE720);
  sub_236CE17A0(v102, &qword_2688CE740);
  sub_236CE17A0(v71, &qword_2688CE720);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_236CE17A0(v99, &qword_2688CE740);
}

uint64_t sub_236CE9FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE7D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2688CE1F8 != -1) {
    swift_once();
  }
  uint64_t v7 = *MEMORY[0x263F1B510];
  uint64_t v8 = sub_236CFC180();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  uint64_t v10 = sub_236CFC160();
  sub_236CE17A0((uint64_t)v6, &qword_2688CE7D0);
  int v11 = sub_236CFBF00();
  sub_236CFC290();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  LODWORD(v7) = sub_236CFBEE0();
  uint64_t v16 = sub_236CFC120();
  uint64_t result = swift_getKeyPath();
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = 0xD000000000000014;
  *(void *)(a2 + 16) = 0x8000000236D005C0;
  *(void *)(a2 + 24) = a1;
  *(_DWORD *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v15;
  *(unsigned char *)(a2 + 56) = 1;
  *(_DWORD *)(a2 + 60) = v7;
  *(void *)(a2 + 64) = result;
  *(void *)(a2 + 72) = v16;
  return result;
}

void sub_236CEA1E4()
{
}

uint64_t sub_236CEA204@<X0>(uint64_t a1@<X8>)
{
  return sub_236CE9FFC(*(void *)(v1 + 16), a1);
}

unint64_t sub_236CEA214()
{
  unint64_t result = qword_2688CE760;
  if (!qword_2688CE760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE758);
    sub_236CEA2B4();
    sub_236CE2868(&qword_2688CE7A8, &qword_2688CE7B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE760);
  }
  return result;
}

unint64_t sub_236CEA2B4()
{
  unint64_t result = qword_2688CE768;
  if (!qword_2688CE768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE770);
    sub_236CEA354();
    sub_236CE2868(&qword_2688CE798, &qword_2688CE7A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE768);
  }
  return result;
}

unint64_t sub_236CEA354()
{
  unint64_t result = qword_2688CE778;
  if (!qword_2688CE778)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE780);
    sub_236CE2868(&qword_2688CE788, &qword_2688CE790);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE778);
  }
  return result;
}

uint64_t sub_236CEA3F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236CFBCA0();
  *a1 = result;
  return result;
}

uint64_t sub_236CEA420()
{
  return sub_236CFBCB0();
}

uint64_t sub_236CEA44C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236CFBCA0();
  *a1 = result;
  return result;
}

uint64_t sub_236CEA478()
{
  return sub_236CFBCB0();
}

uint64_t sub_236CEA4A4()
{
  return sub_236CE2868(&qword_2688CE7D8, &qword_2688CE7E0);
}

uint64_t AmbientMatchingFlowView.viewModel.getter()
{
  return swift_retain();
}

uint64_t AmbientMatchingFlowView.viewModel.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*AmbientMatchingFlowView.viewModel.modify())()
{
  return nullsub_1;
}

uint64_t AmbientMatchingFlowView.$viewModel.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for MatchingFlowViewModel();
  unint64_t v4 = sub_236CEA590();
  return MEMORY[0x270EFFB88](v1, v2, v3, v4);
}

unint64_t sub_236CEA590()
{
  unint64_t result = qword_2688CE7E8;
  if (!qword_2688CE7E8)
  {
    type metadata accessor for MatchingFlowViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE7E8);
  }
  return result;
}

uint64_t AmbientMatchingFlowView.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MatchingFlowViewModel();
  sub_236CEA590();
  uint64_t result = sub_236CFBC30();
  *a1 = result;
  a1[1] = v3;
  a1[2] = 0;
  return result;
}

uint64_t AmbientMatchingFlowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = sub_236CFBDD0();
  sub_236CEA734((uint64_t)v15);
  long long v13 = v15[1];
  long long v14 = v15[0];
  long long v12 = v15[2];
  uint64_t v7 = v16;
  char v8 = v17;
  char v9 = v18;
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = v3;
  v10[3] = v4;
  v10[4] = v5;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 40) = v13;
  *(_OWORD *)(a1 + 56) = v12;
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 81) = v9;
  *(void *)(a1 + 88) = sub_236CEAD78;
  *(void *)(a1 + 96) = v10;
  return swift_retain();
}

double sub_236CEA734@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236CFBAE0();
  swift_release();
  swift_release();
  swift_release();
  if (v20)
  {
    if (v20 == 1)
    {
      sub_236CE3948(v18, v19, 1);
    }
    else
    {
      *(_OWORD *)&v16[-7] = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v13 = 0u;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE838);
      sub_236CE8B2C();
      sub_236CEB280(&qword_2688CE830, &qword_2688CE838, (void (*)(void))sub_236CEB22C);
      sub_236CFBED0();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE818);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE820);
    sub_236CEB18C();
    sub_236CEB280(&qword_2688CE848, &qword_2688CE820, (void (*)(void))sub_236CEB300);
    sub_236CFBED0();
  }
  else
  {
    type metadata accessor for AmbientMatchActionHandler();
    uint64_t v2 = swift_allocObject();
    *(unsigned char *)(v2 + 16) = v18 & 1;
    *(void *)(v2 + 24) = v19;
    *(void *)&long long v13 = v18 & 1;
    *((void *)&v13 + 1) = v19;
    *(void *)&long long v14 = v2;
    *((void *)&v14 + 1) = sub_236CEAB68;
    long long v15 = 0uLL;
    *(void *)uint64_t v16 = 0;
    v16[8] = 1;
    sub_236CE391C(v18, v19, 0);
    sub_236CE391C(v18, v19, 0);
    id v4 = v19;
    swift_retain();
    sub_236CDE40C((uint64_t)sub_236CEAB68);
    sub_236CDE40C(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE838);
    sub_236CE8B2C();
    sub_236CEB280(&qword_2688CE830, &qword_2688CE838, (void (*)(void))sub_236CEB22C);
    sub_236CFBED0();
    sub_236CEB354(v5, v6, v7, v8, v9, v10, v11, v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE818);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE820);
    sub_236CEB18C();
    sub_236CEB280(&qword_2688CE848, &qword_2688CE820, (void (*)(void))sub_236CEB300);
    sub_236CFBED0();
    sub_236CE3948(v18, v19, 0);
    sub_236CEB3CC(v5, v6, v7, v8, v9, v10, v11, v12);
    swift_release();

    sub_236CDDA08((uint64_t)sub_236CEAB68);
    sub_236CDDA08(0);
  }
  double result = *(double *)&v13;
  *(_OWORD *)a1 = v13;
  *(_OWORD *)(a1 + 16) = v14;
  *(_OWORD *)(a1 + 32) = v15;
  *(void *)(a1 + 48) = *(void *)v16;
  *(unsigned char *)(a1 + 56) = v16[8];
  *(unsigned char *)(a1 + 57) = v17;
  return result;
}

uint64_t sub_236CEAB68()
{
  uint64_t v0 = *MEMORY[0x263F6C4F0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE670);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236CFEDA0;
  uint64_t v2 = (void *)*MEMORY[0x263F6C510];
  *(void *)(inited + 32) = *MEMORY[0x263F6C510];
  sub_236CEB444();
  id v3 = v2;
  *(void *)(inited + 40) = sub_236CFC460();
  sub_236CE6B6C(inited);
  sub_236CE7B68(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_236CEAC10()
{
  uint64_t v0 = *MEMORY[0x263F6C4F0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE670);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_236CFEDA0;
  uint64_t v2 = (void *)*MEMORY[0x263F6C510];
  *(void *)(inited + 32) = *MEMORY[0x263F6C510];
  sub_236CEB444();
  id v3 = v2;
  *(void *)(inited + 40) = sub_236CFC460();
  sub_236CE6B6C(inited);
  sub_236CE7B68(v0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_236CEACB8(double a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void (**)(uint64_t, double, double))(a4
                                                     + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *v6;
  if (*v6)
  {
    uint64_t v9 = swift_retain();
    v8(v9, a1, a2);
    return sub_236CDDA08((uint64_t)v8);
  }
  return result;
}

uint64_t sub_236CEAD40()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_236CEAD78(double a1, double a2)
{
  return sub_236CEACB8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_236CEAD84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CEADA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = sub_236CFBDD0();
  sub_236CEA734((uint64_t)v15);
  long long v13 = v15[1];
  long long v14 = v15[0];
  long long v12 = v15[2];
  uint64_t v7 = v16;
  char v8 = v17;
  char v9 = v18;
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = v3;
  v10[3] = v4;
  v10[4] = v5;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v14;
  *(_OWORD *)(a1 + 40) = v13;
  *(_OWORD *)(a1 + 56) = v12;
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 81) = v9;
  *(void *)(a1 + 88) = sub_236CEB488;
  *(void *)(a1 + 96) = v10;
  return swift_retain();
}

uint64_t sub_236CEAE98@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_236CEAEA4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 8) = v3;
  return result;
}

void *sub_236CEAEEC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

void *assignWithCopy for AmbientMatchingFlowView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for AmbientMatchingFlowView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for AmbientMatchingFlowView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AmbientMatchingFlowView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for AmbientMatchingFlowView()
{
  return &type metadata for AmbientMatchingFlowView;
}

unint64_t sub_236CEB058()
{
  unint64_t result = qword_2688CE7F0;
  if (!qword_2688CE7F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE7F8);
    sub_236CEB0D4();
    sub_236CEB130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE7F0);
  }
  return result;
}

unint64_t sub_236CEB0D4()
{
  unint64_t result = qword_2688CE800;
  if (!qword_2688CE800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE808);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE800);
  }
  return result;
}

unint64_t sub_236CEB130()
{
  unint64_t result = qword_2688CE810;
  if (!qword_2688CE810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE810);
  }
  return result;
}

unint64_t sub_236CEB18C()
{
  unint64_t result = qword_2688CE828;
  if (!qword_2688CE828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE818);
    sub_236CE8B2C();
    sub_236CEB280(&qword_2688CE830, &qword_2688CE838, (void (*)(void))sub_236CEB22C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE828);
  }
  return result;
}

unint64_t sub_236CEB22C()
{
  unint64_t result = qword_2688CE840;
  if (!qword_2688CE840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE840);
  }
  return result;
}

uint64_t sub_236CEB280(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236CEB300()
{
  unint64_t result = qword_2688CE850;
  if (!qword_2688CE850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE850);
  }
  return result;
}

void sub_236CEB354(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8)
  {
    id v10 = a2;
    swift_retain();
    sub_236CDE40C(a4);
    sub_236CDE40C(a6);
  }
}

void sub_236CEB3CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8)
  {

    swift_release();
    sub_236CDDA08(a4);
    sub_236CDDA08(a6);
  }
}

unint64_t sub_236CEB444()
{
  unint64_t result = qword_2688CE858;
  if (!qword_2688CE858)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688CE858);
  }
  return result;
}

void MediaLibrary.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_236CEB4A8;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
}

uint64_t sub_236CEB4A8()
{
  type metadata accessor for MediaLibraryController();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE8B8);
  sub_236CFBAA0();
  return v0;
}

uint64_t MediaLibrary.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v2 = sub_236CFC420();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v32 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v30 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE860);
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE868);
  uint64_t v6 = MEMORY[0x270FA5388](v33);
  char v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v28 = (uint64_t)&v26 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE870);
  MEMORY[0x270FA5388](v10);
  long long v12 = (uint64_t *)((char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = *v1;
  uint64_t v14 = v1[1];
  char v15 = *((unsigned char *)v1 + 16);
  sub_236CEB984();
  type metadata accessor for MediaLibraryController();
  sub_236CEC2E0(&qword_2688CE878, (void (*)(uint64_t))type metadata accessor for MediaLibraryController);
  sub_236CFBB60();
  sub_236CEB98C();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236CFBAE0();
  swift_release();
  swift_release();
  swift_release();
  if (v35)
  {
    *long long v12 = v35;
    swift_storeEnumTagMultiPayload();
    sub_236CEC184();
    sub_236CEC1D8();
    return sub_236CFBED0();
  }
  else
  {
    sub_236CFBB80();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v13;
    *(void *)(v17 + 24) = v14;
    *(unsigned char *)(v17 + 32) = v15;
    sub_236CEB984();
    char v18 = v30;
    sub_236CFC400();
    uint64_t v19 = &v8[*(int *)(v33 + 36)];
    uint64_t v20 = sub_236CFBC20();
    uint64_t v22 = v31;
    uint64_t v21 = v32;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(&v19[*(int *)(v20 + 20)], v18, v32);
    *(void *)uint64_t v19 = &unk_2688CE888;
    *((void *)v19 + 1) = v17;
    uint64_t v23 = v27;
    uint64_t v24 = v29;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v8, v5, v29);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v18, v21);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
    uint64_t v25 = v28;
    sub_236CEC0B4((uint64_t)v8, v28);
    sub_236CEC11C(v25, (uint64_t)v12);
    swift_storeEnumTagMultiPayload();
    sub_236CEC184();
    sub_236CEC1D8();
    sub_236CFBED0();
    return sub_236CEC328(v25);
  }
}

uint64_t sub_236CEB984()
{
  return swift_retain();
}

uint64_t sub_236CEB98C()
{
  return swift_release();
}

uint64_t sub_236CEB994(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 160) = a3;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = a2;
  *(void *)(v3 + 80) = sub_236CFC3F0();
  *(void *)(v3 + 88) = sub_236CFC3E0();
  uint64_t v5 = sub_236CFC3C0();
  *(void *)(v3 + 96) = v5;
  *(void *)(v3 + 104) = v4;
  return MEMORY[0x270FA2498](sub_236CEBA34, v5, v4);
}

uint64_t sub_236CEBA34()
{
  sub_236CEB984();
  type metadata accessor for MediaLibraryController();
  sub_236CEC2E0(&qword_2688CE878, (void (*)(uint64_t))type metadata accessor for MediaLibraryController);
  v0[14] = sub_236CFBB60();
  sub_236CEB98C();
  v0[15] = sub_236CFC3E0();
  uint64_t v2 = sub_236CFC3C0();
  v0[16] = v2;
  v0[17] = v1;
  return MEMORY[0x270FA2498](sub_236CEBB58, v2, v1);
}

uint64_t sub_236CEBB58()
{
  sub_236CF0A44((uint64_t)(v0 + 2));
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v2 + 8) + **(int **)(v2 + 8));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_236CEBC70;
  return v5(v1, v2);
}

uint64_t sub_236CEBC70(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 136);
  uint64_t v4 = *(void *)(v2 + 128);
  return MEMORY[0x270FA2498](sub_236CEBD98, v4, v3);
}

uint64_t sub_236CEBD98()
{
  uint64_t v1 = v0[19];
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  v0[7] = v1;
  swift_retain();
  sub_236CFBAF0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  swift_release();
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  return MEMORY[0x270FA2498](sub_236CEBE68, v2, v3);
}

uint64_t sub_236CEBE68()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_236CEBECC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236CFBAE0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_236CEBF50()
{
  return sub_236CFBAF0();
}

uint64_t sub_236CEBFD0()
{
  sub_236CEB98C();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_236CEC00C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_236CDDC5C;
  return sub_236CEB994(v2, v3, v4);
}

uint64_t sub_236CEC0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CEC11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_236CEC184()
{
  unint64_t result = qword_2688CE890;
  if (!qword_2688CE890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE890);
  }
  return result;
}

unint64_t sub_236CEC1D8()
{
  unint64_t result = qword_2688CE898;
  if (!qword_2688CE898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE868);
    sub_236CEC284();
    sub_236CEC2E0(&qword_2688CE428, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE898);
  }
  return result;
}

unint64_t sub_236CEC284()
{
  unint64_t result = qword_2688CE8A0;
  if (!qword_2688CE8A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE8A0);
  }
  return result;
}

uint64_t sub_236CEC2E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236CEC328(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE868);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236CEC388()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for MediaLibrary()
{
  return sub_236CEB98C();
}

uint64_t _s11ShazamKitUI12MediaLibraryVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_236CEB984();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for MediaLibrary(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_236CEB984();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_236CEB98C();
  return a1;
}

uint64_t assignWithTake for MediaLibrary(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_236CEB98C();
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaLibrary(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaLibrary(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MediaLibrary()
{
  return &type metadata for MediaLibrary;
}

unint64_t sub_236CEC544()
{
  unint64_t result = qword_2688CE8A8;
  if (!qword_2688CE8A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE8B0);
    sub_236CEC184();
    sub_236CEC1D8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE8A8);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void sub_236CEC604()
{
  qword_2688CE8C0 = 0x636973756DLL;
  *(void *)algn_2688CE8C8 = 0xE500000000000000;
}

uint64_t LocationView.init(viewModel:strokeColor:)@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  type metadata accessor for LocationViewModel();
  uint64_t result = sub_236CFC1B0();
  *a2 = v5;
  a2[1] = v6;
  a2[2] = a1;
  return result;
}

uint64_t LocationView.body.getter@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  *((void *)v6 + 2) = v3;
  *((void *)v6 + 3) = v4;
  *((void *)v6 + 4) = v5;
  *a1 = sub_236CEC9E4;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_236CEC6FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v30 = a5;
  uint64_t v31 = sub_236CFC420();
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_236CFBBF0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE8E0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (uint64_t *)((char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v16 = sub_236CFC250();
  v16[1] = v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE8E8);
  sub_236CECA0C(a2, a3, a4, (uint64_t)v16 + *(int *)(v18 + 44));
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v28, v10);
  unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = a2;
  *((void *)v20 + 3) = a3;
  *((void *)v20 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v20[v19], v13, v10);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_236CFC400();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE900);
  uint64_t v22 = v30;
  uint64_t v23 = (char *)(v30 + *(int *)(v21 + 36));
  uint64_t v24 = sub_236CFBC20();
  uint64_t v25 = v29;
  uint64_t v26 = v31;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(&v23[*(int *)(v24 + 20)], v9, v31);
  *(void *)uint64_t v23 = &unk_2688CE8F8;
  *((void *)v23 + 1) = v20;
  sub_236CE1DA8((uint64_t)v16, v22, &qword_2688CE8E0);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
  return sub_236CE17A0((uint64_t)v16, &qword_2688CE8E0);
}

uint64_t sub_236CEC9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_236CEC6FC(a1, v2[2], v2[3], v2[4], a2);
}

uint64_t sub_236CEC9F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CECA0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v110 = a4;
  uint64_t v111 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE918);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v109 = (uint64_t)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE920);
  MEMORY[0x270FA5388](v98);
  uint64_t v99 = (uint64_t)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_236CFBC80();
  MEMORY[0x270FA5388](v112);
  uint64_t v102 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE928);
  MEMORY[0x270FA5388](v96);
  uint64_t v103 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE930);
  MEMORY[0x270FA5388](v100);
  uint64_t v104 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE938);
  MEMORY[0x270FA5388](v106);
  uint64_t v105 = (uint64_t)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE940);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  v108 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v107 = (uint64_t)&v87 - v16;
  uint64_t v17 = sub_236CFC150();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE948);
  MEMORY[0x270FA5388](v95);
  uint64_t v22 = (char *)&v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE950);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v87 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE958);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v101 = (uint64_t)&v87 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v113 = (uint64_t)&v87 - v29;
  uint64_t v114 = a1;
  uint64_t v97 = a1;
  uint64_t v94 = a2;
  uint64_t v115 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE908);
  sub_236CFC1C0();
  uint64_t v30 = v120;
  swift_getKeyPath();
  uint64_t v114 = v30;
  sub_236CEE3F4(&qword_2688CE4E8, (void (*)(uint64_t))type metadata accessor for LocationViewModel);
  sub_236CFBA00();
  swift_release();
  uint64_t v31 = *(void **)(v30 + 40);
  id v32 = v31;
  swift_release();
  if (v31)
  {
    id v33 = v32;
    sub_236CFC140();
    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F1B4B8], v17);
    uint64_t v34 = sub_236CFC190();
    swift_release();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    uint64_t v114 = v34;
    sub_236CFC0C0();
    swift_release();
    sub_236CE1DA8((uint64_t)v22, (uint64_t)v25, &qword_2688CE948);
    swift_storeEnumTagMultiPayload();
    sub_236CEE348();
    sub_236CFBED0();

    sub_236CE17A0((uint64_t)v22, &qword_2688CE948);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_236CEE348();
    sub_236CFBED0();
  }
  sub_236CED5C4(v97, v94, (uint64_t)&v120);
  uint64_t v35 = *((void *)&v120 + 1);
  uint64_t v97 = v120;
  long long v36 = v121;
  char v37 = v122;
  sub_236CFC250();
  sub_236CFBBD0();
  uint64_t v92 = v114;
  int v91 = v115;
  uint64_t v90 = v116;
  int v89 = v117;
  uint64_t v88 = v118;
  uint64_t v87 = v119;
  uint64_t v38 = v102;
  uint64_t v39 = &v102[*(int *)(v112 + 20)];
  LODWORD(v94) = *MEMORY[0x263F19860];
  uint64_t v40 = v94;
  uint64_t v41 = sub_236CFBDC0();
  uint64_t v42 = *(void *)(v41 - 8);
  int v43 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 104);
  uint64_t v95 = v42 + 104;
  v43(v39, v40, v41);
  uint64_t v44 = v43;
  __asm { FMOV            V0.2D, #4.0 }
  long long v93 = _Q0;
  *(_OWORD *)uint64_t v38 = _Q0;
  uint64_t v50 = v99;
  sub_236CEE43C((uint64_t)v38, v99);
  *(_WORD *)(v50 + *(int *)(v98 + 36)) = 256;
  uint64_t v51 = (uint64_t)v103;
  sub_236CE1DA8(v50, (uint64_t)&v103[*(int *)(v96 + 36)], &qword_2688CE920);
  uint64_t v52 = v97;
  *(void *)uint64_t v51 = v97;
  *(void *)(v51 + 8) = v35;
  *(_OWORD *)(v51 + 16) = v36;
  *(unsigned char *)(v51 + 32) = v37;
  *(void *)(v51 + 40) = v92;
  *(unsigned char *)(v51 + 48) = v91;
  *(void *)(v51 + 56) = v90;
  *(unsigned char *)(v51 + 64) = v89;
  uint64_t v53 = v87;
  *(void *)(v51 + 72) = v88;
  *(void *)(v51 + 80) = v53;
  sub_236CEE4A0(v52, v35, v36, *((uint64_t *)&v36 + 1), v37);
  sub_236CE17A0(v50, &qword_2688CE920);
  long long v54 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_236CEE4B0((uint64_t)v38, MEMORY[0x263F19048]);
  sub_236CEE510(v52, v35, v36, *((uint64_t *)&v36 + 1), v37);
  v44(&v38[*(int *)(v112 + 20)], v94, v41);
  *(_OWORD *)uint64_t v38 = v93;
  uint64_t v55 = v111;
  swift_retain();
  sub_236CFBB70();
  uint64_t v56 = v109;
  sub_236CEE43C((uint64_t)v38, v109);
  uint64_t v57 = v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688CE970) + 36);
  long long v58 = v121;
  *(_OWORD *)uint64_t v57 = v120;
  *(_OWORD *)(v57 + 16) = v58;
  *(void *)(v57 + 32) = v122;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE978);
  *(void *)(v56 + *(int *)(v59 + 52)) = v55;
  *(_WORD *)(v56 + *(int *)(v59 + 56)) = 256;
  uint64_t v60 = sub_236CFC250();
  uint64_t v62 = v61;
  uint64_t v63 = (uint64_t *)(v56 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688CE980) + 36));
  uint64_t *v63 = v60;
  v63[1] = v62;
  sub_236CEE4B0((uint64_t)v38, v54);
  uint64_t v64 = sub_236CFC250();
  uint64_t v66 = v65;
  uint64_t v67 = (uint64_t)v104;
  uint64_t v68 = (uint64_t)&v104[*(int *)(v100 + 36)];
  sub_236CE1DA8(v56, v68, &qword_2688CE918);
  unint64_t v69 = (uint64_t *)(v68 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688CE988) + 36));
  *unint64_t v69 = v64;
  v69[1] = v66;
  sub_236CE1DA8(v51, v67, &qword_2688CE928);
  sub_236CE17A0(v56, &qword_2688CE918);
  sub_236CE17A0(v51, &qword_2688CE928);
  LOBYTE(v64) = sub_236CFBF20();
  sub_236CFBB20();
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v78 = v105;
  sub_236CE1DA8(v67, v105, &qword_2688CE930);
  uint64_t v79 = v78 + *(int *)(v106 + 36);
  *(unsigned char *)uint64_t v79 = v64;
  *(void *)(v79 + 8) = v71;
  *(void *)(v79 + 16) = v73;
  *(void *)(v79 + 24) = v75;
  *(void *)(v79 + 32) = v77;
  *(unsigned char *)(v79 + 40) = 0;
  sub_236CE17A0(v67, &qword_2688CE930);
  sub_236CEE68C(&qword_2688CE990, &qword_2688CE938, (void (*)(void))sub_236CEE520);
  uint64_t v80 = (uint64_t)v108;
  sub_236CFC0C0();
  sub_236CE17A0(v78, &qword_2688CE938);
  uint64_t v81 = v107;
  sub_236CEE8C0(v80, v107);
  uint64_t v82 = v113;
  uint64_t v83 = v101;
  sub_236CE1DA8(v113, v101, &qword_2688CE958);
  sub_236CE1DA8(v81, v80, &qword_2688CE940);
  uint64_t v84 = v110;
  sub_236CE1DA8(v83, v110, &qword_2688CE958);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA00);
  sub_236CE1DA8(v80, v84 + *(int *)(v85 + 48), &qword_2688CE940);
  sub_236CE17A0(v81, &qword_2688CE940);
  sub_236CE17A0(v82, &qword_2688CE958);
  sub_236CE17A0(v80, &qword_2688CE940);
  return sub_236CE17A0(v83, &qword_2688CE958);
}

void sub_236CED5C4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_236CFC150();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE908);
  sub_236CFC1C0();
  uint64_t v10 = *(void *)(v20 + 56);
  swift_retain();
  swift_release();
  if (v10)
  {
    uint64_t v20 = v10;
    LOBYTE(v21) = 0;
    swift_retain();
    sub_236CFBED0();
    uint64_t v20 = v24;
    uint64_t v21 = v25;
    int64x2_t v22 = 0uLL;
    char v23 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE9E0);
    sub_236CEE7F8();
    sub_236CEE86C();
    sub_236CFBED0();
    swift_release();
  }
  else
  {
    uint64_t v24 = a1;
    uint64_t v25 = a2;
    sub_236CFC1C0();
    uint64_t v11 = v20;
    swift_getKeyPath();
    uint64_t v24 = v11;
    sub_236CEE3F4(&qword_2688CE4E8, (void (*)(uint64_t))type metadata accessor for LocationViewModel);
    sub_236CFBA00();
    swift_release();
    uint64_t v12 = *(void **)(v11 + 48);
    id v13 = v12;
    swift_release();
    if (v12)
    {
      id v14 = v13;
      sub_236CFC140();
      (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B4B8], v6);
      uint64_t v15 = sub_236CFC190();
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      uint64_t v20 = v15;
      LOBYTE(v21) = 1;
      swift_retain();
      sub_236CFBED0();
      uint64_t v20 = v24;
      uint64_t v21 = v25;
      int64x2_t v22 = 0uLL;
      char v23 = 0;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE9E0);
      sub_236CEE7F8();
      sub_236CEE86C();
      sub_236CFBED0();
      swift_release();
      swift_release();
    }
    else
    {
      if (qword_2688CE200 != -1) {
        swift_once();
      }
      uint64_t v20 = qword_2688CE8C0;
      uint64_t v21 = *(void *)algn_2688CE8C8;
      int64x2_t v22 = vdupq_n_s64(0x3FE3333333333333uLL);
      char v23 = 1;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE9E0);
      sub_236CEE7F8();
      sub_236CEE86C();
      sub_236CFBED0();
    }
  }
  uint64_t v16 = v25;
  uint64_t v17 = v26;
  uint64_t v18 = v27;
  char v19 = v28;
  *(void *)a3 = v24;
  *(void *)(a3 + 8) = v16;
  *(void *)(a3 + 16) = v17;
  *(void *)(a3 + 24) = v18;
  *(unsigned char *)(a3 + 32) = v19;
}

uint64_t sub_236CED9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a2;
  v4[7] = a4;
  v4[5] = a1;
  type metadata accessor for LocationViewPopulator();
  v4[8] = swift_task_alloc();
  sub_236CFC3F0();
  v4[9] = sub_236CFC3E0();
  uint64_t v6 = sub_236CFC3C0();
  v4[10] = v6;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_236CEDA9C, v6, v5);
}

uint64_t sub_236CEDA9C()
{
  uint64_t v1 = v0[6];
  v0[2] = v0[5];
  v0[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE908);
  sub_236CFC1C0();
  type metadata accessor for LocationViewModel();
  sub_236CEE3F4(&qword_2688CE4E8, (void (*)(uint64_t))type metadata accessor for LocationViewModel);
  sub_236CFC230();
  sub_236CFBBE0();
  v0[12] = v2;
  v0[13] = v3;
  return MEMORY[0x270FA2498](sub_236CEDB94, 0, 0);
}

uint64_t sub_236CEDB94()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[8];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[14] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[15] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_236CEDC88;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_236CEDC88()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_236CEDDA0, 0, 0);
}

uint64_t sub_236CEDDA0()
{
  return MEMORY[0x270FA2498](sub_236CEDDB8, *(void *)(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_236CEDDB8()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  sub_236CEE4B0(v1, (uint64_t (*)(void))type metadata accessor for LocationViewPopulator);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_236CEDE3C@<X0>(uint64_t (**a1)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))swift_allocObject();
  *((void *)v6 + 2) = v3;
  *((void *)v6 + 3) = v4;
  *((void *)v6 + 4) = v5;
  *a1 = sub_236CEE930;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t destroy for LocationView()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s11ShazamKitUI12LocationViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LocationView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for LocationView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for LocationView()
{
  return &type metadata for LocationView;
}

uint64_t sub_236CEE030()
{
  return sub_236CE2868(&qword_2688CE8D0, &qword_2688CE8D8);
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_236CEE0B8()
{
  uint64_t v1 = sub_236CFBBF0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_236CEE194()
{
  uint64_t v2 = *(void *)(sub_236CFBBF0() - 8);
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_236CDDC5C;
  return sub_236CED9D4(v3, v4, v5, v6);
}

uint64_t sub_236CEE27C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *((void *)v2 + 2);
  double v7 = v2[3];
  double v8 = v2[4];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *uint64_t v9 = v3;
  v9[1] = sub_236CE23FC;
  return sub_236CDE96C(v7, v8, a1, a2, v6);
}

unint64_t sub_236CEE348()
{
  unint64_t result = qword_2688CE960;
  if (!qword_2688CE960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE948);
    sub_236CEE3F4(&qword_2688CE968, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE960);
  }
  return result;
}

uint64_t sub_236CEE3F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_236CEE43C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_236CFBC80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CEE4A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return swift_bridgeObjectRetain();
  }
  else {
    return swift_retain();
  }
}

uint64_t sub_236CEE4B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_236CEE510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_release();
  }
}

unint64_t sub_236CEE520()
{
  unint64_t result = qword_2688CE998;
  if (!qword_2688CE998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE930);
    sub_236CEE5C0();
    sub_236CE2868(&qword_2688CE9F8, &qword_2688CE988);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE998);
  }
  return result;
}

unint64_t sub_236CEE5C0()
{
  unint64_t result = qword_2688CE9A0;
  if (!qword_2688CE9A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE928);
    sub_236CEE68C(&qword_2688CE9A8, &qword_2688CE9B0, (void (*)(void))sub_236CEE708);
    sub_236CE2868(&qword_2688CE9F0, &qword_2688CE920);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE9A0);
  }
  return result;
}

uint64_t sub_236CEE68C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236CEE708()
{
  unint64_t result = qword_2688CE9B8;
  if (!qword_2688CE9B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE9C0);
    sub_236CEE77C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE9B8);
  }
  return result;
}

unint64_t sub_236CEE77C()
{
  unint64_t result = qword_2688CE9C8;
  if (!qword_2688CE9C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE9D0);
    sub_236CEE7F8();
    sub_236CEE86C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE9C8);
  }
  return result;
}

unint64_t sub_236CEE7F8()
{
  unint64_t result = qword_2688CE9D8;
  if (!qword_2688CE9D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE9E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE9D8);
  }
  return result;
}

unint64_t sub_236CEE86C()
{
  unint64_t result = qword_2688CE9E8;
  if (!qword_2688CE9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CE9E8);
  }
  return result;
}

uint64_t sub_236CEE8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CEE934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFC420();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_236CFC410();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_236CE17A0(a1, &qword_2688CE498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236CFC3C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA58);
  return swift_task_create();
}

uint64_t sub_236CEEAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFC420();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_236CFC410();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_236CE17A0(a1, &qword_2688CE498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236CFC3C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_236CEEC94(void *a1)
{
  uint64_t v52 = sub_236CFB9E0();
  uint64_t v50 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA08);
  uint64_t v51 = *(void *)(v53 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v53);
  uint64_t v48 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v49 = (char *)&v43 - v7;
  uint64_t v46 = (void *)sub_236CFB990();
  uint64_t v8 = *(v46 - 1);
  MEMORY[0x270FA5388](v46);
  uint64_t v44 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE498);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v16 = *v1;
  uint64_t v18 = (void *)*((void *)v1 + 1);
  uint64_t v17 = *((void *)v1 + 2);
  id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v17, sel_displayMatchedMediaItemAction);
  objc_msgSend(a1, sel_addGestureRecognizer_, v19);

  uint64_t v20 = sub_236CFC420();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v15, 1, 1, v20);
  sub_236CFC3F0();
  uint64_t v21 = a1;
  id v22 = v18;
  swift_retain();
  uint64_t v23 = sub_236CFC3E0();
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8F500];
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = v25;
  *(unsigned char *)(v24 + 32) = v16;
  *(void *)(v24 + 40) = v22;
  *(void *)(v24 + 48) = v17;
  *(void *)(v24 + 56) = v21;
  sub_236CEEAE8((uint64_t)v15, (uint64_t)&unk_2688CEA18, v24);
  swift_release();
  uint64_t v26 = *(void **)&v21[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel];
  id v27 = objc_msgSend(v22, sel_title);
  id v47 = v26;
  objc_msgSend(v26, sel_setText_, v27);

  char v28 = *(void **)&v21[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel];
  id v29 = objc_msgSend(v22, sel_artist);
  id v45 = v28;
  objc_msgSend(v28, sel_setText_, v29);

  uint64_t v30 = *(void **)&v21[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton];
  id v31 = objc_msgSend(v22, sel_appleMusicURL);
  if (v31)
  {
    id v32 = v31;
    id v33 = v44;
    sub_236CFB980();

    uint64_t v34 = v46;
    (*(void (**)(char *, char *, void *))(v8 + 32))(v12, v33, v46);
    (*(void (**)(char *, void, uint64_t, void *))(v8 + 56))(v12, 0, 1, v34);
    BOOL v35 = (*(unsigned int (**)(char *, uint64_t, void *))(v8 + 48))(v12, 1, v34) == 1;
  }
  else
  {
    BOOL v35 = 1;
    (*(void (**)(char *, uint64_t, uint64_t, void *))(v8 + 56))(v12, 1, 1, v46);
  }
  sub_236CE17A0((uint64_t)v12, &qword_2688CE4A0);
  objc_msgSend(v30, sel_setHidden_, v35);
  objc_msgSend(v30, sel_addTarget_action_forControlEvents_, v17, sel_appleMusicButtonAction, 64);
  long long v36 = *(void **)&v21[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel];
  id v54 = objc_msgSend(v22, sel_shazamCount);
  sub_236CFB9C0();
  sub_236CEFFBC();
  char v37 = v48;
  sub_236CFB8E0();
  sub_236CFB9D0();
  uint64_t v46 = v30;
  uint64_t v38 = v49;
  uint64_t v39 = v53;
  MEMORY[0x237E0CC30](v4, v53);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v4, v52);
  uint64_t v40 = *(void (**)(char *, uint64_t))(v51 + 8);
  v40(v37, v39);
  sub_236CF0010();
  sub_236CFC530();
  v40(v38, v39);
  uint64_t v41 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v36, sel_setText_, v41);

  objc_msgSend(v36, sel_setHidden_, objc_msgSend(v22, sel_shazamCount) == 0);
  objc_msgSend(v46, sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)&v21[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView], sel_setAlpha_, 0.0);
  objc_msgSend(v47, sel_setAlpha_, 0.0);
  return objc_msgSend(v45, sel_setAlpha_, 0.0);
}

uint64_t sub_236CEF340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[2] = a5;
  v7[3] = a7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  v7[4] = swift_task_alloc();
  uint64_t v8 = sub_236CFB990();
  v7[5] = v8;
  v7[6] = *(void *)(v8 - 8);
  v7[7] = swift_task_alloc();
  v7[8] = swift_task_alloc();
  sub_236CFC3F0();
  v7[9] = sub_236CFC3E0();
  uint64_t v10 = sub_236CFC3C0();
  v7[10] = v10;
  v7[11] = v9;
  return MEMORY[0x270FA2498](sub_236CEF474, v10, v9);
}

uint64_t sub_236CEF474()
{
  id v1 = objc_msgSend(*(id *)(v0 + 16), sel_artworkURL);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v4 = *(void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v6 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    sub_236CFB980();

    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v7(v6, v3, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) != 1)
    {
      uint64_t v8 = *(void *)(v0 + 24);
      v7(*(void *)(v0 + 64), *(void *)(v0 + 32), *(void *)(v0 + 40));
      *(void *)(v0 + 96) = *(void *)(v8 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
      uint64_t v14 = (uint64_t (*)(uint64_t))((char *)&dword_2688CE488 + dword_2688CE488);
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_236CEF68C;
      uint64_t v10 = *(void *)(v0 + 64);
      return v14(v10);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 48) + 56))(*(void *)(v0 + 32), 1, 1, *(void *)(v0 + 40));
  }
  uint64_t v12 = *(void *)(v0 + 32);
  swift_release();
  sub_236CE17A0(v12, &qword_2688CE4A0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_236CEF68C(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    uint64_t v7 = sub_236CEF88C;
  }
  else
  {
    v4[14] = a1;
    uint64_t v5 = v4[10];
    uint64_t v6 = v4[11];
    uint64_t v7 = sub_236CEF7B8;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_236CEF7B8()
{
  id v1 = *(void **)(v0 + 112);
  swift_release();
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 96), sel_setImage_, v1);

  sub_236CF72F0();
  sub_236CF7778();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_236CEF88C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  objc_msgSend(*(id *)(v0 + 96), sel_setImage_, 0);
  sub_236CF72F0();
  sub_236CF7778();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

id sub_236CEF950()
{
  type metadata accessor for AmbientMatchUIView();
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_236CEF990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CF0200();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_236CEF9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CF0200();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_236CEFA58()
{
}

uint64_t sub_236CEFA8C(SEL *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_236CFB990();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v17 - v11;
  id v13 = [*(id *)(v1 + 24) *a1];
  if (v13)
  {
    uint64_t v14 = v13;
    sub_236CFB980();

    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v15(v5, v10, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v15(v12, v5, v6);
      sub_236CDA794((uint64_t)v12);
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  return sub_236CE17A0((uint64_t)v5, &qword_2688CE4A0);
}

uint64_t sub_236CEFCB4(uint64_t a1, uint64_t a2, SEL *a3)
{
  swift_retain();
  sub_236CEFA8C(a3);
  return swift_release();
}

uint64_t sub_236CEFCF8()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AmbientMatchActionHandler()
{
  return self;
}

uint64_t destroy for AmbientMatch(uint64_t a1)
{
  return swift_release();
}

uint64_t _s11ShazamKitUI12AmbientMatchVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  id v5 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AmbientMatch(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AmbientMatch(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AmbientMatch()
{
  return &type metadata for AmbientMatch;
}

uint64_t sub_236CEFE94()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_236CEFEE4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_236CDDC5C;
  return sub_236CEF340(a1, v4, v5, v6, v7, v8, v9);
}

unint64_t sub_236CEFFBC()
{
  unint64_t result = qword_2688CEA20;
  if (!qword_2688CEA20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEA20);
  }
  return result;
}

unint64_t sub_236CF0010()
{
  unint64_t result = qword_2688CEA28;
  if (!qword_2688CEA28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEA08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEA28);
  }
  return result;
}

uint64_t sub_236CF006C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_236CF0348;
  return v6(a1);
}

uint64_t sub_236CF0148(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_236CE23FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2688CEA30 + dword_2688CEA30);
  return v6(a1, v4);
}

unint64_t sub_236CF0200()
{
  unint64_t result = qword_2688CEA40;
  if (!qword_2688CEA40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEA40);
  }
  return result;
}

uint64_t sub_236CF0254()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CF028C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_236CDDC5C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2688CEA48 + dword_2688CEA48);
  return v6(a1, v4);
}

ValueMetadata *type metadata accessor for MediaLibraryHeaderRow()
{
  return &type metadata for MediaLibraryHeaderRow;
}

uint64_t sub_236CF035C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CF0378@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_236CFBD80();
  MEMORY[0x270FA5388](v1 - 8);
  sub_236CFBD90();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v39 = self;
  id v3 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = sub_236CFC020();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_236CFBF80();
  uint64_t v9 = sub_236CFBFF0();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_236CDDA20(v4, v6, v8);
  swift_bridgeObjectRelease();
  if (qword_2688CE1D8 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_236CFBFD0();
  uint64_t v41 = v14;
  uint64_t v16 = v15;
  char v38 = v17;
  sub_236CDDA20(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  sub_236CFBD70();
  sub_236CFBD60();
  sub_236CFBD50();
  sub_236CFBD60();
  sub_236CFBDA0();
  id v18 = objc_msgSend(v39, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v19 = sub_236CFC020();
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_236CFBF80();
  uint64_t v24 = sub_236CFBFF0();
  uint64_t v26 = v25;
  char v28 = v27;
  swift_release();
  sub_236CDDA20(v19, v21, v23);
  swift_bridgeObjectRelease();
  if (qword_2688CE1E0 != -1) {
    swift_once();
  }
  char v29 = v28 & 1;
  uint64_t v30 = sub_236CFBFD0();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  char v36 = v35 & 1;
  sub_236CDDA20(v24, v26, v29);
  swift_bridgeObjectRelease();
  *(void *)a1 = v40;
  *(void *)(a1 + 8) = v16;
  *(unsigned char *)(a1 + 16) = v38 & 1;
  *(void *)(a1 + 24) = v41;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v30;
  *(void *)(a1 + 56) = v32;
  *(unsigned char *)(a1 + 64) = v36;
  *(void *)(a1 + 72) = v34;
  sub_236CE43B4(v40, v16, v38 & 1);
  swift_bridgeObjectRetain();
  sub_236CE43B4(v30, v32, v36);
  swift_bridgeObjectRetain();
  sub_236CDDA20(v30, v32, v36);
  swift_bridgeObjectRelease();
  sub_236CDDA20(v40, v16, v38 & 1);
  return swift_bridgeObjectRelease();
}

__n128 sub_236CF07AC@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFBD40();
  sub_236CF0378((uint64_t)&v11);
  char v3 = v12;
  uint64_t v4 = v13;
  uint64_t v5 = v14;
  char v6 = v15;
  char v7 = v17;
  uint64_t v8 = v18;
  __n128 result = v11;
  long long v10 = v16;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 72) = v10;
  *(unsigned char *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  return result;
}

unint64_t sub_236CF083C()
{
  unint64_t result = qword_2688CEA60;
  if (!qword_2688CEA60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEA68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEA60);
  }
  return result;
}

uint64_t sub_236CF0898()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236CFBAE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_236CF090C()
{
  return MEMORY[0x270FA2498](sub_236CF0928, 0, 0);
}

uint64_t sub_236CF0928()
{
  sub_236CFC2C0();
  *(void *)(v0 + 16) = sub_236CFC2B0();
  sub_236CFC3F0();
  *(void *)(v0 + 24) = sub_236CFC3E0();
  uint64_t v2 = sub_236CFC3C0();
  return MEMORY[0x270FA2498](sub_236CF09D0, v2, v1);
}

uint64_t sub_236CF09D0()
{
  swift_release();
  uint64_t v1 = sub_236CFC2A0();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_236CF0A44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  sub_236CF0DA8(v3, (uint64_t)&v6);
  if (!v7)
  {
    sub_236CF0D48((uint64_t)&v6);
    char v7 = &type metadata for MediaLibraryLoader;
    uint64_t v8 = &off_26E9F6E38;
    sub_236CF0E10((uint64_t)&v6, (uint64_t)v5);
    swift_beginAccess();
    sub_236CF0E74((uint64_t)v5, v3);
    swift_endAccess();
  }
  return sub_236CF0EDC(&v6, a1);
}

uint64_t sub_236CF0AF4()
{
  sub_236CF0D48(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC11ShazamKitUI22MediaLibraryController__items;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_236CF0BA0()
{
  return type metadata accessor for MediaLibraryController();
}

uint64_t type metadata accessor for MediaLibraryController()
{
  uint64_t result = qword_2688CEA78;
  if (!qword_2688CEA78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_236CF0BF4()
{
  sub_236CF0C90();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_236CF0C90()
{
  if (!qword_2688CEA88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE8B8);
    unint64_t v0 = sub_236CFBB00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2688CEA88);
    }
  }
}

uint64_t sub_236CF0CEC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_236CF0CF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_236CFBA90();
  *a1 = result;
  return result;
}

uint64_t sub_236CF0D48(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236CF0DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CF0E10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_236CF0E74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CF0EDC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

ValueMetadata *type metadata accessor for MediaLibraryLoader()
{
  return &type metadata for MediaLibraryLoader;
}

uint64_t sub_236CF0F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_236CFC420();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_236CFC410();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_236CE17A0(a1, &qword_2688CE498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236CFC3C0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t MatchingFlowViewModel.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  sub_236CFBAA0();
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  *uint64_t v1 = 0;
  v1[1] = 0;
  long long v2 = (void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  *long long v2 = 0;
  v2[1] = 0;
  return v0;
}

uint64_t MatchingFlowView.viewModel.getter()
{
  return swift_retain();
}

uint64_t MatchingFlowView.viewModel.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*MatchingFlowView.viewModel.modify())()
{
  return nullsub_1;
}

uint64_t MatchingFlowView.$viewModel.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = type metadata accessor for MatchingFlowViewModel();
  unint64_t v4 = sub_236CEA590();
  return MEMORY[0x270EFFB88](v1, v2, v3, v4);
}

uint64_t MatchingFlowView.init(viewModel:)@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MatchingFlowViewModel();
  sub_236CEA590();
  uint64_t result = sub_236CFBC30();
  *a1 = result;
  a1[1] = v3;
  a1[2] = 0;
  return result;
}

uint64_t MatchingFlowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAB0);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAB8);
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAC0);
  MEMORY[0x270FA5388](v36);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAC8);
  MEMORY[0x270FA5388](v37);
  __n128 v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v14 = (void *)v1[2];
  *(void *)unint64_t v4 = sub_236CFBDD0();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v15 = (uint64_t)&v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD0) + 44)];
  uint64_t v35 = v13;
  sub_236CF1594(v14, v15);
  LOBYTE(v13) = sub_236CFBF20();
  char v16 = sub_236CFBF40();
  sub_236CFBF40();
  if (sub_236CFBF40() != v13) {
    char v16 = sub_236CFBF40();
  }
  sub_236CFBB20();
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_236CE1DA8((uint64_t)v4, (uint64_t)v7, &qword_2688CEAB0);
  uint64_t v25 = &v7[*(int *)(v5 + 36)];
  *uint64_t v25 = v16;
  *((void *)v25 + 1) = v18;
  *((void *)v25 + 2) = v20;
  *((void *)v25 + 3) = v22;
  *((void *)v25 + 4) = v24;
  v25[40] = 0;
  sub_236CE17A0((uint64_t)v4, &qword_2688CEAB0);
  uint64_t v26 = sub_236CFC270();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236CFBAE0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v27 = v39;
  uint64_t v28 = v40;
  char v29 = v41;
  sub_236CE1DA8((uint64_t)v7, (uint64_t)v9, &qword_2688CEAB8);
  uint64_t v30 = &v9[*(int *)(v36 + 36)];
  *(void *)uint64_t v30 = v26;
  *((void *)v30 + 1) = v27;
  *((void *)v30 + 2) = v28;
  v30[24] = v29;
  sub_236CE17A0((uint64_t)v7, &qword_2688CEAB8);
  uint64_t v31 = (uint64_t (*)(double, double))swift_allocObject();
  *((void *)v31 + 2) = v35;
  *((void *)v31 + 3) = v12;
  *((void *)v31 + 4) = v14;
  sub_236CE1DA8((uint64_t)v9, (uint64_t)v11, &qword_2688CEAC0);
  uint64_t v32 = (uint64_t (**)(double, double))&v11[*(int *)(v37 + 36)];
  *uint64_t v32 = sub_236CF3308;
  v32[1] = v31;
  swift_retain();
  sub_236CE17A0((uint64_t)v9, &qword_2688CEAC0);
  return sub_236CE6650((uint64_t)v11, v38, &qword_2688CEAC8);
}

uint64_t sub_236CF1594@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  id v47 = a1;
  uint64_t v53 = a2;
  uint64_t v2 = sub_236CFBB40();
  uint64_t v41 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE708);
  uint64_t v42 = *(void *)(v5 - 8);
  uint64_t v43 = v5;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB30);
  uint64_t v44 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB38);
  uint64_t v11 = MEMORY[0x270FA5388](v49);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v46 = (uint64_t)&v40 - v14;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB40);
  MEMORY[0x270FA5388](v51);
  char v16 = (uint64_t *)((char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB48);
  MEMORY[0x270FA5388](v48);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB50);
  MEMORY[0x270FA5388](v52);
  uint64_t v50 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_236CFBAE0();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v20 = v54;
  uint64_t v21 = v55;
  if (v56)
  {
    if (v56 == 1)
    {
      sub_236CE3948(v54, v55, 1);
      *char v16 = sub_236CFC280();
      v16[1] = (uint64_t)sub_236CEAC10;
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = 0;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB58);
      sub_236CF3A9C();
      sub_236CF3B44(&qword_2688CEBA0, &qword_2688CEB58, (void (*)(void))sub_236CF3E08);
      return sub_236CFBED0();
    }
    sub_236CFC250();
    sub_236CFBBD0();
    char v36 = v58;
    id v37 = v59;
    char v38 = v60;
    *(void *)uint64_t v18 = v57;
    v18[8] = v36;
    *((void *)v18 + 2) = v37;
    v18[24] = v38;
    *((_OWORD *)v18 + 2) = v61;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB70);
    sub_236CF3B44(&qword_2688CEB68, &qword_2688CEB70, (void (*)(void))sub_236CF3BC0);
    sub_236CF3C14();
    uint64_t v39 = (uint64_t)v50;
    sub_236CFBED0();
    uint64_t v32 = &qword_2688CEB50;
    sub_236CE1DA8(v39, (uint64_t)v16, &qword_2688CEB50);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB58);
    sub_236CF3A9C();
    sub_236CF3B44(&qword_2688CEBA0, &qword_2688CEB58, (void (*)(void))sub_236CF3E08);
    sub_236CFBED0();
    uint64_t v35 = v39;
  }
  else
  {
    uint64_t v57 = sub_236CFC280();
    char v23 = v20 & 1;
    char v58 = v20 & 1;
    id v59 = v21;
    char v60 = 0;
    id v24 = v21;
    id v47 = v20;
    id v25 = v24;
    sub_236CFBB30();
    uint64_t v26 = swift_allocObject();
    uint64_t v40 = v21;
    *(unsigned char *)(v26 + 16) = v23;
    *(void *)(v26 + 24) = v25;
    id v27 = v25;
    sub_236CFC210();
    swift_release();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v4, v2);
    sub_236CFBB50();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB88);
    sub_236CF3D14();
    sub_236CE2868(&qword_2688CE7C0, &qword_2688CE708);
    uint64_t v28 = v43;
    sub_236CFC0D0();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v28);

    uint64_t v30 = v44;
    uint64_t v29 = v45;
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v13, v10, v45);
    uint64_t v31 = (uint64_t (**)())&v13[*(int *)(v49 + 36)];
    *uint64_t v31 = sub_236CEAB68;
    v31[1] = 0;
    v31[2] = 0;
    v31[3] = 0;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v29);
    uint64_t v32 = &qword_2688CEB38;
    uint64_t v33 = v46;
    sub_236CE6650((uint64_t)v13, v46, &qword_2688CEB38);
    sub_236CE1DA8(v33, (uint64_t)v18, &qword_2688CEB38);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB70);
    sub_236CF3B44(&qword_2688CEB68, &qword_2688CEB70, (void (*)(void))sub_236CF3BC0);
    sub_236CF3C14();
    uint64_t v34 = (uint64_t)v50;
    sub_236CFBED0();
    sub_236CE1DA8(v34, (uint64_t)v16, &qword_2688CEB50);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEB58);
    sub_236CF3A9C();
    sub_236CF3B44(&qword_2688CEBA0, &qword_2688CEB58, (void (*)(void))sub_236CF3E08);
    sub_236CFBED0();
    sub_236CE3948(v47, v40, 0);
    sub_236CE17A0(v34, &qword_2688CEB50);
    uint64_t v35 = v33;
  }
  return sub_236CE17A0(v35, v32);
}

uint64_t sub_236CF1E18(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE498);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_236CFC420();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_236CFC3F0();
  id v9 = a3;
  uint64_t v10 = sub_236CFC3E0();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v12;
  *(unsigned char *)(v11 + 32) = a2;
  *(void *)(v11 + 40) = v9;
  sub_236CF0F0C((uint64_t)v7, (uint64_t)&unk_2688CEBB8, v11);
  return swift_release();
}

uint64_t sub_236CF1F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[15] = a5;
  sub_236CFC3F0();
  v5[16] = sub_236CFC3E0();
  uint64_t v7 = sub_236CFC3C0();
  v5[17] = v7;
  v5[18] = v6;
  return MEMORY[0x270FA2498](sub_236CF1FDC, v7, v6);
}

uint64_t sub_236CF1FDC()
{
  uint64_t v1 = v0[15];
  sub_236CE7D58(*MEMORY[0x263F6C4E0], *MEMORY[0x263F6C4F8]);
  uint64_t v2 = self;
  v0[2] = v0;
  v0[3] = sub_236CF2104;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_236CFA96C;
  v0[13] = &block_descriptor_2;
  v0[14] = v3;
  objc_msgSend(v2, sel_presentMediaItem_completionHandler_, v1, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_236CF2104()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 152) = v2;
  uint64_t v3 = *(void *)(v1 + 144);
  uint64_t v4 = *(void *)(v1 + 136);
  if (v2) {
    uint64_t v5 = sub_236CF2298;
  }
  else {
    uint64_t v5 = sub_236CF2234;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_236CF2234()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_236CF2298()
{
  swift_release();
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_236CF230C(double a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void (**)(uint64_t, double, double))(a4
                                                     + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *v6;
  if (*v6)
  {
    uint64_t v9 = swift_retain();
    v8(v9, a1, a2);
    return sub_236CDDA08((uint64_t)v8);
  }
  return result;
}

double sub_236CF2394@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236CFBAE0();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(unsigned char *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_236CF241C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(a1 + 8);
  char v3 = *(unsigned char *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236CE391C(v1, v2, v3);
  swift_retain();
  return sub_236CFBAF0();
}

uint64_t sub_236CF24B0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_236CFBAE0();
  swift_release();
  return swift_release();
}

uint64_t sub_236CF2528()
{
  return sub_236CFBAF0();
}

void (*sub_236CF25A8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_236CFBAD0();
  return sub_236CF2634;
}

void sub_236CF2634(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_236CF269C()
{
  return swift_endAccess();
}

uint64_t sub_236CF2704(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAE0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v11 - v7;
  uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v9((char *)&v11 - v7, a1, v2);
  v9(v6, (uint64_t)v8, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD8);
  sub_236CFBAC0();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_236CF2878()
{
  return swift_endAccess();
}

uint64_t sub_236CF28DC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAE0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD8);
  sub_236CFBAC0();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_236CF2A08(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAE0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD8);
  sub_236CFBAB0();
  swift_endAccess();
  return sub_236CF2B18;
}

void sub_236CF2B18(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_236CFBAC0();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_236CFBAC0();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);
  free(v3);
}

uint64_t sub_236CF2C88@<X0>(void *a1@<X0>, uint64_t (**a2)(double *a1)@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_236CE2764;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(double *))v6;
  return sub_236CDE40C(v4);
}

uint64_t sub_236CF2D28(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_236CF3A64;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_236CDE40C(v3);
  return sub_236CDDA08(v8);
}

uint64_t sub_236CF2DF0()
{
  return sub_236CF3018(&OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler, (void (*)(void, void))sub_236CF3FA4);
}

uint64_t sub_236CF2E10(uint64_t a1, uint64_t a2)
{
  return sub_236CF30A0(a1, a2, &OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler, (uint64_t (*)(uint64_t, uint64_t))sub_236CF3FA8);
}

uint64_t (*sub_236CF2E30())()
{
  return j__swift_endAccess;
}

uint64_t sub_236CF2E90@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  if (v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v4;
    *(void *)(v6 + 24) = v5;
    uint64_t v7 = sub_236CF3A3C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_236CDE40C(v4);
}

uint64_t sub_236CF2F30(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = sub_236CF3A14;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_236CDE40C(v3);
  return sub_236CDDA08(v8);
}

uint64_t sub_236CF2FF8()
{
  return sub_236CF3018(&OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler, (void (*)(void, void))sub_236CDE40C);
}

uint64_t sub_236CF3018(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_236CF3080(uint64_t a1, uint64_t a2)
{
  return sub_236CF30A0(a1, a2, &OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_236CDDA08);
}

uint64_t sub_236CF30A0(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*sub_236CF3104())()
{
  return j_j__swift_endAccess;
}

uint64_t MatchingFlowViewModel.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD8);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  v9[1] = 0;
  v9[2] = 0;
  char v10 = 2;
  sub_236CFBAA0();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  uint64_t v6 = (void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler);
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler);
  *uint64_t v7 = 0;
  v7[1] = 0;
  return v0;
}

uint64_t type metadata accessor for MatchingFlowViewModel()
{
  uint64_t result = qword_2688CEAE8;
  if (!qword_2688CEAE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_236CF32D0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_236CF3308(double a1, double a2)
{
  return sub_236CF230C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t MatchingFlowViewModel.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_236CDDA08(*(void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler));
  sub_236CDDA08(*(void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler));
  return v0;
}

uint64_t MatchingFlowViewModel.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel__state;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEAD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_236CDDA08(*(void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_sizeUpdatedHandler));
  sub_236CDDA08(*(void *)(v0 + OBJC_IVAR____TtC11ShazamKitUI21MatchingFlowViewModel_cancellationHandler));
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_236CF3470()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CF348C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MatchingFlowViewModel();
  uint64_t result = sub_236CFBA90();
  *a1 = result;
  return result;
}

uint64_t sub_236CF34CC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_retain();
}

uint64_t sub_236CF34D8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MatchingFlowView()
{
  return &type metadata for MatchingFlowView;
}

uint64_t sub_236CF3544()
{
  return type metadata accessor for MatchingFlowViewModel();
}

void sub_236CF354C()
{
  sub_236CF37C4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for MatchingFlowViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MatchingFlowViewModel);
}

uint64_t dispatch thunk of MatchingFlowViewModel.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.$state.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.$state.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.sizeUpdatedHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.sizeUpdatedHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.sizeUpdatedHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.cancellationHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.cancellationHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.cancellationHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of MatchingFlowViewModel.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

void sub_236CF37C4()
{
  if (!qword_2688CEAF8)
  {
    unint64_t v0 = sub_236CFBB00();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2688CEAF8);
    }
  }
}

unint64_t sub_236CF3820()
{
  unint64_t result = qword_2688CEB00;
  if (!qword_2688CEB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEAC8);
    sub_236CF389C();
    sub_236CEB130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB00);
  }
  return result;
}

unint64_t sub_236CF389C()
{
  unint64_t result = qword_2688CEB08;
  if (!qword_2688CEB08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEAC0);
    sub_236CF393C();
    sub_236CE2868(&qword_2688CEB20, &qword_2688CEB28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB08);
  }
  return result;
}

unint64_t sub_236CF393C()
{
  unint64_t result = qword_2688CEB10;
  if (!qword_2688CEB10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEAB8);
    sub_236CE2868(&qword_2688CEB18, &qword_2688CEAB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB10);
  }
  return result;
}

uint64_t sub_236CF39DC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CF3A14()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_236CF3A3C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_236CF3A64(double a1, double a2)
{
  uint64_t v3 = *(uint64_t (**)(void *))(v2 + 16);
  *(double *)uint64_t v5 = a1;
  *(double *)&v5[1] = a2;
  return v3(v5);
}

unint64_t sub_236CF3A9C()
{
  unint64_t result = qword_2688CEB60;
  if (!qword_2688CEB60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEB50);
    sub_236CF3B44(&qword_2688CEB68, &qword_2688CEB70, (void (*)(void))sub_236CF3BC0);
    sub_236CF3C14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB60);
  }
  return result;
}

uint64_t sub_236CF3B44(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_236CF3BC0()
{
  unint64_t result = qword_2688CEB78;
  if (!qword_2688CEB78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB78);
  }
  return result;
}

unint64_t sub_236CF3C14()
{
  unint64_t result = qword_2688CEB80;
  if (!qword_2688CEB80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEB38);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEB88);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CE708);
    sub_236CF3D14();
    sub_236CE2868(&qword_2688CE7C0, &qword_2688CE708);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB80);
  }
  return result;
}

unint64_t sub_236CF3D14()
{
  unint64_t result = qword_2688CEB90;
  if (!qword_2688CEB90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEB88);
    sub_236CF3DB4();
    sub_236CE2868(&qword_2688CE5F8, &qword_2688CE600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB90);
  }
  return result;
}

unint64_t sub_236CF3DB4()
{
  unint64_t result = qword_2688CEB98;
  if (!qword_2688CEB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEB98);
  }
  return result;
}

unint64_t sub_236CF3E08()
{
  unint64_t result = qword_2688CEBA8;
  if (!qword_2688CEBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2688CEBA8);
  }
  return result;
}

uint64_t sub_236CF3E5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_236CF3E94(uint64_t a1)
{
  return sub_236CF1E18(a1, *(unsigned char *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_236CF3EA0()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_236CF3EE0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_236CDDC5C;
  return sub_236CF1F44(a1, v4, v5, v6, v7);
}

uint64_t ArtworkUnavailableView.init(placeholderImage:widthRatio:heightRatio:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  double v8 = 0.6;
  if (a4) {
    a3 = 0.6;
  }
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  if ((a6 & 1) == 0) {
    double v8 = a5;
  }
  *(double *)(a7 + 16) = a3;
  *(double *)(a7 + 24) = v8;
  return result;
}

uint64_t ArtworkUnavailableView.body.getter@<X0>(double (**a1)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (double (*)@<D0>(uint64_t@<X8>))swift_allocObject();
  *((void *)v7 + 2) = v4;
  *((void *)v7 + 3) = v3;
  *((void *)v7 + 4) = v5;
  *((void *)v7 + 5) = v6;
  *a1 = sub_236CF4170;
  a1[1] = v7;
  return swift_bridgeObjectRetain();
}

__n128 sub_236CF4068@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFC250();
  uint64_t v4 = v3;
  sub_236CF4198((uint64_t)&v16);
  uint64_t v5 = v17;
  char v6 = v18;
  char v7 = v19;
  uint64_t v8 = v20;
  char v9 = v21;
  uint64_t v10 = v22;
  char v11 = v23;
  uint64_t v12 = v25;
  uint64_t v13 = v26;
  __n128 result = v24;
  long long v15 = v16;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = v15;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 41) = v7;
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(unsigned char *)(a1 + 72) = v11;
  *(__n128 *)(a1 + 80) = result;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  return result;
}

uint64_t sub_236CF4138()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

double sub_236CF4170@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_236CF4068(a1).n128_u64[0];
  return result;
}

uint64_t sub_236CF417C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CF4198@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFC150();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = self;
  uint64_t v15 = MEMORY[0x237E0D430](objc_msgSend(v6, sel_systemGray5Color));
  swift_bridgeObjectRetain();
  sub_236CFC170();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v7 = sub_236CFC190();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_236CFBBE0();
  sub_236CFBBE0();
  sub_236CFC250();
  sub_236CFBBD0();
  uint64_t v8 = v16;
  LOBYTE(v5) = v17;
  uint64_t v9 = v18;
  LOBYTE(v3) = v19;
  uint64_t v11 = v20;
  uint64_t v10 = v21;
  uint64_t v12 = MEMORY[0x237E0D430](objc_msgSend(v6, sel_systemFillColor));
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 1;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = (_BYTE)v5;
  *(void *)(a1 + 48) = v9;
  *(unsigned char *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v10;
  *(void *)(a1 + 80) = result;
  *(void *)(a1 + 88) = v12;
  return result;
}

uint64_t sub_236CF43C8@<X0>(double (**a1)@<D0>(uint64_t@<X8>)@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = (double (*)@<D0>(uint64_t@<X8>))swift_allocObject();
  *((void *)v7 + 2) = v4;
  *((void *)v7 + 3) = v3;
  *((void *)v7 + 4) = v5;
  *((void *)v7 + 5) = v6;
  *a1 = sub_236CF4634;
  a1[1] = v7;
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ArtworkUnavailableView()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ArtworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ArtworkUnavailableView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for ArtworkUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkUnavailableView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ArtworkUnavailableView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ArtworkUnavailableView()
{
  return &type metadata for ArtworkUnavailableView;
}

unint64_t sub_236CF45CC()
{
  unint64_t result = qword_2688CEBC0;
  if (!qword_2688CEBC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEBC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEBC0);
  }
  return result;
}

uint64_t ListeningView.init(state:bass:treble:showIntroAnimation:compatibleWithCustomBackground:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, char a12)
{
  if (a5)
  {
    uint64_t v17 = a5;
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    swift_retain();
    sub_236CFC1F0();
    a4 = v24;
    uint64_t v17 = v25;
    a6 = v26;
  }
  if (a8)
  {
    swift_release();
    uint64_t result = swift_release();
    uint64_t v21 = a7;
  }
  else
  {
    sub_236CFC1F0();
    swift_release();
    uint64_t result = swift_release();
    uint64_t v21 = v24;
    a8 = v25;
    a10 = v26;
  }
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = v17;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = v21;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 72) = a11 & 1;
  *(unsigned char *)(a9 + 73) = a12 & 1;
  return result;
}

double ListeningView.body.getter@<D0>(uint64_t a1@<X8>)
{
  char v4 = *(unsigned char *)(v1 + 73);
  char v5 = *(unsigned char *)(v1 + 72);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEBD0);
  sub_236CFC1E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEBD8);
  sub_236CFC1E0();
  sub_236CFC1E0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  double result = v7;
  *(_OWORD *)a1 = v6;
  *(double *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 24) = v6;
  *(double *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = v6;
  *(double *)(a1 + 64) = v7;
  *(unsigned char *)(a1 + 72) = v5;
  *(unsigned char *)(a1 + 73) = v4;
  *(void *)(a1 + 80) = 0;
  *(_WORD *)(a1 + 88) = 1;
  return result;
}

uint64_t sub_236CF4900()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 __swift_memcpy74_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 58) = *(_OWORD *)(a2 + 58);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for ListeningView()
{
  return &type metadata for ListeningView;
}

id sub_236CF496C(uint64_t a1, double a2, double a3)
{
  objc_msgSend(v3, sel_setBass_);
  objc_msgSend(v3, sel_setTreble_, a3);
  id result = objc_msgSend(v3, sel_state);
  switch(a1)
  {
    case 1:
      if (result != (id)1) {
        goto LABEL_3;
      }
      break;
    case 2:
      if (result != (id)2)
      {
        double v7 = &selRef_startIdleAnimation;
        goto LABEL_13;
      }
      break;
    case 3:
      if (result != (id)3)
      {
        double v7 = &selRef_startPassiveListeningAnimation;
        if (result == (id)4) {
          goto LABEL_9;
        }
        goto LABEL_13;
      }
      break;
    case 4:
      if (result != (id)4)
      {
        double v7 = &selRef_startActiveListeningAnimation;
        if (result == (id)3) {
LABEL_9:
        }
          objc_msgSend(v3, sel_stopAllAnimations);
        goto LABEL_13;
      }
      break;
    default:
LABEL_3:
      double v7 = &selRef_stopAllAnimations;
LABEL_13:
      uint64_t v8 = *v7;
      id result = [v3 v8];
      break;
  }
  return result;
}

uint64_t type metadata accessor for ListeningLayerPlatformWrapper.ListeningUIView()
{
  return self;
}

unint64_t sub_236CF4C30()
{
  unint64_t result = qword_2688CEBE8;
  if (!qword_2688CEBE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEBF0);
    sub_236CF4CAC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEBE8);
  }
  return result;
}

unint64_t sub_236CF4CAC()
{
  unint64_t result = qword_2688CEBF8;
  if (!qword_2688CEBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEBF8);
  }
  return result;
}

uint64_t _s11ShazamKitUI13ListeningViewVwxx_0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t _s11ShazamKitUI13ListeningViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s11ShazamKitUI13ListeningViewVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  return a1;
}

uint64_t _s11ShazamKitUI13ListeningViewVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  return a1;
}

uint64_t _s11ShazamKitUI13ListeningViewVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 74)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_236CF4FBC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 72) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 74) = 1;
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
    *(unsigned char *)(result + 74) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ListeningLayerPlatformWrapper()
{
  return &type metadata for ListeningLayerPlatformWrapper;
}

void sub_236CF5024(void *a1)
{
  type metadata accessor for ListeningLayerPlatformWrapper.ListeningUIView();
  uint64_t v2 = swift_dynamicCastClass();
  if (v2)
  {
    uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer);
    id v4 = a1;
    id v5 = v3;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEBD0);
    MEMORY[0x237E0D510](&v10, v6);
    uint64_t v7 = *(void *)&v10;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEBD8);
    MEMORY[0x237E0D510](&v10);
    double v9 = v10;
    MEMORY[0x237E0D510](&v10, v8);
    sub_236CF496C(v7, v9, v10);
  }
}

id sub_236CF5130()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)SHListeningLayer), sel_initWithIntroAnimation_useCustomCompatibleBackground_, *(unsigned __int8 *)(v0 + 72), *(unsigned __int8 *)(v0 + 73));
  uint64_t v2 = (objc_class *)type metadata accessor for ListeningLayerPlatformWrapper.ListeningUIView();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer] = v1;
  v8.receiver = v3;
  v8.super_class = v2;
  id v4 = v1;
  id v5 = objc_msgSendSuper2(&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v6 = objc_msgSend(v5, sel_layer, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_addSublayer_, v4);

  return v5;
}

unint64_t sub_236CF5214(uint64_t a1)
{
  unint64_t result = sub_236CF523C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_236CF523C()
{
  unint64_t result = qword_2688CEC00;
  if (!qword_2688CEC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEC00);
  }
  return result;
}

uint64_t sub_236CF5290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CF523C();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_236CF52F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CF523C();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_236CF5358()
{
}

uint64_t sub_236CF5384(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = objc_allocWithZone(v1);
  uint64_t v5 = sub_236CF85D0(a1);
  (*(void (**)(uint64_t))(*(void *)(*(void *)((char *)v2 + qword_2688D0F38) - 8) + 8))(a1);
  return v5;
}

id sub_236CF5404()
{
  uint64_t v1 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint);
  }
  else
  {
    id v4 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView), sel_heightAnchor);
    id v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, 0.0);

    unint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_236CF54AC(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(v2 + *a2), sel_centerYAnchor);
    id v7 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView), sel_centerYAnchor);
    id v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v7, 391.0);

    double v9 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v8;
    id v5 = v8;

    id v4 = 0;
  }
  id v10 = v4;
  return v5;
}

void sub_236CF5580(double a1, double a2, double a3, double a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView;
  id v11 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v12 = v4;
  *(void *)&v4[v10] = objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v13 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView;
  *(void *)&v12[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v14 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel;
  *(void *)&v12[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v15 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel;
  *(void *)&v12[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v16 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView;
  *(void *)&v12[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v17 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel;
  *(void *)&v12[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v18 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView;
  *(void *)&v12[v18] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v19 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView;
  *(void *)&v12[v19] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v20 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton;
  *(void *)&v12[v20] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v21 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2688CED20));
  uint64_t v22 = (void *)sub_236CFBE00();
  id v23 = objc_msgSend(v22, sel_view);

  if (v23)
  {
    *(void *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView] = v23;
    *(void *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint] = 0;
    *(void *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint] = 0;
    *(void *)&v12[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint] = 0;

    v25.receiver = v12;
    v25.super_class = ObjectType;
    id v24 = objc_msgSendSuper2(&v25, sel_initWithFrame_, a1, a2, a3, a4);
    sub_236CF583C();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_236CF583C()
{
  uint64_t v1 = v0;
  v127[2] = swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CED28);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v132 = (char *)v127 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_236CFC490();
  uint64_t v130 = *(void *)(v4 - 8);
  v131 = (void *)v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v128 = (char *)v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_236CFC4E0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v139 = (char *)v127 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  double v9 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView];
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v9);
  uint64_t v10 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel];
  objc_msgSend(v9, sel_addArrangedSubview_, v10);
  id v11 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel];
  objc_msgSend(v9, sel_addArrangedSubview_, v11);
  objc_msgSend(v9, sel_setAxis_, 1);
  objc_msgSend(v9, sel_setDistribution_, 0);
  id v137 = v9;
  objc_msgSend(v9, sel_setAlignment_, 0);
  uint64_t v12 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView];
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v12);
  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView];
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v138 = v12;
  objc_msgSend(v12, sel_addSubview_, v13);
  objc_msgSend(v13, sel__setContinuousCornerRadius_, 24.0);
  objc_msgSend(v13, sel_setClipsToBounds_, 1);
  id v14 = objc_msgSend(v13, sel_layer);
  if (qword_2688CE218 != -1) {
    swift_once();
  }
  uint64_t v140 = v7;
  uint64_t v141 = v6;
  id v15 = objc_msgSend((id)qword_2688CEC18, sel_CGColor);
  objc_msgSend(v14, sel_setBorderColor_, v15);

  id v16 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v16, sel_setBorderWidth_, 0.5);

  id v17 = objc_msgSend(v13, sel_layer);
  objc_msgSend(v17, sel_setBorderPathIsBounds_, 1);

  if (qword_2688CE198 != -1) {
    swift_once();
  }
  uint64_t v18 = (void *)sub_236CFC330();
  objc_msgSend(v13, sel_setAccessibilityIdentifier_, v18);

  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v19 = self;
  id v20 = objc_msgSend(v19, sel_systemFontOfSize_weight_, 38.0, *MEMORY[0x263F81840]);
  objc_msgSend(v10, sel_setFont_, v20);

  id v21 = self;
  id v22 = objc_msgSend(v21, sel_whiteColor);
  objc_msgSend(v10, sel_setTextColor_, v22);

  objc_msgSend(v10, sel_setNumberOfLines_, 2);
  LODWORD(v23) = 1132068864;
  objc_msgSend(v10, sel_setContentCompressionResistancePriority_forAxis_, 0, v23);
  if (qword_2688CE190 != -1) {
    swift_once();
  }
  id v24 = (void *)sub_236CFC330();
  objc_msgSend(v10, sel_setAccessibilityIdentifier_, v24);

  objc_super v25 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView];
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v138, sel_addSubview_, v25);
  objc_msgSend(v25, sel__setContinuousCornerRadius_, 24.0);
  objc_msgSend(v25, sel_setClipsToBounds_, 1);
  if (qword_2688CE1A0 != -1) {
    swift_once();
  }
  uint64_t v26 = (void *)sub_236CFC330();
  objc_msgSend(v25, sel_setAccessibilityIdentifier_, v26);

  id v27 = objc_msgSend(v25, sel_layer);
  id v28 = objc_msgSend((id)qword_2688CEC18, sel_CGColor);
  objc_msgSend(v27, sel_setBorderColor_, v28);

  id v29 = objc_msgSend(v25, sel_layer);
  objc_msgSend(v29, sel_setBorderWidth_, 0.5);

  id v30 = objc_msgSend(v25, sel_layer);
  objc_msgSend(v30, sel_setBorderPathIsBounds_, 1);

  objc_msgSend(v25, sel_setOverrideUserInterfaceStyle_, 2);
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v31 = objc_msgSend(v19, sel_systemFontOfSize_weight_, 34.0, *MEMORY[0x263F81838]);
  objc_msgSend(v11, sel_setFont_, v31);

  objc_msgSend(v11, sel_setNumberOfLines_, 1);
  if (qword_2688CE208 != -1) {
    swift_once();
  }
  objc_msgSend(v11, sel_setTextColor_, qword_2688CEC08);
  LODWORD(v32) = 1132068864;
  objc_msgSend(v11, sel_setContentCompressionResistancePriority_forAxis_, 0, v32);
  if (qword_2688CE188 != -1) {
    swift_once();
  }
  id v136 = v25;
  uint64_t v33 = (void *)sub_236CFC330();
  objc_msgSend(v11, sel_setAccessibilityIdentifier_, v33);

  uint64_t v34 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView];
  objc_msgSend(v34, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v34);
  uint64_t v35 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView];
  objc_msgSend(v34, sel_addArrangedSubview_, v35);
  objc_msgSend(v34, sel_setCustomSpacing_afterView_, v35, 4.0);
  char v36 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel];
  objc_msgSend(v34, sel_addArrangedSubview_, v36);
  objc_msgSend(v34, sel_setAxis_, 0);
  objc_msgSend(v34, sel_setDistribution_, 0);
  id v129 = v34;
  objc_msgSend(v34, sel_setAlignment_, 0);
  v127[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE580);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_236CFF800;
  *(void *)(v37 + 32) = objc_msgSend(v21, sel_blackColor);
  *(void *)(v37 + 40) = objc_msgSend(v21, sel_blackColor);
  if (qword_2688CE210 != -1) {
    swift_once();
  }
  char v38 = (void *)qword_2688CEC10;
  *(void *)(v37 + 48) = qword_2688CEC10;
  uint64_t v142 = v37;
  sub_236CFC3B0();
  sub_236CF86B8(0, &qword_2688CED30);
  id v39 = v38;
  uint64_t v40 = (void *)sub_236CFC390();
  swift_bridgeObjectRelease();
  id v41 = objc_msgSend(self, sel_configurationWithPaletteColors_, v40);

  id v42 = v41;
  uint64_t v43 = (void *)sub_236CFC330();
  uint64_t v44 = self;
  id v45 = objc_msgSend(v44, sel_systemImageNamed_withConfiguration_, v43, v42);

  id v135 = v42;
  id v133 = v35;
  id v134 = v45;
  objc_msgSend(v35, sel_setImage_, v45);
  id v46 = objc_msgSend(v19, sel_systemFontOfSize_weight_, 20.0, *MEMORY[0x263F81828]);
  objc_msgSend(v36, sel_setFont_, v46);

  objc_msgSend(v36, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v36, sel_setTextColor_, qword_2688CEC10);
  LODWORD(v47) = 1132068864;
  objc_msgSend(v36, sel_setContentCompressionResistancePriority_forAxis_, 0, v47);
  if (qword_2688CE1A8 != -1) {
    swift_once();
  }
  uint64_t v48 = (void *)sub_236CFC330();
  objc_msgSend(v36, sel_setAccessibilityIdentifier_, v48);

  uint64_t v49 = *(void **)&v1[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton];
  objc_msgSend(v49, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v50 = (void *)sub_236CFC330();
  objc_msgSend(v49, sel_setAccessibilityIdentifier_, v50);

  uint64_t v51 = self;
  id v52 = objc_msgSend(v51, sel_mainBundle);
  sub_236CFB8B0();

  uint64_t v53 = (void *)sub_236CFC330();
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_setAccessibilityLabel_, v53);

  objc_msgSend(v1, sel_addSubview_, v49);
  id v54 = v139;
  sub_236CFC4D0();
  id v55 = objc_msgSend(v51, sel_bundleForClass_, swift_getObjCClassFromMetadata());
  char v56 = (void *)sub_236CFC330();
  id v57 = objc_msgSend(v44, sel_imageNamed_inBundle_withConfiguration_, v56, v55, 0);

  sub_236CFC4C0();
  if (qword_2688CE220 != -1) {
    swift_once();
  }
  id v58 = (id)qword_2688CEC20;
  sub_236CFC4B0();
  (*(void (**)(char *, void, void *))(v130 + 104))(v128, *MEMORY[0x263F821B8], v131);
  sub_236CFC4A0();
  uint64_t v59 = v140;
  uint64_t v60 = v141;
  long long v61 = v132;
  (*(void (**)(char *, char *, uint64_t))(v140 + 16))(v132, v54, v141);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v61, 0, 1, v60);
  sub_236CFC4F0();
  uint64_t v132 = (char *)self;
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_236CFF810;
  id v63 = v138;
  id v64 = objc_msgSend(v138, sel_leadingAnchor);
  id v65 = objc_msgSend(v1, byte_264CC023A);
  id v66 = objc_msgSend(v64, sel_constraintEqualToAnchor_constant_, v65, 24.0);

  *(void *)(v62 + 32) = v66;
  *(void *)(v62 + 40) = sub_236CF5404();
  id v67 = objc_msgSend(v63, sel_widthAnchor);
  id v68 = objc_msgSend(v63, sel_heightAnchor);
  id v69 = objc_msgSend(v67, sel_constraintEqualToAnchor_, v68);

  *(void *)(v62 + 48) = v69;
  id v70 = objc_msgSend(v63, sel_centerYAnchor);
  id v71 = objc_msgSend(v1, (SEL)&selRef_setStrokeColor_ + 6);
  id v72 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v71);

  *(void *)(v62 + 56) = v72;
  id v73 = objc_msgSend(v13, sel_centerXAnchor);
  id v74 = objc_msgSend(v63, sel_centerXAnchor);
  id v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_, v74);

  *(void *)(v62 + 64) = v75;
  id v76 = objc_msgSend(v13, byte_264CC0306);
  id v77 = objc_msgSend(v63, byte_264CC0306);
  id v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v77);

  *(void *)(v62 + 72) = v78;
  id v79 = objc_msgSend(v13, sel_widthAnchor);
  id v80 = objc_msgSend(v63, sel_widthAnchor);
  id v81 = objc_msgSend(v79, sel_constraintEqualToAnchor_, v80);

  *(void *)(v62 + 80) = v81;
  *(void *)(v62 + 88) = sub_236CF54AC(&OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
  uint64_t v82 = v1;
  id v83 = v137;
  id v84 = objc_msgSend(v137, sel_leadingAnchor);
  id v85 = objc_msgSend(v63, sel_trailingAnchor);
  id v86 = objc_msgSend(v84, sel_constraintEqualToAnchor_constant_, v85, 38.0);

  *(void *)(v62 + 96) = v86;
  id v87 = objc_msgSend(v83, sel_trailingAnchor);
  id v88 = objc_msgSend(v82, sel_trailingAnchor);
  id v89 = objc_msgSend(v87, sel_constraintEqualToAnchor_, v88);

  *(void *)(v62 + 104) = v89;
  id v90 = objc_msgSend(v83, sel_centerYAnchor);
  id v91 = objc_msgSend(v82, sel_centerYAnchor);
  id v92 = objc_msgSend(v90, sel_constraintEqualToAnchor_, v91);

  *(void *)(v62 + 112) = v92;
  id v93 = objc_msgSend(v49, sel_trailingAnchor);
  v131 = v82;
  id v94 = objc_msgSend(v82, sel_trailingAnchor);
  id v95 = objc_msgSend(v93, sel_constraintEqualToAnchor_, v94);

  *(void *)(v62 + 120) = v95;
  id v96 = objc_msgSend(v49, sel_widthAnchor);
  id v97 = objc_msgSend(v96, sel_constraintEqualToConstant_, 149.0);

  *(void *)(v62 + 128) = v97;
  id v98 = objc_msgSend(v49, sel_heightAnchor);
  id v99 = objc_msgSend(v98, sel_constraintEqualToConstant_, 50.0);

  *(void *)(v62 + 136) = v99;
  id v100 = objc_msgSend(v49, sel_bottomAnchor);
  id v101 = objc_msgSend(v63, sel_bottomAnchor);
  id v102 = objc_msgSend(v100, sel_constraintEqualToAnchor_, v101);

  *(void *)(v62 + 144) = v102;
  id v103 = v129;
  id v104 = objc_msgSend(v129, sel_leadingAnchor);
  id v105 = objc_msgSend(v83, sel_leadingAnchor);
  id v106 = objc_msgSend(v104, byte_264CC02EE, v105);

  *(void *)(v62 + 152) = v106;
  id v107 = objc_msgSend(v103, sel_centerYAnchor);
  id v108 = objc_msgSend(v49, sel_centerYAnchor);
  id v109 = objc_msgSend(v107, byte_264CC02EE, v108);

  *(void *)(v62 + 160) = v109;
  id v110 = v133;
  id v111 = objc_msgSend(v133, sel_heightAnchor);
  if (qword_2688CE228 != -1) {
    swift_once();
  }
  id v112 = objc_retainAutoreleasedReturnValue(objc_msgSend(v111, sel_constraintEqualToConstant_, *((double *)&xmmword_2688CEC28
                                                                                               + 1)));

  *(void *)(v62 + 168) = v112;
  id v113 = objc_msgSend(v110, sel_widthAnchor);
  id v114 = objc_msgSend(v113, sel_constraintEqualToConstant_, *(double *)&xmmword_2688CEC28);

  *(void *)(v62 + 176) = v114;
  id v115 = v136;
  id v116 = objc_msgSend(v136, sel_centerXAnchor);
  id v117 = objc_msgSend(v63, sel_centerXAnchor);
  id v118 = objc_msgSend(v116, byte_264CC02EE, v117);

  *(void *)(v62 + 184) = v118;
  id v119 = objc_msgSend(v115, sel_heightAnchor);
  id v120 = objc_msgSend(v63, sel_heightAnchor);
  id v121 = objc_msgSend(v119, byte_264CC02EE, v120);

  *(void *)(v62 + 192) = v121;
  id v122 = objc_msgSend(v115, sel_widthAnchor);
  id v123 = objc_msgSend(v63, sel_widthAnchor);
  id v124 = objc_msgSend(v122, byte_264CC02EE, v123);

  *(void *)(v62 + 200) = v124;
  *(void *)(v62 + 208) = sub_236CF54AC(&OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView);
  uint64_t v142 = v62;
  sub_236CFC3B0();
  sub_236CF86B8(0, (unint64_t *)&qword_2688CE588);
  uint64_t v125 = (void *)sub_236CFC390();
  swift_bridgeObjectRelease();
  objc_msgSend(v132, sel_activateConstraints_, v125);

  return (*(uint64_t (**)(char *, uint64_t))(v140 + 8))(v139, v141);
}

void sub_236CF6E10(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtContainerView;
  id v5 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v6 = v1;
  *(void *)&v1[v4] = objc_msgSend(v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v7 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView;
  *(void *)&v6[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel;
  *(void *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v9 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel;
  *(void *)&v6[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v10 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamLogoImageView;
  *(void *)&v6[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v11 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountLabel;
  *(void *)&v6[v11] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v12 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_trackDetailsStackView;
  *(void *)&v6[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v13 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView;
  *(void *)&v6[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v14 = OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton;
  *(void *)&v6[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824E8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2688CED20));
  id v16 = (void *)sub_236CFBE00();
  id v17 = objc_msgSend(v16, sel_view);

  if (v17)
  {
    *(void *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_placeholderArtworkView] = v17;
    *(void *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint] = 0;
    *(void *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtContainerViewHeightConstraint] = 0;
    *(void *)&v6[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___placeholderViewCenterYConstraint] = 0;

    v20.receiver = v6;
    v20.super_class = ObjectType;
    id v18 = objc_msgSendSuper2(&v20, sel_initWithCoder_, a1);
    if (v18)
    {
      id v19 = v18;
      sub_236CF583C();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for AmbientMatchUIView()
{
  return self;
}

uint64_t sub_236CF72AC()
{
  return swift_initClassMetadata2();
}

void sub_236CF72F0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
  id v2 = objc_msgSend(v1, sel_layer);
  id v3 = objc_msgSend(self, sel_blackColor);
  id v4 = objc_msgSend(v3, sel_CGColor);

  objc_msgSend(v2, sel_setBackgroundColor_, v4);
  id v5 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v5, sel_setOpacity_, 0.0);

  objc_msgSend(v1, sel_transform);
  CGAffineTransformScale(&v19, &aBlock, 0.9, 0.9);
  CGAffineTransform aBlock = v19;
  objc_msgSend(v1, sel_setTransform_, &aBlock);
  id v6 = sub_236CF54AC(&OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView____lazy_storage___albumArtImageViewCenterYConstraint, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
  objc_msgSend(v6, sel_setConstant_, 0.0);

  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF0]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 120.0, 16.0, 0.0, 0.0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E30]), sel_initWithDuration_timingParameters_, v18, 0.0);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)&aBlock.tx = sub_236CF859C;
  *(void *)&aBlock.ty = v8;
  *(void *)&aBlock.a = MEMORY[0x263EF8330];
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_236CF7BE0;
  *(void *)&aBlock.d = &block_descriptor_27;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v7, sel_addAnimations_, v9);
  _Block_release(v9);
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF0]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 120.0, 20.0, 0.0, 0.0);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E30]), sel_initWithDuration_timingParameters_, v10, 0.0);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)&aBlock.tx = sub_236CF85A4;
  *(void *)&aBlock.ty = v12;
  *(void *)&aBlock.a = MEMORY[0x263EF8330];
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_236CF7BE0;
  *(void *)&aBlock.d = &block_descriptor_31;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_addAnimations_, v13);
  _Block_release(v13);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v15 = objc_allocWithZone(MEMORY[0x263F82E30]);
  *(void *)&aBlock.tx = sub_236CF85C8;
  *(void *)&aBlock.ty = v14;
  *(void *)&aBlock.a = MEMORY[0x263EF8330];
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_236CF7BE0;
  *(void *)&aBlock.d = &block_descriptor_35;
  id v16 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v17 = objc_msgSend(v15, sel_initWithDuration_curve_animations_, 3, v16, 0.84);
  _Block_release(v16);
  swift_release();
  objc_msgSend(v7, sel_startAnimation);
  objc_msgSend(v11, sel_startAnimationAfterDelay_, 0.16);
  objc_msgSend(v17, sel_startAnimation);
}

void sub_236CF7778()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel];
  objc_msgSend(v1, sel_transform);
  CGAffineTransformTranslate(&v15, &aBlock, 0.0, 70.0);
  CGAffineTransform aBlock = v15;
  objc_msgSend(v1, sel_setTransform_, &aBlock);
  id v2 = *(void **)&v0[OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel];
  objc_msgSend(v2, sel_transform);
  CGAffineTransformTranslate(&v15, &aBlock, 0.0, 80.0);
  CGAffineTransform aBlock = v15;
  objc_msgSend(v2, sel_setTransform_, &aBlock);
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF0]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 120.0, 20.0, 0.0, 0.0);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E30]), sel_initWithDuration_timingParameters_, v14, 0.0);
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)&aBlock.tx = sub_236CF84AC;
  *(void *)&aBlock.ty = v4;
  *(void *)&aBlock.a = MEMORY[0x263EF8330];
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_236CF7BE0;
  *(void *)&aBlock.d = &block_descriptor_5;
  id v5 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v3, sel_addAnimations_, v5);
  _Block_release(v5);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82BF0]), sel_initWithMass_stiffness_damping_initialVelocity_, 1.0, 200.0, 27.0, 0.0, 0.0);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E30]), sel_initWithDuration_timingParameters_, v6, 0.0);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)&aBlock.tx = sub_236CF84E8;
  *(void *)&aBlock.ty = v8;
  *(void *)&aBlock.a = MEMORY[0x263EF8330];
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_236CF7BE0;
  *(void *)&aBlock.d = &block_descriptor_5;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v7, sel_addAnimations_, v9);
  _Block_release(v9);
  objc_msgSend(v3, sel_startAnimationAfterDelay_, 0.3);
  objc_msgSend(v7, sel_startAnimationAfterDelay_, 0.4);
  id v10 = self;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v0;
  *(void *)&aBlock.tx = sub_236CF8544;
  *(void *)&aBlock.ty = v11;
  *(void *)&aBlock.a = MEMORY[0x263EF8330];
  *(void *)&aBlock.b = 1107296256;
  *(void *)&aBlock.c = sub_236CF7BE0;
  *(void *)&aBlock.d = &block_descriptor_11;
  uint64_t v12 = _Block_copy(&aBlock);
  uint64_t v13 = v0;
  swift_release();
  objc_msgSend(v10, sel_animateKeyframesWithDuration_delay_options_animations_completion_, 0, v12, 0, 1.25, 0.25);

  _Block_release(v12);
}

void sub_236CF7B84(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  id v2 = (void *)MEMORY[0x237E0E220](v1);
  if (v2)
  {
    id v3 = v2;
    objc_msgSend(v2, sel_layoutIfNeeded);
  }
}

uint64_t sub_236CF7BE0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_236CF7C24(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237E0E220](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = *(id *)(v2 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);

    id v5 = objc_msgSend(v4, sel_layer);
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, sel_setOpacity_, v6);
  }
}

void sub_236CF7CC0(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x237E0E220](v3);
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = *(id *)(v4 + *a2);

    v7[0] = 0x3FF0000000000000;
    v7[1] = 0;
    v7[2] = 0;
    v7[3] = 0x3FF0000000000000;
    v7[4] = 0;
    v7[5] = 0;
    objc_msgSend(v6, sel_setTransform_, v7);
  }
}

void sub_236CF7D4C()
{
  uint64_t v0 = self;
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = sub_236CF854C;
  uint64_t v12 = v1;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 1107296256;
  uint64_t v9 = sub_236CF7BE0;
  id v10 = &block_descriptor_15;
  uint64_t v2 = _Block_copy(&v7);
  swift_release();
  objc_msgSend(v0, sel_addKeyframeWithRelativeStartTime_relativeDuration_animations_, v2, 0.0, 1.0);
  _Block_release(v2);
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = sub_236CF8570;
  uint64_t v12 = v3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 1107296256;
  uint64_t v9 = sub_236CF7BE0;
  id v10 = &block_descriptor_19;
  uint64_t v4 = _Block_copy(&v7);
  swift_release();
  objc_msgSend(v0, sel_addKeyframeWithRelativeStartTime_relativeDuration_animations_, v4, 0.05, 0.9);
  _Block_release(v4);
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = sub_236CF8594;
  uint64_t v12 = v5;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 1107296256;
  uint64_t v9 = sub_236CF7BE0;
  id v10 = &block_descriptor_23;
  id v6 = _Block_copy(&v7);
  swift_release();
  objc_msgSend(v0, sel_addKeyframeWithRelativeStartTime_relativeDuration_animations_, v6, 0.2, 0.8);
  _Block_release(v6);
}

void sub_236CF7FA4(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x237E0E220](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = *(id *)(v4 + *a2);

    objc_msgSend(v6, sel_setAlpha_, 1.0);
  }
}

void sub_236CF8020(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x237E0E220](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = *(id *)(v2 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_shazamCountStackView);

    objc_msgSend(v4, sel_setAlpha_, 1.0);
  }
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x237E0E220](v1);
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = *(id *)(v5 + OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_appleMusicButton);

    objc_msgSend(v7, sel_setAlpha_, 1.0);
  }
}

id sub_236CF80F4()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.6, 0.6, 0.6, 1.0);
  qword_2688CEC08 = (uint64_t)result;
  return result;
}

id sub_236CF8140()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.447058824, 0.447058824, 0.447058824, 0.6);
  qword_2688CEC10 = (uint64_t)result;
  return result;
}

void sub_236CF8190()
{
  id v0 = objc_msgSend(self, sel_whiteColor);
  id v1 = objc_msgSend(v0, sel_colorWithAlphaComponent_, 0.15);

  qword_2688CEC18 = (uint64_t)v1;
}

id sub_236CF8200()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.0980392157, 0.0980392157, 0.0980392157, 1.0);
  qword_2688CEC20 = (uint64_t)result;
  return result;
}

__n128 sub_236CF8248()
{
  __asm { FMOV            V0.2D, #24.0 }
  xmmword_2688CEC28 = (__int128)result;
  return result;
}

uint64_t sub_236CF825C()
{
  return 1;
}

void *sub_236CF8264(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_236CF82A8(a1, a2);
}

void *sub_236CF82A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)((*MEMORY[0x263F8EED0] & *v2) + qword_2688D0F38);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  id v7 = (void *)sub_236CFBDF0();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  id v9 = v7;
  v8(a2, v4);
  if (v7) {

  }
  return v7;
}

id sub_236CF83E0(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_236CF8434(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_236CF83E0(a3);
}

uint64_t type metadata accessor for SecureHostingController()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_236CF8474()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_236CF84AC()
{
  sub_236CF7CC0(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel);
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

void sub_236CF84E8()
{
  sub_236CF7CC0(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel);
}

uint64_t sub_236CF850C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_236CF8544()
{
}

void sub_236CF854C()
{
  sub_236CF7FA4(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_titleLabel);
}

void sub_236CF8570()
{
  sub_236CF7FA4(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_artistLabel);
}

void sub_236CF8594()
{
  sub_236CF8020(v0);
}

void sub_236CF859C()
{
  sub_236CF7B84(v0);
}

void sub_236CF85A4()
{
  sub_236CF7CC0(v0, &OBJC_IVAR____TtC11ShazamKitUI18AmbientMatchUIView_albumArtImageView);
}

void sub_236CF85C8()
{
  sub_236CF7C24(v0);
}

uint64_t sub_236CF85D0(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - v1);
  return sub_236CFBE00();
}

uint64_t sub_236CF86B8(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void sub_236CF8764()
{
  qword_2688D0F48 = 0x7472416D75626C61;
  unk_2688D0F50 = 0xE800000000000000;
}

void sub_236CF8788()
{
  qword_2688D0F58 = 0x656C746974;
  unk_2688D0F60 = 0xE500000000000000;
}

void sub_236CF87A8()
{
  qword_2688D0F68 = 0x656C746974627573;
  unk_2688D0F70 = 0xE800000000000000;
}

uint64_t *sub_236CF87CC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_236CFB990();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_236CF8944(uint64_t a1)
{
  uint64_t v2 = sub_236CFB990();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

char *sub_236CF8A14(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFB990();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_236CF8B3C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFB990();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_236CF8CC8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFB990();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_236CF8DF0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_236CFB990();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t sub_236CF8F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_236CF8F90);
}

uint64_t sub_236CF8F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_236CF9000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_236CF9014);
}

uint64_t sub_236CF9014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AlbumArt()
{
  uint64_t result = qword_2688CED38;
  if (!qword_2688CED38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_236CF90D4()
{
  sub_236CE5050();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_236CF916C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CF9188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v59 = a2;
  uint64_t v61 = a3;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CED90);
  uint64_t v3 = MEMORY[0x270FA5388](v57);
  uint64_t v49 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (uint64_t)&v48 - v5;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEDA8);
  MEMORY[0x270FA5388](v63);
  uint64_t v60 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEDB0);
  MEMORY[0x270FA5388](v54);
  uint64_t v55 = (uint64_t)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CED60);
  MEMORY[0x270FA5388](v62);
  char v56 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE920);
  MEMORY[0x270FA5388](v52);
  int v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_236CFBC80();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_236CFC150();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CED70);
  uint64_t v18 = MEMORY[0x270FA5388](v53);
  objc_super v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v51 = (uint64_t)&v48 - v21;
  uint64_t v22 = sub_236CFBC70();
  uint64_t v23 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  objc_super v25 = (id *)((char *)&v48 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *, uint64_t, uint64_t))(v23 + 16))(v25, v58, v22);
  int v26 = (*(uint64_t (**)(id *, uint64_t))(v23 + 88))(v25, v22);
  if (v26 == *MEMORY[0x263F18C58])
  {
    (*(void (**)(id *, uint64_t))(v23 + 96))(v25, v22);
    (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F1B4B8], v14);
    uint64_t v27 = sub_236CFC190();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v28 = *(void *)(v59 + *(int *)(type metadata accessor for AlbumArt() + 20));
    id v29 = (char *)v13 + *(int *)(v11 + 20);
    uint64_t v30 = *MEMORY[0x263F19860];
    uint64_t v31 = sub_236CFBDC0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v29, v30, v31);
    *uint64_t v13 = v28;
    v13[1] = v28;
    sub_236CFA0E8((uint64_t)v13, (uint64_t)v10, MEMORY[0x263F19048]);
    uint64_t v32 = v53;
    *(_WORD *)&v10[*(int *)(v52 + 36)] = 256;
    sub_236CE1DA8((uint64_t)v10, (uint64_t)&v20[*(int *)(v32 + 36)], &qword_2688CE920);
    *(void *)objc_super v20 = v27;
    *((void *)v20 + 1) = 0;
    *((_WORD *)v20 + 8) = 1;
    swift_retain();
    sub_236CE17A0((uint64_t)v10, &qword_2688CE920);
    sub_236CFA150((uint64_t)v13);
    swift_release();
    uint64_t v33 = v51;
    sub_236CE6650((uint64_t)v20, v51, &qword_2688CED70);
    sub_236CE1DA8(v33, v55, &qword_2688CED70);
    swift_storeEnumTagMultiPayload();
    sub_236CF9F0C();
    sub_236CF9FC4();
    uint64_t v34 = (uint64_t)v56;
    sub_236CFBED0();
    sub_236CE1DA8(v34, v60, &qword_2688CED60);
    swift_storeEnumTagMultiPayload();
    sub_236CF9E90();
    sub_236CFBED0();
    swift_release();
    sub_236CE17A0(v34, &qword_2688CED60);
    uint64_t v35 = v33;
    char v36 = &qword_2688CED70;
    return sub_236CE17A0(v35, v36);
  }
  uint64_t v37 = v59;
  uint64_t v38 = v60;
  if (v26 == *MEMORY[0x263F18C50])
  {
    (*(void (**)(id *, uint64_t))(v23 + 96))(v25, v22);

LABEL_6:
    if (qword_2688CE1C0 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_2688D0EF0;
    uint64_t v40 = *(void *)(v37 + *(int *)(type metadata accessor for AlbumArt() + 20));
    id v41 = (char *)v13 + *(int *)(v11 + 20);
    uint64_t v42 = *MEMORY[0x263F19860];
    uint64_t v43 = sub_236CFBDC0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v41, v42, v43);
    *uint64_t v13 = v40;
    v13[1] = v40;
    sub_236CFA0E8((uint64_t)v13, (uint64_t)v10, MEMORY[0x263F19048]);
    *(_WORD *)&v10[*(int *)(v52 + 36)] = 256;
    uint64_t v44 = (uint64_t)v49;
    sub_236CE1DA8((uint64_t)v10, (uint64_t)&v49[*(int *)(v57 + 36)], &qword_2688CE920);
    *(void *)uint64_t v44 = v39;
    *(void *)(v44 + 8) = 0;
    *(_WORD *)(v44 + 16) = 1;
    swift_retain_n();
    sub_236CE17A0((uint64_t)v10, &qword_2688CE920);
    sub_236CFA150((uint64_t)v13);
    swift_release();
    uint64_t v45 = v50;
    sub_236CE6650(v44, v50, &qword_2688CED90);
    sub_236CE1DA8(v45, v55, &qword_2688CED90);
    swift_storeEnumTagMultiPayload();
    sub_236CF9F0C();
    sub_236CF9FC4();
    uint64_t v46 = (uint64_t)v56;
    sub_236CFBED0();
    sub_236CE1DA8(v46, v38, &qword_2688CED60);
    swift_storeEnumTagMultiPayload();
    sub_236CF9E90();
    sub_236CFBED0();
    sub_236CE17A0(v46, &qword_2688CED60);
    uint64_t v35 = v45;
    char v36 = &qword_2688CED90;
    return sub_236CE17A0(v35, v36);
  }
  if (v26 == *MEMORY[0x263F18C38]) {
    goto LABEL_6;
  }
  swift_storeEnumTagMultiPayload();
  sub_236CF9E90();
  sub_236CFBED0();
  return (*(uint64_t (**)(id *, uint64_t))(v23 + 8))(v25, v22);
}

uint64_t sub_236CF9A7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE4A0);
  MEMORY[0x270FA5388](v4 - 8);
  sub_236CE1DA8(v1, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2688CE4A0);
  sub_236CFA0E8(v1, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AlbumArt);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v7 = swift_allocObject();
  sub_236CF9D30((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CED48);
  sub_236CF9E14();
  return sub_236CFBB10();
}

uint64_t sub_236CF9C14()
{
  uint64_t v1 = *(void *)(type metadata accessor for AlbumArt() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = sub_236CFB990();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_236CF9D30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AlbumArt();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_236CF9D94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for AlbumArt() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_236CF9188(a1, v6, a2);
}

unint64_t sub_236CF9E14()
{
  unint64_t result = qword_2688CED50;
  if (!qword_2688CED50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CED48);
    sub_236CF9E90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CED50);
  }
  return result;
}

unint64_t sub_236CF9E90()
{
  unint64_t result = qword_2688CED58;
  if (!qword_2688CED58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CED60);
    sub_236CF9F0C();
    sub_236CF9FC4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CED58);
  }
  return result;
}

unint64_t sub_236CF9F0C()
{
  unint64_t result = qword_2688CED68;
  if (!qword_2688CED68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CED70);
    sub_236CFA07C(&qword_2688CED78, &qword_2688CED80);
    sub_236CE2868(&qword_2688CE9F0, &qword_2688CE920);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CED68);
  }
  return result;
}

unint64_t sub_236CF9FC4()
{
  unint64_t result = qword_2688CED88;
  if (!qword_2688CED88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CED90);
    sub_236CFA07C(&qword_2688CED98, &qword_2688CEDA0);
    sub_236CE2868(&qword_2688CE9F0, &qword_2688CE920);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CED88);
  }
  return result;
}

uint64_t sub_236CFA07C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_236CFA0E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_236CFA150(uint64_t a1)
{
  uint64_t v2 = sub_236CFBC80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236CFA1AC()
{
  return sub_236CE2868(&qword_2688CEDB8, &qword_2688CEDC0);
}

ValueMetadata *type metadata accessor for MusicRecognitionAttribution()
{
  return &type metadata for MusicRecognitionAttribution;
}

uint64_t sub_236CFA1F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CFA214@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFC150();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2688CE1F0 != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v49 = sub_236CFC190();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_236CFC250();
  sub_236CFBBD0();
  uint64_t v48 = v50;
  int v44 = v51;
  uint64_t v47 = v52;
  int v43 = v53;
  uint64_t v45 = v55;
  uint64_t v46 = v54;
  sub_236CFBD90();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v8 = sub_236CFC020();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_236CFBF60();
  uint64_t v13 = sub_236CFBFF0();
  uint64_t v15 = v14;
  char v17 = v16;
  swift_release();
  sub_236CDDA20(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_236CFBF70();
  uint64_t v18 = sub_236CFBFC0();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_236CDDA20(v13, v15, v17 & 1);
  swift_bridgeObjectRelease();
  v64[0] = sub_236CFBEE0();
  uint64_t v23 = sub_236CFBFE0();
  uint64_t v25 = v24;
  LOBYTE(v15) = v26 & 1;
  sub_236CDDA20(v18, v20, v22);
  swift_bridgeObjectRelease();
  sub_236CFC120();
  uint64_t v27 = sub_236CFBFD0();
  uint64_t v29 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  swift_release();
  sub_236CDDA20(v23, v25, v15);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = swift_getKeyPath();
  char v36 = v44;
  char v65 = v44;
  char v37 = v43;
  char v63 = v43;
  char v61 = 1;
  char v58 = v31 & 1;
  char v56 = 0;
  *(_DWORD *)(a1 + 17) = v64[0];
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)v64 + 3);
  *(_DWORD *)(a1 + 33) = *(_DWORD *)v62;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)&v62[3];
  int v38 = v59;
  *(_WORD *)(a1 + 70) = v60;
  *(_DWORD *)(a1 + 66) = v38;
  int v39 = *(_DWORD *)v57;
  *(_DWORD *)(a1 + 92) = *(_DWORD *)&v57[3];
  *(_DWORD *)(a1 + 89) = v39;
  uint64_t v40 = v48;
  *(void *)a1 = v49;
  *(void *)(a1 + 8) = v40;
  *(unsigned char *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v47;
  *(unsigned char *)(a1 + 32) = v37;
  *(void *)(a1 + 40) = v46;
  *(void *)(a1 + 48) = v45;
  *(void *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 64) = 1;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 80) = v29;
  *(unsigned char *)(a1 + 88) = v31 & 1;
  *(void *)(a1 + 96) = v33;
  *(void *)(a1 + 104) = KeyPath;
  *(void *)(a1 + 112) = 0x3FE0000000000000;
  *(void *)(a1 + 120) = v35;
  *(void *)(a1 + 128) = 2;
  *(unsigned char *)(a1 + 136) = 0;
  swift_retain();
  sub_236CE43B4(v27, v29, v31 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_236CDDA20(v27, v29, v31 & 1);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_236CFA6E8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_236CFBD40();
  sub_236CFA214((uint64_t)v8);
  *(_OWORD *)&v10[103] = v8[6];
  *(_OWORD *)&v10[87] = v8[5];
  *(_OWORD *)&v10[39] = v8[2];
  *(_OWORD *)&v10[23] = v8[1];
  *(_OWORD *)&v10[119] = v9[0];
  *(_OWORD *)&v10[128] = *(_OWORD *)((char *)v9 + 9);
  *(_OWORD *)&v10[55] = v8[3];
  *(_OWORD *)&v10[71] = v8[4];
  *(_OWORD *)&v10[7] = v8[0];
  long long v3 = *(_OWORD *)&v10[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v10[80];
  long long v4 = *(_OWORD *)&v10[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v10[96];
  *(_OWORD *)(a1 + 129) = v4;
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v10[128];
  long long v5 = *(_OWORD *)v10;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v10[16];
  double result = *(double *)&v10[32];
  long long v7 = *(_OWORD *)&v10[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v10[32];
  *(_OWORD *)(a1 + 65) = v7;
  *(_OWORD *)(a1 + 81) = v3;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 17) = v5;
  return result;
}

uint64_t sub_236CFA7DC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_236CFBCC0();
  *a1 = v3;
  return result;
}

uint64_t sub_236CFA808()
{
  return sub_236CFBCD0();
}

unint64_t sub_236CFA83C()
{
  unint64_t result = qword_2688CEDC8;
  if (!qword_2688CEDC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEDD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEDC8);
  }
  return result;
}

uint64_t sub_236CFA898()
{
  uint64_t v0 = sub_236CFBA80();
  __swift_allocate_value_buffer(v0, qword_2688D0F78);
  __swift_project_value_buffer(v0, (uint64_t)qword_2688D0F78);
  return sub_236CFBA70();
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

uint64_t sub_236CFA96C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688CE448);
    uint64_t v4 = swift_allocError();
    *long long v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t static SHLibrary.present()()
{
  return MEMORY[0x270FA2498](sub_236CFAA20, 0, 0);
}

uint64_t sub_236CFAA20()
{
  uint64_t v1 = self;
  v0[2] = v0;
  v0[3] = sub_236CFAB20;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_236CFA96C;
  v0[13] = &block_descriptor_3;
  v0[14] = v2;
  objc_msgSend(v1, sel__presentMediaLibraryWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_236CFAB20()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 120) = v1;
  if (v1) {
    uint64_t v2 = sub_236CFAC48;
  }
  else {
    uint64_t v2 = sub_236CFAC30;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_236CFAC30()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236CFAC48()
{
  swift_willThrow();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

ValueMetadata *type metadata accessor for MediaLibraryList()
{
  return &type metadata for MediaLibraryList;
}

uint64_t sub_236CFACC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_236CFACE0@<X0>(unint64_t a1@<X0>, char *a2@<X8>)
{
  char v30 = a2;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEE20);
  uint64_t v3 = *(void *)(v29 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v29);
  char v31 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v25 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEE28);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  char v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v25 - v13;
  sub_236CFBB90();
  sub_236CFB4B0();
  sub_236CFC0A0();
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_236CFC5A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v28 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v32 = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEE38);
  sub_236CFB9B0();
  sub_236CE2868(&qword_2688CEE40, &qword_2688CEE38);
  sub_236CFB504();
  sub_236CFB558();
  char v26 = v7;
  sub_236CFC200();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  char v16 = v12;
  uint64_t v27 = v14;
  v15(v12, v14, v8);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v17 = v29;
  v25(v31, v7, v29);
  uint64_t v18 = v9;
  uint64_t v19 = v30;
  v15(v30, v16, v8);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEE60);
  *(void *)&v19[*(int *)(v20 + 48)] = v28;
  char v21 = v31;
  v25(&v19[*(int *)(v20 + 64)], v31, v17);
  char v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v26, v17);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v18 + 8);
  v23(v27, v8);
  v22(v21, v17);
  return ((uint64_t (*)(char *, uint64_t))v23)(v16, v8);
}

id sub_236CFB088@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_236CFB094@<X0>(uint64_t a1@<X8>)
{
  v16[1] = a1;
  uint64_t v2 = sub_236CFBC60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEDE0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEDE8);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[4] = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEDF0);
  sub_236CE2868(&qword_2688CEDF8, &qword_2688CEDF0);
  sub_236CFBFB0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
  uint64_t v14 = (uint64_t *)&v12[*(int *)(v10 + 36)];
  *uint64_t v14 = KeyPath;
  v14[1] = 0x4034000000000000;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_236CFBC50();
  sub_236CFB38C();
  sub_236CFC0E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_236CFB450((uint64_t)v12);
}

uint64_t sub_236CFB330@<X0>(char *a1@<X8>)
{
  return sub_236CFACE0(*(void *)(v1 + 16), a1);
}

uint64_t sub_236CFB338@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_236CFBCE0();
  *a1 = v3;
  return result;
}

uint64_t sub_236CFB364()
{
  return sub_236CFBCF0();
}

unint64_t sub_236CFB38C()
{
  unint64_t result = qword_2688CEE00;
  if (!qword_2688CEE00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688CEDE8);
    sub_236CE2868(&qword_2688CEE08, &qword_2688CEDE0);
    sub_236CE2868(&qword_2688CEE10, &qword_2688CEE18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEE00);
  }
  return result;
}

uint64_t sub_236CFB450(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688CEDE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_236CFB4B0()
{
  unint64_t result = qword_2688CEE30;
  if (!qword_2688CEE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEE30);
  }
  return result;
}

unint64_t sub_236CFB504()
{
  unint64_t result = qword_2688CEE48;
  if (!qword_2688CEE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEE48);
  }
  return result;
}

unint64_t sub_236CFB558()
{
  unint64_t result = qword_2688CEE50;
  if (!qword_2688CEE50)
  {
    sub_236CFB5B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEE50);
  }
  return result;
}

unint64_t sub_236CFB5B0()
{
  unint64_t result = qword_2688CEE58;
  if (!qword_2688CEE58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688CEE58);
  }
  return result;
}

uint64_t sub_236CFB5F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return self;
}

ValueMetadata *type metadata accessor for AmbientNoMatch()
{
  return &type metadata for AmbientNoMatch;
}

id sub_236CFB698()
{
  type metadata accessor for AmbientNoMatchUIView();
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

uint64_t sub_236CFB6D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CFB7C8();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_236CFB738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_236CFB7C8();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_236CFB79C()
{
}

unint64_t sub_236CFB7C8()
{
  unint64_t result = qword_2688CEE68;
  if (!qword_2688CEE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688CEE68);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_236CFB840()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_236CFB850()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_236CFB860()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_236CFB870()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_236CFB880()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_236CFB890()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_236CFB8A0()
{
  return MEMORY[0x270EEEE40]();
}

uint64_t sub_236CFB8B0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_236CFB8C0()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_236CFB8D0()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_236CFB8E0()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_236CFB8F0()
{
  return MEMORY[0x270EEF0A8]();
}

uint64_t sub_236CFB960()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_236CFB970()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_236CFB980()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_236CFB990()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_236CFB9A0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_236CFB9B0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_236CFB9C0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_236CFB9D0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_236CFB9E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_236CFB9F0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_236CFBA00()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_236CFBA10()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_236CFBA20()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_236CFBA30()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_236CFBA40()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_236CFBA50()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_236CFBA60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_236CFBA70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_236CFBA80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_236CFBA90()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_236CFBAA0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_236CFBAB0()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_236CFBAC0()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_236CFBAD0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_236CFBAE0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_236CFBAF0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_236CFBB00()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_236CFBB10()
{
  return MEMORY[0x270EFEC48]();
}

uint64_t sub_236CFBB20()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_236CFBB30()
{
  return MEMORY[0x270EFEE70]();
}

uint64_t sub_236CFBB40()
{
  return MEMORY[0x270EFEE78]();
}

uint64_t sub_236CFBB50()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_236CFBB60()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_236CFBB70()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_236CFBB80()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_236CFBB90()
{
  return MEMORY[0x270EFF4C8]();
}

uint64_t sub_236CFBBA0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_236CFBBB0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_236CFBBC0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_236CFBBD0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_236CFBBE0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_236CFBBF0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_236CFBC00()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_236CFBC10()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_236CFBC20()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_236CFBC30()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_236CFBC50()
{
  return MEMORY[0x270EFFBB8]();
}

uint64_t sub_236CFBC60()
{
  return MEMORY[0x270EFFBC0]();
}

uint64_t sub_236CFBC70()
{
  return MEMORY[0x270EFFDD8]();
}

uint64_t sub_236CFBC80()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_236CFBC90()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_236CFBCA0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_236CFBCB0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_236CFBCC0()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_236CFBCD0()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_236CFBCE0()
{
  return MEMORY[0x270F00C90]();
}

uint64_t sub_236CFBCF0()
{
  return MEMORY[0x270F00C98]();
}

uint64_t sub_236CFBD00()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_236CFBD10()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_236CFBD20()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_236CFBD30()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_236CFBD40()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_236CFBD50()
{
  return MEMORY[0x270F011F0]();
}

uint64_t sub_236CFBD60()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_236CFBD70()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_236CFBD80()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_236CFBD90()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_236CFBDA0()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_236CFBDB0()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_236CFBDC0()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_236CFBDD0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_236CFBDE0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_236CFBDF0()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_236CFBE00()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_236CFBE10()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_236CFBE20()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_236CFBE30()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_236CFBE50()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_236CFBE60()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_236CFBE70()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_236CFBE80()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_236CFBE90()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_236CFBEA0()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_236CFBEC0()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_236CFBED0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_236CFBEE0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_236CFBEF0()
{
  return MEMORY[0x270F022E0]();
}

uint64_t sub_236CFBF00()
{
  return MEMORY[0x270F022F0]();
}

uint64_t sub_236CFBF10()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_236CFBF20()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_236CFBF30()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_236CFBF40()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_236CFBF50()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_236CFBF60()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_236CFBF70()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_236CFBF80()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_236CFBF90()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_236CFBFA0()
{
  return MEMORY[0x270F02D90]();
}

uint64_t sub_236CFBFB0()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_236CFBFC0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_236CFBFD0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_236CFBFE0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_236CFBFF0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_236CFC000()
{
  return MEMORY[0x270F03128]();
}

uint64_t sub_236CFC010()
{
  return MEMORY[0x270F03130]();
}

uint64_t sub_236CFC020()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_236CFC030()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_236CFC040()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_236CFC050()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_236CFC060()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_236CFC070()
{
  return MEMORY[0x270F033F8]();
}

uint64_t sub_236CFC080()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_236CFC090()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_236CFC0A0()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_236CFC0B0()
{
  return MEMORY[0x270F03B78]();
}

uint64_t sub_236CFC0C0()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_236CFC0D0()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_236CFC0E0()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_236CFC0F0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_236CFC100()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_236CFC110()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_236CFC120()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_236CFC130()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_236CFC140()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_236CFC150()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_236CFC160()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_236CFC170()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_236CFC180()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_236CFC190()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_236CFC1A0()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_236CFC1B0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_236CFC1C0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_236CFC1D0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_236CFC1E0()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_236CFC1F0()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_236CFC200()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_236CFC210()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_236CFC220()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_236CFC230()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_236CFC240()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_236CFC250()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_236CFC260()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_236CFC270()
{
  return MEMORY[0x270F05170]();
}

uint64_t sub_236CFC280()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_236CFC290()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_236CFC2A0()
{
  return MEMORY[0x270EFE0B0]();
}

uint64_t sub_236CFC2B0()
{
  return MEMORY[0x270EFE0B8]();
}

uint64_t sub_236CFC2C0()
{
  return MEMORY[0x270EFE0C0]();
}

uint64_t sub_236CFC2D0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_236CFC2E0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_236CFC2F0()
{
  return MEMORY[0x270F63858]();
}

uint64_t sub_236CFC300()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_236CFC310()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_236CFC320()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_236CFC330()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_236CFC340()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_236CFC350()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_236CFC360()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_236CFC370()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_236CFC380()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_236CFC390()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_236CFC3A0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_236CFC3B0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_236CFC3C0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_236CFC3E0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_236CFC3F0()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_236CFC400()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_236CFC410()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_236CFC420()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_236CFC440()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_236CFC450()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_236CFC460()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_236CFC470()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_236CFC480()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_236CFC490()
{
  return MEMORY[0x270F829B0]();
}

uint64_t sub_236CFC4A0()
{
  return MEMORY[0x270F829B8]();
}

uint64_t sub_236CFC4B0()
{
  return MEMORY[0x270F82A68]();
}

uint64_t sub_236CFC4C0()
{
  return MEMORY[0x270F82AF0]();
}

uint64_t sub_236CFC4D0()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_236CFC4E0()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_236CFC4F0()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_236CFC500()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_236CFC510()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_236CFC520()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_236CFC530()
{
  return MEMORY[0x270EF25E8]();
}

uint64_t sub_236CFC540()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_236CFC550()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_236CFC560()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_236CFC580()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_236CFC590()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_236CFC5A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_236CFC5B0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_236CFC5C0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_236CFC5D0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_236CFC5E0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_236CFC600()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_236CFC610()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_236CFC620()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_236CFC650()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_236CFC660()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_236CFC670()
{
  return MEMORY[0x270F9FC90]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  MEMORY[0x270EE5FC8](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}