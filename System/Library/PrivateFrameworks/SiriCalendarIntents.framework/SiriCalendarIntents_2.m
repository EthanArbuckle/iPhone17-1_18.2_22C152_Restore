BOOL sub_2371873B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static Snippet.Color.ColorSpace.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_2371873BC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = Snippet.Color.ColorSpace.init(from:)(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_2371873EC(void *a1)
{
  return Snippet.Color.ColorSpace.encode(to:)(a1, *v1);
}

uint64_t Snippet.Color.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  int v2 = a2;
  sub_237193888();
  sub_237193888();
  sub_237193888();
  if (v2 == 2) {
    return sub_237193878();
  }
  sub_237193878();
  return sub_237193868();
}

BOOL static Snippet.Color.__derived_struct_equals(_:_:)(unsigned __int8 a1, unsigned __int8 a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a3 != a6 || a4 != a7 || a5 != a8) {
    return 0;
  }
  if (a1 != 2) {
    return a2 != 2 && ((a2 ^ a1) & 1) == 0;
  }
  return a2 == 2;
}

uint64_t sub_2371874E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6579570 && a2 == 0xE300000000000000;
  if (v2 || (sub_237193798() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E65657267 && a2 == 0xE500000000000000;
    if (v6 || (sub_237193798() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 1702194274 && a2 == 0xE400000000000000;
      if (v7 || (sub_237193798() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x617053726F6C6F63 && a2 == 0xEA00000000006563)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_237193798();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_23718767C(char a1)
{
  uint64_t result = 6579570;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E65657267;
      break;
    case 2:
      uint64_t result = 1702194274;
      break;
    case 3:
      uint64_t result = 0x617053726F6C6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_237187700()
{
  return sub_23718767C(*v0);
}

uint64_t sub_237187708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2371874E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_237187730(uint64_t a1)
{
  unint64_t v2 = sub_237187C6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23718776C(uint64_t a1)
{
  unint64_t v2 = sub_237187C6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Snippet.Color.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688F17F8);
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7, v8);
  OUTLINED_FUNCTION_13_4();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237187C6C();
  sub_2371938B8();
  sub_237187CB8();
  OUTLINED_FUNCTION_2_43();
  if (!v1)
  {
    OUTLINED_FUNCTION_2_43();
    OUTLINED_FUNCTION_2_43();
    sub_237187D04();
    sub_237193708();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t Snippet.Color.hashValue.getter(unsigned __int8 a1)
{
  sub_237193858();
  Snippet.Color.hash(into:)((uint64_t)v3, a1);
  return sub_237193898();
}

unint64_t Snippet.Color.init(from:)(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1818);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x270FA5388](v3, v4);
  OUTLINED_FUNCTION_3_11();
  unint64_t v5 = (unint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_237187C6C();
  sub_2371938A8();
  if (!v1)
  {
    sub_237187D50();
    OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_1_43();
    sub_237187D9C();
    sub_237193678();
    uint64_t v7 = OUTLINED_FUNCTION_11_13();
    v8(v7);
    unint64_t v5 = v9;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v5;
}

uint64_t sub_237187B70()
{
  return Snippet.Color.hashValue.getter(*(unsigned char *)(v0 + 24));
}

uint64_t sub_237187B80(uint64_t a1)
{
  return Snippet.Color.hash(into:)(a1, *(unsigned char *)(v1 + 24));
}

uint64_t sub_237187B90()
{
  unsigned __int8 v1 = *(unsigned char *)(v0 + 24);
  sub_237193858();
  Snippet.Color.hash(into:)((uint64_t)v3, v1);
  return sub_237193898();
}

unint64_t sub_237187BF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = Snippet.Color.init(from:)(a1);
  if (!v2)
  {
    *(void *)a2 = v5;
    *(void *)(a2 + 8) = v6;
    *(void *)(a2 + 16) = v7;
    *(unsigned char *)(a2 + 24) = result;
  }
  return result;
}

uint64_t sub_237187C2C(void *a1)
{
  return Snippet.Color.encode(to:)(a1);
}

BOOL sub_237187C50(uint64_t a1, uint64_t a2)
{
  return static Snippet.Color.__derived_struct_equals(_:_:)(*(unsigned char *)(a1 + 24), *(unsigned char *)(a2 + 24), *(double *)a1, *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)a2, *(double *)(a2 + 8), *(double *)(a2 + 16));
}

unint64_t sub_237187C6C()
{
  unint64_t result = qword_2688F1800;
  if (!qword_2688F1800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1800);
  }
  return result;
}

unint64_t sub_237187CB8()
{
  unint64_t result = qword_2688F1808;
  if (!qword_2688F1808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1808);
  }
  return result;
}

unint64_t sub_237187D04()
{
  unint64_t result = qword_2688F1810;
  if (!qword_2688F1810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1810);
  }
  return result;
}

unint64_t sub_237187D50()
{
  unint64_t result = qword_2688F1820;
  if (!qword_2688F1820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1820);
  }
  return result;
}

unint64_t sub_237187D9C()
{
  unint64_t result = qword_2688F1828;
  if (!qword_2688F1828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1828);
  }
  return result;
}

unint64_t sub_237187DEC()
{
  unint64_t result = qword_2688F1830;
  if (!qword_2688F1830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1830);
  }
  return result;
}

unint64_t sub_237187E3C()
{
  unint64_t result = qword_2688F1838;
  if (!qword_2688F1838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1838);
  }
  return result;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s14descr26EA28941C5ColorVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      if (*(unsigned __int8 *)(a1 + 24) <= 2u) {
        int v3 = 2;
      }
      else {
        int v3 = *(unsigned __int8 *)(a1 + 24);
      }
      int v4 = v3 - 3;
      if (*(unsigned __int8 *)(a1 + 24) < 2u) {
        int v2 = -1;
      }
      else {
        int v2 = v4;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s14descr26EA28941C5ColorVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Snippet.Color()
{
  return &type metadata for Snippet.Color;
}

ValueMetadata *type metadata accessor for Snippet.Color.ColorSpace()
{
  return &type metadata for Snippet.Color.ColorSpace;
}

unsigned char *_s14descr26EA28941C5ColorV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x237188020);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s14descr26EA28941C5ColorV10CodingKeysOMa()
{
  return &_s14descr26EA28941C5ColorV10CodingKeysON;
}

unsigned char *_s14descr26EA28941C5ColorV10ColorSpaceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x237188124);
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

ValueMetadata *_s14descr26EA28941C5ColorV10ColorSpaceO10CodingKeysOMa()
{
  return &_s14descr26EA28941C5ColorV10ColorSpaceO10CodingKeysON;
}

ValueMetadata *_s14descr26EA28941C5ColorV10ColorSpaceO19DisplayP3CodingKeysOMa()
{
  return &_s14descr26EA28941C5ColorV10ColorSpaceO19DisplayP3CodingKeysON;
}

ValueMetadata *_s14descr26EA28941C5ColorV10ColorSpaceO14SRGBCodingKeysOMa()
{
  return &_s14descr26EA28941C5ColorV10ColorSpaceO14SRGBCodingKeysON;
}

unint64_t sub_237188180()
{
  unint64_t result = qword_2688F1840;
  if (!qword_2688F1840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1840);
  }
  return result;
}

unint64_t sub_2371881D0()
{
  unint64_t result = qword_2688F1848;
  if (!qword_2688F1848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1848);
  }
  return result;
}

unint64_t sub_237188220()
{
  unint64_t result = qword_2688F1850;
  if (!qword_2688F1850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1850);
  }
  return result;
}

unint64_t sub_237188270()
{
  unint64_t result = qword_2688F1858;
  if (!qword_2688F1858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1858);
  }
  return result;
}

unint64_t sub_2371882C0()
{
  unint64_t result = qword_2688F1860;
  if (!qword_2688F1860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1860);
  }
  return result;
}

unint64_t sub_237188310()
{
  unint64_t result = qword_2688F1868;
  if (!qword_2688F1868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1868);
  }
  return result;
}

unint64_t sub_237188360()
{
  unint64_t result = qword_2688F1870;
  if (!qword_2688F1870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1870);
  }
  return result;
}

unint64_t sub_2371883B0()
{
  unint64_t result = qword_2688F1878;
  if (!qword_2688F1878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1878);
  }
  return result;
}

unint64_t sub_237188400()
{
  unint64_t result = qword_2688F1880;
  if (!qword_2688F1880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1880);
  }
  return result;
}

unint64_t sub_237188450()
{
  unint64_t result = qword_2688F1888;
  if (!qword_2688F1888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1888);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_43()
{
  return sub_2371936B8();
}

uint64_t OUTLINED_FUNCTION_2_43()
{
  return sub_237193748();
}

uint64_t sub_2371884F4@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = a1;
  int v3 = a2;
  sub_2370652F4(a1, (uint64_t)(a2 + 1));
  uint64_t v4 = sub_2371620CC();
  swift_bridgeObjectRelease();
  int64_t v5 = *(void *)(v4 + 16);
  if (v5 != 1)
  {
    if (qword_2688ED610 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_237192E08();
    __swift_project_value_buffer(v21, (uint64_t)qword_268907358);
    v22 = sub_237192DE8();
    os_log_type_t v23 = sub_2371932A8();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_237060000, v22, v23, "[ParticipantDisambiguationContainer] Disambiguation items contains more than one unique person, doing person disambiguation", v24, 2u);
      MEMORY[0x237E18ED0](v24, -1, -1);
    }

    uint64_t v25 = MEMORY[0x263F8EE78];
    if (v5)
    {
      v43 = v3;
      uint64_t v46 = v2;
      uint64_t v48 = MEMORY[0x263F8EE78];
      sub_23715E100(0, v5, 0);
      uint64_t v25 = v48;
      v26 = (uint64_t *)(v4 + 48);
      do
      {
        uint64_t v27 = *(v26 - 1);
        uint64_t v28 = *v26;
        unint64_t v29 = *(void *)(v48 + 16);
        unint64_t v30 = *(void *)(v48 + 24);
        id v31 = (id)*(v26 - 2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v29 >= v30 >> 1) {
          OUTLINED_FUNCTION_0_19();
        }
        *(void *)(v48 + 16) = v29 + 1;
        uint64_t v32 = v48 + 32 * v29;
        *(void *)(v32 + 32) = v31;
        *(void *)(v32 + 40) = v27;
        *(void *)(v32 + 48) = v28;
        *(unsigned char *)(v32 + 56) = 0;
        v26 += 3;
        --v5;
      }
      while (v5);
      int v3 = v43;
      uint64_t v2 = v46;
    }
LABEL_48:
    __swift_destroy_boxed_opaque_existential_1(v2);
    uint64_t result = swift_bridgeObjectRelease();
    *int v3 = v25;
    return result;
  }
  unint64_t v6 = *(void *)(v4 + 40);
  unint64_t v7 = *(void *)(v4 + 48);
  id v8 = *(id *)(v4 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_2688ED610 != -1) {
    swift_once();
  }
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v10 = sub_237192E08();
  __swift_project_value_buffer(v10, (uint64_t)qword_268907358);
  id v11 = v8;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v12 = v11;
  unint64_t v13 = sub_237192DE8();
  os_log_type_t v14 = sub_2371932A8();
  uint64_t v45 = v2;
  unint64_t v41 = v7;
  if (!os_log_type_enabled((os_log_t)v13, v14))
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    goto LABEL_35;
  }
  v40 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v40 = 134217984;
  uint64_t v47 = v9;
  os_log_type_t v42 = v14;
  if (!(v6 >> 62))
  {
    uint64_t v15 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v15) {
      goto LABEL_7;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2371935D8();
  uint64_t v15 = result;
  if (!result) {
    goto LABEL_30;
  }
LABEL_7:
  if (v15 >= 1)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v18 = (id)MEMORY[0x237E183C0](i, v6);
      }
      else {
        id v18 = *(id *)(v6 + 8 * i + 32);
      }
      v19 = v18;
      if (objc_msgSend(v18, sel_type, v40) == (id)1)
      {
        sub_237193518();
        sub_237193558();
        sub_237193568();
        sub_237193528();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = v47;
LABEL_31:
    unint64_t v7 = v41;
    uint64_t v9 = MEMORY[0x263F8EE78];
    if (v20 < 0 || (v20 & 0x4000000000000000) != 0) {
      goto LABEL_50;
    }

    while (1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_237193358();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_237060000, (os_log_t)v13, v42, "[ParticipantDisambiguationContainer] Disambiguation items contains only one person with %ld handles, doing handle disambiguation", v40, 0xCu);
      MEMORY[0x237E18ED0](v40, -1, -1);

LABEL_35:
      unint64_t v33 = sub_237162A58((uint64_t)v12, v6, v7);
      unint64_t v13 = v33;
      if (v33 >> 62)
      {
        uint64_t v34 = sub_2371935D8();
        if (!v34)
        {
LABEL_47:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          uint64_t v25 = MEMORY[0x263F8EE78];
          goto LABEL_48;
        }
      }
      else
      {
        uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v34) {
          goto LABEL_47;
        }
      }
      sub_23715E100(0, v34 & ~(v34 >> 63), 0);
      if ((v34 & 0x8000000000000000) == 0) {
        break;
      }
      __break(1u);
LABEL_50:
      swift_bridgeObjectRetain();
      sub_2371935D8();

      swift_release();
    }
    v44 = v3;
    uint64_t v35 = 0;
    uint64_t v25 = v9;
    do
    {
      if ((v13 & 0xC000000000000001) != 0) {
        v36 = (objc_class *)MEMORY[0x237E183C0](v35, v13);
      }
      else {
        v36 = (objc_class *)*(id *)(v13 + 8 * v35 + 32);
      }
      v37 = v36;
      unint64_t v38 = *(void *)(v9 + 16);
      if (v38 >= *(void *)(v9 + 24) >> 1) {
        OUTLINED_FUNCTION_0_19();
      }
      *(void *)(v9 + 16) = v38 + 1;
      uint64_t v39 = v9 + 32 * v38;
      *(void *)(v39 + 40) = 0;
      *(void *)(v39 + 48) = 0;
      ++v35;
      *(void *)(v39 + 32) = v37;
      *(unsigned char *)(v39 + 56) = 1;
    }
    while (v34 != v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    int v3 = v44;
    uint64_t v2 = v45;
    goto LABEL_48;
  }
  __break(1u);
  return result;
}

uint64_t sub_237188ACC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 16);
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain_n();
  int v3 = (unsigned char *)(v1 + 56);
  uint64_t v4 = MEMORY[0x263F8EE78];
  do
  {
    if ((*v3 & 1) == 0)
    {
      uint64_t v6 = *((void *)v3 - 2);
      uint64_t v5 = *((void *)v3 - 1);
      id v7 = *((id *)v3 - 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2370E470C(0, *(void *)(v4 + 16) + 1, 1, v4);
        uint64_t v4 = v11;
      }
      unint64_t v9 = *(void *)(v4 + 16);
      unint64_t v8 = *(void *)(v4 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_2370E470C(v8 > 1, v9 + 1, 1, v4);
        uint64_t v4 = v12;
      }
      *(void *)(v4 + 16) = v9 + 1;
      uint64_t v10 = (void *)(v4 + 24 * v9);
      v10[4] = v7;
      v10[5] = v6;
      v10[6] = v5;
    }
    v3 += 32;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease_n();
  return v4;
}

uint64_t sub_237188BF0()
{
  uint64_t v1 = *v0;
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(*v0 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain_n();
    int v3 = (id *)(v1 + 56);
    do
    {
      if (*(unsigned char *)v3 == 1)
      {
        id v4 = *(v3 - 3);
        MEMORY[0x237E18000]();
        if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_237193158();
        }
        sub_237193188();
        sub_237193148();
      }
      else
      {
        uint64_t v5 = (void *)OUTLINED_FUNCTION_1_44();
        sub_237188E0C(v5, v6, v7, v8);
        unint64_t v9 = (void *)OUTLINED_FUNCTION_1_44();
        sub_237188E64(v9, v10, v11, v12);
      }
      v3 += 4;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    uint64_t v13 = v15;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v13;
}

BOOL sub_237188D08()
{
  uint64_t v1 = sub_237190908();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1, v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 8), *(void *)(v0 + 32));
  sub_2371908F8();
  char v6 = sub_2371904D8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return (v6 & 1) == 0;
}

uint64_t sub_237188E00()
{
  return swift_bridgeObjectRetain();
}

id sub_237188E0C(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    return a1;
  }
  else
  {
    id v6 = a1;
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
}

