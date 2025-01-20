uint64_t sub_3BE384(uint64_t a1)
{
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_3BE3BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for SizeClassProxy(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && a1[24]) {
    return (*(_DWORD *)a1 + 249);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 8;
  int v5 = v3 - 8;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SizeClassProxy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)result = a2 + 7;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeClassProxy()
{
  return &type metadata for SizeClassProxy;
}

uint64_t sub_3BE49C()
{
  swift_release();

  return swift_release();
}

uint64_t sub_3BE4D8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_3BE52C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_3BE5A4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v4;
  swift_release();
  return a1;
}

uint64_t sub_3BE5FC(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_3BE644(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)result = a2 ^ 0x80000000;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for SizeClassReader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_3BE6A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_3BE7E4(uint64_t a1)
{
  return a1;
}

uint64_t JSONContext.withActionKinds()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_4BC058);
  uint64_t v19 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  unint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_3D6FC0();
  uint64_t v3 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  int v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_4BAD18);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_3D6CE0();
  uint64_t v10 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = sub_2C9FBC();
  v22 = &type metadata for ActionKinds;
  unint64_t v23 = v13;
  sub_3D6C90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_4BADB0);
  sub_3D6C50();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_3D6FD0();
  sub_3D6C70();
  uint64_t v14 = v18;
  sub_3D6C50();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v2, v21);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v17);
}

uint64_t JSONContext.withIntentKinds()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_4B4760);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_3D6FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_175D20();
  sub_3D6FF0();
  sub_3D6C80();
  sub_3D6C50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ShowInformation._id.getter()
{
  return 0x6F666E49776F6853;
}

uint64_t ShowInformation.impressionMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ShowInformation() + 20);

  return sub_2A6C0(v3, a1);
}

uint64_t type metadata accessor for ShowInformation()
{
  uint64_t result = qword_4C1BE8;
  if (!qword_4C1BE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ShowInformation.description.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ShowInformation() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShowInformation.rating.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ShowInformation() + 28));
}

uint64_t ShowInformation.ratingCount.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ShowInformation() + 32));
}

uint64_t ShowInformation.genreName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ShowInformation() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShowInformation.contentRating.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ShowInformation() + 40));
}

uint64_t ShowInformation.copyright.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ShowInformation() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_3BEEA8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x7470697263736564;
      break;
    case 3:
      unint64_t result = 0x676E69746172;
      break;
    case 4:
      unint64_t result = 0x6F43676E69746172;
      break;
    case 5:
      unint64_t result = 0x6D614E65726E6567;
      break;
    case 6:
      unint64_t result = 0x52746E65746E6F63;
      break;
    case 7:
      unint64_t result = 0x6867697279706F63;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_3BEFD4()
{
  return sub_3BEEA8(*v0);
}

uint64_t sub_3BEFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_3C08C0(a1, a2);
  *a3 = result;
  return result;
}

void sub_3BF004(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_3BF010(uint64_t a1)
{
  unint64_t v2 = sub_3BF5E4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_3BF04C(uint64_t a1)
{
  unint64_t v2 = sub_3BF5E4();

  return CodingKey.debugDescription.getter(a1, v2);
}

void ShowInformation.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_4C1B68);
  uint64_t v7 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for ShowInformation();
  __chkstk_darwin(v38);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  v37 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_3BF5E4();
  sub_3D91D0();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  }
  else
  {
    uint64_t v13 = v7;
    char v42 = 0;
    sub_3BF638();
    uint64_t v14 = v36;
    v15 = v9;
    sub_3D8ED0();
    char v16 = v41;
    *uint64_t v11 = v39;
    *(_OWORD *)(v11 + 8) = v40;
    v11[24] = v16;
    sub_3D7340();
    char v39 = 1;
    sub_3BF880(&qword_4AC540, (void (*)(uint64_t))&type metadata accessor for ImpressionMetrics);
    sub_3D8E80();
    uint64_t v17 = (int *)v38;
    sub_2A728((uint64_t)v6, (uint64_t)&v11[*(int *)(v38 + 20)]);
    char v39 = 2;
    uint64_t v18 = sub_3D8E40();
    uint64_t v19 = (uint64_t)v37;
    uint64_t v20 = (uint64_t *)&v11[v17[6]];
    *uint64_t v20 = v18;
    v20[1] = v21;
    char v39 = 3;
    uint64_t v22 = sub_3D8E60();
    unint64_t v23 = &v11[v17[7]];
    *(void *)unint64_t v23 = v22;
    v23[8] = v24 & 1;
    char v39 = 4;
    uint64_t v25 = sub_3D8E70();
    v26 = &v11[v17[8]];
    *(void *)v26 = v25;
    v26[8] = v27 & 1;
    char v39 = 5;
    uint64_t v28 = sub_3D8E40();
    v29 = (uint64_t *)&v11[v17[9]];
    uint64_t *v29 = v28;
    v29[1] = v30;
    char v42 = 6;
    sub_3BF68C();
    sub_3D8E80();
    v11[v17[10]] = v39;
    char v39 = 7;
    uint64_t v31 = sub_3D8E40();
    uint64_t v33 = v32;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v14);
    v34 = (uint64_t *)&v11[v17[11]];
    uint64_t *v34 = v31;
    v34[1] = v33;
    sub_3BF6E0((uint64_t)v11, v35);
    __swift_destroy_boxed_opaque_existential_1(v19);
    sub_3BF744((uint64_t)v11);
  }
}

unint64_t sub_3BF5E4()
{
  unint64_t result = qword_4C1B70;
  if (!qword_4C1B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1B70);
  }
  return result;
}

unint64_t sub_3BF638()
{
  unint64_t result = qword_4C1B78;
  if (!qword_4C1B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1B78);
  }
  return result;
}

unint64_t sub_3BF68C()
{
  unint64_t result = qword_4C1B80;
  if (!qword_4C1B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1B80);
  }
  return result;
}

uint64_t sub_3BF6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ShowInformation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3BF744(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ShowInformation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_3BF7A0(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_3BF7B8(uint64_t a1, uint64_t a2)
{
  return sub_58B6C(a1, a2);
}

uint64_t ShowInformation.id.getter()
{
  return sub_3D8B60();
}

uint64_t sub_3BF828(uint64_t a1)
{
  uint64_t result = sub_3BF880(&qword_4C1B88, (void (*)(uint64_t))type metadata accessor for ShowInformation);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_3BF880(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3BF8C8()
{
  return sub_3BF880(&qword_4C1B88, (void (*)(uint64_t))type metadata accessor for ShowInformation);
}

unsigned char *initializeBufferWithCopyOfBuffer for ShowInformation(unsigned char *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (unsigned char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = (void *)a2[1];
    uint64_t v8 = a2[2];
    char v9 = *((unsigned char *)a2 + 24);
    sub_6B828(v7, v8, v9);
    *((void *)v4 + 1) = v7;
    *((void *)v4 + 2) = v8;
    v4[24] = v9;
    uint64_t v10 = a3[5];
    uint64_t v11 = &v4[v10];
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_3D7340();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
      memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    uint64_t v17 = a3[6];
    uint64_t v18 = a3[7];
    uint64_t v19 = &v4[v17];
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = &v4[v18];
    uint64_t v23 = (uint64_t)a2 + v18;
    *(void *)uint64_t v22 = *(void *)v23;
    v22[8] = *(unsigned char *)(v23 + 8);
    uint64_t v24 = a3[8];
    uint64_t v25 = a3[9];
    v26 = &v4[v24];
    uint64_t v27 = (uint64_t)a2 + v24;
    *(void *)v26 = *(void *)v27;
    v26[8] = *(unsigned char *)(v27 + 8);
    uint64_t v28 = &v4[v25];
    v29 = (uint64_t *)((char *)a2 + v25);
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = a3[11];
    v4[a3[10]] = *((unsigned char *)a2 + a3[10]);
    uint64_t v32 = &v4[v31];
    uint64_t v33 = (uint64_t *)((char *)a2 + v31);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ShowInformation(uint64_t a1, uint64_t a2)
{
  sub_6B890(*(void **)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_3D7340();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ShowInformation(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  char v8 = *(unsigned char *)(a2 + 24);
  sub_6B828(v6, v7, v8);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  uint64_t v12 = sub_3D7340();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  uint64_t v15 = a3[6];
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v15);
  uint64_t v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a1 + v16;
  uint64_t v21 = a2 + v16;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  uint64_t v22 = a3[8];
  uint64_t v23 = a3[9];
  uint64_t v24 = a1 + v22;
  uint64_t v25 = a2 + v22;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  v26 = (void *)(a1 + v23);
  uint64_t v27 = (void *)(a2 + v23);
  uint64_t v28 = v27[1];
  void *v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ShowInformation(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  char v8 = *(unsigned char *)(a2 + 24);
  sub_6B828(v6, v7, v8);
  uint64_t v9 = *(void **)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = v7;
  char v11 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v8;
  sub_6B890(v9, v10, v11);
  uint64_t v12 = a3[5];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_3D7340();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 24))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_7:
  uint64_t v21 = a3[6];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[7];
  uint64_t v25 = a1 + v24;
  v26 = (uint64_t *)(a2 + v24);
  uint64_t v27 = *v26;
  *(unsigned char *)(v25 + 8) = *((unsigned char *)v26 + 8);
  *(void *)uint64_t v25 = v27;
  uint64_t v28 = a3[8];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v31 = *v30;
  *(unsigned char *)(v29 + 8) = *((unsigned char *)v30 + 8);
  *(void *)uint64_t v29 = v31;
  uint64_t v32 = a3[9];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v35 = a3[11];
  uint64_t v36 = (void *)(a1 + v35);
  v37 = (void *)(a2 + v35);
  *uint64_t v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ShowInformation(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  *(_OWORD *)((char *)a1 + 9) = *(_OWORD *)((char *)a2 + 9);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  char v8 = (char *)a2 + v6;
  uint64_t v9 = sub_3D7340();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  v13[8] = v14[8];
  *(void *)uint64_t v13 = *(void *)v14;
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = (char *)a1 + v15;
  int v18 = (char *)a2 + v15;
  v17[8] = v18[8];
  *(void *)uint64_t v17 = *(void *)v18;
  *(_OWORD *)((char *)a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  uint64_t v19 = a3[11];
  *((unsigned char *)a1 + a3[10]) = *((unsigned char *)a2 + a3[10]);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  return a1;
}

uint64_t assignWithTake for ShowInformation(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  char v6 = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  char v9 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_6B890(v7, v8, v9);
  uint64_t v10 = a3[5];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_3D7340();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  uint64_t v19 = a3[6];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v23 = *v21;
  uint64_t v22 = v21[1];
  *uint64_t v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[7];
  uint64_t v25 = a3[8];
  uint64_t v26 = a1 + v24;
  uint64_t v27 = a2 + v24;
  *(void *)uint64_t v26 = *(void *)v27;
  *(unsigned char *)(v26 + 8) = *(unsigned char *)(v27 + 8);
  uint64_t v28 = a1 + v25;
  uint64_t v29 = a2 + v25;
  *(void *)uint64_t v28 = *(void *)v29;
  *(unsigned char *)(v28 + 8) = *(unsigned char *)(v29 + 8);
  uint64_t v30 = a3[9];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (uint64_t *)(a2 + v30);
  uint64_t v34 = *v32;
  uint64_t v33 = v32[1];
  *uint64_t v31 = v34;
  v31[1] = v33;
  swift_bridgeObjectRelease();
  uint64_t v35 = a3[11];
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v36 = (void *)(a1 + v35);
  v37 = (uint64_t *)(a2 + v35);
  uint64_t v39 = *v37;
  uint64_t v38 = v37[1];
  *uint64_t v36 = v39;
  v36[1] = v38;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShowInformation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_3C0444);
}

uint64_t sub_3C0444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    int v13 = v12 - 1;
    if (v13 < 0) {
      int v13 = -1;
    }
    return (v13 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for ShowInformation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3C0530);
}

uint64_t sub_3C0530(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

void sub_3C05F8()
{
  sub_3FBDC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for ShowInformation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x3C0780);
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

ValueMetadata *type metadata accessor for ShowInformation.CodingKeys()
{
  return &type metadata for ShowInformation.CodingKeys;
}

unint64_t sub_3C07BC()
{
  unint64_t result = qword_4C1C38;
  if (!qword_4C1C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1C38);
  }
  return result;
}

unint64_t sub_3C0814()
{
  unint64_t result = qword_4C1C40;
  if (!qword_4C1C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1C40);
  }
  return result;
}

unint64_t sub_3C086C()
{
  unint64_t result = qword_4C1C48;
  if (!qword_4C1C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1C48);
  }
  return result;
}

uint64_t sub_3C08C0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000000040B640 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000000003FD3C0 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7470697263736564 && a2 == 0xEB000000006E6F69 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E69746172 && a2 == 0xE600000000000000 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6F43676E69746172 && a2 == 0xEB00000000746E75 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D614E65726E6567 && a2 == 0xE900000000000065 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x52746E65746E6F63 && a2 == 0xED0000676E697461 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6867697279706F63 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v5 = sub_3D8FE0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t ManageCategoriesPage.pageMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ManageCategoriesPage() + 20);
  uint64_t v4 = sub_3D6EA0();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for ManageCategoriesPage()
{
  uint64_t result = qword_4C1CF0;
  if (!qword_4C1CF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ManageCategoriesPage.init(sections:pageMetrics:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  uint64_t v4 = (char *)a3 + *(int *)(type metadata accessor for ManageCategoriesPage() + 20);
  uint64_t v5 = sub_3D6EA0();
  unsigned int v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);

  return v6(v4, a2, v5);
}

uint64_t sub_3C0D9C()
{
  if (*v0) {
    return 0x7274654D65676170;
  }
  else {
    return 0x736E6F6974636573;
  }
}

uint64_t sub_3C0DE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_3C1DF4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_3C0E08(uint64_t a1)
{
  unint64_t v2 = sub_3C1094();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_3C0E44(uint64_t a1)
{
  unint64_t v2 = sub_3C1094();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ManageCategoriesPage.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_4C1C50);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_3C1094();
  sub_3D91F0();
  uint64_t v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4C1C60);
  sub_3C1458(&qword_4C1C68, &qword_4C1C70);
  sub_3D8F50();
  if (!v2)
  {
    type metadata accessor for ManageCategoriesPage();
    v10[6] = 1;
    sub_3D6EA0();
    sub_3C14EC(&qword_4C1C78, (void (*)(uint64_t))&type metadata accessor for PageMetrics);
    sub_3D8F50();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_3C1094()
{
  unint64_t result = qword_4C1C58;
  if (!qword_4C1C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1C58);
  }
  return result;
}

uint64_t ManageCategoriesPage.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v23 = sub_3D6EA0();
  uint64_t v20 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_4C1C80);
  uint64_t v22 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ManageCategoriesPage();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_3C1094();
  sub_3D91D0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v18 = v5;
  uint64_t v19 = a1;
  uint64_t v11 = v10;
  uint64_t v13 = v22;
  uint64_t v12 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4C1C60);
  char v26 = 0;
  sub_3C1458(&qword_4C1C88, &qword_4AC078);
  uint64_t v14 = v24;
  sub_3D8ED0();
  uint64_t v15 = (uint64_t)v11;
  *uint64_t v11 = v27;
  char v25 = 1;
  sub_3C14EC(&qword_4C1C90, (void (*)(uint64_t))&type metadata accessor for PageMetrics);
  int v16 = v18;
  sub_3D8ED0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v15 + *(int *)(v8 + 20), v16, v12);
  sub_3C1534(v15, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return sub_3C1598(v15);
}

uint64_t sub_3C1458(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_4C1C60);
    sub_3C14EC(a2, (void (*)(uint64_t))type metadata accessor for CategorySection);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_3C14EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3C1534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ManageCategoriesPage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3C1598(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ManageCategoriesPage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3C15F4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ManageCategoriesPage.init(from:)(a1, a2);
}

uint64_t sub_3C160C(void *a1)
{
  return ManageCategoriesPage.encode(to:)(a1);
}

uint64_t sub_3C1624(uint64_t a1, uint64_t a2)
{
  return sub_59AAC(a1, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for ManageCategoriesPage(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_3D6EA0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t destroy for ManageCategoriesPage(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_3D6EA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for ManageCategoriesPage(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3D6EA0();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *assignWithCopy for ManageCategoriesPage(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_3D6EA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *initializeWithTake for ManageCategoriesPage(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3D6EA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for ManageCategoriesPage(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_3D6EA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ManageCategoriesPage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_3C19E0);
}

uint64_t sub_3C19E0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_3D6EA0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ManageCategoriesPage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3C1AA4);
}

void *sub_3C1AA4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_3D6EA0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_3C1B4C()
{
  uint64_t result = sub_3D6EA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ManageCategoriesPage.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x3C1CB4);
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

ValueMetadata *type metadata accessor for ManageCategoriesPage.CodingKeys()
{
  return &type metadata for ManageCategoriesPage.CodingKeys;
}

unint64_t sub_3C1CF0()
{
  unint64_t result = qword_4C1D28;
  if (!qword_4C1D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1D28);
  }
  return result;
}

unint64_t sub_3C1D48()
{
  unint64_t result = qword_4C1D30;
  if (!qword_4C1D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1D30);
  }
  return result;
}

unint64_t sub_3C1DA0()
{
  unint64_t result = qword_4C1D38;
  if (!qword_4C1D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1D38);
  }
  return result;
}

uint64_t sub_3C1DF4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x736E6F6974636573 && a2 == 0xE800000000000000;
  if (v2 || (sub_3D8FE0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7274654D65676170 && a2 == 0xEB00000000736369)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_3D8FE0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_3C1F00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t UnbookmarkEpisodeAction.actionMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UnbookmarkEpisodeAction() + 20);
  uint64_t v4 = sub_3D6F40();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for UnbookmarkEpisodeAction()
{
  uint64_t result = qword_4C1D98;
  if (!qword_4C1D98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t UnbookmarkEpisodeAction.actionMetrics.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UnbookmarkEpisodeAction() + 20);
  uint64_t v4 = sub_3D6F40();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

void (__swiftcall *UnbookmarkEpisodeAction.actionMetrics.modify())()
{
  return FindOrCreateEpisodeOfferContentIDsIntentsIntentImplementation.init();
}

uint64_t UnbookmarkEpisodeAction.intent.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_4A97C0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_3DED90;
  BOOL v2 = *(void **)v0;
  uint64_t v3 = *(void *)(v0 + 8);
  *(void *)(v1 + 32) = *(void *)v0;
  *(void *)(v1 + 40) = v3;
  char v4 = *(unsigned char *)(v0 + 16);
  *(unsigned char *)(v1 + 48) = v4;
  sub_6B828(v2, v3, v4);

  return sub_3D2F30();
}

uint64_t UnbookmarkEpisodeAction.init(episodeID:actionMetrics:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3;
  uint64_t v6 = a5 + *(int *)(type metadata accessor for UnbookmarkEpisodeAction() + 20);
  uint64_t v7 = sub_3D6F40();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32);

  return v8(v6, a4, v7);
}

uint64_t sub_3C2198()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for UnbookmarkEpisodeAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_3C21C8);
}

uint64_t sub_3C21C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 > 2) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_3D6F40();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for UnbookmarkEpisodeAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3C2284);
}

uint64_t sub_3C2284(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 253)
  {
    *(unsigned char *)(result + 16) = -(char)a2;
  }
  else
  {
    uint64_t v7 = sub_3D6F40();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_3C2328()
{
  uint64_t result = sub_3D6F40();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_3C23C8(uint64_t a1)
{
  sub_18B918();
  uint64_t result = sub_3D8290();
  int64_t v3 = 0;
  uint64_t v15 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_CCC80(&v14, *(void *)(*(void *)(a1 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_3C2540(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t result = (void *)sub_1FC390(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_3D8BF0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 storeTrackId];

      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v9 >= v8 >> 1) {
        sub_1FC390(v8 > 1, v9 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v9 + 1;
      _swiftEmptyArrayStorage[v9 + 4] = v7;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_3D8D90();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void *sub_3C26A4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)sub_3D8CA0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_3D8BF0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      id v7 = [v5 objectID];

      sub_3D8C70();
      sub_3D8CB0();
      sub_3D8CC0();
      sub_3D8C80();
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_3D8D90();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t FindOrCreateLocalEpisodeContentIDsIntentImplementation.perform(_:objectGraph:)(uint64_t a1, uint64_t a2)
{
  v2[16] = a1;
  v2[17] = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_4B22A0);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[18] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_3C28AC;
  return BaseObjectGraph.inject<A>(_:)(v2 + 2, v3, v3);
}

uint64_t sub_3C28AC()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_3C3278;
  }
  else {
    uint64_t v2 = sub_3C29C0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3C29C0()
{
  sub_3D31B0();
  uint64_t v1 = sub_3D8070();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  v0[20] = v1;
  v0[21] = v3;
  v0[22] = v5;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[23] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_3C2A88;
  return sub_3C33FC(v1);
}

uint64_t sub_3C2A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[24] = a1;
  v4[25] = a2;
  v4[26] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_3C3290;
  }
  else {
    uint64_t v5 = sub_3C2BA0;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_3C2BA0()
{
  v0[7] = v0[24];
  __swift_instantiateConcreteTypeFromMangledName(&qword_4A9A78);
  sub_1112A8();
  if (sub_3D8310())
  {
    uint64_t v1 = v0[24];
    uint64_t v2 = v0[5];
    uint64_t v3 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
    v0[11] = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[27] = v4;
    unint64_t v5 = sub_19574();
    *uint64_t v4 = v0;
    v4[1] = sub_3C2DB8;
    uint64_t v6 = v0[17];
    return dispatch thunk of IntentDispatcher.dispatch<A>(_:objectGraph:)(v0 + 10, v0 + 11, v6, &type metadata for FetchEpisodeOffersIntent, v5, v2, v3);
  }
  else
  {
    uint64_t v7 = v0[25];
    swift_bridgeObjectRelease();
    unint64_t v8 = swift_bridgeObjectRetain();
    unint64_t v9 = sub_3C62A4(v8);
    swift_bridgeObjectRelease();
    uint64_t v10 = swift_bridgeObjectRetain();
    int64_t v11 = sub_3C6400(v10);
    swift_bridgeObjectRelease();
    sub_3C64F0((uint64_t)v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_28867C(v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    unint64_t v12 = (uint64_t (*)(void *))v0[1];
    return v12(v9);
  }
}

uint64_t sub_3C2DB8()
{
  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_3C331C;
  }
  else
  {
    uint64_t v2 = sub_3C2F04;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3C2F04()
{
  uint64_t v1 = v0[10];
  v0[29] = v1;
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  v0[13] = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[30] = v4;
  unint64_t v5 = sub_104BE4();
  *uint64_t v4 = v0;
  v4[1] = sub_3C2FF8;
  uint64_t v6 = v0[17];
  return dispatch thunk of IntentDispatcher.dispatch<A>(_:objectGraph:)(v0 + 12, v0 + 13, v6, &type metadata for FindOrCreateEpisodeOfferContentIDsIntent, v5, v2, v3);
}

uint64_t sub_3C2FF8()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_3C338C;
  }
  else
  {
    uint64_t v2 = sub_3C3144;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3C3144()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[12];
  unint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_3C62A4(v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = sub_3C6400(v5);
  swift_bridgeObjectRelease();
  sub_3C64F0((uint64_t)v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_28867C(v1);
  sub_28867C(v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v7 = (uint64_t (*)(void *))v0[1];
  return v7(v4);
}

uint64_t sub_3C3278()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_3C3290()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3C331C()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3C338C()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3C33FC(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_3D86C0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  uint64_t v3 = sub_3D81A0();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_4AFF70);
  uint64_t v5 = (void *)swift_task_alloc();
  v1[12] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_3C357C;
  return BaseObjectGraph.inject<A>(_:)(v1 + 4, v4, v4);
}

uint64_t sub_3C357C()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_3C3F64;
  }
  else {
    uint64_t v2 = sub_3C3690;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3C3690()
{
  v0[14] = v0[4];
  uint64_t ObjectType = swift_getObjectType();
  sub_F1058();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[15] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_3C3758;
  uint64_t v3 = v0[11];
  return NSManagedObjectContextProvider.managedObjectContext(for:)(v3, ObjectType);
}

uint64_t sub_3C3758(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 88);
  uint64_t v3 = *(void *)(*(void *)v1 + 80);
  uint64_t v4 = *(void *)(*(void *)v1 + 72);
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_3C38D4, 0, 0);
}

uint64_t sub_3C38D4()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_3D8CA0();
    uint64_t v3 = (uint64_t *)(v1 + 32);
    do
    {
      uint64_t v4 = *v3++;
      [objc_allocWithZone((Class)NSNumber) initWithUnsignedLongLong:v4];
      sub_3D8C70();
      sub_3D8CB0();
      sub_3D8CC0();
      sub_3D8C80();
      --v2;
    }
    while (v2);
  }
  uint64_t v5 = (void *)v0[16];
  uint64_t v7 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v8 = v0[6];
  uint64_t v9 = sub_3C6B48((unint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v5;
  uint64_t v11 = swift_allocObject();
  v0[17] = v11;
  *(void *)(v11 + 16) = sub_3C6DD4;
  *(void *)(v11 + 24) = v10;
  (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v6, enum case for NSManagedObjectContext.ScheduledTaskType.immediate(_:), v8);
  id v12 = v5;
  int64_t v13 = (void *)swift_task_alloc();
  v0[18] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C1E20);
  *int64_t v13 = v0;
  v13[1] = sub_3C3ADC;
  uint64_t v15 = v0[8];
  return NSManagedObjectContext.perform<A>(schedule:_:)(v0 + 2, v15, sub_3C6E28, v11, v14);
}

uint64_t sub_3C3ADC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(void, void))(v2[7] + 8))(v2[8], v2[6]);
  swift_release();
  if (v0) {
    uint64_t v3 = sub_3C3FD4;
  }
  else {
    uint64_t v3 = sub_3C3C60;
  }
  return _swift_task_switch(v3, 0, 0);
}

uint64_t sub_3C3C60()
{
  unint64_t v22 = v0[3];
  int64_t v1 = *(void *)(v0[2] + 16);
  if (v1)
  {
    sub_1FBFC4(0, v1, 0);
    for (uint64_t i = 0; i != v1; ++i)
    {
      uint64_t v3 = sub_3D5160();
      unint64_t v5 = _swiftEmptyArrayStorage[2];
      unint64_t v4 = _swiftEmptyArrayStorage[3];
      if (v5 >= v4 >> 1) {
        sub_1FBFC4(v4 > 1, v5 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + 1;
      _swiftEmptyArrayStorage[v5 + 4] = v3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_3C6A60((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_3D8D90();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_8;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)((char *)&dword_10 + (v22 & 0xFFFFFFFFFFFFFF8));
  if (!v7) {
    goto LABEL_18;
  }
LABEL_8:
  uint64_t result = sub_1FC0CC(0, v7 & ~(v7 >> 63), 0);
  if (v7 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v21 = v0;
  uint64_t v9 = 0;
  unint64_t v10 = v22;
  do
  {
    if ((v22 & 0xC000000000000001) != 0) {
      id v11 = (id)sub_3D8BF0();
    }
    else {
      id v11 = *(id *)(v10 + 8 * v9 + 32);
    }
    id v12 = v11;
    unint64_t v14 = _swiftEmptyArrayStorage[2];
    unint64_t v13 = _swiftEmptyArrayStorage[3];
    if (v14 >= v13 >> 1)
    {
      sub_1FC0CC(v13 > 1, v14 + 1, 1);
      unint64_t v10 = v22;
    }
    ++v9;
    _swiftEmptyArrayStorage[2] = v14 + 1;
    uint64_t v15 = &_swiftEmptyArrayStorage[3 * v14];
    v15[4] = v12;
    v15[5] = 0;
    *((unsigned char *)v15 + 48) = 1;
  }
  while (v7 != v9);
  swift_bridgeObjectRelease();
  uint64_t v0 = v21;
LABEL_19:
  uint64_t v16 = swift_bridgeObjectRetain();
  uint64_t v17 = sub_3C6A60(v16);
  swift_bridgeObjectRelease();
  if (*(void *)(v6 + 16) <= *(void *)(v17 + 16) >> 3) {
    sub_3C584C(v6);
  }
  else {
    uint64_t v17 = (uint64_t)sub_3C59C0(v6, v17);
  }
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)v0[16];
  uint64_t v19 = sub_2A7960(v17);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void *, void *))v0[1];
  return v20(v19, _swiftEmptyArrayStorage);
}

uint64_t sub_3C3F64()
{
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3C3FD4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_3C404C()
{
  int64_t v1 = v0;
  sub_3D7D50();
  id v2 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v3 = sub_3D7D10();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithEntityName:v3];

  unint64_t v5 = self;
  sub_3D530(0, (unint64_t *)&qword_4AF0A0);
  sub_3C6E5C();
  Class isa = sub_3D8260().super.isa;
  id v7 = [v5 predicateForEpisodeStoreTrackIds:isa];

  [v4 setPredicate:v7];
  sub_3D530(0, (unint64_t *)&qword_4B0F68);
  unint64_t v8 = sub_3D86D0();
  if (!v0)
  {
    unint64_t v9 = v8;
    int64_t v1 = sub_3C2540(v8);
    sub_3C26A4(v9);
    swift_bridgeObjectRelease();
  }

  return v1;
}

uint64_t sub_3C41E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_ABBFC;
  return FindOrCreateLocalEpisodeContentIDsIntentImplementation.perform(_:objectGraph:)(a2, a3);
}

void *sub_3C4288()
{
  int64_t v1 = v0;
  uint64_t v2 = sub_3D7690();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B1FC0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_3D8B70();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *int64_t v1 = v8;
    return result;
  }
  unint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    int64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_3C452C()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4ADA00);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_3C46E0()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AF7B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
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

void *sub_3C4878()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AD9F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
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

void *sub_3C4A10()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AF7C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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

void *sub_3C4BA4()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AF7B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
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

void *sub_3C4D3C()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C1E60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
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
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = (void *)swift_retain();
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

id sub_3C4EE8()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C1E50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_3D8B70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_3C5094(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    int64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AF7B0);
  uint64_t result = sub_3D8BA0();
  int64_t v9 = (unsigned char *)result;
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
    Swift::UInt64 v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    sub_3D9130();
    sub_3D9170(v18);
    uint64_t result = sub_3D9180();
    uint64_t v19 = -1 << v9[32];
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
    *(void *)(*((void *)v9 + 6) + 8 * v22) = v18;
    ++*((void *)v9 + 2);
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

uint64_t sub_3C5300(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    int64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C1E60);
  uint64_t result = sub_3D8BA0();
  int64_t v9 = (unsigned char *)result;
  uint64_t v30 = a1;
  uint64_t v31 = a2;
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
    if (v15 >= v31) {
      goto LABEL_36;
    }
    unint64_t v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_36;
      }
      unint64_t v16 = v30[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_36;
        }
        unint64_t v16 = v30[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    sub_3D9130();
    uint64_t v19 = *(void **)(v18 + 32);
    swift_retain();
    id v20 = [v19 identifier];
    sub_3D7D50();

    sub_3D7E60();
    swift_bridgeObjectRelease();
    uint64_t result = sub_3D9180();
    uint64_t v21 = -1 << v9[32];
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(void *)(*((void *)v9 + 6) + 8 * v24) = v18;
    ++*((void *)v9 + 2);
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
  if (v17 >= v31) {
    goto LABEL_36;
  }
  unint64_t v16 = v30[v17];
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
    if (v11 >= v31) {
      goto LABEL_36;
    }
    unint64_t v16 = v30[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_3C55B4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_4ADA00);
  uint64_t result = sub_3D8BA0();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_3D9130();
    swift_bridgeObjectRetain();
    sub_3D7E60();
    uint64_t result = sub_3D9180();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
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
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_3C584C(uint64_t result)
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
  uint64_t result = swift_bridgeObjectRetain();
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
    uint64_t result = sub_3C5D70(*(void *)(*(void *)(v2 + 48) + 8 * v10));
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

void *sub_3C59C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
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
                    sub_185A4();
                    return (void *)v2;
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
        Swift::UInt64 v18 = *(void *)(*(void *)(a1 + 48) + 8 * v13);
        sub_3D9130();
        sub_3D9170(v18);
        Swift::Int v19 = sub_3D9180();
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
      __chkstk_darwin(isStackAllocationSafe);
      uint64_t v27 = (char *)&v31 - v26;
      memcpy((char *)&v31 - v26, (const void *)(v2 + 56), v24);
      Swift::Int v28 = sub_3C5E98((Swift::Int)v27, v23, v2, v21, v33);
      swift_release();
      sub_185A4();
    }
    else
    {
      uint64_t v29 = (void *)swift_slowAlloc();
      memcpy(v29, (const void *)(v2 + 56), v24);
      Swift::Int v28 = sub_3C5E98((Swift::Int)v29, v23, v2, v21, v33);
      swift_release();
      sub_185A4();
      swift_slowDealloc();
    }
    return (void *)v28;
  }
  else
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
}

uint64_t sub_3C5D70(Swift::UInt64 a1)
{
  uint64_t v3 = *v1;
  sub_3D9130();
  sub_3D9170(a1);
  Swift::Int v4 = sub_3D9180();
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = v4 & ~v5;
  if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  if (*(void *)(v7 + 8 * v6) != a1)
  {
    uint64_t v8 = ~v5;
    do
    {
      unint64_t v6 = (v6 + 1) & v8;
      if (((*(void *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        return 0;
      }
    }
    while (*(void *)(v7 + 8 * v6) != a1);
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v13 = *v1;
  *uint64_t v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_3C46E0();
    uint64_t v10 = v13;
  }
  uint64_t v11 = *(void *)(*(void *)(v10 + 48) + 8 * v6);
  sub_3C60F8(v6);
  *uint64_t v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

Swift::Int sub_3C5E98(Swift::Int result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = (unint64_t *)result;
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
LABEL_22:
    Swift::UInt64 v25 = *(void *)(*(void *)(*a5 + 48) + 8 * v18);
    a5[3] = v15;
    a5[4] = v17;
    sub_3D9130();
    sub_3D9170(v25);
    uint64_t result = sub_3D9180();
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
            goto LABEL_34;
          }
          if (!v9) {
            return (Swift::Int)&_swiftEmptySetSingleton;
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
      goto LABEL_31;
    }
    uint64_t v22 = a5[1];
    unint64_t v23 = *(void *)(v22 + 8 * v19);
    if (!v23)
    {
      int64_t v21 = v15 + 1;
      if (v15 + 2 >= v20) {
        goto LABEL_31;
      }
      unint64_t v23 = *(void *)(v22 + 8 * (v15 + 2));
      if (v23)
      {
        int64_t v19 = v15 + 2;
      }
      else
      {
        int64_t v21 = v15 + 2;
        if (v15 + 3 >= v20) {
          goto LABEL_31;
        }
        unint64_t v23 = *(void *)(v22 + 8 * (v15 + 3));
        if (v23)
        {
          int64_t v19 = v15 + 3;
        }
        else
        {
          int64_t v19 = v15 + 4;
          int64_t v21 = v15 + 3;
          if (v15 + 4 >= v20) {
            goto LABEL_31;
          }
          unint64_t v23 = *(void *)(v22 + 8 * v19);
          if (!v23)
          {
            int64_t v21 = v20 - 1;
            int64_t v24 = v15 + 5;
            while (v20 != v24)
            {
              unint64_t v23 = *(void *)(v22 + 8 * v24++);
              if (v23)
              {
                int64_t v19 = v24 - 1;
                goto LABEL_21;
              }
            }
LABEL_31:
            a5[3] = v21;
            a5[4] = 0;
            swift_retain();
            return sub_3C5094(v7, a2, v9, a3);
          }
        }
      }
    }
LABEL_21:
    uint64_t v17 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v19 << 6);
    int64_t v15 = v19;
    goto LABEL_22;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

unint64_t sub_3C60F8(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_3D8A80();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::UInt64 v10 = *(void *)(*(void *)(v3 + 48) + 8 * v6);
        sub_3D9130();
        sub_3D9170(v10);
        unint64_t v11 = sub_3D9180() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (void *)(v12 + 8 * v2);
          unint64_t v14 = (void *)(v12 + 8 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void *sub_3C62A4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  while (1)
  {
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t result = (void *)sub_1FC0CC(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    unint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_3C67DC(v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      id v6 = v5;
      unint64_t v8 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v8 >= v7 >> 1) {
        sub_1FC0CC(v7 > 1, v8 + 1, 1);
      }
      ++v4;
      _swiftEmptyArrayStorage[2] = v8 + 1;
      unint64_t v9 = &_swiftEmptyArrayStorage[3 * v8];
      v9[4] = v6;
      v9[5] = 0;
      *((unsigned char *)v9 + 48) = 1;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_3D8D90();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void *sub_3C6400(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1FC0CC(0, v1, 0);
    uint64_t v3 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v6 = _swiftEmptyArrayStorage[2];
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v6 >= v7 >> 1) {
        sub_1FC0CC(v7 > 1, v6 + 1, 1);
      }
      v3 += 2;
      _swiftEmptyArrayStorage[2] = v6 + 1;
      unint64_t v8 = &_swiftEmptyArrayStorage[3 * v6];
      v8[4] = v5;
      v8[5] = v4;
      *((unsigned char *)v8 + 48) = 2;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_3C64F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_3C66B8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[3 * v8 + 4];
  if (a1 + 32 < v9 + 24 * v2 && v9 < a1 + 32 + 24 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_3D8DF0();
  __break(1u);
  return result;
}

unint64_t sub_3C6650()
{
  unint64_t result = qword_4BD7A0;
  if (!qword_4BD7A0)
  {
    sub_3D31C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4BD7A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FindOrCreateLocalEpisodeContentIDsIntentImplementation()
{
  return &type metadata for FindOrCreateLocalEpisodeContentIDsIntentImplementation;
}

void *sub_3C66B8(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_4A97C0);
      Swift::UInt64 v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      BOOL v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      Swift::UInt64 v10 = _swiftEmptyArrayStorage;
      BOOL v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_3C6C9C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_3C67DC(unint64_t a1, unint64_t a2)
{
  sub_3D530(0, (unint64_t *)&unk_4BE970);
  if (a2 >> 62)
  {
    uint64_t v4 = sub_3D8DB0();
    self;
    if (swift_dynamicCastObjCClass()) {
      return v4;
    }
LABEL_10:
    sub_3D8BC0(85);
    v5._countAndFlagsBits = 0xD000000000000046;
    v5._object = (void *)0x800000000040B6B0;
    goto LABEL_11;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)) <= a1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((char *)&stru_20.cmd + 8 * a1 + (a2 & 0xFFFFFFFFFFFFFF8));
  swift_unknownObjectRetain();
  self;
  if (swift_dynamicCastObjCClass()) {
    return v4;
  }
  sub_3D8BC0(82);
  v5._object = (void *)0x800000000040B660;
  v5._countAndFlagsBits = 0xD000000000000043;
LABEL_11:
  sub_3D7E90(v5);
  v7._countAndFlagsBits = sub_3D92F0();
  sub_3D7E90(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x756F662074756220;
  v8._object = (void *)0xEB0000000020646ELL;
  sub_3D7E90(v8);
  swift_getObjectType();
  swift_unknownObjectRelease();
  v9._countAndFlagsBits = sub_3D92F0();
  sub_3D7E90(v9);
  swift_bridgeObjectRelease();
  uint64_t result = sub_3D8D70();
  __break(1u);
  return result;
}

uint64_t sub_3C69C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_3D8290();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_CCAD0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_3C6A60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_18B918();
  uint64_t result = sub_3D8290();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::UInt64 *)(a1 + 32);
    do
    {
      Swift::UInt64 v5 = *v4++;
      sub_CCC80(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_3C6AD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_1BB454();
  uint64_t result = sub_3D8290();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v5 = *v4++;
      sub_CCEC0(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_3C6B48(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_3D8D90();
    swift_bridgeObjectRelease();
  }
  sub_3D530(0, (unint64_t *)&qword_4AF0A0);
  sub_3C6E5C();
  uint64_t result = sub_3D8290();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_3D8D90();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        char v6 = (void *)sub_3D8BF0();
        sub_CD4FC(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_CD4FC(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_3C6C9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_3D8DF0();
  __break(1u);
  return result;
}

uint64_t sub_3C6D94()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void *sub_3C6DD4()
{
  return sub_3C404C();
}

uint64_t sub_3C6DF0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_3C6E28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  if (!v2)
  {
    *a1 = result;
    a1[1] = v5;
  }
  return result;
}

unint64_t sub_3C6E5C()
{
  unint64_t result = qword_4C1E40;
  if (!qword_4C1E40)
  {
    sub_3D530(255, (unint64_t *)&qword_4AF0A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1E40);
  }
  return result;
}

uint64_t RecentlySearchedHeader.init(impressionMetrics:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0xD000000000000018;
  a2[1] = 0x80000000004027E0;
  uint64_t v3 = (uint64_t)a2 + *(int *)(type metadata accessor for RecentlySearchedHeader() + 20);

  return sub_2A728(a1, v3);
}

uint64_t type metadata accessor for RecentlySearchedHeader()
{
  uint64_t result = qword_4C1ED8;
  if (!qword_4C1ED8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t RecentlySearchedHeader.impressionMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RecentlySearchedHeader() + 20);

  return sub_2A6C0(v3, a1);
}

unint64_t sub_3C6FB8(uint64_t a1)
{
  unint64_t result = sub_3C6FE0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_3C6FE0()
{
  unint64_t result = qword_4C1E78;
  if (!qword_4C1E78)
  {
    type metadata accessor for RecentlySearchedHeader();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C1E78);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RecentlySearchedHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_3C704C);
}

uint64_t sub_3C704C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
    id v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for RecentlySearchedHeader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3C7114);
}

uint64_t sub_3C7114(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_3C71C0()
{
  sub_3FBDC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t ChannelDetail.uberArtwork.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_5AC54(v1 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_uberArtwork, a1);
}

uint64_t ChannelDetail.logoArtwork.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_5AC54(v1 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_logoArtwork, a1);
}

uint64_t ChannelDetail.iconArtwork.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_5AC54(v1 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_iconArtwork, a1);
}

void *ChannelDetail.backgroundColor.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor);
  sub_FD590(v1, *(unsigned char *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor + 8));
  return v1;
}

uint64_t sub_3C72D8()
{
  uint64_t result = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_availableShowCount);
  if (result <= 0) {
    return *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_showCount);
  }
  return result;
}

BOOL sub_3C7300()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_availableShowCount);
  if (v1 <= 0) {
    uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_showCount);
  }
  return v1 > 1;
}

BOOL sub_3C732C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_availableShowCount);
  if (v1 <= 0) {
    uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_showCount);
  }
  return v1 < 2;
}

