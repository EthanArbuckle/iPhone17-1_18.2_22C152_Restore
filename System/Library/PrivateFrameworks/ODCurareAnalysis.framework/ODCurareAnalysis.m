uint64_t variable initialization expression of BinomialTestResult.testType()
{
  return 0x6C61696D6F6E6942;
}

uint64_t variable initialization expression of ZTestResult.testType()
{
  return 0x747365545ALL;
}

uint64_t variable initialization expression of KSTestTwoSampleResult.testType()
{
  return 0x775474736554534BLL;
}

uint64_t variable initialization expression of MalformedTestResult.testType()
{
  return 0x656D726F666C614DLL;
}

uint64_t variable initialization expression of MalformedTestResult.testRan()
{
  return 0;
}

uint64_t variable initialization expression of MalformedTestResult.testSkippedReason()
{
  return 0;
}

uint64_t variable initialization expression of MalformedTestResult.nextLastRun@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2309B5678();
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 1, 1, v2);
}

uint64_t destroy for Call()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s16ODCurareAnalysis4CallVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Call(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for Call(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Call(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Call(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Call()
{
  return &type metadata for Call;
}

uint64_t initializeBufferWithCopyOfBuffer for Test(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Test()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for Test(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for Test(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Test(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Test(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Test(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Test()
{
  return &type metadata for Test;
}

uint64_t sub_23099CDF0(uint64_t a1)
{
  sub_23099D880(a1, (uint64_t)&v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098B0);
  if (swift_dynamicCast())
  {
    if (*(void *)(v10 + 16)
      && (unint64_t v3 = sub_23099F300(0x6E6F6974636E7566, 0xE800000000000000), (v4 & 1) != 0)
      && (sub_23099D880(*(void *)(v10 + 56) + 32 * v3, (uint64_t)&v11), (swift_dynamicCast() & 1) != 0))
    {
      uint64_t v1 = v10;
      if (*(void *)(v10 + 16) && (unint64_t v5 = sub_23099F300(0x746E656D75677261, 0xE900000000000073), (v6 & 1) != 0))
      {
        sub_23099D880(*(void *)(v10 + 56) + 32 * v5, (uint64_t)&v11);
      }
      else
      {
        long long v11 = 0u;
        long long v12 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v12 + 1))
      {
        if (swift_dynamicCast())
        {
          __swift_destroy_boxed_opaque_existential_0(a1);
          return v1;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_23099DA04((uint64_t)&v11);
      }
      sub_23099D920();
      swift_allocError();
      *(void *)uint64_t v7 = 0xD000000000000032;
      v8 = "Call arguments must be represented as a dictionary";
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_23099D920();
      swift_allocError();
      *(void *)uint64_t v7 = 0xD000000000000032;
      v8 = "Call function name must be represented as a string";
    }
  }
  else
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD000000000000036;
    v8 = "Call specification must be represented as a dictionary";
  }
  *(void *)(v7 + 8) = (unint64_t)(v8 - 32) | 0x8000000000000000;
  *(unsigned char *)(v7 + 16) = 0;
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v1;
}

uint64_t sub_23099D048@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = a1;
  sub_23099D880(a1, (uint64_t)v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098B0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000036;
    v23 = "Test specification must be represented as a dictionary";
LABEL_19:
    *(void *)(v22 + 8) = (unint64_t)(v23 - 32) | 0x8000000000000000;
    *(unsigned char *)(v22 + 16) = 0;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0(v3);
  }
  uint64_t v5 = v68[0];
  if (!*(void *)(v68[0] + 16)
    || (unint64_t v6 = sub_23099F300(0x73646C656966, 0xE600000000000000), (v7 & 1) == 0)
    || (sub_23099D880(*(void *)(v68[0] + 56) + 32 * v6, (uint64_t)v69),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687098C0),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000036;
    v23 = "Test fields must be represented as an array of strings";
    goto LABEL_19;
  }
  if (!*(void *)(v68[0] + 16)
    || (unint64_t v8 = sub_23099F300(0xD000000000000012, 0x80000002309B6800), (v9 & 1) == 0)
    || (sub_23099D880(*(void *)(v68[0] + 56) + 32 * v8, (uint64_t)v69),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687098C8),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000023;
    v23 = "Failed to parse preprocessing steps";
    goto LABEL_19;
  }
  uint64_t v67 = v68[0];
  int64_t v10 = *(void *)(v68[0] + 16);
  if (v10)
  {
    v60 = a2;
    uint64_t v63 = v68[0];
    uint64_t v64 = v3;
    uint64_t v71 = MEMORY[0x263F8EE78];
    sub_2309AE944(0, v10, 0);
    uint64_t v11 = v68[0] + 32;
    while (1)
    {
      sub_23099D880(v11, (uint64_t)v69);
      sub_23099D880((uint64_t)v69, (uint64_t)v68);
      uint64_t v12 = sub_23099CDF0((uint64_t)v68);
      if (v2) {
        break;
      }
      uint64_t v15 = v12;
      uint64_t v16 = v13;
      uint64_t v17 = v14;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
      uint64_t v18 = v71;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AE944(0, *(void *)(v18 + 16) + 1, 1);
        uint64_t v18 = v71;
      }
      unint64_t v20 = *(void *)(v18 + 16);
      unint64_t v19 = *(void *)(v18 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_2309AE944((char *)(v19 > 1), v20 + 1, 1);
        uint64_t v18 = v71;
      }
      *(void *)(v18 + 16) = v20 + 1;
      v21 = (void *)(v18 + 24 * v20);
      v21[4] = v15;
      v21[5] = v16;
      v21[6] = v17;
      v11 += 32;
      if (!--v10)
      {
        uint64_t v66 = v18;
        swift_bridgeObjectRelease();
        uint64_t v5 = v63;
        uint64_t v3 = v64;
        a2 = v60;
        goto LABEL_24;
      }
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    MEMORY[0x230FC3C60](v2);
    swift_bridgeObjectRelease();
    uint64_t v3 = v64;
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  uint64_t v66 = MEMORY[0x263F8EE78];
LABEL_24:
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
  uint64_t v70 = v59;
  uint64_t v25 = swift_allocObject();
  v26 = (_OWORD *)(v25 + 16);
  v69[0] = v25;
  if (*(void *)(v5 + 16) && (unint64_t v27 = sub_23099F300(0x6E697474696C7073, 0xED00007065745367), (v28 & 1) != 0))
  {
    sub_23099D880(*(void *)(v5 + 56) + 32 * v27, (uint64_t)v26);
  }
  else
  {
    _OWORD *v26 = 0u;
    v26[1] = 0u;
  }
  uint64_t v29 = sub_23099CDF0((uint64_t)v69);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x230FC3C60](v2);
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD00000000000001ELL;
    v23 = "Failed to parse splitting step";
    goto LABEL_19;
  }
  uint64_t v32 = v30;
  uint64_t v33 = v31;
  uint64_t v58 = v29;
  if (!*(void *)(v5 + 16)
    || (unint64_t v34 = sub_23099F300(0xD000000000000013, 0x80000002309B6870), (v35 & 1) == 0)
    || (sub_23099D880(*(void *)(v5 + 56) + 32 * v34, (uint64_t)v69), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000024;
    v23 = "Failed to parse postprocessing steps";
    goto LABEL_19;
  }
  uint64_t v62 = v32;
  uint64_t v57 = v33;
  uint64_t v36 = v68[0];
  int64_t v37 = *(void *)(v68[0] + 16);
  if (v37)
  {
    v61 = a2;
    uint64_t v65 = v3;
    uint64_t v71 = MEMORY[0x263F8EE78];
    sub_2309AE944(0, v37, 0);
    uint64_t v38 = v36 + 32;
    do
    {
      sub_23099D880(v38, (uint64_t)v69);
      sub_23099D880((uint64_t)v69, (uint64_t)v68);
      uint64_t v39 = sub_23099CDF0((uint64_t)v68);
      uint64_t v41 = v40;
      uint64_t v43 = v42;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v69);
      uint64_t v44 = v71;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AE944(0, *(void *)(v44 + 16) + 1, 1);
        uint64_t v44 = v71;
      }
      unint64_t v46 = *(void *)(v44 + 16);
      unint64_t v45 = *(void *)(v44 + 24);
      if (v46 >= v45 >> 1)
      {
        sub_2309AE944((char *)(v45 > 1), v46 + 1, 1);
        uint64_t v44 = v71;
      }
      *(void *)(v44 + 16) = v46 + 1;
      v47 = (void *)(v44 + 24 * v46);
      v47[4] = v39;
      v47[5] = v41;
      v47[6] = v43;
      v38 += 32;
      --v37;
    }
    while (v37);
    swift_bridgeObjectRelease();
    uint64_t v3 = v65;
    a2 = v61;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v44 = MEMORY[0x263F8EE78];
  }
  uint64_t v70 = v59;
  uint64_t v48 = swift_allocObject();
  v49 = (_OWORD *)(v48 + 16);
  v69[0] = v48;
  if (*(void *)(v5 + 16) && (unint64_t v50 = sub_23099F300(0x7065745374736574, 0xE800000000000000), (v51 & 1) != 0))
  {
    sub_23099D880(*(void *)(v5 + 56) + 32 * v50, (uint64_t)v49);
  }
  else
  {
    _OWORD *v49 = 0u;
    v49[1] = 0u;
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = sub_23099CDF0((uint64_t)v69);
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t result = __swift_destroy_boxed_opaque_existential_0(v3);
  *a2 = v67;
  a2[1] = v66;
  a2[2] = v58;
  a2[3] = v62;
  a2[4] = v57;
  a2[5] = v44;
  a2[6] = v52;
  a2[7] = v54;
  a2[8] = v56;
  return result;
}

uint64_t sub_23099D880(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

unint64_t sub_23099D920()
{
  unint64_t result = qword_2687098B8;
  if (!qword_2687098B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687098B8);
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

uint64_t sub_23099D9C4()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23099DA04(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23099DA64()
{
  unint64_t result = sub_2309AF518((uint64_t)&unk_26E537918);
  qword_268709A30 = result;
  return result;
}

void sub_23099DA8C(double a1)
{
  if (a1 != 0.0 && a1 != 1.0 && a1 >= 0.0 && a1 <= 1.0)
  {
    double v3 = 1.0 - a1;
    if (a1 >= 0.5) {
      double v4 = a1;
    }
    else {
      double v4 = v3;
    }
    if (qword_2687098A8 != -1) {
      swift_once();
    }
    uint64_t v5 = qword_268709A30;
    swift_bridgeObjectRetain_n();
    unint64_t v6 = (char *)sub_23099DD94(v5);
    swift_bridgeObjectRelease();
    unint64_t v20 = v6;
    sub_23099DD28(&v20);
    swift_bridgeObjectRelease();
    unint64_t v7 = *((void *)v20 + 2);
    if (v7)
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0;
      for (unint64_t i = 0; i != v7; ++i)
      {
        if (*(double *)&v20[8 * i + 32] <= v4)
        {
          unint64_t v8 = i + 1;
          unint64_t v9 = i;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0;
    }
    if (v9 >= v7)
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = v20 + 32;
      double v12 = *(double *)&v20[8 * v9 + 32];
      if (v4 != v12)
      {
        if (v8 != v7)
        {
          if (v8 >= v7)
          {
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
          double v15 = *(double *)&v11[8 * v8];
          uint64_t v16 = qword_268709A30;
          if (v4 == v15)
          {
            swift_release();
            if (!*(void *)(v16 + 16))
            {
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
            sub_23099F378(v15);
            if (v17) {
              return;
            }
            __break(1u);
          }
          if (!*(void *)(v16 + 16))
          {
LABEL_41:
            __break(1u);
            goto LABEL_42;
          }
          sub_23099F378(v12);
          if ((v18 & 1) == 0)
          {
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
          sub_23099F378(*(double *)&v11[8 * v8]);
          if ((v19 & 1) == 0)
          {
LABEL_43:
            __break(1u);
            swift_release();
            __break(1u);
            return;
          }
        }
        swift_release();
        return;
      }
      uint64_t v13 = qword_268709A30;
      swift_release();
      if (*(void *)(v13 + 16))
      {
        sub_23099F378(v12);
        if (v14) {
          return;
        }
        goto LABEL_38;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
}

uint64_t sub_23099DD28(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23099E8C0((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_23099DF5C(v5);
  *a1 = v2;
  return result;
}

void *sub_23099DD94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  unint64_t v6 = sub_23099E8D4(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_23099EA68();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_23099DE7C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687098B0);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687098E8);
      unint64_t v7 = (void *)swift_allocObject();
      int64_t v8 = _swift_stdlib_malloc_size(v7);
      uint64_t v9 = v8 - 32;
      if (v8 < 32) {
        uint64_t v9 = v8 - 25;
      }
      v7[2] = v5;
      v7[3] = 2 * (v9 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t sub_23099DF5C(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_2309B58B8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v81 = *(double *)(v79 + 8 * i);
        uint64_t v82 = v78;
        do
        {
          uint64_t v83 = v79 + 8 * v82;
          if (v81 >= *(double *)v83) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(void *)(v83 + 8) = *(void *)v83;
          *(double *)(v79 + 8 * v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_136;
    }
    uint64_t v95 = result;
    uint64_t v96 = v3;
    if (v3 > 1)
    {
      uint64_t v6 = v5 >> 1;
      uint64_t result = sub_2309B5738();
      *(void *)(result + 16) = v6;
      uint64_t v3 = v96;
      uint64_t v94 = result;
      v98 = (double *)(result + 32);
LABEL_13:
      uint64_t v8 = 0;
      uint64_t v9 = *v2;
      v92 = v2;
      uint64_t v93 = *v2 - 8;
      uint64_t v10 = MEMORY[0x263F8EE78];
      uint64_t v97 = *v2;
      while (1)
      {
        uint64_t v12 = v8++;
        if (v8 < v3)
        {
          double v13 = *(double *)(v9 + 8 * v8);
          double v14 = *(double *)(v9 + 8 * v12);
          uint64_t v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            double v15 = v13;
            while (1)
            {
              double v16 = v15;
              double v15 = *(double *)(v9 + 8 * v8);
              if (v13 < v14 == v15 >= v16) {
                break;
              }
              if (v3 == ++v8)
              {
                uint64_t v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12) {
              goto LABEL_138;
            }
            if (v12 < v8)
            {
              char v17 = (uint64_t *)(v93 + 8 * v8);
              uint64_t v18 = v8;
              uint64_t v19 = v12;
              unint64_t v20 = (uint64_t *)(v9 + 8 * v12);
              do
              {
                if (v19 != --v18)
                {
                  if (!v9) {
                    goto LABEL_144;
                  }
                  uint64_t v21 = *v20;
                  *unint64_t v20 = *v17;
                  *char v17 = v21;
                }
                ++v19;
                --v17;
                ++v20;
              }
              while (v19 < v18);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12)) {
            goto LABEL_135;
          }
          if (v8 - v12 < v95)
          {
            uint64_t v22 = v12 + v95;
            if (__OFADD__(v12, v95)) {
              goto LABEL_139;
            }
            if (v22 >= v3) {
              uint64_t v22 = v3;
            }
            if (v22 < v12)
            {
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
              return result;
            }
            if (v8 != v22)
            {
              v23 = (double *)(v93 + 8 * v8);
              do
              {
                double v24 = *(double *)(v9 + 8 * v8);
                uint64_t v25 = v12;
                v26 = v23;
                do
                {
                  double v27 = *v26;
                  if (v24 >= *v26) {
                    break;
                  }
                  if (!v9) {
                    goto LABEL_142;
                  }
                  double *v26 = v24;
                  v26[1] = v27;
                  --v26;
                  ++v25;
                }
                while (v8 != v25);
                ++v8;
                ++v23;
              }
              while (v8 != v22);
              uint64_t v8 = v22;
            }
          }
        }
        if (v8 < v12) {
          goto LABEL_130;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_23099E7B0(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        unint64_t v29 = *(void *)(v10 + 16);
        unint64_t v28 = *(void *)(v10 + 24);
        unint64_t v11 = v29 + 1;
        uint64_t v9 = v97;
        if (v29 >= v28 >> 1)
        {
          uint64_t result = (uint64_t)sub_23099E7B0((char *)(v28 > 1), v29 + 1, 1, (char *)v10);
          uint64_t v9 = v97;
          uint64_t v10 = result;
        }
        *(void *)(v10 + 16) = v11;
        uint64_t v30 = v10 + 32;
        uint64_t v31 = (uint64_t *)(v10 + 32 + 16 * v29);
        *uint64_t v31 = v12;
        v31[1] = v8;
        if (v29)
        {
          while (1)
          {
            unint64_t v32 = v11 - 1;
            if (v11 >= 4)
            {
              unint64_t v37 = v30 + 16 * v11;
              uint64_t v38 = *(void *)(v37 - 64);
              uint64_t v39 = *(void *)(v37 - 56);
              BOOL v43 = __OFSUB__(v39, v38);
              uint64_t v40 = v39 - v38;
              if (v43) {
                goto LABEL_119;
              }
              uint64_t v42 = *(void *)(v37 - 48);
              uint64_t v41 = *(void *)(v37 - 40);
              BOOL v43 = __OFSUB__(v41, v42);
              uint64_t v35 = v41 - v42;
              char v36 = v43;
              if (v43) {
                goto LABEL_120;
              }
              unint64_t v44 = v11 - 2;
              unint64_t v45 = (uint64_t *)(v30 + 16 * (v11 - 2));
              uint64_t v47 = *v45;
              uint64_t v46 = v45[1];
              BOOL v43 = __OFSUB__(v46, v47);
              uint64_t v48 = v46 - v47;
              if (v43) {
                goto LABEL_121;
              }
              BOOL v43 = __OFADD__(v35, v48);
              uint64_t v49 = v35 + v48;
              if (v43) {
                goto LABEL_123;
              }
              if (v49 >= v40)
              {
                uint64_t v67 = (uint64_t *)(v30 + 16 * v32);
                uint64_t v69 = *v67;
                uint64_t v68 = v67[1];
                BOOL v43 = __OFSUB__(v68, v69);
                uint64_t v70 = v68 - v69;
                if (v43) {
                  goto LABEL_129;
                }
                BOOL v60 = v35 < v70;
                goto LABEL_83;
              }
            }
            else
            {
              if (v11 != 3)
              {
                uint64_t v61 = *(void *)(v10 + 32);
                uint64_t v62 = *(void *)(v10 + 40);
                BOOL v43 = __OFSUB__(v62, v61);
                uint64_t v54 = v62 - v61;
                char v55 = v43;
                goto LABEL_77;
              }
              uint64_t v34 = *(void *)(v10 + 32);
              uint64_t v33 = *(void *)(v10 + 40);
              BOOL v43 = __OFSUB__(v33, v34);
              uint64_t v35 = v33 - v34;
              char v36 = v43;
            }
            if (v36) {
              goto LABEL_122;
            }
            unint64_t v44 = v11 - 2;
            unint64_t v50 = (uint64_t *)(v30 + 16 * (v11 - 2));
            uint64_t v52 = *v50;
            uint64_t v51 = v50[1];
            BOOL v53 = __OFSUB__(v51, v52);
            uint64_t v54 = v51 - v52;
            char v55 = v53;
            if (v53) {
              goto LABEL_124;
            }
            uint64_t v56 = (uint64_t *)(v30 + 16 * v32);
            uint64_t v58 = *v56;
            uint64_t v57 = v56[1];
            BOOL v43 = __OFSUB__(v57, v58);
            uint64_t v59 = v57 - v58;
            if (v43) {
              goto LABEL_126;
            }
            if (__OFADD__(v54, v59)) {
              goto LABEL_128;
            }
            if (v54 + v59 >= v35)
            {
              BOOL v60 = v35 < v59;
LABEL_83:
              if (v60) {
                unint64_t v32 = v44;
              }
              goto LABEL_85;
            }
LABEL_77:
            if (v55) {
              goto LABEL_125;
            }
            uint64_t v63 = (uint64_t *)(v30 + 16 * v32);
            uint64_t v65 = *v63;
            uint64_t v64 = v63[1];
            BOOL v43 = __OFSUB__(v64, v65);
            uint64_t v66 = v64 - v65;
            if (v43) {
              goto LABEL_127;
            }
            if (v66 < v54) {
              goto LABEL_15;
            }
LABEL_85:
            unint64_t v71 = v32 - 1;
            if (v32 - 1 >= v11)
            {
              __break(1u);
LABEL_116:
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
              goto LABEL_140;
            }
            if (!v9) {
              goto LABEL_143;
            }
            v72 = (uint64_t *)(v30 + 16 * v71);
            uint64_t v73 = *v72;
            uint64_t v74 = v30;
            v75 = (void *)(v30 + 16 * v32);
            uint64_t v76 = v75[1];
            uint64_t result = sub_23099E5AC((double *)(v9 + 8 * *v72), (double *)(v9 + 8 * *v75), v9 + 8 * v76, v98);
            if (v1) {
              goto LABEL_113;
            }
            if (v76 < v73) {
              goto LABEL_116;
            }
            if (v32 > *(void *)(v10 + 16)) {
              goto LABEL_117;
            }
            uint64_t *v72 = v73;
            *(void *)(v74 + 16 * v71 + 8) = v76;
            unint64_t v77 = *(void *)(v10 + 16);
            if (v32 >= v77) {
              goto LABEL_118;
            }
            unint64_t v11 = v77 - 1;
            uint64_t result = (uint64_t)memmove(v75, v75 + 2, 16 * (v77 - 1 - v32));
            uint64_t v30 = v74;
            *(void *)(v10 + 16) = v77 - 1;
            uint64_t v9 = v97;
            if (v77 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v11 = 1;
LABEL_15:
        uint64_t v3 = v96;
        if (v8 >= v96)
        {
          uint64_t v7 = v94;
          uint64_t v2 = v92;
          goto LABEL_102;
        }
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    v98 = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 == 1)
    {
      uint64_t v94 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_102:
    uint64_t v94 = v7;
    if (v11 >= 2)
    {
      uint64_t v84 = *v2;
      do
      {
        unint64_t v85 = v11 - 2;
        if (v11 < 2) {
          goto LABEL_131;
        }
        if (!v84) {
          goto LABEL_145;
        }
        uint64_t v86 = v10;
        uint64_t v87 = v10 + 32;
        uint64_t v88 = *(void *)(v10 + 32 + 16 * v85);
        uint64_t v89 = *(void *)(v10 + 32 + 16 * (v11 - 1) + 8);
        uint64_t result = sub_23099E5AC((double *)(v84 + 8 * v88), (double *)(v84 + 8 * *(void *)(v87 + 16 * (v11 - 1))), v84 + 8 * v89, v98);
        if (v1) {
          break;
        }
        if (v89 < v88) {
          goto LABEL_132;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_23099E8AC(v86);
          uint64_t v86 = result;
        }
        if (v85 >= *(void *)(v86 + 16)) {
          goto LABEL_133;
        }
        v90 = (void *)(v86 + 32 + 16 * v85);
        void *v90 = v88;
        v90[1] = v89;
        unint64_t v91 = *(void *)(v86 + 16);
        if (v11 > v91) {
          goto LABEL_134;
        }
        uint64_t result = (uint64_t)memmove((void *)(v86 + 32 + 16 * (v11 - 1)), (const void *)(v86 + 32 + 16 * v11), 16 * (v91 - v11));
        uint64_t v10 = v86;
        *(void *)(v86 + 16) = v91 - 1;
        unint64_t v11 = v91 - 1;
      }
      while (v91 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
    *(void *)(v94 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23099E5AC(double *__dst, double *__src, unint64_t a3, double *a4)
{
  unint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = (char *)__src - (char *)__dst;
  int64_t v9 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v9 = (char *)__src - (char *)__dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    double v14 = &v4[v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_39;
    }
    char v17 = (double *)(a3 - 8);
    uint64_t v18 = v6;
    while (1)
    {
      uint64_t v19 = v17 + 1;
      double v20 = *--v18;
      double v21 = v20;
      if (*(v14 - 1) < v20) {
        break;
      }
      double v21 = *(v14 - 1);
      uint64_t v18 = v6;
      if (v19 != v14)
      {
        --v14;
LABEL_35:
        *char v17 = v21;
        goto LABEL_36;
      }
      if (v17 >= v14--) {
        goto LABEL_35;
      }
LABEL_36:
      if (v18 > v7)
      {
        --v17;
        uint64_t v6 = v18;
        if (v14 > v4) {
          continue;
        }
      }
      uint64_t v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  double v14 = &v4[v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      double v15 = *v6;
      if (*v6 >= *v4) {
        break;
      }
      BOOL v16 = v7 == v6++;
      if (!v16) {
        goto LABEL_16;
      }
LABEL_17:
      ++v7;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    double v15 = *v4;
    BOOL v16 = v7 == v4++;
    if (v16) {
      goto LABEL_17;
    }
LABEL_16:
    *uint64_t v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_39:
  int64_t v23 = (char *)v14 - (char *)v4 + ((char *)v14 - (char *)v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= (double *)((char *)v4 + (v23 & 0xFFFFFFFFFFFFFFF8))) {
    memmove(v6, v4, 8 * (v23 >> 3));
  }
  return 1;
}

char *sub_23099E7B0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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
  double v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23099E8AC(uint64_t a1)
{
  return sub_23099E7B0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_23099E8C0(uint64_t a1)
{
  return sub_2309AEB40(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_23099E8D4(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_23099EA68()
{
  return swift_release();
}

uint64_t runPostprocessingSteps(_:steps:lastRun:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return result;
  }
  uint64_t v4 = (uint64_t *)result;
  swift_bridgeObjectRetain();
  for (uint64_t i = (uint64_t *)(a2 + 48); ; i += 3)
  {
    uint64_t v8 = *(i - 2);
    uint64_t v7 = *(i - 1);
    uint64_t v9 = *i;
    BOOL v10 = v8 == 0x786966667573 && v7 == 0xE600000000000000;
    if (v10 || (sub_2309B58C8() & 1) != 0)
    {
      uint64_t v11 = *(void *)(v9 + 16);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v11
        || (unint64_t v12 = sub_23099F300(0x74676E654C78616DLL, 0xE900000000000068), (v13 & 1) == 0)
        || (sub_23099D880(*(void *)(v9 + 56) + 32 * v12, (uint64_t)&v21), (swift_dynamicCast() & 1) == 0))
      {
        swift_bridgeObjectRelease();
        sub_23099D920();
        swift_allocError();
        *(void *)uint64_t v17 = 0xD000000000000025;
        uint64_t v18 = "Suffix expects arguments: (maxLength)";
LABEL_24:
        unint64_t v19 = (unint64_t)(v18 - 32) | 0x8000000000000000;
        goto LABEL_25;
      }
      uint64_t v6 = sub_23099EE30(v23, *v4);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *uint64_t v4 = v6;
      goto LABEL_4;
    }
    if ((v8 != 0xD000000000000010 || v7 != 0x80000002309B69A0) && (sub_2309B58C8() & 1) == 0) {
      break;
    }
    uint64_t v14 = *(void *)(v9 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v14
      || (unint64_t v15 = sub_23099F300(0xD000000000000011, 0x80000002309B69E0), (v16 & 1) == 0)
      || (sub_23099D880(*(void *)(v9 + 56) + 32 * v15, (uint64_t)&v21), (swift_dynamicCast() & 1) == 0))
    {
      swift_bridgeObjectRelease();
      sub_23099D920();
      swift_allocError();
      *(void *)uint64_t v17 = 0xD000000000000037;
      uint64_t v18 = "EnsureTwoSamples expects arguments: (minimumSampleSize)";
      goto LABEL_24;
    }
    sub_23099F160((uint64_t)v4, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    if (!--v2) {
      return swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v21 = 0;
  unint64_t v22 = 0xE000000000000000;
  sub_2309B57C8();
  swift_bridgeObjectRelease();
  unint64_t v21 = 0xD00000000000001DLL;
  unint64_t v22 = 0x80000002309B69C0;
  swift_bridgeObjectRetain();
  sub_2309B56F8();
  swift_bridgeObjectRelease();
  unint64_t v20 = v21;
  unint64_t v19 = v22;
  sub_23099D920();
  swift_allocError();
  *(void *)uint64_t v17 = v20;
LABEL_25:
  *(void *)(v17 + 8) = v19;
  *(unsigned char *)(v17 + 16) = 0;
  swift_willThrow();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23099EE30(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v3 = result;
  if (!result)
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  if (*(void *)(a2 + 16) >= result) {
    int64_t v4 = result;
  }
  else {
    int64_t v4 = *(void *)(a2 + 16);
  }
  v26 = (void *)MEMORY[0x263F8EE78];
  uint64_t v24 = a2;
  sub_2309AE964(0, v4, 0);
  uint64_t v5 = v24;
  uint64_t v6 = v26;
  if (!*(void *)(v24 + 16)) {
    goto LABEL_31;
  }
  uint64_t v23 = *(void *)(v24 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  do
  {
LABEL_8:
    if (v8 >= *(void *)(v5 + 16)) {
      goto LABEL_39;
    }
    uint64_t v9 = (uint64_t *)(v24 + 32 + 32 * v8);
    uint64_t v10 = *v9;
    uint64_t v11 = v9[1];
    uint64_t v12 = v9[2];
    uint64_t v13 = v9[3];
    unint64_t v14 = v26[2];
    if ((uint64_t)v14 < v3)
    {
      ++v8;
LABEL_22:
      unint64_t v17 = v26[3];
      int64_t v22 = v14 + 1;
      uint64_t result = swift_unknownObjectRetain();
      if (v14 >= v17 >> 1) {
        uint64_t result = (uint64_t)sub_2309AE964((void *)(v17 > 1), v22, 1);
      }
      v26[2] = v22;
      uint64_t v18 = &v26[4 * v14];
      v18[4] = v10;
      v18[5] = v11;
      v18[6] = v12;
      v18[7] = v13;
    }
    else
    {
      uint64_t result = swift_unknownObjectRetain();
      if (v7 >= v14) {
        goto LABEL_40;
      }
      unint64_t v15 = &v26[4 * v7 + 4];
      uint64_t result = swift_unknownObjectRelease();
      *unint64_t v15 = v10;
      v15[1] = v11;
      v15[2] = v12;
      v15[3] = v13;
      if ((uint64_t)++v7 >= v3)
      {
        uint64_t v5 = v24;
        if (v8 + 1 == v23)
        {
LABEL_30:
          swift_bridgeObjectRelease();
          goto LABEL_31;
        }
        char v16 = (uint64_t *)(v24 + 88 + 32 * v8);
        v8 += 2;
        while (v8 - 1 < *(void *)(v24 + 16))
        {
          uint64_t v10 = *(v16 - 3);
          uint64_t v11 = *(v16 - 2);
          uint64_t v12 = *(v16 - 1);
          uint64_t v13 = *v16;
          unint64_t v14 = v26[2];
          if ((uint64_t)v14 < v3)
          {
            unint64_t v7 = 0;
            goto LABEL_22;
          }
          swift_unknownObjectRetain();
          uint64_t result = swift_unknownObjectRelease();
          v26[4] = v10;
          v26[5] = v11;
          v26[6] = v12;
          v26[7] = v13;
          if (v3 > 1)
          {
            unint64_t v7 = 1;
            if (v8 != v23) {
              goto LABEL_8;
            }
            swift_bridgeObjectRelease();
            unint64_t v7 = 1;
            goto LABEL_34;
          }
          ++v8;
          v16 += 4;
          if (v8 - v23 == 1) {
            goto LABEL_30;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      ++v8;
    }
    uint64_t v5 = v24;
  }
  while (v8 != v23);
  swift_bridgeObjectRelease();
  if (!v7)
  {
LABEL_31:
    swift_bridgeObjectRelease();
    return (uint64_t)v6;
  }
LABEL_34:
  int64_t v19 = v26[2];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t result = (uint64_t)sub_2309AE964(0, v19, 0);
  if (v19 < (uint64_t)v7) {
    goto LABEL_42;
  }
  if ((v7 & 0x8000000000000000) == 0)
  {
    unint64_t v20 = v26[2];
    if (v20 >= v7 && v20 >= v19)
    {
      uint64_t v21 = swift_retain();
      sub_23099F53C(v21, (uint64_t)(v26 + 4), v7, (2 * v19) | 1);
      swift_bridgeObjectRelease();
      swift_release();
      sub_23099F53C((uint64_t)v26, (uint64_t)(v26 + 4), 0, (2 * v7) | 1);
      swift_release();
      return v25;
    }
    goto LABEL_44;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_23099F160(uint64_t result, uint64_t a2)
{
  uint64_t v2 = (void *)result;
  uint64_t v3 = *(void **)result;
  uint64_t v4 = *(void *)(*(void *)result + 16);
  if (v4 != 1)
  {
    if (!v4)
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F8);
      uint64_t result = swift_allocObject();
      *(_OWORD *)(result + 16) = xmmword_2309B6220;
      uint64_t v5 = MEMORY[0x263F8EE78];
      uint64_t v6 = MEMORY[0x263F8EE78] + 32;
      *(void *)(result + 32) = MEMORY[0x263F8EE78];
      *(void *)(result + 40) = v6;
      *(_OWORD *)(result + 48) = xmmword_2309B6230;
      *(void *)(result + 64) = v5;
      *(void *)(result + 72) = v6;
      *(_OWORD *)(result + 80) = xmmword_2309B6230;
      *uint64_t v2 = result;
    }
    return result;
  }
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  int64_t v11 = v3[6];
  unint64_t v10 = v3[7];
  swift_unknownObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v12 = v10 >> 1;
  int64_t v13 = (v10 >> 1) - v11;
  if (__OFSUB__(v10 >> 1, v11))
  {
    __break(1u);
    goto LABEL_18;
  }
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v16 = v15 & ~(v15 >> 63);
  if (__OFSUB__(v16, a2))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v17 = (v16 - a2) & ~((uint64_t)(v16 - a2) >> 63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F8);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2309B6220;
  if (v16 < v17)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v12 < v17)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if ((uint64_t)v17 < v11)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v12 < v16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if ((uint64_t)v16 < v11)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  *(void *)(result + 32) = v8;
  *(void *)(result + 40) = v9;
  *(void *)(result + 48) = v17;
  *(void *)(result + 56) = v10 & 1 | (2 * v16);
  if ((uint64_t)v12 < v11)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  *(void *)(result + 64) = v8;
  *(void *)(result + 72) = v9;
  *(void *)(result + 80) = v16;
  *(void *)(result + 88) = v10;
  *uint64_t v2 = result;
  return swift_unknownObjectRetain();
}

unint64_t sub_23099F300(uint64_t a1, uint64_t a2)
{
  sub_2309B5958();
  sub_2309B56E8();
  uint64_t v4 = sub_2309B5968();
  return sub_23099F3C0(a1, a2, v4);
}

unint64_t sub_23099F378(double a1)
{
  uint64_t v2 = sub_2309B5948();
  return sub_23099F4A4(v2, a1);
}

unint64_t sub_23099F3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2309B58C8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2309B58C8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23099F4A4(uint64_t a1, double a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a1 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = *(void *)(v2 + 48);
    if (*(double *)(v6 + 8 * result) != a2)
    {
      uint64_t v7 = ~v4;
      for (unint64_t result = (result + 1) & v7;
            ((*(void *)(v3 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v7)
      {
        if (*(double *)(v6 + 8 * result) == a2) {
          break;
        }
      }
    }
  }
  return result;
}

void sub_23099F53C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = *v4;
  int64_t v8 = *(void *)(*v4 + 16);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v4 = v7;
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v7 + 24) >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v12 = v8 + v6;
      }
      else {
        int64_t v12 = v8;
      }
      isUniquelyReferenced_nonNull_native = sub_2309AE964(isUniquelyReferenced_nonNull_native, v12, 1);
      uint64_t v7 = *v4;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_16;
  }
LABEL_12:
  if ((*(void *)(v7 + 24) >> 1) - *(void *)(v7 + 16) < v6) {
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F0);
  swift_arrayInitWithCopy();
  if (v6 <= 0)
  {
LABEL_16:
    *uint64_t v4 = v7;
    return;
  }
  uint64_t v13 = *(void *)(v7 + 16);
  BOOL v14 = __OFADD__(v13, v6);
  uint64_t v15 = v13 + v6;
  if (!v14)
  {
    *(void *)(v7 + 16) = v15;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_23099F650(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for UsageError(uint64_t a1)
{
  return sub_23099F678(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_23099F678(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16ODCurareAnalysis10UsageErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_23099F650(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UsageError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_23099F650(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_23099F678(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UsageError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_23099F678(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_23099F81C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_23099F838(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UsageError()
{
  return &type metadata for UsageError;
}

uint64_t Binomial.deinit()
{
  return v0;
}

uint64_t Binomial.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Binomial()
{
  return self;
}

void sub_23099F8AC(uint64_t a1, uint64_t a2, double a3)
{
  if (a1 != -1 && a1 != a2)
  {
    double v3 = 1.0 - a3;
    if (a1)
    {
      if (__OFSUB__(a2, a1))
      {
        __break(1u);
      }
      else if (!__OFADD__(a1, 1))
      {
        sub_2309A0300(v3, (double)(a2 - a1), (double)(a1 + 1));
        return;
      }
      __break(1u);
    }
    else
    {
      pow(v3, (double)a2);
    }
  }
}

void sub_23099F948(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE900000000000064;
  unint64_t v4 = 0xE400000000000000;
  uint64_t v5 = 1936942412;
  if (v2 != 1)
  {
    uint64_t v5 = 0x72657461657247;
    unint64_t v4 = 0xE700000000000000;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x65646953206F7754;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

void sub_23099F9A4(uint64_t a1, unint64_t a2, unsigned __int8 a3, long double a4)
{
  if (a1 < 0)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v7 = 0xD00000000000001FLL;
    *(void *)(v7 + 8) = 0x80000002309B6B30;
LABEL_13:
    *(unsigned char *)(v7 + 16) = 0;
    swift_willThrow();
    return;
  }
  uint64_t v5 = a2;
  if ((a2 & 0x8000000000000000) != 0)
  {
    sub_23099D920();
    swift_allocError();
    unsigned __int8 v8 = "numberOfPositive was less than 0.";
    unint64_t v9 = 0xD000000000000021;
    goto LABEL_12;
  }
  if (a1 < a2)
  {
    sub_23099D920();
    swift_allocError();
    unsigned __int8 v8 = "numberOfPositive was greater than numberOfTrials.";
    unint64_t v9 = 0xD000000000000031;
LABEL_12:
    *(void *)uint64_t v7 = v9;
    *(void *)(v7 + 8) = (unint64_t)(v8 - 32) | 0x8000000000000000;
    goto LABEL_13;
  }
  long double v10 = a4;
  if (a4 < 0.0 || a4 > 1.0)
  {
    sub_23099D920();
    swift_allocError();
    unsigned __int8 v8 = "probability was not within the range [0.0, 1.0]";
    unint64_t v9 = 0xD00000000000002FLL;
    goto LABEL_12;
  }
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
LABEL_16:
    if (a1 == v5) {
      return;
    }
    if (!v5)
    {
      pow(1.0 - v10, (double)a1);
      return;
    }
    if (!__OFADD__(v5, 1))
    {
      sub_2309A0300(1.0 - v10, (double)(a1 - v5), (double)(v5 + 1));
      return;
    }
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  char v12 = sub_2309B58C8();
  swift_bridgeObjectRelease();
  if (v12) {
    goto LABEL_16;
  }
  if (a3 > 1u)
  {
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  char v13 = sub_2309B58C8();
  swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_28:
    sub_23099F8AC(v5 - 1, a1, v10);
    return;
  }
  double v14 = (double)v5;
  double __y = (double)a1;
  double v15 = (double)a1 * v10;
  if (v15 > (double)v5)
  {
    uint64_t v16 = a1 - v5;
    if (a1 == v5)
    {
      double v17 = 1.0 - v10;
    }
    else
    {
LABEL_50:
      if (v5)
      {
        if (__OFADD__(v5, 1))
        {
LABEL_96:
          __break(1u);
LABEL_97:
          __break(1u);
          goto LABEL_98;
        }
        double v17 = 1.0 - v10;
        sub_2309A0300(1.0 - v10, (double)v16, (double)(v5 + 1));
        if (v4) {
          return;
        }
      }
      else
      {
        double v17 = 1.0 - v10;
        pow(1.0 - v10, __y);
      }
    }
    double v65 = __y + 1.0;
    double v37 = sub_2309B24E8(__y + 1.0);
    long double v38 = v37 - sub_2309B24E8(v14 + 1.0);
    long double v39 = v38 - sub_2309B24E8(__y - v14 + 1.0);
    double v73 = log(v10);
    double v71 = log(v17);
    double v69 = exp(v73 * v14 + v71 * (__y - v14) + v39);
    double v40 = ceil(v15);
    if ((~*(void *)&v40 & 0x7FF0000000000000) != 0)
    {
      if (v40 > -9.22337204e18)
      {
        double v41 = __y + 1.0;
        if (v40 < 9.22337204e18)
        {
          uint64_t v42 = (uint64_t)v40;
          if ((uint64_t)v40 <= a1)
          {
            double v43 = v65 + -1.0;
            long double v44 = v43 * log(v65 + -1.0) - v43;
            uint64_t v45 = 0;
            double v67 = v44 + 0.572364943 + log(v43 * (v43 * 4.0 * (v43 + v43 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
            double v46 = 3.0;
            while (1)
            {
              double v47 = v67;
              if (v41 <= v46) {
                double v47 = sub_2309B258C(v41);
              }
              double v48 = (double)v42;
              double v49 = (double)v42 + 1.0;
              if (v49 <= v46)
              {
                double v54 = sub_2309B258C(v49);
              }
              else
              {
                double v50 = v49 + -1.0;
                long double v51 = v50 * log(v49 + -1.0) - v50;
                long double v52 = log(v50 * (v50 * 4.0 * (v50 + v50 + 1.0) + 1.0) + 0.0333333333);
                long double v53 = v51 + 0.572364943;
                double v46 = 3.0;
                double v54 = v53 + v52 * 0.166666667;
              }
              double v55 = __y - v48 + 1.0;
              if (v55 <= v46)
              {
                double v61 = sub_2309B258C(v55);
              }
              else
              {
                double v56 = v55 + -1.0;
                long double v57 = v56 * log(v55 + -1.0) - v56;
                double v58 = v56 * (v56 * 4.0 * (v56 + v56 + 1.0) + 1.0);
                double v46 = 3.0;
                long double v59 = log(v58 + 0.0333333333);
                long double v60 = v57 + 0.572364943;
                double v41 = __y + 1.0;
                double v61 = v60 + v59 * 0.166666667;
              }
              if (exp(v73 * v48 + v71 * (__y - v48) + v47 - v54 - v61) <= v69)
              {
                BOOL v36 = __OFADD__(v45++, 1);
                if (v36)
                {
                  __break(1u);
                  goto LABEL_89;
                }
              }
              if (a1 == v42) {
                break;
              }
              BOOL v36 = __OFADD__(v42++, 1);
              if (v36)
              {
                __break(1u);
                break;
              }
            }
            if (!v45) {
              return;
            }
            if (!__OFSUB__(a1, v45))
            {
              sub_23099F8AC(a1 - v45, a1, v10);
              return;
            }
            goto LABEL_95;
          }
LABEL_94:
          __break(1u);
LABEL_95:
          __break(1u);
          goto LABEL_96;
        }
LABEL_93:
        __break(1u);
        goto LABEL_94;
      }
LABEL_92:
      __break(1u);
      goto LABEL_93;
    }
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  if (v15 >= (double)v5) {
    return;
  }
  sub_23099F8AC(v5 - 1, a1, v10);
  if (v4) {
    return;
  }
  double v64 = __y + 1.0;
  double v18 = sub_2309B24E8(__y + 1.0);
  long double v19 = v18 - sub_2309B24E8(v14 + 1.0);
  long double v20 = v19 - sub_2309B24E8(__y - v14 + 1.0);
  double v72 = log(v10);
  double __x = 1.0 - v10;
  double v70 = log(1.0 - v10);
  double v68 = exp(v72 * v14 + v70 * (__y - v14) + v20);
  double v21 = floor(v15);
  if ((~*(void *)&v21 & 0x7FF0000000000000) == 0) {
    goto LABEL_97;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  double v14 = __y + 1.0;
  if (v21 >= 9.22337204e18)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  uint64_t v5 = (uint64_t)v21;
  if (((uint64_t)v21 & 0x8000000000000000) == 0)
  {
    double v22 = v64 + -1.0;
    long double v23 = v22 * log(v64 + -1.0) - v22;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    double v66 = v23 + 0.572364943 + log(v22 * (v22 * 4.0 * (v22 + v22 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
    while (1)
    {
      double v15 = v66;
      if (v14 <= 3.0) {
        double v15 = sub_2309B258C(v14);
      }
      double v26 = (double)v24;
      double v27 = (double)v24 + 1.0;
      if (v27 <= 3.0)
      {
        long double v10 = sub_2309B258C(v27);
      }
      else
      {
        double v28 = v27 + -1.0;
        long double v29 = v28 * log(v27 + -1.0) - v28;
        long double v10 = v29 + 0.572364943 + log(v28 * (v28 * 4.0 * (v28 + v28 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
      }
      double v30 = __y - v26 + 1.0;
      if (v30 <= 3.0)
      {
        double v35 = sub_2309B258C(v30);
      }
      else
      {
        double v31 = v30 + -1.0;
        long double v32 = v31 * log(v30 + -1.0) - v31;
        long double v33 = log(v31 * (v31 * 4.0 * (v31 + v31 + 1.0) + 1.0) + 0.0333333333);
        long double v34 = v32 + 0.572364943;
        double v14 = __y + 1.0;
        double v35 = v34 + v33 * 0.166666667;
      }
      if (exp(v72 * v26 + v70 * (__y - v26) + v15 - v10 - v35) <= v68)
      {
        BOOL v36 = __OFADD__(v25++, 1);
        if (v36) {
          break;
        }
      }
      if (v5 == v24)
      {
        if (!v25) {
          return;
        }
        uint64_t v62 = v25 - 1;
        if (__OFSUB__(v25, 1)) {
          goto LABEL_101;
        }
        if (v62 == a1) {
          return;
        }
        if (v25 == 1)
        {
          pow(__x, __y);
          return;
        }
        if (__OFSUB__(a1, v62)) {
          goto LABEL_102;
        }
        if (!__OFADD__(v62, 1))
        {
          sub_2309A0300(__x, (double)(a1 - v62), (double)v25);
          return;
        }
        goto LABEL_103;
      }
      BOOL v36 = __OFADD__(v24++, 1);
      if (v36)
      {
        __break(1u);
        goto LABEL_50;
      }
    }
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
LABEL_100:
  __break(1u);
LABEL_101:
  __break(1u);
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
}

void sub_2309A0300(double a1, double a2, double a3)
{
  if (a1 < 0.0 || a1 > 1.0)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v6 = 0xD000000000000032;
    uint64_t v7 = "Probability was less than 0.0 or greater than 1.0.";
LABEL_23:
    *(void *)(v6 + 8) = (unint64_t)(v7 - 32) | 0x8000000000000000;
    *(unsigned char *)(v6 + 16) = 0;
    swift_willThrow();
    return;
  }
  if (a2 <= 0.0 || a3 <= 0.0)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v6 = 0xD00000000000005ALL;
    uint64_t v7 = "Either 'a' or 'b' was less than or equal to 0.0, which is undefined for the beta function.";
    goto LABEL_23;
  }
  if (a1 != 0.0 && a1 != 1.0)
  {
    double v21 = log(a1);
    double v10 = log(1.0 - a1);
    double v11 = sub_2309B24E8(a2);
    double v12 = sub_2309B24E8(a3);
    double v13 = sub_2309B24E8(a2 + a3);
    if (a2 > a3) {
      double v14 = a2;
    }
    else {
      double v14 = a3;
    }
    double v15 = ceil(sqrt(v14));
    if ((~*(void *)&v15 & 0x7FF0000000000000) != 0)
    {
      if (v15 > -9.22337204e18)
      {
        if (v15 < 9.22337204e18)
        {
          double v16 = v21 * a2 + v10 * a3;
          double v17 = v11 + v12 - v13;
          if ((uint64_t)v15 <= 100) {
            uint64_t v18 = 100;
          }
          else {
            uint64_t v18 = (uint64_t)v15;
          }
          if ((a2 + 1.0) / (a2 + a3 + 2.0) <= a1)
          {
            sub_2309A0568(v18, 1.0 - a1, a3, a2);
            if (!v3)
            {
              long double v20 = log(a3);
              exp(v16 - v17 - v20);
            }
          }
          else
          {
            sub_2309A0568(v18, a1, a2, a3);
            if (!v3)
            {
              long double v19 = log(a2);
              exp(v16 - v17 - v19);
            }
          }
          return;
        }
LABEL_29:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_29;
  }
}

uint64_t sub_2309A0568(uint64_t result, double a2, double a3, double a4)
{
  if (result < 1)
  {
LABEL_20:
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v23 = 0;
    *(void *)(v23 + 8) = 0;
    *(unsigned char *)(v23 + 16) = 3;
    return swift_willThrow();
  }
  else
  {
    double v4 = (a3 + a4) * a2 / (a3 + 1.0);
    if (vabdd_f64(1.0, v4) >= 1.0e-30) {
      double v5 = 1.0 / (1.0 - v4);
    }
    else {
      double v5 = 1.0e30;
    }
    uint64_t v6 = 1;
    double v7 = v5;
    double v8 = 1.0;
    while (1)
    {
      double v9 = (double)v6;
      double v10 = v9 + v9 + a3;
      double v11 = (a4 - (double)v6) * (double)v6 * a2 / (v10 * (v10 + -1.0));
      double v12 = v11 / v8 + 1.0;
      double v13 = v7 * v11 + 1.0;
      if (fabs(v12) >= 1.0e-30) {
        double v14 = v12;
      }
      else {
        double v14 = 1.0e-30;
      }
      double v15 = fabs(v13);
      double v16 = 1.0 / v13;
      if (v15 < 1.0e-30) {
        double v16 = 1.0e30;
      }
      double v17 = -((v9 + a3) * (a3 + a4 + v9)) * a2 / (v10 * (v10 + 1.0));
      double v18 = v17 * v16 + 1.0;
      double v8 = fabs(v17 / v14 + 1.0) >= 1.0e-30 ? v17 / v14 + 1.0 : 1.0e-30;
      double v19 = fabs(v18);
      double v20 = 1.0 / v18;
      double v21 = v5 * (v14 * v16);
      double v7 = v19 >= 1.0e-30 ? v20 : 1.0e30;
      double v5 = v21 * (v8 * v7);
      if (fabs(v8 * v7 + -1.0) < 0.000457247371) {
        break;
      }
      uint64_t v22 = v6 + 1;
      if (__OFADD__(v6, 1))
      {
        __break(1u);
        return result;
      }
      ++v6;
      if (v22 > result) {
        goto LABEL_20;
      }
    }
  }
  return result;
}

void runSplittingStep(_:step:lastRun:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v10 = (void *)MEMORY[0x230FC38C0]();
  sub_2309A0780(a2, a3, a4, a1, a5, &v11);
}

uint64_t sub_2309A0780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  BOOL v10 = a1 == 1937334628 && a2 == 0xE400000000000000;
  if (v10 || (sub_2309B58C8() & 1) != 0)
  {
    if (*(void *)(a3 + 16))
    {
      unint64_t v14 = sub_23099F300(0x6C656946656D6974, 0xE900000000000064);
      if (v15)
      {
        sub_23099D880(*(void *)(a3 + 56) + 32 * v14, (uint64_t)v29);
        if (swift_dynamicCast())
        {
          uint64_t v16 = v27;
          uint64_t v17 = v28;
          goto LABEL_10;
        }
      }
    }
    sub_23099D920();
    swift_allocError();
    double v21 = "Days expects arguments: (timeField)";
    unint64_t v22 = 0xD000000000000023;
    goto LABEL_13;
  }
  if ((a1 != 0x736B656577 || a2 != 0xE500000000000000) && (sub_2309B58C8() & 1) == 0)
  {
    if ((a1 != 0x6E75527473616CLL || a2 != 0xE700000000000000) && (sub_2309B58C8() & 1) == 0)
    {
      sub_2309B57C8();
      swift_bridgeObjectRelease();
      v29[0] = 0xD000000000000018;
      v29[1] = 0x80000002309B6BF0;
      swift_bridgeObjectRetain();
      sub_2309B56F8();
      swift_bridgeObjectRelease();
      sub_23099D920();
      swift_allocError();
      *(void *)uint64_t v20 = 0xD000000000000018;
      *(void *)(v20 + 8) = 0x80000002309B6BF0;
      goto LABEL_14;
    }
    if (*(void *)(a3 + 16))
    {
      unint64_t v25 = sub_23099F300(0x6C656946656D6974, 0xE900000000000064);
      if (v26)
      {
        sub_23099D880(*(void *)(a3 + 56) + 32 * v25, (uint64_t)v29);
        if (swift_dynamicCast())
        {
          uint64_t v18 = sub_2309A1538(a4, v27, v28, a5);
          uint64_t result = swift_bridgeObjectRelease();
          if (!v6) {
            goto LABEL_11;
          }
          return result;
        }
      }
    }
    sub_23099D920();
    swift_allocError();
    double v21 = "LastRun expects arguments: (timeField)";
    unint64_t v22 = 0xD000000000000026;
LABEL_13:
    *(void *)uint64_t v20 = v22;
    *(void *)(v20 + 8) = (unint64_t)(v21 - 32) | 0x8000000000000000;
LABEL_14:
    *(unsigned char *)(v20 + 16) = 0;
    return swift_willThrow();
  }
  if (!*(void *)(a3 + 16)
    || (unint64_t v23 = sub_23099F300(0x6C656946656D6974, 0xE900000000000064), (v24 & 1) == 0)
    || (sub_23099D880(*(void *)(a3 + 56) + 32 * v23, (uint64_t)v29), (swift_dynamicCast() & 1) == 0))
  {
    sub_23099D920();
    swift_allocError();
    double v21 = "Weeks expects arguments: (timeField)";
    unint64_t v22 = 0xD000000000000024;
    goto LABEL_13;
  }
  uint64_t v16 = v27;
  uint64_t v17 = v28;
LABEL_10:
  uint64_t v18 = sub_2309A0B80(a4, v16, v17);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v6) {
LABEL_11:
  }
    *a6 = v18;
  return result;
}

uint64_t sub_2309A0B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  double v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v61 - v10;
  uint64_t v12 = sub_2309B5678();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v84 = (char *)&v61 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v83 = (char *)&v61 - v19;
  uint64_t v20 = *(void *)(a1 + 16);
  if (!v20) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v81 = a1 + 32;
  uint64_t v82 = a1;
  uint64_t v21 = *(void *)(a1 + 32 + 8 * (v20 - 1));
  if (!*(void *)(v21 + 16))
  {
    long long v85 = 0u;
    long long v86 = 0u;
    goto LABEL_11;
  }
  unint64_t v78 = v20 - 1;
  uint64_t v76 = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v22 = sub_23099F300(a2, a3);
  if ((v23 & 1) == 0)
  {
    long long v85 = 0u;
    long long v86 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_23099D880(*(void *)(v21 + 56) + 32 * v22, (uint64_t)&v85);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v86 + 1))
  {
LABEL_11:
    sub_2309A1E94((uint64_t)&v85, &qword_2687098D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_12;
  }
  uint64_t v24 = MEMORY[0x263F8EE58];
  int v25 = swift_dynamicCast();
  uint64_t v74 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
  uint64_t v75 = v13 + 56;
  v74(v11, v25 ^ 1u, 1, v12);
  double v72 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  uint64_t v73 = v13 + 48;
  if (v72(v11, 1, v12) == 1)
  {
LABEL_12:
    sub_2309A1E94((uint64_t)v11, &qword_268709900);
    *(void *)&long long v85 = 0;
    *((void *)&v85 + 1) = 0xE000000000000000;
    sub_2309B57C8();
    swift_bridgeObjectRelease();
    *(void *)&long long v85 = 0xD00000000000002CLL;
    *((void *)&v85 + 1) = 0x80000002309B6CA0;
    sub_2309B56F8();
    uint64_t v31 = *((void *)&v85 + 1);
    uint64_t v32 = v85;
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v33 = v32;
    *(void *)(v33 + 8) = v31;
    *(unsigned char *)(v33 + 16) = 1;
    swift_willThrow();
    return v31;
  }
  char v26 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  uint64_t v69 = v13 + 32;
  double v68 = v26;
  v26(v83, v11, v12);
  uint64_t v27 = swift_bridgeObjectRetain();
  uint64_t v28 = sub_2309A1864(v27);
  uint64_t v67 = *(void *)(v28 + 16);
  if (v67)
  {
    uint64_t v71 = v28 + 32;
    v80 = (void (**)(char *, uint64_t))(v13 + 8);
    long double v29 = (void *)MEMORY[0x263F8EE78];
    uint64_t v66 = v24 + 8;
    unint64_t v30 = 0;
    uint64_t v65 = v3;
    uint64_t v64 = a3;
    uint64_t v63 = a2;
    uint64_t v62 = v13;
    double v61 = v9;
    uint64_t v70 = v28;
    while (v30 < *(void *)(v28 + 16))
    {
      unint64_t v77 = v30;
      double v35 = (unint64_t *)(v71 + 16 * v30);
      unint64_t v36 = v35[1];
      if (!*(void *)(v36 + 16))
      {
        long long v85 = 0u;
        long long v86 = 0u;
LABEL_46:
        sub_2309A1E94((uint64_t)&v85, &qword_2687098D0);
        v74(v9, 1, 1, v12);
LABEL_47:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2309A1E94((uint64_t)v9, &qword_268709900);
        sub_2309B57C8();
        swift_bridgeObjectRelease();
        *(void *)&long long v85 = 0xD00000000000002CLL;
        *((void *)&v85 + 1) = 0x80000002309B6CA0;
        sub_2309B56F8();
        uint64_t v55 = *((void *)&v85 + 1);
        uint64_t v31 = v85;
        sub_23099D920();
        swift_allocError();
        *(void *)uint64_t v56 = v31;
        *(void *)(v56 + 8) = v55;
        *(unsigned char *)(v56 + 16) = 1;
        swift_willThrow();
        (*v80)(v83, v12);
        return v31;
      }
      unint64_t v79 = *v35;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v37 = sub_23099F300(a2, a3);
      if (v38)
      {
        sub_23099D880(*(void *)(v36 + 56) + 32 * v37, (uint64_t)&v85);
      }
      else
      {
        long long v85 = 0u;
        long long v86 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!*((void *)&v86 + 1)) {
        goto LABEL_46;
      }
      int v39 = swift_dynamicCast();
      v74(v9, v39 ^ 1u, 1, v12);
      if (v72(v9, 1, v12) == 1) {
        goto LABEL_47;
      }
      v68(v84, v9, v12);
      uint64_t v40 = v79 + 1;
      a3 = __OFADD__(v79, 1);
      sub_2309B5648();
      sub_2309A1EF0();
      char v41 = sub_2309B56B8();
      uint64_t v42 = *v80;
      (*v80)(v16, v12);
      if ((v41 & 1) == 0)
      {
        if (a3) {
          goto LABEL_57;
        }
        a3 = v78 + 1;
        uint64_t v13 = v82;
        if (__OFADD__(v78, 1)) {
          goto LABEL_58;
        }
        if (a3 < v40) {
          goto LABEL_59;
        }
        if (v76 < v40) {
          goto LABEL_60;
        }
        if (v40 < 0) {
          goto LABEL_61;
        }
        if (v76 < a3) {
          goto LABEL_62;
        }
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          long double v29 = sub_2309B1C4C(0, v29[2] + 1, 1, v29);
        }
        unint64_t v44 = v29[2];
        unint64_t v43 = v29[3];
        unint64_t v45 = v44 + 1;
        if (v44 >= v43 >> 1)
        {
          unint64_t v78 = v44 + 1;
          double v54 = sub_2309B1C4C((void *)(v43 > 1), v44 + 1, 1, v29);
          unint64_t v45 = v78;
          long double v29 = v54;
        }
        v29[2] = v45;
        double v46 = &v29[4 * v44];
        uint64_t v47 = v81;
        v46[4] = v13;
        v46[5] = v47;
        v46[6] = v40;
        v46[7] = (2 * a3) | 1;
        sub_2309B5658();
        sub_2309B5648();
        char v48 = sub_2309B56B8();
        v42(v16, v12);
        if ((v48 & 1) == 0)
        {
          do
          {
            swift_bridgeObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              long double v29 = sub_2309B1C4C(0, v29[2] + 1, 1, v29);
            }
            unint64_t v50 = v29[2];
            unint64_t v49 = v29[3];
            if (v50 >= v49 >> 1) {
              long double v29 = sub_2309B1C4C((void *)(v49 > 1), v50 + 1, 1, v29);
            }
            v29[2] = v50 + 1;
            long double v51 = &v29[4 * v50];
            uint64_t v52 = v81;
            v51[4] = v82;
            v51[5] = v52;
            v51[6] = v40;
            v51[7] = (2 * v40) | 1;
            sub_2309B5658();
            sub_2309B5648();
            char v53 = sub_2309B56B8();
            v42(v16, v12);
          }
          while ((v53 & 1) == 0);
        }
        unint64_t v78 = v79;
      }
      unint64_t v30 = v77 + 1;
      v42(v84, v12);
      a3 = v64;
      a2 = v63;
      uint64_t v13 = v62;
      double v9 = v61;
      uint64_t v28 = v70;
      if (v30 == v67)
      {
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  swift_bridgeObjectRelease();
  long double v29 = (void *)MEMORY[0x263F8EE78];
LABEL_49:
  a3 = v78 + 1;
  if (__OFADD__(v78, 1))
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a3 < 0)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if (v76 < a3)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_66:
  }
    long double v29 = sub_2309B1C4C(0, v29[2] + 1, 1, v29);
  unint64_t v58 = v29[2];
  unint64_t v57 = v29[3];
  if (v58 >= v57 >> 1) {
    long double v29 = sub_2309B1C4C((void *)(v57 > 1), v58 + 1, 1, v29);
  }
  v29[2] = v58 + 1;
  long double v59 = &v29[4 * v58];
  uint64_t v60 = v81;
  v59[4] = v82;
  v59[5] = v60;
  v59[6] = 0;
  v59[7] = (2 * a3) | 1;
  uint64_t v31 = sub_2309A1998((uint64_t)v29);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v83, v12);
  return v31;
}

uint64_t sub_2309A1538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2309B5678();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2309A20D8(a4, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_2309A1E94((uint64_t)v11, &qword_268709900);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F8);
    a3 = swift_allocObject();
    *(_OWORD *)(a3 + 16) = xmmword_2309B62E0;
    uint64_t v16 = (2 * *(void *)(a1 + 16)) | 1;
    *(void *)(a3 + 32) = a1;
    *(void *)(a3 + 40) = a1 + 32;
    *(void *)(a3 + 48) = 0;
    *(void *)(a3 + 56) = v16;
    swift_bridgeObjectRetain();
    return a3;
  }
  uint64_t v17 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  MEMORY[0x270FA5388](v17);
  v26[-4] = a2;
  v26[-3] = a3;
  v26[-2] = v15;
  uint64_t v18 = sub_2309A1DD0(sub_2309A2140, (uint64_t)&v26[-6], a1);
  if (v4)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return a3;
  }
  if (v19) {
    uint64_t v20 = *(void *)(a1 + 16);
  }
  else {
    uint64_t v20 = v18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F8);
  if (v20 < 1)
  {
    a3 = swift_allocObject();
    *(_OWORD *)(a3 + 16) = xmmword_2309B62E0;
    uint64_t v24 = (2 * *(void *)(a1 + 16)) | 1;
    *(void *)(a3 + 32) = a1;
    *(void *)(a3 + 40) = a1 + 32;
    *(void *)(a3 + 48) = 0;
    *(void *)(a3 + 56) = v24;
    int v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    swift_bridgeObjectRetain();
    v25(v15, v12);
    return a3;
  }
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2309B6220;
  unint64_t v22 = *(void *)(a1 + 16);
  if (v22 >= v20)
  {
    a3 = result;
    *(void *)(result + 32) = a1;
    *(void *)(result + 40) = a1 + 32;
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = (2 * v20) | 1;
    *(void *)(result + 64) = a1;
    *(void *)(result + 72) = a1 + 32;
    *(void *)(result + 80) = v20;
    *(void *)(result + 88) = (2 * v22) | 1;
    char v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    swift_bridgeObjectRetain_n();
    v23(v15, v12);
    return a3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2309A1864(uint64_t a1)
{
  uint64_t v1 = (void *)sub_2309A1F48(a1);
  unint64_t v2 = v1[2];
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 < 2) {
    return (uint64_t)v1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = v2 >> 1;
  unint64_t v6 = v2 - 1;
  uint64_t v7 = 2 * v2;
  uint64_t v8 = 5;
  unint64_t v16 = v2 >> 1;
  while (1)
  {
    if (v4 == v6) {
      goto LABEL_4;
    }
    unint64_t v9 = v1[2];
    if (v4 >= v9) {
      break;
    }
    if (v6 >= v9) {
      goto LABEL_13;
    }
    uint64_t v11 = v1[v8 - 1];
    uint64_t v10 = v1[v8];
    uint64_t v13 = v1[v7 + 2];
    uint64_t v12 = v1[v7 + 3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v1 = sub_2309B1C24(v1);
    }
    uint64_t v14 = &v1[v8];
    uint64_t result = swift_bridgeObjectRelease();
    *(v14 - 1) = v13;
    *uint64_t v14 = v12;
    if (v6 >= v1[2]) {
      goto LABEL_14;
    }
    uint64_t v15 = &v1[v7];
    uint64_t result = swift_bridgeObjectRelease();
    v15[2] = v11;
    v15[3] = v10;
    unint64_t v5 = v16;
LABEL_4:
    ++v4;
    v8 += 2;
    --v6;
    v7 -= 2;
    if (v5 == v4) {
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_2309A1998(uint64_t result)
{
  uint64_t v1 = (void *)result;
  unint64_t v2 = *(void *)(result + 16);
  if (v2 < 2) {
    return (uint64_t)v1;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  unint64_t v5 = v2 >> 1;
  unint64_t v6 = v2 - 1;
  uint64_t v7 = 4 * v2;
  unint64_t v15 = v2 >> 1;
  while (1)
  {
    if (v4 == v6) {
      goto LABEL_4;
    }
    unint64_t v8 = v1[2];
    if (v4 >= v8) {
      break;
    }
    if (v6 >= v8) {
      goto LABEL_13;
    }
    uint64_t v9 = v1[v3 + 6];
    uint64_t v10 = v1[v3 + 7];
    long long v16 = *(_OWORD *)&v1[v3 + 4];
    long long v17 = *(_OWORD *)&v1[v7];
    uint64_t v11 = v1[v7 + 2];
    uint64_t v12 = v1[v7 + 3];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v1 = sub_2309B1C10(v1);
    }
    uint64_t v13 = &v1[v3];
    uint64_t result = swift_unknownObjectRelease();
    *((_OWORD *)v13 + 2) = v17;
    v13[6] = v11;
    v13[7] = v12;
    if (v6 >= v1[2]) {
      goto LABEL_14;
    }
    uint64_t v14 = &v1[v7];
    uint64_t result = swift_unknownObjectRelease();
    *(_OWORD *)uint64_t v14 = v16;
    v14[2] = v9;
    v14[3] = v10;
    unint64_t v5 = v15;
LABEL_4:
    ++v4;
    --v6;
    v7 -= 4;
    v3 += 4;
    if (v5 == v4) {
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_2309A1ADC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  if (!*(void *)(v13 + 16))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_23099F300(a2, a3);
  if ((v15 & 1) == 0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  sub_23099D880(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v21);
  swift_bridgeObjectRelease();
  if (!*((void *)&v22 + 1))
  {
LABEL_8:
    sub_2309A1E94((uint64_t)&v21, &qword_2687098D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_9;
  }
  int v16 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, v16 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_9:
    sub_2309A1E94((uint64_t)v8, &qword_268709900);
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = 0xE000000000000000;
    sub_2309B57C8();
    swift_bridgeObjectRelease();
    *(void *)&long long v21 = 0xD00000000000002CLL;
    *((void *)&v21 + 1) = 0x80000002309B6CA0;
    sub_2309B56F8();
    uint64_t v18 = *((void *)&v21 + 1);
    uint64_t v17 = v21;
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v19 = v17;
    *(void *)(v19 + 8) = v18;
    *(unsigned char *)(v19 + 16) = 1;
    swift_willThrow();
    return v17 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  LOBYTE(v17) = sub_2309B5638();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v17 & 1;
}

uint64_t sub_2309A1DD0(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = a3 + 32;
  while (1)
  {
    uint64_t v10 = *(void *)(v7 + 8 * v6);
    swift_bridgeObjectRetain();
    char v8 = a1(&v10);
    swift_bridgeObjectRelease();
    if (v3 || (v8 & 1) != 0) {
      break;
    }
    if (v4 == ++v6) {
      return 0;
    }
  }
  return v6;
}

uint64_t sub_2309A1E94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2309A1EF0()
{
  unint64_t result = qword_268709908;
  if (!qword_268709908)
  {
    sub_2309B5678();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268709908);
  }
  return result;
}

uint64_t sub_2309A1F48(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  unint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = result;
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 4;
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        unint64_t result = swift_bridgeObjectRetain();
        BOOL v8 = __OFSUB__(v4--, 1);
        if (v8) {
          goto LABEL_30;
        }
      }
      else
      {
        unint64_t v9 = v2[3];
        if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_31;
        }
        int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
        if (v10 <= 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = v10;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_268709910);
        uint64_t v12 = (void *)swift_allocObject();
        int64_t v13 = _swift_stdlib_malloc_size(v12);
        uint64_t v14 = v13 - 32;
        if (v13 < 32) {
          uint64_t v14 = v13 - 17;
        }
        uint64_t v15 = v14 >> 4;
        v12[2] = v11;
        v12[3] = 2 * (v14 >> 4);
        int v16 = v12 + 4;
        uint64_t v17 = v2[3] >> 1;
        uint64_t v6 = &v12[2 * v17 + 4];
        uint64_t v18 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - v17;
        if (v2[2])
        {
          if (v12 != v2 || v16 >= &v2[2 * v17 + 4]) {
            memmove(v16, v2 + 4, 16 * v17);
          }
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        unint64_t result = swift_release();
        unint64_t v2 = v12;
        BOOL v8 = __OFSUB__(v18, 1);
        uint64_t v4 = v18 - 1;
        if (v8)
        {
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
      }
      *uint64_t v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        unint64_t result = swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
  }
  uint64_t v4 = 0;
LABEL_26:
  unint64_t v20 = v2[3];
  if (v20 >= 2)
  {
    unint64_t v21 = v20 >> 1;
    BOOL v8 = __OFSUB__(v21, v4);
    uint64_t v22 = v21 - v4;
    if (v8) {
      goto LABEL_32;
    }
    v2[2] = v22;
  }
  return (uint64_t)v2;
}

uint64_t sub_2309A20D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2309A2140(uint64_t *a1)
{
  return sub_2309A1ADC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24)) & 1;
}

uint64_t sub_2309A2164(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xE900000000000064;
  uint64_t v3 = 0x65646953206F7754;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 1936942412;
    }
    else {
      uint64_t v5 = 0x72657461657247;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE400000000000000;
    }
    else {
      unint64_t v6 = 0xE700000000000000;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0x65646953206F7754;
  unint64_t v6 = 0xE900000000000064;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 1936942412;
    }
    else {
      uint64_t v3 = 0x72657461657247;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE400000000000000;
    }
    else {
      unint64_t v2 = 0xE700000000000000;
    }
  }
LABEL_15:
  if (v5 == v3 && v6 == v2) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2309B58C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_2309A2270(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000018;
  }
  else {
    unint64_t v3 = 0xD000000000000025;
  }
  if (v2) {
    unint64_t v4 = 0x80000002309B6730;
  }
  else {
    unint64_t v4 = 0x80000002309B6760;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000018;
  }
  else {
    unint64_t v5 = 0xD000000000000025;
  }
  if (a2) {
    unint64_t v6 = 0x80000002309B6760;
  }
  else {
    unint64_t v6 = 0x80000002309B6730;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_2309B58C8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2309A231C()
{
  return sub_2309B5968();
}

uint64_t sub_2309A23A4()
{
  return sub_2309B5968();
}

ODCurareAnalysis::TestSkippedReason_optional __swiftcall TestSkippedReason.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_2309B58A8();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = ODCurareAnalysis_TestSkippedReason_SmallSampleSize;
  }
  else {
    v2.value = ODCurareAnalysis_TestSkippedReason_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

unint64_t TestSkippedReason.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0xD000000000000025;
  }
}

uint64_t sub_2309A24B8(char *a1, char *a2)
{
  return sub_2309A2270(*a1, *a2);
}

unint64_t sub_2309A24C8()
{
  unint64_t result = qword_268709918;
  if (!qword_268709918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268709918);
  }
  return result;
}

uint64_t sub_2309A251C()
{
  return sub_2309A231C();
}

uint64_t sub_2309A2524()
{
  sub_2309B56E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2309A2598()
{
  return sub_2309A23A4();
}

uint64_t sub_2309A25A0@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2309B58A8();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_2309A2600(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000018;
  }
  else {
    unint64_t v2 = 0xD000000000000025;
  }
  unint64_t v3 = 0x80000002309B6730;
  if (*v1) {
    unint64_t v3 = 0x80000002309B6760;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2309A2644(uint64_t a1)
{
  uint64_t v2 = sub_2309B5678();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  char v8 = &v14[-v7];
  sub_23099D880(a1, (uint64_t)v18);
  sub_23099D880((uint64_t)v18, (uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
  swift_dynamicCast();
  if (!v17)
  {
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF9D0]), sel_init);
LABEL_5:
    uint64_t v10 = (uint64_t)v9;
    goto LABEL_8;
  }
  sub_23099DA04((uint64_t)&v15);
  if ((swift_dynamicCast() & 1) != 0 || swift_dynamicCast())
  {
    uint64_t v10 = sub_2309B56C8();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  if (swift_dynamicCast())
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_2309A9E44(0, &qword_268709988);
    sub_2309B5618();
    uint64_t v10 = sub_2309B5768();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
    goto LABEL_8;
  }
  if (swift_dynamicCast())
  {
    sub_2309A9E44(0, &qword_268709988);
    id v9 = (id)sub_2309B5788();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    sub_2309A9E44(0, &qword_268709988);
    id v9 = (id)sub_2309B5768();
    goto LABEL_5;
  }
  if (swift_dynamicCast())
  {
    sub_2309A9E44(0, &qword_268709988);
    id v9 = (id)sub_2309B5778();
    goto LABEL_5;
  }
  sub_2309A9E44(0, &qword_268709980);
  if (!swift_dynamicCast())
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0xE000000000000000;
    sub_2309B57C8();
    sub_2309B56F8();
    sub_2309B5848();
    uint64_t v10 = v15;
    unint64_t v12 = v16;
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v13 = v10;
    *(void *)(v13 + 8) = v12;
    *(unsigned char *)(v13 + 16) = 1;
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    return v10;
  }
  uint64_t v10 = v15;
LABEL_8:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return v10;
}

uint64_t sub_2309A2AA4()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_2309B5998();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22[3] = type metadata accessor for BinomialTestResult(0);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
  sub_2309A9E80(v0, (uint64_t)boxed_opaque_existential_0, type metadata accessor for BinomialTestResult);
  sub_2309B5978();
  uint64_t v8 = sub_2309B5988();
  uint64_t v21 = v2;
  uint64_t v18 = sub_2309A9F70;
  uint64_t v19 = &v20;
  uint64_t v15 = sub_2309A9050;
  unint64_t v16 = &v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709968);
  uint64_t v9 = sub_2309B5838();
  if (v1)
  {
    v22[0] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709970);
    swift_willThrowTypedImpl();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v10 = v9;
    swift_release();
    if (*(void *)(v10 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
      uint64_t v11 = sub_2309B5898();
    }
    else
    {
      uint64_t v11 = MEMORY[0x263F8EE80];
    }
    v22[0] = v11;
    unint64_t v12 = (void *)swift_bridgeObjectRetain();
    sub_2309A9068(v12, 1, v22);
    swift_bridgeObjectRelease();
    uint64_t v8 = v22[0];
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v8;
}

uint64_t sub_2309A2D04()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_2309B5998();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22[3] = type metadata accessor for ZTestResult(0);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
  sub_2309A9E80(v0, (uint64_t)boxed_opaque_existential_0, type metadata accessor for ZTestResult);
  sub_2309B5978();
  uint64_t v8 = sub_2309B5988();
  uint64_t v21 = v2;
  uint64_t v18 = sub_2309A9F70;
  uint64_t v19 = &v20;
  uint64_t v15 = sub_2309A9050;
  unint64_t v16 = &v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709968);
  uint64_t v9 = sub_2309B5838();
  if (v1)
  {
    v22[0] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709970);
    swift_willThrowTypedImpl();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v10 = v9;
    swift_release();
    if (*(void *)(v10 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
      uint64_t v11 = sub_2309B5898();
    }
    else
    {
      uint64_t v11 = MEMORY[0x263F8EE80];
    }
    v22[0] = v11;
    unint64_t v12 = (void *)swift_bridgeObjectRetain();
    sub_2309A9068(v12, 1, v22);
    swift_bridgeObjectRelease();
    uint64_t v8 = v22[0];
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v8;
}

uint64_t sub_2309A2F64()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_2309B5998();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22[3] = type metadata accessor for KSTestTwoSampleResult(0);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
  sub_2309A9E80(v0, (uint64_t)boxed_opaque_existential_0, type metadata accessor for KSTestTwoSampleResult);
  sub_2309B5978();
  uint64_t v8 = sub_2309B5988();
  uint64_t v21 = v2;
  uint64_t v18 = sub_2309A9EE8;
  uint64_t v19 = &v20;
  uint64_t v15 = sub_2309A9050;
  unint64_t v16 = &v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709968);
  uint64_t v9 = sub_2309B5838();
  if (v1)
  {
    v22[0] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709970);
    swift_willThrowTypedImpl();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v10 = v9;
    swift_release();
    if (*(void *)(v10 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
      uint64_t v11 = sub_2309B5898();
    }
    else
    {
      uint64_t v11 = MEMORY[0x263F8EE80];
    }
    v22[0] = v11;
    unint64_t v12 = (void *)swift_bridgeObjectRetain();
    sub_2309A9068(v12, 1, v22);
    swift_bridgeObjectRelease();
    uint64_t v8 = v22[0];
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v8;
}

uint64_t sub_2309A31C4()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_2309B5998();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22[3] = type metadata accessor for MalformedTestResult(0);
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
  sub_2309A9E80(v0, (uint64_t)boxed_opaque_existential_0, type metadata accessor for MalformedTestResult);
  sub_2309B5978();
  uint64_t v8 = sub_2309B5988();
  uint64_t v21 = v2;
  uint64_t v18 = sub_2309A9F70;
  uint64_t v19 = &v20;
  uint64_t v15 = sub_2309A9050;
  unint64_t v16 = &v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709968);
  uint64_t v9 = sub_2309B5838();
  if (v1)
  {
    v22[0] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709970);
    swift_willThrowTypedImpl();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v10 = v9;
    swift_release();
    if (*(void *)(v10 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
      uint64_t v11 = sub_2309B5898();
    }
    else
    {
      uint64_t v11 = MEMORY[0x263F8EE80];
    }
    v22[0] = v11;
    unint64_t v12 = (void *)swift_bridgeObjectRetain();
    sub_2309A9068(v12, 1, v22);
    swift_bridgeObjectRelease();
    uint64_t v8 = v22[0];
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v8;
}

unint64_t sub_2309A3424(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    goto LABEL_4;
  }
  swift_bridgeObjectRetain();
  sub_2309A2644(a3);
  if (v3)
  {
    MEMORY[0x230FC3C60](v3);
    swift_bridgeObjectRelease();
LABEL_4:
    sub_2309B57C8();
    sub_2309B56F8();
    swift_bridgeObjectRetain();
    sub_2309B56F8();
    swift_bridgeObjectRelease();
    sub_2309B56F8();
    sub_2309B5848();
    sub_2309B56F8();
    a1 = 0xE000000000000000;
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v6 = 0;
    *(void *)(v6 + 8) = 0xE000000000000000;
    *(unsigned char *)(v6 + 16) = 1;
    swift_willThrow();
  }
  return a1;
}

uint64_t sub_2309A35AC()
{
  return sub_2309A2AA4();
}

uint64_t sub_2309A35C4@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11)
{
  *(void *)a9 = 0x747365545ALL;
  *(void *)(a9 + 8) = 0xE500000000000000;
  uint64_t v18 = (int *)type metadata accessor for ZTestResult(0);
  uint64_t v19 = a9 + v18[8];
  *(double *)uint64_t v19 = a10;
  *(unsigned char *)(v19 + 8) = 0;
  *(unsigned char *)(a9 + v18[9]) = a1;
  *(void *)(a9 + v18[10]) = a2;
  *(void *)(a9 + v18[11]) = a3;
  uint64_t v20 = a9 + v18[12];
  uint64_t v21 = sub_2309B5678();
  uint64_t v22 = *(void *)(v21 - 8);
  char v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
  v23(v20, a4, v21);
  uint64_t v24 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56);
  v24(v20, 0, 1, v21);
  uint64_t v25 = a9 + v18[13];
  v23(v25, a5, v21);
  v24(v25, 0, 1, v21);
  *(void *)(a9 + v18[14]) = a6;
  *(void *)(a9 + v18[15]) = a7;
  uint64_t v26 = a9 + v18[16];
  v23(v26, a8, v21);
  v24(v26, 0, 1, v21);
  uint64_t v27 = a9 + v18[17];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v27, a11, v21);
  v24(v27, 0, 1, v21);
  uint64_t v28 = a9 + v18[7];
  v23(v28, a11, v21);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v24)(v28, 0, 1, v21);
  *(_WORD *)(a9 + 16) = 513;
  return result;
}

uint64_t sub_2309A381C()
{
  return sub_2309A2D04();
}

uint64_t sub_2309A3834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  *(void *)a7 = 0x775474736554534BLL;
  *(void *)(a7 + 8) = 0xEF656C706D61536FLL;
  unint64_t v12 = (int *)type metadata accessor for KSTestTwoSampleResult(0);
  uint64_t v13 = a7 + v12[8];
  *(double *)uint64_t v13 = a8;
  *(unsigned char *)(v13 + 8) = 0;
  *(void *)(a7 + v12[9]) = a1;
  uint64_t v14 = a7 + v12[10];
  uint64_t v15 = sub_2309B5678();
  uint64_t v16 = *(void *)(v15 - 8);
  char v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  v17(v14, a2, v15);
  uint64_t v18 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56);
  v18(v14, 0, 1, v15);
  uint64_t v19 = a7 + v12[11];
  v17(v19, a3, v15);
  uint64_t v20 = v17;
  uint64_t v21 = v18;
  v18(v19, 0, 1, v15);
  *(void *)(a7 + v12[12]) = a4;
  uint64_t v22 = a7 + v12[13];
  v20(v22, a5, v15);
  v21(v22, 0, 1, v15);
  char v23 = v21;
  uint64_t v24 = a7 + v12[14];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v24, a6, v15);
  v23(v24, 0, 1, v15);
  uint64_t v25 = a7 + v12[7];
  v20(v25, a6, v15);
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v23)(v25, 0, 1, v15);
  *(_WORD *)(a7 + 16) = 513;
  return result;
}

uint64_t sub_2309A3A78()
{
  return sub_2309A2F64();
}

uint64_t sub_2309A3A90()
{
  return sub_2309A31C4();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TestSkippedReason(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TestSkippedReason(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x2309A3C14);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_2309A3C3C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2309A3C44(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TestSkippedReason()
{
  return &type metadata for TestSkippedReason;
}

void *initializeBufferWithCopyOfBuffer for BinomialTestResult(uint64_t a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    uint64_t v8 = a3[7];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2309B5678();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    uint64_t v18 = (char *)v4 + v16;
    uint64_t v19 = (uint64_t)a2 + v16;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = *(unsigned char *)(v19 + 8);
    *((unsigned char *)v4 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v20 = a3[11];
    *(void *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(void *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
    uint64_t v21 = a3[12];
    uint64_t v22 = (char *)v4 + v21;
    char v23 = (char *)a2 + v21;
    if (v13((char *)a2 + v21, 1, v11))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v22, v23, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
    }
    uint64_t v25 = a3[13];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    if (v13(v27, 1, v11))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v26, v27, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for BinomialTestResult(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_2309B5678();
  uint64_t v11 = *(void *)(v5 - 8);
  unsigned int v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[12];
  if (!v6(v7, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v7, v5);
  }
  uint64_t v8 = a1 + a2[13];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v8, 1, v5);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v5);
  }
  return result;
}

uint64_t initializeWithCopy for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v18 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  uint64_t v23 = a3[13];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  if (v12(v25, 1, v10))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v24, v25, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  *(unsigned char *)(v16 + 8) = *((unsigned char *)v17 + 8);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  int v22 = v11((void *)(a1 + v19), 1, v9);
  int v23 = v11(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v20, v21, v9);
LABEL_13:
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  int v28 = v11((void *)(a1 + v25), 1, v9);
  int v29 = v11(v27, 1, v9);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v26, v27, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
    goto LABEL_18;
  }
  if (v29)
  {
LABEL_18:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v26, v27, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v17 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[12];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v11((const void *)(a2 + v18), 1, v9))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  uint64_t v22 = a3[13];
  int v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v11(v24, 1, v9))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v23, v24, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for BinomialTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v20 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v21 = a3[12];
  uint64_t v22 = (void *)(a1 + v21);
  int v23 = (void *)(a2 + v21);
  int v24 = v12((void *)(a1 + v21), 1, v10);
  int v25 = v12(v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v22, v23, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_12:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v22, v23, v10);
LABEL_13:
  uint64_t v27 = a3[13];
  int v28 = (void *)(a1 + v27);
  int v29 = (void *)(a2 + v27);
  int v30 = v12((void *)(a1 + v27), 1, v10);
  int v31 = v12(v29, 1, v10);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v28, v29, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
    goto LABEL_18;
  }
  if (v31)
  {
LABEL_18:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v28, v29, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for BinomialTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for BinomialTestResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t type metadata accessor for BinomialTestResult(uint64_t a1)
{
  return sub_2309A8F00(a1, (uint64_t *)&unk_268709920);
}

void sub_2309A4E1C()
{
  sub_2309A4EE8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2309A4EE8()
{
  if (!qword_268709930)
  {
    sub_2309B5678();
    unint64_t v0 = sub_2309B57A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268709930);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for ZTestResult(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    uint64_t v8 = a3[7];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2309B5678();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    uint64_t v18 = (char *)v4 + v16;
    uint64_t v19 = (uint64_t)a2 + v16;
    *(void *)uint64_t v18 = *(void *)v19;
    v18[8] = *(unsigned char *)(v19 + 8);
    *((unsigned char *)v4 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v20 = a3[11];
    *(void *)((char *)v4 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(void *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
    uint64_t v21 = a3[12];
    uint64_t v22 = (char *)v4 + v21;
    int v23 = (char *)a2 + v21;
    if (v13((char *)a2 + v21, 1, v11))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v22, v23, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
    }
    uint64_t v25 = a3[13];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    if (v13((char *)a2 + v25, 1, v11))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v26, v27, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
    }
    uint64_t v29 = a3[15];
    *(void *)((char *)v4 + a3[14]) = *(uint64_t *)((char *)a2 + a3[14]);
    *(void *)((char *)v4 + v29) = *(uint64_t *)((char *)a2 + v29);
    uint64_t v30 = a3[16];
    int v31 = (char *)v4 + v30;
    uint64_t v32 = (char *)a2 + v30;
    if (v13((char *)a2 + v30, 1, v11))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v31, v32, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v31, 0, 1, v11);
    }
    uint64_t v34 = a3[17];
    double v35 = (char *)v4 + v34;
    unint64_t v36 = (char *)a2 + v34;
    if (v13(v36, 1, v11))
    {
      uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v35, v36, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v35, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for ZTestResult(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_2309B5678();
  uint64_t v13 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[12];
  if (!v6(v7, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v7, v5);
  }
  uint64_t v8 = a1 + a2[13];
  if (!v6(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v8, v5);
  }
  uint64_t v9 = a1 + a2[16];
  if (!v6(v9, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v5);
  }
  uint64_t v10 = a1 + a2[17];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v10, 1, v5);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v5);
  }
  return result;
}

uint64_t initializeWithCopy for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v18 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  uint64_t v23 = a3[13];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  if (v12((const void *)(a2 + v23), 1, v10))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v24, v25, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
  }
  uint64_t v27 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v27) = *(void *)(a2 + v27);
  uint64_t v28 = a3[16];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  if (v12((const void *)(a2 + v28), 1, v10))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v29, v30, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v29, 0, 1, v10);
  }
  uint64_t v32 = a3[17];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (const void *)(a2 + v32);
  if (v12(v34, 1, v10))
  {
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v33, v34, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v33, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  *(unsigned char *)(v16 + 8) = *((unsigned char *)v17 + 8);
  *(void *)uint64_t v16 = v18;
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  uint64_t v19 = a3[12];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  int v22 = v11((void *)(a1 + v19), 1, v9);
  int v23 = v11(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v20, v21, v9);
LABEL_13:
  uint64_t v25 = a3[13];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  int v28 = v11((void *)(a1 + v25), 1, v9);
  int v29 = v11(v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v26, v27, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
LABEL_18:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v26, v27, v9);
LABEL_19:
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  uint64_t v31 = a3[16];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  int v34 = v11((void *)(a1 + v31), 1, v9);
  int v35 = v11(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v32, v33, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_24:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v32, v33, v9);
LABEL_25:
  uint64_t v37 = a3[17];
  char v38 = (void *)(a1 + v37);
  int v39 = (void *)(a2 + v37);
  int v40 = v11((void *)(a1 + v37), 1, v9);
  int v41 = v11(v39, 1, v9);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v38, v39, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v38, v9);
    goto LABEL_30;
  }
  if (v41)
  {
LABEL_30:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v38, v39, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v38, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v17 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[12];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v11((const void *)(a2 + v18), 1, v9))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  uint64_t v22 = a3[13];
  int v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v11((const void *)(a2 + v22), 1, v9))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v23, v24, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  uint64_t v26 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v26) = *(void *)(a2 + v26);
  uint64_t v27 = a3[16];
  int v28 = (void *)(a1 + v27);
  int v29 = (const void *)(a2 + v27);
  if (v11((const void *)(a2 + v27), 1, v9))
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v28, v29, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v28, 0, 1, v9);
  }
  uint64_t v31 = a3[17];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  if (v11(v33, 1, v9))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v32, v33, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for ZTestResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v20 = a3[11];
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v21 = a3[12];
  uint64_t v22 = (void *)(a1 + v21);
  int v23 = (void *)(a2 + v21);
  int v24 = v12((void *)(a1 + v21), 1, v10);
  int v25 = v12(v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v22, v23, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_12:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v22, v23, v10);
LABEL_13:
  uint64_t v27 = a3[13];
  int v28 = (void *)(a1 + v27);
  int v29 = (void *)(a2 + v27);
  int v30 = v12((void *)(a1 + v27), 1, v10);
  int v31 = v12(v29, 1, v10);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v28, v29, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
LABEL_18:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v28, v29, v10);
LABEL_19:
  uint64_t v33 = a3[15];
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + v33) = *(void *)(a2 + v33);
  uint64_t v34 = a3[16];
  int v35 = (void *)(a1 + v34);
  uint64_t v36 = (void *)(a2 + v34);
  int v37 = v12((void *)(a1 + v34), 1, v10);
  int v38 = v12(v36, 1, v10);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v35, v36, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v35, 0, 1, v10);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v38)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v35, v10);
LABEL_24:
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v35, v36, v10);
LABEL_25:
  uint64_t v40 = a3[17];
  int v41 = (void *)(a1 + v40);
  uint64_t v42 = (void *)(a2 + v40);
  int v43 = v12((void *)(a1 + v40), 1, v10);
  int v44 = v12(v42, 1, v10);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v41, v42, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v41, v10);
    goto LABEL_30;
  }
  if (v44)
  {
LABEL_30:
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v41, v42, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v41, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ZTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for ZTestResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t type metadata accessor for ZTestResult(uint64_t a1)
{
  return sub_2309A8F00(a1, (uint64_t *)&unk_268709938);
}

void sub_2309A697C()
{
  sub_2309A4EE8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *initializeBufferWithCopyOfBuffer for KSTestTwoSampleResult(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    uint64_t v8 = a3[7];
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2309B5678();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    uint64_t v18 = (char *)v4 + v16;
    uint64_t v19 = (uint64_t)a2 + v16;
    *(void *)uint64_t v18 = *(void *)v19;
    uint64_t v20 = *(uint64_t *)((char *)a2 + v17);
    v18[8] = *(unsigned char *)(v19 + 8);
    *(void *)((char *)v4 + v17) = v20;
    uint64_t v21 = a3[10];
    uint64_t v22 = (char *)v4 + v21;
    int v23 = (char *)a2 + v21;
    if (v13((char *)a2 + v21, 1, v11))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v22, v23, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v22, 0, 1, v11);
    }
    uint64_t v25 = a3[11];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    if (v13((char *)a2 + v25, 1, v11))
    {
      uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v26, v27, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v26, 0, 1, v11);
    }
    uint64_t v29 = a3[13];
    *(void *)((char *)v4 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    int v30 = (char *)v4 + v29;
    int v31 = (char *)a2 + v29;
    if (v13((char *)a2 + v29, 1, v11))
    {
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v30, v31, *(void *)(*(void *)(v32 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v30, v31, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v30, 0, 1, v11);
    }
    uint64_t v33 = a3[14];
    uint64_t v34 = (char *)v4 + v33;
    int v35 = (char *)a2 + v33;
    if (v13(v35, 1, v11))
    {
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v34, v35, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v34, 0, 1, v11);
    }
  }
  return v4;
}

uint64_t destroy for KSTestTwoSampleResult(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = sub_2309B5678();
  uint64_t v13 = *(void *)(v5 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (!v6(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[10];
  if (!v6(v7, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v7, v5);
  }
  uint64_t v8 = a1 + a2[11];
  if (!v6(v8, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v8, v5);
  }
  uint64_t v9 = a1 + a2[13];
  if (!v6(v9, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v9, v5);
  }
  uint64_t v10 = a1 + a2[14];
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(v10, 1, v5);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
    return v12(v10, v5);
  }
  return result;
}

uint64_t initializeWithCopy for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = a3[8];
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  uint64_t v18 = *(void *)(a2 + v15);
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  *(void *)(a1 + v15) = v18;
  uint64_t v19 = a3[10];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  if (v12((const void *)(a2 + v19), 1, v10))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v20, v21, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
  }
  uint64_t v23 = a3[11];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  if (v12((const void *)(a2 + v23), 1, v10))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v24, v25, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
  }
  uint64_t v27 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (const void *)(a2 + v27);
  if (v12((const void *)(a2 + v27), 1, v10))
  {
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v28, v29, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
  }
  uint64_t v31 = a3[14];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  if (v12(v33, 1, v10))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v32, v33, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v32, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  *(unsigned char *)(v16 + 8) = *((unsigned char *)v17 + 8);
  *(void *)uint64_t v16 = v18;
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  uint64_t v19 = a3[10];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  int v22 = v11((void *)(a1 + v19), 1, v9);
  int v23 = v11(v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v20, v21, v9);
LABEL_13:
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  int v28 = v11((void *)(a1 + v25), 1, v9);
  int v29 = v11(v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v26, v27, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
LABEL_18:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v26, v27, v9);
LABEL_19:
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v31 = a3[13];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  int v34 = v11((void *)(a1 + v31), 1, v9);
  int v35 = v11(v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v32, v33, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_24:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v32, v33, v9);
LABEL_25:
  uint64_t v37 = a3[14];
  int v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  int v40 = v11((void *)(a1 + v37), 1, v9);
  int v41 = v11(v39, 1, v9);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v38, v39, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v38, v9);
    goto LABEL_30;
  }
  if (v41)
  {
LABEL_30:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v38, v39, *(void *)(*(void *)(v42 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v38, v39, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v38, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[8];
  uint64_t v14 = a3[9];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  uint64_t v17 = *(void *)(a2 + v14);
  *(unsigned char *)(v15 + 8) = *(unsigned char *)(v16 + 8);
  *(void *)(a1 + v14) = v17;
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  if (v11((const void *)(a2 + v18), 1, v9))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v19, v20, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v19, 0, 1, v9);
  }
  uint64_t v22 = a3[11];
  int v23 = (void *)(a1 + v22);
  uint64_t v24 = (const void *)(a2 + v22);
  if (v11((const void *)(a2 + v22), 1, v9))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v23, v24, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v23, 0, 1, v9);
  }
  uint64_t v26 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  uint64_t v27 = (void *)(a1 + v26);
  int v28 = (const void *)(a2 + v26);
  if (v11((const void *)(a2 + v26), 1, v9))
  {
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v27, v28, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v27, 0, 1, v9);
  }
  uint64_t v30 = a3[14];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (const void *)(a2 + v30);
  if (v11(v32, 1, v9))
  {
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v31, v32, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v31, 0, 1, v9);
  }
  return a1;
}

uint64_t assignWithTake for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  uint64_t v20 = *(void *)(a2 + v17);
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  *(void *)(a1 + v17) = v20;
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)(a1 + v21);
  int v23 = (void *)(a2 + v21);
  int v24 = v12((void *)(a1 + v21), 1, v10);
  int v25 = v12(v23, 1, v10);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v22, v23, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v25)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v22, v10);
LABEL_12:
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v22, v23, v10);
LABEL_13:
  uint64_t v27 = a3[11];
  int v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  int v30 = v12((void *)(a1 + v27), 1, v10);
  int v31 = v12(v29, 1, v10);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v28, v29, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v28, v10);
LABEL_18:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v28, v29, v10);
LABEL_19:
  uint64_t v33 = a3[13];
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  int v34 = (void *)(a1 + v33);
  int v35 = (void *)(a2 + v33);
  int v36 = v12((void *)(a1 + v33), 1, v10);
  int v37 = v12(v35, 1, v10);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v34, v35, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v34, 0, 1, v10);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v37)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v34, v10);
LABEL_24:
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v34, v35, v10);
LABEL_25:
  uint64_t v39 = a3[14];
  int v40 = (void *)(a1 + v39);
  int v41 = (void *)(a2 + v39);
  int v42 = v12((void *)(a1 + v39), 1, v10);
  int v43 = v12(v41, 1, v10);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v40, v41, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v40, v10);
    goto LABEL_30;
  }
  if (v43)
  {
LABEL_30:
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v40, v41, *(void *)(*(void *)(v44 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v40, v41, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v40, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1);
}

uint64_t storeEnumTagSinglePayload for KSTestTwoSampleResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1);
}

uint64_t type metadata accessor for KSTestTwoSampleResult(uint64_t a1)
{
  return sub_2309A8F00(a1, (uint64_t *)&unk_268709948);
}

void sub_2309A83E8()
{
  sub_2309A4EE8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *initializeBufferWithCopyOfBuffer for MalformedTestResult(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2309B5678();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 32);
    uint64_t v17 = (void *)((char *)v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for MalformedTestResult(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_2309B5678();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 32);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_2309B5678();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t assignWithTake for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_2309B5678();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 32);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2309A8D64);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MalformedTestResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2309A8E30);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for MalformedTestResult(uint64_t a1)
{
  return sub_2309A8F00(a1, (uint64_t *)&unk_268709958);
}

uint64_t sub_2309A8F00(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2309A8F38()
{
  sub_2309A4EE8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2309A9050@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_2309A9F04(a1, a2, a3);
}

uint64_t sub_2309A9068(void *a1, char a2, void *a3)
{
  if (!a1[2]) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v43 = a1[2];
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  id v10 = v8;
  unint64_t v12 = sub_23099F300(v7, v6);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v9[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_2309A93F8();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v21 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v22 = (uint64_t *)(v21[6] + 16 * v12);
    *uint64_t v22 = v7;
    v22[1] = v6;
    *(void *)(v21[7] + 8 * v12) = v10;
    uint64_t v23 = v21[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    uint64_t v26 = v43 - 1;
    if (v43 == 1) {
      return swift_bridgeObjectRelease_n();
    }
    for (uint64_t i = (void **)(a1 + 9); ; i += 3)
    {
      uint64_t v29 = (uint64_t)*(i - 2);
      uint64_t v28 = (uint64_t)*(i - 1);
      int v30 = *i;
      int v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      id v10 = v30;
      unint64_t v32 = sub_23099F300(v29, v28);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v24 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v24) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_2309A9794(v36, 1);
        unint64_t v32 = sub_23099F300(v29, v28);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      int v40 = (uint64_t *)(v39[6] + 16 * v32);
      *int v40 = v29;
      v40[1] = v28;
      *(void *)(v39[7] + 8 * v32) = v10;
      uint64_t v41 = v39[2];
      BOOL v24 = __OFADD__(v41, 1);
      uint64_t v42 = v41 + 1;
      if (v24) {
        goto LABEL_24;
      }
      v39[2] = v42;
      if (!--v26) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_2309A9794(v15, a2 & 1);
  unint64_t v17 = sub_23099F300(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v20 = swift_allocError();
    swift_willThrow();
    MEMORY[0x230FC3C70](v20);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709970);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return MEMORY[0x230FC3C60](v20);
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_2309B58E8();
  __break(1u);
LABEL_26:
  sub_2309B57C8();
  sub_2309B56F8();
  sub_2309B5848();
  sub_2309B56F8();
  uint64_t result = sub_2309B5858();
  __break(1u);
  return result;
}

id sub_2309A93F8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2309B5878();
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
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
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

void *sub_2309A95AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709990);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2309B5878();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  id result = (void *)(v3 + 64);
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
      goto LABEL_30;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_23099D880(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_2309A9F60(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2309A9794(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
  char v38 = a2;
  uint64_t v6 = sub_2309B5888();
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
  BOOL v35 = v2;
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
    int64_t v22 = (void *)(v5 + 64);
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
    unint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_2309B5958();
    sub_2309B56E8();
    uint64_t result = sub_2309B5968();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2309A9AA4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709990);
  uint64_t v6 = sub_2309B5888();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_2309A9F60(v24, v35);
      }
      else
      {
        sub_23099D880((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2309B5958();
      sub_2309B56E8();
      uint64_t result = sub_2309B5968();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_2309A9F60(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

__n128 sub_2309A9DA4@<Q0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr, uint64_t, uint64_t *)@<X1>, uint64_t a3@<X8>)
{
  a2(&v9, a1, &v8);
  if (v3)
  {
    uint64_t v5 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709970);
    swift_allocError();
    *uint64_t v7 = v5;
  }
  else
  {
    __n128 result = v10;
    *(void *)a3 = v9;
    *(__n128 *)(a3 + 8) = result;
  }
  return result;
}

double sub_2309A9E28@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_2309A9DA4(a1, (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t *))*(void *)(v2 + 16), a2).n128_u64[0];
  return result;
}

uint64_t sub_2309A9E44(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2309A9E80(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2309A9EE8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2309A3424(a1, a2, a3);
}

uint64_t sub_2309A9F04@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void, void *))(v3 + 16))(*a1, a1[1], a1 + 2);
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    *a3 = result;
    a3[1] = v8;
    a3[2] = v9;
  }
  return result;
}

_OWORD *sub_2309A9F60(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2309A9F70(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2309A9EE8(a1, a2, a3);
}

double sub_2309A9F88@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2309A9E28(a1, a2);
}

unint64_t sub_2309A9FA0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    long long v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709978);
  long long v2 = (void *)sub_2309B5898();
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
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_23099F300(v5, v6);
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

unint64_t sub_2309AA0BC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709990);
  uint64_t v2 = sub_2309B5898();
  uint64_t v3 = (void *)v2;
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
    sub_2309AF5F0(v6, (uint64_t)&v15, &qword_268709A10);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_23099F300(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2309A9F60(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2309AA1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v86 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  *(void *)&long long v80 = (char *)v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (unint64_t)v65 - v8;
  uint64_t v10 = sub_2309B5678();
  long long v85 = *(void **)(v10 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  unint64_t v78 = (char *)v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  double v68 = (char *)v65 - v13;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687099E8);
  uint64_t v14 = MEMORY[0x270FA5388](v83);
  unint64_t v77 = (void (***)(unint64_t, uint64_t, uint64_t, uint64_t))((char *)v65
                                                                           - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v67 = (void *)((char *)v65 - v17);
  MEMORY[0x270FA5388](v16);
  uint64_t v66 = (void **)((char *)v65 - v18);
  unint64_t v70 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_3;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_2309B5868();
    swift_bridgeObjectRelease();
LABEL_3:
    uint64_t v20 = *(void *)(v86 + 16);
    if (v20 >= v19) {
      uint64_t v21 = v19;
    }
    else {
      uint64_t v21 = *(void *)(v86 + 16);
    }
    uint64_t v91 = MEMORY[0x263F8EE78];
    unint64_t v79 = (void *)(v21 & ~(v21 >> 63));
    sub_2309AE984(0, (int64_t)v79, 0);
    if (v21 < 0)
    {
      __break(1u);
LABEL_59:
      (*v75)(v3, 1, 1, v10);
LABEL_60:

      uint64_t result = sub_2309A1E94(v3, &qword_268709900);
      __break(1u);
      return result;
    }
    uint64_t v81 = v20;
    uint64_t v82 = a1;
    v65[1] = v3;
    unint64_t v69 = v9;
    if (!v21) {
      break;
    }
    uint64_t v90 = v21;
    uint64_t v71 = a1 & 0xFFFFFFFFFFFFFF8;
    if (v70)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v76 = sub_2309B5868();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v76 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    unint64_t v9 = 0;
    unint64_t v84 = a1 & 0xC000000000000001;
    uint64_t v22 = v85 + 2;
    uint64_t v74 = v85 + 6;
    uint64_t v75 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 7);
    uint64_t v73 = (void (**)(void))(v85 + 4);
    long long v72 = xmmword_2309B6220;
    uint64_t v3 = v80;
    while (v79 != (void *)v9)
    {
      if (v76 == v9) {
        goto LABEL_52;
      }
      if (v84)
      {
        uint64_t v23 = (void (**)(unint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x230FC36E0](v9, a1);
      }
      else
      {
        if (v9 >= *(void *)(v71 + 16)) {
          goto LABEL_56;
        }
        uint64_t v23 = (void (**)(unint64_t, uint64_t, uint64_t, uint64_t))*(id *)(a1 + 8 * v9 + 32);
      }
      uint64_t v89 = v23;
      if (v20 == v9) {
        goto LABEL_59;
      }
      int64_t v24 = v85;
      unint64_t v25 = v86
          + ((*((unsigned __int8 *)v24 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v24 + 80))
          + v85[9] * v9;
      uint64_t v88 = (void (*)(uint64_t, unint64_t, uint64_t))v85[2];
      v88(v3, v25, v10);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v24[7])(v3, 0, 1, v10);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v24[6])(v3, 1, v10) == 1) {
        goto LABEL_60;
      }
      unint64_t v26 = v22;
      unint64_t v27 = *v73;
      ((void (*)(char *, uint64_t, uint64_t))*v73)(v78, v3, v10);
      uint64_t v28 = (uint64_t)v77;
      uint64_t v87 = (void (**)(char *, uint64_t, uint64_t))((char *)v77 + *(int *)(v83 + 48));
      unint64_t v29 = v89;
      *unint64_t v77 = v89;
      v27();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v72;
      *(void *)(inited + 32) = 1635017060;
      *(void *)(inited + 40) = 0xE400000000000000;
      uint64_t v31 = sub_2309A9E44(0, &qword_268709988);
      *(void *)(inited + 48) = v29;
      *(void *)(inited + 72) = v31;
      *(void *)(inited + 80) = 0x6D617473656D6974;
      *(void *)(inited + 88) = 0xE900000000000070;
      *(void *)(inited + 120) = v10;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 96));
      v88((uint64_t)boxed_opaque_existential_0, (unint64_t)v87, v10);
      int64_t v33 = v29;
      unint64_t v34 = sub_2309AA0BC(inited);
      sub_2309A1E94(v28, &qword_2687099E8);
      uint64_t v35 = v91;
      uint64_t v22 = v26;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AE984(0, *(void *)(v35 + 16) + 1, 1);
        uint64_t v35 = v91;
      }
      unint64_t v37 = *(void *)(v35 + 16);
      unint64_t v36 = *(void *)(v35 + 24);
      if (v37 >= v36 >> 1)
      {
        sub_2309AE984((void *)(v36 > 1), v37 + 1, 1);
        uint64_t v35 = v91;
      }
      ++v9;
      *(void *)(v35 + 16) = v37 + 1;
      *(void *)(v35 + 8 * v37 + 32) = v34;
      uint64_t v20 = v81;
      a1 = v82;
      uint64_t v3 = v80;
      if (v90 == v9)
      {
        uint64_t v21 = v90;
        uint64_t v3 = v71;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
  }
  uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8;
  unint64_t v84 = a1 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_27:
  if (a1 < 0) {
    char v38 = (char *)a1;
  }
  else {
    char v38 = (char *)v3;
  }
  unint64_t v78 = v38;
  unint64_t v9 = (unint64_t)(v85 + 2);
  uint64_t v88 = (void (*)(uint64_t, unint64_t, uint64_t))(v85 + 6);
  uint64_t v89 = (void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v85 + 7);
  uint64_t v87 = (void (**)(char *, uint64_t, uint64_t))(v85 + 4);
  long long v80 = xmmword_2309B6220;
  uint64_t v71 = v3;
  unint64_t v79 = v85 + 2;
  if (v70)
  {
    while (1)
    {
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_2309B5868();
      swift_bridgeObjectRelease();
      if (v21 == v39) {
        break;
      }
LABEL_34:
      if (v84)
      {
        id v40 = (id)MEMORY[0x230FC36E0](v21, a1);
      }
      else
      {
        if ((unint64_t)v21 >= *(void *)(v3 + 16)) {
          goto LABEL_53;
        }
        id v40 = *(id *)(a1 + 8 * v21 + 32);
      }
      uint64_t v41 = v40;
      if (__OFADD__(v21, 1)) {
        goto LABEL_54;
      }
      if (v20 == v21)
      {
        uint64_t v47 = v69;
        (*v89)(v69, 1, 1, v10);
LABEL_49:

        sub_2309A1E94(v47, &qword_268709900);
        break;
      }
      if (v21 >= (unint64_t)v20) {
        goto LABEL_55;
      }
      uint64_t v42 = v85;
      uint64_t v43 = v86 + ((*((unsigned __int8 *)v42 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v42 + 80));
      uint64_t v44 = v85[9];
      uint64_t v90 = v21;
      uint64_t v45 = v43 + v44 * v21;
      double v46 = (void (*)(unint64_t, uint64_t, uint64_t))v85[2];
      uint64_t v47 = v69;
      v46(v69, v45, v10);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v42[7])(v47, 0, 1, v10);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v42[6])(v47, 1, v10) == 1) {
        goto LABEL_49;
      }
      char v48 = *v87;
      unint64_t v49 = v68;
      (*v87)(v68, v47, v10);
      uint64_t v50 = v83;
      uint64_t v51 = (uint64_t)v67;
      uint64_t v52 = (char *)v67 + *(int *)(v83 + 48);
      *uint64_t v67 = v41;
      v48(v52, (uint64_t)v49, v10);
      char v53 = v66;
      sub_2309AF440(v51, (uint64_t)v66);
      double v54 = *v53;
      uint64_t v55 = (char *)v53 + *(int *)(v50 + 48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B8);
      uint64_t v56 = swift_initStackObject();
      *(_OWORD *)(v56 + 16) = v80;
      *(void *)(v56 + 32) = 1635017060;
      *(void *)(v56 + 40) = 0xE400000000000000;
      uint64_t v57 = sub_2309A9E44(0, &qword_268709988);
      *(void *)(v56 + 48) = v54;
      *(void *)(v56 + 72) = v57;
      *(void *)(v56 + 80) = 0x6D617473656D6974;
      *(void *)(v56 + 88) = 0xE900000000000070;
      *(void *)(v56 + 120) = v10;
      unint64_t v58 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v56 + 96));
      unint64_t v9 = (unint64_t)v79;
      v46((unint64_t)v58, (uint64_t)v55, v10);
      id v59 = v54;
      unint64_t v60 = sub_2309AA0BC(v56);
      sub_2309A1E94((uint64_t)v53, &qword_2687099E8);
      uint64_t v61 = v91;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AE984(0, *(void *)(v61 + 16) + 1, 1);
        uint64_t v61 = v91;
      }
      uint64_t v3 = v71;
      unint64_t v63 = *(void *)(v61 + 16);
      unint64_t v62 = *(void *)(v61 + 24);
      if (v63 >= v62 >> 1)
      {
        sub_2309AE984((void *)(v62 > 1), v63 + 1, 1);
        uint64_t v61 = v91;
      }
      *(void *)(v61 + 16) = v63 + 1;
      *(void *)(v61 + 8 * v63 + 32) = v60;
      uint64_t v21 = v90 + 1;
      uint64_t v20 = v81;
      a1 = v82;
      if (!v70) {
        goto LABEL_31;
      }
    }
  }
  else
  {
LABEL_31:
    if (v21 != *(void *)(v3 + 16)) {
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v91;
}

uint64_t Timeseries.runChangeDetection(events:test:lastRun:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2309AAF30(a1, a2, a3, v7);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t sub_2309AAF30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  v9[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268709A18);
  v9[0] = a2;
  swift_bridgeObjectRetain();
  sub_23099D048((uint64_t)v9, v10);
  sub_2309AB0C0(a1, v10, a3, a4);
  return sub_2309AF654((uint64_t)v10);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2309AB0C0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_2309AB470(a1);
  if (v8)
  {
    sub_2309ABC50(v8, a2, a3, (uint64_t)a4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v10 = sub_2309AB5B8(a1);
    if (v10)
    {
      unint64_t v11 = v10;
      uint64_t v12 = *a2;
      uint64_t v13 = *(void *)(*a2 + 16);
      if (v13)
      {
        char v38 = a4;
        uint64_t v35 = a2;
        if (v10 >> 62)
        {
LABEL_29:
          swift_bridgeObjectRetain();
          uint64_t v14 = sub_2309B5868();
        }
        else
        {
          uint64_t v14 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        uint64_t v15 = 0;
        uint64_t v16 = v12 + 32;
        uint64_t v39 = v12;
        uint64_t v36 = v12 + 32;
        uint64_t v37 = v13;
        do
        {
          if (v15 == v13) {
            goto LABEL_28;
          }
          if (v14)
          {
            uint64_t v17 = (uint64_t *)(v16 + 16 * v15);
            uint64_t v13 = *v17;
            uint64_t v12 = v17[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v18 = 4;
            while (1)
            {
              id v19 = (v11 & 0xC000000000000001) != 0
                  ? (id)MEMORY[0x230FC36E0](v18 - 4, v11)
                  : *(id *)(v11 + 8 * v18);
              uint64_t v20 = v19;
              uint64_t v21 = v18 - 3;
              if (__OFADD__(v18 - 4, 1)) {
                break;
              }
              swift_bridgeObjectRetain();
              unsigned int v22 = objc_msgSend(v20, sel_respondsToSelector_, sub_2309B5688());

              if (!v22)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                uint64_t v30 = type metadata accessor for MalformedTestResult(0);
                v38[3] = v30;
                v38[4] = (uint64_t)&off_26E538108;
                boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v38);
                uint64_t *boxed_opaque_existential_0 = 0x656D726F666C614DLL;
                boxed_opaque_existential_0[1] = 0xE900000000000064;
                *((_WORD *)boxed_opaque_existential_0 + 8) = 0;
                uint64_t v32 = (char *)boxed_opaque_existential_0 + *(int *)(v30 + 28);
                uint64_t v33 = sub_2309B5678();
                uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v32, 1, 1, v33);
                unint64_t v27 = (unint64_t *)((char *)boxed_opaque_existential_0 + *(int *)(v30 + 32));
                unint64_t v28 = 0xD000000000000028;
                unint64_t v29 = "Cannot parse required field from events.";
                goto LABEL_23;
              }
              ++v18;
              if (v21 == v14)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v12 = v39;
                uint64_t v16 = v36;
                uint64_t v13 = v37;
                goto LABEL_10;
              }
            }
            __break(1u);
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
LABEL_10:
          ++v15;
        }
        while (v15 != v13);
        swift_bridgeObjectRelease();
        a4 = v38;
        a2 = v35;
      }
      swift_bridgeObjectRetain();
      unint64_t v34 = sub_2309AF278(v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2309ABC50((uint64_t)v34, a2, a3, (uint64_t)a4);
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = type metadata accessor for MalformedTestResult(0);
      a4[3] = v23;
      a4[4] = (uint64_t)&off_26E538108;
      int64_t v24 = __swift_allocate_boxed_opaque_existential_0(a4);
      *int64_t v24 = 0x656D726F666C614DLL;
      v24[1] = 0xE900000000000064;
      *((_WORD *)v24 + 8) = 0;
      unint64_t v25 = (char *)v24 + *(int *)(v23 + 28);
      uint64_t v26 = sub_2309B5678();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v25, 1, 1, v26);
      unint64_t v27 = (unint64_t *)((char *)v24 + *(int *)(v23 + 32));
      unint64_t v28 = 0xD00000000000001FLL;
      unint64_t v29 = "Unrecognized format for events.";
LABEL_23:
      *unint64_t v27 = v28;
      v27[1] = (unint64_t)(v29 - 32) | 0x8000000000000000;
    }
  }
  return result;
}

uint64_t sub_2309AB470(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_2309AE984(0, v2, 0);
  uint64_t v3 = v10;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_23099D880(i, (uint64_t)v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687098B0);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AE984(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2309AE984((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v10;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_2309AB5B8(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_2309B5808();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_23099D880(i, (uint64_t)v5);
    sub_2309A9E44(0, &qword_268709980);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_2309B57E8();
    sub_2309B5818();
    sub_2309B5828();
    sub_2309B57F8();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_2309AB6D4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2309B5678();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v26 = (char *)&v24 - v10;
  int64_t v11 = *(void *)(a1 + 16);
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_2309AE9C4(0, v11, 0);
  if (!v11) {
    return v28;
  }
  uint64_t v12 = a1 + 32;
  uint64_t v13 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v14 = (void (**)(char *, char *, uint64_t))(v6 + 32);
  int64_t v24 = v9;
  uint64_t v25 = v6;
  while (1)
  {
    sub_2309AF5F0(v12, (uint64_t)v27, &qword_2687098D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
    int v15 = swift_dynamicCast();
    uint64_t v16 = *v13;
    if (!v15) {
      break;
    }
    v16(v4, 0, 1, v5);
    uint64_t v17 = *v14;
    uint64_t v18 = v26;
    (*v14)(v26, v4, v5);
    v17(v9, v18, v5);
    uint64_t v19 = v28;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2309AE9C4(0, *(void *)(v19 + 16) + 1, 1);
      uint64_t v19 = v28;
    }
    unint64_t v21 = *(void *)(v19 + 16);
    unint64_t v20 = *(void *)(v19 + 24);
    if (v21 >= v20 >> 1)
    {
      sub_2309AE9C4(v20 > 1, v21 + 1, 1);
      uint64_t v19 = v28;
    }
    *(void *)(v19 + 16) = v21 + 1;
    unint64_t v22 = v19
        + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))
        + *(void *)(v25 + 72) * v21;
    uint64_t v9 = v24;
    v17((char *)v22, v24, v5);
    uint64_t v28 = v19;
    v12 += 32;
    if (!--v11) {
      return v19;
    }
  }
  v16(v4, 1, 1, v5);
  swift_release();
  sub_2309A1E94((uint64_t)v4, &qword_268709900);
  return 0;
}

uint64_t sub_2309AB9B8(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_2309AE9E4(0, v2, 0);
  uint64_t v3 = v10;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_2309AF5F0(i, (uint64_t)v9, &qword_2687098D0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AE9E4(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2309AE9E4((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v10;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    return 0;
  }
  return v3;
}

uint64_t sub_2309ABB00(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  sub_2309AEA04(0, v2, 0);
  uint64_t v3 = v10;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_2309AF5F0(i, (uint64_t)v9, &qword_2687098D0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2309AEA04(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2309AEA04((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v10;
      }
      *(void *)(v3 + 16) = v6 + 1;
      *(void *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    return 0;
  }
  return v3;
}

uint64_t sub_2309ABC50@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v30 = a1;
  uint64_t v8 = a2[1];
  uint64_t v31 = v8;
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    sub_2309AF4A8((uint64_t)&v31);
    uint64_t v10 = (uint64_t *)(v8 + 48);
    do
    {
      uint64_t v11 = *(v10 - 1);
      uint64_t v12 = *v10;
      uint64_t v13 = *(v10 - 2);
      swift_bridgeObjectRetain();
      uint64_t v14 = swift_bridgeObjectRetain();
      int v15 = (void *)MEMORY[0x230FC38C0](v14);
      sub_2309AFBE8(v13, v11, v12, &v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 += 3;
      --v9;
    }
    while (v9);
    uint64_t v16 = sub_2309AF4D4((uint64_t)&v31);
    uint64_t v6 = v30;
  }
  else
  {
    uint64_t v16 = swift_bridgeObjectRetain();
  }
  uint64_t v17 = a2[2];
  uint64_t v18 = a2[3];
  uint64_t v19 = a2[4];
  unint64_t v20 = (void *)MEMORY[0x230FC38C0](v16);
  sub_2309A0780(v17, v18, v19, v6, a3, (uint64_t *)v28);
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)&v28[0];
  uint64_t v21 = runPostprocessingSteps(_:steps:lastRun:)((uint64_t)&v29, a2[5]);
  uint64_t v22 = v29;
  uint64_t v23 = a2[6];
  uint64_t v24 = a2[7];
  uint64_t v25 = a2[8];
  uint64_t v26 = (void *)MEMORY[0x230FC38C0](v21);
  sub_2309B28A8(v23, v24, v25, v22, (uint64_t *)v28);
  swift_bridgeObjectRelease();
  return sub_2309AF500(v28, a4);
}

uint64_t Timeseries.runBinomialTestTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:pHypothesis:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  v104 = a7;
  v105 = a8;
  v107 = a6;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v100 = (uint64_t)v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v99 = (uint64_t)v91 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v101 = (char *)v91 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v108 = (uint64_t)v91 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687099A8);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = (int *)type metadata accessor for BinomialTestResult(0);
  uint64_t v25 = MEMORY[0x270FA5388](v106);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  MEMORY[0x270FA5388](v26);
  uint64_t v103 = (uint64_t)v91 - v30;
  if (a1 >> 62)
  {
    uint64_t v96 = v27;
    uint64_t v97 = v28;
    uint64_t v98 = v29;
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_2309B5868();
    swift_bridgeObjectRelease();
    uint64_t v28 = v97;
    uint64_t v29 = v98;
    uint64_t v27 = v96;
  }
  else
  {
    uint64_t v31 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v31 != *(void *)(a2 + 16))
  {
    sub_23099D920();
    swift_allocError();
    uint64_t v35 = 0;
    *(void *)uint64_t v34 = 0xD000000000000036;
    uint64_t v36 = "samples and sampleTimestamps should be the same length";
LABEL_41:
    *(void *)(v34 + 8) = (unint64_t)(v36 - 32) | 0x8000000000000000;
    *(unsigned char *)(v34 + 16) = v35;
    swift_willThrow();
    return v35;
  }
  uint64_t v97 = v28;
  uint64_t v98 = v29;
  uint64_t v96 = v27;
  BOOL v32 = a3 == 0x736B6E756863 && a4 == 0xE600000000000000;
  char v33 = v32;
  if (!v32)
  {
    if ((sub_2309B58C8() & 1) == 0)
    {
      if (a3 == 1937334628 && a4 == 0xE400000000000000)
      {
LABEL_17:
        if ((sub_2309B58C8() & 1) == 0) {
          goto LABEL_20;
        }
        goto LABEL_18;
      }
      if ((sub_2309B58C8() & 1) == 0)
      {
        sub_23099D920();
        swift_allocError();
        uint64_t v35 = 0;
        *(void *)uint64_t v34 = 0xD000000000000024;
        uint64_t v36 = "chunkMethod should be chunks or days";
        goto LABEL_41;
      }
    }
    if (v33) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_18:
  if (!a5 || (uint64_t)objc_msgSend(a5, sel_integerValue) <= 0)
  {
    sub_23099D920();
    swift_allocError();
    uint64_t v35 = 0;
    *(void *)uint64_t v34 = 0xD00000000000004CLL;
    uint64_t v36 = "minimumSampleSize should be in range (0, Int.max) when chunkMethod is chunks";
    goto LABEL_41;
  }
LABEL_20:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v94 = sub_2309AA1F4(a1, a2);
  v91[1] = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B0);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_2309B6220;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B8);
  uint64_t inited = swift_initStackObject();
  long long v102 = xmmword_2309B62E0;
  *(_OWORD *)(inited + 16) = xmmword_2309B62E0;
  *(void *)(inited + 32) = 0x73646C656966;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687098C0);
  *(void *)(inited + 48) = &unk_26E537D90;
  unint64_t v39 = sub_2309AA0BC(inited);
  *(void *)(v37 + 32) = 0x6148657275736E65;
  *(void *)(v37 + 40) = 0xEF73646C65694673;
  *(void *)(v37 + 48) = v39;
  uint64_t v40 = swift_initStackObject();
  *(_OWORD *)(v40 + 16) = v102;
  *(void *)(v40 + 32) = 0x646C656966;
  *(void *)(v40 + 40) = 0xE500000000000000;
  *(void *)(v40 + 72) = MEMORY[0x263F8D310];
  *(void *)(v40 + 48) = 0x6D617473656D6974;
  *(void *)(v40 + 56) = 0xE900000000000070;
  unint64_t v41 = sub_2309AA0BC(v40);
  *(void *)(v37 + 56) = 0xD000000000000012;
  *(void *)(v37 + 64) = 0x80000002309B6E90;
  *(void *)(v37 + 72) = v41;
  uint64_t v95 = 1937334628;
  if (a3 == 1937334628 && a4 == 0xE400000000000000)
  {
    unint64_t v93 = 0xE400000000000000;
  }
  else
  {
    char v42 = sub_2309B58C8();
    uint64_t v43 = 1937334628;
    if ((v42 & 1) == 0) {
      uint64_t v43 = 0x6E75527473616CLL;
    }
    uint64_t v95 = v43;
    if (v42) {
      unint64_t v44 = 0xE400000000000000;
    }
    else {
      unint64_t v44 = 0xE700000000000000;
    }
    unint64_t v93 = v44;
  }
  uint64_t v45 = swift_initStackObject();
  *(_OWORD *)(v45 + 16) = v102;
  *(void *)(v45 + 32) = 0x6C656946656D6974;
  *(void *)(v45 + 40) = 0xE900000000000064;
  *(void *)(v45 + 72) = MEMORY[0x263F8D310];
  *(void *)(v45 + 48) = 0x6D617473656D6974;
  *(void *)(v45 + 56) = 0xE900000000000070;
  unint64_t v92 = sub_2309AA0BC(v45);
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = v102;
  uint64_t v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = v102;
  *(void *)(v47 + 32) = 0x74676E654C78616DLL;
  *(void *)(v47 + 40) = 0xE900000000000068;
  *(void *)(v47 + 72) = MEMORY[0x263F8D6C8];
  *(void *)(v47 + 48) = 1;
  unint64_t v48 = sub_2309AA0BC(v47);
  *(void *)(v46 + 32) = 0x786966667573;
  *(void *)(v46 + 40) = 0xE600000000000000;
  *(void *)(v46 + 48) = v48;
  uint64_t v49 = swift_initStackObject();
  if (a5)
  {
    *(_OWORD *)(v49 + 16) = xmmword_2309B6530;
    *(void *)(v49 + 32) = 0x6C65694661746164;
    *(void *)(v49 + 40) = 0xE900000000000064;
    *(void *)(v49 + 48) = 1635017060;
    *(void *)(v49 + 56) = 0xE400000000000000;
    uint64_t v50 = MEMORY[0x263F8D310];
    *(void *)(v49 + 72) = MEMORY[0x263F8D310];
    *(void *)(v49 + 80) = 0x6C656946656D6974;
    *(void *)(v49 + 88) = 0xE900000000000064;
    *(void *)(v49 + 96) = 0x6D617473656D6974;
    *(void *)(v49 + 104) = 0xE900000000000070;
    *(void *)(v49 + 120) = v50;
    *(void *)(v49 + 128) = 0xD000000000000011;
    *(void *)(v49 + 136) = 0x80000002309B69E0;
    uint64_t v51 = sub_2309A9E44(0, &qword_268709988);
    *(void *)(v49 + 144) = a5;
    *(void *)(v49 + 168) = v51;
    *(void *)(v49 + 176) = 0xD000000000000011;
    uint64_t v52 = v104;
    char v53 = v105;
    *(void *)(v49 + 184) = 0x80000002309B6EB0;
    *(void *)(v49 + 192) = v52;
    *(void *)(v49 + 216) = v51;
    *(void *)(v49 + 224) = 0x6568746F70794870;
    *(void *)(v49 + 264) = v51;
    *(void *)(v49 + 232) = 0xEB00000000736973;
    *(void *)(v49 + 240) = v53;
    id v54 = v52;
  }
  else
  {
    *(_OWORD *)(v49 + 16) = xmmword_2309B6540;
    *(void *)(v49 + 32) = 0x6C65694661746164;
    *(void *)(v49 + 40) = 0xE900000000000064;
    *(void *)(v49 + 48) = 1635017060;
    *(void *)(v49 + 56) = 0xE400000000000000;
    uint64_t v55 = MEMORY[0x263F8D310];
    *(void *)(v49 + 72) = MEMORY[0x263F8D310];
    *(void *)(v49 + 80) = 0x6C656946656D6974;
    *(void *)(v49 + 88) = 0xE900000000000064;
    *(void *)(v49 + 96) = 0x6D617473656D6974;
    *(void *)(v49 + 104) = 0xE900000000000070;
    *(void *)(v49 + 120) = v55;
    *(void *)(v49 + 128) = 0xD000000000000011;
    *(void *)(v49 + 136) = 0x80000002309B6EB0;
    uint64_t v56 = sub_2309A9E44(0, &qword_268709988);
    char v53 = v104;
    a5 = v105;
    *(void *)(v49 + 144) = v104;
    *(void *)(v49 + 168) = v56;
    *(void *)(v49 + 176) = 0x6568746F70794870;
    *(void *)(v49 + 216) = v56;
    *(void *)(v49 + 184) = 0xEB00000000736973;
    *(void *)(v49 + 192) = a5;
  }
  id v57 = v53;
  id v58 = a5;
  unint64_t v59 = sub_2309AA0BC(v49);
  v110[0] = &unk_26E537DD0;
  v110[1] = v37;
  v110[2] = v95;
  v110[3] = v93;
  v110[4] = v92;
  v110[5] = v46;
  strcpy((char *)v111, "BinomialTest");
  HIBYTE(v111[6]) = 0;
  v111[7] = -5120;
  unint64_t v112 = v59;
  sub_2309ABC50(v94, v110, (uint64_t)v107, (uint64_t)v109);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687099C0);
  unint64_t v60 = v106;
  int v61 = swift_dynamicCast();
  unint64_t v62 = *(void (**)(char *, uint64_t, uint64_t, int *))(v98 + 56);
  if (!v61)
  {
    uint64_t v35 = 1;
    v62(v24, 1, 1, v60);
    sub_2309A1E94((uint64_t)v24, &qword_2687099A8);
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v34 = 0xD000000000000027;
    uint64_t v36 = "Failed to produce binomial test results";
    goto LABEL_41;
  }
  v62(v24, 0, 1, v60);
  uint64_t v63 = v103;
  sub_2309AE594((uint64_t)v24, v103, type metadata accessor for BinomialTestResult);
  int v64 = *(unsigned __int8 *)(v63 + 17);
  uint64_t v65 = v97;
  uint64_t result = sub_2309AE5FC(v63, v97, type metadata accessor for BinomialTestResult);
  if (v64 == 2)
  {
    sub_2309AE664(v65, type metadata accessor for BinomialTestResult);
    goto LABEL_36;
  }
  int v70 = *(unsigned __int8 *)(v65 + 17);
  if (v70 == 2)
  {
    __break(1u);
    goto LABEL_67;
  }
  if ((v70 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_2309AE664(v97, type metadata accessor for BinomialTestResult);
LABEL_51:
    uint64_t v74 = testError;
    goto LABEL_54;
  }
  char v73 = sub_2309B58C8();
  swift_bridgeObjectRelease();
  sub_2309AE664(v97, type metadata accessor for BinomialTestResult);
  if (v73) {
    goto LABEL_51;
  }
LABEL_36:
  int v67 = *(unsigned __int8 *)(v63 + 17);
  uint64_t v68 = v96;
  uint64_t result = sub_2309AE5FC(v63, v96, type metadata accessor for BinomialTestResult);
  if (v67 == 2)
  {
    sub_2309AE664(v68, type metadata accessor for BinomialTestResult);
    unint64_t v69 = 0;
LABEL_55:
    uint64_t v76 = (uint64_t)v101;
    int v77 = *(unsigned __int8 *)(v63 + 16);
    if (v77 == 1)
    {
      sub_2309AF5F0(v63 + v60[12], v108, &qword_268709900);
      uint64_t v78 = v63 + v60[7];
    }
    else
    {
      uint64_t v79 = sub_2309B5678();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v108, 1, 1, v79);
      uint64_t v78 = (uint64_t)v107;
    }
    sub_2309AF5F0(v78, v76, &qword_268709900);
    if (*(unsigned char *)(v63 + v60[8] + 8)) {
      v107 = 0;
    }
    else {
      v107 = (void *)sub_2309B5758();
    }
    int v80 = *(unsigned __int8 *)(v63 + v60[9]);
    LODWORD(v105) = v77;
    if (v80 == 2) {
      uint64_t v81 = 0;
    }
    else {
      uint64_t v81 = (void *)sub_2309B5748();
    }
    uint64_t v82 = v60[11];
    uint64_t v83 = *(void *)(v63 + v60[10]);
    uint64_t v84 = *(void *)(v63 + v82);
    uint64_t v85 = v99;
    sub_2309AF5F0(v108, v99, &qword_268709900);
    uint64_t v86 = v76;
    uint64_t v87 = v76;
    uint64_t v88 = v100;
    sub_2309AF5F0(v86, v100, &qword_268709900);
    objc_allocWithZone((Class)TestResult);
    v106 = v69;
    id v89 = sub_2309AE400((char)v105, v69, v107, v81, v83, v84, v85, v88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687099C8);
    uint64_t v90 = swift_allocObject();
    *(_OWORD *)(v90 + 16) = xmmword_2309B6550;
    *(void *)(v90 + 32) = v89;
    v109[0] = v90;
    sub_2309B5728();
    uint64_t v35 = v109[0];

    sub_2309A1E94(v87, &qword_268709900);
    sub_2309A1E94(v108, &qword_268709900);
    sub_2309AE664(v103, type metadata accessor for BinomialTestResult);
    return v35;
  }
  int v71 = *(unsigned __int8 *)(v68 + 17);
  if (v71 != 2)
  {
    if (v71)
    {
      swift_bridgeObjectRelease();
      sub_2309AE664(v96, type metadata accessor for BinomialTestResult);
    }
    else
    {
      char v72 = sub_2309B58C8();
      swift_bridgeObjectRelease();
      sub_2309AE664(v96, type metadata accessor for BinomialTestResult);
      if ((v72 & 1) == 0)
      {
        unint64_t v69 = 0;
        goto LABEL_55;
      }
    }
    uint64_t v74 = &smallSampleSize;
LABEL_54:
    unint64_t v69 = *v74;
    uint64_t v75 = *v74;
    goto LABEL_55;
  }
LABEL_67:
  __break(1u);
  return result;
}

uint64_t Timeseries.runZTestBinomialProportionsTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  v117 = a7;
  uint64_t v119 = a6;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v113 = (uint64_t)v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v111 = (uint64_t)v101 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v112 = (uint64_t)v101 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v110 = (uint64_t)v101 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v114 = (uint64_t)v101 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v122 = (uint64_t)v101 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v121 = (uint64_t)v101 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v120 = (uint64_t)v101 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687099D0);
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v31 = (char *)v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = (int *)type metadata accessor for ZTestResult(0);
  uint64_t v32 = MEMORY[0x270FA5388](v118);
  uint64_t v33 = MEMORY[0x270FA5388](v32);
  MEMORY[0x270FA5388](v33);
  uint64_t v116 = (uint64_t)v101 - v37;
  if (a1 >> 62)
  {
    uint64_t v107 = v34;
    uint64_t v108 = v35;
    v109 = v36;
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_2309B5868();
    swift_bridgeObjectRelease();
    uint64_t v35 = v108;
    uint64_t v36 = v109;
    uint64_t v34 = v107;
  }
  else
  {
    uint64_t v38 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v38 != *(void *)(a2 + 16))
  {
    sub_23099D920();
    swift_allocError();
    uint64_t v42 = 0;
    *(void *)uint64_t v41 = 0xD000000000000036;
    uint64_t v43 = "samples and sampleTimestamps should be the same length";
    goto LABEL_38;
  }
  uint64_t v108 = v35;
  v109 = v36;
  uint64_t v107 = v34;
  BOOL v39 = a3 == 0x736B6E756863 && a4 == 0xE600000000000000;
  char v40 = v39;
  if (v39)
  {
LABEL_18:
    if (a5 && (uint64_t)objc_msgSend(a5, sel_integerValue) > 0) {
      goto LABEL_20;
    }
    sub_23099D920();
    swift_allocError();
    uint64_t v42 = 0;
    *(void *)uint64_t v41 = 0xD00000000000004CLL;
    uint64_t v43 = "minimumSampleSize should be in range (0, Int.max) when chunkMethod is chunks";
LABEL_38:
    *(void *)(v41 + 8) = (unint64_t)(v43 - 32) | 0x8000000000000000;
    *(unsigned char *)(v41 + 16) = v42;
    swift_willThrow();
    return v42;
  }
  if ((sub_2309B58C8() & 1) == 0)
  {
    if (a3 == 1937334628 && a4 == 0xE400000000000000) {
      goto LABEL_17;
    }
    if ((sub_2309B58C8() & 1) == 0)
    {
      sub_23099D920();
      swift_allocError();
      uint64_t v42 = 0;
      *(void *)uint64_t v41 = 0xD000000000000024;
      uint64_t v43 = "chunkMethod should be chunks or days";
      goto LABEL_38;
    }
  }
  if (v40) {
    goto LABEL_18;
  }
LABEL_17:
  if (sub_2309B58C8()) {
    goto LABEL_18;
  }
LABEL_20:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v103 = sub_2309AA1F4(a1, a2);
  v101[1] = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B0);
  uint64_t v44 = swift_allocObject();
  long long v102 = xmmword_2309B6220;
  *(_OWORD *)(v44 + 16) = xmmword_2309B6220;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B8);
  uint64_t inited = swift_initStackObject();
  long long v115 = xmmword_2309B62E0;
  *(_OWORD *)(inited + 16) = xmmword_2309B62E0;
  *(void *)(inited + 32) = 0x73646C656966;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2687098C0);
  *(void *)(inited + 48) = &unk_26E537E10;
  unint64_t v46 = sub_2309AA0BC(inited);
  *(void *)(v44 + 32) = 0x6148657275736E65;
  *(void *)(v44 + 40) = 0xEF73646C65694673;
  *(void *)(v44 + 48) = v46;
  uint64_t v47 = swift_initStackObject();
  *(_OWORD *)(v47 + 16) = v115;
  *(void *)(v47 + 32) = 0x646C656966;
  *(void *)(v47 + 40) = 0xE500000000000000;
  uint64_t v48 = MEMORY[0x263F8D310];
  *(void *)(v47 + 72) = MEMORY[0x263F8D310];
  *(void *)(v47 + 48) = 0x6D617473656D6974;
  *(void *)(v47 + 56) = 0xE900000000000070;
  unint64_t v49 = sub_2309AA0BC(v47);
  *(void *)(v44 + 56) = 0xD000000000000012;
  *(void *)(v44 + 64) = 0x80000002309B6E90;
  *(void *)(v44 + 72) = v49;
  uint64_t v106 = 1937334628;
  if (a3 == 1937334628 && a4 == 0xE400000000000000 || (sub_2309B58C8() & 1) != 0)
  {
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = v115;
    *(void *)(v50 + 32) = 0x6C656946656D6974;
    *(void *)(v50 + 40) = 0xE900000000000064;
    *(void *)(v50 + 72) = v48;
    *(void *)(v50 + 48) = 0x6D617473656D6974;
    *(void *)(v50 + 56) = 0xE900000000000070;
    unint64_t v104 = sub_2309AA0BC(v50);
    unint64_t v105 = 0xE400000000000000;
  }
  else
  {
    uint64_t v51 = swift_initStackObject();
    *(_OWORD *)(v51 + 16) = v115;
    *(void *)(v51 + 32) = 0x6C656946656D6974;
    *(void *)(v51 + 40) = 0xE900000000000064;
    *(void *)(v51 + 72) = v48;
    *(void *)(v51 + 48) = 0x6D617473656D6974;
    *(void *)(v51 + 56) = 0xE900000000000070;
    unint64_t v104 = sub_2309AA0BC(v51);
    unint64_t v105 = 0xE700000000000000;
    uint64_t v106 = 0x6E75527473616CLL;
  }
  uint64_t v52 = swift_allocObject();
  if (a5)
  {
    *(_OWORD *)(v52 + 16) = v102;
    uint64_t v53 = swift_initStackObject();
    *(_OWORD *)(v53 + 16) = v115;
    *(void *)(v53 + 32) = 0x74676E654C78616DLL;
    *(void *)(v53 + 40) = 0xE900000000000068;
    *(void *)(v53 + 72) = MEMORY[0x263F8D6C8];
    *(void *)(v53 + 48) = 2;
    unint64_t v54 = sub_2309AA0BC(v53);
    *(void *)(v52 + 32) = 0x786966667573;
    *(void *)(v52 + 40) = 0xE600000000000000;
    *(void *)(v52 + 48) = v54;
    uint64_t v55 = swift_initStackObject();
    *(_OWORD *)(v55 + 16) = v115;
    *(void *)(v55 + 32) = 0xD000000000000011;
    *(void *)(v55 + 40) = 0x80000002309B69E0;
    uint64_t v56 = sub_2309A9E44(0, &qword_268709988);
    *(void *)(v55 + 72) = v56;
    *(void *)(v55 + 48) = a5;
    id v57 = a5;
    unint64_t v58 = sub_2309AA0BC(v55);
    *(void *)(v52 + 56) = 0xD000000000000010;
    *(void *)(v52 + 64) = 0x80000002309B69A0;
    *(void *)(v52 + 72) = v58;
    uint64_t v59 = swift_initStackObject();
    *(_OWORD *)(v59 + 16) = xmmword_2309B6540;
    *(void *)(v59 + 32) = 0x6C65694661746164;
    *(void *)(v59 + 40) = 0xE900000000000064;
    *(void *)(v59 + 48) = 1635017060;
    *(void *)(v59 + 56) = 0xE400000000000000;
    uint64_t v60 = MEMORY[0x263F8D310];
    *(void *)(v59 + 72) = MEMORY[0x263F8D310];
    *(void *)(v59 + 80) = 0x6C656946656D6974;
    *(void *)(v59 + 88) = 0xE900000000000064;
    *(void *)(v59 + 96) = 0x6D617473656D6974;
    *(void *)(v59 + 104) = 0xE900000000000070;
    *(void *)(v59 + 120) = v60;
    *(void *)(v59 + 128) = 0xD000000000000011;
    *(void *)(v59 + 136) = 0x80000002309B69E0;
    *(void *)(v59 + 144) = v57;
    *(void *)(v59 + 168) = v56;
    *(void *)(v59 + 176) = 0xD000000000000011;
    *(void *)(v59 + 216) = v56;
    int v61 = v117;
    *(void *)(v59 + 184) = 0x80000002309B6EB0;
    *(void *)(v59 + 192) = v61;
    id v62 = v57;
  }
  else
  {
    *(_OWORD *)(v52 + 16) = v115;
    uint64_t v63 = swift_initStackObject();
    *(_OWORD *)(v63 + 16) = v115;
    *(void *)(v63 + 32) = 0x74676E654C78616DLL;
    *(void *)(v63 + 40) = 0xE900000000000068;
    *(void *)(v63 + 72) = MEMORY[0x263F8D6C8];
    *(void *)(v63 + 48) = 2;
    unint64_t v64 = sub_2309AA0BC(v63);
    *(void *)(v52 + 32) = 0x786966667573;
    *(void *)(v52 + 40) = 0xE600000000000000;
    *(void *)(v52 + 48) = v64;
    uint64_t v59 = swift_initStackObject();
    *(_OWORD *)(v59 + 16) = xmmword_2309B6560;
    *(void *)(v59 + 32) = 0x6C65694661746164;
    *(void *)(v59 + 40) = 0xE900000000000064;
    *(void *)(v59 + 48) = 1635017060;
    *(void *)(v59 + 56) = 0xE400000000000000;
    uint64_t v65 = MEMORY[0x263F8D310];
    *(void *)(v59 + 72) = MEMORY[0x263F8D310];
    *(void *)(v59 + 80) = 0x6C656946656D6974;
    *(void *)(v59 + 88) = 0xE900000000000064;
    *(void *)(v59 + 96) = 0x6D617473656D6974;
    *(void *)(v59 + 104) = 0xE900000000000070;
    *(void *)(v59 + 120) = v65;
    *(void *)(v59 + 128) = 0xD000000000000011;
    *(void *)(v59 + 136) = 0x80000002309B6EB0;
    *(void *)(v59 + 168) = sub_2309A9E44(0, &qword_268709988);
    int v61 = v117;
    *(void *)(v59 + 144) = v117;
  }
  id v66 = v61;
  unint64_t v67 = sub_2309AA0BC(v59);
  v124[0] = &unk_26E537E50;
  v124[1] = v44;
  v124[2] = v106;
  v124[3] = v105;
  v124[4] = v104;
  v124[5] = v52;
  v124[6] = 0x747365545ALL;
  v124[7] = 0xE500000000000000;
  v124[8] = v67;
  sub_2309ABC50(v103, v124, v119, (uint64_t)v123);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687099C0);
  uint64_t v68 = v118;
  int v69 = swift_dynamicCast();
  int v70 = (void (*)(char *, uint64_t, uint64_t, int *))v109[7];
  if (!v69)
  {
    uint64_t v42 = 1;
    v70(v31, 1, 1, v68);
    sub_2309A1E94((uint64_t)v31, &qword_2687099D0);
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v41 = 0xD000000000000020;
    uint64_t v43 = "Failed to produce Z test results";
    goto LABEL_38;
  }
  v70(v31, 0, 1, v68);
  uint64_t v71 = v116;
  sub_2309AE594((uint64_t)v31, v116, type metadata accessor for ZTestResult);
  int v72 = *(unsigned __int8 *)(v71 + 17);
  char v73 = v108;
  uint64_t result = sub_2309AE5FC(v71, (uint64_t)v108, type metadata accessor for ZTestResult);
  if (v72 == 2)
  {
    sub_2309AE664((uint64_t)v73, type metadata accessor for ZTestResult);
    goto LABEL_34;
  }
  int v78 = v73[17];
  if (v78 == 2)
  {
    __break(1u);
    goto LABEL_67;
  }
  if ((v78 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_2309AE664((uint64_t)v108, type metadata accessor for ZTestResult);
LABEL_48:
    uint64_t v82 = testError;
    goto LABEL_51;
  }
  char v81 = sub_2309B58C8();
  swift_bridgeObjectRelease();
  sub_2309AE664((uint64_t)v108, type metadata accessor for ZTestResult);
  if (v81) {
    goto LABEL_48;
  }
LABEL_34:
  int v75 = *(unsigned __int8 *)(v71 + 17);
  uint64_t v76 = v107;
  uint64_t result = sub_2309AE5FC(v71, v107, type metadata accessor for ZTestResult);
  if (v75 == 2)
  {
    sub_2309AE664(v76, type metadata accessor for ZTestResult);
LABEL_36:
    int v77 = 0;
LABEL_52:
    int v84 = *(unsigned __int8 *)(v71 + 16);
    LODWORD(v117) = v84;
    if (v84 == 1)
    {
      sub_2309AF5F0(v71 + v68[12], v120, &qword_268709900);
      sub_2309AF5F0(v71 + v68[13], v121, &qword_268709900);
      sub_2309AF5F0(v71 + v68[16], v122, &qword_268709900);
      uint64_t v85 = v71 + v68[7];
      uint64_t v86 = v114;
    }
    else
    {
      uint64_t v87 = sub_2309B5678();
      uint64_t v88 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v87 - 8) + 56);
      v88(v120, 1, 1, v87);
      v88(v121, 1, 1, v87);
      v88(v122, 1, 1, v87);
      uint64_t v86 = v114;
      uint64_t v85 = v119;
    }
    sub_2309AF5F0(v85, v86, &qword_268709900);
    if (*(uint64_t *)(v71 + v68[14]) < 1)
    {
      uint64_t v90 = 0;
      uint64_t v89 = 0;
    }
    else
    {
      uint64_t v89 = *(void *)(v71 + v68[11]);
      uint64_t v90 = *(void *)(v71 + v68[10]);
    }
    char v91 = *(unsigned char *)(v71 + v68[8] + 8);
    uint64_t v119 = *(void *)(v71 + v68[14]);
    uint64_t v114 = v90;
    *(void *)&long long v115 = v89;
    if (v91) {
      v109 = 0;
    }
    else {
      v109 = (void *)sub_2309B5758();
    }
    if (*(unsigned char *)(v71 + v68[9]) == 2) {
      uint64_t v108 = 0;
    }
    else {
      uint64_t v108 = (unsigned __int8 *)sub_2309B5748();
    }
    uint64_t v92 = v110;
    sub_2309AF5F0(v120, v110, &qword_268709900);
    uint64_t v93 = v112;
    sub_2309AF5F0(v121, v112, &qword_268709900);
    uint64_t v94 = *(void *)(v71 + v68[15]);
    uint64_t v95 = v111;
    sub_2309AF5F0(v122, v111, &qword_268709900);
    uint64_t v96 = v86;
    uint64_t v97 = v86;
    uint64_t v98 = v113;
    sub_2309AF5F0(v96, v113, &qword_268709900);
    objc_allocWithZone((Class)TwoSampleTestResult);
    v118 = v77;
    id v99 = sub_2309AE6C4((char)v117, v77, v109, v108, v114, v115, v92, v93, v119, v94, v95, v98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687099C8);
    uint64_t v100 = swift_allocObject();
    *(_OWORD *)(v100 + 16) = xmmword_2309B6550;
    *(void *)(v100 + 32) = v99;
    v123[0] = v100;
    sub_2309B5728();
    uint64_t v42 = v123[0];

    sub_2309A1E94(v97, &qword_268709900);
    sub_2309A1E94(v122, &qword_268709900);
    sub_2309A1E94(v121, &qword_268709900);
    sub_2309A1E94(v120, &qword_268709900);
    sub_2309AE664(v116, type metadata accessor for ZTestResult);
    return v42;
  }
  int v79 = *(unsigned __int8 *)(v76 + 17);
  if (v79 != 2)
  {
    if (v79)
    {
      swift_bridgeObjectRelease();
      sub_2309AE664(v107, type metadata accessor for ZTestResult);
    }
    else
    {
      char v80 = sub_2309B58C8();
      swift_bridgeObjectRelease();
      sub_2309AE664(v107, type metadata accessor for ZTestResult);
      if ((v80 & 1) == 0) {
        goto LABEL_36;
      }
    }
    uint64_t v82 = &smallSampleSize;
LABEL_51:
    int v77 = *v82;
    uint64_t v83 = *v82;
    goto LABEL_52;
  }