void sub_237188E64(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

void destroy for ParticipantDisambiguationContainer.ItemType(uint64_t a1)
{
}

uint64_t initializeWithCopy for ParticipantDisambiguationContainer.ItemType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_237188E0C(*(void **)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ParticipantDisambiguationContainer.ItemType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_237188E0C(*(void **)a2, v4, v5, v6);
  uint64_t v7 = *(void **)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_237188E64(v7, v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ParticipantDisambiguationContainer.ItemType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_237188E64(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParticipantDisambiguationContainer.ItemType(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 25))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
      if (v3 <= 1) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParticipantDisambiguationContainer.ItemType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_237189084(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_23718908C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ParticipantDisambiguationContainer.ItemType()
{
  return &type metadata for ParticipantDisambiguationContainer.ItemType;
}

uint64_t destroy for ParticipantDisambiguationContainer(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t initializeWithCopy for ParticipantDisambiguationContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = a2 + 8;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = v4;
  uint64_t v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  swift_bridgeObjectRetain();
  v6(a1 + 8, v3, v5);
  return a1;
}

void *assignWithCopy for ParticipantDisambiguationContainer(void *a1, void *a2)
{
  uint64_t v3 = a2 + 1;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, v3);
  return a1;
}

uint64_t assignWithTake for ParticipantDisambiguationContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for ParticipantDisambiguationContainer()
{
  return &type metadata for ParticipantDisambiguationContainer;
}

char *OUTLINED_FUNCTION_0_19()
{
  if (!v1 & v0) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 0;
  }
  return sub_23715E100((char *)v4, v2, 1);
}

uint64_t OUTLINED_FUNCTION_1_44()
{
  return v0;
}

uint64_t *sub_237189260(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_23718FC28();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void sub_237189330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23718FC28();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_2371893A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23718FC28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t sub_237189424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23718FC28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t sub_2371894AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23718FC28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_237189528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23718FC28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t sub_2371895AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2371895C0);
}

uint64_t sub_2371895C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23718FC28();
  OUTLINED_FUNCTION_1_8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_23718964C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_237189660);
}

void sub_237189660(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_23718FC28();
  OUTLINED_FUNCTION_1_8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for StringLocalizer()
{
  uint64_t result = qword_2688F1898;
  if (!qword_2688F1898) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_237189730()
{
  uint64_t result = sub_23718FC28();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for StringLocalizingError()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for StringLocalizingError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for StringLocalizingError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for StringLocalizingError(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StringLocalizingError(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StringLocalizingError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StringLocalizingError()
{
  return &type metadata for StringLocalizingError;
}

ValueMetadata *type metadata accessor for CommonNLContextProvider()
{
  return &type metadata for CommonNLContextProvider;
}

uint64_t sub_2371899F8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_237189A54(a1, WitnessTable);
}

uint64_t sub_237189A54(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a2 + 32))();
  if (qword_2688ED708 != -1) {
    swift_once();
  }
  sub_237191048();
  return sub_237190618();
}

uint64_t sub_237189AF8(char a1)
{
  char v11 = a1 & 1;
  sub_23718A6B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688EF760);
  *(_OWORD *)(OUTLINED_FUNCTION_20_15() + 16) = xmmword_2371951E0;
  if (qword_2688ED6C8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2371097A8();
  OUTLINED_FUNCTION_16_21();
  OUTLINED_FUNCTION_15_23();
  unint64_t v1 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_43_1(v1, (__n128)xmmword_237198290);
  sub_2370ADE74();
  OUTLINED_FUNCTION_1_45();
  OUTLINED_FUNCTION_14_17();
  unint64_t v12 = sub_23715B484(2);
  unint64_t v15 = v2;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  sub_237193058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[2].n128_u64[0] = v12;
  v1[2].n128_u64[1] = v15;
  sub_237192FD8();
  OUTLINED_FUNCTION_1_45();
  OUTLINED_FUNCTION_9_24();
  unint64_t v13 = sub_23715B484(2);
  unint64_t v16 = v3;
  OUTLINED_FUNCTION_2_44();
  OUTLINED_FUNCTION_22_19();
  sub_237193058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[3].n128_u64[0] = v13;
  v1[3].n128_u64[1] = v16;
  sub_237192FD8();
  OUTLINED_FUNCTION_1_45();
  OUTLINED_FUNCTION_17_22();
  unint64_t v14 = sub_23715B484(2);
  unint64_t v17 = v4;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  sub_237193058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[4].n128_u64[0] = v14;
  v1[4].n128_u64[1] = v17;
  sub_237190818();
  sub_237104AE0(v11);
  if (!v18) {
    return sub_237190798();
  }
  sub_237190848();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_11_2();
  return v9(v5, v6, v7, v8);
}

uint64_t sub_237189DCC()
{
  sub_23718A6B8();
  uint64_t v1 = OUTLINED_FUNCTION_6_35();
  v2(v1);
  sub_237190828();
  uint64_t v3 = OUTLINED_FUNCTION_7_29();
  uint64_t result = v4(v3);
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688EFFA8);
    uint64_t v6 = OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_1_5(v6);
    uint64_t v7 = (__n128 *)OUTLINED_FUNCTION_12_26();
    OUTLINED_FUNCTION_23_18(v7, (__n128)xmmword_2371951E0);
    if (v0)
    {
      v7[1].n128_u64[0] = 0;
      swift_release();
      swift_release();
      sub_237190848();
      OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_11_2();
      return v8();
    }
    else
    {
      sub_237190798();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_237189EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_23718A6B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688EF760);
  *(_OWORD *)(OUTLINED_FUNCTION_20_15() + 16) = xmmword_2371951E0;
  if (qword_2688ED6C8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2371097A8();
  OUTLINED_FUNCTION_16_21();
  OUTLINED_FUNCTION_15_23();
  unint64_t v4 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_43_1(v4, (__n128)xmmword_237198290);
  unint64_t v31 = OUTLINED_FUNCTION_8_29();
  uint64_t v27 = MEMORY[0x263F8D310];
  OUTLINED_FUNCTION_1_45();
  OUTLINED_FUNCTION_14_17();
  unint64_t v42 = sub_23715B484(2);
  uint64_t v45 = v5;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  sub_237193058();
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_21(v6, v7, v8, v9, v10, v11, v12, v13, v27, v31, v31, v31, 1, 2, v34, a1, v38, v39, v40,
    v41,
    v42,
    v45);
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_9_24();
  unint64_t v43 = sub_23715B484(2);
  unint64_t v46 = v14;
  OUTLINED_FUNCTION_2_44();
  OUTLINED_FUNCTION_22_19();
  OUTLINED_FUNCTION_19_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4[3].n128_u64[0] = v43;
  v4[3].n128_u64[1] = v46;
  sub_237192FD8();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_17_22();
  unint64_t v44 = sub_23715B484(2);
  unint64_t v47 = v15;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  OUTLINED_FUNCTION_19_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4[4].n128_u64[0] = v44;
  v4[4].n128_u64[1] = v47;
  sub_237190818();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688EFFA8);
  uint64_t v16 = OUTLINED_FUNCTION_21_17();
  OUTLINED_FUNCTION_1_5(v16);
  uint64_t v17 = OUTLINED_FUNCTION_11_23();
  OUTLINED_FUNCTION_10_23(v17, v18, v19, v20, v21, v22, v23, v24, v28, v29, v30, v32, v33, v35, v37);
  if (!v2) {
    return sub_237190798();
  }
  *(void *)(a2 + 16) = 0;
  swift_release();
  sub_237190848();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_11_2();
  return v25();
}

uint64_t sub_23718A134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_23718A6B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688EF760);
  *(_OWORD *)(OUTLINED_FUNCTION_20_15() + 16) = xmmword_2371951E0;
  if (qword_2688ED6C8 != -1) {
    swift_once();
  }
  swift_retain();
  sub_2371097A8();
  OUTLINED_FUNCTION_16_21();
  OUTLINED_FUNCTION_15_23();
  unint64_t v4 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_43_1(v4, (__n128)xmmword_237197BA0);
  unint64_t v32 = OUTLINED_FUNCTION_8_29();
  uint64_t v28 = MEMORY[0x263F8D310];
  OUTLINED_FUNCTION_1_45();
  OUTLINED_FUNCTION_14_17();
  unint64_t v43 = sub_23715B484(2);
  uint64_t v47 = v5;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  sub_237193058();
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_21(v6, v7, v8, v9, v10, v11, v12, v13, v28, v32, v32, v32, 1, 2, v35, a1, v39, v40, v41,
    v42,
    v43,
    v47);
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_9_24();
  unint64_t v44 = sub_23715B484(2);
  unint64_t v48 = v14;
  OUTLINED_FUNCTION_2_44();
  OUTLINED_FUNCTION_22_19();
  OUTLINED_FUNCTION_19_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4[3].n128_u64[0] = v44;
  v4[3].n128_u64[1] = v48;
  sub_237192FD8();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_9_24();
  unint64_t v45 = sub_23715B484(3);
  unint64_t v49 = v15;
  OUTLINED_FUNCTION_2_44();
  OUTLINED_FUNCTION_22_19();
  OUTLINED_FUNCTION_19_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4[4].n128_u64[0] = v45;
  v4[4].n128_u64[1] = v49;
  sub_237192FD8();
  OUTLINED_FUNCTION_0_20();
  OUTLINED_FUNCTION_17_22();
  unint64_t v46 = sub_23715B484(2);
  unint64_t v50 = v16;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  OUTLINED_FUNCTION_19_14();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4[5].n128_u64[0] = v46;
  v4[5].n128_u64[1] = v50;
  sub_237190818();
  sub_2371907B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688EFFA8);
  uint64_t v17 = OUTLINED_FUNCTION_21_17();
  OUTLINED_FUNCTION_1_5(v17);
  uint64_t v18 = OUTLINED_FUNCTION_11_23();
  OUTLINED_FUNCTION_10_23(v18, v19, v20, v21, v22, v23, v24, v25, v29, v30, v31, v33, v34, v36, v38);
  if (!v2) {
    return sub_237190798();
  }
  *(void *)(a2 + 16) = 0;
  swift_release();
  sub_237190848();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_11_2();
  return v26();
}

uint64_t sub_23718A3F8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_237189A54(a1, WitnessTable);
}

uint64_t sub_23718A454()
{
  sub_237190838();
  if (qword_2688ED6C0 != -1) {
    swift_once();
  }
  sub_237190F78();
  sub_237190788();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688EF760);
  uint64_t v1 = (__n128 *)swift_allocObject();
  OUTLINED_FUNCTION_43_1(v1, (__n128)xmmword_2371951E0);
  sub_2370ADE74();
  sub_237193398();
  swift_bridgeObjectRelease();
  unint64_t v15 = sub_23715B484(2);
  unint64_t v16 = v2;
  OUTLINED_FUNCTION_2_44();
  sub_237192FD8();
  sub_237193058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[2].n128_u64[0] = v15;
  v1[2].n128_u64[1] = v16;
  sub_2371907D8();
  swift_retain();
  sub_237109790();
  swift_release();
  sub_237190808();
  uint64_t v3 = OUTLINED_FUNCTION_6_35();
  v4(v3);
  sub_2371907E8();
  uint64_t v5 = OUTLINED_FUNCTION_7_29();
  uint64_t result = v6(v5);
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688EFFA8);
    uint64_t v8 = OUTLINED_FUNCTION_21_17();
    OUTLINED_FUNCTION_1_5(v8);
    uint64_t v9 = (__n128 *)OUTLINED_FUNCTION_12_26();
    OUTLINED_FUNCTION_23_18(v9, (__n128)xmmword_2371951E0);
    if (v0)
    {
      v9[1].n128_u64[0] = 0;
      swift_release();
      swift_release();
      sub_237190848();
      OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_11_2();
      return v14(v10, v11, v12, v13);
    }
    else
    {
      sub_237190798();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_23718A6B8()
{
  if (qword_2688ED6C0 != -1) {
    swift_once();
  }
  sub_237190F78();
  sub_237190788();
  swift_retain();
  sub_237109790();
  swift_release();
  sub_2371907F8();
  return sub_2371907B8();
}

uint64_t OUTLINED_FUNCTION_0_20()
{
  return sub_237193398();
}

uint64_t OUTLINED_FUNCTION_1_45()
{
  return sub_237193398();
}

uint64_t OUTLINED_FUNCTION_2_44()
{
  return sub_237193058();
}

uint64_t OUTLINED_FUNCTION_6_35()
{
  uint64_t v1 = v0[3];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_7_29()
{
  uint64_t v1 = v0[3];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return v1;
}

unint64_t OUTLINED_FUNCTION_8_29()
{
  return sub_2370ADE74();
}

uint64_t OUTLINED_FUNCTION_9_24()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13, uint64_t a14, uint64_t a15)
{
  *(_OWORD *)(a1 + 16) = a13;
  return sub_23717A3A4(a15);
}

uint64_t OUTLINED_FUNCTION_11_23()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_12_26()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_23()
{
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  return sub_237190828();
}

uint64_t OUTLINED_FUNCTION_16_21()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_17_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  *(void *)(v22 + 32) = a21;
  *(void *)(v22 + 40) = a22;
  return sub_237192FD8();
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  return sub_237193058();
}

uint64_t OUTLINED_FUNCTION_20_15()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_17()
{
  return sub_237190ED8();
}

uint64_t OUTLINED_FUNCTION_22_19()
{
  return sub_237192FD8();
}

uint64_t OUTLINED_FUNCTION_23_18(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_23717A240();
}

id sub_23718AA54(double a1, double a2)
{
  id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v5 = sub_23718AB40();
  uint64_t v7 = v6;
  id v8 = v4;
  sub_23718AB58(v5, v7, v8);
  id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a1);
  objc_msgSend(v8, sel_setMaxAge_, v9);

  id v10 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, a2);
  objc_msgSend(v8, sel_setSearchTimeout_, v10);

  return v8;
}

uint64_t sub_23718AB40()
{
  return sub_237192FA8();
}

void sub_23718AB58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_237192F98();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setDesiredAccuracy_, v4);
}

unint64_t _INPBTargetEventUnsupportedReason.description.getter(int a1)
{
  unint64_t v1 = 0xD000000000000020;
  if (a1 != 2) {
    unint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 0xD000000000000016;
  }
  else {
    return v1;
  }
}

unint64_t _INPBParticipantUnsupportedReason.description.getter(int a1)
{
  unint64_t v1 = 0xD000000000000015;
  if (a1 != 2) {
    unint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 0xD000000000000013;
  }
  else {
    return v1;
  }
}

unint64_t sub_23718AC54()
{
  return _INPBTargetEventUnsupportedReason.description.getter(*v0);
}

unint64_t sub_23718AC5C()
{
  return _INPBParticipantUnsupportedReason.description.getter(*v0);
}

uint64_t _s20HandleIntentStrategyVwxx_1(id *a1)
{
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 2));
}

uint64_t _s20HandleIntentStrategyVwcp_1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a2 + 16;
  long long v7 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v7;
  uint64_t v8 = v7;
  id v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  id v10 = v3;
  swift_retain();
  v9(v5, v6, v8);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwca_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  return a1;
}

uint64_t _s20HandleIntentStrategyVwta_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

ValueMetadata *_s20HandleIntentStrategyVMa_2()
{
  return &_s20HandleIntentStrategyVN_2;
}

uint64_t sub_23718AE18()
{
  OUTLINED_FUNCTION_22();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  uint64_t v4 = sub_237190468();
  v1[5] = v4;
  OUTLINED_FUNCTION_1_5(v4);
  v1[6] = v5;
  v1[7] = OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_6_0();
  return MEMORY[0x270FA2498](v6, v7, v8);
}

uint64_t sub_23718AEA8()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void **)(v0 + 24);
  uint64_t v5 = **(void ***)(v0 + 32);
  sub_23713C1BC();
  swift_retain();
  id v6 = v5;
  id v7 = v4;
  sub_237190458();
  sub_237190488();
  uint64_t v8 = sub_237190478();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  id v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v8);
}

uint64_t sub_23718AF9C()
{
  OUTLINED_FUNCTION_22();
  v1[7] = v2;
  v1[8] = v0;
  uint64_t v3 = sub_237190588();
  v1[9] = v3;
  OUTLINED_FUNCTION_1_5(v3);
  v1[10] = v4;
  v1[11] = OUTLINED_FUNCTION_3_7();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688F1900);
  OUTLINED_FUNCTION_5_2(v5);
  v1[12] = OUTLINED_FUNCTION_3_7();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EEE60);
  OUTLINED_FUNCTION_5_2(v6);
  v1[13] = OUTLINED_FUNCTION_3_7();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688F1910);
  OUTLINED_FUNCTION_5_2(v7);
  v1[14] = OUTLINED_FUNCTION_3_7();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EEE70);
  OUTLINED_FUNCTION_5_2(v8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  OUTLINED_FUNCTION_6_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_23718B0D0()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  sub_2370652F4(*(void *)(v0 + 64) + 16, v0 + 16);
  long long v3 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 136) = v3;
  *(void *)(v0 + 152) = __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v3);
  uint64_t v4 = type metadata accessor for Snippet();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v4);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_23718B1CC;
  return sub_2370FDA74();
}

uint64_t sub_23718B1CC(uint64_t a1)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  uint64_t v6 = *v2;
  OUTLINED_FUNCTION_6();
  *uint64_t v7 = v6;
  v5[21] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v8 = v5[16];
    sub_237069DAC(v5[15], (uint64_t *)&unk_2688EEE70);
    sub_237069DAC(v8, (uint64_t *)&unk_2688EEE70);
  }
  else
  {
    v5[22] = a1;
  }
  OUTLINED_FUNCTION_6_0();
  return MEMORY[0x270FA2498](v9, v10, v11);
}