uint64_t ChannelDetail.__allocating_init(adamId:title:subtitle:displayType:uberArtwork:logoArtwork:iconArtwork:backgroundColor:showCount:availableShowCount:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  char v18 = a2 & 1;
  uint64_t v19 = swift_allocObject();
  ChannelDetail.init(adamId:title:subtitle:displayType:uberArtwork:logoArtwork:iconArtwork:backgroundColor:showCount:availableShowCount:)(a1, v18, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  return v19;
}

uint64_t ChannelDetail.init(adamId:title:subtitle:displayType:uberArtwork:logoArtwork:iconArtwork:backgroundColor:showCount:availableShowCount:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  if (a2) {
    a1 = sub_3D5130();
  }
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a4;
  *(void *)(v14 + 40) = a5;
  *(void *)(v14 + 48) = a6;
  *(unsigned char *)(v14 + 56) = a7;
  sub_6E868(a8, v14 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_uberArtwork);
  sub_6E868(a9, v14 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_logoArtwork);
  sub_6E868(a10, v14 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_iconArtwork);
  uint64_t v21 = v14 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor;
  *(void *)uint64_t v21 = a11;
  *(unsigned char *)(v21 + 8) = a12;
  *(void *)(v14 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_showCount) = a13;
  *(void *)(v14 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_availableShowCount) = a14;
  return v14;
}

uint64_t ChannelDetail.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_6E980(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_uberArtwork);
  sub_6E980(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_logoArtwork);
  sub_6E980(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_iconArtwork);
  sub_FD5A4(*(id *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor), *(unsigned char *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor + 8));
  return v0;
}

uint64_t ChannelDetail.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_6E980(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_uberArtwork);
  sub_6E980(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_logoArtwork);
  sub_6E980(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_iconArtwork);
  sub_FD5A4(*(id *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor), *(unsigned char *)(v0 + OBJC_IVAR____TtC8ShelfKit13ChannelDetail_backgroundColor + 8));

  return swift_deallocClassInstance();
}

uint64_t sub_3C7648()
{
  return type metadata accessor for ChannelDetail();
}

uint64_t type metadata accessor for ChannelDetail()
{
  uint64_t result = qword_4C1F48;
  if (!qword_4C1F48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_3C769C()
{
  sub_6F380();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for ChannelDetail(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for ChannelDetail);
}

uint64_t dispatch thunk of ChannelDetail.resolvedShowCount.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ChannelDetail.isMultiShow.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of ChannelDetail.isSingleShow.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ChannelDetail.__allocating_init(adamId:title:subtitle:displayType:uberArtwork:logoArtwork:iconArtwork:backgroundColor:showCount:availableShowCount:)(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))(v2 + 184))(a1, a2 & 1);
}

id MetricsPageViewController.__allocating_init(asPartOf:wrapping:with:)(uint64_t a1, void *a2, long long *a3)
{
  id v7 = objc_allocWithZone(v3);
  return MetricsPageViewController.init(asPartOf:wrapping:with:)(a1, a2, a3);
}

id MetricsPageViewController.init(asPartOf:wrapping:with:)(uint64_t a1, void *a2, long long *a3)
{
  uint64_t v29 = a2;
  uint64_t v31 = a1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v28 = sub_3D7260();
  uint64_t v5 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  id v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v26 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_4B0240);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v27 = *a3;
  long long v26 = a3[1];
  uint64_t v14 = *((void *)a3 + 4);
  char v15 = *((unsigned char *)a3 + 40);
  uint64_t v16 = *((void *)a3 + 6);
  type metadata accessor for MetricsController();
  swift_allocObject();
  uint64_t v17 = v3;
  swift_retain();
  uint64_t v18 = MetricsController.init(asPartOf:)();
  long long v33 = v27;
  long long v34 = v26;
  uint64_t v35 = v14;
  char v36 = v15;
  uint64_t v37 = v16;
  sub_3D7250();
  sub_3D2F90();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B1FD0);
  sub_3D6DF0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_3DED20;
  sub_3D6DC0();
  sub_3D6DB0();
  MetricsPageFields.metricsFields.getter();
  uint64_t v19 = v28;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v28);
  sub_3D6E00();
  sub_4434C((uint64_t)v38, (uint64_t)v44);
  sub_443B4((uint64_t)v44);
  uint64_t v43 = v39;
  sub_443E0((uint64_t)&v43);
  uint64_t v42 = v40;
  sub_443E0((uint64_t)&v42);
  sub_3D4C4(v41);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_3D6EA0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v13, 0, 1, v20);
  uint64_t v21 = v18 + OBJC_IVAR____TtC8ShelfKit17MetricsController_pageMetrics;
  swift_beginAccess();
  sub_102688((uint64_t)v13, v21);
  swift_endAccess();
  sub_FE71C();
  sub_3C7CA4((uint64_t)v13);
  *(void *)&v17[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_metricsController] = v18;
  uint64_t v22 = v29;
  *(void *)&v17[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController] = v29;
  swift_retain();
  id v23 = v22;

  v32.receiver = v17;
  v32.super_class = ObjectType;
  id v24 = [super initWithNibName:0 bundle:0];
  swift_release();
  swift_release();

  return v24;
}

uint64_t sub_3C7CA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_4B0240);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void MetricsPageViewController.init(coder:)()
{
}

Swift::Void __swiftcall MetricsPageViewController.viewDidLoad()()
{
  v20.receiver = v0;
  v20.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController];
  [v0 addChildViewController:v1];
  id v2 = [v1 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  id v4 = [v0 view];
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [v3 setFrame:v7, v9, v11, v13];
  id v14 = [v0 view];
  if (!v14)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  char v15 = v14;
  id v16 = [v1 view];
  if (v16)
  {
    uint64_t v17 = v16;
    [v15 addSubview:v16];

    id v18 = [v0 navigationItem];
    id v19 = [v1 title];
    [v18 setTitle:v19];

    [v1 didMoveToParentViewController:v0];
    return;
  }
LABEL_9:
  __break(1u);
}

Swift::Void __swiftcall MetricsPageViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)swift_getObjectType();
  [super viewWillAppear:a1];
  if (*(void *)(*(void *)&v1[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_metricsController] + 16)) {
    sub_3D3050();
  }
  uint64_t v3 = sub_3D4650();
  __chkstk_darwin(v3);
  uint64_t v5 = v4 + 4;
  double v6 = v4 + 8;
  os_unfair_lock_lock(v4 + 8);
  sub_3C80F0(v5);
  os_unfair_lock_unlock(v6);
  swift_bridgeObjectRelease();
}

uint64_t sub_3C80F0(void *a1)
{
  return sub_FFFA8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

Swift::Void __swiftcall MetricsPageViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_3D6E80();
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)&double v6 = __chkstk_darwin(v4).n128_u64[0];
  double v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14.receiver = v1;
  v14.super_class = ObjectType;
  [super viewDidAppear:a1, v6];
  uint64_t v9 = *(void *)(*(void *)&v1[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_metricsController]
                 + OBJC_IVAR____TtC8ShelfKit17MetricsController_pageEnterGate);
  if (v9)
  {
    swift_beginAccess();
    int v10 = *(unsigned __int8 *)(v9 + 32);
    *(unsigned char *)(v9 + 32) = 1;
    if (v10 != 1)
    {
      swift_beginAccess();
      if (*(unsigned char *)(v9 + 34) == 1)
      {
        if (swift_unknownObjectWeakLoadStrong())
        {
          uint64_t v11 = *(void *)(v9 + 24);
          uint64_t v12 = swift_getObjectType();
          swift_retain();
          sub_3D6E70();
          (*(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 8))(v8, v12, v11);
          swift_unknownObjectRelease();
          (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
          swift_release();
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall MetricsPageViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_3D6E80();
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)&double v6 = __chkstk_darwin(v4).n128_u64[0];
  double v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16.receiver = v1;
  v16.super_class = ObjectType;
  [super viewWillDisappear:a1 v6];
  uint64_t v9 = *(void *)&v1[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_metricsController];
  uint64_t v10 = *(void *)(v9 + OBJC_IVAR____TtC8ShelfKit17MetricsController_pageEnterGate);
  if (v10)
  {
    swift_beginAccess();
    *(unsigned char *)(v10 + 32) = 0;
    if (*(void *)(v9 + 16)) {
      sub_3D3050();
    }
    sub_3D6E60();
    MetricsController.sendEvents(for:)((uint64_t)v8);
    uint64_t v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    __chkstk_darwin(v11);
    *(&v15 - 2) = 0;
    uint64_t v13 = v12 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v12 + 16);
    objc_super v14 = (os_unfair_lock_s *)(v12 + ((*(unsigned int *)(*(void *)v12 + 48) + 3) & 0x1FFFFFFFCLL));
    os_unfair_lock_lock(v14);
    sub_102A10(v13);
    os_unfair_lock_unlock(v14);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall MetricsPageViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)swift_getObjectType();
  [super viewDidDisappear:a1];
}

Swift::Void __swiftcall MetricsPageViewController.viewWillLayoutSubviews()()
{
  v13.receiver = v0;
  v13.super_class = (Class)swift_getObjectType();
  [super viewWillLayoutSubviews];
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC8ShelfKit25MetricsPageViewController_viewController] view];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v0 view];
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 bounds];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      [v2 setFrame:v6, v8, v10, v12];
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void MetricsPageViewController.init(nibName:bundle:)()
{
}

uint64_t type metadata accessor for MetricsPageViewController()
{
  return self;
}

uint64_t method lookup function for MetricsPageViewController(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for MetricsPageViewController);
}

uint64_t dispatch thunk of MetricsPageViewController.__allocating_init(asPartOf:wrapping:with:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t LibraryEpisodeOfferAction.init(episodeUuid:contentId:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v28 = sub_3D2460();
  uint64_t v10 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  double v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_3D6F40();
  uint64_t v13 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v16 - 8);
  id v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = (void *)(v5 + OBJC_IVAR____TtC8ShelfKit25LibraryEpisodeOfferAction_episodeUuid);
  *id v19 = a1;
  v19[1] = a2;
  swift_retain();
  if ((a4 & 1) != 0 || sub_3D5130() == a3)
  {
    a3 = 0;
    char v20 = 1;
  }
  else
  {
    char v20 = 0;
  }
  uint64_t v21 = v5 + OBJC_IVAR____TtC8ShelfKit25LibraryEpisodeOfferAction_contentId;
  *(void *)uint64_t v21 = a3;
  *(unsigned char *)(v21 + 8) = v20;
  swift_release();
  uint64_t v22 = sub_3D7340();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
  sub_3D6F00();
  sub_3D2450();
  uint64_t v23 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
  uint64_t v25 = v24;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v28);
  *(void *)(v5 + 16) = v23;
  *(void *)(v5 + 24) = v25;
  *(void *)(v5 + 32) = 0;
  *(void *)(v5 + 40) = 0;
  *(unsigned char *)(v5 + 48) = 32;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v5 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v15, v27);
  sub_2A728((uint64_t)v18, v5 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  return v5;
}

uint64_t LibraryEpisodeOfferAction.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  uint64_t v2 = sub_3D6F40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2A790(v0 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  swift_bridgeObjectRelease();
  return v0;
}

void LibraryEpisodeOfferAction.init(uniqueId:title:presentationStyle:actionMetrics:impressionMetrics:)()
{
}

uint64_t LibraryEpisodeOfferAction.__allocating_init(episodeUuid:contentId:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v27 = a4;
  uint64_t v28 = sub_3D2460();
  uint64_t v7 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  double v9 = &v26[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_3D6F40();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v26[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = &v26[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = swift_allocObject();
  id v18 = (void *)(v17 + OBJC_IVAR____TtC8ShelfKit25LibraryEpisodeOfferAction_episodeUuid);
  *id v18 = a1;
  v18[1] = a2;
  if ((v27 & 1) != 0 || sub_3D5130() == a3)
  {
    a3 = 0;
    char v19 = 1;
  }
  else
  {
    char v19 = 0;
  }
  uint64_t v20 = v17 + OBJC_IVAR____TtC8ShelfKit25LibraryEpisodeOfferAction_contentId;
  *(void *)uint64_t v20 = a3;
  *(unsigned char *)(v20 + 8) = v19;
  uint64_t v21 = sub_3D7340();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v16, 1, 1, v21);
  sub_3D6F00();
  sub_3D2450();
  uint64_t v22 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
  uint64_t v24 = v23;
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v28);
  *(void *)(v17 + 16) = v22;
  *(void *)(v17 + 24) = v24;
  *(void *)(v17 + 32) = 0;
  *(void *)(v17 + 40) = 0;
  *(unsigned char *)(v17 + 48) = 32;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v11 + 32))(v17 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v13, v10);
  sub_2A728((uint64_t)v16, v17 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  return v17;
}

uint64_t LibraryEpisodeOfferAction.episodeUuid.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit25LibraryEpisodeOfferAction_episodeUuid);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LibraryEpisodeOfferAction.contentId.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit25LibraryEpisodeOfferAction_contentId);
}

void LibraryEpisodeOfferAction.init(deserializing:using:)()
{
}

uint64_t sub_3C8FFC()
{
  return swift_bridgeObjectRelease();
}

uint64_t LibraryEpisodeOfferAction.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  uint64_t v2 = sub_3D6F40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2A790(v0 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_3C90EC()
{
  return type metadata accessor for LibraryEpisodeOfferAction();
}

uint64_t type metadata accessor for LibraryEpisodeOfferAction()
{
  uint64_t result = qword_4C2090;
  if (!qword_4C2090) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3C9140()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for LibraryEpisodeOfferAction(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for LibraryEpisodeOfferAction);
}

uint64_t dispatch thunk of LibraryEpisodeOfferAction.__allocating_init(episodeUuid:contentId:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v4 + 176))(a1, a2, a3, a4 & 1);
}

unint64_t static FetchTranscriptRequestInformationIntent.kind.getter()
{
  return 0xD000000000000027;
}

uint64_t FetchTranscriptRequestInformationIntent.priceType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FetchTranscriptRequestInformationIntent() + 20);
  uint64_t v4 = sub_3D5280();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for FetchTranscriptRequestInformationIntent()
{
  uint64_t result = qword_4C21E8;
  if (!qword_4C21E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t FetchTranscriptRequestInformationIntent.init(adamID:priceType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  uint64_t v4 = (char *)a3 + *(int *)(type metadata accessor for FetchTranscriptRequestInformationIntent() + 20);
  uint64_t v5 = sub_3D5280();
  double v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32);

  return v6(v4, a2, v5);
}

void sub_3C931C(void *a1@<X8>)
{
  *a1 = 0xD000000000000027;
  a1[1] = 0x80000000003FBC00;
}

uint64_t sub_3C933C(char *a1, char *a2)
{
  return sub_284714(*a1, *a2);
}

Swift::Int sub_3C9348()
{
  return sub_3D9180();
}

uint64_t sub_3C93CC()
{
  sub_3D7E60();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_3C943C()
{
  return sub_3D9180();
}

uint64_t sub_3C94BC@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_474C68;
  v8._object = v3;
  Swift::Int v5 = sub_3D8E10(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_3C951C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x64496D616461;
  if (*v1) {
    uint64_t v2 = 0x7079546563697270;
  }
  unint64_t v3 = 0xE600000000000000;
  if (*v1) {
    unint64_t v3 = 0xE900000000000065;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_3C955C()
{
  if (*v0) {
    return 0x7079546563697270;
  }
  else {
    return 0x64496D616461;
  }
}

uint64_t sub_3C9598@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  v9._countAndFlagsBits = a1;
  v5._rawValue = &off_474C68;
  v9._object = a2;
  Swift::Int v6 = sub_3D8E10(v5, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t sub_3C95FC(uint64_t a1)
{
  unint64_t v2 = sub_3C9844();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_3C9638(uint64_t a1)
{
  unint64_t v2 = sub_3C9844();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t FetchTranscriptRequestInformationIntent.encode(to:)(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_4C2170);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_3C9844();
  sub_3D91F0();
  uint64_t v11 = *v3;
  v10[7] = 0;
  sub_169A4();
  sub_3D8F50();
  if (!v2)
  {
    type metadata accessor for FetchTranscriptRequestInformationIntent();
    v10[6] = 1;
    sub_3D5280();
    sub_3CA0F0(&qword_4C2180, (void (*)(uint64_t))&type metadata accessor for PriceType);
    sub_3D8F50();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_3C9844()
{
  unint64_t result = qword_4C2178;
  if (!qword_4C2178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C2178);
  }
  return result;
}

uint64_t sub_3C9898()
{
  return sub_3CA0F0(&qword_4C2188, (void (*)(uint64_t))type metadata accessor for FetchTranscriptRequestInformationIntent);
}

uint64_t sub_3C98E0()
{
  return sub_3CA0F0(&qword_4B47C0, (void (*)(uint64_t))type metadata accessor for FetchTranscriptRequestInformationIntent);
}

uint64_t sub_3C9928()
{
  return sub_3CA0F0(&qword_4B2070, (void (*)(uint64_t))&type metadata accessor for TranscriptRequestInformation);
}

uint64_t sub_3C9970(void *a1)
{
  return FetchTranscriptRequestInformationIntent.encode(to:)(a1);
}

uint64_t sub_3C9988()
{
  return sub_3D75D0();
}

uint64_t *initializeBufferWithCopyOfBuffer for FetchTranscriptRequestInformationIntent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_3D5280();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for FetchTranscriptRequestInformationIntent(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_3D5280();
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

void *initializeWithCopy for FetchTranscriptRequestInformationIntent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3D5280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

void *assignWithCopy for FetchTranscriptRequestInformationIntent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3D5280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

void *initializeWithTake for FetchTranscriptRequestInformationIntent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3D5280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for FetchTranscriptRequestInformationIntent(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_3D5280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchTranscriptRequestInformationIntent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_3C9D50);
}

uint64_t sub_3C9D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_3D5280();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for FetchTranscriptRequestInformationIntent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3C9DD4);
}

uint64_t sub_3C9DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_3D5280();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t sub_3C9E48()
{
  uint64_t result = sub_3D5280();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for FetchTranscriptRequestInformationIntent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x3C9FB0);
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

ValueMetadata *type metadata accessor for FetchTranscriptRequestInformationIntent.CodingKeys()
{
  return &type metadata for FetchTranscriptRequestInformationIntent.CodingKeys;
}

unint64_t sub_3C9FEC()
{
  unint64_t result = qword_4C2220;
  if (!qword_4C2220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C2220);
  }
  return result;
}

unint64_t sub_3CA044()
{
  unint64_t result = qword_4C2228;
  if (!qword_4C2228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C2228);
  }
  return result;
}

unint64_t sub_3CA09C()
{
  unint64_t result = qword_4C2230;
  if (!qword_4C2230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C2230);
  }
  return result;
}

uint64_t sub_3CA0F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3CA138()
{
  return sub_3D6FA0();
}

uint64_t sub_3CA150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1EF40C();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

uint64_t OpenExternalAppAction.requiresSignedInUser.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_requiresSignedInUser);
}

uint64_t OpenExternalAppAction.bundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_bundleId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t OpenExternalAppAction.__allocating_init(bundleId:requiresSignedInUser:)(uint64_t a1, uint64_t a2, int a3)
{
  int v24 = a3;
  uint64_t v5 = sub_3D2460();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_3D6F40();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = &v23[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = &v23[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = (void *)(v16 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_bundleId);
  *uint64_t v17 = a1;
  v17[1] = a2;
  *(unsigned char *)(v16 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_requiresSignedInUser) = v24;
  uint64_t v18 = sub_3D7340();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  sub_3D6F00();
  sub_3D2450();
  uint64_t v19 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
  uint64_t v21 = v20;
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)(v16 + 16) = v19;
  *(void *)(v16 + 24) = v21;
  *(void *)(v16 + 32) = 0;
  *(void *)(v16 + 40) = 0;
  *(unsigned char *)(v16 + 48) = 32;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v10 + 32))(v16 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v12, v9);
  sub_2A728((uint64_t)v15, v16 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  return v16;
}

uint64_t OpenExternalAppAction.init(bundleId:requiresSignedInUser:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  int v25 = a3;
  uint64_t v7 = sub_3D2460();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_3D6F40();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = (void *)(v4 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_bundleId);
  *uint64_t v18 = a1;
  v18[1] = a2;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_requiresSignedInUser) = v25;
  uint64_t v19 = sub_3D7340();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  sub_3D6F00();
  sub_3D2450();
  uint64_t v20 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
  uint64_t v22 = v21;
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)(v4 + 16) = v20;
  *(void *)(v4 + 24) = v22;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(unsigned char *)(v4 + 48) = 32;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v12 + 32))(v4 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v14, v11);
  sub_2A728((uint64_t)v17, v4 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  return v4;
}

void OpenExternalAppAction.init(deserializing:using:)()
{
}

void OpenExternalAppAction.init(uniqueId:title:presentationStyle:actionMetrics:impressionMetrics:)()
{
}

uint64_t sub_3CA750()
{
  return swift_bridgeObjectRelease();
}

uint64_t OpenExternalAppAction.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  uint64_t v2 = sub_3D6F40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2A790(v0 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t OpenExternalAppAction.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  uint64_t v2 = sub_3D6F40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2A790(v0 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_3CA8E0()
{
  return type metadata accessor for OpenExternalAppAction();
}

uint64_t type metadata accessor for OpenExternalAppAction()
{
  uint64_t result = qword_4C2268;
  if (!qword_4C2268) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3CA934()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for OpenExternalAppAction(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for OpenExternalAppAction);
}

uint64_t dispatch thunk of OpenExternalAppAction.__allocating_init(bundleId:requiresSignedInUser:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_3CA9AC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_23E9C(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = &v5[4 * a1];
    char v10 = *((unsigned char *)v8 + 32);
    uint64_t v9 = v8 + 4;
    char v11 = *((unsigned char *)v9 + 1);
    uint64_t v12 = v9[3];
    *(unsigned char *)a2 = v10;
    *(unsigned char *)(a2 + 1) = v11;
    *(_OWORD *)(a2 + 8) = *(_OWORD *)(v9 + 1);
    *(void *)(a2 + 24) = v12;
    uint64_t v13 = v6 - 1 - a1;
    if (v13 >= 0)
    {
      uint64_t result = (uint64_t)memmove(v9, v9 + 4, 32 * v13);
      v5[2] = v7;
      *uint64_t v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_3D8DF0();
  __break(1u);
  return result;
}

uint64_t sub_3CAAA4(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_23F6C((uint64_t)v3);
  }
  unint64_t v4 = *((void *)v3 + 2);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    uint64_t v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      unint64_t v7 = &v3[8 * a1];
      uint64_t v8 = *((void *)v7 + 4);
      memmove(v7 + 32, v7 + 40, 8 * v6);
      *((void *)v3 + 2) = v5;
      *uint64_t v1 = v3;
      return v8;
    }
  }
  uint64_t result = sub_3D8DF0();
  __break(1u);
  return result;
}

NSAttributedString __swiftcall NSAttributedString.init(nqml:configuration:)(Swift::String nqml, ShelfKit::NqmlConfiguration *configuration)
{
  object = nqml._object;
  uint64_t countAndFlagsBits = nqml._countAndFlagsBits;
  Class isa = configuration->paragraphStyle.super.isa;
  uint64_t v5 = configuration->listItemBullet._countAndFlagsBits;
  uint64_t v19 = configuration->newline._countAndFlagsBits;
  long long v20 = *(_OWORD *)&configuration->newline._object;
  Class v21 = isa;
  uint64_t v22 = v5;
  long long v6 = *(_OWORD *)&configuration->markAttributes._rawValue;
  long long v23 = *(_OWORD *)&configuration->listItemBullet._object;
  long long v24 = v6;
  id v7 = objc_allocWithZone((Class)type metadata accessor for NqmlStringGenerator());
  uint64_t v8 = sub_3CB1CC(countAndFlagsBits, (uint64_t)object, &v19);
  [*(id *)&v8[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_parser] parse];
  uint64_t v9 = OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator;
  id v10 = [*(id *)&v8[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator] mutableString];
  if (qword_4A90C0 != -1) {
    swift_once();
  }
  sub_19BB64((void *)qword_4C2358);

  char v11 = *(void **)&v8[v9];
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v13 = objc_allocWithZone((Class)sub_3D2BE0());
  id v14 = v11;
  uint64_t v15 = (void *)sub_3D2C10();
  uint64_t v16 = (void *)sub_3D2BA0();

  id v17 = [v12 initWithAttributedString:v16];
  return (NSAttributedString)v17;
}

uint64_t type metadata accessor for NqmlStringGenerator()
{
  return self;
}

void __swiftcall NqmlConfiguration.init(font:)(ShelfKit::NqmlConfiguration *__return_ptr retstr, UIFont font)
{
  unint64_t v4 = (void *)sub_112FC((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v5 = (void *)sub_11454((uint64_t)_swiftEmptyArrayStorage);
  long long v6 = self;
  id v7 = font.super.isa;
  uint64_t v8 = (objc_class *)[v6 defaultParagraphStyle];
  [(objc_class *)v7 pointSize];
  double v10 = v9;
  id v11 = [objc_allocWithZone((Class)NSMutableParagraphStyle) init];
  [v11 setFirstLineHeadIndent:0.0];
  [v11 setHeadIndent:v10];
  [v11 setDefaultTabInterval:v10];
  sub_112D4((uint64_t)_swiftEmptyArrayStorage);
  id v12 = objc_allocWithZone((Class)NSTextTab);
  type metadata accessor for OptionKey(0);
  sub_3CD984((unint64_t *)&qword_4A9520, type metadata accessor for OptionKey);
  Class isa = sub_3D7BA0().super.isa;
  swift_bridgeObjectRelease();
  id v14 = [v12 initWithTextAlignment:4 location:isa options:v10];

  [v11 addTabStop:v14];
  retstr->newline._uint64_t countAndFlagsBits = 10;
  retstr->newline._object = (void *)0xE100000000000000;
  retstr->font.super.Class isa = v7;
  retstr->paragraphStyle.super.Class isa = v8;
  retstr->listItemBullet._uint64_t countAndFlagsBits = 547520738;
  retstr->listItemBullet._object = (void *)0xA400000000000000;
  retstr->listItemStyle.super.Class isa = (Class)v11;
  retstr->markAttributes._rawValue = v4;
  retstr->markFontAttributes._rawValue = v5;
}

id sub_3CAF08()
{
  id v0 = objc_allocWithZone((Class)NSRegularExpression);
  id result = sub_3CC750(0x745C725C6E5C5B28, 0xEC000000292B5D20, 0);
  qword_4C2350 = (uint64_t)result;
  return result;
}

uint64_t sub_3CAF84()
{
  uint64_t v0 = sub_3D1F40();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3D1F10();
  Class isa = sub_3D1F00().super.isa;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_4C2358 = (uint64_t)isa;
  return result;
}

NSString sub_3CB054()
{
  NSString result = sub_3D7D10();
  qword_4C2360 = (uint64_t)result;
  return result;
}

id static NSAttributedStringKey.marked.getter()
{
  if (qword_4A90C8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_4C2360;

  return v0;
}

void NqmlConfiguration.font.setter(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
}

void NqmlConfiguration.paragraphStyle.setter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
}

id NqmlConfiguration.listItemStyle.getter()
{
  return *(id *)(v0 + 48);
}

void NqmlConfiguration.listItemStyle.setter(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
}

uint64_t NqmlConfiguration.markAttributes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t NqmlConfiguration.markFontAttributes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NqmlConfiguration.markFontAttributes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = a1;
  return result;
}

char *sub_3CB1CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = a3[3];
  uint64_t v7 = a3[4];
  uint64_t v8 = OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator;
  id v9 = objc_allocWithZone((Class)NSMutableAttributedString);
  double v10 = v3;
  *(void *)&v3[v8] = [v9 init];
  *(void *)&v10[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack] = _swiftEmptyArrayStorage;
  id v11 = objc_allocWithZone((Class)ASKNQMLParser);
  NSString v12 = sub_3D7D10();
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithString:v12];

  *(void *)&v10[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_parser] = v13;
  id v14 = &v10[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration];
  *(void *)id v14 = v5;
  *(_OWORD *)(v14 + 8) = *(_OWORD *)(a3 + 1);
  *((void *)v14 + 3) = v6;
  *((void *)v14 + 4) = v7;
  *(_OWORD *)(v14 + 40) = *(_OWORD *)(a3 + 5);
  *(_OWORD *)(v14 + 56) = *(_OWORD *)(a3 + 7);

  v17.receiver = v10;
  v17.super_class = (Class)type metadata accessor for NqmlStringGenerator();
  uint64_t v15 = (char *)[super init];
  [*(id *)&v15[OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_parser] setDelegate:v15];
  return v15;
}

uint64_t destroy for NqmlConfiguration(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NqmlConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  unint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v8 = (void *)a2[6];
  uint64_t v7 = a2[7];
  a1[6] = v8;
  a1[7] = v7;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  id v9 = v4;
  id v10 = v5;
  swift_bridgeObjectRetain();
  id v11 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NqmlConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  uint64_t v7 = (void *)a2[3];
  uint64_t v8 = (void *)a1[3];
  a1[3] = v7;
  id v9 = v7;

  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v10 = (void *)a2[6];
  id v11 = (void *)a1[6];
  a1[6] = v10;
  id v12 = v10;

  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NqmlConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  unint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  id v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for NqmlConfiguration()
{
  return &type metadata for NqmlConfiguration;
}

uint64_t sub_3CB594(char *a1)
{
  uint64_t v3 = (char **)(v1 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack);
  swift_beginAccess();
  uint64_t v4 = *((void *)*v3 + 2);
  if (!v4)
  {
    swift_beginAccess();
    uint64_t v38 = *v3;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v3 = v38;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v38 = sub_14290(0, *((void *)v38 + 2) + 1, 1, v38);
      *uint64_t v3 = v38;
    }
    unint64_t v41 = *((void *)v38 + 2);
    unint64_t v40 = *((void *)v38 + 3);
    if (v41 >= v40 >> 1)
    {
      uint64_t v38 = sub_14290((char *)(v40 > 1), v41 + 1, 1, v38);
      *uint64_t v3 = v38;
    }
    *((void *)v38 + 2) = v41 + 1;
    *(void *)&v38[8 * v41 + 32] = a1;
    return swift_endAccess();
  }
  uint64_t v5 = *(void **)&(*v3)[8 * v4 + 24];
  uint64_t v43 = v3;
  v44 = a1 + 64;
  uint64_t v6 = 1 << a1[32];
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *((void *)a1 + 8);
  id v9 = (char **)v49;
  int64_t v45 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v10 << 6);
LABEL_9:
      uint64_t v14 = *((void *)a1 + 7);
      *(void *)&v46[0] = *(void *)(*((void *)a1 + 6) + 8 * v13);
      uint64_t v15 = *(void **)&v46[0];
      sub_25B98(v14 + 32 * v13, (uint64_t)v46 + 8);
      id v16 = v15;
      goto LABEL_28;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_52;
    }
    if (v17 < v45)
    {
      unint64_t v18 = *(void *)&v44[8 * v17];
      if (v18) {
        goto LABEL_13;
      }
      int64_t v19 = v10 + 2;
      ++v10;
      if (v17 + 1 < v45)
      {
        unint64_t v18 = *(void *)&v44[8 * v19];
        if (v18) {
          goto LABEL_16;
        }
        int64_t v10 = v17 + 1;
        if (v17 + 2 < v45)
        {
          unint64_t v18 = *(void *)&v44[8 * v17 + 16];
          if (v18)
          {
            v17 += 2;
LABEL_13:
            unint64_t v8 = (v18 - 1) & v18;
            unint64_t v13 = __clz(__rbit64(v18)) + (v17 << 6);
            int64_t v10 = v17;
            goto LABEL_9;
          }
          int64_t v19 = v17 + 3;
          int64_t v10 = v17 + 2;
          if (v17 + 3 < v45)
          {
            unint64_t v18 = *(void *)&v44[8 * v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v17 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  break;
                }
                if (v17 >= v45)
                {
                  int64_t v10 = v45 - 1;
                  goto LABEL_27;
                }
                unint64_t v18 = *(void *)&v44[8 * v17];
                ++v19;
                if (v18) {
                  goto LABEL_13;
                }
              }
              __break(1u);
LABEL_55:
              type metadata accessor for Key(0);
              uint64_t result = sub_3D9070();
              __break(1u);
              return result;
            }
LABEL_16:
            int64_t v17 = v19;
            goto LABEL_13;
          }
        }
      }
    }
LABEL_27:
    unint64_t v8 = 0;
    uint64_t v47 = 0;
    memset(v46, 0, sizeof(v46));