LABEL_67:
  __break(1u);
  return result;
}

id Timeseries.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id Timeseries.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Timeseries();
  return objc_msgSendSuper2(&v2, sel_init);
}

id Timeseries.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Timeseries();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2309AE400(char a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = sub_2309B5678();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  uint64_t v16 = 0;
  if (v15(a7, 1, v13) != 1)
  {
    uint64_t v16 = (void *)sub_2309B5628();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a7, v13);
  }
  if (v15(a8, 1, v13) == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = (void *)sub_2309B5628();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a8, v13);
  }
  id v18 = objc_msgSend(v21, sel_initWithTestRan_testSkippedReason_pValue_rejectNullHypothesis_sampleSize_numSuccesses_minTimestamp_maxTimestamp_, a1 & 1, a2, a3, a4, a5, a6, v16, v17);

  return v18;
}

uint64_t sub_2309AE594(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2309AE5FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2309AE664(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_2309AE6C4(char a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14 = sub_2309B5678();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  uint64_t v17 = 0;
  if (v16(a7, 1, v14) != 1)
  {
    uint64_t v17 = sub_2309B5628();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a7, v14);
  }
  uint64_t v23 = (void *)v17;
  if (v16(a8, 1, v14) == 1)
  {
    id v18 = 0;
  }
  else
  {
    id v18 = (void *)sub_2309B5628();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a8, v14);
  }
  if (v16(a11, 1, v14) == 1)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = (void *)sub_2309B5628();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a11, v14);
  }
  if (v16(a12, 1, v14) == 1)
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = (void *)sub_2309B5628();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a12, v14);
  }
  id v21 = objc_msgSend(v25, sel_initWithTestRan_testSkippedReason_testStatistic_rejectNullHypothesis_sampleSize1_numSuccesses1_minTimestamp1_maxTimestamp1_sampleSize2_numSuccesses2_minTimestamp2_maxTimestamp2_, a1 & 1, a2, a3, a4, a5, a6, v23, v18, a9, a10, v19, v20);

  return v21;
}