uint64_t sub_23718B2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10, __int16 a11, long long a12, uint64_t a13, uint64_t a14)
{
  uint64_t v16 = v14[13];
  uint64_t v15 = v14[14];
  uint64_t v17 = v14[12];
  uint64_t v18 = sub_237190848();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v18);
  uint64_t v19 = sub_2371927B8();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v19);
  uint64_t v20 = sub_237190608();
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v20);
  sub_23717C4EC();
  sub_237082540();
  uint64_t v21 = (void *)swift_task_alloc();
  v14[23] = v21;
  *uint64_t v21 = v14;
  v21[1] = sub_23718B448;
  uint64_t v22 = v14[22];
  uint64_t v23 = v14[16];
  uint64_t v25 = v14[14];
  uint64_t v24 = v14[15];
  uint64_t v26 = v14[11];
  uint64_t v27 = v14[7];
  return sub_2370790AC(v27, v23, v24, v22, 0, 0, v25, v26, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_23718B448()
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = (void *)v1[22];
  uint64_t v3 = v1[16];
  uint64_t v4 = v1[15];
  uint64_t v5 = v1[14];
  uint64_t v6 = v1[13];
  uint64_t v7 = v1[12];
  uint64_t v8 = v1[11];
  uint64_t v9 = v1[10];
  uint64_t v10 = v1[9];
  uint64_t v11 = *v0;
  OUTLINED_FUNCTION_6();
  *uint64_t v12 = v11;
  swift_task_dealloc();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  sub_237069DAC(v7, (uint64_t *)&unk_2688F1900);
  sub_237069DAC(v6, (uint64_t *)&unk_2688EEE60);
  sub_237069DAC(v5, (uint64_t *)&unk_2688F1910);
  sub_237069DAC(v4, (uint64_t *)&unk_2688EEE70);
  sub_237069DAC(v3, (uint64_t *)&unk_2688EEE70);
  OUTLINED_FUNCTION_6_0();
  return MEMORY[0x270FA2498](v13, v14, v15);
}

uint64_t sub_23718B654()
{
  OUTLINED_FUNCTION_17_14();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23718B6EC()
{
  OUTLINED_FUNCTION_17_14();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_23718B784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23706A2E4;
  return MEMORY[0x270F66378](a1, a2, a3, a4);
}

uint64_t sub_23718B848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23706A2E4;
  return MEMORY[0x270F66380](a1, a2, a3, a4);
}

uint64_t sub_23718B90C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23706A2E4;
  return MEMORY[0x270F66358](a1, a2, a3, a4);
}

uint64_t sub_23718B9D0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_23706A2E4;
  return sub_23718AF9C();
}

uint64_t sub_23718BA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23706A2E4;
  return MEMORY[0x270F66370](a1, a2, a3, a4);
}

uint64_t sub_23718BB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23706A2E4;
  return MEMORY[0x270F66368](a1, a2, a3, a4);
}

uint64_t sub_23718BBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_23706A00C;
  return MEMORY[0x270F66348](a1, a2, a3, a4);
}

uint64_t sub_23718BCB4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_23706C174;
  return sub_23718AE18();
}

unint64_t sub_23718BD5C()
{
  unint64_t result = qword_2688F18B8[0];
  if (!qword_2688F18B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2688F18B8);
  }
  return result;
}

uint64_t sub_23718BDA8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_identifier;
  uint64_t v2 = sub_237192A58();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  __swift_storeEnumTagSinglePayload(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_title, 1, 1, v2);
  *(void *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_dateTimeRange) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_recurrence) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_location) = 0;
  *(void *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_participants) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_isAllDay) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_isBirthday) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_wasPreviouslyRead) = 0;
  *(unsigned char *)(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_startAndEndEqual) = 0;
  return v0;
}

uint64_t sub_23718BE80(uint64_t a1)
{
  return sub_23718BEA4(a1, &OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_dateTimeRange);
}

uint64_t sub_23718BE8C(uint64_t a1)
{
  return sub_23718BEA4(a1, &OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_recurrence);
}

uint64_t sub_23718BE98(uint64_t a1)
{
  return sub_23718BEA4(a1, &OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_location);
}

uint64_t sub_23718BEA4(uint64_t a1, void *a2)
{
  *(void *)(v2 + *a2) = a1;
  swift_retain();
  swift_release();
  return swift_retain();
}

uint64_t sub_23718BEEC(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_participants) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t sub_23718BF38()
{
  sub_23709E590(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_identifier);
  sub_23709E590(v0 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_title);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23718BFB0()
{
  return sub_23718CA58((void (*)(void))sub_23718BF38);
}

unint64_t sub_23718BFC8()
{
  return 0xD000000000000015;
}

uint64_t sub_23718BFE4(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EEB00);
  MEMORY[0x270FA5388](v3 - 8, v4);
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = v6 - v5;
  *(void *)(v1 + 16) = 0;
  uint64_t v8 = a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_identifier;
  swift_beginAccess();
  sub_2370DC268(v8, v7);
  sub_2370DC200(v7, v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_identifier);
  uint64_t v9 = a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_title;
  swift_beginAccess();
  sub_2370DC268(v9, v7);
  sub_2370DC200(v7, v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_title);
  *(void *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_dateTimeRange) = *(void *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_dateTimeRange);
  *(void *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_recurrence) = *(void *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_recurrence);
  *(void *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_location) = *(void *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_location);
  *(void *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_participants) = *(void *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_participants);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_isAllDay) = *(unsigned char *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_isAllDay);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_isBirthday) = *(unsigned char *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_isBirthday);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_wasPreviouslyRead) = *(unsigned char *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_wasPreviouslyRead);
  char v10 = *(unsigned char *)(a1 + OBJC_IVAR____TtCC19SiriCalendarIntents20CalendarEventConcept7Builder_startAndEndEqual);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_startAndEndEqual) = v10;
  return v1;
}

uint64_t sub_23718C1C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EEB00);
  uint64_t v9 = MEMORY[0x270FA5388](v7 - 8, v8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12);
  uint64_t v14 = (char *)&v33 - v13;
  BOOL v15 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v15 || (OUTLINED_FUNCTION_3_8() & 1) != 0)
  {
    sub_2370DC268(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_identifier, (uint64_t)v14);
    uint64_t v16 = sub_237192A58();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v16) == 1)
    {
      uint64_t v17 = (uint64_t)v14;
LABEL_8:
      uint64_t result = sub_23709E590(v17);
LABEL_9:
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return result;
    }
    *(void *)(a3 + 24) = v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a3);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(boxed_opaque_existential_1, v14, v16);
  }
  else
  {
    if (a1 != 0x656C746974 || a2 != 0xE500000000000000)
    {
      uint64_t result = OUTLINED_FUNCTION_3_8();
      if ((result & 1) == 0)
      {
        BOOL v23 = a1 == 0x656D695465746164 && a2 == 0xED000065676E6152;
        if (v23 || (uint64_t result = OUTLINED_FUNCTION_3_8(), (result & 1) != 0))
        {
          if (!*(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_dateTimeRange)) {
            goto LABEL_9;
          }
          uint64_t v24 = sub_237192828();
        }
        else
        {
          BOOL v25 = a1 == 0x6E65727275636572 && a2 == 0xEA00000000006563;
          if (v25 || (uint64_t result = OUTLINED_FUNCTION_3_8(), (result & 1) != 0))
          {
            if (!*(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_recurrence)) {
              goto LABEL_9;
            }
            uint64_t v24 = type metadata accessor for CalendarEventRecurrence();
          }
          else
          {
            if (a1 != 0x6E6F697461636F6CLL || a2 != 0xE800000000000000)
            {
              uint64_t result = OUTLINED_FUNCTION_3_8();
              if ((result & 1) == 0)
              {
                BOOL v27 = a1 == 0x7069636974726170 && a2 == 0xEC00000073746E61;
                if (v27 || (uint64_t result = OUTLINED_FUNCTION_3_8(), (result & 1) != 0))
                {
                  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1970);
                  OUTLINED_FUNCTION_21_18(v28);
                  return swift_bridgeObjectRetain();
                }
                else
                {
                  BOOL v29 = a1 == 0x7961446C6C417369 && a2 == 0xE800000000000000;
                  if (v29 || (uint64_t result = OUTLINED_FUNCTION_3_8(), (result & 1) != 0))
                  {
                    uint64_t v30 = OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_isAllDay;
                  }
                  else
                  {
                    BOOL v32 = a1 == 0x6468747269427369 && a2 == 0xEA00000000007961;
                    if (v32 || (uint64_t result = OUTLINED_FUNCTION_3_8(), (result & 1) != 0))
                    {
                      uint64_t v30 = OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_isBirthday;
                    }
                    else if (a1 == 0xD000000000000011 && a2 == 0x80000002371A1110 {
                           || (uint64_t result = OUTLINED_FUNCTION_3_8(), (result & 1) != 0))
                    }
                    {
                      uint64_t v30 = OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_wasPreviouslyRead;
                    }
                    else
                    {
                      if (a1 != 0xD000000000000010 || a2 != 0x80000002371A1130)
                      {
                        uint64_t result = OUTLINED_FUNCTION_3_8();
                        if ((result & 1) == 0) {
                          goto LABEL_9;
                        }
                      }
                      uint64_t v30 = OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_startAndEndEqual;
                    }
                  }
                  char v31 = *(unsigned char *)(v3 + v30);
                  *(void *)(a3 + 24) = MEMORY[0x263F8D4F8];
                  *(unsigned char *)a3 = v31;
                }
                return result;
              }
            }
            if (!*(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_location)) {
              goto LABEL_9;
            }
            uint64_t v24 = sub_237192A08();
          }
        }
        OUTLINED_FUNCTION_21_18(v24);
        return swift_retain();
      }
    }
    sub_2370DC268(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_title, (uint64_t)v11);
    uint64_t v21 = sub_237192A58();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v21) == 1)
    {
      uint64_t v17 = (uint64_t)v11;
      goto LABEL_8;
    }
    *(void *)(a3 + 24) = v21;
    uint64_t v22 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a3);
    return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v22, v11, v21);
  }
}

uint64_t sub_23718C6F4()
{
  unint64_t v0 = sub_237193628();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA) {
    return 10;
  }
  else {
    return v0;
  }
}

void sub_23718C744()
{
  OUTLINED_FUNCTION_15_24();
  switch(v0)
  {
    case 1:
      OUTLINED_FUNCTION_14_18();
      break;
    case 2:
      OUTLINED_FUNCTION_7_30();
      break;
    case 3:
      OUTLINED_FUNCTION_10_24();
      break;
    case 4:
      OUTLINED_FUNCTION_13_24();
      break;
    case 5:
      OUTLINED_FUNCTION_8_30();
      break;
    case 6:
      OUTLINED_FUNCTION_12_27();
      break;
    case 7:
      OUTLINED_FUNCTION_11_24();
      break;
    case 8:
      OUTLINED_FUNCTION_7_5();
      break;
    default:
      return;
  }
}

void sub_23718C7E8()
{
  OUTLINED_FUNCTION_15_24();
  switch(v0)
  {
    case 1:
      OUTLINED_FUNCTION_14_18();
      break;
    case 2:
      OUTLINED_FUNCTION_7_30();
      break;
    case 3:
      OUTLINED_FUNCTION_10_24();
      break;
    case 4:
      OUTLINED_FUNCTION_13_24();
      break;
    case 5:
      OUTLINED_FUNCTION_8_30();
      break;
    case 6:
      OUTLINED_FUNCTION_12_27();
      break;
    case 7:
      OUTLINED_FUNCTION_11_24();
      break;
    case 8:
      OUTLINED_FUNCTION_7_5();
      break;
    default:
      return;
  }
}

uint64_t sub_23718C88C()
{
  return sub_237126E80();
}

uint64_t sub_23718C898()
{
  return sub_2371557C0();
}

uint64_t sub_23718C8A0(uint64_t a1)
{
  return sub_2371280A4(a1, *v1);
}

uint64_t sub_23718C8A8(uint64_t a1)
{
  return sub_2371287C8(a1, *v1);
}

uint64_t sub_23718C8B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23718C6F4();
  *a1 = result;
  return result;
}

void sub_23718C8E0(void *a1@<X8>)
{
  sub_23718C744();
  *a1 = v2;
  a1[1] = v3;
}

void sub_23718C90C()
{
}

uint64_t sub_23718C914@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23718C740();
  *a1 = result;
  return result;
}

void sub_23718C93C(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_23718C948(uint64_t a1)
{
  unint64_t v2 = sub_23718D800();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_23718C984(uint64_t a1)
{
  unint64_t v2 = sub_23718D800();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_23718C9C0()
{
  sub_23709E590(v0 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_identifier);
  sub_23709E590(v0 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_title);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23718CA40()
{
  return sub_23718CA58((void (*)(void))sub_23718C9C0);
}

uint64_t sub_23718CA58(void (*a1)(void))
{
  a1();
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v1 + 52);
  return MEMORY[0x270FA0228](v1, v2, v3);
}

uint64_t sub_23718CAB4()
{
  return type metadata accessor for CalendarEventConcept(0);
}

uint64_t type metadata accessor for CalendarEventConcept(uint64_t a1)
{
  return sub_2370989CC(a1, (uint64_t *)&unk_2688F1928);
}

void sub_23718CADC()
{
  sub_2370DBC80();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_23718CB9C(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1980);
  OUTLINED_FUNCTION_0_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6, v7);
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = v9 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23718D800();
  sub_2371938B8();
  sub_237192A58();
  sub_23718D7B8(&qword_2688EF5F0, MEMORY[0x263F6D0A0]);
  OUTLINED_FUNCTION_16_22();
  if (!v1)
  {
    OUTLINED_FUNCTION_16_22();
    OUTLINED_FUNCTION_22_20(OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_dateTimeRange);
    sub_237192828();
    sub_23718D7B8(&qword_2688F1988, MEMORY[0x263F6CFA0]);
    OUTLINED_FUNCTION_1_46();
    OUTLINED_FUNCTION_22_20(OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_recurrence);
    type metadata accessor for CalendarEventRecurrence();
    sub_23718D7B8(&qword_2688F1340, (void (*)(uint64_t))type metadata accessor for CalendarEventRecurrence);
    OUTLINED_FUNCTION_1_46();
    OUTLINED_FUNCTION_22_20(OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_location);
    sub_237192A08();
    sub_23718D7B8(&qword_2688F0658, MEMORY[0x263F6D030]);
    OUTLINED_FUNCTION_1_46();
    OUTLINED_FUNCTION_22_20(OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_participants);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1970);
    sub_23718D84C(&qword_2688F1990, &qword_2688EF5B8);
    sub_237193748();
    OUTLINED_FUNCTION_3_40(6);
    OUTLINED_FUNCTION_3_40(7);
    OUTLINED_FUNCTION_3_40(8);
    OUTLINED_FUNCTION_3_40(9);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v10, v3);
}

uint64_t sub_23718CF24(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_23718D058(a1);
  return v2;
}

uint64_t sub_23718CF74()
{
  return type metadata accessor for CalendarEventConcept.Builder(0);
}

uint64_t type metadata accessor for CalendarEventConcept.Builder(uint64_t a1)
{
  return sub_2370989CC(a1, (uint64_t *)&unk_2688F1938);
}

void sub_23718CF9C()
{
  sub_2370DBC80();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_23718D058(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EEB00);
  uint64_t v7 = MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7, v10);
  uint64_t v12 = (char *)v24 - v11;
  v24[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1958);
  OUTLINED_FUNCTION_0_0();
  uint64_t v14 = v13;
  MEMORY[0x270FA5388](v15, v16);
  OUTLINED_FUNCTION_1_0();
  *(void *)(v3 + 16) = 0;
  uint64_t v17 = a1[3];
  BOOL v25 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v17);
  sub_23718D800();
  sub_2371938A8();
  if (v2)
  {

    uint64_t v18 = (uint64_t)v25;
    type metadata accessor for CalendarEventConcept(0);
    swift_deallocPartialClassInstance();
    uint64_t v23 = v18;
  }
  else
  {
    v24[0] = v14;
    sub_237192A58();
    LOBYTE(v27) = 0;
    sub_23718D7B8(&qword_2688EF5D8, MEMORY[0x263F6D0A0]);
    OUTLINED_FUNCTION_18_22();
    sub_2370DC200((uint64_t)v12, v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_identifier);
    LOBYTE(v27) = 1;
    OUTLINED_FUNCTION_18_22();
    sub_2370DC200((uint64_t)v9, v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_title);
    sub_237192828();
    char v26 = 2;
    sub_23718D7B8(&qword_2688F1968, MEMORY[0x263F6CFA0]);
    sub_237193678();
    *(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_dateTimeRange) = v27;
    type metadata accessor for CalendarEventRecurrence();
    char v26 = 3;
    sub_23718D7B8(&qword_2688F1338, (void (*)(uint64_t))type metadata accessor for CalendarEventRecurrence);
    OUTLINED_FUNCTION_9_25();
    *(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_recurrence) = v27;
    sub_237192A08();
    char v26 = 4;
    sub_23718D7B8(&qword_2688F0648, MEMORY[0x263F6D030]);
    OUTLINED_FUNCTION_9_25();
    *(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_location) = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1970);
    char v26 = 5;
    sub_23718D84C(&qword_2688F1978, &qword_2688EF5B0);
    sub_2371936B8();
    *(void *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_participants) = v27;
    *(unsigned char *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_isAllDay) = OUTLINED_FUNCTION_2_45(6) & 1;
    *(unsigned char *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_isBirthday) = OUTLINED_FUNCTION_2_45(7) & 1;
    *(unsigned char *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_wasPreviouslyRead) = OUTLINED_FUNCTION_2_45(8) & 1;
    char v20 = OUTLINED_FUNCTION_2_45(9);
    uint64_t v21 = OUTLINED_FUNCTION_4_35();
    v22(v21);
    *(unsigned char *)(v3 + OBJC_IVAR____TtC19SiriCalendarIntents20CalendarEventConcept_startAndEndEqual) = v20 & 1;
    uint64_t v23 = (uint64_t)v25;
  }
  __swift_destroy_boxed_opaque_existential_1(v23);
  return v3;
}