LABEL_28:
    sub_3CC82C((uint64_t)v46, (uint64_t)&v48);
    long long v20 = v48;
    if (!v48) {
      break;
    }
    sub_153A4(v49, v46);
    id v21 = v20;
    char v22 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = sub_3210C((uint64_t)v21);
    uint64_t v25 = v5[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26))
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    char v28 = v23;
    if (v5[3] >= v27)
    {
      if (v22)
      {
        if (v23) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_2FCC78();
        if (v28) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_2F9D80(v27, v22);
      unint64_t v29 = sub_3210C((uint64_t)v21);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_55;
      }
      unint64_t v24 = v29;
      if (v28)
      {
LABEL_5:
        id v11 = (_OWORD *)(v5[7] + 32 * v24);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        sub_153A4(v46, v11);
        goto LABEL_6;
      }
    }
    v5[(v24 >> 6) + 8] |= 1 << v24;
    *(void *)(v5[6] + 8 * v24) = v21;
    sub_153A4(v46, (_OWORD *)(v5[7] + 32 * v24));
    uint64_t v31 = v5[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_51;
    }
    v5[2] = v33;
    id v34 = v21;
LABEL_6:

    swift_bridgeObjectRelease();
  }
  swift_release();
  id v9 = v43;
  swift_beginAccess();
  a1 = *v43;
  char v35 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v43 = a1;
  if (v35) {
    goto LABEL_41;
  }
LABEL_53:
  a1 = sub_14290(0, *((void *)a1 + 2) + 1, 1, a1);
  void *v9 = a1;
LABEL_41:
  unint64_t v37 = *((void *)a1 + 2);
  unint64_t v36 = *((void *)a1 + 3);
  if (v37 >= v36 >> 1)
  {
    a1 = sub_14290((char *)(v36 > 1), v37 + 1, 1, a1);
    void *v9 = a1;
  }
  *((void *)a1 + 2) = v37 + 1;
  *(void *)&a1[8 * v37 + 32] = v5;
  return swift_endAccess();
}

void sub_3CBA28()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator);
  uint64_t v2 = v0 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack;
  swift_beginAccess();
  if (*(void *)(*(void *)v2 + 16))
  {
    id v3 = objc_allocWithZone((Class)NSAttributedString);
    id v4 = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    NSString v5 = sub_3D7D10();
    swift_bridgeObjectRelease();
    type metadata accessor for Key(0);
    sub_3CD984((unint64_t *)&qword_4A9510, type metadata accessor for Key);
    Class isa = sub_3D7BA0().super.isa;
    swift_bridgeObjectRelease();
    id v7 = [v3 initWithString:v5 attributes:isa];

    [v4 appendAttributedString:v7];
  }
  else
  {
    __break(1u);
  }
}

id sub_3CBB90()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack;
  swift_beginAccess();
  uint64_t v3 = *(void *)(*(void *)v2 + 16);
  if (!v3 || (uint64_t v4 = *(void *)(*(void *)v2 + 8 * v3 + 24), !*(void *)(v4 + 16)))
  {
    long long v11 = 0u;
    long long v12 = 0u;
LABEL_10:
    sub_32238((uint64_t)&v11);
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  NSString v5 = NSFontAttributeName;
  unint64_t v6 = sub_3210C((uint64_t)v5);
  if (v7)
  {
    sub_25B98(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v11);
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  swift_bridgeObjectRelease();
  if (!*((void *)&v12 + 1)) {
    goto LABEL_10;
  }
  sub_3D530(0, (unint64_t *)&qword_4C2420);
  if (swift_dynamicCast()) {
    return (id)v10;
  }
LABEL_11:
  id v9 = *(void **)(v1
                + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                + 16);

  return v9;
}

id sub_3CBCD8(int a1)
{
  uint64_t v2 = sub_3D5640();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  NSString v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = sub_3CBB90();
  id v7 = [v6 fontDescriptor];
  id v8 = [v7 fontDescriptorWithSymbolicTraits:[v7 symbolicTraits] | a1];
  if (v8
    && (id v9 = v8,
        type metadata accessor for AttributeName(0),
        sub_3CD984(&qword_4A94F0, type metadata accessor for AttributeName),
        Class isa = sub_3D7BA0().super.isa,
        id v11 = [v9 fontDescriptorByAddingAttributes:isa],
        v9,
        isa,
        v11))
  {
    [v6 pointSize];
    id v13 = [self fontWithDescriptor:v11 size:v12];

    return v13;
  }
  else
  {
    sub_3D55A0();
    id v15 = v6;
    id v16 = sub_3D5630();
    os_log_type_t v17 = sub_3D83D0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v30 = (uint64_t)v15;
      uint64_t v31 = v27;
      *(_DWORD *)uint64_t v18 = 138412546;
      os_log_t v26 = v16;
      uint64_t v28 = v3;
      uint64_t v29 = v2;
      int v19 = a1;
      id v20 = v15;
      sub_3D8930();
      *uint64_t v25 = v15;

      *(_WORD *)(v18 + 12) = 2080;
      LODWORD(v30) = v19;
      type metadata accessor for SymbolicTraits(0);
      uint64_t v21 = sub_3D7DC0();
      uint64_t v30 = sub_1FB7E8(v21, v22, &v31);
      sub_3D8930();
      swift_bridgeObjectRelease();
      os_log_t v23 = v26;
      _os_log_impl(&dword_0, v26, v17, "Font %@ does not support traits %s", (uint8_t *)v18, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B24C0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v28 + 8))(v5, v29);
      return v20;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    return v15;
  }
}

id sub_3CC660()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NqmlStringGenerator();
  return [super dealloc];
}

id sub_3CC750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_3D7D10();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_3D2170();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_3CC82C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C2430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_3CC894()
{
  uint64_t v1 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3)
    {
LABEL_3:
      uint64_t v4 = v3 - 1;
      uint64_t result = *(void *)(v1 + 8 * v4 + 32);
      *(void *)(v1 + 16) = v4;
      *uint64_t v0 = v1;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_23F6C(v1);
    uint64_t v1 = result;
    uint64_t v3 = *(void *)(result + 16);
    if (v3) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

id sub_3CC8F4(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v3 = @"font-name";
    uint64_t v4 = sub_32078(v3);
    if (v5)
    {
      id v6 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      swift_bridgeObjectRetain();

      uint64_t v39 = &type metadata for String;
      *(void *)&long long v38 = v8;
      *((void *)&v38 + 1) = v7;
      sub_153A4(&v38, v37);
      id v9 = UIFontDescriptorNameAttribute;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v36 = _swiftEmptyDictionarySingleton;
      sub_23BA8(v37, v9, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      id v11 = [objc_allocWithZone((Class)UIFontDescriptor) init];
      if (!*(void *)(a1 + 16)) {
        goto LABEL_23;
      }
    }
    else
    {

      id v11 = 0;
      if (!*(void *)(a1 + 16)) {
        goto LABEL_23;
      }
    }
    id v13 = @"font-size";
    uint64_t v14 = sub_32078(v13);
    if (v15)
    {
      id v16 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v14);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      swift_bridgeObjectRetain();

      *(void *)&v37[0] = 0;
      __chkstk_darwin(v19);
      if ((v17 & 0x1000000000000000) != 0 || !(v17 & 0x2000000000000000 | v18 & 0x1000000000000000))
      {
        sub_3D8BB0();
        swift_bridgeObjectRelease();
        if ((v36 & 1) == 0) {
          goto LABEL_23;
        }
LABEL_16:
        uint64_t v39 = &type metadata for CGFloat;
        *(void *)&long long v38 = *(void *)&v37[0];
        sub_153A4(&v38, v37);
        uint64_t v24 = UIFontDescriptorSizeAttribute;
        goto LABEL_24;
      }
      __chkstk_darwin(v20);
      if ((v17 & 0x2000000000000000) == 0)
      {
        if ((v18 & 0x1000000000000000) != 0)
        {
          uint64_t v21 = (v17 & 0xFFFFFFFFFFFFFFFLL) + 32;
          uint64_t v22 = v18 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v21 = sub_3D8C60();
        }
        char v23 = sub_245B0(v21, v22, (void (*)(uint64_t *__return_ptr))sub_3CD9E8);
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_16;
      }
      *(void *)&long long v38 = v18;
      *((void *)&v38 + 1) = v17 & 0xFFFFFFFFFFFFFFLL;
      BOOL v25 = v18 > 0x20u || ((1 << v18) & 0x100003E01) == 0;
      if (v25 && (uint64_t v33 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) != 0)
      {
        int v34 = *v33;
        swift_bridgeObjectRelease();
        if (!v34) {
          goto LABEL_16;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
    }
LABEL_23:
    uint64_t v24 = UIFontDescriptorSizeAttribute;
    [a2 pointSize];
    uint64_t v39 = &type metadata for CGFloat;
    *(void *)&long long v38 = v26;
    sub_153A4(&v38, v37);
LABEL_24:
    char v27 = swift_isUniquelyReferenced_nonNull_native();
    sub_23BA8(v37, v24, v27);

    swift_bridgeObjectRelease();
    if (_swiftEmptyDictionarySingleton[2])
    {
      if (v11) {
        id v28 = v11;
      }
      else {
        id v28 = [a2 fontDescriptor];
      }
      type metadata accessor for AttributeName(0);
      sub_3CD984(&qword_4A94F0, type metadata accessor for AttributeName);
      id v29 = v11;
      Class isa = sub_3D7BA0().super.isa;
      swift_bridgeObjectRelease();
      id v31 = [v28 fontDescriptorByAddingAttributes:isa];

      id v32 = [self fontWithDescriptor:v31 size:0.0];
      return v32;
    }
    else
    {
      swift_bridgeObjectRelease();

      return a2;
    }
  }

  return a2;
}

uint64_t sub_3CCDF4()
{
  uint64_t v0 = sub_3D5640();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3D55A0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = sub_3D5630();
  os_log_type_t v5 = sub_3D83F0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v11[0] = v0;
    uint64_t v7 = (uint8_t *)v6;
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v11[1] = v9;
    sub_3D8930();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v4, v5, "init(nqml:) could not fully parse string, reason: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B24C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v0 = v11[0];
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_3CD000(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  [*(id *)(v3 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator) beginEditing];
  switch(a1)
  {
    case 0:
      __swift_instantiateConcreteTypeFromMangledName(&qword_4C2460);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_3DED90;
      *(void *)(inited + 32) = UIFontDescriptorTraitsAttribute;
      __swift_instantiateConcreteTypeFromMangledName(&qword_4C2468);
      uint64_t v7 = swift_initStackObject();
      *(_OWORD *)(v7 + 16) = xmmword_3DED90;
      *(void *)(v7 + 32) = UIFontWeightTrait;
      *(UIFontWeight *)(v7 + 40) = UIFontWeightSemibold;
      uint64_t v8 = UIFontDescriptorTraitsAttribute;
      uint64_t v9 = UIFontWeightTrait;
      unint64_t v10 = sub_124A0(v7);
      *(void *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C2470);
      *(void *)(inited + 40) = v10;
      sub_11454(inited);
      id v11 = sub_3CBCD8(0);
      swift_bridgeObjectRelease();
      id v12 = sub_3CC8F4(a2, v11);

      __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
      uint64_t v13 = swift_initStackObject();
      uint64_t v14 = v13;
      long long v15 = xmmword_3DED90;
      goto LABEL_4;
    case 1:
      sub_11454((uint64_t)_swiftEmptyArrayStorage);
      id v16 = sub_3CBCD8(1);
      swift_bridgeObjectRelease();
      id v12 = sub_3CC8F4(a2, v16);

      __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
      uint64_t v13 = swift_initStackObject();
      uint64_t v14 = v13;
      long long v15 = xmmword_3DED90;
LABEL_4:
      *(_OWORD *)(v13 + 16) = v15;
      *(void *)(v13 + 32) = NSFontAttributeName;
      *(void *)(v14 + 64) = sub_3D530(0, (unint64_t *)&qword_4C2420);
      *(void *)(v14 + 40) = v12;
      uint64_t v17 = NSFontAttributeName;
      id v18 = v12;
      uint64_t v19 = (char *)sub_112FC(v14);
      sub_3CB594(v19);

      swift_bridgeObjectRelease();
      return;
    case 2:
      id v20 = sub_3CBB90();
      id v21 = sub_3CC8F4(a2, v20);

      __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
      uint64_t v22 = swift_initStackObject();
      uint64_t v23 = v22;
      long long v24 = xmmword_3DED20;
      BOOL v25 = &NSUnderlineStyleAttributeName;
      goto LABEL_7;
    case 3:
      id v26 = sub_3CBB90();
      id v21 = sub_3CC8F4(a2, v26);

      __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
      uint64_t v22 = swift_initStackObject();
      uint64_t v23 = v22;
      long long v24 = xmmword_3DED20;
      BOOL v25 = &NSStrikethroughStyleAttributeName;
LABEL_7:
      *(_OWORD *)(v22 + 16) = v24;
      NSAttributedStringKey v27 = *v25;
      *(NSAttributedStringKey *)(v22 + 32) = *v25;
      id v28 = objc_allocWithZone((Class)NSNumber);
      id v29 = v27;
      id v30 = [v28 initWithInteger:1];
      uint64_t v31 = sub_3D530(0, (unint64_t *)&qword_4AF0A0);
      *(void *)(v23 + 40) = v30;
      *(void *)(v23 + 64) = v31;
      *(void *)(v23 + 72) = NSFontAttributeName;
      *(void *)(v23 + 104) = sub_3D530(0, (unint64_t *)&qword_4C2420);
      *(void *)(v23 + 80) = v21;
      id v32 = NSFontAttributeName;
      goto LABEL_9;
    case 4:
      id v33 = sub_3CBB90();
      id v21 = sub_3CC8F4(a2, v33);

      __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + 16) = xmmword_3DED20;
      *(void *)(v23 + 32) = NSParagraphStyleAttributeName;
      int v34 = *(void **)(v3
                     + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                     + 24);
      uint64_t v35 = sub_3D530(0, (unint64_t *)&unk_4C2440);
      *(void *)(v23 + 40) = v34;
      *(void *)(v23 + 64) = v35;
      *(void *)(v23 + 72) = NSFontAttributeName;
      *(void *)(v23 + 104) = sub_3D530(0, (unint64_t *)&qword_4C2420);
      *(void *)(v23 + 80) = v21;
      unint64_t v36 = NSParagraphStyleAttributeName;
      id v37 = v34;
      long long v38 = NSFontAttributeName;
LABEL_9:
      id v39 = v21;
      unint64_t v40 = (char *)sub_112FC(v23);
      sub_3CB594(v40);

      swift_bridgeObjectRelease();
      break;
    case 5:
      uint64_t v41 = v3 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration;
      id v42 = sub_3CBCD8(0);
      id v43 = sub_3CC8F4(a2, v42);

      v44 = *(char **)(v41 + 56);
      uint64_t v53 = sub_3D530(0, (unint64_t *)&qword_4C2420);
      *(void *)&long long v52 = v43;
      sub_153A4(&v52, v51);
      swift_bridgeObjectRetain();
      int64_t v45 = NSFontAttributeName;
      id v46 = v43;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_23A64(v51, v45, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      if (qword_4A90C8 != -1) {
        swift_once();
      }
      v48 = (void *)qword_4C2360;
      uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4C2450);
      *(void *)&long long v52 = a2;
      sub_153A4(&v52, v51);
      id v49 = v48;
      swift_bridgeObjectRetain();
      char v50 = swift_isUniquelyReferenced_nonNull_native();
      sub_23A64(v51, v49, v50);

      swift_bridgeObjectRelease();
      sub_3CB594(v44);
      swift_bridgeObjectRelease();

      break;
    default:
      return;
  }
}

uint64_t sub_3CD5D4(uint64_t a1)
{
  if (a1 == 4) {
    sub_3CBA28();
  }
  uint64_t v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (!*(void *)(*v2 + 16))
  {
    __break(1u);
LABEL_8:
    uint64_t result = (uint64_t)sub_23F6C(v3);
    uint64_t v3 = result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
LABEL_6:
    *(void *)(v3 + 16) = v5 - 1;
    *uint64_t v2 = v3;
    swift_endAccess();
    swift_bridgeObjectRelease();
    return (uint64_t)[*(id *)(v1+ OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator) endEditing];
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_3CD6B4()
{
  id v0 = objc_allocWithZone((Class)NSMutableString);
  swift_bridgeObjectRetain();
  NSString v1 = sub_3D7D10();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithString:v1];

  if (qword_4A90B8 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)qword_4C2350;
  if (qword_4C2350)
  {
    id v4 = [v2 length];
    NSString v5 = sub_3D7D10();
    [v3 replaceMatchesInString:v2 options:0 range:0 withTemplate:v4 v5];
  }
  sub_3D7D50();
  sub_3CBA28();

  return swift_bridgeObjectRelease();
}

uint64_t sub_3CD7E4()
{
  [*(id *)(v0 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator) beginEditing];
  __swift_instantiateConcreteTypeFromMangledName(&qword_4AC4F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_3DED90;
  *(void *)(inited + 32) = NSParagraphStyleAttributeName;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_configuration
                + 48);
  *(void *)(inited + 64) = sub_3D530(0, (unint64_t *)&unk_4C2440);
  *(void *)(inited + 40) = v2;
  uint64_t v3 = NSParagraphStyleAttributeName;
  id v4 = v2;
  NSString v5 = (char *)sub_112FC(inited);
  sub_3CB594(v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_3CD8AC()
{
  sub_3CBA28();
  NSString v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_attributeStack);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (!*(void *)(*v1 + 16))
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_23F6C(v2);
    uint64_t v2 = result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
LABEL_4:
    *(void *)(v2 + 16) = v4 - 1;
    *NSString v1 = v2;
    swift_endAccess();
    swift_bridgeObjectRelease();
    return (uint64_t)[*(id *)(v0+ OBJC_IVAR____TtC8ShelfKitP33_04B892DBC0BBAEFCE9764D2FF13A23A619NqmlStringGenerator_accumulator) endEditing];
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_3CD984(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *sub_3CD9CC@<X0>(unsigned char *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_23F80(a1, a2);
}

void *sub_3CD9E8@<X0>(unsigned char *a1@<X8>)
{
  return sub_24610(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

unint64_t static FetchSearchEpisodeLockupsIntent.kind.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_3CDA20(uint64_t a1)
{
  unint64_t v2 = sub_3CDCF8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_3CDA5C(uint64_t a1)
{
  unint64_t v2 = sub_3CDCF8();

  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_3CDA98(void *a1@<X8>)
{
  *a1 = 0xD00000000000001FLL;
  a1[1] = 0x80000000003FBF50;
}

uint64_t FetchSearchEpisodeLockupsIntent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_4C2480);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_3CDCF8();
  sub_3D91F0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_4A9A78);
  sub_3CDDF8(&qword_4A9A80, &qword_4A9A78, (void (*)(void))sub_169A4);
  sub_3D8F50();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_3CDC44(void *a1)
{
  return FetchSearchEpisodeLockupsIntent.encode(to:)(a1);
}

uint64_t sub_3CDC5C()
{
  sub_1761E4();

  return sub_3D6C40();
}

uint64_t sub_3CDC98()
{
  return sub_3D75D0();
}

unint64_t sub_3CDCF8()
{
  unint64_t result = qword_4C2488;
  if (!qword_4C2488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C2488);
  }
  return result;
}

unint64_t sub_3CDD50()
{
  unint64_t result = qword_4C2490;
  if (!qword_4C2490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C2490);
  }
  return result;
}

uint64_t sub_3CDDA8()
{
  return sub_3CDDF8(&qword_4C2498, &qword_4A99D0, (void (*)(void))sub_3CDE64);
}

uint64_t sub_3CDDF8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_3CDE64()
{
  unint64_t result = qword_4AC0B8;
  if (!qword_4AC0B8)
  {
    type metadata accessor for LegacyEpisodeLockup();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4AC0B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for FetchSearchEpisodeLockupsIntent()
{
  return &type metadata for FetchSearchEpisodeLockupsIntent;
}

unsigned char *storeEnumTagSinglePayload for FetchSearchEpisodeLockupsIntent.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x3CDF68);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FetchSearchEpisodeLockupsIntent.CodingKeys()
{
  return &type metadata for FetchSearchEpisodeLockupsIntent.CodingKeys;
}

unint64_t sub_3CDFA4()
{
  unint64_t result = qword_4C24A0;
  if (!qword_4C24A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C24A0);
  }
  return result;
}

unint64_t sub_3CDFFC()
{
  unint64_t result = qword_4C24A8;
  if (!qword_4C24A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C24A8);
  }
  return result;
}

unint64_t sub_3CE054()
{
  unint64_t result = qword_4C24B0;
  if (!qword_4C24B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C24B0);
  }
  return result;
}

unint64_t sub_3CE0A8()
{
  unint64_t result = qword_4C24B8;
  if (!qword_4C24B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C24B8);
  }
  return result;
}

uint64_t dispatch thunk of ExpandableShelfItem.isExpanded.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ExpandableShelfItem.canToggleExpanded.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ExpandableShelfItem.toggleExpanded()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ExpandableShelfItem.collapse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t OverflowAction.model.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18168(v1 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_model, a1);
}

uint64_t OverflowAction.cellType.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_cellType);
}

uint64_t OverflowAction.objectGraph.getter()
{
  return swift_retain();
}

uint64_t OverflowAction.__allocating_init(model:cellType:asPartOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a1;
  uint64_t v23 = sub_3D2460();
  uint64_t v6 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_3D6F40();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v13 - 8);
  long long v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  sub_18168(a1, v16 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_model);
  *(void *)(v16 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_cellType) = a2;
  *(void *)(v16 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_objectGraph) = a3;
  uint64_t v17 = sub_3D7340();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  swift_retain();
  sub_3D6F00();
  sub_3D2450();
  uint64_t v18 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v23);
  *(void *)(v16 + 16) = v18;
  *(void *)(v16 + 24) = v20;
  *(void *)(v16 + 32) = 0;
  *(void *)(v16 + 40) = 0;
  *(unsigned char *)(v16 + 48) = 32;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v16 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v12, v9);
  sub_2A728((uint64_t)v15, v16 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v22);
  return v16;
}

uint64_t OverflowAction.init(model:cellType:asPartOf:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a1;
  uint64_t v24 = sub_3D2460();
  uint64_t v8 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_3D6F40();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18168(a1, v4 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_model);
  *(void *)(v4 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_cellType) = a2;
  *(void *)(v4 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_objectGraph) = a3;
  uint64_t v18 = sub_3D7340();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  swift_retain();
  sub_3D6F00();
  sub_3D2450();
  uint64_t v19 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
  *(void *)(v4 + 16) = v19;
  *(void *)(v4 + 24) = v21;
  *(void *)(v4 + 32) = 0;
  *(void *)(v4 + 40) = 0;
  *(unsigned char *)(v4 + 48) = 32;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v4 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v14, v11);
  sub_2A728((uint64_t)v17, v4 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v23);
  return v4;
}

void OverflowAction.init(deserializing:using:)()
{
}

void OverflowAction.init(uniqueId:title:presentationStyle:actionMetrics:impressionMetrics:)()
{
}

uint64_t sub_3CE758()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_model);

  return swift_release();
}

uint64_t OverflowAction.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  uint64_t v2 = sub_3D6F40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2A790(v0 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_model);
  swift_release();
  return v0;
}

uint64_t OverflowAction.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  uint64_t v2 = sub_3D6F40();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_2A790(v0 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8ShelfKit14OverflowAction_model);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t sub_3CE92C()
{
  return type metadata accessor for OverflowAction();
}

uint64_t type metadata accessor for OverflowAction()
{
  uint64_t result = qword_4C24E8;
  if (!qword_4C24E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3CE980()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for OverflowAction(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for OverflowAction);
}

uint64_t dispatch thunk of OverflowAction.__allocating_init(model:cellType:asPartOf:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t FindShowEpisodesIntentImplementation.perform(_:objectGraph:)(uint64_t a1)
{
  uint64_t v3 = sub_3D86C0();
  *(void *)(v1 + 32) = v3;
  *(void *)(v1 + 40) = *(void *)(v3 - 8);
  *(void *)(v1 + 48) = swift_task_alloc();
  uint64_t v4 = sub_3D81A0();
  *(void *)(v1 + 56) = v4;
  *(void *)(v1 + 64) = *(void *)(v4 - 8);
  *(void *)(v1 + 72) = swift_task_alloc();
  *(_OWORD *)(v1 + 80) = *(_OWORD *)(a1 + 24);
  *(unsigned char *)(v1 + 176) = *(unsigned char *)(a1 + 40);
  *(void *)(v1 + 96) = *(void *)(a1 + 48);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_4AFF70);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 104) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_3CEBA4;
  return BaseObjectGraph.inject<A>(_:)(v1 + 16, v5, v5);
}

uint64_t sub_3CEBA4()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_3CF360;
  }
  else {
    uint64_t v2 = sub_3CECB8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_3CECB8()
{
  v0[15] = v0[2];
  uint64_t ObjectType = swift_getObjectType();
  sub_F1058();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[16] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_3CED80;
  uint64_t v3 = v0[9];
  return NSManagedObjectContextProvider.managedObjectContext(for:)(v3, ObjectType);
}

uint64_t sub_3CED80(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 136) = a1;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return _swift_task_switch(sub_3CEEFC, 0, 0);
}

uint64_t sub_3CEEFC()
{
  char v1 = *(unsigned char *)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 80);
  sub_3D7D50();
  id v3 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v4 = sub_3D7D10();
  swift_bridgeObjectRelease();
  id v5 = [v3 initWithEntityName:v4];
  *(void *)(v0 + 144) = v5;

  id v6 = [v5 setPredicate:v2];
  if ((v1 & 1) == 0)
  {
    unint64_t v10 = *(void *)(v0 + 88);
    if ((v10 & 0x8000000000000000) != 0)
    {
      __break(1u);
      return NSManagedObjectContext.perform<A>(schedule:_:)(v6, v7, v10, v8, v9);
    }
    [v5 setFetchLimit:];
  }
  if (*(void *)(v0 + 96))
  {
    sub_3D530(0, (unint64_t *)&qword_4B85F0);
    v11.super.Class isa = sub_3D8010().super.isa;
  }
  else
  {
    v11.super.Class isa = 0;
  }
  uint64_t v12 = *(void **)(v0 + 136);
  uint64_t v14 = *(void *)(v0 + 40);
  uint64_t v13 = *(void *)(v0 + 48);
  uint64_t v15 = *(void *)(v0 + 32);
  [v5 setSortDescriptors:v11.super.isa];

  [v5 setResultType:1];
  uint64_t v16 = swift_allocObject();
  *(void *)(v0 + 152) = v16;
  *(void *)(v16 + 16) = v12;
  *(void *)(v16 + 24) = v5;
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for NSManagedObjectContext.ScheduledTaskType.immediate(_:), v15);
  id v17 = v12;
  id v18 = v5;
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v19;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_4B0F50);
  *uint64_t v19 = v0;
  v19[1] = sub_3CF13C;
  uint64_t v7 = *(void *)(v0 + 48);
  unint64_t v10 = (unint64_t)sub_3CF69C;
  id v6 = (id)(v0 + 24);
  uint64_t v8 = v16;
  return NSManagedObjectContext.perform<A>(schedule:_:)(v6, v7, v10, v8, v9);
}