uint64_t type metadata accessor for Timeseries()
{
  return self;
}

char *sub_2309AE944(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2309AEA24(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_2309AE964(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2309AEC3C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_2309AE984(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2309AED60(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_2309AE9A4(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2309AEE84(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_2309AE9C4(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_2309AEFA8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2309AE9E4(char *a1, int64_t a2, char a3)
{
  size_t result = sub_2309AF17C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2309AEA04(char *a1, int64_t a2, char a3)
{
  size_t result = sub_2309AEB40(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2309AEA24(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687099B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2309AEB40(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void *sub_2309AEC3C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_2309AED60(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098E8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098B0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_2309AEE84(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687099F8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_2309AEFA8(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268709A00);
  uint64_t v10 = *(void *)(sub_2309B5678() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_2309B5678() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

char *sub_2309AF17C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687099F0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void *sub_2309AF278(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (void *)v3;
    }
    uint64_t v15 = MEMORY[0x263F8EE78];
    size_t result = sub_2309AE984(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v15;
    unint64_t v14 = v1 & 0xC000000000000001;
    unint64_t v6 = v1;
    while (v2 != v5)
    {
      if (v14) {
        id v7 = (id)MEMORY[0x230FC36E0](v5, v1);
      }
      else {
        id v7 = *(id *)(v1 + 8 * v5 + 32);
      }
      uint64_t v8 = v7;
      uint64_t v9 = (void *)sub_2309B5708();
      id v10 = objc_msgSend(v8, sel_dictionaryWithValuesForKeys_, v9);

      uint64_t v11 = sub_2309B56A8();
      unint64_t v13 = *(void *)(v15 + 16);
      unint64_t v12 = *(void *)(v15 + 24);
      if (v13 >= v12 >> 1) {
        sub_2309AE984((void *)(v12 > 1), v13 + 1, 1);
      }
      ++v5;
      *(void *)(v15 + 16) = v13 + 1;
      *(void *)(v15 + 8 * v13 + 32) = v11;
      unint64_t v1 = v6;
      if (v2 == v5) {
        return (void *)v3;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2309B5868();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_2309AF440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687099E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2309AF4A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2309AF4D4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2309AF500(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_2309AF518(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709A08);
    long long v3 = (void *)sub_2309B5898();
    for (uint64_t i = (double *)(a1 + 40); ; i += 2)
    {
      double v5 = *(i - 1);
      double v6 = *i;
      unint64_t result = sub_23099F378(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(double *)(v3[6] + v9) = v5;
      *(double *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_2309AF5F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2309AF654(uint64_t a1)
{
  return a1;
}

uint64_t Normal.deinit()
{
  return v0;
}

uint64_t Normal.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Normal()
{
  return self;
}

void sub_2309AF710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, unsigned __int8 a7, double a8)
{
  if (a1 < 0 || a2 < a1)
  {
    sub_23099D920();
    swift_allocError();
    char v11 = 0;
    *(void *)uint64_t v9 = 0xD00000000000001BLL;
    uint64_t v12 = "k1 must be in range [1, n1]";
LABEL_17:
    unint64_t v13 = (unint64_t)(v12 - 32) | 0x8000000000000000;
LABEL_18:
    *(void *)(v9 + 8) = v13;
    *(unsigned char *)(v9 + 16) = v11;
    swift_willThrow();
    return;
  }
  if (a3 < 0 || a4 < a3)
  {
    sub_23099D920();
    swift_allocError();
    char v11 = 0;
    *(void *)uint64_t v9 = 0xD00000000000001BLL;
    uint64_t v12 = "k2 must be in range [1, n2]";
    goto LABEL_17;
  }
  double v8 = a8;
  if (a8 >= 1.0 || a8 <= 0.0)
  {
    sub_23099D920();
    swift_allocError();
    char v11 = 0;
    *(void *)uint64_t v9 = 0xD00000000000002ELL;
    uint64_t v12 = "significance_level must be in range (0.0, 1.0)";
    goto LABEL_17;
  }
  if (a2 <= 0)
  {
    sub_23099D920();
    swift_allocError();
    char v11 = 0;
    *(void *)uint64_t v9 = 0xD00000000000001FLL;
    uint64_t v12 = "n1 must be in range (1, maxInt]";
    goto LABEL_17;
  }
  if (a4 <= 0)
  {
    sub_23099D920();
    swift_allocError();
    char v11 = 0;
    *(void *)uint64_t v9 = 0xD00000000000001FLL;
    uint64_t v12 = "n2 must be in range (1, maxInt]";
    goto LABEL_17;
  }
  if ((a5 & 1) == 0)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD000000000000027;
    uint64_t v10 = "Unpooled z test is not implemented yet.";
    goto LABEL_20;
  }
  if (a6)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD00000000000002DLL;
    uint64_t v10 = "Continuity correction is not implemented yet.";
LABEL_20:
    unint64_t v13 = (unint64_t)(v10 - 32) | 0x8000000000000000;
    char v11 = 2;
    goto LABEL_18;
  }
  if (a7 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v15 = sub_2309B58C8();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      if (a7 > 1u)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v16 = sub_2309B58C8();
        swift_bridgeObjectRelease();
        if ((v16 & 1) == 0)
        {
          double v8 = v8 * 0.5;
          goto LABEL_29;
        }
      }
      double v8 = 1.0 - v8;
    }
  }
LABEL_29:
  sub_23099DA8C(v8);
}

uint64_t runPreprocessingSteps(_:steps:lastRun:)(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    uint64_t v5 = (uint64_t *)result;
    swift_bridgeObjectRetain();
    for (uint64_t i = (uint64_t *)(a2 + 48); ; i += 3)
    {
      uint64_t v7 = *(i - 1);
      uint64_t v8 = *i;
      uint64_t v9 = *(i - 2);
      swift_bridgeObjectRetain();
      uint64_t v10 = swift_bridgeObjectRetain();
      char v11 = (void *)MEMORY[0x230FC38C0](v10);
      sub_2309AFBE8(v9, v7, v8, v5);
      if (v2) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v3) {
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2309AFBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  BOOL v6 = a1 == 0x6148657275736E65 && a2 == 0xEF73646C65694673;
  if (!v6 && (sub_2309B58C8() & 1) == 0)
  {
    if (a1 == 0xD000000000000012 && a2 == 0x80000002309B6E90 || (sub_2309B58C8() & 1) != 0)
    {
      if (*(void *)(a3 + 16))
      {
        unint64_t v14 = sub_23099F300(0x646C656966, 0xE500000000000000);
        if (v15)
        {
          sub_23099D880(*(void *)(a3 + 56) + 32 * v14, (uint64_t)v57);
          if (swift_dynamicCast())
          {
            uint64_t v16 = swift_bridgeObjectRetain();
            sub_2309B08E8(v16, v55, v56);
            goto LABEL_10;
          }
        }
      }
      sub_23099D920();
      swift_allocError();
      uint64_t v17 = "EnsureIsSortedDate expects arguments: (field)";
      unint64_t v18 = 0xD00000000000002DLL;
      goto LABEL_85;
    }
    if (a1 == 0x6C694E746F6ELL && a2 == 0xE600000000000000 || (sub_2309B58C8() & 1) != 0)
    {
      if (*(void *)(a3 + 16))
      {
        unint64_t v19 = sub_23099F300(0x6569467475706E69, 0xEA0000000000646CLL);
        if (v20)
        {
          sub_23099D880(*(void *)(a3 + 56) + 32 * v19, (uint64_t)v57);
          if (swift_dynamicCast())
          {
            uint64_t v22 = v55;
            uint64_t v21 = v56;
            if (!*(void *)(a3 + 16)
              || (unint64_t v23 = sub_23099F300(0x694674757074756FLL, 0xEB00000000646C65), (v24 & 1) == 0))
            {
              uint64_t v25 = 0;
              uint64_t v26 = 0;
              uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2309B16C0;
              goto LABEL_67;
            }
            sub_23099D880(*(void *)(a3 + 56) + 32 * v23, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              uint64_t v25 = v55;
              uint64_t v26 = v56;
              uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2309B16C0;
LABEL_67:
              sub_2309B0EB8((uint64_t)a4, v22, v21, v25, v26, v27);
              goto LABEL_10;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_23099D920();
      swift_allocError();
      uint64_t v17 = "NotNil expects arguments: (inputField, outputField?)";
      unint64_t v18 = 0xD000000000000034;
LABEL_85:
      *(void *)uint64_t v13 = v18;
      *(void *)(v13 + 8) = (unint64_t)(v17 - 32) | 0x8000000000000000;
      goto LABEL_86;
    }
    if (a1 == 0x754E6F5465746164 && a2 == 0xED0000636972656DLL || (sub_2309B58C8() & 1) != 0)
    {
      if (*(void *)(a3 + 16))
      {
        unint64_t v28 = sub_23099F300(0x6569467475706E69, 0xEA0000000000646CLL);
        if (v29)
        {
          sub_23099D880(*(void *)(a3 + 56) + 32 * v28, (uint64_t)v57);
          if (swift_dynamicCast())
          {
            uint64_t v22 = v55;
            uint64_t v21 = v56;
            if (!*(void *)(a3 + 16)
              || (unint64_t v30 = sub_23099F300(0x694674757074756FLL, 0xEB00000000646C65), (v31 & 1) == 0))
            {
              uint64_t v25 = 0;
              uint64_t v26 = 0;
              uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2309B1304;
              goto LABEL_67;
            }
            sub_23099D880(*(void *)(a3 + 56) + 32 * v30, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              uint64_t v25 = v55;
              uint64_t v26 = v56;
              uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2309B1304;
              goto LABEL_67;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_23099D920();
      swift_allocError();
      uint64_t v17 = "DateToNumeric expects arguments: (inputField, outputField?)";
      goto LABEL_84;
    }
    if (a1 == 0x54636972656D756ELL && a2 == 0xED0000657461446FLL || (sub_2309B58C8() & 1) != 0)
    {
      if (*(void *)(a3 + 16))
      {
        unint64_t v32 = sub_23099F300(0x6569467475706E69, 0xEA0000000000646CLL);
        if (v33)
        {
          sub_23099D880(*(void *)(a3 + 56) + 32 * v32, (uint64_t)v57);
          if (swift_dynamicCast())
          {
            uint64_t v22 = v55;
            uint64_t v21 = v56;
            if (!*(void *)(a3 + 16)
              || (unint64_t v34 = sub_23099F300(0x694674757074756FLL, 0xEB00000000646C65), (v35 & 1) == 0))
            {
              uint64_t v25 = 0;
              uint64_t v26 = 0;
              goto LABEL_66;
            }
            sub_23099D880(*(void *)(a3 + 56) + 32 * v34, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              uint64_t v25 = v55;
              uint64_t v26 = v56;
LABEL_66:
              uint64_t v27 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2309B108C;
              goto LABEL_67;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_23099D920();
      swift_allocError();
      uint64_t v17 = "NumericToDate expects arguments: (inputField, outputField?)";
LABEL_84:
      unint64_t v18 = 0xD00000000000003BLL;
      goto LABEL_85;
    }
    if (a1 == 0xD000000000000011 && a2 == 0x80000002309B71C0 || (sub_2309B58C8() & 1) != 0)
    {
      if (*(void *)(a3 + 16))
      {
        unint64_t v36 = sub_23099F300(0x6569467475706E69, 0xEA0000000000646CLL);
        if (v37)
        {
          sub_23099D880(*(void *)(a3 + 56) + 32 * v36, (uint64_t)v57);
          if (swift_dynamicCast())
          {
            if (!*(void *)(a3 + 16)
              || (unint64_t v38 = sub_23099F300(0x694674757074756FLL, 0xEB00000000646C65), (v39 & 1) == 0))
            {
              uint64_t v40 = 0;
              uint64_t v41 = 0;
              goto LABEL_81;
            }
            sub_23099D880(*(void *)(a3 + 56) + 32 * v38, (uint64_t)v57);
            if (swift_dynamicCast())
            {
              uint64_t v40 = v55;
              uint64_t v41 = v56;
LABEL_81:
              sub_2309B0F7C(a4, v55, v56, v40, v41);
              goto LABEL_10;
            }
            swift_bridgeObjectRelease();
          }
        }
      }
      sub_23099D920();
      swift_allocError();
      uint64_t v17 = "ComputeDifference expects arguments: (inputField, outputField?)";
      unint64_t v18 = 0xD00000000000003FLL;
      goto LABEL_85;
    }
    if ((a1 != 0x73726946706F7264 || a2 != 0xE900000000000074) && (sub_2309B58C8() & 1) == 0)
    {
      sub_2309B57C8();
      swift_bridgeObjectRelease();
      v57[0] = 0xD00000000000001CLL;
      v57[1] = 0x80000002309B71E0;
      swift_bridgeObjectRetain();
      sub_2309B56F8();
      swift_bridgeObjectRelease();
      sub_23099D920();
      swift_allocError();
      *(void *)uint64_t v13 = 0xD00000000000001CLL;
      *(void *)(v13 + 8) = 0x80000002309B71E0;
      goto LABEL_86;
    }
    if (!*(void *)(a3 + 16)
      || (unint64_t v42 = sub_23099F300(0x73706F72446D756ELL, 0xE800000000000000), (v43 & 1) == 0)
      || (sub_23099D880(*(void *)(a3 + 56) + 32 * v42, (uint64_t)v57), (swift_dynamicCast() & 1) == 0))
    {
      sub_23099D920();
      swift_allocError();
      uint64_t v17 = "DropFirst expects arguments: (numDrops)";
      unint64_t v18 = 0xD000000000000027;
      goto LABEL_85;
    }
    uint64_t v44 = sub_2309B104C(v55, *a4);
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    unint64_t v50 = v49;
    if (v49)
    {
      sub_2309B58D8();
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v53 = swift_dynamicCastClass();
      if (!v53)
      {
        swift_unknownObjectRelease();
        uint64_t v53 = MEMORY[0x263F8EE78];
      }
      uint64_t v54 = *(void *)(v53 + 16);
      swift_release();
      if (__OFSUB__(v50 >> 1, v48))
      {
        __break(1u);
      }
      else if (v54 == (v50 >> 1) - v48)
      {
        uint64_t v52 = swift_dynamicCastClass();
        if (!v52)
        {
          swift_unknownObjectRelease();
          uint64_t v52 = MEMORY[0x263F8EE78];
        }
        goto LABEL_96;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    sub_23099DE7C(v44, v46, v48, v50);
    uint64_t v52 = v51;
LABEL_96:
    swift_unknownObjectRelease();
    *a4 = v52;
    return swift_bridgeObjectRelease();
  }
  if (*(void *)(a3 + 16))
  {
    unint64_t v9 = sub_23099F300(0x73646C656966, 0xE600000000000000);
    if (v10)
    {
      sub_23099D880(*(void *)(a3 + 56) + 32 * v9, (uint64_t)v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687098C0);
      if (swift_dynamicCast())
      {
        uint64_t v11 = swift_bridgeObjectRetain();
        sub_2309B06D4(v11, v55);
LABEL_10:
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
  }
  sub_23099D920();
  swift_allocError();
  *(void *)uint64_t v13 = 0xD00000000000002BLL;
  *(void *)(v13 + 8) = 0x80000002309B7360;
LABEL_86:
  *(unsigned char *)(v13 + 16) = 0;
  return swift_willThrow();
}

uint64_t sub_2309B06D4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v4 = *(void *)(a2 + 16);
    uint64_t v5 = result + 32;
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    uint64_t v7 = (uint64_t *)(a2 + 40);
    uint64_t v19 = v2;
    uint64_t v15 = v5;
    uint64_t v16 = v4;
    while (!v4)
    {
LABEL_3:
      if (++v6 == v2) {
        return swift_bridgeObjectRelease();
      }
    }
    uint64_t v8 = *(void *)(v5 + 8 * v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v10 = *(v7 - 1);
      uint64_t v9 = *v7;
      if (!*(void *)(v8 + 16)) {
        break;
      }
      swift_bridgeObjectRetain_n();
      unint64_t v11 = sub_23099F300(v10, v9);
      if (v12)
      {
        sub_23099D880(*(void *)(v8 + 56) + 32 * v11, (uint64_t)&v17);
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v18 + 1)) {
        goto LABEL_14;
      }
      v7 += 2;
      swift_bridgeObjectRelease();
      sub_2309A1E94((uint64_t)&v17, &qword_2687098D0);
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v2 = v19;
        uint64_t v5 = v15;
        uint64_t v4 = v16;
        uint64_t v7 = (uint64_t *)(a2 + 40);
        goto LABEL_3;
      }
    }
    long long v17 = 0u;
    long long v18 = 0u;
    swift_bridgeObjectRetain();
LABEL_14:
    swift_bridgeObjectRelease();
    sub_2309A1E94((uint64_t)&v17, &qword_2687098D0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)&long long v17 = 0;
    *((void *)&v17 + 1) = 0xE000000000000000;
    sub_2309B57C8();
    swift_bridgeObjectRelease();
    *(void *)&long long v17 = 0xD000000000000028;
    *((void *)&v17 + 1) = 0x80000002309B7390;
    sub_2309B56F8();
    swift_bridgeObjectRelease();
    long long v13 = v17;
    sub_23099D920();
    swift_allocError();
    *(_OWORD *)uint64_t v14 = v13;
    *(unsigned char *)(v14 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2309B08E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a2;
  uint64_t v6 = sub_2309B5678();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v51 = (char *)&v41 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  long long v18 = (char *)&v41 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = *(void (**)(void))(v7 + 56);
  uint64_t v44 = (char *)&v41 - v20;
  uint64_t v55 = v7 + 56;
  uint64_t v52 = v19;
  v19();
  uint64_t v49 = *(void *)(a1 + 16);
  if (!v49)
  {
LABEL_17:
    uint64_t v36 = (uint64_t)v44;
    return sub_2309A1E94(v36, &qword_268709900);
  }
  uint64_t v46 = v15;
  uint64_t v41 = v3;
  uint64_t v21 = (void (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v48 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  unint64_t v42 = (void (**)(char *, uint64_t))(v7 + 8);
  char v43 = v10;
  uint64_t v22 = swift_bridgeObjectRetain();
  uint64_t v23 = 0;
  uint64_t v24 = (uint64_t)v44;
  uint64_t v50 = v22;
  uint64_t v47 = a3;
  uint64_t v25 = (uint64_t)v46;
  while (1)
  {
    uint64_t v27 = *(void *)(v22 + 8 * v23 + 32);
    if (*(void *)(v27 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v28 = sub_23099F300(v45, a3);
      if (v29)
      {
        sub_23099D880(*(void *)(v27 + 56) + 32 * v28, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v53 = 0u;
      long long v54 = 0u;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
    int v30 = swift_dynamicCast();
    char v31 = v51;
    if (!v30)
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v52)(v18, 1, 1, v6);
      swift_bridgeObjectRelease();
      sub_2309A1E94((uint64_t)v18, &qword_268709900);
      *(void *)&long long v53 = 0;
      *((void *)&v53 + 1) = 0xE000000000000000;
      sub_2309B57C8();
      sub_2309B56F8();
      sub_2309B56F8();
      sub_2309B56F8();
      sub_2309B56F8();
      long long v34 = v53;
      sub_23099D920();
      swift_allocError();
      *(_OWORD *)uint64_t v35 = v34;
      *(unsigned char *)(v35 + 16) = 1;
      swift_willThrow();
      goto LABEL_19;
    }
    ((void (*)(char *, void, uint64_t, uint64_t))v52)(v18, 0, 1, v6);
    unint64_t v32 = *v21;
    (*v21)(v31, v18, v6);
    sub_2309AF5F0(v24, v25, &qword_268709900);
    if ((*v48)(v25, 1, v6) != 1) {
      break;
    }
    sub_2309A1E94(v24, &qword_268709900);
    uint64_t v26 = v25;
LABEL_4:
    ++v23;
    sub_2309A1E94(v26, &qword_268709900);
    v32((char *)v24, v31, v6);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v52)(v24, 0, 1, v6);
    uint64_t v22 = v50;
    a3 = v47;
    if (v49 == v23)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  char v33 = v43;
  v32(v43, (char *)v25, v6);
  sub_2309A1EF0();
  if ((sub_2309B56B8() & 1) == 0)
  {
    (*v42)(v33, v6);
    uint64_t v24 = (uint64_t)v44;
    uint64_t v26 = (uint64_t)v44;
    char v31 = v51;
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  *(void *)&long long v53 = 0;
  *((void *)&v53 + 1) = 0xE000000000000000;
  sub_2309B57C8();
  swift_bridgeObjectRelease();
  *(void *)&long long v53 = 0x6569662065746144;
  *((void *)&v53 + 1) = 0xEB0000000020646CLL;
  sub_2309B56F8();
  sub_2309B56F8();
  long long v37 = v53;
  sub_23099D920();
  swift_allocError();
  *(_OWORD *)uint64_t v38 = v37;
  *(unsigned char *)(v38 + 16) = 1;
  swift_willThrow();
  char v39 = *v42;
  (*v42)(v33, v6);
  v39(v51, v6);
  uint64_t v24 = (uint64_t)v44;
LABEL_19:
  uint64_t v36 = v24;
  return sub_2309A1E94(v36, &qword_268709900);
}

void sub_2309B0EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(*(void *)a1 + 16);
  if (v7)
  {
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = (void *)MEMORY[0x230FC38C0]();
      a6(a1, v13, a2, a3, a4, a5);
      if (v6) {
        break;
      }
      ++v13;
      if (v7 == v13) {
        return;
      }
    }
  }
}

void sub_2309B0F7C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = 0;
  char v15 = 1;
  uint64_t v6 = *(void *)(*a1 + 16);
  if (v6)
  {
    unint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = (void *)MEMORY[0x230FC38C0](a1, a2);
      sub_2309B1988(a1, v12, a2, a3, (uint64_t)&v14, a4, a5);
      if (v5) {
        break;
      }
      ++v12;
      if (v6 == v12) {
        return;
      }
    }
  }
}

uint64_t sub_2309B104C(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (result) {
      unint64_t v4 = v3;
    }
    else {
      unint64_t v4 = 0;
    }
    if (v2 >= v4) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2309B108C(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  unint64_t v7 = a2;
  uint64_t v8 = a1;
  if (*(void *)(*a1 + 16) <= a2)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    uint64_t result = (uint64_t)sub_2309B1C38(v9);
    uint64_t v9 = (void *)result;
    uint64_t *v8 = result;
    goto LABEL_13;
  }
  uint64_t v6 = a5;
  uint64_t v14 = *(void *)(*a1 + 8 * a2 + 32);
  if (*(void *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_23099F300(a3, a4);
    if (v16)
    {
      sub_23099D880(*(void *)(v14 + 56) + 32 * v15, (uint64_t)&v20);
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
  if (!swift_dynamicCast())
  {
    *(void *)&long long v20 = 0;
    *((void *)&v20 + 1) = 0xE000000000000000;
    sub_2309B57C8();
    sub_2309B56F8();
    sub_2309B56F8();
    sub_2309B56F8();
    sub_2309B56F8();
    long long v18 = v20;
    sub_23099D920();
    swift_allocError();
    *(_OWORD *)uint64_t v19 = v18;
    *(unsigned char *)(v19 + 16) = 1;
    return swift_willThrow();
  }
  uint64_t v10 = a6;
  if (!a6)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = a3;
    uint64_t v10 = a4;
  }
  *((void *)&v21 + 1) = sub_2309B5678();
  __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v20);
  swift_bridgeObjectRetain();
  sub_2309B5608();
  uint64_t v9 = (void *)*v8;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v8 = (uint64_t)v9;
  if ((result & 1) == 0) {
    goto LABEL_18;
  }
LABEL_13:
  if (v9[2] > v7) {
    return sub_2309B18B4((uint64_t)&v20, v6, v10);
  }
  __break(1u);
  return result;
}

uint64_t sub_2309B1304(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6)
{
  uint64_t v26 = a6;
  uint64_t v27 = a5;
  uint64_t v30 = a3;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2309B5678();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)a1 + 16) > a2)
  {
    uint64_t v17 = *(void *)(*(void *)a1 + 8 * a2 + 32);
    if (*(void *)(v17 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v18 = sub_23099F300(v30, a4);
      if (v19)
      {
        sub_23099D880(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v28);
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
    int v20 = swift_dynamicCast();
    long long v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    if (v20)
    {
      v21(v12, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
        unint64_t v12 = v26;
        if (!v26)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = v30;
          unint64_t v12 = (char *)a4;
        }
        *((void *)&v29 + 1) = MEMORY[0x263F8D538];
        swift_bridgeObjectRetain();
        sub_2309B5618();
        *(void *)&long long v28 = v22;
        uint64_t v6 = *(void **)a1;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        *(void *)a1 = v6;
        if (result) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
    else
    {
      v21(v12, 1, 1, v13);
    }
    sub_2309A1E94((uint64_t)v12, &qword_268709900);
    *(void *)&long long v28 = 0;
    *((void *)&v28 + 1) = 0xE000000000000000;
    sub_2309B57C8();
    sub_2309B56F8();
    sub_2309B56F8();
    sub_2309B56F8();
    sub_2309B56F8();
    long long v24 = v28;
    sub_23099D920();
    swift_allocError();
    *(_OWORD *)uint64_t v25 = v24;
    *(unsigned char *)(v25 + 16) = 1;
    return swift_willThrow();
  }
  __break(1u);
LABEL_20:
  uint64_t result = (uint64_t)sub_2309B1C38(v6);
  uint64_t v6 = (void *)result;
  *(void *)a1 = result;
LABEL_14:
  if (v6[2] <= a2)
  {
    __break(1u);
  }
  else
  {
    sub_2309B18B4((uint64_t)&v28, v27, (uint64_t)v12);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  return result;
}

uint64_t sub_2309B16C0(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v9 = a2;
    uint64_t v10 = a1;
    if (*(void *)(*a1 + 16) > a2)
    {
      uint64_t v8 = a5;
      uint64_t v7 = a4;
      uint64_t v13 = *(void *)(*a1 + 8 * a2 + 32);
      if (*(void *)(v13 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v14 = sub_23099F300(a3, v7);
        if (v15)
        {
          sub_23099D880(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v21);
        }
        else
        {
          long long v21 = 0u;
          long long v22 = 0u;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        long long v21 = 0u;
        long long v22 = 0u;
      }
      sub_2309B1FB8((uint64_t)&v21, (uint64_t)v23);
      if (a6)
      {
        uint64_t v7 = a6;
      }
      else
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = a3;
      }
      *((void *)&v22 + 1) = MEMORY[0x263F8D6C8];
      sub_2309AF5F0((uint64_t)v23, (uint64_t)v19, &qword_2687098D0);
      if (v20)
      {
        sub_2309B2020();
        swift_bridgeObjectRetain();
        if (swift_dynamicCast())
        {

          uint64_t v16 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_2309A1E94((uint64_t)v19, &qword_2687098D0);
      }
      uint64_t v16 = 0;
LABEL_17:
      *(void *)&long long v21 = v16;
      uint64_t v6 = (void *)*v10;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v10 = (uint64_t)v6;
      if (result) {
        goto LABEL_18;
      }
      goto LABEL_22;
    }
  }
  __break(1u);
LABEL_22:
  uint64_t result = (uint64_t)sub_2309B1C38(v6);
  uint64_t v6 = (void *)result;
  *uint64_t v10 = result;
LABEL_18:
  if (v6[2] <= v9)
  {
    __break(1u);
  }
  else
  {
    sub_2309B18B4((uint64_t)&v21, v8, v7);
    return sub_2309A1E94((uint64_t)v23, &qword_2687098D0);
  }
  return result;
}

uint64_t sub_2309B18B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_2309A9F60((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *unint64_t v3 = 0x8000000000000000;
    sub_2309B2328(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2309A1E94(a1, &qword_2687098D0);
    sub_2309B2060(a2, a3, v9);
    sub_2309A1E94((uint64_t)v9, &qword_2687098D0);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2309B1988(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v10 = a2;
  uint64_t v11 = a1;
  uint64_t v13 = *a1;
  if (*(void *)(*a1 + 16) <= a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    uint64_t result = (uint64_t)sub_2309B1C38(v9);
    unint64_t v9 = (void *)result;
    *uint64_t v11 = result;
    goto LABEL_14;
  }
  uint64_t v8 = a5;
  uint64_t v29 = a7;
  uint64_t v17 = *(void *)(v13 + 8 * a2 + 32);
  if (*(void *)(v17 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_23099F300(a3, a4);
    if (v19)
    {
      sub_23099D880(*(void *)(v17 + 56) + 32 * v18, (uint64_t)&v27);
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
  uint64_t v20 = MEMORY[0x263F8D538];
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    *(void *)&long long v27 = 0;
    *((void *)&v27 + 1) = 0xE000000000000000;
    sub_2309B57C8();
    sub_2309B56F8();
    sub_2309B56F8();
    sub_2309B56F8();
    sub_2309B56F8();
    long long v23 = v27;
    sub_23099D920();
    swift_allocError();
    *(_OWORD *)uint64_t v24 = v23;
    *(unsigned char *)(v24 + 16) = 1;
    return swift_willThrow();
  }
  uint64_t v25 = a6;
  double v12 = v26;
  if (*(unsigned char *)(v8 + 8))
  {
LABEL_16:
    *(double *)uint64_t v8 = v12;
    *(unsigned char *)(v8 + 8) = 0;
    return result;
  }
  double v22 = *(double *)v8;
  uint64_t v7 = v29;
  if (!v29)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = a3;
    uint64_t v7 = a4;
  }
  *((void *)&v28 + 1) = v20;
  *(double *)&long long v27 = v26 - v22;
  unint64_t v9 = (void *)*v11;
  swift_bridgeObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v11 = (uint64_t)v9;
  if ((result & 1) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  if (v9[2] > v10)
  {
    uint64_t result = sub_2309B18B4((uint64_t)&v27, v25, v7);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

void *sub_2309B1C10(void *a1)
{
  return sub_2309B1C4C(0, a1[2], 0, a1);
}

void *sub_2309B1C24(void *a1)
{
  return sub_2309B1D70(0, a1[2], 0, a1);
}

void *sub_2309B1C38(void *a1)
{
  return sub_2309B1E94(0, a1[2], 0, a1);
}

void *sub_2309B1C4C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F8);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098F0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2309B1D70(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709910);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268709A28);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2309B1E94(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098E8);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687098B0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2309B1FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687098D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2309B2020()
{
  unint64_t result = qword_268709A20;
  if (!qword_268709A20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268709A20);
  }
  return result;
}

double sub_2309B2060@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_23099F300(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2309A95AC();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_2309A9F60((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), v14);
    sub_2309B2150(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    sub_2309A9F60(v14, a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_2309B2150(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_2309B57B8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2309B5958();
        swift_bridgeObjectRetain();
        sub_2309B56E8();
        uint64_t v10 = sub_2309B5968();
        double result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          uint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_2309B2328(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_23099F300(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2309A95AC();
      goto LABEL_7;
    }
    sub_2309A9AA4(v15, a4 & 1);
    unint64_t v21 = sub_23099F300(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    double result = (_OWORD *)sub_2309B58E8();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_2309A9F60(a1, v19);
  }
LABEL_13:
  sub_2309B247C(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_2309B247C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  double result = sub_2309A9F60(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

long double sub_2309B24E8(double a1)
{
  if (a1 <= 3.0)
  {
    return sub_2309B258C(a1);
  }
  else
  {
    double v2 = a1 + -1.0;
    long double v3 = v2 * log(a1 + -1.0) - v2;
    return v3 + 0.572364943 + log(v2 * (v2 * 4.0 * (v2 + v2 + 1.0) + 1.0) + 0.0333333333) * 0.166666667;
  }
}

long double sub_2309B258C(double a1)
{
  double v2 = *(double *)&qword_26E537D08
     + 0.0
     + unk_26E537D10 / (a1 + 1.0)
     + *(double *)&qword_26E537D18 / (a1 + 2.0)
     + unk_26E537D20 / (a1 + 3.0)
     + *(double *)&qword_26E537D28 / (a1 + 4.0)
     + unk_26E537D30 / (a1 + 5.0)
     + *(double *)&qword_26E537D38 / (a1 + 6.0);
  long double v3 = (a1 + 0.5) * log(a1 + 5.5) - (a1 + 5.5) + 0.918938533;
  return v3 + log(v2 / a1);
}

uint64_t sub_2309B266C(uint64_t a1, uint64_t a2, char a3)
{
  if (!*(void *)(a1 + 16) || !*(void *)(a2 + 16))
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v32 = 0xD000000000000022;
    *(void *)(v32 + 8) = 0x80000002309B76D0;
    *(unsigned char *)(v32 + 16) = 0;
    return swift_willThrow();
  }
  char v33 = (char *)a1;
  swift_bridgeObjectRetain();
  sub_23099DD28(&v33);
  if (v3) {
    goto LABEL_42;
  }
  unint64_t v6 = v33;
  char v33 = (char *)a2;
  swift_bridgeObjectRetain();
  sub_23099DD28(&v33);
  uint64_t v7 = *((void *)v6 + 2);
  if (!v7 || (uint64_t v8 = *((void *)v33 + 2)) == 0)
  {
LABEL_37:
    swift_release();
    return swift_release();
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  char v11 = v33 + 32;
  double v12 = (double)v8;
  double v13 = (double)v7;
  double v14 = 0.0;
  while (v10 < (unint64_t)v7)
  {
    if (v9 >= (unint64_t)v8) {
      goto LABEL_41;
    }
    double v15 = *(double *)&v6[8 * v10 + 32];
    double v16 = *(double *)&v11[8 * v9];
    if (v16 >= v15) {
      double v17 = *(double *)&v6[8 * v10 + 32];
    }
    else {
      double v17 = *(double *)&v11[8 * v9];
    }
    if (v15 == v17)
    {
      uint64_t v18 = v10;
      while (v7 - 1 != v18)
      {
        uint64_t v10 = v18 + 1;
        double v19 = *(double *)&v6[8 * v18++ + 40];
        if (v19 != v17) {
          goto LABEL_16;
        }
      }
      int v20 = 0;
      if (v16 == v17)
      {
        uint64_t v10 = *((void *)v6 + 2);
LABEL_20:
        if (v8 <= v9 + 1) {
          uint64_t v22 = v9 + 1;
        }
        else {
          uint64_t v22 = *((void *)v33 + 2);
        }
        do
        {
          uint64_t v23 = v9 + 1;
          BOOL v21 = v9 + 1 < v8;
          if (v9 + 1 >= v8)
          {
            uint64_t v9 = v22;
            goto LABEL_28;
          }
          double v24 = *(double *)&v33[8 * v9++ + 40];
        }
        while (v24 == v17);
        uint64_t v9 = v23;
        goto LABEL_28;
      }
      BOOL v21 = 1;
      uint64_t v10 = *((void *)v6 + 2);
    }
    else
    {
LABEL_16:
      int v20 = 1;
      if (v16 == v17) {
        goto LABEL_20;
      }
      BOOL v21 = 1;
    }
LABEL_28:
    double v25 = (double)v10;
    double v26 = (double)v9;
    if (a3)
    {
      double v27 = v25 / v13;
      double v28 = v26 / v12;
      double v29 = v27 - v28;
      double v30 = v28 - v27;
      if (a3 == 1) {
        double v30 = v29;
      }
    }
    else
    {
      double v30 = vabdd_f64(v25 / v13, v26 / v12);
    }
    if (v14 <= v30) {
      double v14 = v30;
    }
    if (!v20 || !v21) {
      goto LABEL_37;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_2309B28A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  BOOL v9 = a1 == 0x6C61696D6F6E6942 && a2 == 0xEC00000074736554;
  if (!v9 && (sub_2309B58C8() & 1) == 0)
  {
    if (a1 == 0x747365545ALL && a2 == 0xE500000000000000 || (sub_2309B58C8() & 1) != 0)
    {
      if (!*(void *)(a3 + 16)) {
        goto LABEL_67;
      }
      unint64_t v18 = sub_23099F300(0x6C65694661746164, 0xE900000000000064);
      if ((v19 & 1) == 0) {
        goto LABEL_67;
      }
      sub_23099D880(*(void *)(a3 + 56) + 32 * v18, (uint64_t)v51);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_67;
      }
      if (!*(void *)(a3 + 16)
        || (unint64_t v20 = sub_23099F300(0x6C656946656D6974, 0xE900000000000064), (v21 & 1) == 0)
        || (sub_23099D880(*(void *)(a3 + 56) + 32 * v20, (uint64_t)v51), (swift_dynamicCast() & 1) == 0))
      {
LABEL_66:
        swift_bridgeObjectRelease();
LABEL_67:
        sub_23099D920();
        swift_allocError();
        uint64_t v38 = "ZTest expects arguments: (dataField, timeField, minimumSampleSize?, significanceLevel)";
        unint64_t v39 = 0xD000000000000056;
        goto LABEL_56;
      }
      if (*(void *)(a3 + 16))
      {
        uint64_t v52 = v49;
        unint64_t v22 = sub_23099F300(0xD000000000000011, 0x80000002309B69E0);
        char v48 = v23;
        if ((v23 & 1) == 0)
        {
          uint64_t v46 = 0;
          goto LABEL_59;
        }
        sub_23099D880(*(void *)(a3 + 56) + 32 * v22, (uint64_t)v51);
        if (swift_dynamicCast())
        {
          uint64_t v46 = (uint64_t)v49;
LABEL_59:
          if (*(void *)(a3 + 16))
          {
            unint64_t v41 = sub_23099F300(0xD000000000000011, 0x80000002309B6EB0);
            if (v42)
            {
              sub_23099D880(*(void *)(a3 + 56) + 32 * v41, (uint64_t)v51);
              if (swift_dynamicCast())
              {
                a5[3] = type metadata accessor for ZTestResult(0);
                a5[4] = (uint64_t)&off_26E5380A8;
                boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a5);
                sub_2309B39C0(a4, (uint64_t)v49, (uint64_t)v50, (uint64_t)v52, (uint64_t)v50, v46, (v48 ^ 1) & 1, (uint64_t)boxed_opaque_existential_0, *(double *)&v49);
                if (v5) {
                  __swift_deallocate_boxed_opaque_existential_1((uint64_t)a5);
                }
                goto LABEL_71;
              }
            }
          }
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_66;
    }
    if ((a1 != 0x74736554534BLL || a2 != 0xE600000000000000) && (sub_2309B58C8() & 1) == 0)
    {
      sub_2309B57C8();
      swift_bridgeObjectRelease();
      strcpy((char *)v51, "Unknown test: ");
      HIBYTE(v51[1]) = -18;
      swift_bridgeObjectRetain();
      sub_2309B56F8();
      swift_bridgeObjectRelease();
      uint64_t v31 = v51[1];
      sub_23099D920();
      swift_allocError();
      *(void *)uint64_t v32 = v51[0];
      *(void *)(v32 + 8) = v31;
LABEL_57:
      *(unsigned char *)(v32 + 16) = 0;
      return swift_willThrow();
    }
    if (*(void *)(a3 + 16))
    {
      unint64_t v24 = sub_23099F300(0x6C65694661746164, 0xE900000000000064);
      if (v25)
      {
        sub_23099D880(*(void *)(a3 + 56) + 32 * v24, (uint64_t)v51);
        if (swift_dynamicCast())
        {
          if (*(void *)(a3 + 16))
          {
            unint64_t v26 = sub_23099F300(0x6C656946656D6974, 0xE900000000000064);
            if (v27)
            {
              sub_23099D880(*(void *)(a3 + 56) + 32 * v26, (uint64_t)v51);
              if (swift_dynamicCast())
              {
                if (!*(void *)(a3 + 16)
                  || (unint64_t v28 = sub_23099F300(0xD000000000000011, 0x80000002309B69E0), (v29 & 1) == 0))
                {
                  int v30 = 1;
LABEL_69:
                  a5[3] = type metadata accessor for KSTestTwoSampleResult(0);
                  a5[4] = (uint64_t)&off_26E5380D8;
                  uint64_t v44 = __swift_allocate_boxed_opaque_existential_0(a5);
                  sub_2309B4504(a4, (uint64_t)v49, (uint64_t)v50, (uint64_t)v49, (uint64_t)v50, v30, (uint64_t)v44);
                  if (v5) {
                    __swift_deallocate_boxed_opaque_existential_1((uint64_t)a5);
                  }
                  goto LABEL_71;
                }
                sub_23099D880(*(void *)(a3 + 56) + 32 * v28, (uint64_t)v51);
                if (swift_dynamicCast())
                {
                  int v30 = 0;
                  goto LABEL_69;
                }
                swift_bridgeObjectRelease();
              }
            }
          }
          swift_bridgeObjectRelease();
        }
      }
    }
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v32 = 0xD000000000000039;
    *(void *)(v32 + 8) = 0x80000002309B7430;
    goto LABEL_57;
  }
  if (!*(void *)(a3 + 16)) {
    goto LABEL_55;
  }
  unint64_t v12 = sub_23099F300(0x6C65694661746164, 0xE900000000000064);
  if ((v13 & 1) == 0) {
    goto LABEL_55;
  }
  sub_23099D880(*(void *)(a3 + 56) + 32 * v12, (uint64_t)v51);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_55;
  }
  if (!*(void *)(a3 + 16)
    || (unint64_t v14 = sub_23099F300(0x6C656946656D6974, 0xE900000000000064), (v15 & 1) == 0)
    || (sub_23099D880(*(void *)(a3 + 56) + 32 * v14, (uint64_t)v51), (swift_dynamicCast() & 1) == 0))
  {
LABEL_54:
    swift_bridgeObjectRelease();
LABEL_55:
    sub_23099D920();
    swift_allocError();
    uint64_t v38 = "BinomialTest expects arguments: (dataField, timeField, minimumSampleSize?, significanceLevel, pHypothesis)";
    unint64_t v39 = 0xD00000000000006ALL;
LABEL_56:
    *(void *)uint64_t v32 = v39;
    *(void *)(v32 + 8) = (unint64_t)(v38 - 32) | 0x8000000000000000;
    goto LABEL_57;
  }
  if (!*(void *)(a3 + 16)) {
    goto LABEL_53;
  }
  uint64_t v52 = v49;
  unint64_t v16 = sub_23099F300(0xD000000000000011, 0x80000002309B69E0);
  char v47 = v17;
  if ((v17 & 1) == 0)
  {
    uint64_t v45 = 0;
    goto LABEL_44;
  }
  sub_23099D880(*(void *)(a3 + 56) + 32 * v16, (uint64_t)v51);
  if (!swift_dynamicCast())
  {
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  uint64_t v45 = (uint64_t)v49;
LABEL_44:
  if (!*(void *)(a3 + 16)) {
    goto LABEL_53;
  }
  unint64_t v33 = sub_23099F300(0xD000000000000011, 0x80000002309B6EB0);
  if ((v34 & 1) == 0) {
    goto LABEL_53;
  }
  sub_23099D880(*(void *)(a3 + 56) + 32 * v33, (uint64_t)v51);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_53;
  }
  if (!*(void *)(a3 + 16)) {
    goto LABEL_53;
  }
  unint64_t v35 = sub_23099F300(0x6568746F70794870, 0xEB00000000736973);
  if ((v36 & 1) == 0) {
    goto LABEL_53;
  }
  sub_23099D880(*(void *)(a3 + 56) + 32 * v35, (uint64_t)v51);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_53;
  }
  a5[3] = type metadata accessor for BinomialTestResult(0);
  a5[4] = (uint64_t)&off_26E538078;
  long long v37 = __swift_allocate_boxed_opaque_existential_0(a5);
  sub_2309B3184(a4, v49, v50, (uint64_t)v52, (uint64_t)v50, v45, (v47 ^ 1) & 1, (char *)v37, *(double *)&v49, *(long double *)&v49);
  if (v5) {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)a5);
  }
LABEL_71:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2309B3184@<X0>(uint64_t a1@<X0>, void (*a2)(char *, void, uint64_t, uint64_t)@<X2>, void (*a3)(char *, char *, uint64_t)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, char a7@<W7>, char *a8@<X8>, double a9@<D0>, long double a10@<D1>)
{
  uint64_t v11 = v10;
  uint64_t v86 = a2;
  uint64_t v87 = a3;
  uint64_t v85 = a8;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  char v23 = (char *)&v78 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  unint64_t v26 = (char *)&v78 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  char v29 = (char *)&v78 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  MEMORY[0x270FA5388](v30);
  if ((a7 & 1) == 0 && a6 <= 0)
  {
    sub_23099D920();
    swift_allocError();
    char v36 = "minimumSampleSize should be in range (0, Int.max)";
    unint64_t v37 = 0xD000000000000031;
LABEL_11:
    char v43 = (char *)(v36 - 32);
LABEL_12:
    *(void *)uint64_t v35 = v37;
    *(void *)(v35 + 8) = (unint64_t)v43 | 0x8000000000000000;
    *(unsigned char *)(v35 + 16) = 0;
    return swift_willThrow();
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    sub_23099D920();
    swift_allocError();
    char v36 = "significanceLevel was not within the range [0.0, 1.0]";
    unint64_t v37 = 0xD000000000000035;
    goto LABEL_11;
  }
  if (a10 < 0.0 || a10 > 1.0)
  {
    sub_23099D920();
    swift_allocError();
    unint64_t v37 = 0xD00000000000002FLL;
    char v43 = "ata field to Equatable";
    goto LABEL_12;
  }
  uint64_t v79 = v34;
  uint64_t v81 = v33;
  uint64_t v82 = (uint64_t)&v78 - v32;
  uint64_t v38 = *(void *)(a1 + 16);
  if (v38)
  {
    unint64_t v39 = (uint64_t *)(a1 + 32 * v38);
    uint64_t v40 = v39[1];
    uint64_t v83 = *v39;
    uint64_t v84 = v40;
    uint64_t v41 = v39[2];
    unint64_t v42 = v39[3];
    swift_unknownObjectRetain();
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v83 = MEMORY[0x263F8EE78];
    uint64_t v84 = MEMORY[0x263F8EE78] + 32;
    unint64_t v42 = 1;
  }
  uint64_t v80 = v41;
  uint64_t v45 = sub_2309B4E7C((uint64_t)v29, (uint64_t)v26, v31, v84, v41, v42, a4, a5);
  if (v11) {
    return swift_unknownObjectRelease();
  }
  uint64_t v78 = v45;
  sub_2309B5578((uint64_t)v29, v82, &qword_268709900);
  sub_2309B5578((uint64_t)v26, v81, &qword_268709900);
  uint64_t v88 = 1;
  uint64_t v46 = (uint64_t)v87;
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_2309B52CC(v84, v80, v42, (uint64_t)v86, v46);
  swift_bridgeObjectRelease();
  uint64_t v49 = sub_2309AB9B8(v48);
  uint64_t v50 = swift_bridgeObjectRelease();
  if (!v49)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v54 = 0xD000000000000026;
    *(void *)(v54 + 8) = 0x80000002309B7540;
    *(unsigned char *)(v54 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_2309B5500(v81);
    uint64_t v47 = v82;
    return sub_2309B5500(v47);
  }
  MEMORY[0x270FA5388](v50);
  *(&v78 - 2) = (uint64_t)&v88;
  unint64_t v51 = *(void *)(sub_2309B5130((uint64_t)sub_2309B5560, (uint64_t)(&v78 - 4), v49) + 16);
  swift_bridgeObjectRelease();
  if ((a7 & 1) == 0)
  {
    uint64_t v52 = v78;
    if (v78 >= a6) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v55 = (int *)type metadata accessor for BinomialTestResult(0);
    uint64_t v56 = v85;
    uint64_t v57 = v82;
    sub_2309A20D8(v82, (uint64_t)&v85[v55[12]]);
    uint64_t v58 = v81;
    sub_2309A20D8(v81, (uint64_t)&v56[v55[13]]);
    strcpy(v56, "BinomialTest");
    v56[13] = 0;
    *((_WORD *)v56 + 7) = -5120;
    v56[17] = 1;
    *(void *)&v56[v55[10]] = v52;
    *(void *)&v56[v55[11]] = v51;
    uint64_t v59 = &v56[v55[7]];
    uint64_t v60 = sub_2309B5678();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 1, 1, v60);
    swift_unknownObjectRelease();
    v56[16] = 0;
    int v61 = &v56[v55[8]];
    *(void *)int v61 = 0;
    v61[8] = 1;
    id v62 = &v56[v55[9]];
LABEL_27:
    *id v62 = 2;
    sub_2309B5500(v58);
    uint64_t v47 = v57;
    return sub_2309B5500(v47);
  }
  uint64_t v52 = v78;
  if (v78 < 1) {
    goto LABEL_23;
  }
LABEL_20:
  sub_23099F9A4(v52, v51, 0, a10);
  double v63 = v53;
  sub_2309A20D8(v82, (uint64_t)v23);
  uint64_t v64 = sub_2309B5678();
  uint64_t v65 = *(void **)(v64 - 8);
  id v66 = (uint64_t (*)(char *, uint64_t, uint64_t))v65[6];
  uint64_t result = v66(v23, 1, v64);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v67 = v79;
    sub_2309A20D8(v81, v79);
    uint64_t result = v66((char *)v67, 1, v64);
    if (result != 1)
    {
      uint64_t v68 = v85;
      *(void *)uint64_t v85 = 0x6C61696D6F6E6942;
      v68[1] = 0xEC00000074736554;
      int v69 = (int *)type metadata accessor for BinomialTestResult(0);
      int v70 = (double *)((char *)v68 + v69[8]);
      *int v70 = v63;
      *((unsigned char *)v70 + 8) = 0;
      *((unsigned char *)v68 + v69[9]) = v63 < a9;
      *(void *)((char *)v68 + v69[10]) = v78;
      *(void *)((char *)v68 + v69[11]) = v51;
      uint64_t v71 = (char *)v68 + v69[12];
      uint64_t v87 = (void (*)(char *, char *, uint64_t))v65[4];
      v87(v71, v23, v64);
      uint64_t v86 = (void (*)(char *, void, uint64_t, uint64_t))v65[7];
      v86(v71, 0, 1, v64);
      int v72 = (char *)v68 + v69[13];
      char v73 = (void (*)(char *, uint64_t, uint64_t))v65[2];
      uint64_t v74 = v79;
      v73(v72, v79, v64);
      int v75 = v72;
      uint64_t v76 = v86;
      v86(v75, 0, 1, v64);
      int v77 = (char *)v68 + v69[7];
      v87(v77, (char *)v74, v64);
      v76(v77, 0, 1, v64);
      swift_unknownObjectRelease();
      *((unsigned char *)v68 + 16) = 1;
      id v62 = (char *)v68 + 17;
      uint64_t v58 = v81;
      uint64_t v57 = v82;
      goto LABEL_27;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2309B39C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, char a7@<W7>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v10 = v9;
  uint64_t v121 = a4;
  uint64_t v122 = a5;
  uint64_t v119 = a2;
  uint64_t v120 = a3;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388]((char *)&v102 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = (char *)&v102 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v102 - v24;
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v102 - v27;
  uint64_t v29 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = MEMORY[0x270FA5388](v29);
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v102 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  char v36 = (char *)&v102 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v38 = MEMORY[0x270FA5388](v37);
  if ((a7 & 1) == 0 && a6 <= 0)
  {
    sub_23099D920();
    swift_allocError();
    uint64_t v46 = "minimumSampleSize should be in range (0, Int.max)";
    unint64_t v47 = 0xD000000000000031;
LABEL_10:
    *(void *)uint64_t v45 = v47;
    *(void *)(v45 + 8) = (unint64_t)(v46 - 32) | 0x8000000000000000;
    *(unsigned char *)(v45 + 16) = 0;
    return swift_willThrow();
  }
  if (a9 < 0.0 || a9 > 1.0)
  {
    sub_23099D920();
    swift_allocError();
    uint64_t v46 = "significanceLevel was not within the range [0.0, 1.0]";
    unint64_t v47 = 0xD000000000000035;
    goto LABEL_10;
  }
  uint64_t v110 = v43;
  uint64_t v111 = a6;
  uint64_t v105 = v40;
  uint64_t v106 = v39;
  uint64_t v104 = v38;
  uint64_t v107 = v20;
  uint64_t v108 = a8;
  uint64_t v109 = v44;
  uint64_t v112 = v42;
  uint64_t v113 = (uint64_t)&v102 - v41;
  unint64_t v48 = *(void *)(a1 + 16);
  uint64_t v49 = MEMORY[0x263F8EE78];
  uint64_t v50 = MEMORY[0x263F8EE78] + 32;
  if (v48)
  {
    uint64_t v51 = a1 + 32 + 32 * v48;
    uint64_t v52 = *(void *)(a1 + 32 * v48);
    uint64_t v53 = *(void *)(v51 - 24);
    uint64_t v117 = *(void *)(v51 - 16);
    uint64_t v118 = v53;
    unint64_t v54 = *(void *)(v51 - 8);
    uint64_t v115 = v52;
    unint64_t v116 = v54;
    swift_unknownObjectRetain();
    if (v48 == 1)
    {
      uint64_t v55 = 0;
      uint64_t v49 = MEMORY[0x263F8EE78];
    }
    else
    {
      uint64_t v50 = *(void *)(v51 - 56);
      uint64_t v55 = *(void *)(v51 - 48);
      unint64_t v48 = *(void *)(v51 - 40);
      uint64_t v49 = *(void *)(v51 - 64);
      swift_unknownObjectRetain();
    }
    uint64_t v58 = v116;
    uint64_t v57 = v117;
    uint64_t v59 = v118;
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v55 = 0;
    uint64_t v58 = 1;
    uint64_t v59 = MEMORY[0x263F8EE78] + 32;
    uint64_t v115 = MEMORY[0x263F8EE78];
    unint64_t v48 = 1;
  }
  unint64_t v116 = v58;
  uint64_t v117 = v57;
  uint64_t v118 = v59;
  if (a7)
  {
    uint64_t v114 = v49;
  }
  else
  {
    uint64_t v114 = sub_2309B50D8(v111, v49, v50, v55, v48);
    uint64_t v50 = v60;
    uint64_t v55 = v40;
    unint64_t v48 = v61;
  }
  uint64_t v62 = sub_2309B4E7C((uint64_t)v36, (uint64_t)v33, v40, v50, v55, v48, v121, v122);
  if (v10)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  uint64_t v103 = v62;
  sub_2309B5578((uint64_t)v36, v113, &qword_268709900);
  sub_2309B5578((uint64_t)v33, v112, &qword_268709900);
  uint64_t v123 = 1;
  uint64_t v63 = v120;
  swift_bridgeObjectRetain();
  uint64_t v64 = v55;
  uint64_t v65 = v119;
  uint64_t v68 = sub_2309B52CC(v50, v64, v48, v119, v63);
  swift_bridgeObjectRelease();
  uint64_t v69 = sub_2309AB9B8(v68);
  uint64_t v70 = swift_bridgeObjectRelease();
  if (!v69)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v74 = 0xD000000000000026;
    *(void *)(v74 + 8) = 0x80000002309B7540;
    *(unsigned char *)(v74 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v66 = v113;
LABEL_20:
    uint64_t v67 = v112;
LABEL_21:
    sub_2309B5500(v67);
    return sub_2309B5500(v66);
  }
  MEMORY[0x270FA5388](v70);
  v101 = &v123;
  uint64_t v102 = *(void *)(sub_2309B5130((uint64_t)sub_2309B55DC, (uint64_t)(&v102 - 4), v69) + 16);
  swift_bridgeObjectRelease();
  uint64_t v71 = v117;
  unint64_t v72 = v116;
  uint64_t v122 = sub_2309B4E7C((uint64_t)v28, (uint64_t)v25, v73, v118, v117, v116, v121, v122);
  sub_2309B5578((uint64_t)v28, v110, &qword_268709900);
  sub_2309B5578((uint64_t)v25, v109, &qword_268709900);
  uint64_t v123 = 1;
  swift_bridgeObjectRetain();
  uint64_t v75 = sub_2309B52CC(v118, v71, v72, v65, v63);
  swift_bridgeObjectRelease();
  uint64_t v76 = sub_2309AB9B8(v75);
  uint64_t v77 = swift_bridgeObjectRelease();
  uint64_t v66 = v113;
  if (!v76)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v81 = 0xD000000000000026;
    *(void *)(v81 + 8) = 0x80000002309B7540;
    *(unsigned char *)(v81 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_2309B5500(v109);
    sub_2309B5500(v110);
    goto LABEL_20;
  }
  MEMORY[0x270FA5388](v77);
  v101 = &v123;
  uint64_t v78 = *(void *)(sub_2309B5130((uint64_t)sub_2309B55DC, (uint64_t)(&v102 - 4), v76) + 16);
  swift_bridgeObjectRelease();
  if (a7)
  {
    uint64_t v79 = v122;
    uint64_t v80 = v103;
    if (v122 < 1 || v103 < 1)
    {
LABEL_34:
      uint64_t v84 = (int *)type metadata accessor for ZTestResult(0);
      uint64_t v85 = v108;
      sub_2309A20D8(v66, v108 + v84[12]);
      uint64_t v86 = v112;
      sub_2309A20D8(v112, v85 + v84[13]);
      uint64_t v87 = v110;
      sub_2309A20D8(v110, v85 + v84[16]);
      uint64_t v88 = v109;
      sub_2309A20D8(v109, v85 + v84[17]);
      *(void *)uint64_t v85 = 0x747365545ALL;
      *(void *)(v85 + 8) = 0xE500000000000000;
      *(unsigned char *)(v85 + 17) = 1;
      *(void *)(v85 + v84[10]) = v80;
      *(void *)(v85 + v84[11]) = v102;
      *(void *)(v85 + v84[14]) = v122;
      *(void *)(v85 + v84[15]) = v78;
      uint64_t v89 = v85 + v84[7];
      uint64_t v90 = sub_2309B5678();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 56))(v89, 1, 1, v90);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *(unsigned char *)(v85 + 16) = 0;
      uint64_t v91 = v85 + v84[8];
      *(void *)uint64_t v91 = 0;
      *(unsigned char *)(v91 + 8) = 1;
      uint64_t v92 = v88;
      *(unsigned char *)(v85 + v84[9]) = 2;
LABEL_40:
      sub_2309B5500(v92);
      sub_2309B5500(v87);
      uint64_t v67 = v86;
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v79 = v122;
    uint64_t v80 = v103;
    if (v122 < v111 || v103 < v111) {
      goto LABEL_34;
    }
  }
  sub_2309AF710(v102, v80, v78, v79, 1, 0, 0, a9);
  double v93 = v82;
  double v94 = v83;
  uint64_t v95 = v105;
  sub_2309A20D8(v66, v105);
  uint64_t v96 = sub_2309B5678();
  uint64_t v97 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 48);
  uint64_t result = v97(v95, 1, v96);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v98 = v106;
  sub_2309A20D8(v112, v106);
  uint64_t result = v97(v98, 1, v96);
  if (result == 1)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v99 = (uint64_t)v107;
  sub_2309A20D8(v110, (uint64_t)v107);
  uint64_t result = v97(v99, 1, v96);
  if (result == 1)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v100 = v104;
  sub_2309A20D8(v109, v104);
  uint64_t result = v97(v100, 1, v96);
  if (result != 1)
  {
    sub_2309A35C4(fabs(v94) < fabs(v93), v103, v102, v105, v106, v122, v78, (uint64_t)v107, v108, v93, v100);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v86 = v112;
    uint64_t v66 = v113;
    uint64_t v92 = v109;
    uint64_t v87 = v110;
    goto LABEL_40;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_2309B4504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v110 = a4;
  uint64_t v107 = a2;
  uint64_t v108 = a3;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = MEMORY[0x270FA5388]((char *)&v87 - v15);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v87 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  uint64_t v27 = (char *)&v87 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = MEMORY[0x270FA5388](v28);
  if ((a6 & 1) == 0 && v32 <= 0)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v39 = 0xD000000000000034;
    *(void *)(v39 + 8) = 0x80000002309B7690;
    *(unsigned char *)(v39 + 16) = 0;
    return swift_willThrow();
  }
  uint64_t v100 = v34;
  uint64_t v101 = v33;
  uint64_t v94 = v29;
  uint64_t v95 = v32;
  uint64_t v92 = v31;
  uint64_t v93 = v30;
  uint64_t v91 = v14;
  uint64_t v96 = a7;
  uint64_t v98 = v38;
  uint64_t v99 = v37;
  uint64_t v104 = v36;
  uint64_t v105 = (uint64_t)&v87 - v35;
  uint64_t v41 = *(void *)(a1 + 16);
  uint64_t v42 = MEMORY[0x263F8EE78] + 32;
  uint64_t v109 = MEMORY[0x263F8EE78];
  int v97 = a6;
  uint64_t v106 = MEMORY[0x263F8EE78] + 32;
  if (!v41)
  {
    uint64_t v45 = 0;
    uint64_t v102 = 0;
    unint64_t v46 = 1;
    uint64_t v44 = MEMORY[0x263F8EE78];
    goto LABEL_8;
  }
  uint64_t v43 = a1 + 32 + 32 * v41;
  uint64_t v44 = *(void *)(a1 + 32 * v41);
  uint64_t v42 = *(void *)(v43 - 24);
  uint64_t v45 = *(void *)(v43 - 16);
  unint64_t v46 = *(void *)(v43 - 8);
  swift_unknownObjectRetain();
  if (v41 == 1)
  {
    uint64_t v102 = 0;
LABEL_8:
    unint64_t v103 = 1;
    goto LABEL_10;
  }
  uint64_t v47 = *(void *)(v43 - 64);
  uint64_t v106 = *(void *)(v43 - 56);
  unint64_t v48 = *(void *)(v43 - 40);
  uint64_t v102 = *(void *)(v43 - 48);
  unint64_t v103 = v48;
  uint64_t v109 = v47;
  swift_unknownObjectRetain();
LABEL_10:
  uint64_t v49 = v110;
  uint64_t v50 = v111;
  uint64_t v51 = sub_2309B4E7C((uint64_t)v27, (uint64_t)v24, v31, v42, v45, v46, v110, a5);
  if (v50)
  {
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  uint64_t v88 = v42;
  unint64_t v89 = v46;
  uint64_t v90 = v45;
  uint64_t v110 = v51;
  uint64_t v111 = v44;
  sub_2309B5578((uint64_t)v27, v105, &qword_268709900);
  sub_2309B5578((uint64_t)v24, v104, &qword_268709900);
  uint64_t v52 = v100;
  uint64_t v53 = v101;
  uint64_t v54 = v102;
  uint64_t v56 = sub_2309B4E7C(v100, v101, v55, v106, v102, v103, v49, a5);
  sub_2309B5578(v52, v99, &qword_268709900);
  sub_2309B5578(v53, v98, &qword_268709900);
  if (v97)
  {
    uint64_t v57 = v110;
    BOOL v58 = v110 < 1 || v56 < 1;
    unint64_t v59 = v103;
    if (!v58) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v63 = (int *)type metadata accessor for KSTestTwoSampleResult(0);
    uint64_t v64 = v96;
    uint64_t v65 = v99;
    sub_2309A20D8(v99, v96 + v63[10]);
    uint64_t v66 = v98;
    sub_2309A20D8(v98, v64 + v63[11]);
    uint64_t v67 = v105;
    sub_2309A20D8(v105, v64 + v63[13]);
    uint64_t v68 = v104;
    sub_2309A20D8(v104, v64 + v63[14]);
    *(void *)uint64_t v64 = 0x775474736554534BLL;
    *(void *)(v64 + 8) = 0xEF656C706D61536FLL;
    *(unsigned char *)(v64 + 17) = 1;
    *(void *)(v64 + v63[9]) = v56;
    *(void *)(v64 + v63[12]) = v57;
    uint64_t v69 = v64 + v63[7];
    uint64_t v70 = sub_2309B5678();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v69, 1, 1, v70);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v71 = v66;
    *(unsigned char *)(v64 + 16) = 0;
    uint64_t v72 = v64 + v63[8];
    *(void *)uint64_t v72 = 0;
    *(unsigned char *)(v72 + 8) = 1;
LABEL_24:
    sub_2309B5500(v71);
    sub_2309B5500(v65);
    sub_2309B5500(v68);
    uint64_t v73 = v67;
    return sub_2309B5500(v73);
  }
  uint64_t v57 = v110;
  BOOL v62 = v110 < v95 || v56 < v95;
  unint64_t v59 = v103;
  if (v62) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v60 = v108;
  swift_bridgeObjectRetain();
  uint64_t v61 = v107;
  uint64_t v74 = sub_2309B52CC(v88, v90, v89, v107, v60);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v75 = sub_2309B52CC(v106, v54, v59, v61, v60);
  swift_bridgeObjectRelease();
  uint64_t v76 = sub_2309ABB00(v74);
  swift_bridgeObjectRelease();
  if (!v76 || (uint64_t v77 = sub_2309ABB00(v75), swift_bridgeObjectRelease(), !v77))
  {
    swift_bridgeObjectRelease();
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v79 = 0xD00000000000001DLL;
    *(void *)(v79 + 8) = 0x80000002309B7670;
    *(unsigned char *)(v79 + 16) = 1;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    sub_2309B5500(v98);
    sub_2309B5500(v99);
    sub_2309B5500(v104);
    uint64_t v73 = v105;
    return sub_2309B5500(v73);
  }
  sub_2309B266C(v77, v76, 0);
  double v80 = v78;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v81 = v92;
  sub_2309A20D8(v99, v92);
  uint64_t v82 = sub_2309B5678();
  double v83 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 48);
  uint64_t result = v83(v81, 1, v82);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v84 = v93;
  sub_2309A20D8(v98, v93);
  uint64_t result = v83(v84, 1, v82);
  if (result == 1)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v85 = v94;
  sub_2309A20D8(v105, v94);
  uint64_t result = v83(v85, 1, v82);
  if (result == 1)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v86 = (uint64_t)v91;
  sub_2309A20D8(v104, (uint64_t)v91);
  uint64_t result = v83(v86, 1, v82);
  if (result != 1)
  {
    sub_2309A3834(v56, v92, v93, v110, v94, v86, v96, v80);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    uint64_t v68 = v104;
    uint64_t v67 = v105;
    uint64_t v71 = v98;
    uint64_t v65 = v99;
    goto LABEL_24;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2309B4E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_2309B52CC(a4, a5, a6, a7, a8);
  swift_bridgeObjectRelease();
  if (v8) {
    return v16;
  }
  uint64_t v18 = sub_2309AB6D4(v16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!v18)
  {
    sub_23099D920();
    swift_allocError();
    *(void *)uint64_t v25 = 0xD000000000000021;
    *(void *)(v25 + 8) = 0x80000002309B7640;
    *(unsigned char *)(v25 + 16) = 1;
    swift_willThrow();
    return v16;
  }
  uint64_t v16 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
    __break(1u);
  }
  else
  {
    unint64_t v19 = *(void *)(v18 + 16);
    uint64_t v20 = sub_2309B5678();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = v21;
    if (!v19)
    {
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
      v26(a1, 1, 1, v20);
      v26(a2, 1, 1, v20);
      swift_bridgeObjectRelease();
      return v16;
    }
    unint64_t v27 = v18 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
    uint64_t v28 = *(void (**)(uint64_t))(v21 + 16);
    v28(a1);
    uint64_t v23 = a1;
    uint64_t v24 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56);
    uint64_t result = v24(v23, 0, 1, v20);
    if (v19 <= *(void *)(v18 + 16))
    {
      ((void (*)(uint64_t, unint64_t, uint64_t))v28)(a2, v27 + *(void *)(v22 + 72) * (v19 - 1), v20);
      v24(a2, 0, 1, v20);
      swift_bridgeObjectRelease();
      return v16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2309B50D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  int64_t v5 = a5 >> 1;
  uint64_t v6 = a4 - (a5 >> 1);
  if (__OFSUB__(a4, a5 >> 1))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v6 > -result && v6 < 1) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = v5 - result;
  }
  if (v5 < v8) {
    goto LABEL_14;
  }
  if (v8 >= a4) {
    return a2;
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_2309B5130(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  if (v5)
  {
    uint64_t v6 = (uint64_t (*)(uint64_t *))result;
    unint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x263F8EE78];
    uint64_t v12 = (uint64_t (*)(uint64_t *))result;
    while (v7 < *(void *)(a3 + 16))
    {
      uint64_t v11 = *(void *)(a3 + 8 * v7 + 32);
      uint64_t v13 = v11;
      uint64_t result = v6(&v13);
      if (v3)
      {
        swift_release();
        goto LABEL_14;
      }
      if (result)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v14 = v8;
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_2309AE9E4(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v14;
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          uint64_t result = (uint64_t)sub_2309AE9E4((char *)(v9 > 1), v10 + 1, 1);
          uint64_t v8 = v14;
        }
        *(void *)(v8 + 16) = v10 + 1;
        *(void *)(v8 + 8 * v10 + 32) = v11;
        uint64_t v6 = v12;
      }
      if (v5 == ++v7) {
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
LABEL_14:
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x230FC3D40);
  }
  return result;
}

uint64_t sub_2309B52CC(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  int64_t v22 = a3 >> 1;
  uint64_t v5 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v6 = MEMORY[0x263F8EE78];
  if (!v5) {
    return v6;
  }
  uint64_t v9 = result;
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t result = (uint64_t)sub_2309AE9A4(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v6 = v26;
    uint64_t v21 = v9 + 8 * a2;
    while (1)
    {
      uint64_t v11 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        break;
      }
      if (a2 + v10 >= v22 || v10 >= v5) {
        goto LABEL_23;
      }
      uint64_t v12 = *(void *)(v21 + 8 * v10);
      uint64_t v13 = *(void *)(v12 + 16);
      swift_bridgeObjectRetain();
      if (!v13
        || (swift_bridgeObjectRetain(), sub_23099F300(a4, a5), char v15 = v14, swift_bridgeObjectRelease(), (v15 & 1) == 0))
      {
        sub_23099D920();
        swift_allocError();
        *(void *)uint64_t v20 = 0xD000000000000017;
        *(void *)(v20 + 8) = 0x80000002309B7620;
        *(unsigned char *)(v20 + 16) = 1;
        swift_willThrow();
        swift_release();
        swift_bridgeObjectRelease();
        return v6;
      }
      if (*(void *)(v12 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v16 = sub_23099F300(a4, a5);
        if (v17)
        {
          sub_23099D880(*(void *)(v12 + 56) + 32 * v16, (uint64_t)&v24);
        }
        else
        {
          long long v24 = 0u;
          long long v25 = 0u;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        long long v24 = 0u;
        long long v25 = 0u;
      }
      swift_bridgeObjectRelease();
      uint64_t v26 = v6;
      unint64_t v19 = *(void *)(v6 + 16);
      unint64_t v18 = *(void *)(v6 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_2309AE9A4((void *)(v18 > 1), v19 + 1, 1);
        uint64_t v6 = v26;
      }
      *(void *)(v6 + 16) = v19 + 1;
      uint64_t result = sub_2309B5578((uint64_t)&v24, v6 + 32 * v19 + 32, &qword_2687098D0);
      ++v10;
      if (v11 == v5) {
        return v6;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2309B5500(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL sub_2309B5560(void *a1)
{
  return *a1 == **(void **)(v1 + 16);
}

uint64_t sub_2309B5578(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

BOOL sub_2309B55DC(void *a1)
{
  return sub_2309B5560(a1);
}

uint64_t sub_2309B55F8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2309B5608()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_2309B5618()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_2309B5628()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2309B5638()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2309B5648()
{
  return MEMORY[0x270EF09C0]();
}

uint64_t sub_2309B5658()
{
  return MEMORY[0x270EF0BA0]();
}

uint64_t sub_2309B5668()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2309B5678()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2309B5688()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_2309B5698()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2309B56A8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2309B56B8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2309B56C8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2309B56D8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2309B56E8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2309B56F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2309B5708()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2309B5718()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2309B5728()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2309B5738()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2309B5748()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2309B5758()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2309B5768()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_2309B5778()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_2309B5788()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2309B5798()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_2309B57A8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2309B57B8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2309B57C8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2309B57D8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2309B57E8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2309B57F8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2309B5808()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2309B5818()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2309B5828()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2309B5838()
{
  return MEMORY[0x270F9ED40]();
}

uint64_t sub_2309B5848()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2309B5858()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2309B5868()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2309B5878()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2309B5888()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2309B5898()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2309B58A8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2309B58B8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2309B58C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2309B58D8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2309B58E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2309B58F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2309B5908()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2309B5918()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2309B5928()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2309B5938()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2309B5948()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2309B5958()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2309B5968()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2309B5978()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_2309B5988()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_2309B5998()
{
  return MEMORY[0x270F9FCD8]();
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void bzero(void *a1, size_t a2)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}