unint64_t sub_23718D694()
{
  return 0xD000000000000015;
}

uint64_t sub_23718D6B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23718C1C8(a1, a2, a3);
}

uint64_t sub_23718D6D8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_23718CF24(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_23718D704(void *a1)
{
  return sub_23718CB9C(a1);
}

uint64_t sub_23718D728()
{
  return sub_23718D7B8(&qword_2688F1948, (void (*)(uint64_t))type metadata accessor for CalendarEventConcept);
}

uint64_t sub_23718D770()
{
  return sub_23718D7B8(&qword_2688F1950, (void (*)(uint64_t))type metadata accessor for CalendarEventConcept);
}

uint64_t sub_23718D7B8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23718D800()
{
  unint64_t result = qword_2688F1960;
  if (!qword_2688F1960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1960);
  }
  return result;
}

uint64_t sub_23718D84C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2688F1970);
    sub_23718D7B8(a2, (void (*)(uint64_t))type metadata accessor for CalendarEventParticipant);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CalendarEventConcept.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x23718D9ACLL);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarEventConcept.CodingKeys()
{
  return &type metadata for CalendarEventConcept.CodingKeys;
}

unint64_t sub_23718D9E8()
{
  unint64_t result = qword_2688F1998;
  if (!qword_2688F1998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F1998);
  }
  return result;
}

unint64_t sub_23718DA38()
{
  unint64_t result = qword_2688F19A0;
  if (!qword_2688F19A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F19A0);
  }
  return result;
}

unint64_t sub_23718DA88()
{
  unint64_t result = qword_2688F19A8;
  if (!qword_2688F19A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2688F19A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_46()
{
  return sub_237193708();
}

uint64_t OUTLINED_FUNCTION_2_45@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return sub_237193698();
}

uint64_t OUTLINED_FUNCTION_3_40@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 72) = a1;
  return sub_237193728();
}

uint64_t OUTLINED_FUNCTION_4_35()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_36()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_30()
{
  return 0x656D695465746164;
}

uint64_t OUTLINED_FUNCTION_8_30()
{
  return 0x7069636974726170;
}

uint64_t OUTLINED_FUNCTION_9_25()
{
  return sub_237193678();
}

uint64_t OUTLINED_FUNCTION_10_24()
{
  return 0x6E65727275636572;
}

uint64_t OUTLINED_FUNCTION_11_24()
{
  return 0x6468747269427369;
}

uint64_t OUTLINED_FUNCTION_12_27()
{
  return 0x7961446C6C417369;
}

uint64_t OUTLINED_FUNCTION_13_24()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t OUTLINED_FUNCTION_14_18()
{
  return 0x656C746974;
}

uint64_t OUTLINED_FUNCTION_15_24()
{
  return 0x696669746E656469;
}

uint64_t OUTLINED_FUNCTION_16_22()
{
  return sub_237193708();
}

uint64_t OUTLINED_FUNCTION_18_22()
{
  return sub_237193678();
}

uint64_t OUTLINED_FUNCTION_21_18(uint64_t a1)
{
  v1[3] = a1;
  void *v1 = v2;
  return v2;
}

void OUTLINED_FUNCTION_22_20(uint64_t a1@<X8>)
{
  *(void *)(v2 - 72) = *(void *)(v1 + a1);
}

uint64_t sub_23718DD0C()
{
  *(void *)&long long v1 = "SiriCalendar";
  *((void *)&v1 + 1) = 12;
  char v2 = 2;
  int v3 = "CarPlaySnippets";
  uint64_t v4 = 15;
  char v5 = 2;
  return sub_237148968(&v1) & 1;
}

uint64_t sub_23718DD64()
{
  return *(void *)v0;
}

uint64_t sub_23718DD70()
{
  return *(void *)(v0 + 24);
}

uint64_t getEnumTagSinglePayload for SiriCalendarFeature(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SiriCalendarFeature(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SiriCalendarFeature()
{
  return &type metadata for SiriCalendarFeature;
}

ValueMetadata *type metadata accessor for SiriCalendarFeatureManager()
{
  return &type metadata for SiriCalendarFeatureManager;
}

uint64_t sub_23718DDF4()
{
  return sub_23718DE0C((SEL *)&selRef_isEventOrganizer);
}

uint64_t sub_23718DE00()
{
  return sub_23718DE0C((SEL *)&selRef_isUser);
}

uint64_t sub_23718DE0C(SEL *a1)
{
  id v2 = [v1 *a1];
  sub_2370F4570();
  char v3 = (void *)sub_2371932D8();
  if (v2)
  {
    id v4 = v2;
    char v5 = sub_2371932F8();
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t sub_23718DE90@<X0>(void **a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v17 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EEB00);
  MEMORY[0x270FA5388](v5 - 8, v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23718FC28();
  MEMORY[0x270FA5388](v9 - 8, v10);
  uint64_t v11 = *a1;
  type metadata accessor for CalendarEventParticipant(0);
  sub_237192958();
  id v12 = objc_msgSend(v11, sel_person);
  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_2371904C8();
  uint64_t v13 = sub_237192948();
  objc_msgSend(v11, sel_status);
  INEventParticipantStatus.description.getter();
  sub_237192FE8();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_237192A58();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v14);
  uint64_t result = sub_2370DB484(v13, (uint64_t)v8);
  *uint64_t v17 = result;
  return result;
}

ValueMetadata *type metadata accessor for FindEvents()
{
  return &type metadata for FindEvents;
}

uint64_t sub_23718E054(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 520) = a2;
  *(void *)(v2 + 400) = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688F19B8);
  *(void *)(v2 + 408) = v3;
  OUTLINED_FUNCTION_1_5(v3);
  *(void *)(v2 + 416) = v4;
  *(void *)(v2 + 424) = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688F1540);
  *(void *)(v2 + 432) = v5;
  OUTLINED_FUNCTION_1_5(v5);
  *(void *)(v2 + 440) = v6;
  *(void *)(v2 + 448) = swift_task_alloc();
  *(void *)(v2 + 456) = swift_task_alloc();
  *(void *)(v2 + 464) = type metadata accessor for TaskParser();
  *(void *)(v2 + 472) = swift_task_alloc();
  sub_237192AC8();
  *(void *)(v2 + 480) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23718E1A0, 0, 0);
}

uint64_t sub_23718E1A0()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 472);
  uint64_t v2 = *(int **)(v0 + 464);
  sub_2371904B8();
  type metadata accessor for CommonCATsSimple();
  sub_237192AB8();
  uint64_t v41 = sub_237192A88();
  *(void *)(v0 + 488) = v41;
  sub_237190CE8();
  uint64_t v40 = v0 + 192;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 192), *(void *)(v0 + 216));
  sub_2371904C8();
  uint64_t v3 = (uint64_t *)(v1 + v2[5]);
  v3[3] = type metadata accessor for CalendarDateTimeResolver();
  v3[4] = (uint64_t)&off_26EA31838;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  boxed_opaque_existential_1[3] = (uint64_t)&type metadata for AceUserLocationProvider;
  boxed_opaque_existential_1[4] = (uint64_t)&off_26EA30718;
  uint64_t v5 = swift_allocObject();
  uint64_t *boxed_opaque_existential_1 = v5;
  sub_237064540(v0 + 352, v5 + 16);
  sub_23718FC18();
  sub_2371921F8();
  uint64_t v6 = (uint64_t *)(v1 + v2[6]);
  uint64_t v7 = type metadata accessor for CalendarContactResolver();
  v6[3] = v7;
  v6[4] = (uint64_t)&off_26EA2EF80;
  *((unsigned char *)__swift_allocate_boxed_opaque_existential_1(v6) + *(int *)(v7 + 20)) = 0;
  sub_237191FE8();
  sub_237192D08();
  uint64_t v8 = sub_237192CF8();
  uint64_t v9 = (uint64_t *)(v1 + v2[7]);
  v9[3] = (uint64_t)&type metadata for CalendarReferenceResolver;
  v9[4] = (uint64_t)&off_26EA31880;
  *uint64_t v9 = v8;
  if (qword_2688ED608 != -1) {
    swift_once();
  }
  uint64_t v35 = *(void *)(v0 + 472);
  uint64_t v34 = *(void *)(v0 + 464);
  uint64_t v36 = *(void *)(v0 + 456);
  uint64_t v37 = *(void *)(v0 + 440);
  uint64_t v38 = *(void *)(v0 + 448);
  uint64_t v39 = *(void *)(v0 + 432);
  uint64_t v10 = *(void **)(v0 + 400);
  uint64_t v32 = qword_268907328;
  uint64_t v12 = v10[3];
  uint64_t v11 = v10[4];
  char v33 = *(unsigned char *)(v0 + 520);
  __swift_project_boxed_opaque_existential_1(v10, v12);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 24);
  swift_retain();
  LOBYTE(v11) = v13(v12, v11);
  sub_2370652F4(v40, v0 + 112);
  uint64_t v15 = v10[3];
  uint64_t v14 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v15);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 32);
  swift_retain();
  uint64_t v17 = v16(v15, v14);
  uint64_t v19 = v18;
  sub_237064540(v0 + 352, v0 + 152);
  id v20 = sub_23718ECA8(v32, v11, v0 + 152, v41, v0 + 112, v17, v19, v33);
  *(void *)(v0 + 496) = v20;
  *(void *)(v0 + 88) = v34;
  *(void *)(v0 + 96) = &off_26EA2E188;
  uint64_t v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 64));
  sub_237064C78(v35, (uint64_t)v21);
  *(void *)(v0 + 104) = v20;
  *(void *)(v0 + 256) = v34;
  *(void *)(v0 + 264) = &off_26EA2E188;
  uint64_t v22 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 232));
  sub_237064C78(v35, (uint64_t)v22);
  sub_2370652F4(v40, v0 + 272);
  v42[3] = type metadata accessor for EventProvider();
  v42[4] = &off_26EA2BF00;
  v42[0] = v32;
  uint64_t v23 = sub_237190878();
  swift_allocObject();
  id v24 = v20;
  swift_retain();
  id v25 = v24;
  uint64_t v26 = sub_237190868();
  v43[3] = v23;
  v43[4] = MEMORY[0x263F6FB30];
  v43[0] = v26;
  type metadata accessor for FindEventsCATsSimple();
  sub_237192AB8();
  uint64_t v27 = sub_237192A88();
  v44[3] = &type metadata for SiriCalendarFeatureManager;
  v44[4] = &off_26EA32880;
  sub_2370652F4((uint64_t)v10, v0 + 312);
  swift_retain();
  sub_237178F68(v25, v0 + 232, v0 + 272, (uint64_t)v42, (uint64_t)v43, v27, v41, (uint64_t)v44, v36, v33, (void *)(v0 + 312));
  sub_23718EEE4(v0 + 64, v0 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v38, v36, v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688F19C0);
  swift_allocObject();
  sub_237190338();
  sub_23718EF40();
  sub_237190688();
  uint64_t v29 = v10[3];
  uint64_t v28 = v10[4];
  __swift_project_boxed_opaque_existential_1(v10, v29);
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 504) = v30;
  *uint64_t v30 = v0;
  v30[1] = sub_23718E6FC;
  return sub_2370908E0(v29, v28);
}

uint64_t sub_23718E6FC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 512) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_23718E7FC, 0, 0);
}

uint64_t sub_23718E7FC()
{
  uint64_t v1 = (void *)v0[64];
  uint64_t v10 = (void *)v0[62];
  uint64_t v12 = v0[57];
  uint64_t v13 = v0[59];
  uint64_t v2 = v0[55];
  uint64_t v3 = v0[53];
  uint64_t v11 = v0[54];
  uint64_t v5 = v0[51];
  uint64_t v4 = v0[52];
  sub_237192AE8();
  sub_237192AD8();
  uint64_t v6 = sub_237190678();
  swift_release();
  v0[49] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2688F0498);
  sub_23711E408();
  uint64_t v7 = sub_2371903B8();

  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v12, v11);
  sub_23718EF8C((uint64_t)(v0 + 8));
  sub_237064E20(v13);
  sub_237064E7C((uint64_t)(v0 + 44));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 24));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v7);
}

uint64_t sub_23718E9D0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23718EA08()
{
  unint64_t v0 = sub_237193628();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

unint64_t sub_23718EA54(char a1)
{
  unint64_t result = 0x7551686372616573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656D695465746164;
      break;
    case 2:
      unint64_t result = 0x6E6F697461636F6CLL;
      break;
    case 3:
      unint64_t result = 0x7069636974726170;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

id sub_23718EB24(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, unsigned char *a9)
{
  v24[3] = type metadata accessor for EventProvider();
  v24[4] = &off_26EA2BF00;
  v24[0] = a1;
  v23[3] = &type metadata for AceUserLocationProvider;
  v23[4] = &off_26EA30718;
  uint64_t v17 = swift_allocObject();
  v23[0] = v17;
  long long v18 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v17 + 32) = v18;
  *(void *)(v17 + 48) = *(void *)(a3 + 32);
  sub_2370652F4((uint64_t)v24, (uint64_t)&a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_eventProvider]);
  a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_ordinalReference] = a2;
  sub_2370652F4((uint64_t)v23, (uint64_t)&a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_locationProvider]);
  *(void *)&a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_commonCats] = a4;
  sub_2370652F4(a5, (uint64_t)&a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_deviceState]);
  uint64_t v19 = &a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_fallbackSearchQuery];
  void *v19 = a6;
  v19[1] = a7;
  a9[OBJC_IVAR____TtCO19SiriCalendarIntents10FindEvents13IntentHandler_intentAction] = a8;
  v22.receiver = a9;
  v22.super_class = (Class)_s13IntentHandlerCMa();
  id v20 = objc_msgSendSuper2(&v22, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v20;
}

id sub_23718ECA8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v16 = type metadata accessor for EventProvider();
  v33[3] = v16;
  v33[4] = &off_26EA2BF00;
  v33[0] = a1;
  char v31 = &type metadata for AceUserLocationProvider;
  uint64_t v32 = &off_26EA30718;
  uint64_t v17 = swift_allocObject();
  v30[0] = v17;
  long long v18 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v17 + 32) = v18;
  *(void *)(v17 + 48) = *(void *)(a3 + 32);
  uint64_t v19 = objc_allocWithZone((Class)_s13IntentHandlerCMa());
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v16);
  MEMORY[0x270FA5388](v20, v20);
  objc_super v22 = (void *)((char *)v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v30, (uint64_t)v31);
  MEMORY[0x270FA5388](v24, v24);
  uint64_t v26 = (char *)v30 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v27 + 16))(v26);
  id v28 = sub_23718EB24(*v22, a2, (uint64_t)v26, a4, a5, a6, a7, a8, v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return v28;
}

uint64_t sub_23718EEE4(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_23718EF40()
{
  unint64_t result = qword_2688F19C8;
  if (!qword_2688F19C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F19C8);
  }
  return result;
}

uint64_t sub_23718EF8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_23718EFE0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688EEA68);
  MEMORY[0x270FA5388](v6 - 8, v7);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_237193018() < 2
    || (sub_237193038(), sub_237193098(), char v10 = sub_237192F28(), swift_bridgeObjectRelease(), (v10 & 1) != 0))
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_23718F2A4(1);
    uint64_t v25 = v11;
    uint64_t v26 = v12;
    uint64_t v27 = v13;
    uint64_t v14 = sub_23718FC28();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v9, a1, v14);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v14);
    sub_23718F484();
    uint64_t v15 = sub_237193378();
    uint64_t v17 = v16;
    sub_2370ADEC0((uint64_t)v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_23718F364(1uLL, a2, a3);
    v23[0] = v15;
    v23[1] = v17;
    uint64_t v24 = v18;
    uint64_t v25 = v19;
    uint64_t v26 = v20;
    uint64_t v27 = v21;
    sub_23718F438();
    swift_bridgeObjectRetain();
    sub_237193048();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v23[0];
  }
  return a2;
}