uint64_t sub_3CF13C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  uint64_t v3 = *(void *)(*(void *)v1 + 40);
  uint64_t v4 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  if (v0) {
    id v5 = sub_3CF3D0;
  }
  else {
    id v5 = sub_3CF2D0;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_3CF2D0()
{
  uint64_t v1 = *(void **)(v0 + 144);

  uint64_t v2 = *(void *)(v0 + 24);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_3CF360()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_3CF3D0()
{
  uint64_t v1 = *(void **)(v0 + 144);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_3CF44C@<X0>(void *a1@<X8>)
{
  sub_3D530(0, (unint64_t *)&unk_4BE970);
  unint64_t result = sub_3D86D0();
  if (v1) {
    return result;
  }
  unint64_t v4 = result;
  if (!(result >> 62))
  {
    uint64_t v5 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v5) {
      goto LABEL_4;
    }
LABEL_17:
    unint64_t result = swift_bridgeObjectRelease();
    *a1 = _swiftEmptyArrayStorage;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_3D8D90();
  swift_bridgeObjectRelease();
  if (!v5) {
    goto LABEL_17;
  }
LABEL_4:
  unint64_t result = sub_1FC0CC(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    if ((v4 & 0xC000000000000001) != 0)
    {
      uint64_t v6 = 0;
      do
      {
        uint64_t v7 = sub_3D8BF0();
        unint64_t v9 = _swiftEmptyArrayStorage[2];
        unint64_t v8 = _swiftEmptyArrayStorage[3];
        if (v9 >= v8 >> 1) {
          sub_1FC0CC(v8 > 1, v9 + 1, 1);
        }
        ++v6;
        _swiftEmptyArrayStorage[2] = v9 + 1;
        unint64_t v10 = &_swiftEmptyArrayStorage[3 * v9];
        v10[4] = v7;
        v10[5] = 0;
        *((unsigned char *)v10 + 48) = 1;
      }
      while (v5 != v6);
    }
    else
    {
      uint64_t v11 = 0;
      do
      {
        unint64_t v12 = _swiftEmptyArrayStorage[2];
        unint64_t v13 = _swiftEmptyArrayStorage[3];
        id v14 = *(id *)(v4 + 8 * v11 + 32);
        if (v12 >= v13 >> 1) {
          sub_1FC0CC(v13 > 1, v12 + 1, 1);
        }
        ++v11;
        _swiftEmptyArrayStorage[2] = v12 + 1;
        uint64_t v15 = &_swiftEmptyArrayStorage[3 * v12];
        v15[4] = v14;
        v15[5] = 0;
        *((unsigned char *)v15 + 48) = 1;
      }
      while (v5 != v11);
    }
    unint64_t result = swift_bridgeObjectRelease();
    *a1 = _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_3CF65C()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_3CF69C@<X0>(void *a1@<X8>)
{
  return sub_3CF44C(a1);
}

unint64_t sub_3CF6BC()
{
  unint64_t result = qword_4C25E0;
  if (!qword_4C25E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4C25E0);
  }
  return result;
}

uint64_t sub_3CF710(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *unint64_t v4 = v2;
  v4[1] = sub_ABBFC;
  return FindShowEpisodesIntentImplementation.perform(_:objectGraph:)(a2);
}

ValueMetadata *type metadata accessor for FindShowEpisodesIntentImplementation()
{
  return &type metadata for FindShowEpisodesIntentImplementation;
}

uint64_t EntitlementsActionProviding.entitlementsAction.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 8))();
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  id v8 = [self currentTraitCollection];
  char v9 = sub_3D85B0();

  int v10 = [self isRunningOnVisionOS];
  id v11 = objc_allocWithZone((Class)LSApplicationRecord);
  swift_bridgeObjectRetain();
  id v12 = sub_3D1518(v6, v7, 0);
  if (v12)
  {

    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  uint64_t v14 = sub_3CF958(v9 & 1, v10, v13, v6, v7, a1, a2);
  if (!v14)
  {
    uint64_t v14 = sub_3D0458(v9 & 1, v13, v6, v7, a1, a2);
    if (!v14) {
      uint64_t v14 = sub_3D0D64(v9 & 1, v13, v6, v7, a1, a2);
    }
  }
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_3CF958(char a1, int a2, int a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v75 = a7;
  uint64_t v74 = a6;
  uint64_t v76 = a4;
  LODWORD(v77) = a3;
  LODWORD(v78) = a2;
  uint64_t v72 = sub_3D6F40();
  uint64_t v71 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  v73 = &v68[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for FlowDestination();
  __chkstk_darwin(v10);
  id v12 = (uint64_t *)&v68[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = sub_3D5640();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = &v68[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  uint64_t v19 = &v68[-v18];
  __chkstk_darwin(v20);
  uint64_t v22 = &v68[-v21];
  if ((a1 & 1) != 0
    || (v78 & 1) != 0
    || (v77 & 1) != 0
    || (uint64_t v23 = sub_3D3610(),
        v81[3] = v23,
        v81[4] = sub_111304(),
        boxed_opaque_existential_2Tm = __swift_allocate_boxed_opaque_existential_2Tm(v81),
        (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v23 - 8) + 104))(boxed_opaque_existential_2Tm, enum case for Podcasts.inAppProductPage(_:), v23), LOBYTE(v23) = sub_3D3580(), __swift_destroy_boxed_opaque_existential_1((uint64_t)v81), (v23 & 1) == 0))
  {
    sub_3D5620();
    swift_bridgeObjectRetain_n();
    int v34 = sub_3D5630();
    os_log_type_t v35 = sub_3D8410();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      v81[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315906;
      swift_bridgeObjectRetain();
      *(void *)v80 = sub_1FB7E8(v76, a5, v81);
      uint64_t v70 = v13;
      sub_3D8930();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 1024;
      *(_DWORD *)v80 = a1 & 1;
      sub_3D8930();
      *(_WORD *)(v36 + 18) = 1024;
      *(_DWORD *)v80 = v78 & 1;
      sub_3D8930();
      *(_WORD *)(v36 + 24) = 1024;
      *(_DWORD *)v80 = v77 & 1;
      sub_3D8930();
      _os_log_impl(&dword_0, v34, v35, "Not displaying SKStoreProductViewController for bundleID: %s - isMac: %{BOOL}d, isVisionOS: %{BOOL}d, applicationIsInstalled: %{BOOL}d", (uint8_t *)v36, 0x1Eu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v16, v70);
      return 0;
    }

    swift_bridgeObjectRelease_n();
    id v37 = *(void (**)(unsigned char *, uint64_t))(v14 + 8);
    long long v38 = v16;
LABEL_11:
    v37(v38, v13);
    return 0;
  }
  uint64_t v25 = (*(uint64_t (**)(uint64_t))(v75 + 16))(v74);
  if (v26)
  {
    sub_3D5620();
    swift_bridgeObjectRetain_n();
    uint64_t v41 = sub_3D5630();
    os_log_type_t v42 = sub_3D83F0();
    if (os_log_type_enabled(v41, v42))
    {
      id v43 = (uint8_t *)swift_slowAlloc();
      v81[0] = swift_slowAlloc();
      *(_DWORD *)id v43 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)v80 = sub_1FB7E8(v76, a5, v81);
      sub_3D8930();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v41, v42, "Cannot display SKStoreProductViewController because we don't have the adamID of the app. bundleID: %s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v19, v13);
      return 0;
    }

    swift_bridgeObjectRelease_n();
    id v37 = *(void (**)(unsigned char *, uint64_t))(v14 + 8);
    long long v38 = v19;
    goto LABEL_11;
  }
  uint64_t v27 = v25;
  uint64_t v70 = v13;
  sub_3D5620();
  swift_bridgeObjectRetain_n();
  id v28 = sub_3D5630();
  os_log_type_t v29 = sub_3D8410();
  int v30 = v29;
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    v81[0] = v78;
    *(_DWORD *)uint64_t v31 = 136316162;
    *(void *)v80 = v27;
    sub_17264();
    int v69 = v30;
    uint64_t v32 = sub_3D8A20();
    *(void *)v80 = sub_1FB7E8(v32, v33, v81);
    uint64_t v77 = v14;
    sub_3D8930();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)v80 = sub_1FB7E8(v76, a5, v81);
    sub_3D8930();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 22) = 1024;
    *(_DWORD *)v80 = 0;
    sub_3D8930();
    *(_WORD *)(v31 + 28) = 1024;
    *(_DWORD *)v80 = 0;
    sub_3D8930();
    *(_WORD *)(v31 + 34) = 1024;
    *(_DWORD *)v80 = 0;
    sub_3D8930();
    _os_log_impl(&dword_0, v28, (os_log_type_t)v69, "Creating FlowAction to display SKStoreProductViewController for appAdamID: %s - bundleID: %s, isMac: %{BOOL}d, isVisionOS: %{BOOL}d, applicationIsInstalled: %{BOOL}d", (uint8_t *)v31, 0x28u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v77 + 8))(v22, v70);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(unsigned char *, uint64_t))(v14 + 8))(v22, v70);
  }
  uint64_t v44 = v74;
  uint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v75 + 24))(v74, v75);
  uint64_t *v12 = v27;
  v12[1] = v45;
  v12[2] = v46;
  swift_storeEnumTagMultiPayload();
  LOBYTE(v81[0]) = 0;
  v80[0] = 0;
  uint64_t v47 = (uint64_t)v73;
  sub_3D6F00();
  type metadata accessor for FlowAction(0);
  swift_allocObject();
  uint64_t v39 = FlowAction.init(_:id:title:presentationContext:animationBehavior:presentationStyle:destinationPageHeader:actionMetrics:)((uint64_t)v12, 0, 0, 0, 0, (char *)v81, 0, 48, v80, v47);
  uint64_t v48 = sub_3D1310(v44);
  if (!v48) {
    return v39;
  }
  uint64_t v49 = v48 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  swift_beginAccess();
  uint64_t v50 = v71;
  v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16);
  uint64_t v52 = v72;
  v51(v47, v49, v72);
  uint64_t v53 = v39 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  swift_beginAccess();
  v54 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 40);
  swift_retain();
  v54(v53, v47, v52);
  swift_endAccess();
  swift_release();
  v51(v47, v53, v52);
  uint64_t v55 = sub_3D6F30();
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v47, v52);
  uint64_t v56 = *(void *)(v55 + 16);
  swift_bridgeObjectRelease();
  if (!v56)
  {
    swift_release();
    return v39;
  }
  swift_retain();
  uint64_t v57 = sub_3D3930();
  uint64_t v59 = v58;
  uint64_t v60 = sub_3D47E0();
  uint64_t v62 = v61;
  swift_beginAccess();
  v63 = (void (*)(uint64_t *, void))sub_3D6F20();
  v65 = v64;
  unint64_t v66 = *v64;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  void *v65 = v66;
  if (result)
  {
    if (*(void *)(v66 + 16))
    {
LABEL_21:
      sub_3D6D80();
      v67 = (void (*)(char *, void))sub_3D6D70();
      v79[3] = &type metadata for String;
      v79[0] = v60;
      v79[1] = v62;
      sub_23FEC((uint64_t)v79, v57, v59);
      v67(v80, 0);
      v63(v81, 0);
      swift_endAccess();
      swift_release();
      swift_release();
      return v39;
    }
  }
  else
  {
    uint64_t result = sub_23CEC(v66);
    void *v65 = result;
    if (*(void *)(result + 16)) {
      goto LABEL_21;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_3D0458(uint64_t a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v65 = a6;
  uint64_t v7 = a5;
  uint64_t v62 = a3;
  LODWORD(v66) = a2;
  char v9 = a1;
  uint64_t v10 = *(void *)(a5 - 8);
  __chkstk_darwin(a1);
  id v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_3D6F40();
  uint64_t v60 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_3D5640();
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v56 - v19;
  if ((v9 & 1) != 0 || (v66 & 1) == 0 || (uint64_t v21 = (*(uint64_t (**)(uint64_t, __n128))(v65 + 32))(v7, v18), !v22))
  {
LABEL_8:
    sub_3D5620();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v6, v7);
    swift_bridgeObjectRetain_n();
    id v28 = sub_3D5630();
    os_log_type_t v29 = sub_3D8410();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      uint64_t v61 = swift_slowAlloc();
      v68[0] = v61;
      *(_DWORD *)uint64_t v30 = 136315650;
      swift_bridgeObjectRetain();
      v69[0] = sub_1FB7E8(v62, a4, v68);
      sub_3D8930();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 12) = 1024;
      LODWORD(v69[0]) = v66 & 1;
      sub_3D8930();
      *(_WORD *)(v30 + 18) = 2080;
      v69[0] = (*(uint64_t (**)(uint64_t))(v65 + 32))(v7);
      v69[1] = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_4AB608);
      uint64_t v32 = sub_3D7DC0();
      v69[0] = sub_1FB7E8(v32, v33, v68);
      sub_3D8930();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v7);
      _os_log_impl(&dword_0, v28, v29, "Not creating ExternalUrlAction for deeplink into offer for bundleID: %s - applicationIsInstalled: %{BOOL}d, externalAppOfferDeeplink: %s", (uint8_t *)v30, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v7);
    }

    (*(void (**)(char *, uint64_t))(v63 + 8))(v16, v64);
    return 0;
  }
  unint64_t v23 = v22;
  uint64_t v59 = v6;
  uint64_t v24 = v21;
  type metadata accessor for ExternalUrlAction();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t v57 = v24;
  uint64_t v58 = ExternalUrlAction.init(title:urlString:isSensitive:presentationStyle:requiresSignedInUser:)(0, 0, v24, v23, 0, 0, 1);
  if (!v58)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = v59;
    goto LABEL_8;
  }
  sub_3D5620();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_3D5630();
  os_log_type_t v26 = sub_3D8410();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    v69[0] = v56;
    *(_DWORD *)uint64_t v27 = 136315650;
    swift_bridgeObjectRetain();
    v68[0] = sub_1FB7E8(v62, a4, v69);
    uint64_t v66 = v7;
    sub_3D8930();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 1024;
    LODWORD(v68[0]) = 1;
    sub_3D8930();
    *(_WORD *)(v27 + 18) = 2080;
    swift_bridgeObjectRetain();
    v68[0] = sub_1FB7E8(v57, v23, v69);
    uint64_t v7 = v66;
    sub_3D8930();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v25, v26, "Creating ExternalUrlAction for deeplink into offer for bundleID: %s - applicationIsInstalled: %{BOOL}d, externalAppOfferDeeplink: %s", (uint8_t *)v27, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v63 + 8))(v20, v64);
  int v34 = v58;
  uint64_t v36 = sub_3D1310(v7);
  if (!v36) {
    return (uint64_t)v34;
  }
  uint64_t v37 = v36 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  swift_beginAccess();
  uint64_t v38 = v60;
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
  uint64_t v40 = v61;
  v39(v14, v37, v61);
  uint64_t v41 = (char *)v34 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  swift_beginAccess();
  os_log_type_t v42 = *(void (**)(char *, char *, uint64_t))(v38 + 40);
  swift_retain();
  v42(v41, v14, v40);
  swift_endAccess();
  swift_release();
  v39(v14, (uint64_t)v41, v40);
  uint64_t v43 = sub_3D6F30();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v14, v40);
  uint64_t v44 = *(void *)(v43 + 16);
  swift_bridgeObjectRelease();
  if (!v44)
  {
    swift_release();
    return (uint64_t)v34;
  }
  swift_retain();
  uint64_t v45 = sub_3D3930();
  uint64_t v47 = v46;
  uint64_t v48 = sub_3D47D0();
  uint64_t v50 = v49;
  swift_beginAccess();
  v51 = (void (*)(uint64_t *, void))sub_3D6F20();
  uint64_t v53 = v52;
  unint64_t v54 = *v52;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v53 = v54;
  if (result)
  {
    if (*(void *)(v54 + 16))
    {
LABEL_18:
      sub_3D6D80();
      uint64_t v55 = (void (*)(uint64_t *, void))sub_3D6D70();
      v67[3] = &type metadata for String;
      v67[0] = v48;
      v67[1] = v50;
      sub_23FEC((uint64_t)v67, v45, v47);
      v55(v68, 0);
      v51(v69, 0);
      swift_endAccess();
      swift_release();
      swift_release();
      return (uint64_t)v34;
    }
  }
  else
  {
    uint64_t result = sub_23CEC(v54);
    *uint64_t v53 = result;
    if (*(void *)(result + 16)) {
      goto LABEL_18;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_3D0D64(char a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v54 = a4;
  uint64_t v53 = a3;
  uint64_t v11 = sub_3D2460();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v51[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_3D6F40();
  uint64_t v56 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v16 = &v51[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4B9870);
  __n128 v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = &v51[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a6 + 40);
  uint64_t v55 = v6;
  if ((v21(a5, a6, v18) & 1) != 0 || (a1 & 1) != 0 || (a2 & 1) == 0)
  {
    uint64_t v22 = sub_3D1310(a5);
    uint64_t v30 = v57;
    if ((a2 & 1) == 0) {
      return v22;
    }
  }
  else
  {
    int v52 = a2;
    type metadata accessor for OpenExternalAppAction();
    uint64_t v22 = swift_allocObject();
    unint64_t v23 = (void *)(v22 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_bundleId);
    uint64_t v24 = v54;
    *unint64_t v23 = v53;
    v23[1] = v24;
    *(unsigned char *)(v22 + OBJC_IVAR____TtC8ShelfKit21OpenExternalAppAction_requiresSignedInUser) = 1;
    uint64_t v25 = sub_3D7340();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v20, 1, 1, v25);
    swift_bridgeObjectRetain();
    sub_3D6F00();
    sub_3D2450();
    uint64_t v26 = _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0();
    uint64_t v28 = v27;
    (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
    *(void *)(v22 + 16) = v26;
    *(void *)(v22 + 24) = v28;
    *(void *)(v22 + 32) = 0;
    *(void *)(v22 + 40) = 0;
    *(unsigned char *)(v22 + 48) = 32;
    uint64_t v29 = v56;
    uint64_t v30 = v57;
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v56 + 32))(v22 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics, v16, v57);
    sub_2A728((uint64_t)v20, v22 + OBJC_IVAR____TtC8ShelfKit6Action_impressionMetrics);
    uint64_t v31 = sub_3D1310(a5);
    if (v31)
    {
      uint64_t v32 = v31 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
      swift_beginAccess();
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v29 + 16))(v16, v32, v30);
      uint64_t v33 = v22 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
      swift_beginAccess();
      int v34 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v29 + 40);
      swift_retain();
      v34(v33, v16, v30);
      swift_endAccess();
      swift_release();
      swift_release();
    }
    if ((v52 & 1) == 0) {
      return v22;
    }
  }
  if (!v22) {
    return v22;
  }
  uint64_t v35 = v22 + OBJC_IVAR____TtC8ShelfKit6Action_actionMetrics;
  swift_beginAccess();
  uint64_t v36 = v56;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v56 + 16))(v16, v35, v30);
  swift_retain();
  uint64_t v37 = sub_3D6F30();
  (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v16, v30);
  uint64_t v38 = *(void *)(v37 + 16);
  swift_bridgeObjectRelease();
  if (!v38)
  {
LABEL_14:
    swift_release();
    return v22;
  }
  uint64_t v39 = sub_3D3930();
  uint64_t v41 = v40;
  uint64_t v42 = sub_3D47D0();
  uint64_t v44 = v43;
  swift_beginAccess();
  uint64_t v45 = (void (*)(unsigned char *, void))sub_3D6F20();
  uint64_t v47 = v46;
  unint64_t v48 = *v46;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v47 = v48;
  if (result)
  {
    if (*(void *)(v48 + 16))
    {
LABEL_13:
      sub_3D6D80();
      uint64_t v50 = (void (*)(unsigned char *, void))sub_3D6D70();
      v58[3] = &type metadata for String;
      v58[0] = v42;
      v58[1] = v44;
      sub_23FEC((uint64_t)v58, v39, v41);
      v50(v59, 0);
      v45(v60, 0);
      swift_endAccess();
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t result = sub_23CEC(v48);
    *uint64_t v47 = result;
    if (*(void *)(result + 16)) {
      goto LABEL_13;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_3D1310(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  unint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v8 = (char *)&v18 - v7;
  __n128 v10 = __chkstk_darwin(v9);
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16);
  v11((char *)&v18 - v12, v1, a1, v10);
  type metadata accessor for UpsellBanner();
  if (swift_dynamicCast())
  {
    uint64_t v13 = v19;
    uint64_t v14 = &OBJC_IVAR____TtC8ShelfKit12UpsellBanner_action;
LABEL_7:
    uint64_t v16 = *(void *)&v13[*v14];
    swift_retain();
    swift_release();
    return v16;
  }
  ((void (*)(char *, uint64_t, uint64_t))v11)(v8, v1, a1);
  type metadata accessor for UpsellInformation();
  if (!swift_dynamicCast())
  {
    ((void (*)(char *, uint64_t, uint64_t))v11)(v5, v1, a1);
    type metadata accessor for ShowHeader();
    if (!swift_dynamicCast()) {
      return 0;
    }
    uint64_t v13 = v19;
    uint64_t v14 = &OBJC_IVAR____TtC8ShelfKit10ShowHeader_secondaryButtonAction;
    goto LABEL_7;
  }
  uint64_t v15 = v19;
  uint64_t v16 = *(void *)&v19[OBJC_IVAR____TtC8ShelfKit17UpsellInformation_externalUrlAction];
  swift_retain();

  return v16;
}

id sub_3D1518(uint64_t a1, uint64_t a2, char a3)
{
  NSString v5 = sub_3D7D10();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithBundleIdentifier:v5 allowPlaceholder:a3 & 1 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    sub_3D2170();

    swift_willThrow();
  }
  return v6;
}

uint64_t dispatch thunk of EntitlementsActionProviding.appBundleId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EntitlementsActionProviding.appAdamID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EntitlementsActionProviding.customProductPageID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of EntitlementsActionProviding.externalAppOfferDeeplink.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of EntitlementsActionProviding.isForFirstPartyApp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_3D1678()
{
  return sub_3D75D0();
}

uint64_t sub_3D1708()
{
  return sub_3D75D0();
}

uint64_t sub_3D1798()
{
  return sub_3D75D0();
}

uint64_t sub_3D1828()
{
  return sub_3D75D0();
}

uint64_t sub_3D18B8()
{
  return sub_3D75D0();
}

uint64_t sub_3D1948()
{
  return sub_3D75D0();
}

uint64_t sub_3D19D8()
{
  return sub_3D75D0();
}

uint64_t sub_3D1A68()
{
  return sub_3D75D0();
}

uint64_t sub_3D1AF8()
{
  return sub_3D75D0();
}

uint64_t sub_3D1B88()
{
  return sub_3D75D0();
}

uint64_t sub_3D1C18(uint64_t a1, uint64_t a2)
{
  return sub_57140(a1, a2);
}

uint64_t sub_3D1C30(uint64_t a1, uint64_t a2)
{
  return sub_569E0(a1, a2);
}

uint64_t sub_3D1C48(uint64_t a1, uint64_t a2)
{
  return sub_56FD0(a1, a2);
}

uint64_t sub_3D1C60(uint64_t a1, uint64_t a2)
{
  return sub_57088(a1, a2);
}

uint64_t sub_3D1C78(uint64_t a1, uint64_t a2)
{
  return sub_56F18(a1, a2);
}

uint64_t sub_3D1C90(uint64_t a1, uint64_t a2)
{
  return sub_56A3C(a1, a2);
}

uint64_t sub_3D1CA8(uint64_t a1, uint64_t a2)
{
  return sub_5702C(a1, a2);
}

uint64_t sub_3D1CC0(uint64_t a1, uint64_t a2)
{
  return sub_570E4(a1, a2);
}

uint64_t sub_3D1CD8(uint64_t a1, uint64_t a2)
{
  return sub_56F74(a1, a2);
}

uint64_t sub_3D1CF0(uint64_t a1, uint64_t a2)
{
  return sub_5719C(a1, a2);
}

uint64_t sub_3D1D08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3D1D50()
{
  return type metadata accessor for AppEntityVisualState();
}

uint64_t sub_3D1D60()
{
  return EntityIdentifier.init<A>(for:identifier:)();
}

uint64_t sub_3D1D70()
{
  return type metadata accessor for EntityIdentifier();
}

uint64_t sub_3D1D80()
{
  return NSNotFound.getter();
}

uint64_t sub_3D1D90()
{
  return URLRequest.httpMethod.setter();
}

uint64_t sub_3D1DA0()
{
  return URLRequest.cachePolicy.setter();
}

Class sub_3D1DB0()
{
  return URLRequest._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_3D1DC0()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D1DD0()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t sub_3D1DE0()
{
  return URLRequest.url.getter();
}

uint64_t sub_3D1DF0()
{
  return URLRequest.httpBody.setter();
}

void sub_3D1E00(Swift::String_optional _, Swift::String forHTTPHeaderField)
{
}

uint64_t sub_3D1E10()
{
  return type metadata accessor for URLRequest();
}

uint64_t sub_3D1E20()
{
  return static FormatStyle.list<A>(type:width:)();
}

uint64_t sub_3D1E30()
{
  return static FormatStyle<>.time(pattern:)();
}

uint64_t sub_3D1E40()
{
  return static FormatStyle<>.units(allowed:width:maximumUnitCount:zeroValueUnits:valueLength:fractionalPart:)();
}

uint64_t sub_3D1E50()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t sub_3D1E60()
{
  return dispatch thunk of JSONDecoder.userInfo.setter();
}

uint64_t sub_3D1E70()
{
  return dispatch thunk of JSONDecoder.__allocating_init()();
}

uint64_t sub_3D1E80()
{
  return JSONDecoder.init()();
}

uint64_t sub_3D1E90()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t sub_3D1EA0()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t sub_3D1EB0()
{
  return dispatch thunk of JSONEncoder.userInfo.setter();
}

uint64_t sub_3D1EC0()
{
  return dispatch thunk of JSONEncoder.__allocating_init()();
}

uint64_t sub_3D1ED0()
{
  return JSONEncoder.init()();
}

uint64_t sub_3D1EE0()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t sub_3D1EF0()
{
  return static CharacterSet.whitespaces.getter();
}

NSCharacterSet sub_3D1F00()
{
  return CharacterSet._bridgeToObjectiveC()();
}

uint64_t sub_3D1F10()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_3D1F20()
{
  return CharacterSet.inverted.getter();
}

uint64_t sub_3D1F30()
{
  return static CharacterSet.newlines.getter();
}

uint64_t sub_3D1F40()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_3D1F50()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D1F60()
{
  return type metadata accessor for Notification();
}

uint64_t sub_3D1F70()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_3D1F80()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_3D1F90()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_3D1FA0()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_3D1FB0()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_3D1FC0()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_3D1FD0()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_3D1FE0()
{
  return URLComponents.url.getter();
}

uint64_t sub_3D1FF0()
{
  return URLComponents.init(string:)();
}

uint64_t sub_3D2000()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_3D2010()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_3D2020()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_3D2030()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_3D2040()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_3D2050()
{
  return AttributedString.init(_:)();
}

uint64_t sub_3D2060(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_3D2070()
{
  return IntegerFormatStyle.init(locale:)();
}

uint64_t sub_3D2080()
{
  return IntegerFormatStyle.locale(_:)();
}

uint64_t sub_3D2090()
{
  return IntegerFormatStyle.notation(_:)();
}

uint64_t sub_3D20A0()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t sub_3D20B0()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t sub_3D20C0()
{
  return PersonNameComponents.familyName.setter();
}

Class sub_3D20D0()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_3D20E0()
{
  return PersonNameComponents.init()();
}

uint64_t sub_3D20F0()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_3D2160()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_3D2170()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_3D2180()
{
  return LocalizedStringResource.init(stringInterpolation:)();
}

uint64_t sub_3D2190()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_3D21A0()
{
  return FloatingPointFormatStyle.init(locale:)();
}

uint64_t sub_3D21B0()
{
  return FloatingPointFormatStyle.locale(_:)();
}

uint64_t sub_3D21C0()
{
  return FloatingPointFormatStyle.grouping(_:)();
}

uint64_t sub_3D21D0()
{
  return FloatingPointFormatStyle.precision(_:)();
}

uint64_t sub_3D21E0()
{
  return type metadata accessor for FloatingPointFormatStyle();
}

uint64_t sub_3D21F0()
{
  return static NumberFormatStyleConfiguration.Grouping.automatic.getter();
}

uint64_t sub_3D2200()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Grouping();
}

uint64_t sub_3D2210()
{
  return static NumberFormatStyleConfiguration.Notation.compactName.getter();
}

uint64_t sub_3D2220()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Notation();
}

uint64_t sub_3D2230()
{
  return static NumberFormatStyleConfiguration.Precision.integerAndFractionLength(integer:fraction:)();
}

uint64_t sub_3D2240()
{
  return type metadata accessor for NumberFormatStyleConfiguration.Precision();
}

uint64_t sub_3D2250()
{
  return _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)();
}

uint64_t sub_3D2260()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_3D2270()
{
  return URL.absoluteString.getter();
}

uint64_t sub_3D2280()
{
  return URL.pathComponents.getter();
}

uint64_t sub_3D2290()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_3D22A0()
{
  return URL.lastPathComponent.getter();
}

void sub_3D22B0(NSURL *retstr@<X8>)
{
}

uint64_t sub_3D22C0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t _s8ShelfKit15FetchPageIntentV2eeoiySbAC_ACtFZ_0()
{
  return static URL.== infix(_:_:)();
}

uint64_t sub_3D22E0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D22F0()
{
  return URL.host.getter();
}

uint64_t sub_3D2300()
{
  return URL.path.getter();
}

void sub_3D2310(Swift::OpaquePointer queryItems)
{
}

uint64_t sub_3D2320()
{
  return URL.init(string:)();
}

uint64_t sub_3D2330()
{
  return URL.appending(queryItems:)();
}

uint64_t sub_3D2340()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_3D2350()
{
  return type metadata accessor for URL();
}

uint64_t sub_3D2360()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_3D2370()
{
  return Data.init(base64Encoded:options:)();
}

NSData sub_3D2380()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_3D2390()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D23A0()
{
  return Data.write(to:options:)();
}

uint64_t sub_3D23B0()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_3D23C0()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_3D23D0()
{
  return static Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t sub_3D23E0()
{
  return Date.timeIntervalSince(_:)();
}

NSDate sub_3D23F0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_3D2400()
{
  return static Date.now.getter();
}

uint64_t sub_3D2410()
{
  return Date.init()();
}

uint64_t sub_3D2420()
{
  return type metadata accessor for Date();
}

uint64_t _s8ShelfKit8RoomUberV13shelfUniqueIdSSvg_0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_3D2440()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_3D2450()
{
  return UUID.init()();
}

uint64_t sub_3D2460()
{
  return type metadata accessor for UUID();
}

uint64_t sub_3D2470()
{
  return Locale.identifier.getter();
}

uint64_t sub_3D2480()
{
  return Locale.languageCode.getter();
}

uint64_t sub_3D2490()
{
  return static Locale.preferredLanguages.getter();
}

NSLocale sub_3D24A0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_3D24B0()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t sub_3D24C0()
{
  return static Locale.current.getter();
}

uint64_t sub_3D24D0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_3D24E0()
{
  return IndexSet.init(integersIn:)();
}

uint64_t sub_3D24F0()
{
  return type metadata accessor for IndexSet();
}

uint64_t sub_3D2500()
{
  return IndexPath.safeSection.getter();
}

uint64_t sub_3D2510()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_3D2520()
{
  return IndexPath.item.getter();
}

uint64_t sub_3D2530()
{
  return IndexPath.section.getter();
}

uint64_t sub_3D2540()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_3D2550()
{
  return Selector.init(_:)();
}

uint64_t sub_3D2560()
{
  return PodcastsMetricsEventRecorder.init(bag:defaultTopic:)();
}

uint64_t sub_3D2570()
{
  return type metadata accessor for PodcastsMetricsEventRecorder();
}

uint64_t sub_3D2580()
{
  return dispatch thunk of ImageStore.image(forKey:size:imageBlur:)();
}

uint64_t sub_3D2590()
{
  return dispatch thunk of ImageStore.hasItem(forKey:)();
}

uint64_t sub_3D25A0()
{
  return ShowEntity.init(id:objectID:uuid:adamID:feedURL:explicit:title:description:provider:lastDatePlayed:followed:notificationsEnabled:hidePlayedEpisodes:removePlayedDownloads:artworkModel:artworkData:shareURL:)();
}

uint64_t sub_3D25B0()
{
  return type metadata accessor for ShowEntity();
}

uint64_t sub_3D25C0()
{
  return AppLocation.rawValue.getter();
}

uint64_t sub_3D25D0()
{
  return AssetCaches.preparedArtwork.getter();
}

uint64_t sub_3D25E0()
{
  return static AssetCaches.shared.getter();
}

uint64_t sub_3D25F0()
{
  return type metadata accessor for AssetCaches();
}

uint64_t sub_3D2600()
{
  return SearchScope.init(index:)();
}

uint64_t sub_3D2610()
{
  return SearchScope.index.getter();
}

uint64_t sub_3D2620()
{
  return SearchScope.title.getter();
}

uint64_t sub_3D2630()
{
  return static SearchScope.default.getter();
}

uint64_t sub_3D2640()
{
  return static SearchScope.allCases.getter();
}

uint64_t sub_3D2650()
{
  return SearchScope.rawValue.getter();
}

uint64_t sub_3D2660()
{
  return SearchScope.targetID.getter();
}

uint64_t sub_3D2670()
{
  return dispatch thunk of TipProvider.requestRefresh()();
}

uint64_t sub_3D2680()
{
  return dispatch thunk of TipProvider.tips.getter();
}

uint64_t sub_3D2690()
{
  return TipProvider.tips(for:)();
}

uint64_t sub_3D26A0()
{
  return static Dependencies.allDependencies()();
}

uint64_t sub_3D26B0()
{
  return SearchAction.activatesSearchBar.getter();
}

uint64_t sub_3D26C0()
{
  return SearchAction.term.getter();
}

uint64_t sub_3D26D0()
{
  return SearchAction.origin.getter();
}

uint64_t sub_3D26E0()
{
  return SearchAction.hintIndex.getter();
}

uint64_t sub_3D26F0()
{
  return type metadata accessor for SearchAction();
}

uint64_t sub_3D2700()
{
  return SearchOrigin.rawValue.getter();
}

uint64_t sub_3D2710()
{
  return AnalyzedColor.suggestedInterfaceStyle.getter();
}

uint64_t sub_3D2720()
{
  return AnalyzedColor.init(color:)();
}

uint64_t sub_3D2730()
{
  return type metadata accessor for AnalyzedColor();
}

uint64_t sub_3D2740()
{
  return type metadata accessor for ChannelEntity();
}

uint64_t sub_3D2750()
{
  return EpisodeEntity.EpisodeEntityQuery.objectGraph.getter();
}

uint64_t sub_3D2760()
{
  return type metadata accessor for EpisodeEntity.EpisodeEntityQuery();
}

uint64_t sub_3D2770()
{
  return EpisodeEntity.init(id:objectID:uuid:adamID:title:description:category:creator:showName:downloadDate:publishedDate:episodeNumber:isPlayed:isSaved:isDownloaded:isTranscriptAvailable:artworkModel:artworkData:shareURL:transcriptInformation:)();
}

uint64_t sub_3D2780()
{
  return type metadata accessor for EpisodeEntity();
}

uint64_t sub_3D2790()
{
  return dispatch thunk of ImageProvider.load(artwork:)();
}

uint64_t sub_3D27A0()
{
  return ImageProvider.placeholder(for:)();
}

uint64_t sub_3D27B0()
{
  return ImageProvider.prefetch(artwork:)();
}

uint64_t sub_3D27C0()
{
  return StationEntity.init(id:uuid:objectID:title:dateCreated:showUnplayedEpisodes:artworkModel:artworkData:)();
}

uint64_t sub_3D27D0()
{
  return type metadata accessor for StationEntity();
}

uint64_t sub_3D27E0()
{
  return ShelfIDBuilder.addingAttribute(_:named:)();
}

uint64_t sub_3D27F0()
{
  return ShelfIDBuilder.build()()._countAndFlagsBits;
}

uint64_t sub_3D2800()
{
  return ShelfIDBuilder.init(named:)();
}

uint64_t sub_3D2810()
{
  return type metadata accessor for PageRenderEvent();
}

uint64_t sub_3D2820()
{
  return static TimestampParser.addTimestampAttributions(to:episodeURL:)();
}

uint64_t sub_3D2830()
{
  return type metadata accessor for TimestampParser();
}

uint64_t sub_3D2840()
{
  return AssetDownloaders.storeArtworkSource.getter();
}

uint64_t sub_3D2850()
{
  return type metadata accessor for AssetDownloaders();
}

uint64_t sub_3D2860()
{
  return dispatch thunk of ContentReferring.contentReference.getter();
}

uint64_t sub_3D2870()
{
  return FollowFeedIntent.contentRating.getter();
}

uint64_t sub_3D2880()
{
  return FollowFeedIntent.adamID.getter();
}

uint64_t sub_3D2890()
{
  return FollowFeedIntent.feedURL.getter();
}

uint64_t sub_3D28A0()
{
  return FollowFeedIntent.init(feedURL:adamID:location:contentRating:)();
}

uint64_t sub_3D28B0()
{
  return FollowFeedIntent.location.getter();
}

uint64_t sub_3D28C0()
{
  return type metadata accessor for FollowFeedIntent();
}

uint64_t sub_3D28D0()
{
  return static JoeColorAlgorithm<>.clampBrightness.getter();
}

uint64_t sub_3D28E0()
{
  return InteractionContext.Page.isEpisodePage.getter();
}

uint64_t sub_3D28F0()
{
  return InteractionContext.Page.isUpNextSeeAll.getter();
}

uint64_t sub_3D2900()
{
  return InteractionContext.Page.entityAnnotation()();
}

uint64_t sub_3D2910()
{
  return InteractionContext.Page.isRecentlyPlayedSeeAll.getter();
}

uint64_t sub_3D2920()
{
  return InteractionContext.Page.isUnfollowedLibraryShow.getter();
}

uint64_t sub_3D2930()
{
  return static InteractionContext.Page.== infix(_:_:)();
}

uint64_t sub_3D2940()
{
  return InteractionContext.Page.init(rawString:adamID:)();
}

uint64_t sub_3D2950()
{
  return type metadata accessor for InteractionContext.Page();
}

uint64_t sub_3D2960()
{
  return InteractionContext.page.getter();
}

uint64_t sub_3D2970()
{
  return InteractionContext.view.getter();
}

uint64_t sub_3D2980()
{
  return type metadata accessor for InteractionContext.Origin();
}

uint64_t sub_3D2990()
{
  return type metadata accessor for InteractionContext();
}

uint64_t sub_3D29A0()
{
  return static JoeColorCandidates.background.getter();
}

uint64_t sub_3D29B0()
{
  return static JoeColorCandidates.all.getter();
}

uint64_t sub_3D29C0()
{
  return type metadata accessor for JoeColorCandidates();
}

uint64_t sub_3D29E0()
{
  return OpenStoreURLAction.shareURL.getter();
}

uint64_t sub_3D29F0()
{
  return type metadata accessor for PageRenderActivity();
}

uint64_t sub_3D2A00()
{
  return dispatch thunk of PlaybackController.QueueController.hasHardQueue.getter();
}

uint64_t sub_3D2A10()
{
  return PlaybackController.QueueController.updatePlayerIfNeededForMarking(adamIDs:as:)();
}

uint64_t sub_3D2A20()
{
  return dispatch thunk of PlaybackController.queueController.getter();
}

uint64_t sub_3D2A40()
{
  return PlaybackController.currentTime.getter();
}

uint64_t sub_3D2A50()
{
  return type metadata accessor for PlaybackController.QueueCommand.Location();
}

uint64_t sub_3D2A60()
{
  return type metadata accessor for PlaybackController.QueueCommand();
}

uint64_t sub_3D2A80()
{
  return dispatch thunk of PlaybackController.nowPlayingItem.getter();
}

uint64_t sub_3D2A90()
{
  return type metadata accessor for PlaybackController();
}

uint64_t sub_3D2AA0()
{
  return PresentationSource.init(viewController:view:location:)();
}

uint64_t sub_3D2AB0()
{
  return PresentationSource.viewController.getter();
}

uint64_t sub_3D2AC0()
{
  return PresentationSource.present(_:wantsAutomaticModalPresentationStyle:permittedArrowDirections:animated:completion:)();
}

uint64_t sub_3D2AD0()
{
  return type metadata accessor for PresentationSource();
}

uint64_t sub_3D2AE0()
{
  return UnfollowShowIntent.showID.getter();
}

uint64_t sub_3D2B00()
{
  return type metadata accessor for UnfollowShowIntent();
}

uint64_t sub_3D2B10()
{
  return dispatch thunk of ArtworkLoaderConfig.resolvedTemplate.getter();
}

uint64_t sub_3D2B20()
{
  return ArtworkLoaderConfig.retainAspectRatio.getter();
}

uint64_t sub_3D2B30()
{
  return dispatch thunk of ArtworkLoaderConfig.withAlternativeSize(block:)();
}

uint64_t sub_3D2B40()
{
  return dispatch thunk of ArtworkLoaderConfig.url.getter();
}

uint64_t sub_3D2B50()
{
  return ArtworkLoaderConfig.crop.getter();
}

uint64_t sub_3D2B60()
{
  return ArtworkLoaderConfig.size.getter();
}

uint64_t sub_3D2B70()
{
  return ArtworkLoaderConfig.scale.getter();
}

uint64_t sub_3D2B80()
{
  return ArtworkLoaderConfig.template.getter();
}

uint64_t sub_3D2B90()
{
  return type metadata accessor for ArtworkLoaderConfig();
}

uint64_t sub_3D2BA0()
{
  return dispatch thunk of LanguageAwareString.attributedString.getter();
}

uint64_t sub_3D2BB0()
{
  return static LanguageAwareString.alwaysGenerateAttributedString.getter();
}

uint64_t sub_3D2BC0()
{
  return LanguageAwareString.string.getter();
}

uint64_t sub_3D2BD0()
{
  return dispatch thunk of LanguageAwareString.isEmpty.getter();
}

uint64_t sub_3D2BE0()
{
  return type metadata accessor for LanguageAwareString();
}

uint64_t sub_3D2BF0()
{
  return LanguageAwareString.init(_:baseParagraphStyle:generateAttributedString:)();
}

uint64_t sub_3D2C00()
{
  return LanguageAwareString.__allocating_init(_:baseParagraphStyle:generateAttributedString:)();
}

uint64_t sub_3D2C10()
{
  return LanguageAwareString.init(_:baseParagraphStyle:)();
}

uint64_t sub_3D2C20()
{
  return ClickLocationElement.parentUniqueID.getter();
}

uint64_t sub_3D2C30()
{
  return static ClickLocationElement.bubbleTipButton(targetID:uniqueID:parentUniqueID:position:locationType:name:)();
}

uint64_t sub_3D2C40()
{
  return ClickLocationElement.init(impressionMetrics:uniqueID:parentUniqueID:position:)();
}

uint64_t sub_3D2C50()
{
  return ClickLocationElement.init(id:uniqueID:parentUniqueID:position:fields:)();
}

uint64_t sub_3D2C60()
{
  return ClickLocationElement.id.getter();
}

uint64_t sub_3D2C70()
{
  return ClickLocationElement._uniqueID.getter();
}

uint64_t sub_3D2C80()
{
  return type metadata accessor for ClickLocationElement();
}

uint64_t sub_3D2C90()
{
  return ClickLocationTracker.addElement(_:)();
}

uint64_t sub_3D2CA0()
{
  return ClickLocationTracker.removeElement(_:)();
}

uint64_t sub_3D2CB0()
{
  return ClickLocationTracker.removeElements(where:)();
}

uint64_t sub_3D2CC0()
{
  return type metadata accessor for ClickLocationTracker();
}

uint64_t sub_3D2CD0()
{
  return static ExtendedLaunchStatus.== infix(_:_:)();
}

uint64_t sub_3D2CE0()
{
  return type metadata accessor for ExtendedLaunchStatus();
}

uint64_t sub_3D2CF0()
{
  return type metadata accessor for JSMetricsEventLinter();
}

uint64_t sub_3D2D00()
{
  return type metadata accessor for LibraryImageProvider();
}

uint64_t sub_3D2D10()
{
  return PageRenderController.handle(event:)();
}

uint64_t sub_3D2D20()
{
  return type metadata accessor for PageRenderController();
}

uint64_t sub_3D2D30()
{
  return SearchFiltersTracker.copy()();
}

uint64_t sub_3D2D40()
{
  return SearchFiltersTracker.select(group:)();
}

uint64_t sub_3D2D50()
{
  return SearchFiltersTracker.select(scope:)();
}

uint64_t sub_3D2D60()
{
  return SearchFiltersTracker.__allocating_init()();
}

uint64_t sub_3D2D70()
{
  return type metadata accessor for SearchFiltersTracker();
}

uint64_t sub_3D2D80()
{
  return type metadata accessor for ActionMetricsBehavior();
}

uint64_t sub_3D2D90()
{
  return BookmarkEpisodeIntent.init(episodeIdentifiers:)();
}

uint64_t sub_3D2DA0()
{
  return BookmarkEpisodeIntent.episodeIdentifiers.getter();
}

uint64_t sub_3D2DB0()
{
  return type metadata accessor for BookmarkEpisodeIntent();
}

uint64_t sub_3D2DC0()
{
  return static LibrarySnapshotIntent.kind.getter();
}

uint64_t sub_3D2DD0()
{
  return type metadata accessor for LibrarySnapshotIntent();
}

uint64_t sub_3D2DE0()
{
  return OpenAppLocationAction.location.getter();
}

uint64_t sub_3D2DF0()
{
  return ThumbnailImageResizer.init()();
}

uint64_t sub_3D2E00()
{
  return type metadata accessor for ThumbnailImageResizer();
}

uint64_t sub_3D2E10()
{
  return dispatch thunk of DependencyBindableView.objectGraph.getter();
}

uint64_t sub_3D2E20()
{
  return static LintMetricsEventIntent.kind.getter();
}

uint64_t sub_3D2E30()
{
  return MetricsAdHocImpression.metricsName.getter();
}

uint64_t sub_3D2E40()
{
  return MetricsAdHocImpression.channelAdamId.getter();
}

uint64_t sub_3D2E50()
{
  return MetricsAdHocImpression.impressionType.getter();
}

uint64_t sub_3D2E60()
{
  return MetricsAdHocImpression.eligibilityType.getter();
}

uint64_t sub_3D2E70()
{
  return MetricsAdHocImpression.metricsId.getter();
}

uint64_t sub_3D2E80()
{
  return type metadata accessor for MetricsAdHocImpression();
}

uint64_t sub_3D2E90()
{
  return static PageRenderContentTypes.primaryData.getter();
}

uint64_t sub_3D2EA0()
{
  return static PageRenderContentTypes.unspecified.getter();
}

uint64_t sub_3D2EB0()
{
  return PageRenderContentTypes.init(rawValue:)();
}

uint64_t sub_3D2EC0()
{
  return static PageRenderContentTypes.sidepack.getter();
}

uint64_t sub_3D2ED0()
{
  return PreparedArtworkRequest.key.getter();
}

uint64_t sub_3D2EE0()
{
  return type metadata accessor for PreparedArtworkRequest();
}

uint64_t sub_3D2EF0()
{
  return dispatch_to_main_queue(_:)();
}

uint64_t sub_3D2F00()
{
  return dispatch thunk of EpisodeUpsellBannerView.apply(primaryText:secondaryText:tapBannerBlock:tapCloseButtonBlock:)();
}

uint64_t sub_3D2F10()
{
  return type metadata accessor for EpisodeUpsellBannerView();
}

uint64_t sub_3D2F20()
{
  return type metadata accessor for PageRenderResourceError();
}

uint64_t sub_3D2F30()
{
  return UnbookmarkEpisodeIntent.init(episodeIdentifiers:)();
}

uint64_t sub_3D2F40()
{
  return UnbookmarkEpisodeIntent.episodeIdentifiers.getter();
}

uint64_t sub_3D2F50()
{
  return type metadata accessor for UnbookmarkEpisodeIntent();
}

uint64_t sub_3D2F60()
{
  return ExplicitContentPresenter.symbol.getter();
}

uint64_t sub_3D2F70()
{
  return type metadata accessor for ExplicitContentPresenter();
}

uint64_t sub_3D2F80()
{
  return static MetricsDataConfiguration.search.getter();
}

uint64_t sub_3D2F90()
{
  return static MetricsDataConfiguration.default.getter();
}

uint64_t sub_3D2FA0()
{
  return static UniformBucketingStrategy.uniform3000MaxStrategy.getter();
}

uint64_t sub_3D2FB0()
{
  return type metadata accessor for UniformBucketingStrategy();
}

uint64_t sub_3D2FC0()
{
  return PageContextFieldsProvider.init()();
}

uint64_t sub_3D2FD0()
{
  return type metadata accessor for PageContextFieldsProvider();
}

uint64_t sub_3D2FE0()
{
  return ClickLocationFieldsProvider.init()();
}

uint64_t sub_3D2FF0()
{
  return type metadata accessor for ClickLocationFieldsProvider();
}

uint64_t sub_3D3000()
{
  return type metadata accessor for IntentFeedSubscriptionError();
}

uint64_t sub_3D3010()
{
  return SearchFiltersFieldsProvider.init()();
}

uint64_t sub_3D3020()
{
  return type metadata accessor for SearchFiltersFieldsProvider();
}

uint64_t sub_3D3030()
{
  return DynamicImpressionsCalculator.addElement(_:in:at:)();
}

uint64_t sub_3D3040()
{
  return DynamicImpressionsCalculator.removeElement(_:)();
}

uint64_t sub_3D3050()
{
  return DynamicImpressionsCalculator.isVisible.setter();
}

uint64_t sub_3D3060()
{
  return type metadata accessor for DynamicImpressionsCalculator();
}

uint64_t sub_3D3070()
{
  return EnqueueShowForPlaybackIntent.init(showID:location:)();
}

uint64_t sub_3D3080()
{
  return type metadata accessor for EnqueueShowForPlaybackIntent();
}

uint64_t sub_3D3090()
{
  return RemoveEpisodesDownloadIntent.init(episodeIdentifiers:)();
}

uint64_t sub_3D30A0()
{
  return type metadata accessor for RemoveEpisodesDownloadIntent();
}

uint64_t sub_3D30B0()
{
  return XPAccountsMatchFieldsProvider.init(asPartOf:)();
}

uint64_t sub_3D30C0()
{
  return type metadata accessor for XPAccountsMatchFieldsProvider();
}

uint64_t sub_3D30D0()
{
  return EnqueueEpisodeForPlaybackIntent.init(episodeID:location:)();
}

uint64_t sub_3D30E0()
{
  return type metadata accessor for EnqueueEpisodeForPlaybackIntent();
}

uint64_t sub_3D30F0()
{
  return RequestTipProviderRefreshAction.init(actionMetrics:)();
}

uint64_t sub_3D3100()
{
  return type metadata accessor for RequestTipProviderRefreshAction();
}

uint64_t sub_3D3110()
{
  return type metadata accessor for JoeColorClampBrightnessAlgorithm();
}

uint64_t sub_3D3120()
{
  return EngagementThresholdStatusProvider.init(asPartOf:)();
}

uint64_t sub_3D3130()
{
  return type metadata accessor for EngagementThresholdStatusProvider();
}

uint64_t sub_3D3140()
{
  return EngagementThresholdMetFieldsProvider.init(asPartOf:)();
}

uint64_t sub_3D3150()
{
  return type metadata accessor for EngagementThresholdMetFieldsProvider();
}

uint64_t sub_3D3160()
{
  return static LibraryStorageTipSuggestedLimitIntent.kind.getter();
}

uint64_t sub_3D3170()
{
  return type metadata accessor for LibraryStorageTipSuggestedLimitIntent();
}

uint64_t sub_3D3180()
{
  return dispatch thunk of StoreLibraryMultiplexingImageProvider.__allocating_init(storeProvider:libraryProvider:artworkLoaderProvider:compositeProvider:sizeBucketingStrategy:caches:)();
}

uint64_t sub_3D3190()
{
  return type metadata accessor for StoreLibraryMultiplexingImageProvider();
}

uint64_t sub_3D31A0()
{
  return FindOrCreateLocalEpisodeContentIDsIntent.init(identifiers:)();
}

uint64_t sub_3D31B0()
{
  return FindOrCreateLocalEpisodeContentIDsIntent.identifiers.getter();
}

uint64_t sub_3D31C0()
{
  return type metadata accessor for FindOrCreateLocalEpisodeContentIDsIntent();
}

uint64_t sub_3D31D0()
{
  return static Glyph.HeaderButtons.headerButtonsPointSize.getter();
}

uint64_t sub_3D31E0()
{
  return static Glyph.== infix(_:_:)();
}

uint64_t sub_3D31F0()
{
  return Glyph.image.getter();
}

uint64_t sub_3D3200()
{
  return static Glyph.TabBar.home.getter();
}

uint64_t sub_3D3210()
{
  return static Glyph.TabBar.search.getter();
}

uint64_t sub_3D3220()
{
  return static Glyph.TabBar.library.getter();
}

uint64_t sub_3D3230()
{
  return static Glyph.Sidebar.categories.getter();
}

uint64_t sub_3D3240()
{
  return static Glyph.Sidebar.downloaded.getter();
}

uint64_t sub_3D3250()
{
  return static Glyph.Sidebar.newStation.getter();
}

uint64_t sub_3D3260()
{
  return static Glyph.Sidebar.latestEpisodes.getter();
}

uint64_t sub_3D3270()
{
  return static Glyph.Sidebar.recentlyUpdated.getter();
}

uint64_t sub_3D3280()
{
  return static Glyph.Sidebar.downloadedWithBadge.getter();
}

uint64_t sub_3D3290()
{
  return static Glyph.Sidebar.home.getter();
}

uint64_t sub_3D32A0()
{
  return static Glyph.Sidebar.shows.getter();
}

uint64_t sub_3D32B0()
{
  return static Glyph.Sidebar.browse.getter();
}

uint64_t sub_3D32C0()
{
  return static Glyph.Sidebar.station.getter();
}

uint64_t sub_3D32D0()
{
  return static Glyph.Sidebar.channels.getter();
}

uint64_t sub_3D32E0()
{
  return static Glyph.Sidebar.bookmarks.getter();
}

uint64_t sub_3D32F0()
{
  return static Glyph.Sidebar.listenNow.getter();
}

uint64_t sub_3D3300()
{
  return static Glyph.Sidebar.topCharts.getter();
}

uint64_t sub_3D3310()
{
  return Glyph.Settings.name.getter();
}

uint64_t sub_3D3320()
{
  return type metadata accessor for Glyph.Settings();
}

uint64_t sub_3D3330()
{
  return Glyph.settings.getter();
}

uint64_t sub_3D3340()
{
  return type metadata accessor for Glyph();
}

uint64_t sub_3D3350()
{
  return static Theme.tintColor.getter();
}

uint64_t sub_3D3360()
{
  return type metadata accessor for Theme();
}

uint64_t sub_3D3370()
{
  return static TipKind.categoriesSaved.getter();
}

uint64_t sub_3D3380()
{
  return static TipKind.notFindingAnything.getter();
}

uint64_t sub_3D3390()
{
  return static TipKind.addFavoriteCategoriesSearch.getter();
}

uint64_t sub_3D33A0()
{
  return TipType.rawValue.getter();
}

uint64_t sub_3D33B0()
{
  return LazyDate.init(initialState:)();
}

uint64_t sub_3D33C0()
{
  return type metadata accessor for LazyDate.State();
}

uint64_t sub_3D33D0()
{
  return LazyDate.value.getter();
}

uint64_t sub_3D33F0()
{
  return PageSize.init(width:additionalTextMargin:)();
}

uint64_t sub_3D3400()
{
  return type metadata accessor for PageSize();
}

uint64_t sub_3D3410()
{
  return type metadata accessor for TipGroup();
}

uint64_t sub_3D3420()
{
  return dispatch thunk of static TipModel.kind.getter();
}

uint64_t sub_3D3430()
{
  return TipModel.titleAccessibilityLabel.getter();
}

uint64_t sub_3D3440()
{
  return TipModel.messageAccessibilityLabel.getter();
}

uint64_t sub_3D3450()
{
  return TipModel.icon.getter();
}

uint64_t sub_3D3460()
{
  return type metadata accessor for ImageBlur();
}

uint64_t sub_3D3470()
{
  return SizeClass.init(width:)();
}

uint64_t sub_3D3480()
{
  return SizeClass.margins(width:)();
}

uint64_t sub_3D3490()
{
  return SizeClass.rawValue.getter();
}

uint64_t sub_3D34A0()
{
  return TipButton.init(id:title:action:style:clickLocation:)();
}

uint64_t sub_3D34B0()
{
  return static TipButton.close(action:clickLocation:)();
}

uint64_t sub_3D34C0()
{
  return type metadata accessor for TipButton();
}

uint64_t sub_3D34D0()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_3D34E0()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_3D34F0()
{
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)();
}