uint64_t sub_23718F1D4(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_23718F2A4(1);
  uint64_t v4 = sub_237193348();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23718F364(1uLL, a1, a2);
  sub_23718F438();
  swift_bridgeObjectRetain();
  sub_237193048();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23718F2A4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_237193028();
    uint64_t v1 = sub_2371930B8();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

unint64_t sub_23718F364(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0) {
      uint64_t v3 = HIBYTE(a3) & 0xF;
    }
    else {
      uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v4 = 11;
    }
    unint64_t v5 = v4 | (v3 << 16);
    unint64_t result = sub_237193028();
    if (v6) {
      unint64_t result = v5;
    }
    if (4 * v3 >= result >> 14)
    {
      uint64_t v7 = sub_2371930B8();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_23718F438()
{
  unint64_t result = qword_2688F19D0;
  if (!qword_2688F19D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2688F19D0);
  }
  return result;
}

unint64_t sub_23718F484()
{
  unint64_t result = qword_2688F19D8;
  if (!qword_2688F19D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2688F19D8);
  }
  return result;
}

uint64_t sub_23718F4D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = a3;
  v4[4] = v3;
  v4[2] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2688EDC20);
  v4[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_23718F568, 0, 0);
}

uint64_t sub_23718F568()
{
  uint64_t v1 = v0[5];
  uint64_t v9 = v0[3];
  uint64_t v2 = sub_23718FBC8();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  uint64_t v8 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 24) + **(int **)(v9 + 24));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_23718F678;
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return v8(0, v4, v5, v6);
}