uint64_t sub_3D3500()
{
  return ObservationRegistrar.willSet<A, B>(_:keyPath:)();
}

uint64_t sub_3D3510()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_3D3520()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_3D3530()
{
  return CGFloat.roundValue(scale:)();
}

uint64_t sub_3D3550()
{
  return static CGFloat._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3D3560()
{
  return static CGFloat._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3D3570()
{
  return static CGFloat._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D3580()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_3D3590()
{
  return type metadata accessor for ManagedAtomic();
}

uint64_t sub_3D35A0()
{
  return AppEntityViewAnnotation.init<A>(entityType:identifier:state:)();
}

uint64_t sub_3D35B0()
{
  return AppEntityViewAnnotation.__allocating_init<A>(entity:state:)();
}

uint64_t sub_3D35C0()
{
  return AppEntityViewAnnotation.init<A>(entity:state:)();
}

uint64_t sub_3D35D0()
{
  return type metadata accessor for AppEntityViewAnnotation();
}

uint64_t sub_3D35E0()
{
  return static Podcasts.isGinkgoEnabled.getter();
}

uint64_t sub_3D35F0()
{
  return static Podcasts.isUIPSidebarEnabled.getter();
}

uint64_t sub_3D3600()
{
  return static Podcasts.isRecentlyUnfollowedEnabled()();
}

uint64_t sub_3D3610()
{
  return type metadata accessor for Podcasts();
}

uint64_t sub_3D3620()
{
  return type metadata accessor for PodcastsMediaLibrary.MediaItem();
}

uint64_t sub_3D3630()
{
  return type metadata accessor for PodcastsBagFeatureFlags.Key();
}

uint64_t sub_3D3640()
{
  return static PodcastsBagFeatureFlags.isEnabled(_:)();
}

uint64_t sub_3D3650()
{
  return dispatch thunk of PodcastsStateCoordinatorProtocol.disableSubscription(onPodcastUUID:from:)();
}

uint64_t sub_3D3660()
{
  return dispatch thunk of PodcastsStateCoordinatorProtocol.unsafeBookmarkIfNeeded(episode:shouldDownloadEpisode:from:)();
}

uint64_t sub_3D3670()
{
  return dispatch thunk of PodcastsStateCoordinatorProtocol.unsafeRemoveEpisodeFromBookmarksIfNeeded(episode:from:)();
}

uint64_t sub_3D3680()
{
  return AssetCache.eraseToAnyAssetCache()();
}

uint64_t sub_3D3690()
{
  return FileFormat.rawValue.getter();
}

uint64_t sub_3D36A0()
{
  return type metadata accessor for FileFormat();
}

uint64_t sub_3D36B0()
{
  return static MTCategory.predicateForFollowedShowCategoriesForCategoriesInLibrary()();
}

uint64_t sub_3D36C0()
{
  return MTCategory.artworkWidth.getter();
}

uint64_t sub_3D36D0()
{
  return MTCategory.artworkHeight.getter();
}

uint64_t sub_3D36E0()
{
  return MTCategory.followedShows.getter();
}

uint64_t sub_3D36F0()
{
  return MTCategory.followedShowsCount.getter();
}

uint64_t sub_3D3700()
{
  return static MTCategory.predicateForFavoritedCategories()();
}

uint64_t sub_3D3710()
{
  return static MTCategory.sortDescriptorsForCategoriesInLibrary()();
}

uint64_t sub_3D3720()
{
  return type metadata accessor for MTCategory();
}

uint64_t sub_3D3740()
{
  return static ArtworkCrop.boundingBox.getter();
}

uint64_t sub_3D3750()
{
  return type metadata accessor for ArtworkCrop();
}

uint64_t sub_3D3760()
{
  return AssetSource.eraseToAnyAssetSource()();
}

uint64_t sub_3D3770()
{
  return CacheDomain.DiskCaches.asset(at:)();
}

uint64_t sub_3D3780()
{
  return CacheDomain.disk.getter();
}

uint64_t sub_3D3790()
{
  return CacheDomain.memory.getter();
}

uint64_t sub_3D37A0()
{
  return EpisodeType.rawValue.getter();
}

uint64_t sub_3D37B0()
{
  return static AccountsUtil.userAllowsPersonalization.getter();
}

uint64_t sub_3D37C0()
{
  return type metadata accessor for AccountsUtil();
}

uint64_t sub_3D37D0()
{
  return ArtworkModel.init(deserializing:using:)();
}

uint64_t sub_3D37E0()
{
  return ArtworkModel.config(_:mode:format:crop:retainAspectRatio:)();
}

uint64_t sub_3D37F0()
{
  return ArtworkModel.joeColor(contrasting:using:selecting:)();
}

uint64_t sub_3D3800()
{
  return ArtworkModel.isSystemGlyph.getter();
}

uint64_t sub_3D3810()
{
  return static ArtworkModel.compositeImageRequestsKey.getter();
}

uint64_t sub_3D3820()
{
  return static ArtworkModel.== infix(_:_:)();
}

uint64_t sub_3D3830()
{
  return ArtworkModel.hash(into:)();
}

uint64_t sub_3D3840()
{
  return ArtworkModel.init(template:width:height:libraryEntity:backgroundColor:textColors:style:crop:accessibilityTitle:format:isCustomSymbol:isMulticolorSymbol:imageStoreIdentifier:)();
}

uint64_t sub_3D3850()
{
  return ArtworkModel.init(glyphName:accessibilityTitle:isCustomSymbol:isMulticolorSymbol:)();
}

uint64_t sub_3D3860()
{
  return type metadata accessor for ArtworkModel();
}

uint64_t sub_3D3870()
{
  return type metadata accessor for MediaRequest.RequestType();
}

uint64_t sub_3D3880()
{
  return type metadata accessor for MediaRequest.ContentType();
}

uint64_t sub_3D3890()
{
  return type metadata accessor for MediaRequest.URLFragment();
}

uint64_t sub_3D38A0()
{
  return type metadata accessor for MediaRequest.Relationship();
}

uint64_t sub_3D38B0()
{
  return type metadata accessor for MediaRequest.Filter();
}

uint64_t sub_3D38C0()
{
  return MediaRequest.Params.init(requestType:requestContentType:viewType:directFetch:relationshipIncludes:relationshipRelates:relationshipLimit:include:omit:typedIncludes:typedExtends:fields:withTypes:displayKinds:identifiers:fragment:limit:filters:meta:offset:pageName:requestAllPages:hostUrl:countryCode:isImplicitActionRequest:searchTerm:queryContentTypes:triggerBy:includeEntitlementsOverride:)();
}

uint64_t sub_3D38D0()
{
  return type metadata accessor for MediaRequest.Params();
}

uint64_t sub_3D38E0()
{
  return type metadata accessor for MediaRequest.PageName();
}

uint64_t sub_3D38F0()
{
  return type metadata accessor for MediaRequest.ViewType();
}

uint64_t sub_3D3900()
{
  return static MetricsField<>.eventType.getter();
}

uint64_t sub_3D3910()
{
  return static MetricsField<>.impressionType.getter();
}

uint64_t sub_3D3920()
{
  return static MetricsField<>.locationType.getter();
}

uint64_t sub_3D3930()
{
  return static MetricsField<>.actionResult.getter();
}

uint64_t sub_3D3940()
{
  return static MetricsField<>.idType.getter();
}

uint64_t sub_3D3950()
{
  return static MetricsField<>.pageID.getter();
}

uint64_t sub_3D3960()
{
  return static MetricsField<>.pageType.getter();
}

uint64_t sub_3D3970()
{
  return static MetricsField<>.externalReferralURL.getter();
}

uint64_t sub_3D3980()
{
  return static MetricsField<>.openURL.getter();
}

uint64_t sub_3D3990()
{
  return static MetricsField<>.pageURL.getter();
}

uint64_t sub_3D39A0()
{
  return static MetricsField<>.pageDetails.getter();
}

uint64_t sub_3D39B0()
{
  return static MetricsField<>.referralApp.getter();
}

uint64_t sub_3D39C0()
{
  return static MetricsField<>.id.getter();
}

uint64_t sub_3D39D0()
{
  return static MetricsField<>.name.getter();
}

uint64_t sub_3D39E0()
{
  return static MetricsField<>.sharedContent.getter();
}

uint64_t sub_3D39F0()
{
  return static MetricsField<>.impressionIndex.getter();
}

uint64_t sub_3D3A00()
{
  return static MetricsTopic.main.getter();
}

uint64_t sub_3D3A10()
{
  return PodcastState.init(isFollowed:)();
}

uint64_t sub_3D3A20()
{
  return type metadata accessor for AnyAssetCache();
}

uint64_t sub_3D3A30()
{
  return static ArtworkFormat.preferredFormat.getter();
}

uint64_t sub_3D3A40()
{
  return AssetMetadata.fetch<A>(source:)();
}

uint64_t sub_3D3A50()
{
  return ContentRating.rawValue.getter();
}

uint64_t sub_3D3A60()
{
  return static EmitLifecycle.defaultVerbosity.getter();
}

uint64_t sub_3D3A70()
{
  return static MetricsIDType.sequential.getter();
}

uint64_t sub_3D3A80()
{
  return static MetricsIDType.itsContentID.getter();
}

uint64_t sub_3D3A90()
{
  return static MetricsIDType.itsID.getter();
}

uint64_t sub_3D3AA0()
{
  return static MetricsPageID.categories.getter();
}

uint64_t sub_3D3AB0()
{
  return static MetricsPageID.downloaded.getter();
}

uint64_t sub_3D3AC0()
{
  return static MetricsPageID.nowPlaying.getter();
}

uint64_t sub_3D3AD0()
{
  return static MetricsPageID.fromYourShows.getter();
}

uint64_t sub_3D3AE0()
{
  return static MetricsPageID.sharedWithYou.getter();
}

uint64_t sub_3D3AF0()
{
  return static MetricsPageID.latestEpisodes.getter();
}

uint64_t sub_3D3B00()
{
  return static MetricsPageID.recentlyPlayed.getter();
}

uint64_t sub_3D3B10()
{
  return static MetricsPageID.recentlyUpdated.getter();
}

uint64_t sub_3D3B20()
{
  return static MetricsPageID.focus.getter();
}

uint64_t sub_3D3B30()
{
  return static MetricsPageID.saved.getter();
}

uint64_t sub_3D3B40()
{
  return static MetricsPageID.shows.getter();
}

uint64_t sub_3D3B50()
{
  return static MetricsPageID.browse.getter();
}

uint64_t sub_3D3B60()
{
  return static MetricsPageID.upNext.getter();
}

uint64_t sub_3D3B70()
{
  return static MetricsPageID.library.getter();
}

uint64_t sub_3D3B80()
{
  return static MetricsPageID.station.getter();
}

uint64_t sub_3D3B90()
{
  return static MetricsPageID.unknown.getter();
}

uint64_t sub_3D3BA0()
{
  return static MetricsPageID.channels.getter();
}

uint64_t sub_3D3BB0()
{
  return static MetricsPageID.listenNow.getter();
}

uint64_t sub_3D3BC0()
{
  return ShowsSortType.baseSortTypeMatches(otherSort:)();
}

uint64_t sub_3D3BD0()
{
  return ShowsSortType.ascendingType.getter();
}

BOOL sub_3D3BE0()
{
  return ShowsSortType.isAscending()();
}

BOOL sub_3D3BF0()
{
  return ShowsSortType.isDescending()();
}

uint64_t sub_3D3C00()
{
  return ShowsSortType.rawValue.getter();
}

uint64_t sub_3D3C10()
{
  return AnalyticsEvent.__allocating_init(cacheDeletedMediaFiles:)();
}

uint64_t sub_3D3C20()
{
  return type metadata accessor for AnalyticsEvent();
}

uint64_t sub_3D3C30()
{
  return type metadata accessor for AnyAssetSource();
}

uint64_t sub_3D3C40()
{
  return type metadata accessor for ArtworkContent();
}

uint64_t sub_3D3C50()
{
  return ArtworkRequest.artworkLoaderConfig.getter();
}

uint64_t sub_3D3C60()
{
  return ArtworkRequest.init(model:targetSize:contentMode:displayScale:retainAspectRatio:cropCodeOverride:destination:effects:trace:)();
}

uint64_t sub_3D3C70()
{
  return ArtworkRequest.prepared.getter();
}

uint64_t sub_3D3C80()
{
  return ArtworkRequest.fileFormat.getter();
}

uint64_t sub_3D3C90()
{
  return ArtworkRequest.targetSize.getter();
}

uint64_t sub_3D3CA0()
{
  return ArtworkRequest.key.getter();
}

uint64_t sub_3D3CB0()
{
  return ArtworkRequest.with(format:)();
}

uint64_t sub_3D3CC0()
{
  return ArtworkRequest.model.getter();
}

uint64_t sub_3D3CD0()
{
  return ArtworkRequest.trace.getter();
}

uint64_t sub_3D3CE0()
{
  return ArtworkRequest.resized(to:displayScale:)();
}

uint64_t sub_3D3CF0()
{
  return ArtworkRequest.bucketed(with:)();
}

uint64_t sub_3D3D00()
{
  return ArtworkRequest.fileName.getter();
}

uint64_t sub_3D3D10()
{
  return type metadata accessor for ArtworkRequest();
}

uint64_t sub_3D3D20()
{
  return type metadata accessor for EyebrowBuilder.ListContext();
}

uint64_t sub_3D3D30()
{
  return static EyebrowBuilder.concatenate(captionElements:uppercased:)();
}

uint64_t sub_3D3D40()
{
  return EyebrowBuilder.captionPublisher<A>(playStatePublisher:)();
}

uint64_t sub_3D3D50()
{
  return EyebrowBuilder.showsEpisodeNumber.getter();
}

uint64_t sub_3D3D60()
{
  return EyebrowBuilder.EpisodeHeaderSubtitleConfiguration.init(remainingTime:viewIsRTL:)();
}

uint64_t sub_3D3D70()
{
  return type metadata accessor for EyebrowBuilder.Style();
}

uint64_t sub_3D3D80()
{
  return EyebrowBuilder.caption.getter();
}

uint64_t sub_3D3D90()
{
  return EyebrowBuilder.init(episode:context:style:uppercase:explicitSymbol:abbreviatedPubDateConfig:showsSubscriptionBadge:hostingViewHasLimitedSpace:)();
}

uint64_t sub_3D3DA0()
{
  return type metadata accessor for EyebrowBuilder();
}

uint64_t sub_3D3DB0()
{
  return PlaybackIntent.withoutOptions(_:)();
}

uint64_t sub_3D3DC0()
{
  return PlaybackIntent.init(id:listSettings:initialItem:options:)();
}

uint64_t sub_3D3DD0()
{
  return PlaybackIntent.id.getter();
}

uint64_t sub_3D3DE0()
{
  return type metadata accessor for PlaybackIntent.Option();
}

uint64_t sub_3D3DF0()
{
  return type metadata accessor for PlaybackIntent();
}

uint64_t sub_3D3E00()
{
  return type metadata accessor for SectionContext();
}

uint64_t sub_3D3E10()
{
  return static CoreDataFetcher.fetchEpisode(contentId:guid:title:pubDate:podcastUuid:with:)();
}

uint64_t sub_3D3E20()
{
  return static CoreDataFetcher.fetchPodcast(adamId:feedUrl:with:)();
}

uint64_t sub_3D3E30()
{
  return static CoreDataFetcher.contextProvider.getter();
}

uint64_t sub_3D3E40()
{
  return type metadata accessor for CoreDataFetcher();
}

uint64_t sub_3D3E50()
{
  return EpisodeListType.sortTypeFromUserDefaults.getter();
}

uint64_t sub_3D3E60()
{
  return EpisodeListType.sortTypeFromUserDefaults.setter();
}

uint64_t sub_3D3E70()
{
  return EpisodeListType.supportsEpisodeOrderFreezing.getter();
}

uint64_t sub_3D3E80()
{
  return EpisodeListType.stationUUID.getter();
}

uint64_t sub_3D3E90()
{
  return EpisodeListType.pubDateLimit.getter();
}

uint64_t sub_3D3EA0()
{
  return EpisodeListType.pubDateLimit.setter();
}

uint64_t sub_3D3EB0()
{
  return EpisodeListType.libraryShowUUID.getter();
}

uint64_t sub_3D3EC0()
{
  return EpisodeListType.availableSortTypes.getter();
}

uint64_t sub_3D3ED0()
{
  return EpisodeListType.hidePlayedEpisodes.getter();
}

uint64_t sub_3D3EE0()
{
  return EpisodeListType.hidePlayedEpisodes.setter();
}

uint64_t sub_3D3EF0()
{
  return EpisodeListType.allowsPubDateLimiting.getter();
}

uint64_t sub_3D3F00()
{
  return static EpisodeListType.== infix(_:_:)();
}

uint64_t sub_3D3F10()
{
  return EpisodeListType.showsHidePlayedEpisodesControls.getter();
}

uint64_t sub_3D3F20()
{
  return EpisodeSortType.baseSortTypeMatches(other:)();
}

uint64_t sub_3D3F30()
{
  return EpisodeSortType.ascendingSortType.getter();
}

uint64_t sub_3D3F40()
{
  return EpisodeSortType.isAscending.getter();
}

uint64_t sub_3D3F50()
{
  return EpisodeSortType.isDescending.getter();
}

uint64_t sub_3D3F60()
{
  return EpisodeSortType.rawValue.getter();
}

uint64_t sub_3D3F70()
{
  return dispatch thunk of FeedURLComposer.feedURL(forOptionalURL:adamID:)();
}

uint64_t sub_3D3F80()
{
  return type metadata accessor for FeedURLComposer();
}

uint64_t sub_3D3F90()
{
  return MediaIdentifier.firstItemMatchesEpisode(_:)();
}

uint64_t sub_3D3FA0()
{
  return type metadata accessor for MediaIdentifier();
}

uint64_t sub_3D3FB0()
{
  return static MetricsPageType.nowPlaying.getter();
}

uint64_t sub_3D3FC0()
{
  return static MetricsPageType.transcript.getter();
}

uint64_t sub_3D3FD0()
{
  return static MetricsPageType.searchResults.getter();
}

uint64_t sub_3D3FE0()
{
  return static MetricsPageType.room.getter();
}

uint64_t sub_3D3FF0()
{
  return static MetricsPageType.show.getter();
}

uint64_t sub_3D4000()
{
  return static MetricsPageType.genre.getter();
}

uint64_t sub_3D4010()
{
  return static MetricsPageType.search.getter();
}

uint64_t sub_3D4020()
{
  return static MetricsPageType.channel.getter();
}

uint64_t sub_3D4030()
{
  return static MetricsPageType.episode.getter();
}

uint64_t sub_3D4040()
{
  return static MetricsPageType.landing.getter();
}

uint64_t sub_3D4050()
{
  return static MetricsPageType.welcome.getter();
}

uint64_t sub_3D4060()
{
  return static MetricsPageType.category.getter();
}

uint64_t sub_3D4070()
{
  return static MetricsTargetID.categories.getter();
}

uint64_t sub_3D4080()
{
  return static MetricsTargetID.downloaded.getter();
}

uint64_t sub_3D4090()
{
  return static MetricsTargetID.rssEpisode.getter();
}

uint64_t sub_3D40A0()
{
  return static MetricsTargetID.downloading.getter();
}

uint64_t sub_3D40B0()
{
  return static MetricsTargetID.latestEpisodes.getter();
}

uint64_t sub_3D40C0()
{
  return static MetricsTargetID.recentlyUpdated.getter();
}

uint64_t sub_3D40D0()
{
  return static MetricsTargetID.addFavoriteCategories.getter();
}

uint64_t sub_3D40E0()
{
  return static MetricsTargetID.manageFavoriteCategories.getter();
}

uint64_t sub_3D40F0()
{
  return static MetricsTargetID.close.getter();
}

uint64_t sub_3D4100()
{
  return static MetricsTargetID.saved.getter();
}

uint64_t sub_3D4110()
{
  return static MetricsTargetID.shows.getter();
}

uint64_t sub_3D4120()
{
  return static MetricsTargetID.cancel.getter();
}

uint64_t sub_3D4130()
{
  return static MetricsTargetID.manage.getter();
}

uint64_t sub_3D4140()
{
  return static MetricsTargetID.seeAll.getter();
}

uint64_t sub_3D4150()
{
  return static MetricsTargetID.channels.getter();
}

uint64_t sub_3D4160()
{
  return static ContentReference.show(adamID:)();
}

uint64_t sub_3D4170()
{
  return static ContentReference.channel(adamID:)();
}

uint64_t sub_3D4180()
{
  return static ContentReference.episode(adamID:)();
}

uint64_t sub_3D4190()
{
  return EpisodeMediaType.rawValue.getter();
}

uint64_t sub_3D41A0()
{
  return EpisodePlayState.isEpisodePlayed.getter();
}

uint64_t sub_3D41B0()
{
  return EpisodePlayState.isEpisodePlaying.getter();
}

uint64_t sub_3D41C0()
{
  return static EpisodePlayState.== infix(_:_:)();
}

uint64_t sub_3D41D0()
{
  return type metadata accessor for EpisodePlayState();
}

uint64_t sub_3D41E0()
{
  return MediaAPIResponse.objects.getter();
}

uint64_t sub_3D41F0()
{
  return type metadata accessor for TranscriptSource();
}

uint64_t sub_3D4200()
{
  return static EpisodeUserFilter.defaultFilter(seasonToShow:hidesPlayedEpisodes:)();
}

uint64_t sub_3D4210()
{
  return EpisodeUserFilter.isSeasonal.getter();
}

uint64_t sub_3D4220(Swift::Bool hidesPlayedEpisodes)
{
  return EpisodeUserFilter.shelfTitle(hidesPlayedEpisodes:)(hidesPlayedEpisodes)._countAndFlagsBits;
}

uint64_t sub_3D4230()
{
  return EpisodeUserFilter.symbolName.getter();
}

uint64_t sub_3D4240()
{
  return EpisodeUserFilter.emptyMessage.getter();
}

uint64_t sub_3D4250()
{
  return EpisodeUserFilter.basePredicate.getter();
}

uint64_t sub_3D4270()
{
  return EpisodeUserFilter.supportsHidesPlayedEpisodes.getter();
}

uint64_t sub_3D4280()
{
  return static EpisodeUserFilter.== infix(_:_:)();
}

uint64_t sub_3D4290()
{
  return EpisodeUserFilter.title.getter();
}

uint64_t sub_3D42A0()
{
  return EpisodeUserFilter.canonical.getter();
}

uint64_t sub_3D42C0()
{
  return static MetricsActionType.cancelDownload.getter();
}

uint64_t sub_3D42D0()
{
  return static MetricsActionType.removeDownload.getter();
}

uint64_t sub_3D42E0()
{
  return static MetricsActionType.turnOnAutoDownloads.getter();
}

uint64_t sub_3D42F0()
{
  return static MetricsActionType.turnOffAutoDownloads.getter();
}

uint64_t sub_3D4300()
{
  return static MetricsActionType.hint.getter();
}

uint64_t sub_3D4310()
{
  return static MetricsActionType.play.getter();
}

uint64_t sub_3D4320()
{
  return static MetricsActionType.save.getter();
}

uint64_t sub_3D4330()
{
  return static MetricsActionType.input.getter();
}

uint64_t sub_3D4350()
{
  return static MetricsActionType.follow.getter();
}

uint64_t sub_3D4360()
{
  return static MetricsActionType.submit.getter();
}

uint64_t sub_3D4370()
{
  return static MetricsActionType.unsave.getter();
}

uint64_t sub_3D4380()
{
  return static MetricsActionType.dismiss.getter();
}

uint64_t sub_3D4390()
{
  return static MetricsActionType.download.getter();
}

uint64_t sub_3D43A0()
{
  return static MetricsActionType.navigate.getter();
}

uint64_t sub_3D43B0()
{
  return static MetricsActionType.unfollow.getter();
}

uint64_t sub_3D43C0()
{
  return static MetricsTargetType.description.getter();
}

uint64_t sub_3D43D0()
{
  return static MetricsTargetType.powerSwoosh.getter();
}

uint64_t sub_3D43E0()
{
  return static MetricsTargetType.transcriptText.getter();
}

uint64_t sub_3D43F0()
{
  return static MetricsTargetType.powerSwooshItem.getter();
}

uint64_t sub_3D4400()
{
  return static MetricsTargetType.key.getter();
}

uint64_t sub_3D4410()
{
  return static MetricsTargetType.tab.getter();
}

uint64_t sub_3D4420()
{
  return static MetricsTargetType.link.getter();
}

uint64_t sub_3D4430()
{
  return static MetricsTargetType.banner.getter();
}

uint64_t sub_3D4440()
{
  return static MetricsTargetType.button.getter();
}

uint64_t sub_3D4450()
{
  return static MetricsTargetType.filter.getter();
}

uint64_t sub_3D4460()
{
  return static MetricsTargetType.lockup.getter();
}

uint64_t sub_3D4470()
{
  return static MetricsTargetType.swoosh.getter();
}

uint64_t sub_3D4480()
{
  return static MetricsTargetType.category.getter();
}

uint64_t sub_3D4490()
{
  return static MetricsTargetType.listItem.getter();
}

uint64_t sub_3D44A0()
{
  return static MetricsTargetType.bubbleTip.getter();
}

uint64_t sub_3D44B0()
{
  return type metadata accessor for OAuthSessionError();
}

uint64_t sub_3D44C0(Swift::String _, Swift::String comment)
{
  return PFLocalizedString(_:comment:)(_, comment)._countAndFlagsBits;
}

uint64_t sub_3D44D0()
{
  return PodcastStateModel.SanitizedState.rawValue.getter();
}

uint64_t sub_3D44E0()
{
  return type metadata accessor for ImageProviderError();
}

uint64_t sub_3D44F0()
{
  return InMemoryAssetCache.asset(at:)();
}

uint64_t sub_3D4500()
{
  return InMemoryAssetCache.store(asset:at:)();
}

uint64_t sub_3D4510()
{
  return InMemoryStateStore.didSucceedInFlightRequest(for:requestID:)();
}

uint64_t sub_3D4520()
{
  return InMemoryStateStore.didFailInFlightRequest(for:requestID:)();
}

uint64_t sub_3D4530()
{
  return InMemoryStateStore.registerInFlightStateChangeRequest(for:to:requestID:)();
}

uint64_t sub_3D4540()
{
  return static MetricsContentKind.episode.getter();
}

uint64_t sub_3D4550()
{
  return static MetricsPageContext.categories.getter();
}

uint64_t sub_3D4560()
{
  return static MetricsPageContext.downloaded.getter();
}

uint64_t sub_3D4570()
{
  return static MetricsPageContext.latestEpisodes.getter();
}

uint64_t sub_3D4580()
{
  return static MetricsPageContext.recentlyUpdated.getter();
}

uint64_t sub_3D4590()
{
  return static MetricsPageContext.shows.getter();
}

uint64_t sub_3D45A0()
{
  return static MetricsPageContext.browse.getter();
}

uint64_t sub_3D45B0()
{
  return static MetricsPageContext.listen.getter();
}

uint64_t sub_3D45C0()
{
  return static MetricsPageContext.search.getter();
}

uint64_t sub_3D45D0()
{
  return static MetricsPageContext.library.getter();
}

uint64_t sub_3D45E0()
{
  return static MetricsPageContext.station.getter();
}

uint64_t sub_3D45F0()
{
  return static MetricsPageContext.channels.getter();
}

uint64_t sub_3D4600()
{
  return static MetricsPageContext.bookmarks.getter();
}

uint64_t sub_3D4610()
{
  return static MetricsPageContext.topCharts.getter();
}

uint64_t sub_3D4620()
{
  return PageContextTracker.pop()();
}

uint64_t sub_3D4630()
{
  return PageContextTracker.copy()();
}

uint64_t sub_3D4640()
{
  return PageContextTracker.push(_:)();
}

uint64_t sub_3D4650()
{
  return PageContextTracker.value.getter();
}

uint64_t sub_3D4660()
{
  return static PageContextTracker.shared.getter();
}

uint64_t sub_3D4670()
{
  return type metadata accessor for PageContextTracker();
}

uint64_t sub_3D4680()
{
  return dispatch thunk of PaginatedPublisher.loadNextPage()();
}

uint64_t sub_3D4690()
{
  return PaginatedPublisher.paginatedMap<A>(_:)();
}

uint64_t sub_3D46A0()
{
  return PaginatedPublisher.paginatedPrepend(_:)();
}

uint64_t sub_3D46B0()
{
  return PurchaseController.getStateFromMediaAPI(condition:)();
}

uint64_t sub_3D46C0()
{
  return AssetProcessingStep<>.prepareImageForDestination()();
}

uint64_t sub_3D46D0()
{
  return AssetProcessingStep<>.cache<A>(_:format:overwrite:)();
}

uint64_t sub_3D46E0()
{
  return AssetProcessingStep.receive(on:)();
}

uint64_t sub_3D46F0()
{
  return AssetProcessingStep.fallback<A>(to:rethrow:)();
}

uint64_t sub_3D4700()
{
  return AssetProcessingStep.subscribe(on:)();
}

uint64_t sub_3D4710()
{
  return EpisodeListSettings.pubDateLimit.getter();
}

uint64_t sub_3D4720()
{
  return EpisodeListSettings.pubDateLimit.setter();
}

uint64_t sub_3D4730()
{
  return EpisodeListSettings.hidePlayedEpisodes.getter();
}

uint64_t sub_3D4740()
{
  return EpisodeListSettings.hidePlayedEpisodes.setter();
}

uint64_t sub_3D4750()
{
  return EpisodeListSettings.sort.getter();
}

uint64_t sub_3D4760()
{
  return EpisodeListSettings.sort.setter();
}

uint64_t sub_3D4770()
{
  return EpisodeListSettings.listType.getter();
}

uint64_t sub_3D4780()
{
  return type metadata accessor for EpisodeListSettings();
}

uint64_t sub_3D4790()
{
  return EpisodeListSettings.init(_:sort:pubDateLimit:hidePlayedEpisodes:hideTrailers:hideVideoEpisodes:)();
}

uint64_t sub_3D47A0()
{
  return dispatch thunk of EpisodeStateMachine.addStateTransitionObserver(_:action:)();
}

uint64_t sub_3D47B0()
{
  return dispatch thunk of EpisodeStateMachine.removeStateTransitionActions(for:)();
}

uint64_t sub_3D47C0()
{
  return dispatch thunk of EpisodeStateMachine.currentState.getter();
}

uint64_t sub_3D47D0()
{
  return static MetricsActionResult.app.getter();
}

uint64_t sub_3D47E0()
{
  return static MetricsActionResult.appStore.getter();
}

uint64_t sub_3D47F0()
{
  return PerformanceLoadable.init(log:signpostName:startMetadata:)();
}

uint64_t sub_3D4800()
{
  return PerformanceLoadable.value.modify();
}

uint64_t sub_3D4810()
{
  return PerformanceLoadable.value.getter();
}

uint64_t sub_3D4820()
{
  return PerformanceLoadable.value.setter();
}

uint64_t sub_3D4830()
{
  return type metadata accessor for PerformanceLoadable();
}

uint64_t sub_3D4840()
{
  return dispatch thunk of PodcastStateMachine.addStateTransitionObserver(_:action:)();
}

uint64_t sub_3D4850()
{
  return dispatch thunk of PodcastStateMachine.currentState.getter();
}

uint64_t sub_3D4860()
{
  return SignpostAndLogTrace(domain:level:)();
}

uint64_t sub_3D4870()
{
  return dispatch thunk of SubscriptionSubject.value.getter();
}

uint64_t sub_3D4880()
{
  return SubscriptionSubject.init<A>(_:)();
}

uint64_t sub_3D4890()
{
  return EpisodeBookmarkState.isEpisodeBookmarked.getter();
}

uint64_t sub_3D48A0()
{
  return static EpisodeBookmarkState.== infix(_:_:)();
}

uint64_t sub_3D48B0()
{
  return EpisodeDownloadState.isDownloadedEpisode.getter();
}

uint64_t sub_3D48C0()
{
  return EpisodeDownloadState.isEpisodeFromiTunesSync.getter();
}

uint64_t sub_3D48D0()
{
  return EpisodeDownloadState.isDownloadingOrDownloaded.getter();
}

uint64_t sub_3D48E0()
{
  return type metadata accessor for EpisodeDownloadState();
}

uint64_t sub_3D48F0()
{
  return static MetricsActionContext.bubbleTip.getter();
}

uint64_t sub_3D4900()
{
  return static MetricsWidgetContext.decodeFromString(_:)();
}

uint64_t sub_3D4910()
{
  return MetricsWidgetContext.metricsDictionary.getter();
}

uint64_t sub_3D4920()
{
  return type metadata accessor for MetricsWidgetContext();
}

uint64_t sub_3D4930()
{
  return static NotificationSettings.canSendNotification()();
}

uint64_t sub_3D4940()
{
  return type metadata accessor for NotificationSettings();
}

uint64_t sub_3D4950()
{
  return type metadata accessor for ServerPodcastEpisode();
}

uint64_t sub_3D4960()
{
  return DeviceCapacityMonitor.addCapacityChangeObserver(options:callback:)();
}

void sub_3D4970(Swift::Int64 with)
{
}

uint64_t sub_3D4980()
{
  return DeviceCapacityMonitor.CapacityLevel.rawValue.getter();
}

uint64_t sub_3D4990()
{
  return static DeviceCapacityMonitor.shared.getter();
}

uint64_t sub_3D49A0()
{
  return type metadata accessor for DeviceCapacityMonitor();
}

uint64_t sub_3D49C0()
{
  return RetriggerableDeferred.init(createPublisher:)();
}

uint64_t sub_3D49D0()
{
  return type metadata accessor for ThinClientStateDomain();
}

uint64_t sub_3D49E0()
{
  return kMTCategoryEntityName.getter();
}

uint64_t sub_3D49F0()
{
  return EpisodeListenNowReason.stringDescriptionForPrototypeUpNext()()._countAndFlagsBits;
}

uint64_t sub_3D4A00()
{
  return type metadata accessor for EpisodeListenNowReason();
}

uint64_t sub_3D4A10()
{
  return dispatch thunk of EpisodeStateController.stateMachine(for:)();
}

uint64_t sub_3D4A20()
{
  return EpisodeStateController.stateMachine(for:)();
}

uint64_t sub_3D4A30()
{
  return EpisodeStateController.stateMachine(for:)();
}

uint64_t sub_3D4A40()
{
  return EpisodeStateController<>.modernEpisodeDownloadStateMachine(for:)();
}

uint64_t sub_3D4A50()
{
  return EpisodeStateController<>.modernEpisodeDownloadStateMachine(for:)();
}

uint64_t sub_3D4A60()
{
  return static EpisodeStateIdentifier.== infix(_:_:)();
}

uint64_t sub_3D4A70()
{
  return dispatch thunk of PodcastStateController.stateMachine(for:initialState:)();
}

uint64_t sub_3D4A80()
{
  return dispatch thunk of PodcastStateController.stateMachine(for:initialState:)();
}

uint64_t sub_3D4A90()
{
  return static RestrictionsController.isExplicitContentAllowed.getter();
}

uint64_t sub_3D4AA0()
{
  return type metadata accessor for RestrictionsController();
}

uint64_t sub_3D4AB0()
{
  return AnalyticsUserIdentifier.userUnder13YearsOld.getter();
}

uint64_t sub_3D4AC0()
{
  return AnalyticsUserIdentifier.userIsManagedAccount.getter();
}

uint64_t sub_3D4AD0()
{
  return AnalyticsUserIdentifier.userAllowsPersonalization.getter();
}

uint64_t sub_3D4AE0()
{
  return AnalyticsUserIdentifier.userId.getter();
}

uint64_t sub_3D4AF0()
{
  return AnalyticsUserIdentifier.init(clientId:userId:userAllowsPersonalization:userUnder13YearsOld:userIsManagedAccount:)();
}

uint64_t sub_3D4B00()
{
  return AnalyticsUserIdentifier.clientId.getter();
}

uint64_t sub_3D4B10()
{
  return type metadata accessor for AnalyticsUserIdentifier();
}

uint64_t sub_3D4B20()
{
  return InMemoryStateRepository.requestFollowStatesIfNeeded(for:)();
}

uint64_t sub_3D4B30()
{
  return InMemoryStateRepository.requestEpisodeStatesIfNeeded(for:)();
}

void sub_3D4B40(Swift::OpaquePointer remoteFollowStates)
{
}

void sub_3D4B50(Swift::OpaquePointer remoteEpisodeStates)
{
}

void sub_3D4B60(Swift::OpaquePointer remoteBookmarkStates)
{
}

uint64_t sub_3D4B70()
{
  return InMemoryStateRepository.publisher(for:)();
}

uint64_t sub_3D4B80()
{
  return type metadata accessor for InMemoryStateRepository();
}

uint64_t sub_3D4B90()
{
  return PendingPlaybackMetadata.init(adamId:uuid:)();
}

uint64_t sub_3D4BA0()
{
  return type metadata accessor for PendingPlaybackMetadata();
}

uint64_t sub_3D4BB0()
{
  return RecommendationsMetadata.Categories.init(liked:disliked:)();
}

uint64_t sub_3D4BC0()
{
  return type metadata accessor for RecommendationsMetadata.Categories();
}

uint64_t _s8ShelfKit26ManageCategoriesPageIntentV2eeoiySbAC_ACtFZ_0()
{
  return static RecommendationsMetadata.== infix(_:_:)();
}

uint64_t sub_3D4BE0()
{
  return RecommendationsMetadata.Shows.init(followed:unfollowed:disliked:)();
}

uint64_t sub_3D4BF0()
{
  return type metadata accessor for RecommendationsMetadata.Shows();
}

uint64_t sub_3D4C00()
{
  return RecommendationsMetadata.Channels.init(subscribed:liked:disliked:)();
}

uint64_t sub_3D4C10()
{
  return type metadata accessor for RecommendationsMetadata.Channels();
}

uint64_t sub_3D4C20()
{
  return RecommendationsMetadata.Episodes.init(recentlyPlayed:)();
}

uint64_t sub_3D4C30()
{
  return type metadata accessor for RecommendationsMetadata.Episodes();
}

uint64_t sub_3D4C40()
{
  return RecommendationsMetadata.Analytics.init(clientID:userID:userAllowsPersonalization:userIsManagedAccount:userIsUnder13:)();
}

uint64_t sub_3D4C50()
{
  return type metadata accessor for RecommendationsMetadata.Analytics();
}

uint64_t sub_3D4C60()
{
  return RecommendationsMetadata.init(analytics:categories:channels:episodes:shows:)();
}

uint64_t sub_3D4C70()
{
  return type metadata accessor for RecommendationsMetadata();
}

uint64_t sub_3D4C80()
{
  return CacheAssetProcessingStep.publisher.getter();
}

uint64_t sub_3D4C90()
{
  return type metadata accessor for CacheDeleteNotifications.CacheDeleteEvent();
}

uint64_t sub_3D4CA0()
{
  return dispatch thunk of CacheDeleteNotifications.makeAsyncIterator()();
}

uint64_t sub_3D4CB0()
{
  return CacheDeleteNotifications.init(paths:)();
}

uint64_t sub_3D4CC0()
{
  return type metadata accessor for CacheDeleteNotifications();
}

uint64_t sub_3D4CD0()
{
  return CategoryObserverProvider.init(asPartOf:)();
}

uint64_t sub_3D4CE0()
{
  return type metadata accessor for CategoryObserverProvider();
}

uint64_t sub_3D4CF0()
{
  return InterestObserverProvider.determineIfUserIsColdStartUser(completion:)();
}

uint64_t sub_3D4D00()
{
  return InterestObserverProvider.userIsColdStartUserPublisher<A>()();
}

uint64_t sub_3D4D10()
{
  return InterestObserverProvider.userAppSessionsCountPublisher.getter();
}

uint64_t sub_3D4D20()
{
  return InterestObserverProvider.favoritedInterestsCountPublisher.getter();
}

uint64_t sub_3D4D30()
{
  return InterestObserverProvider.favoritedInterestsCategoriesPublisher.getter();
}

uint64_t sub_3D4D40()
{
  return InterestObserverProvider.dismissedInlineSelectionModulePublisher.getter();
}

uint64_t sub_3D4D50()
{
  return type metadata accessor for InterestObserverProvider();
}

uint64_t sub_3D4D60()
{
  return DatabasePropertyPublisher.init(objectsToObserve:entitiesToObserve:notificationCenter:)();
}

uint64_t sub_3D4D70()
{
  return type metadata accessor for DatabasePropertyPublisher();
}

uint64_t sub_3D4D80()
{
  return dispatch thunk of MetricsFieldRepresentable.metricsFieldRepresentation()();
}

uint64_t sub_3D4D90()
{
  return dispatch thunk of MetricsFieldRepresentable.init(metricsFieldValue:)();
}

uint64_t sub_3D4DA0()
{
  return PurchaseControllerWrapper.purchaseController.getter();
}

uint64_t sub_3D4DB0()
{
  return static PurchaseControllerWrapper.sharedInstance.getter();
}

uint64_t sub_3D4DC0()
{
  return type metadata accessor for PurchaseControllerWrapper();
}

uint64_t sub_3D4DD0()
{
  return ThinClientStateRepository.registerInFlightStateChangeRequest(for:to:requestID:)();
}

uint64_t sub_3D4DE0()
{
  return ThinClientStateRepository.didFailInFlightRequest(for:requestID:domain:)();
}

uint64_t sub_3D4DF0()
{
  return ThinClientStateRepository.didSucceedInFlightRequest(for:requestID:domain:)();
}

void sub_3D4E00(Swift::OpaquePointer remoteStates)
{
}

uint64_t sub_3D4E10()
{
  return ThinClientStateRepository<>.requestPodcastStatesIfNeeded(for:)();
}

uint64_t sub_3D4E20()
{
  return ThinClientStateRepository<>.registerInFlightPlayStateChangeRequest(for:to:requestID:)();
}

uint64_t sub_3D4E30()
{
  return ThinClientStateRepository<>.registerInFlightBookmarkStateChangeRequest(for:to:requestID:)();
}

uint64_t sub_3D4E40()
{
  return ThinClientStateRepository<>.requestEpisodeStatesIfNeeded(for:)();
}

uint64_t sub_3D4E50()
{
  return ThinClientStateRepository<>.register(remoteBookmarkStates:)();
}

uint64_t sub_3D4E60()
{
  return static AnalyticsIdentifierManager.resetInterval.getter();
}

uint64_t sub_3D4E70()
{
  return static AnalyticsIdentifierManager.sharedInstance.getter();
}

uint64_t sub_3D4E80()
{
  return dispatch thunk of AnalyticsIdentifierManager.identifierPromise.getter();
}

uint64_t sub_3D4E90()
{
  return type metadata accessor for AnalyticsIdentifierManager();
}

uint64_t sub_3D4EA0()
{
  return PlayButtonTimeFormatHelper.FormatStyle.formatStyleUnits.getter();
}

uint64_t sub_3D4EB0()
{
  return static PlayButtonTimeFormatHelper.FormatStyle.== infix(_:_:)();
}

uint64_t sub_3D4EC0()
{
  return PlayButtonTimeFormatHelper.formatStyle.getter();
}

uint64_t sub_3D4ED0()
{
  return PlayButtonTimeFormatHelper.showsProgressBar.getter();
}

uint64_t sub_3D4EE0()
{
  return PlayButtonTimeFormatHelper.init(timeLeft:duration:)();
}

uint64_t sub_3D4EF0()
{
  return PlayButtonTimeFormatHelper.timeLeft.getter();
}

uint64_t sub_3D4F00()
{
  return type metadata accessor for PlayButtonTimeFormatHelper();
}

uint64_t sub_3D4F10()
{
  return type metadata accessor for PlaybackPositionController();
}

uint64_t sub_3D4F20()
{
  return dispatch thunk of PurchaseControllerProtocol.recentlyEntitledProductsPublisher.getter();
}

uint64_t sub_3D4F30()
{
  return FetchedResultsListPublisher.init(identifier:entityName:predicate:sortDescriptors:pageSize:managedObjectContext:receiveOn:transform:updateRequiredComparator:)();
}

uint64_t sub_3D4F40()
{
  return dispatch thunk of OAuthHUDViewHandlerProtocol.displayAlert(title:description:)();
}

uint64_t sub_3D4F50()
{
  return dispatch thunk of OAuthHUDViewHandlerProtocol.spinnerIsActive.getter();
}

uint64_t sub_3D4F60()
{
  return dispatch thunk of OAuthHUDViewHandlerProtocol.start()();
}

uint64_t sub_3D4F70()
{
  return dispatch thunk of OAuthHUDViewHandlerProtocol.dismiss(success:)();
}

uint64_t sub_3D4F80()
{
  return ThinClientEpisodeStateModel.init(playbackData:duration:isBookmarked:)();
}

uint64_t sub_3D4F90()
{
  return type metadata accessor for ThinClientEpisodeStateModel();
}

uint64_t sub_3D4FA0()
{
  return dispatch thunk of ArtworkSizeBucketingStrategy.bucketedSize(for:)();
}

uint64_t sub_3D4FB0()
{
  return FetchedResultsCountPublisher.init(identifier:entityName:predicate:managedObjectContext:receiveOn:)();
}

uint64_t sub_3D4FC0()
{
  return type metadata accessor for FetchedResultsCountPublisher();
}

uint64_t sub_3D4FD0()
{
  return TranscriptRequestInformation.init(episodeAdamId:episodeTitle:ttmlIdentifier:selectedTextTimeInterval:showName:source:)();
}

uint64_t sub_3D4FE0()
{
  return TranscriptRequestInformation.episodeAdamId.getter();
}

uint64_t sub_3D4FF0()
{
  return TranscriptRequestInformation.ttmlIdentifier.getter();
}

uint64_t sub_3D5000()
{
  return type metadata accessor for TranscriptRequestInformation();
}

uint64_t sub_3D5010()
{
  return static DeferredLaunchTaskCoordinator.shared.getter();
}

uint64_t sub_3D5020()
{
  return dispatch thunk of DeferredLaunchTaskCoordinator.deferred(on:perform:)();
}

uint64_t sub_3D5030()
{
  return type metadata accessor for DeferredLaunchTaskCoordinator();
}

uint64_t sub_3D5060()
{
  return ThinClientGlobalStateRepository.publisher(for:)();
}

uint64_t sub_3D5070()
{
  return type metadata accessor for ThinClientGlobalStateRepository();
}

uint64_t sub_3D5080()
{
  return type metadata accessor for AbbreviatedTimeIntervalFormatter.Configuration();
}

uint64_t sub_3D5090()
{
  return dispatch thunk of CategoryObserverProviderProtocol.categoriesCountForCategoriesInLibraryPublisher.getter();
}

uint64_t sub_3D50A0()
{
  return OAuthAuthenticationErrorResponse.sessionError.getter();
}

uint64_t sub_3D50B0()
{
  return OAuthAuthenticationErrorResponse.init(body:)();
}

uint64_t sub_3D50C0()
{
  return type metadata accessor for OAuthAuthenticationErrorResponse();
}

uint64_t sub_3D50D0()
{
  return FetchedResultsSingleItemPublisher.init(identifier:entityName:predicate:managedObjectContext:receiveOn:transform:updateRequiredComparator:)();
}

uint64_t sub_3D50E0()
{
  return ModernEpisodeDownloadStateMachine.currentState.getter();
}

uint64_t sub_3D50F0()
{
  return dispatch thunk of PendingPlaybackControllerProtocol.preflight(_:)();
}

uint64_t sub_3D5100()
{
  return type metadata accessor for PodcastPlaybackPositionDataAttributes();
}

uint64_t sub_3D5110()
{
  return Color.color.getter();
}

uint64_t sub_3D5120()
{
  return dispatch thunk of Trace.identifier.getter();
}

uint64_t sub_3D5130()
{
  return static AdamID.empty.getter();
}

uint64_t sub_3D5140()
{
  return static AdamID.parse(_:)();
}

uint64_t sub_3D5150()
{
  return AdamID.isEmpty.getter();
}

uint64_t sub_3D5160()
{
  return AdamID.init(rawValue:)();
}

uint64_t sub_3D5170()
{
  return AdamID.init(_:)();
}

uint64_t sub_3D5180()
{
  return CropCode.rawValue.getter();
}

uint64_t sub_3D5190()
{
  return type metadata accessor for CropCode();
}

uint64_t sub_3D51A0()
{
  return HexColor.init(_:)();
}

uint64_t sub_3D51B0()
{
  return Loadable.map<A>(_:)();
}

uint64_t sub_3D51C0()
{
  return Loadable.item.getter();
}

uint64_t sub_3D51D0()
{
  return Loadable.failed.getter();
}

uint64_t sub_3D51E0()
{
  return Loadable.coalesce(update:keepLoadedDataOnFailure:droppingNewNotLoadeds:)();
}

uint64_t sub_3D51F0()
{
  return Loadable.notLoaded.getter();
}

uint64_t sub_3D5200()
{
  return Loadable.init()();
}

uint64_t sub_3D5210()
{
  return ShowType.mtPodcastShowType.getter();
}

uint64_t sub_3D5220()
{
  return ShowType.rawValue.getter();
}

uint64_t sub_3D5230()
{
  return FRPOutput.totalCount.getter();
}

uint64_t sub_3D5240()
{
  return FRPOutput.map<A>(_:)();
}

uint64_t sub_3D5250()
{
  return FRPOutput.init(content:hasMore:totalCount:)();
}

uint64_t sub_3D5260()
{
  return FRPOutput.content.getter();
}

uint64_t sub_3D5270()
{
  return FRPOutput.hasMore.getter();
}

uint64_t sub_3D5280()
{
  return type metadata accessor for PriceType();
}

uint64_t sub_3D5290()
{
  return Traceable.traced(by:)();
}

uint64_t sub_3D52A0()
{
  return ActionButton.init(role:action:label:)();
}

uint64_t sub_3D52B0()
{
  return _HashTable.UnsafeHandle._startIterator(bucket:)();
}

uint64_t sub_3D52C0()
{
  return _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)();
}

uint64_t sub_3D52D0()
{
  return _HashTable.UnsafeHandle.subscript.setter();
}

uint64_t sub_3D52E0()
{
  return _HashTable.BucketIterator.currentValue.getter();
}

uint64_t sub_3D52F0()
{
  return _HashTable.BucketIterator.currentValue.setter();
}

void sub_3D5300()
{
}

uint64_t sub_3D5310()
{
  return static _HashTable.maximumCapacity(forScale:)();
}

uint64_t sub_3D5320()
{
  return static _HashTable.minimumCapacity(forScale:)();
}

uint64_t sub_3D5330()
{
  return _HashTable.copy()();
}

uint64_t sub_3D5340()
{
  return static _HashTable.scale(forCapacity:)();
}

uint64_t sub_3D5350()
{
  return _HashTable.init(scale:reservedScale:)();
}

uint64_t sub_3D5360()
{
  return UTType.identifier.getter();
}

uint64_t sub_3D5370()
{
  return static UTType.audio.getter();
}

uint64_t sub_3D5380()
{
  return static UTType.movie.getter();
}

uint64_t sub_3D5390()
{
  return type metadata accessor for UTType();
}

uint64_t sub_3D53A0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_3D53B0()
{
  return os_signpost(_:dso:log:name:signpostID:_:_:)();
}

uint64_t sub_3D53C0()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t sub_3D53D0()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_3D53E0()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_3D53F0()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t sub_3D5400()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_3D5410()
{
  return OSSignpostID.init(_:)();
}

uint64_t sub_3D5420()
{
  return static OSSignposter.js.getter();
}

uint64_t sub_3D5430()
{
  return static OSSignposter.search.getter();
}

uint64_t sub_3D5440()
{
  return static OSSignposter.artwork.getter();
}

uint64_t sub_3D5450()
{
  return static OSSignposter.downloads.getter();
}

uint64_t sub_3D5460()
{
  return static OSSignposter.following.getter();
}

uint64_t sub_3D5470()
{
  return static OSSignposter.listenNow.getter();
}

uint64_t sub_3D5480()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_3D5490()
{
  return OSSignposter.init(subsystem:category:)();
}

uint64_t sub_3D54A0()
{
  return type metadata accessor for OSSignposter();
}

uint64_t sub_3D54B0()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t sub_3D54C0()
{
  return OSAllocatedUnfairLock.current.getter();
}

uint64_t sub_3D54D0()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t sub_3D54E0()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t sub_3D54F0()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t sub_3D5500()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_3D5510()
{
  return static Logger.appIntents.getter();
}

uint64_t sub_3D5520()
{
  return static Logger.navigation.getter();
}

uint64_t sub_3D5530()
{
  return static Logger.libraryShow.getter();
}

uint64_t sub_3D5540()
{
  return static Logger.transcripts.getter();
}

uint64_t sub_3D5550()
{
  return static Logger.modernPlayback.getter();
}

uint64_t sub_3D5560()
{
  return static Logger.rssFeedUpdater.getter();
}

uint64_t sub_3D5570()
{
  return static Logger.thinClientState.getter();
}

uint64_t sub_3D5580()
{
  return static Logger.podcastsStatesCoordination.getter();
}

uint64_t sub_3D5590()
{
  return static Logger.js.getter();
}

uint64_t sub_3D55A0()
{
  return static Logger.ui.getter();
}

uint64_t sub_3D55B0()
{
  return static Logger.tips.getter();
}

uint64_t sub_3D55C0()
{
  return static Logger.artwork.getter();
}

uint64_t sub_3D55D0()
{
  return static Logger.database.getter();
}

uint64_t sub_3D55E0()
{
  return static Logger.settings.getter();
}

uint64_t sub_3D55F0()
{
  return static Logger.downloads.getter();
}

uint64_t sub_3D5600()
{
  return static Logger.following.getter();
}

uint64_t sub_3D5610()
{
  return static Logger.interests.getter();
}

uint64_t sub_3D5620()
{
  return static Logger.purchases.getter();
}

uint64_t sub_3D5630()
{
  return Logger.logObject.getter();
}

uint64_t sub_3D5640()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3D5650()
{
  return UICellAccessory.LabelOptions.init(isHidden:reservedLayoutWidth:tintColor:font:adjustsFontForContentSizeCategory:)();
}

uint64_t sub_3D5660()
{
  return type metadata accessor for UICellAccessory.LabelOptions();
}

uint64_t sub_3D5670()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t sub_3D5680()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t sub_3D5690()
{
  return static UICellAccessory.label(text:displayed:options:)();
}

uint64_t sub_3D56A0()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t sub_3D56B0()
{
  return CustomCombineIdentifierConvertible<>.combineIdentifier.getter();
}

uint64_t sub_3D56C0()
{
  return Publishers.CombineLatest.init(_:_:)();
}

uint64_t sub_3D56D0()
{
  return Publishers.CombineLatest3.init(_:_:_:)();
}

uint64_t sub_3D56E0()
{
  return Publishers.CompactMap.compactMap<A>(_:)();
}

uint64_t sub_3D56F0()
{
  return Publishers.CompactMap.map<A>(_:)();
}

uint64_t sub_3D5700()
{
  return type metadata accessor for Publishers.SetFailureType();
}

uint64_t sub_3D5710()
{
  return type metadata accessor for Publishers.SwitchToLatest();
}

uint64_t sub_3D5720()
{
  return Publishers.PFCombineLatest5.init(_:_:_:_:_:)();
}

uint64_t sub_3D5730()
{
  return Publishers.PFCombineLatest6.init(_:_:_:_:_:_:)();
}

uint64_t sub_3D5740()
{
  return Publishers.PFCombineLatestMany.init(_:)();
}

uint64_t sub_3D5750()
{
  return Publishers.Map.map<A>(_:)();
}

uint64_t sub_3D5760()
{
  return type metadata accessor for Publishers.Map();
}

uint64_t sub_3D5770()
{
  return type metadata accessor for Publishers.Catch();
}

uint64_t sub_3D5780()
{
  return type metadata accessor for Publishers.FlatMap();
}

uint64_t sub_3D5790()
{
  return type metadata accessor for Publishers.ReceiveOn();
}

uint64_t sub_3D57A0()
{
  return dispatch thunk of Subscriber.receive(subscription:)();
}

uint64_t sub_3D57B0()
{
  return dispatch thunk of Subscriber.receive(_:)();
}

uint64_t sub_3D57C0()
{
  return static Subscribers.Demand.unlimited.getter();
}

uint64_t sub_3D57D0()
{
  return type metadata accessor for AnyPublisher();
}

uint64_t sub_3D57E0()
{
  return AnyCancellable.store(in:)();
}

uint64_t sub_3D57F0()
{
  return AnyCancellable.store<A>(in:)();
}

void sub_3D5800()
{
}

uint64_t sub_3D5810()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t sub_3D5820()
{
  return dispatch thunk of ObservableObject.objectWillChange.getter();
}

uint64_t sub_3D5830()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_3D5840()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_3D5850()
{
  return PassthroughSubject.init()();
}

uint64_t sub_3D5860()
{
  return CurrentValueSubject.send(completion:)();
}

uint64_t sub_3D5870()
{
  return CurrentValueSubject.send(subscription:)();
}

uint64_t sub_3D5880()
{
  return CurrentValueSubject.send(_:)();
}

uint64_t sub_3D5890()
{
  return CurrentValueSubject.value.modify();
}

uint64_t sub_3D58A0()
{
  return CurrentValueSubject.value.getter();
}

uint64_t sub_3D58B0()
{
  return CurrentValueSubject.value.setter();
}

uint64_t sub_3D58C0()
{
  return CurrentValueSubject.receive<A>(subscriber:)();
}

uint64_t sub_3D58D0()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t sub_3D58E0()
{
  return ConnectablePublisher.autoconnect()();
}

void sub_3D58F0()
{
}

uint64_t sub_3D5900()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t sub_3D5910()
{
  return Fail.init(error:)();
}

uint64_t sub_3D5920()
{
  return type metadata accessor for Just();
}

uint64_t sub_3D5930()
{
  return Just.init(_:)();
}

uint64_t sub_3D5940()
{
  return Empty.init(completeImmediately:)();
}

uint64_t sub_3D5950()
{
  return Future<>.init(priority:unwrapping:)();
}

uint64_t sub_3D5960()
{
  return type metadata accessor for Future();
}

uint64_t sub_3D5970()
{
  return Future.init(_:)();
}

uint64_t sub_3D5980()
{
  return Subject<>.send()();
}

uint64_t sub_3D5990()
{
  return Deferred.init(createPublisher:)();
}

uint64_t sub_3D59A0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_3D59B0()
{
  return Published.projectedValue.getter();
}

uint64_t sub_3D59C0()
{
  return Published.projectedValue.setter();
}

uint64_t sub_3D59D0()
{
  return static Published.subscript.modify();
}

uint64_t sub_3D59E0()
{
  return static Published.subscript.getter();
}

uint64_t sub_3D59F0()
{
  return static Published.subscript.setter();
}

uint64_t sub_3D5A00()
{
  return type metadata accessor for Published();
}

uint64_t sub_3D5A10()
{
  return Publisher.emitPageRenderResourceEvents(using:onScreen:)();
}

uint64_t sub_3D5A20()
{
  return Publisher<>.paginatedSwitchToLatest()();
}

uint64_t sub_3D5A30()
{
  return Publisher.makeOptional.getter();
}

uint64_t sub_3D5A40()
{
  return Publisher.emitLifecycle(for:name:definesInterval:context:verbose:)();
}

uint64_t sub_3D5A50()
{
  return Publisher.mapToLoadable()();
}

uint64_t sub_3D5A60()
{
  return Publisher.nullifyFirstIf<A>(_:)();
}

uint64_t sub_3D5A70()
{
  return Publisher.bufferedMulticast()();
}

uint64_t sub_3D5A80()
{
  return Publisher.emitSignpostEvent(log:name:)();
}

uint64_t sub_3D5A90()
{
  return Publisher.replayingBufferedMulticast()();
}

uint64_t sub_3D5AA0()
{
  return Publisher.cache<A>(location:cache:overwrite:alwaysAttemptRefresh:)();
}

uint64_t sub_3D5AB0()
{
  return Publisher<>.switchToLatest()();
}

uint64_t sub_3D5AC0()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t sub_3D5AD0()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t sub_3D5AE0()
{
  return Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
}

uint64_t sub_3D5AF0()
{
  return Publisher.replaceError(with:)();
}

uint64_t sub_3D5B00()
{
  return Publisher.combineLatest<A, B, C>(_:_:_:)();
}

uint64_t sub_3D5B10()
{
  return Publisher.combineLatest<A>(_:)();
}

uint64_t sub_3D5B20()
{
  return Publisher.removeDuplicates(by:)();
}

uint64_t sub_3D5B30()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_3D5B40()
{
  return Publisher.map<A>(_:)();
}

uint64_t sub_3D5B50()
{
  return Publisher.scan<A>(_:_:)();
}

uint64_t sub_3D5B60()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t sub_3D5B70()
{
  return Publisher.catch<A>(_:)();
}

uint64_t sub_3D5B80()
{
  return Publisher.delay<A>(for:tolerance:scheduler:options:)();
}

uint64_t sub_3D5B90()
{
  return Publisher.first(where:)();
}

uint64_t sub_3D5BA0()
{
  return Publisher.first()();
}

uint64_t sub_3D5BB0()
{
  return Publisher.retry(_:)();
}

uint64_t sub_3D5BC0()
{
  return Publisher.prefix(_:)();
}

uint64_t sub_3D5BD0()
{
  return Publisher.tryMap<A>(_:)();
}

uint64_t sub_3D5BE0()
{
  return Publisher.collect()();
}

uint64_t sub_3D5BF0()
{
  return Publisher.flatMap<A>(maxPublishers:_:)();
}

uint64_t sub_3D5C00()
{
  return Publisher.flatMap<A, B>(maxPublishers:_:)();
}

uint64_t sub_3D5C10()
{
  return Publisher.prepend(_:)();
}

uint64_t sub_3D5C20()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t sub_3D5C30()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t sub_3D5C40()
{
  return Publisher.throttle<A>(for:scheduler:latest:)();
}

uint64_t sub_3D5C50()
{
  return Publisher.dropFirst(_:)();
}

uint64_t sub_3D5C60()
{
  return Publisher.subscribe<A>(on:options:)();
}

uint64_t sub_3D5C70()
{
  return Publisher.subscribe<A>(_:)();
}

uint64_t sub_3D5C80()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t sub_3D5C90()
{
  return Publisher<>.switchToLatest()();
}

uint64_t sub_3D5CA0()
{
  return Publisher<>.switchToLatest()();
}

uint64_t sub_3D5CB0()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t sub_3D5CC0()
{
  return Publisher<>.assign(to:)();
}

uint64_t sub_3D5CD0()
{
  return Publisher<>.flatMap<A>(maxPublishers:_:)();
}

uint64_t sub_3D5CE0()
{
  return Publisher<>.flatMap<A>(maxPublishers:_:)();
}

uint64_t sub_3D5CF0()
{
  return Animatable<>.animatableData.modify();
}

uint64_t sub_3D5D00()
{
  return static Animatable<>._makeAnimatable(value:inputs:)();
}

uint64_t sub_3D5D10()
{
  return static Animatable._makeAnimatable(value:inputs:)();
}

uint64_t sub_3D5D20()
{
  return static ButtonRole.destructive.getter();
}

uint64_t sub_3D5D30()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_3D5D40()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_3D5D50()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_3D5D60()
{
  return Transition.combined<A>(with:)();
}

uint64_t sub_3D5D70()
{
  return _ShapeView.init(shape:style:fillStyle:)();
}

uint64_t sub_3D5D80()
{
  return type metadata accessor for _ShapeView();
}

uint64_t sub_3D5D90()
{
  return AnyGradient.init(colors:locations:interpolations:)();
}

uint64_t sub_3D5DA0()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_3D5DB0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_3D5DC0()
{
  return static ContentMode.== infix(_:_:)();
}

uint64_t sub_3D5DD0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_3D5DE0()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_3D5DF0()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t sub_3D5E00()
{
  return Transaction.init(animation:)();
}

uint64_t sub_3D5E10()
{
  return type metadata accessor for _ClipEffect();
}

uint64_t sub_3D5E20()
{
  return type metadata accessor for _LayoutRoot();
}

uint64_t sub_3D5E30()
{
  return _LayoutRoot.init(_:)();
}

uint64_t sub_3D5E40()
{
  return ProgressView.init<A>(value:total:)();
}

uint64_t sub_3D5E70()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t sub_3D5E80()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t sub_3D5E90()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t sub_3D5EA0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_3D5EB0()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t sub_3D5EC0()
{
  return static AnyTransition.modifier<A>(active:identity:)();
}

uint64_t sub_3D5ED0()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t sub_3D5EE0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_3D5EF0()
{
  return GeometryProxy.frame(in:)();
}

uint64_t sub_3D5F00()
{
  return GeometryProxy.bounds(of:)();
}

uint64_t sub_3D5F10()
{
  return LayoutSubview.sizeThatFits(_:)();
}

uint64_t sub_3D5F20()
{
  return LayoutSubview.place(at:anchor:proposal:)();
}

uint64_t sub_3D5F30()
{
  return type metadata accessor for LayoutSubview();
}

uint64_t sub_3D5F40()
{
  return LayoutSubview.subscript.getter();
}

uint64_t sub_3D5F50()
{
  return static PreferenceKey._isReadableByHost.getter();
}

uint64_t sub_3D5F60()
{
  return static PreferenceKey._includesRemovedValues.getter();
}

uint64_t sub_3D5F70()
{
  return _StrokedShape.init(shape:style:)();
}

uint64_t sub_3D5F80()
{
  return type metadata accessor for _StrokedShape();
}

uint64_t sub_3D5F90()
{
  return type metadata accessor for _VariadicView.Tree();
}

uint64_t sub_3D5FA0()
{
  return _VariadicView.Tree.init(_:content:)();
}

uint64_t sub_3D5FB0()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_3D5FC0()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_3D5FE0()
{
  return type metadata accessor for LayoutSubviews();
}

uint64_t sub_3D5FF0()
{
  return LayoutSubviews.subscript.getter();
}

uint64_t sub_3D6000()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_3D6010()
{
  return TintShapeStyle.init()();
}

uint64_t sub_3D6020()
{
  return type metadata accessor for TintShapeStyle();
}

uint64_t sub_3D6030()
{
  return type metadata accessor for CoordinateSpace();
}

uint64_t sub_3D6040()
{
  return static LayoutDirection.== infix(_:_:)();
}

uint64_t sub_3D6050()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_3D6060()
{
  return ModifiedContent.init(content:modifier:)();
}

uint64_t sub_3D6070()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t sub_3D6080()
{
  return type metadata accessor for ScaleTransition();
}

uint64_t sub_3D6090()
{
  return ScaleTransition.init(_:anchor:)();
}

uint64_t sub_3D60A0()
{
  return type metadata accessor for StrokeShapeView();
}

uint64_t sub_3D60B0()
{
  return withTransaction<A>(_:_:)();
}

uint64_t sub_3D60C0()
{
  return RoundedRectangle.path(in:)();
}

uint64_t sub_3D60D0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_3D60E0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_3D60F0()
{
  return type metadata accessor for _OverlayModifier();
}

uint64_t sub_3D6100()
{
  return static ContentTransition.opacity.getter();
}

uint64_t sub_3D6110()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_3D6120()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_3D6130()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_3D6140()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_3D6150()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_3D6160()
{
  return EnvironmentValues.pixelLength.getter();
}

uint64_t sub_3D6170()
{
  return EnvironmentValues.displayScale.getter();
}

uint64_t sub_3D6180()
{
  return EnvironmentValues.displayScale.setter();
}

uint64_t sub_3D6190()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_3D61A0()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_3D61B0()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_3D61C0()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_3D61D0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_3D61E0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_3D61F0()
{
  return EnvironmentValues.textCase.getter();
}

uint64_t sub_3D6200()
{
  return EnvironmentValues.textCase.setter();
}

uint64_t sub_3D6210()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_3D6220()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_3D6230()
{
  return EnvironmentValues.init()();
}

uint64_t sub_3D6240()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_3D6250()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_3D6260()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_3D6270()
{
  return OpacityTransition.init()();
}

uint64_t sub_3D6280()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t sub_3D6290()
{
  return LocalizedStringKey.StringInterpolation.appendInterpolation(_:)();
}

void sub_3D62A0(Swift::String a1)
{
}

void sub_3D62B0(Swift::String a1)
{
}

uint64_t sub_3D62C0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_3D62D0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_3D62E0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_3D62F0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_3D6300()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_3D6310()
{
  return static SymbolRenderingMode.monochrome.getter();
}

uint64_t sub_3D6320()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_3D6330()
{
  return _BackgroundModifier.init(background:alignment:)();
}

uint64_t sub_3D6340()
{
  return type metadata accessor for _BackgroundModifier();
}

uint64_t sub_3D6350()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_3D6360()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_3D6370()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_3D6380()
{
  return type metadata accessor for NamedCoordinateSpace();
}

uint64_t sub_3D6390()
{
  return RectangleCornerRadii.init(topLeft:topRight:bottomRight:bottomLeft:)();
}

uint64_t sub_3D63A0()
{
  return type metadata accessor for _ContentShapeModifier();
}

uint64_t sub_3D63B0()
{
  return type metadata accessor for _ViewModifier_Content();
}

uint64_t sub_3D63C0()
{
  return static HierarchicalShapeStyle.tertiary.getter();
}

uint64_t sub_3D63D0()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_3D63E0()
{
  return type metadata accessor for UnevenRoundedRectangle();
}

uint64_t sub_3D63F0()
{
  return static CoordinateSpaceProtocol<>.named<A>(_:)();
}

uint64_t sub_3D6400()
{
  return ProgressViewStyleConfiguration.fractionCompleted.getter();
}

uint64_t sub_3D6410()
{
  return type metadata accessor for ProgressViewStyleConfiguration();
}

uint64_t sub_3D6420()
{
  return MatchedTransitionSourceConfiguration.clipShape(_:)();
}

uint64_t sub_3D6430()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_3D6440()
{
  return type metadata accessor for EmptyMatchedTransitionSourceConfiguration();
}

uint64_t sub_3D6450()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_3D6460()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_3D6470()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_3D6480()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_3D6490()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_3D64A0()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_3D64B0()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_3D64C0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_3D64D0()
{
  return Path.cgPath.getter();
}

uint64_t sub_3D64E0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_3D64F0()
{
  return static Text.+ infix(_:_:)();
}

uint64_t sub_3D6500()
{
  return type metadata accessor for Text.Case();
}

uint64_t sub_3D6510()
{
  return static Text.Suffix.alwaysVisible(_:)();
}

uint64_t sub_3D6530()
{
  return type metadata accessor for Text.Suffix();
}

uint64_t sub_3D6540()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_3D6550()
{
  return Text.init<A>(_:)();
}

uint64_t sub_3D6560()
{
  return Text.init(_:)();
}

uint64_t sub_3D6570()
{
  return View.actionDispatcher<A>(from:)();
}

uint64_t sub_3D6580()
{
  return View.appEntityIdentifier(_:)();
}

uint64_t sub_3D6590()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_3D65A0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_3D65B0()
{
  return View.progressViewStyle<A>(_:)();
}

uint64_t sub_3D65C0()
{
  return View.background<A>(_:alignment:)();
}

uint64_t sub_3D65D0()
{
  return View.textSuffix(_:)();
}

uint64_t sub_3D65E0()
{
  return View.accentColor(_:)();
}

uint64_t sub_3D65F0()
{
  return View.environment<A>(_:_:)();
}

uint64_t sub_3D6600()
{
  return View.layoutValue<A>(key:value:)();
}

uint64_t sub_3D6610()
{
  return View.contentShape<A>(_:eoFill:)();
}

uint64_t sub_3D6620()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_3D6630()
{
  return View.coordinateSpace(_:)();
}

uint64_t sub_3D6640()
{
  return View.onPreferenceChange<A>(_:perform:)();
}

uint64_t sub_3D6650()
{
  return View.matchedTransitionSource<A, B>(id:in:configuration:)();
}

uint64_t sub_3D6660()
{
  return View.matchedTransitionSource<A>(id:in:)();
}

uint64_t sub_3D6670()
{
  return View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_3D6680()
{
  return View.shadow(color:radius:x:y:)();
}

uint64_t sub_3D6690()
{
  return View.overlay<A>(alignment:content:)();
}

uint64_t sub_3D66A0()
{
  return View.overlay<A>(_:alignment:)();
}

uint64_t sub_3D66B0()
{
  return View.padding(_:)();
}

uint64_t sub_3D66C0()
{
  return View.padding(_:_:)();
}

uint64_t sub_3D66D0()
{
  return View.modifier<A>(_:)();
}

uint64_t sub_3D66E0()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_3D66F0()
{
  return View.clipShape<A>(_:style:)();
}

uint64_t sub_3D6700()
{
  return Color.init(uiColor:)();
}

uint64_t sub_3D6710()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_3D6720()
{
  return static Color.== infix(_:_:)();
}

uint64_t sub_3D6730()
{
  return static Color.black.getter();
}

uint64_t sub_3D6740()
{
  return static Color.clear.getter();
}

uint64_t sub_3D6750()
{
  return static Color.white.getter();
}

uint64_t sub_3D6760()
{
  return Color.opacity(_:)();
}

uint64_t sub_3D6770()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_3D6780()
{
  return Image.init(uiImage:)();
}

uint64_t sub_3D6790()
{
  return Image.init(systemName:)();
}

uint64_t sub_3D67A0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_3D67B0()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t sub_3D67C0()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_3D67D0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_3D67E0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_3D67F0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_3D6800()
{
  return State.wrappedValue.setter();
}

uint64_t sub_3D6810()
{
  return type metadata accessor for State();
}

uint64_t sub_3D6820()
{
  return static Layout._makeLayoutView(root:inputs:body:)();
}

uint64_t sub_3D6830()
{
  return Layout.updateCache(_:subviews:)();
}

uint64_t sub_3D6840()
{
  return static Layout.layoutProperties.getter();
}

uint64_t sub_3D6850()
{
  return Layout.spacing(subviews:cache:)();
}

uint64_t sub_3D6860()
{
  return Layout<>.makeCache(subviews:)();
}

uint64_t sub_3D6870()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_3D6880()
{
  return static Alignment.bottomLeading.getter();
}

uint64_t sub_3D6890()
{
  return static Alignment.== infix(_:_:)();
}

uint64_t sub_3D68A0()
{
  return static Alignment.top.getter();
}

uint64_t sub_3D68B0()
{
  return static Alignment.center.getter();
}

uint64_t sub_3D68C0()
{
  return static Alignment.leading.getter();
}

uint64_t sub_3D68D0()
{
  return static Animation.timingCurve(_:_:_:_:duration:)();
}

uint64_t sub_3D68E0()
{
  return Animation.repeatForever(autoreverses:)();
}

uint64_t sub_3D68F0()
{
  return static Animation.linear(duration:)();
}

uint64_t sub_3D6900()
{
  return static Animation.default.getter();
}

uint64_t sub_3D6910()
{
  return type metadata accessor for TupleView();
}

uint64_t sub_3D6920()
{
  return TupleView.init(_:)();
}

uint64_t sub_3D6930()
{
  return static UnitPoint.topLeading.getter();
}

uint64_t sub_3D6940()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_3D6950()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_3D6960()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_3D6970()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_3D6980()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_3D6990()
{
  return static DispatchQoS.default.getter();
}

uint64_t sub_3D69A0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_3D69B0()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t sub_3D69C0()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t sub_3D69D0()
{
  return CodeByKind.init(wrappedValue:)();
}

uint64_t sub_3D69E0()
{
  return type metadata accessor for CodeByKind();
}

uint64_t sub_3D69F0()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_3D6A00()
{
  return Dependency.init<A>(satisfying:with:)();
}

uint64_t sub_3D6A10()
{
  return type metadata accessor for Dependency();
}

uint64_t sub_3D6A20()
{
  return JSONObject.dictionary.getter();
}

uint64_t sub_3D6A30()
{
  return JSONObject.stringEnum<A>(or:)();
}

uint64_t sub_3D6A40()
{
  return JSONObject.stringEnum<A>()();
}

uint64_t sub_3D6A50()
{
  return JSONObject.init(deserializing:)();
}

uint64_t sub_3D6A60()
{
  return JSONObject.stringEnumOrNil<A>()();
}

uint64_t sub_3D6A70()
{
  return JSONObject.int.getter();
}

uint64_t sub_3D6A80()
{
  return JSONObject.url.getter();
}

uint64_t sub_3D6A90()
{
  return JSONObject.BOOL.getter();
}

uint64_t sub_3D6AA0()
{
  return JSONObject.init(from:)();
}

uint64_t sub_3D6AB0()
{
  return JSONObject.uint.getter();
}

uint64_t sub_3D6AC0()
{
  return JSONObject.array.getter();
}

uint64_t sub_3D6AD0()
{
  return JSONObject.float.getter();
}

uint64_t sub_3D6AE0()
{
  return JSONObject.int64.getter();
}

uint64_t sub_3D6AF0()
{
  return JSONObject.decode<A>(_:withUserInfo:)();
}

uint64_t sub_3D6B00()
{
  return JSONObject.double.getter();
}

uint64_t sub_3D6B10()
{
  return JSONObject.isNull.getter();
}

uint64_t sub_3D6B20()
{
  return JSONObject.string.getter();
}

uint64_t sub_3D6B30()
{
  return JSONObject.untyped.getter();
}

uint64_t sub_3D6B40()
{
  return JSONObject.init(wrapping:)();
}

uint64_t sub_3D6B50()
{
  return type metadata accessor for JSONObject();
}

uint64_t sub_3D6B60()
{
  return JSONObject.subscript.getter();
}

uint64_t sub_3D6B70()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_3D6B80()
{
  return LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)();
}

uint64_t sub_3D6B90()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_3D6BA0()
{
  return LogMessage.StringInterpolation.appendInterpolation(sensitive:)();
}

void sub_3D6BB0(Swift::String a1)
{
}

uint64_t sub_3D6BC0()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_3D6BD0()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_3D6BE0()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t sub_3D6BF0()
{
  return type metadata accessor for LogMessage();
}

uint64_t sub_3D6C00()
{
  return EmptyAction.init(actionMetrics:)();
}

uint64_t sub_3D6C10()
{
  return type metadata accessor for EmptyAction();
}

uint64_t sub_3D6C20()
{
  return IntentModel._canonicalIntentModel.getter();
}

uint64_t sub_3D6C30()
{
  return IntentModel._canonicalized.getter();
}

uint64_t sub_3D6C40()
{
  return IntentModel<>.kind.getter();
}

uint64_t sub_3D6C50()
{
  return JSONContext.addingValue<A>(_:forProperty:)();
}

uint64_t sub_3D6C60()
{
  return static JSONContext.initFailureObserver.getter();
}

uint64_t sub_3D6C70()
{
  return static JSONContext.Property<A>.actionTypes.getter();
}

uint64_t sub_3D6C80()
{
  return static JSONContext.Property<A>.intentTypes.getter();
}

uint64_t sub_3D6C90()
{
  return static JSONContext.Property<A>.actionKindTable.getter();
}

uint64_t sub_3D6CA0()
{
  return static JSONContext.Property<A>.initFailureObserver.getter();
}

uint64_t sub_3D6CB0()
{
  return JSONContext.Property.init(_:)();
}

uint64_t sub_3D6CC0()
{
  return JSONContext.init(userInfo:)();
}

uint64_t sub_3D6CD0()
{
  return JSONContext.init()();
}

uint64_t sub_3D6CE0()
{
  return type metadata accessor for JSONContext();
}

uint64_t sub_3D6CF0()
{
  return JSONContext.subscript.getter();
}

uint64_t sub_3D6D00()
{
  return JSONContext.subscript.getter();
}

uint64_t sub_3D6D10()
{
  return static MetricsData.clickData(targetID:targetType:actionType:actionContext:actionResult:actionURL:fields:configuration:)();
}

uint64_t sub_3D6D20()
{
  return static MetricsData.searchData(targetType:term:prefix:actionType:actionURL:fields:configuration:)();
}

uint64_t sub_3D6D30()
{
  return MetricsData.withIncludingFields(_:)();
}

uint64_t sub_3D6D40()
{
  return MetricsData.includingFields.modify();
}

uint64_t sub_3D6D50()
{
  return MetricsData.includingFields.getter();
}

uint64_t sub_3D6D60()
{
  return MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)();
}

uint64_t sub_3D6D70()
{
  return MetricsData.fields.modify();
}

uint64_t sub_3D6D80()
{
  return type metadata accessor for MetricsData();
}

uint64_t sub_3D6D90()
{
  return PageMetrics.pageFields.modify();
}

uint64_t sub_3D6DA0()
{
  return PageMetrics.pageFields.getter();
}

uint64_t sub_3D6DB0()
{
  return static PageMetrics.Instruction.impressions(fields:configuration:)();
}

uint64_t sub_3D6DC0()
{
  return static PageMetrics.Instruction.page(fields:configuration:)();
}

uint64_t sub_3D6DD0()
{
  return PageMetrics.Instruction.invocationPoints.getter();
}

uint64_t sub_3D6DE0()
{
  return PageMetrics.Instruction.data.getter();
}

uint64_t sub_3D6DF0()
{
  return type metadata accessor for PageMetrics.Instruction();
}

uint64_t sub_3D6E00()
{
  return PageMetrics.init(instructions:pageFields:custom:clickLocationFields:)();
}

uint64_t sub_3D6E10()
{
  return PageMetrics.instructions.getter();
}

uint64_t sub_3D6E20()
{
  return PageMetrics.init(deserializing:using:)();
}

uint64_t sub_3D6E30()
{
  return static PageMetrics.InvocationPoint.backButton.getter();
}

uint64_t sub_3D6E40()
{
  return static PageMetrics.InvocationPoint.appExit.getter();
}

uint64_t sub_3D6E50()
{
  return static PageMetrics.InvocationPoint.appEnter.getter();
}

uint64_t sub_3D6E60()
{
  return static PageMetrics.InvocationPoint.pageExit.getter();
}

uint64_t sub_3D6E70()
{
  return static PageMetrics.InvocationPoint.pageEnter.getter();
}

uint64_t sub_3D6E80()
{
  return type metadata accessor for PageMetrics.InvocationPoint();
}

uint64_t sub_3D6E90()
{
  return static PageMetrics.notInstrumented.getter();
}

uint64_t sub_3D6EA0()
{
  return type metadata accessor for PageMetrics();
}

uint64_t sub_3D6EB0()
{
  return type metadata accessor for JSONTimeUnit();
}

uint64_t sub_3D6EC0()
{
  return MediaArtwork.init()();
}

uint64_t sub_3D6ED0()
{
  return type metadata accessor for MediaArtwork();
}

uint64_t sub_3D6EE0()
{
  return static ActionMetrics.play(adamID:targetType:fields:configuration:)();
}

uint64_t sub_3D6EF0()
{
  return static ActionMetrics.dismiss(targetID:targetType:actionContext:actionURL:fields:configuration:)();
}

uint64_t sub_3D6F00()
{
  return static ActionMetrics.notInstrumented.getter();
}

uint64_t sub_3D6F10()
{
  return ActionMetrics.init(data:custom:)();
}

uint64_t sub_3D6F20()
{
  return ActionMetrics.data.modify();
}

uint64_t sub_3D6F30()
{
  return ActionMetrics.data.getter();
}

uint64_t sub_3D6F40()
{
  return type metadata accessor for ActionMetrics();
}

uint64_t sub_3D6F50()
{
  return static ActionOutcome.== infix(_:_:)();
}

uint64_t sub_3D6F60()
{
  return type metadata accessor for ActionOutcome();
}

uint64_t sub_3D6F70()
{
  return ClosureAction.init(actionMetrics:body:)();
}

uint64_t sub_3D6F80()
{
  return type metadata accessor for ClosureAction();
}

uint64_t sub_3D6F90()
{
  return dispatch thunk of TaskScheduler.schedule(task:)();
}

uint64_t sub_3D6FA0()
{
  return static AnyActionTypes.makeInstance(byDeserializing:using:)();
}

uint64_t sub_3D6FB0()
{
  return static AnyActionTypes.tryToMakeInstance(byDeserializing:using:)();
}

uint64_t sub_3D6FC0()
{
  return type metadata accessor for AnyActionTypes();
}

uint64_t sub_3D6FD0()
{
  return AnyActionTypes.init(_:)();
}

uint64_t sub_3D6FE0()
{
  return type metadata accessor for AnyIntentTypes();
}

uint64_t sub_3D6FF0()
{
  return AnyIntentTypes.init(_:)();
}

uint64_t _s8ShelfKit14ClickableModelPAA9JetEngine09ComponentD0RzrlE11clickActionAD0iD0_pSgvg_0()
{
  return dispatch thunk of ComponentModel.segue.getter();
}

uint64_t sub_3D7010()
{
  return ComponentModel.contextMenu.getter();
}

uint64_t sub_3D7020()
{
  return ComponentModel<>.id.getter();
}

uint64_t sub_3D7030()
{
  return ComponentTypes.init(_:)();
}

uint64_t sub_3D7040()
{
  return CompoundAction.init(actionMetrics:subactions:)();
}

uint64_t sub_3D7050()
{
  return type metadata accessor for CompoundAction();
}

uint64_t sub_3D7060()
{
  return JSONDictionary.bridgedPrimitiveValues<A, B>()();
}

uint64_t sub_3D7070()
{
  return type metadata accessor for JSONDictionary();
}

uint64_t sub_3D7080()
{
  return BaseObjectGraph.injectIfAvailable<A>(_:)();
}

uint64_t sub_3D7090()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t sub_3D70B0()
{
  return BaseObjectGraph.inject<A>(_:)();
}

uint64_t sub_3D70C0()
{
  return BaseObjectGraph.satisfying<A>(_:with:)();
}

uint64_t sub_3D70D0()
{
  return BaseObjectGraph.injectExplicitSymbol.getter();
}

uint64_t sub_3D70E0()
{
  return BaseObjectGraph.transformingMetricsFieldsContext(with:)();
}

uint64_t sub_3D70F0()
{
  return BaseObjectGraph.inject<A>(_:named:)();
}

uint64_t sub_3D7100()
{
  return dispatch thunk of BaseObjectGraph.subtracting(dependencyFor:)();
}

uint64_t sub_3D7110()
{
  return BaseObjectGraph.init(name:dependencies:)();
}

uint64_t sub_3D7120()
{
  return BaseObjectGraph.__allocating_init(name:_:)();
}

uint64_t sub_3D7130()
{
  return dispatch thunk of BaseObjectGraph.adding(dependency:)();
}

uint64_t sub_3D7140()
{
  return dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)();
}

uint64_t sub_3D7150()
{
  return static BaseObjectGraph.current.getter();
}

uint64_t sub_3D7160()
{
  return BaseObjectGraph.optional<A>(_:)();
}

uint64_t sub_3D7170()
{
  return type metadata accessor for BaseObjectGraph();
}

uint64_t _s8ShelfKit19ActionRunnerOptionsCfd_0()
{
  return BaseObjectGraph.deinit();
}

uint64_t sub_3D7190()
{
  return BaseObjectGraph.__allocating_init(_:)();
}

uint64_t sub_3D71A0()
{
  return JSONTypeCluster<>.makeInstance(byDeserializing:using:)();
}

uint64_t sub_3D71B0()
{
  return MetricsPipeline.init(builderType:aggregator:linter:recorder:bag:)();
}

uint64_t sub_3D71C0()
{
  return MetricsPipeline.process(_:using:)();
}

uint64_t sub_3D71D0()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t sub_3D71E0()
{
  return static PageRenderEvent.willPerformAction()();
}

uint64_t sub_3D71F0()
{
  return ActionDispatcher.dispatch(_:withMetrics:asPartOf:)();
}

uint64_t sub_3D7200()
{
  return dispatch thunk of IntentDispatcher.dispatch<A>(intent:jsonContext:)();
}