uint64_t sub_23718F678(uint64_t a1)
{
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  sub_237070874(v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v4(a1);
}

uint64_t sub_23718F798()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_23718F7A8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_23718F7B8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_23718F7C8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_23718F7D8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_23718F7E8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_23718F7F8()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_23718F808()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23718F818()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_23718F828()
{
  return MEMORY[0x270EEE310]();
}

uint64_t sub_23718F838()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_23718F848()
{
  return MEMORY[0x270EEE438]();
}

uint64_t sub_23718F858()
{
  return MEMORY[0x270EEE450]();
}

uint64_t sub_23718F868()
{
  return MEMORY[0x270EEE6C0]();
}

uint64_t sub_23718F878()
{
  return MEMORY[0x270EEE6D0]();
}

uint64_t sub_23718F888()
{
  return MEMORY[0x270EEE700]();
}

uint64_t sub_23718F898()
{
  return MEMORY[0x270EEE710]();
}

uint64_t sub_23718F8A8()
{
  return MEMORY[0x270EEE728]();
}

uint64_t sub_23718F8B8()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_23718F8C8()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_23718F8D8()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_23718F8E8()
{
  return MEMORY[0x270EEE790]();
}

uint64_t sub_23718F8F8()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_23718F908()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_23718F918()
{
  return MEMORY[0x270EEE7D8]();
}

uint64_t sub_23718F928()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_23718F938()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_23718F948()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_23718F958()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_23718F968()
{
  return MEMORY[0x270EEE850]();
}

uint64_t sub_23718F978()
{
  return MEMORY[0x270EEE860]();
}

uint64_t sub_23718F988()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_23718F998()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_23718F9A8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_23718F9B8()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_23718F9C8()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_23718F9D8()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_23718F9E8()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_23718F9F8()
{
  return MEMORY[0x270EEF320]();
}

uint64_t sub_23718FA08()
{
  return MEMORY[0x270EEF340]();
}

uint64_t sub_23718FA18()
{
  return MEMORY[0x270EEF360]();
}

uint64_t sub_23718FA28()
{
  return MEMORY[0x270EEF390]();
}

uint64_t sub_23718FA38()
{
  return MEMORY[0x270EEF3B8]();
}

uint64_t sub_23718FA48()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_23718FA58()
{
  return MEMORY[0x270EEF410]();
}

uint64_t sub_23718FA68()
{
  return MEMORY[0x270EEF420]();
}

uint64_t sub_23718FA78()
{
  return MEMORY[0x270EEF440]();
}

uint64_t sub_23718FA88()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_23718FA98()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23718FAA8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_23718FAB8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23718FAC8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23718FAD8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_23718FAE8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23718FAF8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23718FB08()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23718FB18()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_23718FB28()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_23718FB38()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_23718FB48()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_23718FB58()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_23718FB68()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_23718FB78()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_23718FB88()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_23718FB98()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_23718FBA8()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_23718FBB8()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_23718FBC8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23718FBD8()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t _s19SiriCalendarIntents7SnippetO11ParticipantV2id10Foundation4UUIDVvpfi_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23718FBF8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23718FC08()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_23718FC18()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23718FC28()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23718FC38()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_23718FC48()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_23718FC58()
{
  return MEMORY[0x270EF1160]();
}

uint64_t sub_23718FC68()
{
  return MEMORY[0x270EF1220]();
}

uint64_t sub_23718FC78()
{
  return MEMORY[0x270EF1260]();
}

uint64_t sub_23718FC88()
{
  return MEMORY[0x270EF1280]();
}

uint64_t sub_23718FC98()
{
  return MEMORY[0x270EF12C0]();
}

uint64_t sub_23718FCA8()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_23718FCB8()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_23718FCC8()
{
  return MEMORY[0x270EF1358]();
}

uint64_t sub_23718FCD8()
{
  return MEMORY[0x270EF13B0]();
}

uint64_t sub_23718FCE8()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_23718FCF8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_23718FD08()
{
  return MEMORY[0x270EF1580]();
}

uint64_t sub_23718FD18()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_23718FD28()
{
  return MEMORY[0x270EF15E8]();
}

uint64_t sub_23718FD38()
{
  return MEMORY[0x270EF1600]();
}

uint64_t sub_23718FD48()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_23718FD58()
{
  return MEMORY[0x270EF1788]();
}

uint64_t sub_23718FD68()
{
  return MEMORY[0x270EF1790]();
}

uint64_t sub_23718FD98()
{
  return MEMORY[0x270F66328]();
}

uint64_t sub_23718FDC8()
{
  return MEMORY[0x270F66360]();
}

uint64_t sub_23718FE18()
{
  return MEMORY[0x270F663D8]();
}

uint64_t sub_23718FE28()
{
  return MEMORY[0x270F663E0]();
}

uint64_t sub_23718FEA8()
{
  return MEMORY[0x270F664C8]();
}

uint64_t sub_23718FEB8()
{
  return MEMORY[0x270F664D0]();
}

uint64_t sub_23718FEC8()
{
  return MEMORY[0x270F664D8]();
}

uint64_t sub_23718FF08()
{
  return MEMORY[0x270F66510]();
}

uint64_t sub_23718FF58()
{
  return MEMORY[0x270F665D0]();
}

uint64_t sub_23718FF68()
{
  return MEMORY[0x270F665D8]();
}

uint64_t sub_23718FF78()
{
  return MEMORY[0x270F665E0]();
}

uint64_t sub_23718FF88()
{
  return MEMORY[0x270F665E8]();
}

uint64_t sub_23718FF98()
{
  return MEMORY[0x270F665F0]();
}

uint64_t sub_23718FFA8()
{
  return MEMORY[0x270F66618]();
}

uint64_t sub_23718FFB8()
{
  return MEMORY[0x270F66620]();
}

uint64_t sub_237190078()
{
  return MEMORY[0x270F66710]();
}

uint64_t sub_2371900C8()
{
  return MEMORY[0x270F66768]();
}

uint64_t sub_2371900D8()
{
  return MEMORY[0x270F66770]();
}

uint64_t sub_237190108()
{
  return MEMORY[0x270F667A0]();
}

uint64_t sub_237190118()
{
  return MEMORY[0x270F667A8]();
}

uint64_t sub_237190128()
{
  return MEMORY[0x270F66848]();
}

uint64_t sub_237190138()
{
  return MEMORY[0x270F66860]();
}

uint64_t sub_237190148()
{
  return MEMORY[0x270F66888]();
}

uint64_t sub_237190158()
{
  return MEMORY[0x270F668B0]();
}

uint64_t sub_237190168()
{
  return MEMORY[0x270F668B8]();
}

uint64_t sub_237190178()
{
  return MEMORY[0x270F668C8]();
}

uint64_t sub_237190188()
{
  return MEMORY[0x270F66950]();
}

uint64_t sub_2371901A8()
{
  return MEMORY[0x270F66978]();
}

uint64_t sub_2371901B8()
{
  return MEMORY[0x270F66980]();
}

uint64_t sub_2371901C8()
{
  return MEMORY[0x270F66998]();
}

uint64_t sub_2371901D8()
{
  return MEMORY[0x270F669A0]();
}

uint64_t sub_2371901E8()
{
  return MEMORY[0x270F669A8]();
}

uint64_t sub_2371901F8()
{
  return MEMORY[0x270F669B0]();
}

uint64_t sub_237190208()
{
  return MEMORY[0x270F669B8]();
}

uint64_t sub_237190218()
{
  return MEMORY[0x270F66A68]();
}

uint64_t sub_237190228()
{
  return MEMORY[0x270F66A80]();
}

uint64_t sub_237190238()
{
  return MEMORY[0x270F66A88]();
}

uint64_t sub_237190248()
{
  return MEMORY[0x270F66A98]();
}

uint64_t sub_237190258()
{
  return MEMORY[0x270F66AD0]();
}

uint64_t sub_237190268()
{
  return MEMORY[0x270F66AE0]();
}

uint64_t sub_237190278()
{
  return MEMORY[0x270F66AF8]();
}

uint64_t sub_237190288()
{
  return MEMORY[0x270F66B08]();
}

uint64_t sub_237190298()
{
  return MEMORY[0x270F66B10]();
}

uint64_t sub_2371902A8()
{
  return MEMORY[0x270F66B20]();
}

uint64_t sub_2371902B8()
{
  return MEMORY[0x270F66B40]();
}

uint64_t sub_2371902C8()
{
  return MEMORY[0x270F66B48]();
}

uint64_t sub_2371902D8()
{
  return MEMORY[0x270F66B50]();
}

uint64_t sub_2371902E8()
{
  return MEMORY[0x270F66B58]();
}

uint64_t sub_2371902F8()
{
  return MEMORY[0x270F66B68]();
}

uint64_t sub_237190308()
{
  return MEMORY[0x270F66B70]();
}

uint64_t sub_237190318()
{
  return MEMORY[0x270F66B78]();
}

uint64_t sub_237190328()
{
  return MEMORY[0x270F66B90]();
}

uint64_t sub_237190338()
{
  return MEMORY[0x270F66BA0]();
}

uint64_t sub_237190348()
{
  return MEMORY[0x270F66C58]();
}

uint64_t sub_237190358()
{
  return MEMORY[0x270F66C80]();
}

uint64_t sub_237190368()
{
  return MEMORY[0x270F66C88]();
}

uint64_t sub_237190378()
{
  return MEMORY[0x270F66C90]();
}

uint64_t sub_237190398()
{
  return MEMORY[0x270F66CA0]();
}

uint64_t sub_2371903A8()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t sub_2371903B8()
{
  return MEMORY[0x270F66CB0]();
}

uint64_t sub_2371903C8()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t sub_2371903D8()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t sub_2371903E8()
{
  return MEMORY[0x270F66CD8]();
}

uint64_t sub_237190408()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t sub_237190418()
{
  return MEMORY[0x270F66CF8]();
}

uint64_t sub_237190428()
{
  return MEMORY[0x270F66D18]();
}

uint64_t sub_237190438()
{
  return MEMORY[0x270F66D30]();
}

uint64_t sub_237190448()
{
  return MEMORY[0x270F66D60]();
}

uint64_t sub_237190458()
{
  return MEMORY[0x270F66DC8]();
}

uint64_t sub_237190468()
{
  return MEMORY[0x270F66DD0]();
}

uint64_t sub_237190478()
{
  return MEMORY[0x270F66F18]();
}

uint64_t sub_237190488()
{
  return MEMORY[0x270F66F28]();
}

uint64_t sub_237190498()
{
  return MEMORY[0x270F66F58]();
}

uint64_t sub_2371904A8()
{
  return MEMORY[0x270F66F60]();
}

uint64_t sub_2371904B8()
{
  return MEMORY[0x270F670A0]();
}

uint64_t sub_2371904C8()
{
  return MEMORY[0x270F671A8]();
}

uint64_t sub_2371904D8()
{
  return MEMORY[0x270F671D8]();
}

uint64_t sub_2371904E8()
{
  return MEMORY[0x270F67210]();
}

uint64_t sub_2371904F8()
{
  return MEMORY[0x270F67220]();
}

uint64_t sub_237190508()
{
  return MEMORY[0x270F67238]();
}

uint64_t sub_237190518()
{
  return MEMORY[0x270F67240]();
}

uint64_t sub_237190528()
{
  return MEMORY[0x270F672E8]();
}

uint64_t sub_237190548()
{
  return MEMORY[0x270F67300]();
}

uint64_t sub_237190558()
{
  return MEMORY[0x270F67310]();
}

uint64_t sub_237190568()
{
  return MEMORY[0x270F67320]();
}

uint64_t sub_237190578()
{
  return MEMORY[0x270F67330]();
}

uint64_t sub_237190588()
{
  return MEMORY[0x270F67340]();
}

uint64_t sub_237190598()
{
  return MEMORY[0x270F67348]();
}

uint64_t sub_2371905A8()
{
  return MEMORY[0x270F67350]();
}

uint64_t sub_2371905B8()
{
  return MEMORY[0x270F67360]();
}

uint64_t sub_2371905C8()
{
  return MEMORY[0x270F67368]();
}

uint64_t sub_2371905D8()
{
  return MEMORY[0x270F67370]();
}

uint64_t sub_2371905E8()
{
  return MEMORY[0x270F673B0]();
}

uint64_t sub_2371905F8()
{
  return MEMORY[0x270F67428]();
}

uint64_t sub_237190608()
{
  return MEMORY[0x270F67430]();
}

uint64_t sub_237190618()
{
  return MEMORY[0x270F674C8]();
}

uint64_t sub_237190628()
{
  return MEMORY[0x270F674E0]();
}

uint64_t sub_237190638()
{
  return MEMORY[0x270F674F8]();
}

uint64_t sub_237190648()
{
  return MEMORY[0x270F67500]();
}

uint64_t sub_237190658()
{
  return MEMORY[0x270F67508]();
}

uint64_t sub_237190668()
{
  return MEMORY[0x270F67510]();
}

uint64_t sub_237190678()
{
  return MEMORY[0x270F67600]();
}

uint64_t sub_237190688()
{
  return MEMORY[0x270F67608]();
}

uint64_t sub_237190698()
{
  return MEMORY[0x270F676C8]();
}

uint64_t sub_2371906A8()
{
  return MEMORY[0x270F676D8]();
}

uint64_t sub_2371906B8()
{
  return MEMORY[0x270F676E0]();
}

uint64_t sub_2371906C8()
{
  return MEMORY[0x270F676E8]();
}

uint64_t sub_2371906D8()
{
  return MEMORY[0x270F676F0]();
}

uint64_t sub_2371906E8()
{
  return MEMORY[0x270F676F8]();
}

uint64_t sub_2371906F8()
{
  return MEMORY[0x270F67708]();
}

uint64_t sub_237190708()
{
  return MEMORY[0x270F67718]();
}

uint64_t sub_237190718()
{
  return MEMORY[0x270F67720]();
}

uint64_t sub_237190728()
{
  return MEMORY[0x270F67730]();
}

uint64_t sub_237190738()
{
  return MEMORY[0x270F67748]();
}

uint64_t sub_237190748()
{
  return MEMORY[0x270F67750]();
}

uint64_t sub_237190758()
{
  return MEMORY[0x270F67768]();
}

uint64_t sub_237190768()
{
  return MEMORY[0x270F67770]();
}

uint64_t sub_237190778()
{
  return MEMORY[0x270F67778]();
}

uint64_t sub_237190788()
{
  return MEMORY[0x270F67788]();
}

uint64_t sub_237190798()
{
  return MEMORY[0x270F67798]();
}

uint64_t sub_2371907A8()
{
  return MEMORY[0x270F677A0]();
}

uint64_t sub_2371907B8()
{
  return MEMORY[0x270F677B0]();
}

uint64_t sub_2371907C8()
{
  return MEMORY[0x270F677C0]();
}

uint64_t sub_2371907D8()
{
  return MEMORY[0x270F677C8]();
}

uint64_t sub_2371907E8()
{
  return MEMORY[0x270F677D0]();
}

uint64_t sub_2371907F8()
{
  return MEMORY[0x270F677D8]();
}

uint64_t sub_237190808()
{
  return MEMORY[0x270F677E0]();
}

uint64_t sub_237190818()
{
  return MEMORY[0x270F677F0]();
}

uint64_t sub_237190828()
{
  return MEMORY[0x270F67800]();
}

uint64_t sub_237190838()
{
  return MEMORY[0x270F67820]();
}

uint64_t sub_237190848()
{
  return MEMORY[0x270F67828]();
}

uint64_t sub_237190858()
{
  return MEMORY[0x270F67838]();
}

uint64_t sub_237190868()
{
  return MEMORY[0x270F67888]();
}

uint64_t sub_237190878()
{
  return MEMORY[0x270F67890]();
}

uint64_t sub_237190888()
{
  return MEMORY[0x270F67A70]();
}

uint64_t sub_237190898()
{
  return MEMORY[0x270F67A78]();
}

uint64_t sub_2371908A8()
{
  return MEMORY[0x270F67A80]();
}

uint64_t sub_2371908F8()
{
  return MEMORY[0x270F67B08]();
}

uint64_t sub_237190908()
{
  return MEMORY[0x270F67B18]();
}

uint64_t sub_237190918()
{
  return MEMORY[0x270F67B68]();
}

uint64_t sub_237190928()
{
  return MEMORY[0x270F67B78]();
}

uint64_t sub_237190938()
{
  return MEMORY[0x270F67B80]();
}

uint64_t sub_237190948()
{
  return MEMORY[0x270F67B90]();
}

uint64_t sub_237190958()
{
  return MEMORY[0x270F67B98]();
}

uint64_t sub_237190968()
{
  return MEMORY[0x270F67BA0]();
}

uint64_t sub_237190978()
{
  return MEMORY[0x270F67BC0]();
}

uint64_t sub_237190988()
{
  return MEMORY[0x270F67BD8]();
}

uint64_t sub_237190998()
{
  return MEMORY[0x270F67BE8]();
}

uint64_t sub_2371909B8()
{
  return MEMORY[0x270F67C20]();
}

uint64_t sub_2371909D8()
{
  return MEMORY[0x270F67D28]();
}

uint64_t sub_2371909E8()
{
  return MEMORY[0x270F67D40]();
}

uint64_t sub_2371909F8()
{
  return MEMORY[0x270F67D58]();
}

uint64_t sub_237190A08()
{
  return MEMORY[0x270F67D70]();
}

uint64_t sub_237190A18()
{
  return MEMORY[0x270F67DE8]();
}

uint64_t sub_237190A28()
{
  return MEMORY[0x270F67DF0]();
}

uint64_t sub_237190A38()
{
  return MEMORY[0x270F67DF8]();
}

uint64_t sub_237190A48()
{
  return MEMORY[0x270F67E40]();
}

uint64_t sub_237190A58()
{
  return MEMORY[0x270F67E50]();
}

uint64_t sub_237190A68()
{
  return MEMORY[0x270F67E58]();
}

uint64_t sub_237190A78()
{
  return MEMORY[0x270F67E60]();
}

uint64_t sub_237190A88()
{
  return MEMORY[0x270F67E68]();
}

uint64_t sub_237190A98()
{
  return MEMORY[0x270F67E80]();
}

uint64_t sub_237190AA8()
{
  return MEMORY[0x270F67E90]();
}

uint64_t sub_237190AB8()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t sub_237190AC8()
{
  return MEMORY[0x270F67EC8]();
}

uint64_t sub_237190AD8()
{
  return MEMORY[0x270F67ED0]();
}

uint64_t sub_237190AE8()
{
  return MEMORY[0x270F67EF0]();
}

uint64_t sub_237190AF8()
{
  return MEMORY[0x270F67EF8]();
}

uint64_t sub_237190B08()
{
  return MEMORY[0x270F67F00]();
}

uint64_t sub_237190B18()
{
  return MEMORY[0x270F67F08]();
}

uint64_t sub_237190B28()
{
  return MEMORY[0x270F67F18]();
}

uint64_t sub_237190B38()
{
  return MEMORY[0x270F67F68]();
}

uint64_t sub_237190B48()
{
  return MEMORY[0x270F67F70]();
}

uint64_t sub_237190B58()
{
  return MEMORY[0x270F67F78]();
}

uint64_t sub_237190B68()
{
  return MEMORY[0x270F67F80]();
}

uint64_t sub_237190B78()
{
  return MEMORY[0x270F67FB8]();
}

uint64_t sub_237190B88()
{
  return MEMORY[0x270F67FC0]();
}

uint64_t sub_237190B98()
{
  return MEMORY[0x270F67FC8]();
}

uint64_t sub_237190BA8()
{
  return MEMORY[0x270F68110]();
}

uint64_t sub_237190BD8()
{
  return MEMORY[0x270F681A0]();
}

uint64_t sub_237190BE8()
{
  return MEMORY[0x270F681A8]();
}

uint64_t sub_237190BF8()
{
  return MEMORY[0x270F681B0]();
}

uint64_t sub_237190C08()
{
  return MEMORY[0x270F681B8]();
}

uint64_t sub_237190C18()
{
  return MEMORY[0x270F681C0]();
}

uint64_t sub_237190C28()
{
  return MEMORY[0x270F681C8]();
}

uint64_t sub_237190C38()
{
  return MEMORY[0x270F681D0]();
}

uint64_t sub_237190C48()
{
  return MEMORY[0x270F681E0]();
}

uint64_t sub_237190C58()
{
  return MEMORY[0x270F681E8]();
}

uint64_t sub_237190C68()
{
  return MEMORY[0x270F681F0]();
}

uint64_t sub_237190C78()
{
  return MEMORY[0x270F68220]();
}

uint64_t sub_237190C88()
{
  return MEMORY[0x270F68228]();
}

uint64_t sub_237190C98()
{
  return MEMORY[0x270F68230]();
}

uint64_t sub_237190CA8()
{
  return MEMORY[0x270F68258]();
}

uint64_t sub_237190CB8()
{
  return MEMORY[0x270F68260]();
}

uint64_t sub_237190CC8()
{
  return MEMORY[0x270F68268]();
}

uint64_t sub_237190CD8()
{
  return MEMORY[0x270F682A0]();
}

uint64_t sub_237190CE8()
{
  return MEMORY[0x270F682B8]();
}

uint64_t sub_237190CF8()
{
  return MEMORY[0x270F68378]();
}

uint64_t sub_237190D08()
{
  return MEMORY[0x270F68388]();
}

uint64_t sub_237190D18()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_237190D28()
{
  return MEMORY[0x270F6A288]();
}

uint64_t sub_237190D38()
{
  return MEMORY[0x270F6A290]();
}

uint64_t sub_237190D48()
{
  return MEMORY[0x270F6A370]();
}

uint64_t sub_237190D58()
{
  return MEMORY[0x270F6A498]();
}

uint64_t sub_237190D68()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t sub_237190D78()
{
  return MEMORY[0x270F6A718]();
}

uint64_t sub_237190D88()
{
  return MEMORY[0x270F6A720]();
}

uint64_t sub_237190D98()
{
  return MEMORY[0x270F6A728]();
}

uint64_t sub_237190DA8()
{
  return MEMORY[0x270F6A760]();
}

uint64_t sub_237190DB8()
{
  return MEMORY[0x270F6A768]();
}

uint64_t sub_237190DC8()
{
  return MEMORY[0x270F6A770]();
}

uint64_t sub_237190DD8()
{
  return MEMORY[0x270F6A788]();
}

uint64_t sub_237190DE8()
{
  return MEMORY[0x270F6A7B8]();
}

uint64_t sub_237190DF8()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t sub_237190E08()
{
  return MEMORY[0x270F6A860]();
}

uint64_t sub_237190E18()
{
  return MEMORY[0x270F6A868]();
}

uint64_t sub_237190E28()
{
  return MEMORY[0x270F6AA80]();
}

uint64_t sub_237190E38()
{
  return MEMORY[0x270F6AA90]();
}

uint64_t sub_237190E48()
{
  return MEMORY[0x270F6AA98]();
}

uint64_t sub_237190E58()
{
  return MEMORY[0x270F6AAB8]();
}

uint64_t sub_237190E68()
{
  return MEMORY[0x270F6AAC0]();
}

uint64_t sub_237190E78()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t sub_237190E88()
{
  return MEMORY[0x270F6AC20]();
}

uint64_t sub_237190E98()
{
  return MEMORY[0x270F6AC70]();
}

uint64_t sub_237190EA8()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t sub_237190EB8()
{
  return MEMORY[0x270F6ACA0]();
}

uint64_t sub_237190EC8()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t sub_237190ED8()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t sub_237190EE8()
{
  return MEMORY[0x270F6ADB0]();
}

uint64_t sub_237190EF8()
{
  return MEMORY[0x270F6ADB8]();
}

uint64_t sub_237190F08()
{
  return MEMORY[0x270F6ADC0]();
}

uint64_t sub_237190F18()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t sub_237190F28()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t sub_237190F38()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t sub_237190F48()
{
  return MEMORY[0x270F6BB10]();
}

uint64_t sub_237190F58()
{
  return MEMORY[0x270F6BB38]();
}

uint64_t sub_237190F68()
{
  return MEMORY[0x270F6BF88]();
}

uint64_t sub_237190F78()
{
  return MEMORY[0x270F6BF90]();
}

uint64_t sub_237190F88()
{
  return MEMORY[0x270F6BF98]();
}

uint64_t sub_237190F98()
{
  return MEMORY[0x270F6BFA0]();
}

uint64_t sub_237190FA8()
{
  return MEMORY[0x270F6BFC0]();
}

uint64_t sub_237190FB8()
{
  return MEMORY[0x270F6C108]();
}

uint64_t sub_237190FC8()
{
  return MEMORY[0x270F6C110]();
}

uint64_t sub_237190FD8()
{
  return MEMORY[0x270F6C138]();
}

uint64_t sub_237190FE8()
{
  return MEMORY[0x270F6C140]();
}

uint64_t sub_237190FF8()
{
  return MEMORY[0x270F6C148]();
}

uint64_t sub_237191008()
{
  return MEMORY[0x270F6C150]();
}

uint64_t sub_237191018()
{
  return MEMORY[0x270F6C160]();
}

uint64_t sub_237191028()
{
  return MEMORY[0x270F6C168]();
}

uint64_t sub_237191038()
{
  return MEMORY[0x270F6C190]();
}

uint64_t sub_237191048()
{
  return MEMORY[0x270F6C198]();
}

uint64_t sub_237191058()
{
  return MEMORY[0x270F6C7E8]();
}

uint64_t sub_237191068()
{
  return MEMORY[0x270F6C810]();
}

uint64_t sub_237191078()
{
  return MEMORY[0x270F6C840]();
}

uint64_t sub_237191088()
{
  return MEMORY[0x270F6C848]();
}

uint64_t sub_237191098()
{
  return MEMORY[0x270F6C8C0]();
}

uint64_t sub_2371910A8()
{
  return MEMORY[0x270F6C8D0]();
}

uint64_t sub_2371910B8()
{
  return MEMORY[0x270F6C8D8]();
}

uint64_t sub_2371910C8()
{
  return MEMORY[0x270F6C8E0]();
}

uint64_t sub_2371910D8()
{
  return MEMORY[0x270F6C8F8]();
}

uint64_t sub_2371910E8()
{
  return MEMORY[0x270F6C900]();
}

uint64_t sub_2371910F8()
{
  return MEMORY[0x270F6C920]();
}

uint64_t sub_237191108()
{
  return MEMORY[0x270F6C930]();
}

uint64_t sub_237191118()
{
  return MEMORY[0x270F6C940]();
}

uint64_t sub_237191128()
{
  return MEMORY[0x270F6C9C0]();
}

uint64_t sub_237191138()
{
  return MEMORY[0x270F6C9D8]();
}

uint64_t sub_237191148()
{
  return MEMORY[0x270F6C9F0]();
}

uint64_t sub_237191158()
{
  return MEMORY[0x270F6CA08]();
}

uint64_t sub_237191168()
{
  return MEMORY[0x270F6CA10]();
}

uint64_t sub_2371911A8()
{
  return MEMORY[0x270F65408]();
}

uint64_t sub_2371911B8()
{
  return MEMORY[0x270F6CB28]();
}

uint64_t sub_2371911C8()
{
  return MEMORY[0x270F6CB48]();
}

uint64_t sub_2371911D8()
{
  return MEMORY[0x270F6CB50]();
}

uint64_t sub_2371911E8()
{
  return MEMORY[0x270F6CB70]();
}

uint64_t sub_2371911F8()
{
  return MEMORY[0x270F6CC90]();
}

uint64_t sub_237191208()
{
  return MEMORY[0x270F6CCA0]();
}

uint64_t sub_237191218()
{
  return MEMORY[0x270F6CCA8]();
}

uint64_t sub_237191228()
{
  return MEMORY[0x270F6CCB0]();
}

uint64_t sub_237191238()
{
  return MEMORY[0x270F6CCB8]();
}

uint64_t sub_237191248()
{
  return MEMORY[0x270F6CCC8]();
}

uint64_t sub_237191258()
{
  return MEMORY[0x270F6CCD8]();
}

uint64_t sub_237191268()
{
  return MEMORY[0x270F6CCF0]();
}

uint64_t sub_237191278()
{
  return MEMORY[0x270F6CCF8]();
}

uint64_t sub_237191288()
{
  return MEMORY[0x270F6CD18]();
}

uint64_t sub_237191298()
{
  return MEMORY[0x270F6CD20]();
}

uint64_t sub_2371912A8()
{
  return MEMORY[0x270F6CD28]();
}

uint64_t sub_2371912B8()
{
  return MEMORY[0x270F6CD30]();
}

uint64_t sub_2371912C8()
{
  return MEMORY[0x270F6CD48]();
}

uint64_t sub_2371912D8()
{
  return MEMORY[0x270F6CD68]();
}

uint64_t sub_2371912E8()
{
  return MEMORY[0x270F6CD70]();
}

uint64_t sub_2371912F8()
{
  return MEMORY[0x270F6CD98]();
}

uint64_t sub_237191308()
{
  return MEMORY[0x270F6CDA0]();
}

uint64_t sub_237191318()
{
  return MEMORY[0x270F6CDF8]();
}

uint64_t sub_237191328()
{
  return MEMORY[0x270F6CE00]();
}

uint64_t sub_237191338()
{
  return MEMORY[0x270F6CE08]();
}

uint64_t sub_237191348()
{
  return MEMORY[0x270F6CE18]();
}

uint64_t sub_237191358()
{
  return MEMORY[0x270F6CE98]();
}

uint64_t sub_237191368()
{
  return MEMORY[0x270F6CEA8]();
}

uint64_t sub_237191378()
{
  return MEMORY[0x270F6CEB8]();
}

uint64_t sub_237191388()
{
  return MEMORY[0x270F6CEC0]();
}

uint64_t sub_237191398()
{
  return MEMORY[0x270F6CED0]();
}

uint64_t sub_2371913A8()
{
  return MEMORY[0x270F6CED8]();
}

uint64_t sub_2371913B8()
{
  return MEMORY[0x270F6CEE0]();
}

uint64_t sub_2371913C8()
{
  return MEMORY[0x270F6CEE8]();
}

uint64_t sub_2371913D8()
{
  return MEMORY[0x270F6CEF0]();
}

uint64_t sub_2371913E8()
{
  return MEMORY[0x270F6CF20]();
}

uint64_t sub_2371913F8()
{
  return MEMORY[0x270F6CF28]();
}

uint64_t sub_237191408()
{
  return MEMORY[0x270F6CF30]();
}

uint64_t sub_237191418()
{
  return MEMORY[0x270F6CF40]();
}

uint64_t sub_237191428()
{
  return MEMORY[0x270F6CF48]();
}

uint64_t sub_237191438()
{
  return MEMORY[0x270F6CF98]();
}

uint64_t sub_237191448()
{
  return MEMORY[0x270F6CFA0]();
}

uint64_t sub_237191458()
{
  return MEMORY[0x270F6CFA8]();
}

uint64_t sub_237191468()
{
  return MEMORY[0x270F65438]();
}

uint64_t sub_237191478()
{
  return MEMORY[0x270F6D0D8]();
}

uint64_t sub_237191488()
{
  return MEMORY[0x270F6D120]();
}

uint64_t sub_237191498()
{
  return MEMORY[0x270F6D220]();
}

uint64_t sub_2371914A8()
{
  return MEMORY[0x270F6D268]();
}

uint64_t sub_2371914B8()
{
  return MEMORY[0x270F6D270]();
}

uint64_t sub_2371914C8()
{
  return MEMORY[0x270F6D328]();
}

uint64_t sub_2371914D8()
{
  return MEMORY[0x270F6D338]();
}

uint64_t sub_2371914E8()
{
  return MEMORY[0x270F6D378]();
}

uint64_t sub_2371914F8()
{
  return MEMORY[0x270F6D380]();
}

uint64_t sub_237191508()
{
  return MEMORY[0x270F6D388]();
}

uint64_t sub_237191518()
{
  return MEMORY[0x270F6D3A8]();
}

uint64_t sub_237191528()
{
  return MEMORY[0x270F6D3B0]();
}

uint64_t sub_237191538()
{
  return MEMORY[0x270F6D3B8]();
}

uint64_t sub_237191548()
{
  return MEMORY[0x270F6D3C0]();
}

uint64_t sub_237191558()
{
  return MEMORY[0x270F6D3C8]();
}

uint64_t sub_237191568()
{
  return MEMORY[0x270F6D3D0]();
}

uint64_t sub_237191578()
{
  return MEMORY[0x270F6D3F8]();
}

uint64_t sub_237191588()
{
  return MEMORY[0x270F6D408]();
}

uint64_t sub_237191598()
{
  return MEMORY[0x270F6D410]();
}

uint64_t sub_2371915A8()
{
  return MEMORY[0x270F6D510]();
}

uint64_t sub_2371915B8()
{
  return MEMORY[0x270F6D5B8]();
}

uint64_t sub_2371915C8()
{
  return MEMORY[0x270F6D5C0]();
}

uint64_t sub_2371915F8()
{
  return MEMORY[0x270F6D6B8]();
}

uint64_t sub_237191608()
{
  return MEMORY[0x270F6D6C0]();
}

uint64_t sub_237191618()
{
  return MEMORY[0x270F6D6C8]();
}

uint64_t sub_237191628()
{
  return MEMORY[0x270F6D6D0]();
}

uint64_t sub_237191638()
{
  return MEMORY[0x270F6D6D8]();
}

uint64_t sub_237191648()
{
  return MEMORY[0x270F6D6E0]();
}

uint64_t sub_237191658()
{
  return MEMORY[0x270F6D718]();
}

uint64_t sub_237191668()
{
  return MEMORY[0x270F6D720]();
}

uint64_t sub_237191678()
{
  return MEMORY[0x270F6D728]();
}

uint64_t sub_237191688()
{
  return MEMORY[0x270F6D730]();
}

uint64_t sub_237191698()
{
  return MEMORY[0x270F6D738]();
}

uint64_t sub_2371916A8()
{
  return MEMORY[0x270F6D740]();
}

uint64_t sub_2371916B8()
{
  return MEMORY[0x270F6D768]();
}

uint64_t sub_2371916C8()
{
  return MEMORY[0x270F6D770]();
}

uint64_t sub_2371916D8()
{
  return MEMORY[0x270F6D960]();
}

uint64_t sub_2371916E8()
{
  return MEMORY[0x270F6D968]();
}

uint64_t sub_2371916F8()
{
  return MEMORY[0x270F6D970]();
}

uint64_t sub_237191708()
{
  return MEMORY[0x270F6D978]();
}

uint64_t sub_237191718()
{
  return MEMORY[0x270F6D980]();
}

uint64_t sub_237191728()
{
  return MEMORY[0x270F6DB30]();
}

uint64_t sub_237191738()
{
  return MEMORY[0x270F6DB50]();
}

uint64_t sub_237191748()
{
  return MEMORY[0x270F6DB58]();
}

uint64_t sub_237191758()
{
  return MEMORY[0x270F6DB60]();
}

uint64_t sub_237191768()
{
  return MEMORY[0x270F6DB78]();
}

uint64_t sub_237191778()
{
  return MEMORY[0x270F6DB80]();
}

uint64_t sub_237191788()
{
  return MEMORY[0x270F6DB98]();
}

uint64_t sub_237191798()
{
  return MEMORY[0x270F6DBA0]();
}

uint64_t sub_2371917A8()
{
  return MEMORY[0x270F6DBA8]();
}

uint64_t sub_2371917B8()
{
  return MEMORY[0x270F6DBB0]();
}

uint64_t sub_2371917C8()
{
  return MEMORY[0x270F6DBB8]();
}

uint64_t sub_2371917D8()
{
  return MEMORY[0x270F6DBC0]();
}

uint64_t sub_2371917E8()
{
  return MEMORY[0x270F6DBC8]();
}

uint64_t sub_2371917F8()
{
  return MEMORY[0x270F6DBD0]();
}

uint64_t sub_237191808()
{
  return MEMORY[0x270F65448]();
}

uint64_t sub_237191818()
{
  return MEMORY[0x270F6DBD8]();
}

uint64_t sub_237191828()
{
  return MEMORY[0x270F6DBE0]();
}

uint64_t sub_237191838()
{
  return MEMORY[0x270F6DBE8]();
}

uint64_t sub_237191848()
{
  return MEMORY[0x270F6DBF0]();
}

uint64_t sub_237191858()
{
  return MEMORY[0x270F6DBF8]();
}

uint64_t sub_237191868()
{
  return MEMORY[0x270F6DC00]();
}

uint64_t sub_237191878()
{
  return MEMORY[0x270F6DC08]();
}

uint64_t sub_237191888()
{
  return MEMORY[0x270F6DC10]();
}

uint64_t sub_237191898()
{
  return MEMORY[0x270F6DC18]();
}

uint64_t sub_2371918A8()
{
  return MEMORY[0x270F6DD48]();
}

uint64_t sub_2371918B8()
{
  return MEMORY[0x270F6DD78]();
}

uint64_t sub_2371918C8()
{
  return MEMORY[0x270F6DD88]();
}

uint64_t sub_2371918D8()
{
  return MEMORY[0x270F6DD90]();
}

uint64_t sub_2371918F8()
{
  return MEMORY[0x270F6DFA8]();
}

uint64_t sub_237191908()
{
  return MEMORY[0x270F6DFB0]();
}

uint64_t sub_237191918()
{
  return MEMORY[0x270F6DFB8]();
}

uint64_t sub_237191928()
{
  return MEMORY[0x270F6DFC0]();
}

uint64_t sub_237191938()
{
  return MEMORY[0x270F6E0D8]();
}

uint64_t sub_237191948()
{
  return MEMORY[0x270F6E0E0]();
}

uint64_t sub_237191958()
{
  return MEMORY[0x270F6E0E8]();
}

uint64_t sub_237191968()
{
  return MEMORY[0x270F6E1E8]();
}

uint64_t sub_237191978()
{
  return MEMORY[0x270F6E1F0]();
}

uint64_t sub_237191988()
{
  return MEMORY[0x270F6E200]();
}

uint64_t sub_237191998()
{
  return MEMORY[0x270F6E208]();
}

uint64_t sub_2371919A8()
{
  return MEMORY[0x270F6E388]();
}

uint64_t sub_2371919B8()
{
  return MEMORY[0x270F6E398]();
}

uint64_t sub_2371919C8()
{
  return MEMORY[0x270F6E3E0]();
}

uint64_t sub_2371919D8()
{
  return MEMORY[0x270F6E408]();
}

uint64_t sub_2371919E8()
{
  return MEMORY[0x270F6E458]();
}

uint64_t sub_2371919F8()
{
  return MEMORY[0x270F6E460]();
}

uint64_t sub_237191A08()
{
  return MEMORY[0x270F6E468]();
}

uint64_t sub_237191A18()
{
  return MEMORY[0x270F6E470]();
}

uint64_t sub_237191A28()
{
  return MEMORY[0x270F6E478]();
}

uint64_t sub_237191A38()
{
  return MEMORY[0x270F6E480]();
}

uint64_t sub_237191A48()
{
  return MEMORY[0x270F6E490]();
}

uint64_t sub_237191A58()
{
  return MEMORY[0x270F6E498]();
}

uint64_t sub_237191A68()
{
  return MEMORY[0x270F6E4A8]();
}

uint64_t sub_237191A78()
{
  return MEMORY[0x270F6E4B0]();
}

uint64_t sub_237191A88()
{
  return MEMORY[0x270F6E4B8]();
}

uint64_t sub_237191A98()
{
  return MEMORY[0x270F6E4C0]();
}

uint64_t sub_237191AA8()
{
  return MEMORY[0x270F65468]();
}

uint64_t sub_237191AB8()
{
  return MEMORY[0x270F6E5B0]();
}

uint64_t sub_237191AC8()
{
  return MEMORY[0x270F6E5B8]();
}

uint64_t sub_237191AD8()
{
  return MEMORY[0x270F6E5C0]();
}

uint64_t sub_237191AE8()
{
  return MEMORY[0x270F6E5E0]();
}

uint64_t sub_237191AF8()
{
  return MEMORY[0x270F6E5E8]();
}

uint64_t sub_237191B08()
{
  return MEMORY[0x270F6E5F0]();
}

uint64_t sub_237191B18()
{
  return MEMORY[0x270F6E5F8]();
}

uint64_t sub_237191B28()
{
  return MEMORY[0x270F6E600]();
}

uint64_t sub_237191B38()
{
  return MEMORY[0x270F6E608]();
}

uint64_t sub_237191B48()
{
  return MEMORY[0x270F6E720]();
}

uint64_t sub_237191B58()
{
  return MEMORY[0x270F6E728]();
}

uint64_t sub_237191B68()
{
  return MEMORY[0x270F6E740]();
}

uint64_t sub_237191B78()
{
  return MEMORY[0x270F6E770]();
}

uint64_t sub_237191B88()
{
  return MEMORY[0x270F6E7A0]();
}

uint64_t sub_237191B98()
{
  return MEMORY[0x270F6E7A8]();
}

uint64_t sub_237191BA8()
{
  return MEMORY[0x270F6E7B0]();
}

uint64_t sub_237191BB8()
{
  return MEMORY[0x270F6E7B8]();
}

uint64_t sub_237191BC8()
{
  return MEMORY[0x270F6E7F0]();
}

uint64_t sub_237191BD8()
{
  return MEMORY[0x270F6E7F8]();
}

uint64_t sub_237191BE8()
{
  return MEMORY[0x270F6E800]();
}

uint64_t sub_237191BF8()
{
  return MEMORY[0x270F6E808]();
}

uint64_t sub_237191C08()
{
  return MEMORY[0x270F6E810]();
}

uint64_t sub_237191C18()
{
  return MEMORY[0x270F6E820]();
}

uint64_t sub_237191C28()
{
  return MEMORY[0x270F6E9A0]();
}

uint64_t sub_237191C38()
{
  return MEMORY[0x270F6E9C0]();
}

uint64_t sub_237191C48()
{
  return MEMORY[0x270F6E9C8]();
}

uint64_t sub_237191C58()
{
  return MEMORY[0x270F6E9D8]();
}

uint64_t sub_237191C68()
{
  return MEMORY[0x270F6E9E8]();
}

uint64_t sub_237191C78()
{
  return MEMORY[0x270F6E9F0]();
}

uint64_t sub_237191C88()
{
  return MEMORY[0x270F6EA08]();
}

uint64_t sub_237191C98()
{
  return MEMORY[0x270F6EA20]();
}

uint64_t sub_237191CA8()
{
  return MEMORY[0x270F6EA28]();
}

uint64_t sub_237191CB8()
{
  return MEMORY[0x270F6EA30]();
}

uint64_t sub_237191CC8()
{
  return MEMORY[0x270F6EA38]();
}

uint64_t sub_237191CD8()
{
  return MEMORY[0x270F6EA40]();
}

uint64_t sub_237191CE8()
{
  return MEMORY[0x270F6EA48]();
}

uint64_t sub_237191CF8()
{
  return MEMORY[0x270F6EA50]();
}

uint64_t sub_237191D08()
{
  return MEMORY[0x270F6ECD8]();
}

uint64_t sub_237191D18()
{
  return MEMORY[0x270F6ED48]();
}

uint64_t sub_237191D28()
{
  return MEMORY[0x270F6ED50]();
}

uint64_t sub_237191D38()
{
  return MEMORY[0x270F6ED58]();
}

uint64_t sub_237191D48()
{
  return MEMORY[0x270F6ED68]();
}

uint64_t sub_237191D58()
{
  return MEMORY[0x270F6ED70]();
}

uint64_t sub_237191D68()
{
  return MEMORY[0x270F6EDA0]();
}

uint64_t sub_237191D78()
{
  return MEMORY[0x270F6EDA8]();
}

uint64_t sub_237191D88()
{
  return MEMORY[0x270F6EDE0]();
}

uint64_t sub_237191D98()
{
  return MEMORY[0x270F6EDE8]();
}

uint64_t sub_237191DA8()
{
  return MEMORY[0x270F6EE28]();
}

uint64_t sub_237191DB8()
{
  return MEMORY[0x270F6EE30]();
}

uint64_t sub_237191DC8()
{
  return MEMORY[0x270F6EFC8]();
}

uint64_t sub_237191DD8()
{
  return MEMORY[0x270F6EFD0]();
}

uint64_t sub_237191DE8()
{
  return MEMORY[0x270F6EFD8]();
}

uint64_t sub_237191DF8()
{
  return MEMORY[0x270F6EFE0]();
}

uint64_t sub_237191E08()
{
  return MEMORY[0x270F6EFE8]();
}

uint64_t sub_237191E18()
{
  return MEMORY[0x270F6EFF0]();
}

uint64_t sub_237191E28()
{
  return MEMORY[0x270F6F018]();
}

uint64_t sub_237191E38()
{
  return MEMORY[0x270F6F020]();
}

uint64_t sub_237191E48()
{
  return MEMORY[0x270F6F058]();
}

uint64_t sub_237191E58()
{
  return MEMORY[0x270F6F0F0]();
}

uint64_t sub_237191E68()
{
  return MEMORY[0x270F6F0F8]();
}

uint64_t sub_237191E78()
{
  return MEMORY[0x270F6F368]();
}

uint64_t sub_237191E88()
{
  return MEMORY[0x270F6F370]();
}

uint64_t sub_237191E98()
{
  return MEMORY[0x270F6F378]();
}

uint64_t sub_237191EA8()
{
  return MEMORY[0x270F6F390]();
}

uint64_t sub_237191EB8()
{
  return MEMORY[0x270F6F398]();
}

uint64_t sub_237191EC8()
{
  return MEMORY[0x270F6F3A0]();
}

uint64_t sub_237191ED8()
{
  return MEMORY[0x270F6F3A8]();
}

uint64_t sub_237191EE8()
{
  return MEMORY[0x270F6F3B0]();
}

uint64_t sub_237191EF8()
{
  return MEMORY[0x270F6F3B8]();
}

uint64_t sub_237191F08()
{
  return MEMORY[0x270F6F3C0]();
}

uint64_t sub_237191F18()
{
  return MEMORY[0x270F6F3C8]();
}

uint64_t sub_237191F28()
{
  return MEMORY[0x270F6F3D0]();
}

uint64_t sub_237191F38()
{
  return MEMORY[0x270F6F3D8]();
}

uint64_t sub_237191F48()
{
  return MEMORY[0x270F6F3E0]();
}

uint64_t sub_237191F58()
{
  return MEMORY[0x270F6F3E8]();
}

uint64_t sub_237191F68()
{
  return MEMORY[0x270F6F3F0]();
}

uint64_t sub_237191F78()
{
  return MEMORY[0x270F6F3F8]();
}

uint64_t sub_237191F88()
{
  return MEMORY[0x270F6F408]();
}

uint64_t sub_237191F98()
{
  return MEMORY[0x270F70740]();
}

uint64_t sub_237191FA8()
{
  return MEMORY[0x270F6F4B0]();
}

uint64_t sub_237191FB8()
{
  return MEMORY[0x270F6F4D0]();
}

uint64_t sub_237191FC8()
{
  return MEMORY[0x270F14AA0]();
}

uint64_t sub_237191FD8()
{
  return MEMORY[0x270F654B8]();
}

uint64_t sub_237191FE8()
{
  return MEMORY[0x270F654C8]();
}

uint64_t sub_237191FF8()
{
  return MEMORY[0x270F654D0]();
}

uint64_t sub_237192038()
{
  return MEMORY[0x270F65590]();
}

uint64_t sub_237192058()
{
  return MEMORY[0x270F655E8]();
}

uint64_t sub_237192068()
{
  return MEMORY[0x270F655F8]();
}

uint64_t sub_237192078()
{
  return MEMORY[0x270F65608]();
}

uint64_t sub_237192088()
{
  return MEMORY[0x270F65618]();
}

uint64_t sub_237192098()
{
  return MEMORY[0x270F65650]();
}

uint64_t sub_2371920A8()
{
  return MEMORY[0x270F65668]();
}

uint64_t sub_2371920B8()
{
  return MEMORY[0x270F65678]();
}

uint64_t sub_2371920C8()
{
  return MEMORY[0x270F65688]();
}

uint64_t sub_2371920D8()
{
  return MEMORY[0x270F65698]();
}

uint64_t sub_2371920E8()
{
  return MEMORY[0x270F656A0]();
}

uint64_t sub_2371920F8()
{
  return MEMORY[0x270F656A8]();
}

uint64_t sub_237192128()
{
  return MEMORY[0x270F656C8]();
}

uint64_t sub_237192158()
{
  return MEMORY[0x270F65708]();
}

uint64_t sub_237192168()
{
  return MEMORY[0x270F65718]();
}

uint64_t sub_237192178()
{
  return MEMORY[0x270F65760]();
}

uint64_t sub_2371921A8()
{
  return MEMORY[0x270F65778]();
}

uint64_t sub_2371921C8()
{
  return MEMORY[0x270F65830]();
}

uint64_t sub_2371921E8()
{
  return MEMORY[0x270F65858]();
}

uint64_t sub_2371921F8()
{
  return MEMORY[0x270F65860]();
}

uint64_t sub_237192208()
{
  return MEMORY[0x270F65868]();
}

uint64_t sub_237192218()
{
  return MEMORY[0x270F65870]();
}

uint64_t sub_237192228()
{
  return MEMORY[0x270F65880]();
}

uint64_t sub_237192238()
{
  return MEMORY[0x270F65888]();
}

uint64_t sub_237192248()
{
  return MEMORY[0x270F658A0]();
}

uint64_t sub_237192258()
{
  return MEMORY[0x270F658A8]();
}

uint64_t sub_237192268()
{
  return MEMORY[0x270F658E8]();
}

uint64_t sub_237192278()
{
  return MEMORY[0x270F65900]();
}

uint64_t sub_237192288()
{
  return MEMORY[0x270F65908]();
}

uint64_t sub_237192298()
{
  return MEMORY[0x270F65910]();
}

uint64_t sub_2371922A8()
{
  return MEMORY[0x270F65950]();
}

uint64_t sub_2371922B8()
{
  return MEMORY[0x270F65958]();
}

uint64_t sub_2371922C8()
{
  return MEMORY[0x270F65960]();
}

uint64_t sub_2371922D8()
{
  return MEMORY[0x270F65978]();
}

uint64_t sub_2371922E8()
{
  return MEMORY[0x270F65980]();
}

uint64_t sub_2371922F8()
{
  return MEMORY[0x270F65988]();
}

uint64_t sub_237192308()
{
  return MEMORY[0x270F65990]();
}

uint64_t sub_237192318()
{
  return MEMORY[0x270F659B8]();
}

uint64_t sub_237192328()
{
  return MEMORY[0x270F659C0]();
}

uint64_t sub_237192338()
{
  return MEMORY[0x270F659D0]();
}

uint64_t sub_237192348()
{
  return MEMORY[0x270F659F8]();
}

uint64_t sub_237192358()
{
  return MEMORY[0x270F65A00]();
}

uint64_t sub_237192368()
{
  return MEMORY[0x270F65A18]();
}

uint64_t sub_237192378()
{
  return MEMORY[0x270F65A20]();
}

uint64_t sub_2371923B8()
{
  return MEMORY[0x270F65A50]();
}

uint64_t sub_2371923C8()
{
  return MEMORY[0x270F65A58]();
}

uint64_t sub_237192418()
{
  return MEMORY[0x270F65A98]();
}

uint64_t sub_237192458()
{
  return MEMORY[0x270F65AB8]();
}

uint64_t sub_237192488()
{
  return MEMORY[0x270F65BF0]();
}

uint64_t sub_2371924A8()
{
  return MEMORY[0x270F65C00]();
}

uint64_t sub_2371924F8()
{
  return MEMORY[0x270F65C28]();
}

uint64_t sub_237192508()
{
  return MEMORY[0x270F65C30]();
}

uint64_t sub_237192518()
{
  return MEMORY[0x270F65C38]();
}

uint64_t sub_237192528()
{
  return MEMORY[0x270F65D40]();
}

uint64_t sub_237192538()
{
  return MEMORY[0x270F65D50]();
}

uint64_t sub_237192548()
{
  return MEMORY[0x270F65D68]();
}

uint64_t sub_237192558()
{
  return MEMORY[0x270F65D70]();
}

uint64_t sub_237192568()
{
  return MEMORY[0x270F65D78]();
}

uint64_t sub_237192578()
{
  return MEMORY[0x270F65D80]();
}

uint64_t sub_237192588()
{
  return MEMORY[0x270F65D88]();
}

uint64_t sub_237192598()
{
  return MEMORY[0x270F65D90]();
}

uint64_t sub_2371925A8()
{
  return MEMORY[0x270F65DA0]();
}

uint64_t sub_2371925B8()
{
  return MEMORY[0x270F65DB0]();
}

uint64_t sub_2371925C8()
{
  return MEMORY[0x270F65DB8]();
}

uint64_t sub_2371925D8()
{
  return MEMORY[0x270F65DD8]();
}

uint64_t sub_2371925E8()
{
  return MEMORY[0x270F65DE8]();
}

uint64_t sub_2371925F8()
{
  return MEMORY[0x270F65DF0]();
}

uint64_t sub_237192608()
{
  return MEMORY[0x270F65E00]();
}

uint64_t sub_237192618()
{
  return MEMORY[0x270F65E08]();
}

uint64_t sub_237192628()
{
  return MEMORY[0x270F65E10]();
}

uint64_t sub_237192638()
{
  return MEMORY[0x270F65E30]();
}

uint64_t sub_237192648()
{
  return MEMORY[0x270F65E38]();
}

uint64_t sub_237192668()
{
  return MEMORY[0x270F65E58]();
}

uint64_t sub_237192688()
{
  return MEMORY[0x270F65E70]();
}

uint64_t sub_2371926A8()
{
  return MEMORY[0x270F683E0]();
}

uint64_t sub_2371926B8()
{
  return MEMORY[0x270F683E8]();
}

uint64_t sub_2371926C8()
{
  return MEMORY[0x270F683F8]();
}

uint64_t sub_2371926D8()
{
  return MEMORY[0x270F652C0]();
}

uint64_t sub_2371926E8()
{
  return MEMORY[0x270F728F8]();
}

uint64_t sub_2371926F8()
{
  return MEMORY[0x270F72918]();
}

uint64_t sub_237192708()
{
  return MEMORY[0x270F72938]();
}

uint64_t sub_237192718()
{
  return MEMORY[0x270F72940]();
}

uint64_t sub_237192728()
{
  return MEMORY[0x270F72948]();
}

uint64_t sub_237192738()
{
  return MEMORY[0x270F72950]();
}

uint64_t sub_237192748()
{
  return MEMORY[0x270F72958]();
}

uint64_t sub_237192758()
{
  return MEMORY[0x270F729D8]();
}

uint64_t sub_237192768()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_237192778()
{
  return MEMORY[0x270F72A20]();
}

uint64_t sub_237192788()
{
  return MEMORY[0x270F72A28]();
}

uint64_t sub_237192798()
{
  return MEMORY[0x270F72A48]();
}

uint64_t sub_2371927A8()
{
  return MEMORY[0x270F72A68]();
}

uint64_t sub_2371927B8()
{
  return MEMORY[0x270F72A70]();
}

uint64_t sub_2371927C8()
{
  return MEMORY[0x270F72C20]();
}

uint64_t sub_2371927D8()
{
  return MEMORY[0x270F64900]();
}

uint64_t sub_2371927E8()
{
  return MEMORY[0x270F64908]();
}

uint64_t sub_2371927F8()
{
  return MEMORY[0x270F64918]();
}

uint64_t sub_237192808()
{
  return MEMORY[0x270F64920]();
}

uint64_t sub_237192818()
{
  return MEMORY[0x270F64928]();
}

uint64_t sub_237192828()
{
  return MEMORY[0x270F64930]();
}

uint64_t sub_237192838()
{
  return MEMORY[0x270F64960]();
}

uint64_t sub_237192848()
{
  return MEMORY[0x270F64968]();
}

uint64_t sub_237192858()
{
  return MEMORY[0x270F64970]();
}

uint64_t sub_237192868()
{
  return MEMORY[0x270F64978]();
}

uint64_t sub_237192878()
{
  return MEMORY[0x270F64988]();
}

uint64_t sub_237192888()
{
  return MEMORY[0x270F64998]();
}

uint64_t sub_237192898()
{
  return MEMORY[0x270F649A8]();
}

uint64_t sub_2371928A8()
{
  return MEMORY[0x270F649B8]();
}

uint64_t sub_2371928B8()
{
  return MEMORY[0x270F649C8]();
}

uint64_t sub_2371928C8()
{
  return MEMORY[0x270F649D0]();
}

uint64_t sub_2371928D8()
{
  return MEMORY[0x270F649D8]();
}

uint64_t sub_2371928E8()
{
  return MEMORY[0x270F649E8]();
}

uint64_t sub_2371928F8()
{
  return MEMORY[0x270F649F8]();
}

uint64_t sub_237192908()
{
  return MEMORY[0x270F64A10]();
}

uint64_t sub_237192918()
{
  return MEMORY[0x270F64A20]();
}

uint64_t sub_237192928()
{
  return MEMORY[0x270F64A28]();
}

uint64_t sub_237192938()
{
  return MEMORY[0x270F64A30]();
}

uint64_t sub_237192948()
{
  return MEMORY[0x270F64B58]();
}

uint64_t sub_237192958()
{
  return MEMORY[0x270F64C48]();
}

uint64_t sub_237192968()
{
  return MEMORY[0x270F64CE8]();
}

uint64_t sub_237192978()
{
  return MEMORY[0x270F64D08]();
}

uint64_t sub_237192988()
{
  return MEMORY[0x270F64D10]();
}

uint64_t sub_237192998()
{
  return MEMORY[0x270F64D18]();
}

uint64_t sub_2371929A8()
{
  return MEMORY[0x270F64D20]();
}

uint64_t sub_2371929B8()
{
  return MEMORY[0x270F64D30]();
}

uint64_t sub_2371929C8()
{
  return MEMORY[0x270F64DF8]();
}

uint64_t sub_2371929D8()
{
  return MEMORY[0x270F64E00]();
}

uint64_t sub_2371929E8()
{
  return MEMORY[0x270F64E08]();
}

uint64_t sub_2371929F8()
{
  return MEMORY[0x270F64E10]();
}

uint64_t sub_237192A08()
{
  return MEMORY[0x270F64E18]();
}

uint64_t sub_237192A18()
{
  return MEMORY[0x270F64E98]();
}

uint64_t sub_237192A28()
{
  return MEMORY[0x270F64EA0]();
}

uint64_t sub_237192A38()
{
  return MEMORY[0x270F64F28]();
}

uint64_t sub_237192A48()
{
  return MEMORY[0x270F64F48]();
}

uint64_t sub_237192A58()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t sub_237192A68()
{
  return MEMORY[0x270F64FC8]();
}

uint64_t sub_237192A78()
{
  return MEMORY[0x270F64FD0]();
}

uint64_t sub_237192A88()
{
  return MEMORY[0x270F64FD8]();
}

uint64_t sub_237192A98()
{
  return MEMORY[0x270F64FE8]();
}

uint64_t sub_237192AA8()
{
  return MEMORY[0x270F65130]();
}

uint64_t sub_237192AB8()
{
  return MEMORY[0x270F65158]();
}

uint64_t sub_237192AC8()
{
  return MEMORY[0x270F65180]();
}

uint64_t sub_237192AD8()
{
  return MEMORY[0x270F63AE0]();
}

uint64_t sub_237192AE8()
{
  return MEMORY[0x270F63B10]();
}

uint64_t sub_237192AF8()
{
  return MEMORY[0x270F65F10]();
}

uint64_t sub_237192B08()
{
  return MEMORY[0x270F65F18]();
}

uint64_t sub_237192B18()
{
  return MEMORY[0x270F65FB8]();
}

uint64_t sub_237192B28()
{
  return MEMORY[0x270F65FC0]();
}

uint64_t sub_237192B58()
{
  return MEMORY[0x270F0C820]();
}

uint64_t sub_237192B68()
{
  return MEMORY[0x270F0C830]();
}

uint64_t sub_237192B78()
{
  return MEMORY[0x270F0C840]();
}

uint64_t sub_237192B88()
{
  return MEMORY[0x270F0C858]();
}

uint64_t sub_237192B98()
{
  return MEMORY[0x270F0C868]();
}

uint64_t sub_237192BA8()
{
  return MEMORY[0x270F0C870]();
}

uint64_t sub_237192BB8()
{
  return MEMORY[0x270F0C888]();
}

uint64_t sub_237192BC8()
{
  return MEMORY[0x270F0C898]();
}

uint64_t sub_237192BD8()
{
  return MEMORY[0x270F0C8A8]();
}

uint64_t sub_237192BE8()
{
  return MEMORY[0x270F0C8B0]();
}

uint64_t sub_237192BF8()
{
  return MEMORY[0x270F0C8C0]();
}

uint64_t sub_237192C48()
{
  return MEMORY[0x270F0CA30]();
}

uint64_t sub_237192C58()
{
  return MEMORY[0x270F0CB10]();
}

uint64_t sub_237192C68()
{
  return MEMORY[0x270F0CB20]();
}

uint64_t sub_237192C78()
{
  return MEMORY[0x270F0CB38]();
}

uint64_t sub_237192C88()
{
  return MEMORY[0x270F0CB48]();
}

uint64_t sub_237192C98()
{
  return MEMORY[0x270F0CB50]();
}

uint64_t sub_237192CC8()
{
  return MEMORY[0x270F65300]();
}

uint64_t sub_237192CD8()
{
  return MEMORY[0x270F706A8]();
}

uint64_t sub_237192CE8()
{
  return MEMORY[0x270F706D0]();
}

uint64_t sub_237192CF8()
{
  return MEMORY[0x270F706F0]();
}

uint64_t sub_237192D08()
{
  return MEMORY[0x270F706F8]();
}

uint64_t sub_237192D18()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_237192D28()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_237192D38()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_237192D48()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_237192D58()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_237192D68()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_237192D78()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_237192D88()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_237192D98()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_237192DA8()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_237192DB8()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_237192DC8()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_237192DD8()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_237192DE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_237192DF8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_237192E08()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_237192E18()
{
  return MEMORY[0x270F70760]();
}

uint64_t sub_237192E28()
{
  return MEMORY[0x270F70768]();
}

uint64_t sub_237192E38()
{
  return MEMORY[0x270F707C0]();
}

uint64_t sub_237192E48()
{
  return MEMORY[0x270F707E0]();
}

uint64_t sub_237192E58()
{
  return MEMORY[0x270F70820]();
}

uint64_t sub_237192E68()
{
  return MEMORY[0x270F709A8]();
}

uint64_t sub_237192E78()
{
  return MEMORY[0x270F709B0]();
}

uint64_t sub_237192E88()
{
  return MEMORY[0x270F709B8]();
}

uint64_t sub_237192E98()
{
  return MEMORY[0x270F70A58]();
}

uint64_t sub_237192EA8()
{
  return MEMORY[0x270F70A80]();
}

uint64_t sub_237192EB8()
{
  return MEMORY[0x270F70AA8]();
}

uint64_t sub_237192EC8()
{
  return MEMORY[0x270F70AB0]();
}

uint64_t sub_237192ED8()
{
  return MEMORY[0x270F70AD0]();
}

uint64_t sub_237192EE8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_237192EF8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_237192F08()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_237192F18()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_237192F28()
{
  return MEMORY[0x270F9D378]();
}

uint64_t sub_237192F38()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_237192F48()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_237192F58()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_237192F68()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_237192F78()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_237192F88()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_237192F98()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_237192FA8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_237192FB8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_237192FC8()
{
  return MEMORY[0x270F9D5E8]();
}

uint64_t sub_237192FD8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_237192FE8()
{
  return MEMORY[0x270F65190]();
}

uint64_t sub_237192FF8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_237193008()
{
  return MEMORY[0x270F9D718]();
}

uint64_t sub_237193018()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_237193028()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_237193038()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_237193048()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_237193058()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_237193068()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_237193078()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_237193088()
{
  return MEMORY[0x270F9D870]();
}

uint64_t sub_237193098()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2371930A8()
{
  return MEMORY[0x270F9D8C0]();
}

uint64_t sub_2371930B8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2371930C8()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_2371930D8()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_2371930E8()
{
  return MEMORY[0x270F9DAA0]();
}

uint64_t sub_2371930F8()
{
  return MEMORY[0x270F9DB20]();
}

uint64_t sub_237193108()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_237193118()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_237193128()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_237193138()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_237193148()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_237193158()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_237193168()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_237193178()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_237193188()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_237193198()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2371931A8()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_2371931B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2371931C8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2371931D8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2371931E8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2371931F8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_237193208()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_237193218()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_237193228()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_237193238()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_237193248()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_237193258()
{
  return MEMORY[0x270EE5820]();
}

uint64_t sub_237193268()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_237193278()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_237193288()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_237193298()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2371932A8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2371932B8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2371932C8()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2371932D8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2371932E8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2371932F8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_237193308()
{
  return MEMORY[0x270F68448]();
}

uint64_t sub_237193318()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_237193328()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_237193338()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_237193348()
{
  return MEMORY[0x270F9E470]();
}

uint64_t sub_237193358()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_237193368()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_237193378()
{
  return MEMORY[0x270EF2400]();
}

uint64_t sub_237193388()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_237193398()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2371933A8()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_2371933B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2371933D8()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_2371933E8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2371933F8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_237193408()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_237193418()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_237193428()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_237193438()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_237193448()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_237193458()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_237193468()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_237193478()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_237193488()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_237193498()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2371934A8()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_2371934B8()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2371934C8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2371934D8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2371934E8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2371934F8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_237193508()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_237193518()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_237193528()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_237193538()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_237193548()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_237193558()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_237193568()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_237193578()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_237193588()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_237193598()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2371935A8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2371935B8()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2371935C8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2371935D8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2371935E8()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2371935F8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_237193608()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_237193618()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_237193628()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_237193638()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_237193648()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_237193658()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_237193668()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_237193678()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_237193688()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_237193698()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2371936A8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2371936B8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2371936C8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2371936D8()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2371936E8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2371936F8()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_237193708()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_237193718()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_237193728()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_237193738()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_237193748()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_237193758()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_237193768()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_237193778()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_237193788()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_237193798()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2371937A8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2371937B8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2371937C8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2371937D8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_237193808()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_237193818()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_237193828()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_237193838()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_237193848()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_237193858()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_237193868()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_237193878()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_237193888()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_237193898()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2371938A8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2371938B8()
{
  return MEMORY[0x270F9FD98]();
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

void objc_storeStrong(id *location, id obj)
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}