uint64_t sub_3D7220()
{
  return type metadata accessor for LazyValueWrapper();
}

uint64_t sub_3D7230()
{
  return static MetricsEventType.enter.getter();
}

uint64_t sub_3D7240()
{
  return type metadata accessor for MetricsEventType();
}

uint64_t sub_3D7250()
{
  return ScalarDictionary.init()();
}

uint64_t sub_3D7260()
{
  return type metadata accessor for ScalarDictionary();
}

uint64_t sub_3D7270()
{
  return dispatch thunk of ExpressibleByJSON.init(deserializing:using:)();
}

uint64_t sub_3D7280()
{
  return dispatch thunk of ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_3D7290()
{
  return ExpressibleByJSON.init(tryDeserializing:using:)();
}

uint64_t sub_3D72A0()
{
  return static ImpressionMetrics.shelf(id:idType:uniqueID:impressionType:name:)();
}

uint64_t sub_3D72B0()
{
  return static ImpressionMetrics.bubbleTip(id:uniqueID:name:)();
}

uint64_t sub_3D72C0()
{
  return static ImpressionMetrics.shelfItem(id:idType:uniqueID:impressionType:kind:name:)();
}

uint64_t sub_3D72D0()
{
  return ImpressionMetrics.ID.init(parent:element:index:)();
}

uint64_t sub_3D72E0()
{
  return ImpressionMetrics.ID.init(element:)();
}

uint64_t sub_3D72F0()
{
  return ImpressionMetrics.ID.element.getter();
}

uint64_t sub_3D7300()
{
  return type metadata accessor for ImpressionMetrics.ID();
}

uint64_t sub_3D7310()
{
  return ImpressionMetrics.init(id:fields:custom:commonFields:clickLocationFields:)();
}

uint64_t sub_3D7320()
{
  return ImpressionMetrics.id.getter();
}

uint64_t sub_3D7330()
{
  return ImpressionMetrics.fields.getter();
}

uint64_t sub_3D7340()
{
  return type metadata accessor for ImpressionMetrics();
}

uint64_t sub_3D7350()
{
  return SyncTaskScheduler.init()();
}

uint64_t sub_3D7360()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t sub_3D7370()
{
  return static AutomationSemantics.accountButton()();
}

uint64_t sub_3D7380()
{
  return static AutomationSemantics.tabBar(tabName:)();
}

uint64_t sub_3D7390()
{
  return AutomationSemantics.attribute(key:value:)();
}

uint64_t sub_3D73A0()
{
  return type metadata accessor for AutomationSemantics();
}

uint64_t sub_3D73B0()
{
  return type metadata accessor for DependencyDictionary();
}

uint64_t sub_3D73C0()
{
  return IntentImplementation.intentKind.getter();
}

uint64_t sub_3D73D0()
{
  return dispatch thunk of MetricsFieldsBuilder.allMetricsFields.getter();
}

uint64_t sub_3D73E0()
{
  return dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)();
}

uint64_t sub_3D73F0()
{
  return MetricsFieldsContext.addingValue<A>(_:forProperty:)();
}

uint64_t sub_3D7400()
{
  return MetricsFieldsContext.addChildClickLocation(_:)();
}

uint64_t sub_3D7410()
{
  return MetricsFieldsContext.addingValue<A>(_:forProperty:)();
}

uint64_t sub_3D7420()
{
  return static MetricsFieldsContext.Property<A>.pageContextTracker.getter();
}

uint64_t sub_3D7430()
{
  return static MetricsFieldsContext.Property<A>.searchFiltersTracker.getter();
}

uint64_t sub_3D7440()
{
  return static MetricsFieldsContext.Property<A>.pageFields.getter();
}

uint64_t sub_3D7450()
{
  return MetricsFieldsContext.Property.init(_:)();
}

uint64_t sub_3D7460()
{
  return MetricsFieldsContext.addValue<A>(_:forProperty:)();
}

uint64_t sub_3D7470()
{
  return MetricsFieldsContext.init()();
}

uint64_t sub_3D7480()
{
  return type metadata accessor for MetricsFieldsContext();
}

uint64_t sub_3D7490()
{
  return MetricsFieldsContext.subscript.getter();
}

uint64_t sub_3D74A0()
{
  return IntentDispatchOptions.withJSONContext(_:)();
}

uint64_t sub_3D74B0()
{
  return IntentDispatchOptions.__allocating_init()();
}

uint64_t sub_3D74C0()
{
  return type metadata accessor for IntentDispatchOptions();
}

uint64_t sub_3D74E0()
{
  return MetricsFieldsProvider.addMetricsFields(into:using:)();
}

uint64_t sub_3D74F0()
{
  return MetricsFieldsProvider.category.getter();
}

uint64_t sub_3D7500()
{
  return type metadata accessor for LintMetricsEventIntent();
}

uint64_t sub_3D7510()
{
  return dispatch thunk of JSONInitFailureObserver.tryingToInitialize(_:didFailWith:)();
}

uint64_t sub_3D7520()
{
  return MetricsFieldsAggregator.addingOptInProvider(_:forRequest:)();
}

uint64_t sub_3D7530()
{
  return MetricsFieldsAggregator.addingOptOutProvider(_:forRequest:)();
}

uint64_t sub_3D7540()
{
  return MetricsFieldsAggregator.init(bag:accountProvider:bundle:)();
}

uint64_t sub_3D7550()
{
  return type metadata accessor for MetricsFieldsAggregator();
}

JSValue sub_3D75B0(JSContext in)
{
  return CustomJSValueConvertible._jsValue(in:)(in);
}

JSValue sub_3D75C0(JSContext in)
{
  return CustomJSValueConvertible.makeValue(in:)(in);
}

uint64_t sub_3D75D0()
{
  return CustomJSValueConvertible<>.jsRepresentation(in:)();
}

uint64_t sub_3D75E0()
{
  return _defaultActionKindLookup.getter();
}

uint64_t sub_3D7600()
{
  return static MetricsFieldExclusionRequest.amsMetricsID.getter();
}

uint64_t sub_3D7610()
{
  return static MetricsFieldExclusionRequest.xpAccountsMatch.getter();
}

uint64_t sub_3D7620()
{
  return static MetricsFieldExclusionRequest.engagementThresholdMet.getter();
}

uint64_t sub_3D7630()
{
  return MetricsFieldExclusionRequest.init(rawValue:)();
}

uint64_t sub_3D7640()
{
  return type metadata accessor for MetricsFieldExclusionRequest();
}

uint64_t sub_3D7650()
{
  return static MetricsFieldInclusionRequest.searchFilters.getter();
}

uint64_t sub_3D7660()
{
  return static MetricsFieldInclusionRequest.clickLocation.getter();
}

uint64_t sub_3D7670()
{
  return static MetricsFieldInclusionRequest.crossfireReferral.getter();
}

uint64_t sub_3D7680()
{
  return static MetricsFieldInclusionRequest.impressionsSnapshot.getter();
}

uint64_t sub_3D7690()
{
  return type metadata accessor for MetricsFieldInclusionRequest();
}

uint64_t sub_3D76A0()
{
  return type metadata accessor for StandardMetricsFieldsBuilder();
}

uint64_t sub_3D76B0()
{
  return AMSMetricsIdentifierFieldsProvider.init(accountProvider:process:bag:shouldMigrate:resetInterval:keys:activeITunesAccountRequired:)();
}

uint64_t sub_3D76C0()
{
  return static AMSMetricsIdentifierFieldsProvider.metricsKeys.getter();
}

uint64_t sub_3D76D0()
{
  return type metadata accessor for AMSMetricsIdentifierFieldsProvider();
}

uint64_t sub_3D76E0()
{
  return Bag.amsBag.getter();
}

uint64_t sub_3D76F0()
{
  return Bag.subscript.getter();
}

uint64_t sub_3D7700()
{
  return Bag.subscript.getter();
}

uint64_t sub_3D7710()
{
  return Bag.subscript.getter();
}

uint64_t sub_3D7720()
{
  return Bag.subscript.getter();
}

uint64_t sub_3D7730()
{
  return Bag.Value.currentOrNil()();
}

uint64_t sub_3D7740()
{
  return Bag.Value.current(or:)();
}

uint64_t sub_3D7750()
{
  return Bag.subscript.getter();
}

uint64_t sub_3D7760()
{
  return Bag.subscript.getter();
}

uint64_t sub_3D7770()
{
  return type metadata accessor for Bag();
}

uint64_t sub_3D7780()
{
  return Lazy.init(wrappedValue:)();
}

uint64_t sub_3D7790()
{
  return Lazy.wrappedValue.getter();
}

uint64_t sub_3D77A0()
{
  return Lazy.wrappedValue.setter();
}

uint64_t sub_3D77B0()
{
  return Lazy<A>.init(deserializing:using:)();
}

uint64_t sub_3D77C0()
{
  return Lazy.init(_:)();
}

uint64_t sub_3D77D0()
{
  return Device.localizedModel.getter();
}

uint64_t sub_3D77E0()
{
  return static Device.current.getter();
}

uint64_t sub_3D77F0()
{
  return type metadata accessor for Device();
}

uint64_t sub_3D7810()
{
  return Logger.debug(_:)();
}

uint64_t sub_3D7820()
{
  return Logger.error(_:)();
}

uint64_t sub_3D7830()
{
  return Logger.warning(_:)();
}

uint64_t sub_3D7840()
{
  return static Models.AlertAction.ButtonRole.destructive.getter();
}

uint64_t sub_3D7850()
{
  return static Models.AlertAction.ButtonRole.cancel.getter();
}

uint64_t sub_3D7860()
{
  return Models.AlertAction.init(actionMetrics:severity:icon:title:message:buttons:)();
}

uint64_t sub_3D7870()
{
  return Models.AlertAction.Button.init(title:role:action:)();
}

uint64_t sub_3D7880()
{
  return type metadata accessor for Models.AlertAction.Button();
}

uint64_t sub_3D7890()
{
  return type metadata accessor for Models.AlertAction.Severity();
}

uint64_t sub_3D78A0()
{
  return type metadata accessor for Models.AlertAction();
}

uint64_t sub_3D78B0()
{
  return Models.FlowBackAction.init(actionMetrics:dismissal:)();
}

uint64_t sub_3D78C0()
{
  return static Models.FlowBackAction.Dismissal.sheetDismiss.getter();
}

uint64_t sub_3D78D0()
{
  return type metadata accessor for Models.FlowBackAction();
}

uint64_t sub_3D78E0()
{
  return type metadata accessor for Models.Menu();
}

uint64_t sub_3D78F0()
{
  return static PageID.searchFocus.getter();
}

uint64_t sub_3D7900()
{
  return static PageID.searchHints.getter();
}

uint64_t sub_3D7910()
{
  return static PageID.searchLanding.getter();
}

uint64_t sub_3D7920()
{
  return PageID.init(from:)();
}

uint64_t sub_3D7930()
{
  return static PageID.== infix(_:_:)();
}

uint64_t sub_3D7940()
{
  return PageID.init(with:)();
}

uint64_t sub_3D7950()
{
  return type metadata accessor for PageID();
}

uint64_t sub_3D7960()
{
  return inject<A>(_:from:)();
}

uint64_t sub_3D7970()
{
  return inject<A, B>(_:from:)();
}

uint64_t sub_3D7980()
{
  return Promise.optionalPublisher.getter();
}

uint64_t sub_3D7990()
{
  return Promise.init(on:_:)();
}

uint64_t sub_3D79A0()
{
  return Promise.then(getResult:on:)();
}

uint64_t sub_3D79B0()
{
  return Promise.publisher.getter();
}

uint64_t sub_3D79C0()
{
  return Promise.__allocating_init(on:executor:)();
}

uint64_t sub_3D79D0()
{
  return Promise.map<A>(on:_:)();
}

uint64_t sub_3D79E0()
{
  return Promise.join<A>(with:)();
}

uint64_t sub_3D79F0()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t sub_3D7A10()
{
  return Promise.__allocating_init(value:)();
}

uint64_t sub_3D7A20()
{
  return Promise.always(on:perform:)();
}

uint64_t sub_3D7A30()
{
  return Promise.reject(_:)();
}

uint64_t sub_3D7A40()
{
  return Promise.resolve(_:)();
}

uint64_t sub_3D7A50()
{
  return Promise<A>.init(_:)();
}

uint64_t sub_3D7A60()
{
  return Promise.__allocating_init()();
}

uint64_t sub_3D7A70()
{
  return static OSLogger.jsonDeserialization.getter();
}

uint64_t sub_3D7A80()
{
  return static OSLogger.bugs.getter();
}

uint64_t sub_3D7A90()
{
  return static OSLogger.actions.getter();
}

uint64_t sub_3D7AA0()
{
  return static OSLogger.Subsystem.podcasts.getter();
}

uint64_t sub_3D7AB0()
{
  return OSLogger.Subsystem.rawValue.getter();
}

uint64_t sub_3D7AC0()
{
  return type metadata accessor for OSLogger.Subsystem();
}

uint64_t sub_3D7AD0()
{
  return OSLogger.init(subsystem:category:)();
}

uint64_t sub_3D7AE0()
{
  return type metadata accessor for OSLogger();
}

uint64_t sub_3D7AF0()
{
  return JSONArray.compactMap<A>(_:)();
}

uint64_t sub_3D7B00()
{
  return JSONArray.bridgedPrimitiveValues<A>()();
}

uint64_t sub_3D7B10()
{
  return JSONArray.map<A>(_:)();
}

uint64_t sub_3D7B20()
{
  return JSONArray.forEach(_:)();
}

uint64_t sub_3D7B30()
{
  return type metadata accessor for JSONArray();
}

uint64_t sub_3D7B40()
{
  return type metadata accessor for JSONError();
}

uint64_t sub_3D7B50()
{
  return dispatch thunk of PageModel.pageMetrics.getter();
}

uint64_t sub_3D7B60()
{
  return dispatch thunk of ViewModel.impressionMetrics.getter();
}

uint64_t sub_3D7B70()
{
  return Dictionary.init()();
}

uint64_t _sSa8ShelfKitE18observerErrorValueSayxGvgZ_0()
{
  return Array.init()();
}

uint64_t sub_3D7B90()
{
  return BinaryFloatingPoint.formatted<A>(_:)();
}

NSDictionary sub_3D7BA0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_3D7BB0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D7BC0()
{
  return Dictionary.removeValue(forKey:)();
}

uint64_t sub_3D7BD0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_3D7BE0()
{
  return Dictionary<>.init(jsonContext:)();
}

uint64_t sub_3D7BF0()
{
  return Dictionary<>.subscript.getter();
}

void sub_3D7C00(Swift::Bool keepingCapacity)
{
}

uint64_t sub_3D7C10()
{
  return type metadata accessor for Dictionary();
}

uint64_t sub_3D7C20()
{
  return Dictionary.subscript.getter();
}

uint64_t sub_3D7C30()
{
  return Dictionary.subscript.setter();
}

uint64_t sub_3D7C40()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_3D7C50()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_3D7C60()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_3D7C70()
{
  return dispatch thunk of static Comparable.> infix(_:_:)();
}

uint64_t sub_3D7C80()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_3D7C90()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_3D7CA0()
{
  return String.LocalizationValue.StringInterpolation.appendInterpolation<A>(_:specifier:)();
}

void sub_3D7CB0(Swift::String a1)
{
}

void sub_3D7CC0(Swift::String a1)
{
}

uint64_t sub_3D7CD0()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_3D7CE0()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_3D7CF0()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_3D7D00()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_3D7D10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_3D7D20()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_3D7D30()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3D7D40()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3D7D50()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D7D60()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t sub_3D7D70()
{
  return String.init(data:encoding:)();
}

uint64_t sub_3D7D80()
{
  return String.init(format:_:)();
}

uint64_t sub_3D7D90()
{
  return static String.Encoding.utf8.getter();
}

uint64_t sub_3D7DA0()
{
  return type metadata accessor for String.Encoding();
}

uint64_t sub_3D7DB0()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_3D7DC0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_3D7DD0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_3D7DE0()
{
  return static String.eyebrowSeparatorSymbol.getter();
}

uint64_t sub_3D7DF0()
{
  return static String.Tips.CategoriesSaved.dismissed.getter();
}

uint64_t sub_3D7E00()
{
  return static String.Tips.CategoriesSaved.presented.getter();
}

uint64_t sub_3D7E10()
{
  return static String.Tips.NotFindingAnything.dismissed.getter();
}

uint64_t sub_3D7E20()
{
  return static String.Tips.AddFavoriteCategories.Search.dismissed.getter();
}

uint64_t sub_3D7E30()
{
  return static String.Tips.Popover.presentationDelay.getter();
}

uint64_t sub_3D7E40()
{
  return static String.Player.adamIDOfColdStartQueuedEpisode.getter();
}

uint64_t sub_3D7E50()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_3D7E60()
{
  return String.hash(into:)();
}

uint64_t sub_3D7E70()
{
  return String.count.getter();
}

uint64_t sub_3D7E80()
{
  return String.index(before:)();
}

void sub_3D7E90(Swift::String a1)
{
}

uint64_t sub_3D7EA0()
{
  return String.remove(at:)();
}

Swift::Int sub_3D7EB0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3D7EC0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_3D7ED0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_3D7EF0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_3D7F00()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_3D7F10(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

uint64_t sub_3D7F20(Swift::String repeating, Swift::Int count)
{
  return String.init(repeating:count:)(repeating, count)._countAndFlagsBits;
}

uint64_t sub_3D7F30()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t sub_3D7F40()
{
  return String.init<A>(_:)();
}

uint64_t sub_3D7F50()
{
  return String.subscript.getter();
}

uint64_t sub_3D7F60()
{
  return Sequence.formatted<A>(_:)();
}

uint64_t sub_3D7F70()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_3D7F80()
{
  return Sequence.uniqued<A>(by:)();
}

uint64_t sub_3D7F90()
{
  return Sequence.publisher.getter();
}

uint64_t sub_3D7FA0()
{
  return Sequence.compactMap<A>(_:)();
}

uint64_t sub_3D7FB0()
{
  return Sequence.reduce<A>(into:_:)();
}

uint64_t sub_3D7FC0()
{
  return Sequence<>.joined(separator:)();
}

uint64_t sub_3D7FD0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_3D7FE0()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_3D7FF0()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_3D8000()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_3D8010()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_3D8020()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D8030()
{
  return Array.description.getter();
}

uint64_t sub_3D8040()
{
  return specialized Array._endMutation()();
}

uint64_t sub_3D8050()
{
  return static Array._adoptStorage(_:count:)();
}

uint64_t sub_3D8060()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_3D8070()
{
  return Array<A>.group()();
}

uint64_t sub_3D8080()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t sub_3D8090()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_3D80A0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_3D80B0()
{
  return Array.count.getter();
}

uint64_t sub_3D80C0()
{
  return Array.append(_:)();
}

uint64_t sub_3D80D0()
{
  return Array<A>.init(deserializing:using:)();
}

uint64_t sub_3D80E0()
{
  return Array<A>.init(deserializing:using:)();
}

uint64_t sub_3D80F0()
{
  return Array<A>.init(tryDeserializing:using:)();
}

uint64_t sub_3D8100()
{
  return Array<A>.init(tryDeserializing:using:)();
}

uint64_t sub_3D8110()
{
  return type metadata accessor for Array();
}

uint64_t sub_3D8120()
{
  return Array.subscript.getter();
}

uint64_t sub_3D8130()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_3D8140()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_3D8150()
{
  return static MainActor.shared.getter();
}

uint64_t sub_3D8160()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_3D8170()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_3D8180()
{
  return static TaskPriority.utility.getter();
}

uint64_t sub_3D8190()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_3D81A0()
{
  return type metadata accessor for TaskPriority();
}

void sub_3D81C0()
{
}

uint64_t sub_3D81D0()
{
  return static Task<>.currentPriority.getter();
}

uint64_t sub_3D81E0()
{
  return static Task<>.checkCancellation()();
}

uint64_t sub_3D81F0()
{
  return static Double._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_3D8200()
{
  return Double.description.getter();
}

uint64_t sub_3D8210(Swift::String_optional prefix, Swift::Bool isExplicit, Swift::String_optional explicitSymbol, Swift::Bool isRTL, Swift::Bool abbreviated)
{
  return Double.durationString(prefix:isExplicit:explicitSymbol:isRTL:abbreviated:)(prefix, isExplicit, explicitSymbol, isRTL, abbreviated).value._countAndFlagsBits;
}

uint64_t sub_3D8220(Swift::String_optional prefix, Swift::Bool isRTL, Swift::Bool isExplicit, Swift::String_optional explicitSymbol)
{
  return Double.shortLowercaseResumeString(prefix:isRTL:isExplicit:explicitSymbol:)(prefix, isRTL, isExplicit, explicitSymbol).value._countAndFlagsBits;
}

uint64_t sub_3D8230()
{
  return Double.write<A>(to:)();
}

uint64_t sub_3D8250()
{
  return dispatch thunk of Decodable.init(from:)();
}

NSSet sub_3D8260()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_3D8270()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3D8280()
{
  return Set.description.getter();
}

uint64_t sub_3D8290()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_3D82A0()
{
  return static Set<>.default.getter();
}

uint64_t sub_3D82B0()
{
  return Set.Index._asCocoa.modify();
}

uint64_t sub_3D82C0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_3D82D0()
{
  return Set.hashValue.getter();
}

NSNumber sub_3D82E0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_3D82F0()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_3D8300()
{
  return Collection<>.contains<A>(_:)();
}

uint64_t sub_3D8310()
{
  return Collection.isNotEmpty.getter();
}

uint64_t sub_3D8320()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t sub_3D8330()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_3D8340()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_3D8350()
{
  return Collection.firstIndex(where:)();
}

uint64_t sub_3D8360()
{
  return Collection.isEmpty.getter();
}

uint64_t sub_3D8370()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_3D8380()
{
  return RangeReplaceableCollection<>.remove(atOffsets:)();
}

uint64_t sub_3D8390()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_3D83A0()
{
  return UIResponder.firstViewInResponderChain.getter();
}

uint64_t sub_3D83B0()
{
  return MPModelObject.adamID.getter();
}

BOOL sub_3D83C0(Swift::String atPath)
{
  return NSFileManager.directoryExists(atPath:)(atPath);
}

uint64_t sub_3D83D0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_3D83E0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_3D83F0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_3D8400()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_3D8410()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_3D8420()
{
  return NSUserDefaults.queryPublisher<A>(_:)();
}

uint64_t sub_3D8430()
{
  return NSUserDefaults.showListSortType.getter();
}

uint64_t sub_3D8440()
{
  return NSUserDefaults.timestampPublisher(forKey:)();
}

uint64_t sub_3D8450()
{
  return type metadata accessor for NSUserDefaults.Name();
}

uint64_t sub_3D8460()
{
  return static AMSDialogAction.ParameterKey<A>.clickLocation.getter();
}

uint64_t sub_3D8470()
{
  return static AMSDialogAction.ParameterKey<A>.action.getter();
}

uint64_t sub_3D8480()
{
  return AMSDialogAction.subscript.getter();
}

uint64_t sub_3D8490()
{
  return AMSDialogRequest.init<A>(from:style:)();
}

void sub_3D84A0()
{
}

uint64_t sub_3D84B0()
{
  return OS_dispatch_queue.asUnownedSerialExecutor()();
}

uint64_t sub_3D84C0()
{
  return static OS_dispatch_queue.uiAssetPreparationQueue.getter();
}

uint64_t sub_3D84D0()
{
  return static OS_dispatch_queue.automaticAssetManagement.getter();
}

uint64_t sub_3D84E0()
{
  return static OS_dispatch_queue.localAssetSupportWorkQueue.getter();
}

uint64_t sub_3D84F0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_3D8500()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t sub_3D8510()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.nanoseconds(_:)();
}

uint64_t sub_3D8520()
{
  return OS_dispatch_queue.SchedulerTimeType.Stride.init(floatLiteral:)();
}

uint64_t sub_3D8530()
{
  return static OS_dispatch_queue.SchedulerTimeType.Stride.milliseconds(_:)();
}

uint64_t sub_3D8540()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride();
}

uint64_t sub_3D8550()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_3D8560()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_3D8570()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t sub_3D8580()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_3D8590()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_3D85A0()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_3D85B0()
{
  return UITraitCollection.interfaceIdiomIsMac.getter();
}

uint64_t sub_3D85C0()
{
  return static UITraitCollection.interfaceIdiomIsMac.getter();
}

uint64_t sub_3D85D0()
{
  return _UITabSidebarItem._accessories.getter();
}

uint64_t sub_3D85E0()
{
  return _UITabSidebarItem._accessories.setter();
}

uint64_t sub_3D85F0()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t sub_3D8600()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_3D8610()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t sub_3D8620()
{
  return type metadata accessor for NSNotificationCenter.Publisher();
}

uint64_t sub_3D8630()
{
  return NSNotificationCenter.publisher(for:object:)();
}

uint64_t sub_3D8640()
{
  return MTPodcastEpisodeLimit.allowsAutomaticDownloads.getter();
}

uint64_t sub_3D8650()
{
  return NSManagedObjectContext.performAndWait<A>(_:)();
}

uint64_t sub_3D8660()
{
  return NSManagedObjectContext.unsafeCategory(forAdamID:)();
}

uint64_t sub_3D8670()
{
  return NSManagedObjectContext.unsafeShowUUID(for:)();
}

uint64_t sub_3D8680()
{
  return NSManagedObjectContext.performAndPublish<A>(queue:_:)();
}

uint64_t sub_3D8690()
{
  return NSManagedObjectContext.performAndPublish<A>(_:)();
}

uint64_t sub_3D86A0()
{
  return NSManagedObjectContext.fetchListAndPublish<A, B>(entityName:predicate:sortDescriptors:limit:receiveOn:transform:)();
}

uint64_t sub_3D86B0()
{
  return NSManagedObjectContext.episodes(for:sortDescriptors:limit:)();
}

uint64_t sub_3D86C0()
{
  return type metadata accessor for NSManagedObjectContext.ScheduledTaskType();
}

uint64_t sub_3D86D0()
{
  return NSManagedObjectContext.fetch<A>(_:)();
}

uint64_t sub_3D86F0()
{
  return MTEpisodeEntitlementState.init(_:)();
}

uint64_t sub_3D8700()
{
  return UIAccessibilityIdentification.setAutomationSemantics(_:)();
}

uint64_t sub_3D8720()
{
  return CGSize.description.getter();
}

UIMenu sub_3D8730(Swift::String title, Swift::String_optional subtitle, UIImage_optional image, UIMenuIdentifier_optional identifier, UIMenuOptions options, UIMenuElementSize preferredElementSize, Swift::OpaquePointer children)
{
  return UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(title, subtitle, image, identifier, options, preferredElementSize, children);
}

uint64_t sub_3D8740()
{
  return UIView.mt_viewController.getter();
}

uint64_t sub_3D8750()
{
  return UIView.interactionContext.getter();
}

uint64_t sub_3D8760()
{
  return UIView.setAutomationSemantics(_:)();
}

uint64_t sub_3D8770()
{
  return type metadata accessor for NSTimer.TimerPublisher();
}

uint64_t sub_3D8780()
{
  return static NSTimer.publish(every:tolerance:on:in:options:)();
}

uint64_t sub_3D8790()
{
  return UIColor.hsbaComponents.getter();
}

uint64_t sub_3D87A0()
{
  return UIColor.clampedBrightness(min:max:)();
}

uint64_t sub_3D87B0()
{
  return UIColor.fadedBackgroundColor.getter();
}

Swift::Int sub_3D87C0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_3D87D0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_3D87E0()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_3D87F0()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t sub_3D8800()
{
  return static MTPodcast.sortDescriptor(newestToOldest:)();
}

uint64_t sub_3D8810()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t sub_3D8820()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_3D8830()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_3D8840()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_3D8850()
{
  return static OS_os_log.jsSignpost.getter();
}

uint64_t sub_3D8860()
{
  return static OS_os_log.shelfSystem.getter();
}

uint64_t sub_3D8870()
{
  return static OS_os_log.stateLogger.getter();
}

uint64_t sub_3D8880()
{
  return static OS_os_log.homePageSignpost.getter();
}

uint64_t sub_3D8890()
{
  return static OS_os_log.podcastsSubsystem.getter();
}

uint64_t sub_3D88A0()
{
  return static OS_os_log.home.getter();
}

uint64_t sub_3D88B0()
{
  return static OS_os_log.search.getter();
}

uint64_t sub_3D88C0()
{
  return static OS_os_log.metrics.getter();
}

uint64_t sub_3D88D0()
{
  return static OS_os_log.purchases.getter();
}

uint64_t sub_3D88E0()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_3D88F0()
{
  return Optional<A>.containsVisibleText.getter();
}

uint64_t sub_3D8900()
{
  return Optional<A>.isEmpty.getter();
}

uint64_t sub_3D8910()
{
  return type metadata accessor for Optional();
}

uint64_t sub_3D8920()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_3D8930()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3D8940()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_3D8950()
{
  return StringProtocol.components(separatedBy:)();
}

uint64_t sub_3D8960()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_3D8970()
{
  return StringProtocol.uppercased(with:)();
}

uint64_t sub_3D8980()
{
  return StringProtocol.capitalized.getter();
}

uint64_t sub_3D8990()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_3D89A0()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_3D89B0()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_3D89C0()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t sub_3D89D0()
{
  return StringProtocol.removingPercentEncoding.getter();
}

uint64_t sub_3D89E0()
{
  return StringProtocol.hash.getter();
}

uint64_t sub_3D89F0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_3D8A00()
{
  return BinaryInteger.formatted()()._countAndFlagsBits;
}

uint64_t sub_3D8A10()
{
  return BinaryInteger.formatted<A>(_:)();
}

uint64_t sub_3D8A20()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_3D8A30()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_3D8A40()
{
  return static AnyKeyPath.== infix(_:_:)();
}

uint64_t sub_3D8A50()
{
  return type metadata accessor for AnyKeyPath();
}

uint64_t sub_3D8A70()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_3D8A80()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_3D8A90()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_3D8AA0()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_3D8AB0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_3D8AC0()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t sub_3D8AD0()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_3D8AE0()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_3D8AF0()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_3D8B00()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_3D8B10()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_3D8B20()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_3D8B30()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int sub_3D8B40(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_3D8B50()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_3D8B60()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_3D8B70()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_3D8B80()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_3D8B90()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_3D8BA0()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_3D8BB0()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

void sub_3D8BC0(Swift::Int a1)
{
}

uint64_t sub_3D8BD0()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_3D8BE0(Swift::Int a1)
{
}

uint64_t sub_3D8BF0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_3D8C00()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_3D8C10()
{
  return static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
}

uint64_t sub_3D8C20()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_3D8C30()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_3D8C40()
{
  return static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)();
}

uint64_t sub_3D8C50()
{
  return type metadata accessor for ManagedBuffer();
}

uint64_t sub_3D8C60()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3D8C70()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_3D8C80()
{
  return specialized ContiguousArray._endMutation()();
}

void sub_3D8C90(Swift::Int a1)
{
}

uint64_t sub_3D8CA0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_3D8CB0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_3D8CC0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_3D8CD0()
{
  return ContiguousArray.append(_:)();
}

uint64_t sub_3D8CE0()
{
  return ContiguousArray.init()();
}

uint64_t sub_3D8CF0()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t sub_3D8D00()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_3D8D10()
{
  return ContinuousClock.init()();
}

uint64_t sub_3D8D20()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_3D8D30()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_3D8D40()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_3D8D50()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_3D8D60()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_3D8D70()
{
  return _assertionFailure(_:_:flags:)();
}

uint64_t sub_3D8D80()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_3D8D90()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_3D8DA0()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_3D8DB0()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_3D8DC0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_3D8DD0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_3D8DE0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_3D8DF0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_3D8E00()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

Swift::Int sub_3D8E10(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_3D8E20()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_3D8E30()
{
  return KeyedDecodingContainer.superDecoder()();
}

uint64_t sub_3D8E40()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3D8E50()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3D8E60()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3D8E70()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_3D8E80()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_3D8E90()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3D8EA0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3D8EB0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3D8EC0()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_3D8ED0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_3D8EE0()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t sub_3D8EF0()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_3D8F00()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_3D8F10()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_3D8F20()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3D8F30()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3D8F40()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_3D8F50()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t sub_3D8F60()
{
  return type metadata accessor for KeyedEncodingContainer();
}

Swift::Int sub_3D8F80(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_3D8F90()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_3D8FA0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_3D8FB0()
{
  return DefaultStringInterpolation.appendInterpolation<A>(_:)();
}

uint64_t sub_3D8FC0()
{
  return dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
}

uint64_t sub_3D8FD0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_3D8FE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_3D8FF0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_3D9000()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_3D9010()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_3D9020()
{
  return _diagnoseUnavailableCodeReached()();
}

uint64_t sub_3D9030()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t sub_3D9040()
{
  return dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
}

uint64_t sub_3D9050()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_3D9060()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_3D9070()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_3D9080()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t sub_3D90C0()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_3D90D0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_3D90E0()
{
  return Error._code.getter();
}

uint64_t sub_3D90F0()
{
  return Error._domain.getter();
}

uint64_t sub_3D9100()
{
  return Error._userInfo.getter();
}

uint64_t sub_3D9110()
{
  return print(_:separator:terminator:)();
}

uint64_t sub_3D9120()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_3D9130()
{
  return Hasher.init(_seed:)();
}

void sub_3D9140(Swift::UInt a1)
{
}

void sub_3D9150(Swift::UInt8 a1)
{
}

void sub_3D9160(Swift::UInt32 a1)
{
}

void sub_3D9170(Swift::UInt64 a1)
{
}

Swift::Int sub_3D9180()
{
  return Hasher._finalize()();
}

NSNumber sub_3D9190()
{
  return UInt64._bridgeToObjectiveC()();
}

uint64_t sub_3D91A0()
{
  return dispatch thunk of Decoder.codingPath.getter();
}

uint64_t sub_3D91B0()
{
  return dispatch thunk of Decoder.userInfo.getter();
}

uint64_t sub_3D91C0()
{
  return Decoder.withUserInfo(_:)();
}

uint64_t sub_3D91D0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_3D91E0()
{
  return dispatch thunk of Encoder.userInfo.getter();
}

uint64_t sub_3D91F0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t sub_3D9200()
{
  return static Duration.TimeFormatStyle.Pattern.minuteSecond.getter();
}

uint64_t sub_3D9210()
{
  return type metadata accessor for Duration.TimeFormatStyle.Pattern();
}

uint64_t sub_3D9220()
{
  return type metadata accessor for Duration.TimeFormatStyle();
}

uint64_t sub_3D9230()
{
  return static Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy.hide.getter();
}

uint64_t sub_3D9240()
{
  return type metadata accessor for Duration.UnitsFormatStyle.ZeroValueUnitsDisplayStrategy();
}

uint64_t sub_3D9250()
{
  return static Duration.UnitsFormatStyle.FractionalPartDisplayStrategy.hide.getter();
}

uint64_t sub_3D9260()
{
  return type metadata accessor for Duration.UnitsFormatStyle.FractionalPartDisplayStrategy();
}

uint64_t sub_3D9270()
{
  return static Duration.UnitsFormatStyle.UnitWidth.narrow.getter();
}

uint64_t sub_3D9280()
{
  return type metadata accessor for Duration.UnitsFormatStyle.UnitWidth();
}

uint64_t sub_3D9290()
{
  return type metadata accessor for Duration.UnitsFormatStyle();
}

uint64_t sub_3D92A0()
{
  return Duration.formatted<A>(_:)();
}

uint64_t sub_3D92B0()
{
  return Duration.description.getter();
}

uint64_t sub_3D92C0()
{
  return static Duration.seconds(_:)();
}

uint64_t sub_3D92F0()
{
  return _typeName(_:qualified:)();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return _AXDurationStringForDurationWithSeconds();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MTEpisodePriceTypeFromPersistentString()
{
  return _MTEpisodePriceTypeFromPersistentString();
}

uint64_t MTPodcastHidesPlayedEpisodesResolved()
{
  return _MTPodcastHidesPlayedEpisodesResolved();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPersistentStringForMTEpisodePriceType()
{
  return _NSPersistentStringForMTEpisodePriceType();
}

uint64_t NSPersistentStringFromMTPlaybackAdjustmentInitiator()
{
  return _NSPersistentStringFromMTPlaybackAdjustmentInitiator();
}

uint64_t NSPersistentStringFromMTStopReason()
{
  return _NSPersistentStringFromMTStopReason();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return __CTServerConnectionCopyCellularUsagePolicy();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _MTLogCategoryArtworkDownload()
{
  return __MTLogCategoryArtworkDownload();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

htmlParserCtxtPtr htmlCreateMemoryParserCtxt(const char *buffer, int size)
{
  return _htmlCreateMemoryParserCtxt(buffer, size);
}

int htmlCtxtUseOptions(htmlParserCtxtPtr ctxt, int options)
{
  return _htmlCtxtUseOptions(ctxt, options);
}

void htmlFreeParserCtxt(htmlParserCtxtPtr ctxt)
{
}

int htmlParseDocument(htmlParserCtxtPtr ctxt)
{
  return _htmlParseDocument(ctxt);
}

uint64_t isMac()
{
  return _isMac();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t os_feature_enabled_prototype_up_next()
{
  return _os_feature_enabled_prototype_up_next();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return _swift_getOpaqueTypeMetadata2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTupleTypeMetadata()
{
  return _swift_getTupleTypeMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return _swift_isUniquelyReferenced_native();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

xmlErrorPtr xmlCtxtGetLastError(void *ctx)
{
  return _xmlCtxtGetLastError(ctx);
}

void xmlFreeDoc(xmlDocPtr cur)
{
}

void xmlInitParser(void)
{
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
}

int xmlStrEqual(const xmlChar *str1, const xmlChar *str2)
{
  return _xmlStrEqual(str1, str2);
}

int xmlStrlen(const xmlChar *str)
{
  return _xmlStrlen(str);
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return _[a1 OSLogObject];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLSession(void *a1, const char *a2, ...)
{
  return _[a1 URLSession];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return _[a1 _commonInit];
}

id objc_msgSend__loadReason(void *a1, const char *a2, ...)
{
  return _[a1 _loadReason];
}

id objc_msgSend__markAsHasRequestedImages(void *a1, const char *a2, ...)
{
  return _[a1 _markAsHasRequestedImages];
}

id objc_msgSend__parserContext(void *a1, const char *a2, ...)
{
  return _[a1 _parserContext];
}

id objc_msgSend__setLoadReason_(void *a1, const char *a2, ...)
{
  return [_a1 _setLoadReason:];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return _[a1 accessQueue];
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 accountPropertyForKey:];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeAccount];
}

id objc_msgSend_activeAccountFromDefaultStore(void *a1, const char *a2, ...)
{
  return _[a1 activeAccountFromDefaultStore];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return [a1 addOperation:];
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 addOperationWithBlock:];
}

id objc_msgSend_addResource_forCacheKey_(void *a1, const char *a2, ...)
{
  return [a1 addResource:forCacheKey:];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_airplaneModeInquiryDidObserveChange_(void *a1, const char *a2, ...)
{
  return [a1 airplaneModeInquiryDidObserveChange];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return [a1 ams_DSID];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return [a1 ams_activeiTunesAccount];
}

id objc_msgSend_ams_cookiesForURL_(void *a1, const char *a2, ...)
{
  return [a1 ams_cookiesForURL:];
}

id objc_msgSend_ams_localiTunesAccount(void *a1, const char *a2, ...)
{
  return [a1 ams_localiTunesAccount];
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return [a1 ams_sharedAccountStore];
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return [a1 ams_storefront];
}

id objc_msgSend_appBootstrapHandler(void *a1, const char *a2, ...)
{
  return _[a1 appBootstrapHandler];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_ask_generalLogConfig(void *a1, const char *a2, ...)
{
  return [a1 ask_generalLogConfig];
}

id objc_msgSend_ask_processStartTime(void *a1, const char *a2, ...)
{
  return [a1 ask_processStartTime];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithIdentifier:];
}

id objc_msgSend_cacheKey(void *a1, const char *a2, ...)
{
  return _[a1 cacheKey];
}

id objc_msgSend_cacheOptions(void *a1, const char *a2, ...)
{
  return _[a1 cacheOptions];
}

id objc_msgSend_cachedResources(void *a1, const char *a2, ...)
{
  return _[a1 cachedResources];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllRequests(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllRequests];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:nil selector:nil object:nil];
}

id objc_msgSend_characterDirectionForLanguage_(void *a1, const char *a2, ...)
{
  return [a1 characterDirectionForLanguage:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_configureProfilePictureStoreAndNotifyIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 configureProfilePictureStoreAndNotifyIfNeeded];
}

id objc_msgSend_connectionTypeHeader(void *a1, const char *a2, ...)
{
  return _[a1 connectionTypeHeader];
}

id objc_msgSend_contactWithDisplayName_emailOrPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 contactWithDisplayName:emailOrPhoneNumber:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_currentQualityOfService(void *a1, const char *a2, ...)
{
  return _[a1 currentQualityOfService];
}

id objc_msgSend_dataConsumer(void *a1, const char *a2, ...)
{
  return _[a1 dataConsumer];
}

id objc_msgSend_dataConsumerQueue(void *a1, const char *a2, ...)
{
  return _[a1 dataConsumerQueue];
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:completionHandler:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return _[a1 defaultSettings];
}

id objc_msgSend_delayCount(void *a1, const char *a2, ...)
{
  return _[a1 delayCount];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_didCompleteWithResource_error_(void *a1, const char *a2, ...)
{
  return [a1 didCompleteWithResource:error:];
}

id objc_msgSend_didFinishTaskWithData_response_error_(void *a1, const char *a2, ...)
{
  return [a1 didFinishTaskWithData:response:error:];
}

id objc_msgSend_didLoadResource_error_(void *a1, const char *a2, ...)
{
  return [a1 didLoadResource:error:];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_finishLoadForRequest_withResource_error_(void *a1, const char *a2, ...)
{
  return [a1 finishLoadForRequest:withResource:error:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatForKey_fromURL_(void *a1, const char *a2, ...)
{
  return [a1 floatForKey:fromURL:];
}

id objc_msgSend_formattedValue(void *a1, const char *a2, ...)
{
  return _[a1 formattedValue];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _[a1 handler];
}

id objc_msgSend_handlerTokens(void *a1, const char *a2, ...)
{
  return _[a1 handlerTokens];
}

id objc_msgSend_hasManagedStateChangedFromAccount_toAccount_(void *a1, const char *a2, ...)
{
  return [a1 hasManagedStateChangedFromAccount:toAccount:];
}

id objc_msgSend_hasPendingNotification(void *a1, const char *a2, ...)
{
  return _[a1 hasPendingNotification];
}

id objc_msgSend_hasRequestedImages(void *a1, const char *a2, ...)
{
  return _[a1 hasRequestedImages];
}

id objc_msgSend_hasStorefrontChangedFromAccount_toAccount_(void *a1, const char *a2, ...)
{
  return [a1 hasStorefrontChangedFromAccount:toAccount:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heightFromURL_(void *a1, const char *a2, ...)
{
  return [a1 heightFromURL:];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:compatibleWithTraitCollection:];
}

id objc_msgSend_imageRequest_didFailWithError_(void *a1, const char *a2, ...)
{
  return [a1 imageRequest:didFailWithError:];
}

id objc_msgSend_imageRequest_didLoadImage_(void *a1, const char *a2, ...)
{
  return [a1 imageRequest:didLoadImage:];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return [a1 imageWithActions:];
}

id objc_msgSend_initWithAppleAccount_store_(void *a1, const char *a2, ...)
{
  return [a1 initWithAppleAccount:store:];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlock:];
}

id objc_msgSend_initWithBundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundle:];
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:encoding:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithHandler:];
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyOptions:valueOptions:capacity:];
}

id objc_msgSend_initWithMonogramResourceURL_size_(void *a1, const char *a2, ...)
{
  return [a1 initWithMonogramResourceURL:size:];
}

id objc_msgSend_initWithResourceName_searchBundles_(void *a1, const char *a2, ...)
{
  return [a1 initWithResourceName:searchBundles:];
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return [a1 initWithSettings:];
}

id objc_msgSend_initWithSize_format_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:format:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_initWithURLRequest_URLSession_dataConsumer_dataConsumerQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithURLRequest:URLSession:dataConsumer:dataConsumerQueue:];
}

id objc_msgSend_initWithURLRequest_dataConsumer_(void *a1, const char *a2, ...)
{
  return [a1 initWithURLRequest:dataConsumer:];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initalsFromURL_(void *a1, const char *a2, ...)
{
  return [a1 initalsFromURL:];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledForDevice(void *a1, const char *a2, ...)
{
  return _[a1 isEnabledForDevice];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _[a1 isIdle];
}

id objc_msgSend_isInBackground(void *a1, const char *a2, ...)
{
  return _[a1 isInBackground];
}

id objc_msgSend_isMonogramRequest(void *a1, const char *a2, ...)
{
  return _[a1 isMonogramRequest];
}

id objc_msgSend_isRTL(void *a1, const char *a2, ...)
{
  return _[a1 isRTL];
}

id objc_msgSend_isRendering(void *a1, const char *a2, ...)
{
  return _[a1 isRendering];
}

id objc_msgSend_isResourceRequest(void *a1, const char *a2, ...)
{
  return _[a1 isResourceRequest];
}

id objc_msgSend_isRunningOnInternalOS(void *a1, const char *a2, ...)
{
  return _[a1 isRunningOnInternalOS];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSupported];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return _[a1 localAccount];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_makeLoadOperation(void *a1, const char *a2, ...)
{
  return _[a1 makeLoadOperation];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:];
}

id objc_msgSend_makeUniqueKey(void *a1, const char *a2, ...)
{
  return _[a1 makeUniqueKey];
}

id objc_msgSend_monogram(void *a1, const char *a2, ...)
{
  return _[a1 monogram];
}

id objc_msgSend_monogramConfig(void *a1, const char *a2, ...)
{
  return _[a1 monogramConfig];
}

id objc_msgSend_monogramWithURL_(void *a1, const char *a2, ...)
{
  return [a1 monogramWithURL:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameFromURL_(void *a1, const char *a2, ...)
{
  return [a1 nameFromURL:];
}

id objc_msgSend_notificationQueue(void *a1, const char *a2, ...)
{
  return _[a1 notificationQueue];
}

id objc_msgSend_notify(void *a1, const char *a2, ...)
{
  return _[a1 notify];
}

id objc_msgSend_notifyIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 notifyIfNeeded];
}

id objc_msgSend_notifyQueue(void *a1, const char *a2, ...)
{
  return _[a1 notifyQueue];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatter];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return [a1 numberFromString:];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForData_error_(void *a1, const char *a2, ...)
{
  return [a1 objectForData:error:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_outputBlock(void *a1, const char *a2, ...)
{
  return _[a1 outputBlock];
}

id objc_msgSend_parser_didEndElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:didEndElement:");
}

id objc_msgSend_parser_didEndListOfStyle_(void *a1, const char *a2, ...)
{
  return [a1 parser:didEndListOfStyle:];
}

id objc_msgSend_parser_didFindCharacters_(void *a1, const char *a2, ...)
{
  return [a1 parser:didFindCharacters:];
}

id objc_msgSend_parser_didStartElement_attributes_(void *a1, const char *a2, ...)
{
  return [a1 parser:didStartElement:attributes:];
}

id objc_msgSend_parser_didStartListOfStyle_(void *a1, const char *a2, ...)
{
  return [a1 parser:didStartListOfStyle:];
}

id objc_msgSend_parser_parseErrorOccurred_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:parseErrorOccurred:");
}

id objc_msgSend_parserDidEndDocument_(void *a1, const char *a2, ...)
{
  return [a1 parserDidEndDocument:];
}

id objc_msgSend_parserDidEndListElement_(void *a1, const char *a2, ...)
{
  return [a1 parserDidEndListElement:];
}

id objc_msgSend_parserDidFindNewline_(void *a1, const char *a2, ...)
{
  return [a1 parserDidFindNewline:];
}

id objc_msgSend_parserDidStartDocument_(void *a1, const char *a2, ...)
{
  return [a1 parserDidStartDocument:];
}

id objc_msgSend_parserDidStartListElement_(void *a1, const char *a2, ...)
{
  return [a1 parserDidStartListElement:];
}

id objc_msgSend_pendingOperations(void *a1, const char *a2, ...)
{
  return _[a1 pendingOperations];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_performSelector_withObject_afterDelay_inModes_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:inModes:];
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return [a1 performSelectorOnMainThread:];
}

id objc_msgSend_postDidBeginLoadingIfIdle(void *a1, const char *a2, ...)
{
  return _[a1 postDidBeginLoadingIfIdle];
}

id objc_msgSend_postDidIdleIfIdle(void *a1, const char *a2, ...)
{
  return _[a1 postDidIdleIfIdle];
}

id objc_msgSend_postDidLoadAllForReason_(void *a1, const char *a2, ...)
{
  return [a1 postDidLoadAllForReason:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_preferencesURL(void *a1, const char *a2, ...)
{
  return _[a1 preferencesURL];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_primaryAccountName(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountName];
}

id objc_msgSend_profilePictureForAccountOwnerWithoutMonogramFallback(void *a1, const char *a2, ...)
{
  return _[a1 profilePictureForAccountOwnerWithoutMonogramFallback];
}

id objc_msgSend_profilePictureStore(void *a1, const char *a2, ...)
{
  return _[a1 profilePictureStore];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_queuePriority(void *a1, const char *a2, ...)
{
  return _[a1 queuePriority];
}

id objc_msgSend_radiosPreferences(void *a1, const char *a2, ...)
{
  return _[a1 radiosPreferences];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_renderMonogramForString_scope_imageHandler_(void *a1, const char *a2, ...)
{
  return [a1 renderMonogramForString:scope:imageHandler:];
}

id objc_msgSend_reportErrorWithCode_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 reportErrorWithCode:userInfo:];
}

id objc_msgSend_reportParseError_(void *a1, const char *a2, ...)
{
  return [a1 reportParseError:];
}

id objc_msgSend_reprioritizeOperations(void *a1, const char *a2, ...)
{
  return _[a1 reprioritizeOperations];
}

id objc_msgSend_requestKey(void *a1, const char *a2, ...)
{
  return _[a1 requestKey];
}

id objc_msgSend_requestKeyForCacheKey_(void *a1, const char *a2, ...)
{
  return [a1 requestKeyForCacheKey:];
}

id objc_msgSend_requestQueue(void *a1, const char *a2, ...)
{
  return _[a1 requestQueue];
}

id objc_msgSend_requestsByCacheKey(void *a1, const char *a2, ...)
{
  return _[a1 requestsByCacheKey];
}

id objc_msgSend_resource(void *a1, const char *a2, ...)
{
  return _[a1 resource];
}

id objc_msgSend_resourceName(void *a1, const char *a2, ...)
{
  return _[a1 resourceName];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retainAspectRatio(void *a1, const char *a2, ...)
{
  return _[a1 retainAspectRatio];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_scopeWithPointSize_scale_rightToLeft_style_(void *a1, const char *a2, ...)
{
  return [a1 scopeWithPointSize:scale:rightToLeft:style:];
}

id objc_msgSend_searchBundles(void *a1, const char *a2, ...)
{
  return _[a1 searchBundles];
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:];
}

id objc_msgSend_setAccountStore_(void *a1, const char *a2, ...)
{
  return [a1 setAccountStore:];
}

id objc_msgSend_setActiveAccount_(void *a1, const char *a2, ...)
{
  return [a1 setActiveAccount];
}

id objc_msgSend_setAppBootstrapHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAppBootstrapHandler:];
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:];
}

id objc_msgSend_setCountLimit_(void *a1, const char *a2, ...)
{
  return [a1 setCountLimit:];
}

id objc_msgSend_setDelayCount_(void *a1, const char *a2, ...)
{
  return [a1 setDelayCount:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPAdditionalHeaders:];
}

id objc_msgSend_setHasPendingNotification_(void *a1, const char *a2, ...)
{
  return [a1 setHasPendingNotification:];
}

id objc_msgSend_setHasRequestedImages_(void *a1, const char *a2, ...)
{
  return [a1 setHasRequestedImages:];
}

id objc_msgSend_setIsRendering_(void *a1, const char *a2, ...)
{
  return [a1 setIsRendering:];
}

id objc_msgSend_setLocalAccount_(void *a1, const char *a2, ...)
{
  return [a1 setLocalAccount:];
}

id objc_msgSend_setMonogramConfig_(void *a1, const char *a2, ...)
{
  return [a1 setMonogramConfig:];
}

id objc_msgSend_setMonogramType_(void *a1, const char *a2, ...)
{
  return [a1 setMonogramType:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOutputBlock_(void *a1, const char *a2, ...)
{
  return [a1 setOutputBlock:];
}

id objc_msgSend_setPictureDiameter_(void *a1, const char *a2, ...)
{
  return [a1 setPictureDiameter:];
}

id objc_msgSend_setPrimaryAccountName_(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryAccountName:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProfilePictureStore_(void *a1, const char *a2, ...)
{
  return [a1 setProfilePictureStore:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQueuePriority_(void *a1, const char *a2, ...)
{
  return [a1 setQueuePriority:];
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return [a1 setScale:];
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return [a1 setSize:];
}

id objc_msgSend_setStoreAccountName_(void *a1, const char *a2, ...)
{
  return [a1 setStoreAccountName:];
}

id objc_msgSend_setSubsystem_(void *a1, const char *a2, ...)
{
  return [a1 setSubsystem:];
}

id objc_msgSend_setTotalDataAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setTotalDataAvailable:];
}

id objc_msgSend_setTotalDataCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setTotalDataCapacity:];
}

id objc_msgSend_setTotalDiskCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setTotalDiskCapacity:];
}

id objc_msgSend_setTotalSystemAvailable_(void *a1, const char *a2, ...)
{
  return [a1 setTotalSystemAvailable:];
}

id objc_msgSend_setTotalSystemCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setTotalSystemCapacity:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_set_parserContext_(void *a1, const char *a2, ...)
{
  return [a1 set_parserContext:];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return _[a1 sharedConfig];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_storeAccountName(void *a1, const char *a2, ...)
{
  return _[a1 storeAccountName];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return [a1 stringFromContact:style:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _[a1 task];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_updateLoadReason_forOperation_(void *a1, const char *a2, ...)
{
  return [a1 updateLoadReason:forOperation:];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _[a1 urlRequest];
}

id objc_msgSend_userAgentForProcessInfo_(void *a1, const char *a2, ...)
{
  return [a1 userAgentForProcessInfo:];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_fromURL_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:fromURL:];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_widthFromURL_(void *a1, const char *a2, ...)
{
  return [a1 widthFromURL:];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}